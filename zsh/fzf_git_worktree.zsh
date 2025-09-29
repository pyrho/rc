#!/usr/bin/env zsh

# Configuration - set your repository path here
export GIT_WORKTREE_REPO="${GIT_WORKTREE_REPO:-$HOME/your-repo}"

# Function to jump to a worktree (enhanced with new features)
wt() {
  local worktree
  worktree=$(git -C "$GIT_WORKTREE_REPO" worktree list | \
    fzf --height 50% \
        --layout reverse \
        --border \
        --header '📁 Select Worktree to Jump' \
        --ghost 'Start typing to filter worktrees...' \
        --footer 'Tips: Use wtd to delete, wtc to create new' \
        --preview 'echo "Branch: {3}" && echo "---" && git -C {1} status --short 2>/dev/null' \
        --preview-window right:50%:wrap | \
    awk '{print $1}')
  
  if [[ -n "$worktree" ]]; then
    cd "$worktree"
    echo "Switched to: $worktree"
  fi
}

# Function to delete a worktree
wtd() {
  local worktree worktree_path worktree_name
  worktree=$(git -C "$GIT_WORKTREE_REPO" worktree list | \
    fzf --height 40% \
        --layout reverse \
        --border \
        --header '🗑️  Select Worktree to Delete' \
        --ghost 'Type to filter worktrees for deletion...' \
        --preview 'echo "Path: {1}"; echo "Branch: {3}"' \
        --preview-window right:50%:wrap)
  
  if [[ -n "$worktree" ]]; then
    worktree_path=$(echo "$worktree" | awk '{print $1}')
    worktree_name=$(basename "$worktree_path")
    
    # Confirm deletion
    echo -n "Delete worktree '$worktree_name' at $worktree_path? [y/N]: "
    read -r confirm
    
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      git -C "$GIT_WORKTREE_REPO" worktree remove "$worktree_path"
      echo "✅ Deleted worktree: $worktree_name"
    else
      echo "❌ Cancelled"
    fi
  fi
}

# Function to create a worktree (wrapper around your existing create_wt)
wtc() {
  local branch_name="$1"
  
  if [[ -z "$branch_name" ]]; then
    echo -n "Enter branch name: "
    read -r branch_name
  fi
  
  if [[ -n "$branch_name" ]]; then
    # Call your existing create_wt function
    create_frqs_worktree "$branch_name"
  else
    echo "❌ Branch name required"
  fi
}

# Alternative: Create worktree from existing branches
wtcb() {
  local branch
  branch=$(git -C "$GIT_WORKTREE_REPO" branch -a | \
    sed 's/^[* ]*//' | \
    grep -v '^HEAD' | \
    sed 's|^remotes/origin/||' | \
    sort -u | \
    fzf --height 40% \
        --layout reverse \
        --border \
        --header '🌿 Select Branch for New Worktree' \
        --ghost 'Type to filter branches...' \
        --preview "git -C '$GIT_WORKTREE_REPO' log --oneline --graph --decorate -10 {}")
  
  if [[ -n "$branch" ]]; then
    create_wt "$branch"
  fi
}

# List all worktrees with details (view-only)
wtl() {
  git -C "$GIT_WORKTREE_REPO" worktree list | \
    column -t -s ' ' | \
    fzf --height 50% \
        --layout reverse \
        --border \
        --header '📋 Worktrees (ESC to exit)' \
        --ghost 'Browse your worktrees...' \
        --footer "Total: $(git -C "$GIT_WORKTREE_REPO" worktree list | wc -l) worktrees" \
        --preview 'git -C {1} status --short 2>/dev/null && echo "---" && git -C {1} log -1 --oneline 2>/dev/null' \
        --preview-window bottom:5:wrap \
        --bind 'enter:abort'
}

# Advanced: Switch worktree with preview showing recent commits
wta() {
  local worktree
  worktree=$(git -C "$GIT_WORKTREE_REPO" worktree list | \
    fzf --height 60% \
        --layout reverse \
        --border \
        --header '📁 Select Worktree (with commit preview)' \
        --ghost 'Type to filter worktrees...' \
        --preview 'git -C {1} log --oneline --graph --decorate -10 2>/dev/null || echo "No commits yet"' \
        --preview-window right:60%:wrap | \
    awk '{print $1}')
  
  if [[ -n "$worktree" ]]; then
    cd "$worktree"
    echo "Switched to: $worktree"
    git status --short
  fi
}

# Ultra-advanced: Use new fzf 0.63+ features with async transforms
wtu() {
  local worktree
  worktree=$(git -C "$GIT_WORKTREE_REPO" worktree list | \
    fzf --height 70% \
        --layout reverse \
        --border \
        --style full \
        --header '📁 Select Worktree' \
        --ghost 'Start typing to filter worktrees...' \
        --footer '' \
        --preview 'git -C {1} log --oneline --graph --decorate -10 2>/dev/null || echo "No commits yet"' \
        --preview-window right:60%:wrap \
        --bind 'focus:bg-transform-footer:echo "Branch: $(git -C {1} branch --show-current 2>/dev/null) | $(git -C {1} status --short | wc -l) changes | Last commit: $(git -C {1} log -1 --format=%cr 2>/dev/null || echo none)"' \
        --bind 'ctrl-x:execute-silent(git -C {1} status)+reload(git -C $GIT_WORKTREE_REPO worktree list)' \
        --bind 'ctrl-r:reload(git -C $GIT_WORKTREE_REPO worktree list)' \
        --bind 'ctrl-p:change-preview-window(hidden|)' | \
    awk '{print $1}')
  
  if [[ -n "$worktree" ]]; then
    cd "$worktree"
    echo "Switched to: $worktree"
    git status --short
  fi
}

# Optional: Add aliases for shorter commands
alias wj='wt'    # worktree jump
alias wd='wtd'   # worktree delete
alias wn='wtc'   # worktree new
alias wb='wtcb'  # worktree from branch
alias wl='wtl'   # worktree list
#
# # Print available commands on sourcing
# echo "Git Worktree FZF Commands loaded:"
# echo "  wt/wj  - Jump to worktree (with inline actions)"
# echo "  wtd/wd - Delete worktree"
# echo "  wtc/wn - Create worktree (uses create_wt)"
# echo "  wtcb/wb - Create worktree from existing branch"
# echo "  wtl/wl - List all worktrees"
# echo "  wta    - Advanced jump with commit preview"
# echo "  wtu    - Ultra mode with async footer & shortcuts"
# echo ""
# echo "Repository: $GIT_WORKTREE_REPO"
# echo ""
# echo "Shortcuts in wtu:"
# echo "  Ctrl-X: Refresh status"
# echo "  Ctrl-R: Reload list"
# echo "  Ctrl-P: Toggle preview"

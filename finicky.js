module.exports = {
  defaultBrowser: "Firefox",
  options: {
    // Hide the finicky icon from the top bar. Default: false
    hideIcon: false,
    // Check for update on startup. Default: true
    checkForUpdate: true,
    // Log every request with basic information to console. Default: false
    logRequests: false,
  },
  handlers: [
    {
      match: "http://localhost:3000/*",
      browser: {
        name: "Google Chrome",
        profile: "Profile 2"
      }
    },
    {
        match: "http://localhost:4000/*",
        browser: {
          name: "Google Chrome",
          profile: "Profile 3"
        }
    },
    {
        match: "http://localhost:4040/*",
        browser: {
          name: "Google Chrome",
          profile: "Profile 1"
        }
    },
    {
      match: "https://linear.app/*",
      browser: "Linear",
    },
    {
      match: "https://www.figma.com/file/*",
      browser: "Figma",
    },
    {
      match: "https://www.figma.com/file/*",
      browser: "Figma",
    },
    {
      match: ({ url }) => url.host.endsWith("cloud.google.com"),
      browser: "Firefox",
    },
    {
      match: /zoom\.us\/join/,
      browser: "us.zoom.xos",
    },
  ],
  rewrite: [
    {
      match: ({ url }) =>
        url.host.includes("zoom.us") && url.pathname.includes("/j/"),
      url({ url }) {
        try {
          var pass = "&pwd=" + url.search.match(/pwd=(\w*)/)[1];
        } catch {
          var pass = "";
        }
        var conf = "confno=" + url.pathname.match(/\/j\/(\d+)/)[1];
        return {
          search: conf + pass,
          pathname: "/join",
          protocol: "zoommtg",
        };
      },
    },
    {
      match: () => true, // Execute rewrite on all incoming urls to make this example easier to understand
      url: ({ url }) => {
        const removeKeysStartingWith = ["utm_", "uta_"]; // Remove all query parameters beginning with these strings
        const removeKeys = ["fbclid", "gclid"]; // Remove all query parameters matching these keys

        const search = url.search
          .split("&")
          .map((parameter) => parameter.split("="))
          .filter(
            ([key]) =>
              !removeKeysStartingWith.some((startingWith) =>
                key.startsWith(startingWith)
              )
          )
          .filter(
            ([key]) => !removeKeys.some((removeKey) => key === removeKey)
          );

        return {
          ...url,
          search: search.map((parameter) => parameter.join("=")).join("&"),
        };
      },
    },
  ],
};

import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Greybeard Consulting",
  description: "Solving problems the right way",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Blog', link: '/docs/index' }
    ],

    sidebar: [
      {
        text: 'Blog',
        items: [
                  // Greybeard articles
		  { text: "On perceived insecurity of Linux Phones", link: "/docs/linux-phone-security" },
		  { text: "LLMs won't replace you", link: "/docs/llms-replace-humans" },
                  // Cyber Lounge articles
		  { text: "Cyber Lounge: Kill the Ads, Save the Planet", link: "/docs/kill-the-ads-save-the-planet" },
		  { text: "Cyber Lounge: Six bullshit arguments against right to repair", link: "/docs/six-bullshit-arguments-against-right-to-repair" },
		  { text: "Cyber Lounge: Will \"A\" \"\"\"I\"\"\" Ever Completely Replace Humans", link: "/docs/will-ai-ever-replace-human-programmers" },
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/Greybeard-Entertainment' }
    ]
  }
})

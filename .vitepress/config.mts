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
		  { text: "On perceived insecurity of Linux Phones", link: "/docs/linux-phone-security" },
		  { text: "LLMs won't replace you", link: "/docs/llms-replace-humans" }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/Greybeard-Entertainment' }
    ]
  }
})

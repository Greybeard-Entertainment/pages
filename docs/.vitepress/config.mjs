import { defineConfig } from 'vitepress'
import markdownItFoo from 'markdown-it-footnote'
import markdownItAbbr from 'markdown-it-abbr'

// https://vitepress.dev/reference/site-config
export default defineConfig({
	title: "Greybeard Consulting",
	lang: "en-GB",
	description: "A home to Philosophy, Science, Music and Software",
	themeConfig: {
		// https://vitepress.dev/reference/default-theme-config
		socialLinks: [
			{ icon: 'github', link: 'https://github.com/Greybeard-Entertainment/' },
			{ icon: 'discord', link: 'https://discord.gg/XVVVC2VS' },
		]
	},
	markdown: {
		math: true,
		config: (md) => {
			md.use(markdownItFoo)
		}
	}
})

// Local Variables:
// mode: js
// End:

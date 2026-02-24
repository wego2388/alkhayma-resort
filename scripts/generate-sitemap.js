// Sitemap Generator for Al Khayma Resort
// Run: node scripts/generate-sitemap.js

const fs = require('fs')
const path = require('path')

const baseUrl = 'https://alkhaymaresort.com'

const staticPages = [
  { url: '/', priority: '1.0', changefreq: 'daily' },
  { url: '/rooms', priority: '0.9', changefreq: 'daily' },
  { url: '/restaurant', priority: '0.8', changefreq: 'weekly' },
  { url: '/activities', priority: '0.8', changefreq: 'weekly' },
  { url: '/gallery', priority: '0.7', changefreq: 'weekly' },
  { url: '/about', priority: '0.7', changefreq: 'monthly' },
  { url: '/contact', priority: '0.8', changefreq: 'monthly' },
]

function generateSitemap() {
  const today = new Date().toISOString().split('T')[0]
  
  let xml = '<?xml version="1.0" encoding="UTF-8"?>\n'
  xml += '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n'
  
  staticPages.forEach(page => {
    xml += '  <url>\n'
    xml += `    <loc>${baseUrl}${page.url}</loc>\n`
    xml += `    <lastmod>${today}</lastmod>\n`
    xml += `    <changefreq>${page.changefreq}</changefreq>\n`
    xml += `    <priority>${page.priority}</priority>\n`
    xml += '  </url>\n'
  })
  
  xml += '</urlset>'
  
  const outputPath = path.join(__dirname, '../frontend/public/sitemap.xml')
  fs.writeFileSync(outputPath, xml)
  
  console.log('✅ Sitemap generated successfully!')
  console.log(`📁 Location: ${outputPath}`)
}

generateSitemap()

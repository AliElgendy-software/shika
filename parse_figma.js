const puppeteer = require('puppeteer');

(async () => {
    try {
        const browser = await puppeteer.launch({ 
            headless: "new",
            args: ['--no-sandbox', '--disable-setuid-sandbox'] 
        });
        const page = await browser.newPage();
        
        console.log("Navigating to Figma...");
        await page.goto("https://www.figma.com/design/6vzuDhaWP8XhavTfU3JJ9o/Final-Project?node-id=163-2&m=dev", { waitUntil: 'networkidle2', timeout: 60000 });
        
        // Wait a few seconds for Figma's canvas/UI to load
        await page.waitForTimeout(10000); 

        // Get innerText of the body to see if any screen names or text are readable
        const text = await page.evaluate(() => document.body.innerText);
        console.log("Extracted Text Length:", text.length);
        console.log("Snippet:", text.substring(0, 500));
        
        await browser.close();
    } catch (e) {
        console.error(e);
    }
})();

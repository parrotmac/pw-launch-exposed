import playwright from 'playwright';

(async () => {
    const browserServer = await playwright.chromium.launchServer({
        headless: true,
        host: '0.0.0.0',
        port: 5900,
        wsPath: '/pw',
    });
    const wsEndpoint = browserServer.wsEndpoint();

    console.log(wsEndpoint);

    // run for 10 minutes
    await new Promise<void>((resolve) => {
        setTimeout(async () => {
            await browserServer.close().catch(console.error);
            resolve();
        }, 10 * 60 * 1000);
    });
})();

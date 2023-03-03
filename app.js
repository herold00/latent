const express = require('express');
const app = express();
const port = 80;

app.get('/', (req, res) => {
    res.send('Hello world!');
})

app.get('/route', (req, res) => {
    res.send('Webapp.io');
})

app.listen(port, () => {
    console.log(`App listening on port ${port}`);
})

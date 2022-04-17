const db = require('../persistence');
const uuid = require('uuid/v4');

module.exports = async (req, res) => {
    const item = {
        id: uuid(),
        name: req.body.name,
        completed: false,
    };

    await db.storeItem(item);
    console.log("[INFO] Added todo item " + item.id + " to database: [" + req.body.name + "]");
    res.send(item);
};

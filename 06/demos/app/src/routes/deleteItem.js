const db = require('../persistence');

module.exports = async (req, res) => {
    const item = await db.getItem(req.params.id);
    await db.removeItem(req.params.id);
    console.log("[INFO] Removed todo item " + req.params.id + " from database: [" + item.name + "]");
    res.sendStatus(200);
};

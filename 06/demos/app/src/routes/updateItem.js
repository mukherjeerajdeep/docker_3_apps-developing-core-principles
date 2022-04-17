const db = require('../persistence');

module.exports = async (req, res) => {
    await db.updateItem(req.params.id, {
        name: req.body.name,
        completed: req.body.completed,
    });
    console.log("[INFO] Updated todo item " + req.params.id + " in database: [" + req.body.name + "]");
    const item = await db.getItem(req.params.id);
    res.send(item);
};

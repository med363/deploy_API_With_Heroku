const req = require("express/lib/request");
const User = require("../modules/user.schema");
module.exports = {
  GetMessage: (req,res) => {
    res.send('hello from Flutter')
  },
  
  GetUsers: (req, res) => {
    User.find()
      .then((users) => {
        res.send(users);
      })
      .catch((err) => {
        res
          .status(500)
          .send({ message: "something wrong while getting list of users !!" });
      });
  },

  GetOneUser: (req, res) => {
    User.findById(req.params.id).then((user) => {
      if (!user) {
        return res
          .status(404)
          .send({ message: "user not found with this id " + req.params.id });
      }
      res.send(user);
    });
  },

  AddUsers: (req, res) => {
    // create new user
    const user = new User({
      fullName: req.body.fullName,
      phone: req.body.phone,
      email: req.body.email,
      is_active: req.body.is_active,
      is_verified: req.body.is_verified,
    });
    user
      .save()
      .then((data) => res.send(data))
      .catch((err) => {
        res
          .status(500)
          .send({ message: err.message || "something wrong when create user" });
      });
    // verification requiste ili wislitni kima schema wala
    // status 400 bad request b3athtli haja manich mitwa9aha
    // 500 pb cote Server
    //401 requette verified
    // 404 lien non disponible
    // 200 ok
    // 201 ok and created
    if (!req.body) {
      return res.status(400).send({
        message: "please complete all field",
      });
    }
  },

  UpdateUsers: (req, res) => {
    //validate request
    if (!req.body) {
      return res
        .status(400)
        .send({ message: "please fill all required fields " });
    }

    User.findByIdAndUpdate(
      req.params.id,
      {
        fistName: req.body.firstName,
        lastName: req.body.lasName,
        email: req.body.email,
        phone: req.body.phone,
        is_active: req.body.is_active,
        is_Verivfied: req.body.isVerified,
      },
      { new: true }
    )
      .then((user) => {
        if (!user) {
          return res.status(404).send({ message: "user not found " });
        }
        res.send(user);
      })
      .catch((err) => {
        if (err.kind === "ObjectId") {
          return res
            .status(404)
            .send({ message: "Error getting user with id " + req.params.id });
        }
        return res
          .status(500)
          .send({
            message: "could not delete user with is !!" + req.params.id,
          });
      });
  },

  DeleteUsers:  (req, res) => {
    User.findByIdAndRemove(req.params.id)
      .then((user) => {
        if (!user) {
          return res
            .status(404)
            .send({ message: "user not found with this id " + req.params.id });
        }
        res.send({ message: "user deleted successuflly " });
      })
      .catch((err) => {
        if (err.kind === "ObjectId") {
          return res
            .status(404)
            .send({ message: "Error getting user with id " + req.params.id });
        }
        return res
          .status(500)
          .send({
            message: "could not delete user with is !!" + req.params.id,
          });
      });
  },
};

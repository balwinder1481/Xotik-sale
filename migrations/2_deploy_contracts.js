var Xotik = artifacts.require("./Xotik.sol");

module.exports = function (deployer) {
  deployer.deploy(Xotik, 1000000);
};

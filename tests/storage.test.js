// Right click on the script name and hit "Run" to execute
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Time_lock", function () {
  it("test initial value", async function () {
    const Timelock = await ethers.getContractFactory("timelock");
    const timelock = await Timelock.deploy();
    await timelock.deployed();
    await timelock.set_balance();
  
    expect(await timelock.get_balance()).to.equal(15);
    console.log('Timelock deployed at:'+ timelock.address);
  });
});
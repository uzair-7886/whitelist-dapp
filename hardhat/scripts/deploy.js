const hre = require("hardhat");

async function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function main() {

  const whiteListContract=await hre.ethers.deployContract("Whitelist",[10])
  await whiteListContract.waitForDeployment()
  console.log("Address of Contract: ",whiteListContract.target)
  await sleep(30 * 1000); // 30s = 30 * 1000 milliseconds

  // Verify the contract on etherscan
  await hre.run("verify:verify", {
    address: whiteListContract.target,
    constructorArguments: [10],
  });
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

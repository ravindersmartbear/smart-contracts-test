const hre = require("hardhat")

const main = async () => {

    const [deployer] = await hre.ethers.getSigners();
    const accountBalance = await deployer.getBalance();

    console.log("Deploying constracts with account: ", deployer.address);
    console.log("Account balance: ", accountBalance.toString());

    const waveContractFactory = await hre.ethers.getContractFactory("NFT_Pcx");
    /*const waveContract1 = await waveContractFactory.deploy({
      value: hre.ethers.utils.parseEther("0.001"),
    });*/

    const waveContract = await waveContractFactory.deploy(
        "PCX_Commitement",
        "PC",
        "https://nftjson.com",
        "Project Name",
        "100MT",
        "Coca cola",
        "20/2/2022",
        "1234567890"
    );

    await waveContract.deployed();

    console.log("WavePortal address: ", waveContract.address);

};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();

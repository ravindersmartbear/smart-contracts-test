// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// use these imports if using Remix, otherwise use the GitHub links
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

/**This contract implements basic ERC721 NFT functionality with auto-incremented token ID's and a method
 * for storing a base URI for off-chain metadata using the format baseURI + "/" + _tokenIdCounter
 * 
 * Provide the uri variable in the constructor in string format. E.g. "https://my-metadata.com/"
 **/
contract NFT_Pcx is ERC721URIStorage {

    string baseURI;
    string projectName;
    string quantity;
    string buyerName;
    string buyDate;
    string certificationNumber;

    constructor(
        string memory name,
        string memory ticker,
        string memory uri,
        string memory projectName_,
        string memory quantity_,
        string memory buyerName_,
        string memory buyDate_,
        string memory certificationNumber_
    ) ERC721(name, ticker) {
        projectName = projectName_;
        quantity = quantity_;
        buyerName = buyerName_;
        buyDate = buyDate_;
        certificationNumber = certificationNumber_;
        setBaseURI(uri);
    }

    function setBaseURI(string memory baseURI_) internal {
        baseURI = baseURI_;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function _projectName() external view returns (string  memory){
        return projectName;
    }

    function _quantity() external view  returns (string  memory){
        return quantity;
    }

    function _buyerName() external view  returns (string  memory){
        return buyerName;
    }

    function _buyDate() external view  returns (string memory){
        return buyDate;
    }

    function _certificationNumber() external view  returns (string memory){
        return certificationNumber;
    }

}

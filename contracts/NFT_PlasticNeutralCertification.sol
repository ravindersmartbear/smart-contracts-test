// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// use these imports if using Remix, otherwise use the GitHub links
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/**This contract implements basic ERC721 NFT functionality with auto-incremented token ID's and a method
 * for storing a base URI for off-chain metadata using the format baseURI + "/" + _tokenIdCounter
 *
 * Provide the uri variable in the constructor in string format. E.g. "https://my-metadata.com/"
 **/

contract NFT_PlasticNeutralCertification is ERC721 {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    /**
     * @dev Initializes the contract setting.
     */

    constructor() ERC721("PlasticNeutralCertificationNFT", "PC") {

    }

    /**
     * @dev Add new commitment to contract. by default this commitment owner will be contract owner.
     * This will return _tokenId of commitment
     */

    function addCommitment(string memory metadataURI)
    public
    returns (uint256)
    {
        _tokenIds.increment();
        uint256 id = _tokenIds.current();
        _safeMint(_msgSender(), id);
        _setTokenURI(id, metadataURI);
        return id;
    }

    /**
     * @dev Transfer commitment to user
     */

    function mintCommitment(address owner, string memory metadataURI)
    public
    returns (uint256)
    {
        _tokenIds.increment();

        uint256 id = _tokenIds.current();
        _safeMint(owner, id);
        _setTokenURI(id, metadataURI);

        return id;
    }

    function _baseURI() internal view override returns (string memory) {
        return "ipfs://";
    }

}

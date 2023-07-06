// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Whitelist.sol";

contract CryptDevs is ERC721Enumerable, Ownable{
    uint256 constant public _price = 0.01 ether;
 uint256 constant public maxTokenIds = 20;
 Whitelist whitelist;
 uint256 public reservedTokens;
    uint256 public reservedTokensClaimed = 0;
        constructor (address whitelistContract) ERC721("Crypto Devs", "CD") {
        whitelist = Whitelist(whitelistContract);
        reservedTokens = whitelist.maxAddressesToWhitelist();
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Whitelist{
    uint8 public maxAddressesToWhitelist;
    uint8 public numberOfAddressesWhitelisted;

    mapping(address=>bool) whitelistAddress;

    constructor(uint8 _maxAddressesToWhitelist){
        maxAddressesToWhitelist = _maxAddressesToWhitelist;
    }

    function addToWhiteListed()public {
        require(!whitelistAddress[msg.sender],"Address already whitelisted");
        require(numberOfAddressesWhitelisted < maxAddressesToWhitelist,"Max addresses whitelisted");
        whitelistAddress[msg.sender] = true;
        numberOfAddressesWhitelisted++;
    }
}


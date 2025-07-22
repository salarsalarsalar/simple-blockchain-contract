// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestToken is ERC20 {
    address public owner;
    mapping(address => bool) public hasClaimed;

    constructor() ERC20("TestToken", "TST") {
        owner = msg.sender;
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function faucet() external {
        require(!hasClaimed[msg.sender], "You already claimed.");
        _transfer(owner, msg.sender, 100 * 10 ** decimals());
        hasClaimed[msg.sender] = true;
    }
}

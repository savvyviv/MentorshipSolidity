// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract Web3Ladies is ERC20, ERC20Permit {
    constructor() ERC20("Web3Ladies", "W3L") ERC20Permit("Web3Ladies") {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0/utils/math/Math.sol";
import "@openzeppelin/contracts@5.0/token/ERC20/ERC20.sol";

contract Depositw3l {
    
    address public tokenAddress;
    address public withdrawalAddress;
    ERC20 public customToken;
    
    
        uint256 public amount;
        uint public unlockBlock;
  
     


    
    event Withdraw(uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor(address _tokenAddress) {
        owner = msg.sender;
        customToken = ERC20(_tokenAddress);
    }
    
    

    address public owner = msg.sender; 
    function transferTokens(address _recipient, uint256 _amount) external {
        require(_amount > 0, "Deposit amount must be greater than 0");
        require(customToken.allowance(msg.sender, address(this)) >= _amount, "Insufficient allowance");
        require(customToken.transferFrom(msg.sender, _recipient, _amount), "Token transfer failed");
   
    

    }
     function withdraw (uint256 _amount) external {
        require (msg.sender == owner, "not owner");
        require(_amount > 0, "Deposit amount must be greater than 0");
        require(block.number >= unlockBlock, "Withdrawal is not yet allowed");
        emit Withdraw (address(this).balance); 

     } 

     function getContractBalance() external view returns (uint256) {
        return customToken.balanceOf(address(this));
    }

   

    
    

}

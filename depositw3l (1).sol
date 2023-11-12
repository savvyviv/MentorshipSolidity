// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0/utils/math/Math.sol";
import "@openzeppelin/contracts@5.0/token/ERC20/ERC20.sol";

contract Depositw3l {
    address public tokenAddress;
    address public withdrawalAddress;
    ERC20 public customToken;
    address public owner;
    
    
        uint public unlockBlock;
  
     


    event deposit (address _addr, uint256 _amount);
    event send ( address _addr, uint256 _amount);
    event Withdraw(address _addr, uint256 amount);
    

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }
    modifier hasEnough(address _addr, uint256 _amount){
        require(balances[_addr]>=_amount , "Insufficient balance");
    _; 

    }
    mapping (address=>uint) public balances;
    constructor(address _tokenAddress) {
        tokenAddress = _tokenAddress;
        customToken = ERC20(_tokenAddress);

    }
    

    

     function receiveTokens(uint256 _amount) external payable{
        // Assuming the sender has approved this contract to spend tokens on their behalf
        balances[msg.sender]<= msg.value;
        require(customToken.transferFrom(msg.sender, address(this), _amount), "Token transfer failed");
        emit deposit(msg.sender,msg.value);
   
    }
    function transferToken(address _receiver, uint _amount )external hasEnough(msg.sender,_amount) {
        balances[_receiver]+= _amount;
        balances[msg.sender]-= _amount;
        emit send(_receiver,_amount);
    }
     function withdraw (uint256 _amount , uint _unlockBlock) external hasEnough(msg.sender,_amount) {
        balances [msg.sender] -= _amount;
        address payable _receiver = payable (msg.sender);
        (bool sent ,)= _receiver.call{value: _amount}("");
        require (sent,"either not sent");
        require (msg.sender == owner, "not owner");
        require(_amount > 0, "Deposit amount must be greater than 0");
        _unlockBlock = 70;
        require(block.number >= _unlockBlock, "Withdrawal is not yet allowed");
        emit Withdraw (msg.sender,address(this).balance); 

     } 

     function getContractBalance() external view returns (uint256) {
        return customToken.balanceOf(address(this));
    }

   

    
    

}

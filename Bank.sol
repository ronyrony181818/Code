// SPDX-License-Identifier: MIT
//0xd9145CCE52D386f254917e481eB44e9943F39138
pragma solidity ^0.8.0;

contract Bank {
    address public accHolder;
    uint256 balances=0;

    constructor(){
        accHolder= msg.sender;
    }

    // Function to deposit money into the user's bank account
    function deposit() public payable {
        require(msg.sender == accHolder, "You are not the account owner");
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances += msg.value; // Add the deposit to the user's balance
    }

    // Function to withdraw money from the user's bank account
    function withdraw() payable  public {
        require(msg.sender == accHolder, "You are not the account owner");
        require(0 < balances, "Insufficient balance");
        payable(msg.sender).transfer(balances); // Transfer the amount to the user
        balances=0;
    }

    // Function to show the user's balance
    function getBalance() public view returns (uint256) {
        require(msg.sender == accHolder, "You are not the account owner");
        return balances; // Return the balance of the caller
    }
}

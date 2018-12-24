// Credit to Mastering Ethereum by Andreas Antonopoulos and Gavin Wood

// Version of Solidity compiler this program was written for
pragma solidity ^0.4.22;

// Our first contract is a faucet!
contract Faucet {

  //Initialize the owner address
  address owner;

  //Initialize the contract
  constructor() {
    //set the owner to the original sender
    owner = msg.sender;
  }

  // Give out ether to anyone who asks
  function withdraw(uint withdraw_amount) public {
    // Limit withdrawal amount
    require(withdraw_amount <= 100000000000000000);

    // Send the amount to the address that requested it
    msg.sender.transfer(withdraw_amount);
  }

  // Contract destructor with onlyOwner modifier
  function destroy() public onlyOwner {
    selfdestruct(owner);
  }

  // Function modifier used to enforce ownership
  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  // Accept any incoming amount
  function () public payable {}

}

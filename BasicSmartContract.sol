//declare version of solidity
pragma solidity ^0.5.1;

//declare smart contract
contract BasicSmartContract{
    
    //create a variable
    string value;
    
    //set default value using constructor
    constructor() public{
        value="myValue";
    }
    
    //create a function which reads value from storage
    function get() public view returns(string memory){
        return value;
    }
    
    //set function
    function set(string memory _value) public{
        value = _value;
    }
}

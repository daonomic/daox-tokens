pragma solidity ^0.4.11;


import './Token.sol';


contract NotifyingToken is Token {
    event Transfer(address indexed from, address indexed to, uint256 value, bytes data);
    function transferAndCall(address _to, uint256 _value, bytes _data) returns (bool);
}
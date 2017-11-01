pragma solidity ^0.4.0;


import "./BasicToken.sol";


contract ReadOnlyERC20BasicImpl is BasicToken {
    mapping(address => uint256) balances;


    function transfer(address _to, uint256 _value) public returns (bool) {
        revert();
    }
}

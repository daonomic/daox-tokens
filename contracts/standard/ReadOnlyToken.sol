pragma solidity ^0.4.15;


/**
 * @title Read-only ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ReadOnlyToken {
    uint256 public totalSupply;
    function balanceOf(address who) public constant returns (uint256);
    function allowance(address owner, address spender) public constant returns (uint256);
}

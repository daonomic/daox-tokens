pragma solidity ^0.4.0;


import "./ERC20Basic.sol";


contract ReadOnlyERC20Basic is ERC20Basic {
    mapping(address => uint256) balances;

    /**
    * @dev Gets the balance of the specified address.
    * @param _owner The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address _owner) public constant returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        revert();
    }
}

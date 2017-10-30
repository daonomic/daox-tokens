pragma solidity ^0.4.0;


import "./ReadOnlyERC20Basic.sol";
import "./ERC20.sol";


contract ReadOnlyERC20 is ReadOnlyERC20Basic, ERC20 {
    mapping (address => mapping (address => uint256)) internal allowed;

    function transferFrom(address _from, address _to, uint256 _value) whenNotPaused public returns (bool) {
        revert();
    }

    function approve(address _spender, uint256 _value) whenNotPaused public returns (bool) {
        revert();
    }

    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param _owner address The address which owns the funds.
     * @param _spender address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}

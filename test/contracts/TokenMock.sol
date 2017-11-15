pragma solidity ^0.4.15;


import "../../contracts/standard/TokenImpl.sol";


contract TokenMock is TokenImpl {
    function TokenMock(address initialAccount, uint256 initialBalance) public {
        balances[initialAccount] = initialBalance;
        totalSupply = initialBalance;
    }
}

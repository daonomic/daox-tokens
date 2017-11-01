pragma solidity ^0.4.15;


import "../../contracts/standard/TokenImpl.sol";


contract TokenMock is TokenImpl {
    function TokenMock(address initialAccount, uint256 initialBalance) {
        balances[initialAccount] = initialBalance;
        totalSupply = initialBalance;
    }
}

pragma solidity ^0.4.0;


import "../../contracts/standard/NotifyingTokenImpl.sol";


contract ReceiveNotifyTokenMock is NotifyingTokenImpl {
    function ReceiveNotifyTokenMock(address initialAccount, uint256 initialBalance) {
        balances[initialAccount] = initialBalance;
        totalSupply = initialBalance;
    }
}

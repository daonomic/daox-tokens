var TokenMock = artifacts.require('./contracts/ReceiveNotifyTokenMock.sol');
var ReceiverMock = artifacts.require('./contracts/TokenReceiverMock.sol');

const tests = require("@daonomic/tests-common");
const awaitEvent = tests.awaitEvent;

contract("ReceiveNotifyTokenImpl", function(accounts) {
    let token;
    let receiver;
    beforeEach(async function() {
        token = await TokenMock.new(accounts[0], 100);
        receiver = await ReceiverMock.new();
    });

    it("should notify receiver", async () => {
        var Event = receiver.EventTokenTransfer({});

        await token.transferAndCall(receiver.address, 50, "0xffffff");
        var event = await awaitEvent(Event);
        assert.equal(event.args.from, accounts[0]);
        assert.equal(event.args.value, 50);
        assert.equal(event.args.data, "0xffffff");
    });


});



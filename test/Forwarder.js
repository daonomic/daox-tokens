var Forwarder = artifacts.require('Forwarder.sol');
var ReceiverMock = artifacts.require('EtherReceiverMock.sol');

const tests = require("@daonomic/tests-common");
const awaitEvent = tests.awaitEvent;
const expectThrow = tests.expectThrow;
const randomAddress = tests.randomAddress;

contract("Forwarder", function(accounts) {
    let forwarder;
    let receiver;
    beforeEach(async function() {
		forwarder = await Forwarder.new();
		receiver = await ReceiverMock.new();
    });

    it("should forward ether with data", async () => {
		var Event = receiver.EtherReceived({});
		await forwarder.forward(receiver.address, "0xffff", {value: 10000});
		assert.equal(await web3.eth.getBalance(receiver.address), 9900);
		assert.equal(await web3.eth.getBalance(forwarder.address), 100);

		var event = await awaitEvent(Event);
		assert.equal(event.args.sender, forwarder.address);
		assert.equal(event.args.value, 9900);
		assert.equal(event.args.data, "0xffff");
    });

    it("should let withdraw ether", async () => {
        var address = randomAddress();

		await forwarder.forward(receiver.address, "0xffff", {value: 10000});
        await forwarder.withdraw(address, 90);
        assert.equal(await web3.eth.getBalance(forwarder.address), 10);
        assert.equal(await web3.eth.getBalance(address), 90);
    });
});



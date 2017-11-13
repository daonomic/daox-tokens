var TokenMock = artifacts.require('./contracts/ExternalTokenMock.sol');
var ReceiverMock = artifacts.require('./contracts/TokenReceiverMock.sol');

const awaitEvent = require("./helpers/awaitEvent.js");
const expectThrow = require("./helpers/expectThrow.js");

contract("BitcoinToken", function(accounts) {
    let token;
    let receiver;
    beforeEach(async function() {
        token = await TokenMock.new();
        receiver = await ReceiverMock.new();
    });

    it("should let minter mint", async () => {
        await token.mint(accounts[1], 50, "0x");
        assert.equal(await token.balanceOf.call(accounts[1]), 50);
    });

    it("should not let mint if not minter", async () => {
        await expectThrow(
            token.mint(accounts[1], 50, "0x", {from: accounts[1]})
        );
    });

    it("should notify listener", async () => {
        var Event = receiver.EventTokenTransfer({});

        await token.mintAndCall(receiver.address, 100, "0xff", "0xaaff");
        assert.equal(await token.balanceOf.call(receiver.address), 100);

        var event = await awaitEvent(Event);
        assert.equal(event.args.from, "0x0000000000000000000000000000000000000000");
        assert.equal(event.args.value, 100);
        assert.equal(event.args.data, "0xaaff");
    });

    it("should not let mintAndCall if not minter", async () => {
        await expectThrow(
            token.mintAndCall(receiver.address, 100, "0xff", "0xaaff", {from: accounts[1]})
        );
    });

    it("should burn tokens", async () => {
        await token.mint(accounts[1], 100, "tx");
        const burnEvent = token.Burn({});

        await token.burn(50, "data", {from: accounts[1]});
        assert.equal(await token.balanceOf.call(accounts[1]), 50);
        let burn = await awaitEvent(burnEvent);
        assert.equal(burn.args.burner, accounts[1]);
        assert.equal(burn.args.value, 50);
        assert.equal(burn.args.data, "0x64617461");
    });
});



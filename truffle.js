var network;
for(var i=0; i < process.argv.length; i++) {
    if (process.argv[i].startsWith("--network=")) {
        network = process.argv[i].substring(10);
    }
}

function getUserHome() {
  return process.env[(process.platform == 'win32') ? 'USERPROFILE' : 'HOME'];
}

module.exports = {
    networks: {},
    solc: {
        optimizer: {
            enabled: true,
            runs: 200
        }
    }
};

var networkConfig = {
    gas: 1500000,
    gasPrice: 4000000000
};

if (network) {
	var ProviderEngine = require("web3-provider-engine");
	var WalletSubprovider = require('web3-provider-engine/subproviders/wallet.js');
	var Web3Subprovider = require("web3-provider-engine/subproviders/web3.js");
	var Web3 = require("web3");
	var FilterSubprovider = require('web3-provider-engine/subproviders/filters.js')
	var Wallet = require("ethereumjs-wallet");

	function createEngine(url, wallet) {
	    var engine = new ProviderEngine();
	    engine.addProvider(new WalletSubprovider(wallet, {}));
	    engine.addProvider(new FilterSubprovider());
	    engine.addProvider(new Web3Subprovider(new Web3.providers.HttpProvider(url)));
	    engine.on('error', function(err) {
	        console.error(err.stack)
	    });
	    return engine;
	}

	var configName = getUserHome() + "/.ethereum/" + network + ".json";
    console.log("using config file: " + configName);
    var json = require(configName);
    var wallet = Wallet.fromPrivateKey(new Buffer(json.key, "hex"));
    var engine = createEngine(json.url, wallet);
    engine.start();
    networkConfig.from = wallet.getAddressString();
    console.log("address: " + wallet.getAddressString());
    networkConfig.network_id = json.network_id;
    networkConfig.provider = engine;

    module.exports.networks[json.name] = networkConfig;
}

var helper = (function() {
    var _helper = {};
    var contractAddress = "0xB176c57F76Db7ECfBD7C0e2D04A49A8539F9A4D3";
    var contract;
    var userAccount;
    var web3js;

    _helper.contract = function () { return contract; }
    _helper.userAccount = function () { return userAccount; }
    _helper.web3js = function () { return web3js; }

    _helper.startApp = async function (eth) {
        alert(eth);
        if (eth) {
            await eth.enable();
        }
        web3js = new Web3(eth);
        setInterval(async () => {
            // Check if account has changed
            const accounts = await eth.request({ method: 'eth_accounts' });
            if (accounts[0] !== userAccount) {
                userAccount = accounts[0];
                alert(userAccount);
            }
        }, 100);

        contract = new web3js.eth.Contract(alumnosCursadasABI, contractAddress);
    };



    return _helper;
})();
var helper = (function() {
    var _helper = {};
    var contractAddress = "0x833abd61073521d1c4D4F573920E064a77E2A901";
    var contract;
    var userAccount;
    var web3js;

    _helper.contract = function () { return contract; }
    _helper.userAccount = function () { return userAccount; }
    _helper.web3js = function () { return web3js; }

    _helper.startApp = async function (eth) {
        if (eth) {
            await eth.enable();
        }
        _helper.web3js = new Web3(eth);
        setInterval(async () => {
            // Check if account has changed
            const accounts = await eth.request({ method: 'eth_accounts' });
            if (accounts[0] !== _helper.userAccount) {
                _helper.userAccount = accounts[0];
                alert(`User addr: ${_helper.userAccount}`);
            }
        }, 100);

        _helper.contract = new _helper.web3js.eth.Contract(alumnosCursadasABI, contractAddress);
    };

    _helper.createCurso = function (id, nombre, profesor, creditos, correlativas, onReceipt, onError) {
        alert(_helper.userAccount);
        _helper.contract.methods.createCurso(id, nombre, profesor, creditos, correlativas)
            .send({ from: _helper.userAccount })
            .on("receipt", function (receipt) {
                onReceipt(receipt);
            })
            .on("error", function (error) {
                onError(error);
            });
    };

    _helper.getCursos = function (onSuccess) {
        // Returns a list of cursos IDs
        _helper.contract.methods.listCursos().call()
            .then(function(ids) {
                onSuccess(ids);
            })
            .catch(err => alert(err));
    }

    _helper.getCursoDetails = function(id, onSuccess) {
        _helper.contract.methods.getCurso(id).call()
            .then(function (curso) { onSuccess(curso); })
            .catch(err => alert(err));
    }


    return _helper;
})();
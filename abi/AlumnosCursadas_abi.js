var alumnosCursadasABI = [
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "idCurso",
				"type": "uint256"
			},
			{
				"indexed": false,
				"internalType": "address",
				"name": "alumno",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "bool",
				"name": "soloCursada",
				"type": "bool"
			}
		],
		"name": "CursadaAprobada",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "previousOwner",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "OwnershipTransferred",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "alumno",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "_idCurso",
				"type": "uint256"
			},
			{
				"internalType": "uint8",
				"name": "nota",
				"type": "uint8"
			}
		],
		"name": "asignarAprobacionFinalCursada",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "alumno",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "_idCurso",
				"type": "uint256"
			}
		],
		"name": "asignarAprobacionSoloCursada",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint8",
				"name": "_maxNota",
				"type": "uint8"
			}
		],
		"name": "changeMaxNota",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint8",
				"name": "_minNota",
				"type": "uint8"
			}
		],
		"name": "changeMinNota",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "id",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "nombre",
				"type": "string"
			},
			{
				"internalType": "address",
				"name": "profesor",
				"type": "address"
			},
			{
				"internalType": "int256",
				"name": "creditos",
				"type": "int256"
			},
			{
				"internalType": "uint256[]",
				"name": "correlativas",
				"type": "uint256[]"
			}
		],
		"name": "createCurso",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "alumno",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "_idCurso",
				"type": "uint256"
			}
		],
		"name": "desasignarAprobacionSoloCursada",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_idCurso",
				"type": "uint256"
			}
		],
		"name": "expirarCursadasVencidas",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "id",
				"type": "uint256"
			}
		],
		"name": "getCurso",
		"outputs": [
			{
				"components": [
					{
						"internalType": "uint256",
						"name": "id",
						"type": "uint256"
					},
					{
						"internalType": "string",
						"name": "nombre",
						"type": "string"
					},
					{
						"internalType": "address",
						"name": "profesor",
						"type": "address"
					},
					{
						"internalType": "int256",
						"name": "creditos",
						"type": "int256"
					},
					{
						"internalType": "uint256[]",
						"name": "correlativas",
						"type": "uint256[]"
					},
					{
						"internalType": "bool",
						"name": "activo",
						"type": "bool"
					},
					{
						"internalType": "bool",
						"name": "initialized",
						"type": "bool"
					}
				],
				"internalType": "struct CursosFactory.Curso",
				"name": "",
				"type": "tuple"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "idsCursos",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "listCursos",
		"outputs": [
			{
				"internalType": "uint256[]",
				"name": "",
				"type": "uint256[]"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "id",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "nombre",
				"type": "string"
			},
			{
				"internalType": "address",
				"name": "profesor",
				"type": "address"
			},
			{
				"internalType": "int256",
				"name": "creditos",
				"type": "int256"
			},
			{
				"internalType": "uint256[]",
				"name": "correlativas",
				"type": "uint256[]"
			}
		],
		"name": "modifyCurso",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "renounceOwnership",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "testView",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "pure",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "transferOwnership",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]
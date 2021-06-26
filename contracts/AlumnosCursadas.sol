// SPDX-License-Identifier: NONE

pragma solidity ^0.8.0;

import "./CursosFactory.sol";

contract AlumnosCursadas is CursosFactory {
    
    struct Cursada {
        uint idCurso;
        bool soloCursada;
        int nota;
        uint256 fechaAprobacion;
    }
    
    mapping(address => Cursada) Cursadas;
}
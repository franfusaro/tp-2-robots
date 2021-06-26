// SPDX-License-Identifier: NONE

pragma solidity ^0.8.0;

import "./CursosFactory.sol";

contract AlumnosCursadas is CursosFactory {
    
    struct Cursada {
        uint idCurso;
        bool soloCursada;
        uint8 nota;
        uint256 fechaAprobacion;
    }
    
    uint8 minNota = 4;
    uint8 maxNota = 10;
    
    mapping(uint => mapping(address => Cursada)) cursadasAprobadas;
    
    modifier isProfesor(address profesor, uint idCurso) {
        require(profesoresCursos[idCurso] == profesor);
        _;
    }
    
    function asignarAprobacionSoloCursada(address alumno, uint _idCurso) external isProfesor(msg.sender, _idCurso) {
        cursadasAprobadas[_idCurso][alumno] = Cursada(_idCurso, true, 0, block.timestamp);
    }
    
    function desasignarAprobacionSoloCursada(address alumno, uint _idCurso) external isProfesor(msg.sender, _idCurso) {
        require(cursadasAprobadas[_idCurso][alumno].soloCursada);
        delete cursadasAprobadas[_idCurso][alumno];
    }
    
    function asignarAprobacionFinalCursada(address alumno, uint _idCurso, uint8 nota) external isProfesor(msg.sender, _idCurso) {
        require(nota >= minNota && nota <= maxNota);
        cursadasAprobadas[_idCurso][alumno] = Cursada(_idCurso, true, nota, block.timestamp);
    }
    
    function changeMinNota(uint8 _minNota) external onlyOwner {
        minNota = _minNota;
    }
    
    function changeMaxNota(uint8 _maxNota) external onlyOwner {
        maxNota = _maxNota;
    }
}
// SPDX-License-Identifier: NONE

pragma solidity ^0.8.0;

import "./CursosFactory.sol";

contract AlumnosCursadas is CursosFactory {
    
    struct Cursada {
        uint idCurso;
        bool soloCursada;
        uint8 nota;
        uint fechaAprobacion;
    }
    
    uint8 minNota = 4;
    uint8 maxNota = 10;
    
    mapping(uint => mapping(address => Cursada)) cursadasAprobadas;
    
    modifier isProfesor(address profesor, uint idCurso) {
        require(profesoresCursos[idCurso] == profesor);
        _;
    }
    
    modifier hasAllCorrelativasAprobadas(address alumno, uint _idCurso) {
        Curso memory curso = cursos[_idCurso];
        for (uint i=0; i< curso.correlativas.length; i++) {
            uint correlativa = curso.correlativas[i];
            Cursada memory cursadaAnterior = cursadasAprobadas[correlativa][alumno];
            require(cursadaAnterior.soloCursada == false);
            require(cursadaAnterior.nota > 0);
        }
        _;
    }
    
    function asignarAprobacionSoloCursada(address alumno, uint _idCurso) external isProfesor(msg.sender, _idCurso) hasAllCorrelativasAprobadas(alumno, _idCurso) {
        cursadasAprobadas[_idCurso][alumno] = Cursada(_idCurso, true, 0, block.timestamp);
    }
    
    function asignarAprobacionFinalCursada(address alumno, uint _idCurso, uint8 nota) external isProfesor(msg.sender, _idCurso) hasAllCorrelativasAprobadas(alumno, _idCurso) {
        require(nota >= minNota && nota <= maxNota);
        cursadasAprobadas[_idCurso][alumno] = Cursada(_idCurso, false, nota, block.timestamp);
    }
    
    function desasignarAprobacionSoloCursada(address alumno, uint _idCurso) external isProfesor(msg.sender, _idCurso) {
        require(cursadasAprobadas[_idCurso][alumno].soloCursada);
        delete cursadasAprobadas[_idCurso][alumno];
    }
    
    function changeMinNota(uint8 _minNota) external onlyOwner {
        minNota = _minNota;
    }
    
    function changeMaxNota(uint8 _maxNota) external onlyOwner {
        maxNota = _maxNota;
    }
}
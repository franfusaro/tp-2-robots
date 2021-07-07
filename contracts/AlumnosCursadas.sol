// SPDX-License-Identifier: NONE

pragma solidity ^0.8.0;

import "./CursosFactory.sol";

contract AlumnosCursadas is CursosFactory {

    struct Cursada {
        uint idCurso;
        bool soloCursada;
        uint8 nota;
        uint fechaAprobacion;
        bool initialized;
    }
    
    uint8 minNota = 4;
    uint8 maxNota = 10;
    uint vencimientoCursada = 548 days; // years has been deprecated
    
    event CursadaAprobada(uint idCurso, address alumno, bool soloCursada);
    
    mapping(uint => mapping(address => Cursada)) cursadasAprobadas;
    mapping(uint => address[]) alumnosCursando;
    mapping(address => uint) creditos;
    
    modifier isProfesor(address profesor, uint idCurso) {
        require(cursos[idCurso].profesor == profesor);
        _;
    }
    
    modifier hasAllCorrelativasAprobadas(address alumno, uint _idCurso) {
        Curso memory curso = cursos[_idCurso];
        require(curso.initialized == true);
        for (uint i=0; i< curso.correlativas.length; i++) {
            uint correlativa = curso.correlativas[i];
            Cursada memory cursadaAnterior = cursadasAprobadas[correlativa][alumno];
            require(cursadaAnterior.soloCursada == false);
            require(cursadaAnterior.nota > 0);
        }
        _;
    }
    
    function asignarAprobacionSoloCursada(address alumno, uint _idCurso) external isProfesor(msg.sender, _idCurso) existeCurso(_idCurso) hasAllCorrelativasAprobadas(alumno, _idCurso) {
        require(cursadasAprobadas[_idCurso][alumno].nota == 0);
        if (!cursadasAprobadas[_idCurso][alumno].initialized) {
            alumnosCursando[_idCurso].push(alumno);
        }
        cursadasAprobadas[_idCurso][alumno] = Cursada(_idCurso, true, 0, block.timestamp, true);
        emit CursadaAprobada(_idCurso, alumno, true);
    }
    
    function asignarAprobacionFinalCursada(address alumno, uint _idCurso, uint8 nota) external isProfesor(msg.sender, _idCurso) existeCurso(_idCurso) hasAllCorrelativasAprobadas(alumno, _idCurso) {
        require(nota >= minNota && nota <= maxNota);
        require(cursadasAprobadas[_idCurso][alumno].nota == 0);
        cursadasAprobadas[_idCurso][alumno] = Cursada(_idCurso, false, nota, block.timestamp, true);
        creditos[alumno] += cursos[_idCurso].creditos;
        emit CursadaAprobada(_idCurso, alumno, false);
    }
    
    function desasignarAprobacionSoloCursada(address alumno, uint _idCurso) external isProfesor(msg.sender, _idCurso) {
        require(cursadasAprobadas[_idCurso][alumno].soloCursada);
        delete cursadasAprobadas[_idCurso][alumno];
    }
    
    function expirarCursadasVencidas(uint _idCurso) public {
        for (uint i=0; i < alumnosCursando[_idCurso].length; i++) {
            address idAlumno = alumnosCursando[_idCurso][i];
            Cursada memory cursadaAlumno = cursadasAprobadas[_idCurso][idAlumno];
            if (cursadaAlumno.soloCursada && block.timestamp >= cursadaAlumno.fechaAprobacion + vencimientoCursada) {
                delete cursadasAprobadas[_idCurso][idAlumno];
            }
        }
    }
    
    function changeMinNota(uint8 _minNota) external onlyOwner {
        minNota = _minNota;
    }
    
    function changeMaxNota(uint8 _maxNota) external onlyOwner {
        maxNota = _maxNota;
    }
    
    function getCusadaAprobadas(uint idCurso,address alumno) public view returns(Cursada memory) {
        return cursadasAprobadas[idCurso][alumno];
    }
    
    function getCreditosAlumno(address alumno) public view returns(uint) {
        return creditos[alumno];
    }
}



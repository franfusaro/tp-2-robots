// SPDX-License-Identifier: NONE

pragma solidity ^0.8.0;

import "./Ownable.sol";

contract CursosFactory is Ownable {
    struct Curso {
        uint id;
        string nombre;
        address profesor;
        int creditos;
        uint[] correlativas;
        bool activo;
    }
    
    mapping(uint => bool) internal cursosCreados;
    mapping(uint => address) internal profesoresCursos;
    Curso[] public cursos;
    
    modifier existeCurso(uint id) {
        require(cursosCreados[id]);
        _;
    }
    
    function createCurso(uint id, string memory nombre, address profesor, int creditos, uint[] calldata correlativas) public onlyOwner {
        require(!cursosCreados[id]);
        cursos.push(Curso(id, nombre, profesor, creditos, correlativas, true));
        cursosCreados[id] = true;
        profesoresCursos[id] = profesor;
    }

    function changeCursoNombre(uint id, string memory _nuevoNombre) external onlyOwner existeCurso(id) {
        cursos[id].nombre = _nuevoNombre;
    }
    
    function changeCursoCreditos(uint id, int _creditos) external onlyOwner existeCurso(id) {
        cursos[id].creditos = _creditos;
    }
    
    function changeCursoProfesor(uint id, address _profesor) external onlyOwner existeCurso(id) {
        cursos[id].profesor = _profesor;
    }
    
    function changeCursoCorrelativas(uint id, uint[] calldata _correlativas) external onlyOwner existeCurso(id) {
        cursos[id].correlativas = _correlativas;
    }
    
    function changeCursoActivo(uint id, bool _activo) external onlyOwner existeCurso(id) {
        cursos[id].activo = _activo;
    }
}

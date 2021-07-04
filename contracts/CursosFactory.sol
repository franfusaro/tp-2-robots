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
        bool initialized;
    }
    
    mapping(uint => Curso) internal cursos;
    uint[] public idsCursos;
    
    modifier existeCurso(uint id) {
        require(cursos[id].initialized == true);
        _;
    }
    
    function createCurso(uint id, string memory nombre, address profesor, int creditos, uint[] calldata correlativas) public onlyOwner {
        require(cursos[id].initialized == false);
        idsCursos.push(id);
        cursos[id] = Curso(id, nombre, profesor, creditos, correlativas, true, true);
    }
    
    function modifyCurso(uint id, string memory nombre, address profesor, int creditos, uint[] calldata correlativas) public onlyOwner {
        require(cursos[id].initialized == true);
        Curso storage curso = cursos[id];
        curso.nombre = nombre;
        curso.profesor = profesor;
        curso.creditos = creditos;
        curso.correlativas = correlativas;
    }
    
    function listCursos() public view returns(uint[] memory) {
        return idsCursos;
    }
    
    function getCurso(uint id) public existeCurso(id) view returns(Curso memory)  {
        return cursos[id];
    }
}

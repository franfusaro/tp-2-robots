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
    
    uint8 minNota = 4;
    uint8 maxNota = 10;
    
    mapping(uint => bool) cursosCreados;
    Curso[] public cursos;
    
    function createCurso(uint id, string memory nombre, address profesor, int creditos, uint[] correlativas, bool activo) public onlyOwner {
        if (cursosCreados[id]) {
            // Ya existe el curso, ver de tirar excepcion
            return;
        }
        cursos.push(Curso(id, nombre, profesor, creditos, correlativas, activo));
    }
    
    function createCurso(uint id, string memory nombre, address profesor, int creditos, uint[] correlativas) public onlyOwner {
        cursos.push(Curso(id, nombre, profesor, creditos, correlativas, true));
    }
}
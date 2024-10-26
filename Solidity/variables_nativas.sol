// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract variables_nativas {

    string private fullName; // solo puede acceder el que inicializo el contrato

    constructor(string memory _lastName) {
        fullName = string.concat("Mi nombre es:", "", _lastName);
    }
    
    function getName() public view  returns (string memory) {

        return fullName;
        
    }

/*
uint enteros sin signo (no negativos)
uint8 rango de 0 a 2 ** 8 -1  ( 2 con 7 0 menos 1 )
uint16 rango de 0 a 2 ** 16 -1  
*/
    uint8 public uint_8 = 1;
    uint16 public uint_16 = 123;

    //guardar numeros con signo negativo

    int8 public int_8 = -1;

    // address = como tal es una direccion

    address public my_address = 0x014ED7B4735F042Decd0167D9c30eec780AE0D3b;
    
}
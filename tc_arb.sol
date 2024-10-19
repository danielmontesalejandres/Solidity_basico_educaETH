// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract tc_arb {

    //determinar la direccion de la billetera que crea el contrato
    address payable public owner;

    struct Data {
                    string date;    //fecha del envio
                    string delivery_date;   //fecha estimada de llegada
                    string product;     //nombre del producto
                    string price;   //precio del producto
                    string code;    //identificador del proveedor
                    string cel_number;  //contacto de la persona que compro
                    int8 status;    // 1- en camino, 2- llego al pais, 3- esta aduana, 4- entregado
                    address wallet;     //persona que ejecuta el contrato
                 }

    Data public data;   //instancia de Data

    event newData (
        string date,
        string delivery_date,
        string product,
        string price,
        string code,
        string cel_number,
        int8 status,
        address wallet
        );

    //modifier para que solo el owner pued retirar los fondos del contrato
    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el propietario puede retirarlos fondos");
        _;
    }

    /*  modifier lo que hace es verificar 
        dentro de otras fiunciones que al ejecutar
        la funcion no se tengael valor del fee + gas
    */

    modifier cost(uint amount) {
        require(msg.value >= amount, "No tiene saldoen ARB para ejecutar");
        _;
    }

    // se define quien es el propietario del contrato

    constructor() { 
        owner =payable(msg.sender); 
    }

    // funcion para cambiar los datos del enum
    function pushData ( string memory _date,
                    string memory _delivery_date,
                    string memory _product,
                    string memory _price,
                    string memory _code,
                    string memory _cel_number,
                    int8 _status) public payable cost (1000000000000000){

                        data = Data( _date,
                                    _delivery_date,
                                    _product,
                                    _price,
                                    _code,
                                    _cel_number,
                                    _status,
                                    msg.sender);

                        // es como una especie de log
                        emit newData(_date,
                                    _delivery_date,
                                    _product,
                                    _price,
                                    _code,
                                    _cel_number,
                                    _status,
                                    msg.sender);
                    }

                        // funcion para retirar los fondos del contrato
                        function withdraw() public onlyOwner {
                            uint balance = address(this).balance;
                            require(balance > 0, "No se tienen fondos en el contrato todavia");
                            owner.transfer(balance);
                            }
                        //funcion para consultar el valor que se encuentra en el contrato
                        function getBalance() public view returns (uint256) {
                            return address(this).balance;
                        }
}



/*
 	Name: [EODS] EXPLOSIVE ORDNANCE DISPOSAL SUITE
 	
 	Author(s): Monovdd (Carlos Alberto Arango Sch�tz)

 	Note: Do not modify this file without permission.
	
	Licence: http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

FNC_EODS_HIDDEN_OCULTAR = {

private ["_ied","_tipoDeTierra","_nuevaTierra","_posicion","_dir"];

_ied = _this select 0;

	switch (typeOf _ied) do {

   		case "EODS_ied01": {_tipoDeTierra = "EODS_tierra01_ied01";};

   		case "EODS_ied02": {_tipoDeTierra = "EODS_tierra01_ied02";};

   		case "EODS_ied03": {_tipoDeTierra = "EODS_tierra01_ied03";};

   		case "EODS_ied04": {_tipoDeTierra = "EODS_tierra01_ied04";};

   		case "EODS_ied05": {_tipoDeTierra = "EODS_tierra01_ied02";};

   		case "EODS_ied06": {_tipoDeTierra = "EODS_tierra01_ied03";};

   		case "EODS_ied07": {_tipoDeTierra = "EODS_tierra01_ied04";};
	};

_posicion = position _ied;

_nuevaTierra = createVehicle [_tipoDeTierra, _posicion, [], 0, "CAN_COLLIDE"];

_nuevaTierra disableCollisionWith _ied;

_dir = getDir _ied;

_nuevaTierra setDir _dir;

_nuevaTierra setPos (_posicion);

_ied attachTo [_nuevaTierra,[0,0,-1]];

sleep 10;

_ied setVariable ["EODS_Ieds_HIDDEN_ENTERRADO", true, true];

_ied setVariable ["EODS_Ieds_HIDDEN_TIERRA", _nuevaTierra, true];

_nuevaTierra setVariable ["EODS_Ieds_HIDDEN_TIERRA_IED", _ied, true];

//[[_ied], "FNC_EODS_PCU_ELIMINAR_ACCIONES", true, false] spawn BIS_fnc_MP;

//[[_ied,_nuevaTierra], "FNC_EODS_PCU_ADD_ACCION_DESENTERRAR", true, false] spawn BIS_fnc_MP;

};
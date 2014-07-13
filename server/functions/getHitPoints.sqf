//	@file Version: 1.0
//	@file Name: getHitPoints.sqf
//	@file Author: AgentRev
//	@file Created: 03/10/2013 11:51

private ["_class", "_hitPoints", "_cfgVehicle", "_hitPointsCfg", "_nbHitPoints", "_hitPoint", "_i"];
_class = _this;

if (typeName _class == "OBJECT") then
{
	_class = typeOf _class;
};

_hitPoints = [];
_cfgVehicle = configFile >> "CfgVehicles" >> _class;

while {isClass _cfgVehicle} do
{
	_hitPointsCfg = _cfgVehicle >> "HitPoints";

	if (isClass _hitPointsCfg) then
	{
		_nbHitPoints = count _hitPointsCfg;

		for "_i" from 0 to (_nbHitPoints - 1) do
		{
			_hitPoint = _hitPointsCfg select _i;

			if ({configName _hitPoint == configName _x} count _hitPoints == 0) then
			{
				_hitPoints set [count _hitPoints, _hitPoint];
			};
		};
	};

	_cfgVehicle = inheritsFrom _cfgVehicle;
};

_hitPoints

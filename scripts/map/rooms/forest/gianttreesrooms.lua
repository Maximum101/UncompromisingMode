AddRoom("GiantTrees", 
{
	colour={r=.6,g=.2,b=.8,a=.50},
	value = GROUND.JUNGLE,
	tags = {"RoadPoison", "hoodedcanopy"}, --"ForceDisconnected"
	contents =  
	{	
			countprefabs =	
		{
			giant_tree = function () return 6 + math.random(1,2) end,
			
		}
}})
AddRoom("BGGiantTrees", 
{
	colour = {r=1,g=1,b=1,a=.50}, 
	value = GROUND.JUNGLE,
	tags = {"hoodedcanopy"}, --"ForceDisconnected"
	contents =  
	{	
			countprefabs =	
		{
			giant_tree = function () return 6 + math.random(0,1) end,
			
		}
}})
AddRoom("SpideryGiantTrees", 
{
	colour = {r=1,g=1,b=1,a=.50}, 
	value = GROUND.JUNGLE,
	tags = {"hoodedcanopy"}, --"ForceDisconnected"
	contents =  
	{	
			distributepercent = 0.001,
			distributeprefabs =
			{
				giant_tree = 0.01,
				spiderden = 0.01,
			},
}})
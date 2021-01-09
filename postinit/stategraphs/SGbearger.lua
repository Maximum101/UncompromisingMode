local env = env
GLOBAL.setfenv(1, GLOBAL)

env.AddStategraphPostInit("bearger", function(inst)

local function onattackfn(inst)
    if inst.components.health ~= nil and
        not inst.components.health:IsDead() and
        (inst.sg:HasStateTag("hit") or not inst.sg:HasStateTag("busy")) then

        -- Cle5ar out the inventory if he got interrupted
        local target = inst.components.inventory:FindItem(function(item) return inst.components.eater:CanEat(item) end)
        while target ~= nil do
            target:Remove()
            target = inst.components.inventory:FindItem(function(item) return inst.components.eater:CanEat(item) end)
        end

        if inst.components.combat ~= nil and
            inst.components.combat.target ~= nil and
            inst.components.combat.target:HasTag("beehive") then
            inst.sg:GoToState("attack")
            return
        end

        if not (inst.cangroundpound or inst.components.timer:TimerExists("GroundPound")) then
            inst.components.timer:StartTimer("GroundPound", TUNING.BEARGER_NORMAL_GROUNDPOUND_COOLDOWN)
        end

        if not (inst.canyawn or inst.components.timer:TimerExists("Yawn")) and inst:HasTag("hibernation") then 
            --print("Starting yawn timer ", TUNING.BEARGER_YAWN_COOLDOWN)
            inst.components.timer:StartTimer("Yawn", TUNING.BEARGER_YAWN_COOLDOWN)
        end

        if inst.sg:HasStateTag("running") then
            inst.sg:GoToState("pound")
        elseif inst.canyawn and not inst.sg:HasStateTag("yawn") then
            inst.sg:GoToState("yawn")
        elseif inst.cangroundpound then
            inst.sg:GoToState("pound")
        else
            inst.sg:GoToState("attack")
        end
    end
end

local events={
	EventHandler("doattack", function(inst, data)
		if inst.rockthrow == true and not inst.components.health:IsDead() then
            inst.sg:GoToState("shoot", data.target)
		else
			onattackfn(inst)
		end
	end)
	}


local states = {
	
    State{
        name = "shoot",
        tags = { "attack", "busy" },

        onenter = function(inst, target)
            if not target then
                target = inst.components.combat.target
            end

            if target then
                inst.sg.statemem.target = target
            end

            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("shoot")
        end,

        timeline =
        {   
            TimeEvent(7*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/bearger/taunt", "taunt") end),
            TimeEvent(25*FRAMES, function(inst)
                if inst.sg.statemem.target and inst.sg.statemem.target:IsValid() then
                    inst.sg.statemem.inkpos = Vector3(inst.sg.statemem.target.Transform:GetWorldPosition())            
                    inst:LaunchProjectile(inst.sg.statemem.inkpos)

                    inst.components.timer:StopTimer("RockThrow")
					inst.components.timer:StartTimer("RockThrow", TUNING.BEARGER_NORMAL_GROUNDPOUND_COOLDOWN)
                end
            end),
        },

        events =
        {
			EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    },    
}

for k, v in pairs(events) do
    assert(v:is_a(EventHandler), "Non-event added in mod events table!")
    inst.events[v.name] = v
end

for k, v in pairs(states) do
    assert(v:is_a(State), "Non-state added in mod state table!")
    inst.states[v.name] = v
end

end)


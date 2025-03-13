-- by r457

local FixZAxisHotkey = Key.F1

local PlayerPawn = nil
local PlayerController = nil

function FixNPCZAxis()
    ExecuteInGameThread(function()
		print("[r457] FixNPCZAxis\n")
		local NPCS = FindAllOf("BP_NPC_C")
		local ClosestNPC = nil
		local PlayerLocation = PlayerPawn:K2_GetActorLocation()
		local MinDistance = 1e8
		print(string.format("[r457] Player location: {X=%.3f, Y=%.3f, Z=%.3f}\n", PlayerLocation.X, PlayerLocation.Y, PlayerLocation.Z))
		for Index,NPC in pairs(NPCS) do
			local Location = NPC:K2_GetActorLocation()
			local distance = (PlayerLocation.X - Location.X) * (PlayerLocation.X - Location.X) + (PlayerLocation.Y - Location.Y) * (PlayerLocation.Y - Location.Y)
			if distance < MinDistance then
				ClosestNPC = NPC
				MinDistance = distance
			end
			print("[r457] Found NPC\n")
			print(string.format("[r457] NPC location: {X=%.3f, Y=%.3f, Z=%.3f}\n", Location.X, Location.Y, Location.Z))
		end
		if ClosestNPC and ClosestNPC:IsValid() then
			print("[r457] Closest NPC\n")
			local Location = ClosestNPC:K2_GetActorLocation()
			print(string.format("[r457] NPC location: {X=%.3f, Y=%.3f, Z=%.3f}\n", Location.X, Location.Y, Location.Z))
			--local FloorResult = {}
			--ClosestNPC.CharacterMovement:K2_FindFloor(Location, FloorResult)
			--print(string.format("[r457] Floor dist: %.3f\n", FloorResult.FloorDist))
			--they're on the floor! bad collision settings for bunker boundary volume?
			local HitResult = {}
			Location.Z = PlayerLocation.Z
			ClosestNPC:K2_SetActorLocation(Location, false, HitResult, true)
		end
    end)
end

RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context, NewPawn)
	print("[r457] FixZAxis mod activated on client restart\n")
	PlayerController = Context:get()
	if PlayerController and PlayerController:IsValid() then
		print("[r457] Player controller found\n")
		PlayerPawn = PlayerController.Pawn
		if PlayerPawn and PlayerPawn:IsValid() then
			print("[r457] Player character found\n")
			if not IsKeyBindRegistered(FixZAxisHotkey) then
				print("[r457] Hotkey registered\n")
				RegisterKeyBind(FixZAxisHotkey, FixNPCZAxis)
			end
		end
	end
end)

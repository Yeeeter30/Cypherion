-- Define the color to apply (grey)
local greyColor = Color3.fromRGB(128, 128, 128)

-- Function to remove textures, decals, faces, and clothing
local function removeTexturesAndSimplify()
    for _, obj in pairs(game:GetDescendants()) do
        -- Remove Decals and Textures
        if obj:IsA("Decal") or obj:IsA("Texture") then
            obj:Destroy()
        
        -- Remove Clothing
        elseif obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("ShirtGraphic") then
            obj:Destroy()
        
        -- Simplify Part colors
        elseif obj:IsA("Part") or obj:IsA("MeshPart") then
            obj.Material = Enum.Material.SmoothPlastic
            obj.Color = greyColor
            
            -- Remove Faces
            if obj:IsA("MeshPart") then
                obj.TextureID = ""
            end
        end
    end
end

-- Run the function once at start
removeTexturesAndSimplify()

-- Listen for new parts being added (to simplify them as well)
game.DescendantAdded:Connect(function(obj)
    if obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("ShirtGraphic") then
        obj:Destroy()
    elseif obj:IsA("Part") or obj:IsA("MeshPart") then
        obj.Material = Enum.Material.SmoothPlastic
        obj.Color = greyColor
        if obj:IsA("MeshPart") then
            obj.TextureID = ""
        end
    end
end)
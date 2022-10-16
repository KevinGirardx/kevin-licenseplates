# Dependencies
- QBCore
- qb-inventory/lj-inventory
- oxmysql

------------------------------------------------------------------------------------

* Add the images from the images file into your inventory html images
* Add the below lines into your qb-core>shared>item.lua at the bottom
```lua
	['licenseplate'] 				 = {['name'] = 'licenseplate', 			  	  	['label'] = 'License Plate', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'licenseplate.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
```

* Navigate to your inventory >server > main.lua and paste the following around lines 1550-1579 the lines may vary on your inventory but look for the similarities in the snippets
```lua
	elseif itemData["name"] == "licenseplate" then
		info.plate = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(2))
```
* Navigate to the html > js > app.js and paste the following snippet
```lua
	} else if (itemData.name == "licenseplate") {
		$(".item-info-title").html('<p>' + itemData.label + '</p>')
		$(".item-info-description").html('<p><strong>Plate Number: </strong><span>'+ itemData.info.plate);
```
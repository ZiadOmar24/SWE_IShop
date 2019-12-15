package Controllers;

import Models.ItemSpecsModel;

//This class handles requests from users, it is responsible for rendering a response
///with the aid of the ItemSpecsView and ItemSpecsController.
public class ItemSpecsController {
	/// Constructor
	public ItemSpecsController() {

	}
	/// Method to add itemSpecs
	public void addItemSpecs(String name, String category) {
		new ItemSpecsModel.addItemSpecs(name, category);
	}
}

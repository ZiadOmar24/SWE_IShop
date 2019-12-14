package Controllers;

import Models.BrandModel;

///This class handles requests from users, it is responsible for rendering a response
///with the aid of the BrandView and BrandModel.
public class BrandController {
	/// Constructor
	public BrandController() {}
	
	/// Method that adds new brand.
	public void addBrand(String Name, String Category) {
		new BrandModel().addBrand(Name, Category);;
	}

}

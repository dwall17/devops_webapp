import falcon

class HelloResource(object):
    def on_get(self, req, resp):
        resp.status = falcon.HTTP_200
        resp.text = ("Hello, World!")

class GoodKittyImage:
    def on_get(self, req, resp):
        """Handles GET requests and returns a PNG image"""
        image_path = "images/good_kitty.png"

        # Read the image file in binary mode
        with open(image_path, "rb") as img_file:
            resp.data = img_file.read()
            resp.content_type = "image/png"
            resp.status = falcon.HTTP_200

class BadKittyImage:
    def on_get(self, req, resp):
        """Handles GET requests and returns a PNG image"""
        image_path = "images/bad_kitty.png"

        # Read the image file in binary mode
        with open(image_path, "rb") as img_file:
            resp.data = img_file.read()
            resp.content_type = "image/png"
            resp.status = falcon.HTTP_200

app = falcon.App()

hello = HelloResource() # "hello, world text"

good_kitty_image = GoodKittyImage() # handler for the good_kitty image
bad_kitty_image = BadKittyImage() # handler for the bad_kitty image

app.add_route('/', hello)
app.add_route('/goodkitty', good_kitty_image)
app.add_route('/badkitty', bad_kitty_image)

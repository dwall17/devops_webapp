import falcon

class HelloResource(object):
    def on_get(self, req, resp):
        resp.status = falcon.HTTP_200
        resp.text = ("Hello, World!")

class Page2Resource(object):
    def on_get(self, req, resp):
        resp.status = falcon.HTTP_200
        resp.text = ("This is the second page!")

app = falcon.App()

hello = HelloResource()

page2 = Page2Resource()

app.add_route('/', hello)
app.add_route('/page2', page2)

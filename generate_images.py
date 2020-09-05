import os

def render(posts):
    class Image:
        def __init__(self, image_path):
            self.image_path = image_path.lstrip(".")
            self.alt = os.path.basename(image_path)
            self.thumb = self.create_alt_name(image_path)

        def create_alt_name(self, image_path):
            foldername = os.path.dirname(image_path)
            filename = os.path.basename(image_path)

            return os.path.join(foldername, "thumbnails", filename)

        def __str__(self):
            # Sample:
            # [![Alt](/images/posts/2020/2020-06-14-Day-11-Progress-with-Circuit-Python/thumbnails/solder_close_up.jpg)](/images/posts/2020/2020-06-14-Day-11-Progress-with-Circuit-Python/solder_close_up.jpg)

            markdown = f"[![{self.alt}]({self.thumb})]({self.image_path})"

            # Jekyll's markdown wants paths to be linux friendly 
            return markdown.replace("\\", "/")


    print ("This page will contain every image uploaded this year.")
    print ("It's mostly useful for copy/pasting the markdown to another post.")
    print ()

    for post in posts:
        print(f"## {post}")

        for image_path in posts[post]:
            image = Image(image_path)

            print (f"{image}")

        print()

def find_posts(path):
    def root_to_directory_name(root):
        x = os.path.join(root, "") # Forces a trailing \ or / depending on the OS
        return os.path.basename(os.path.dirname(x)) 

    def process_folder(root, files):
        if root.endswith("thumbnails"): 
            return None

        images = []
        for image in files:
            full_path = os.path.join(root, image)
            images.append(full_path)

        return images
        

    posts = {}
    for root, dirs, files in os.walk(path):
        images = process_folder(root, files)

        if images:
            relative_folder = root_to_directory_name(root)
            posts[relative_folder] = images
    return posts

path = os.path.join("images", "posts", "2020")
posts = find_posts(path)

render(posts)

from flask import Flask, render_template, request

app = Flask(__name__)

recipes = []

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/add_recipe', methods=['GET', 'POST'])
def add_recipe():
    if request.method == 'POST':
        name = request.form['name']
        ingredients = request.form['ingredients']
        instructions = request.form['instructions']
        recipe = {
            'name': name,
            'ingredients': ingredients,
            'instructions': instructions
        }
        recipes.append(recipe)
        return render_template('success.html')
    return render_template('add_recipe.html')

@app.route('/view_recipes')
def view_recipes():
    return render_template('view_recipes.html', recipes=recipes)

if __name__ == '__main__':
    app.run(debug=True)

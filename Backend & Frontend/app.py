from flask import Flask, request, render_template, redirect, url_for, session, flash, jsonify
import mysql.connector
from mysql.connector import Error
from datetime import datetime
import hashlib

app = Flask(__name__)
app.secret_key = 'your_secret_key'

# MySQL connection details
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'kodikos tou root gia tin mysql',
    'database': 'libertaliadb'
}

#Route for the first page
@app.route('/')
def home():
    return render_template('welcome.html')

# Route to log out
@app.route('/logout')
def logout():
    session.clear()  # Clear all session data
    return redirect(url_for('home'))  # Redirect to the home page

# Route for signup as engager
@app.route('/signup_as_engager', methods=['GET', 'POST'])
def signup_as_engager():
    connection = None
    message = None
    if request.method == 'POST':
        Email = request.form['Email']
        Password = request.form['Password']
        Fullname = request.form['Fullname']
        Birthdate = request.form['Birthdate']
        Nationality = request.form['Nationality']
        Sex = request.form['Sex']
        Registration_Date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        hash_object = hashlib.sha1(Password.encode())
        hash_password = hash_object.hexdigest()

        try:
            connection = mysql.connector.connect(**db_config)
            cursor = connection.cursor()
            query = "INSERT INTO engager (Email, Password, Fullname, Birthdate, Nationality, Sex, Registration_Date) VALUES (%s, %s, %s, %s, %s, %s,%s)"
            cursor.execute(query, (Email, hash_password, Fullname, Birthdate, Nationality, Sex, Registration_Date))
            connection.commit()
            message = 'Signed up successfully! Rediracting...'
            
        except Error as e:
            message = f'Error: {e}'
        finally:
            if connection and connection.is_connected():
                cursor.close()
                connection.close()
    return render_template('signup_as_eng.html', message=message)

# Route for signup as journalist
@app.route('/signup_as_journalist', methods=['GET', 'POST'])
def signup_as_journalist():
    connection = None
    message = None
    if request.method == 'POST':
        Email = request.form['Email']
        Password = request.form['Password']
        Fullname = request.form['Fullname']
        Birthdate = request.form['Birthdate']
        Nationality = request.form['Nationality']
        Sex = request.form['Sex']
        Specialization_Field = request.form['Specialization_Field']
        Registration_Date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        Journalist_License = request.form['Journalist_License']

        hash_object = hashlib.sha1(Password.encode())
        hash_password = hash_object.hexdigest()

        try:
            connection = mysql.connector.connect(**db_config)
            cursor = connection.cursor()

            # First query: Insert into journalist table
            journalist_query = """
            INSERT INTO journalist 
            (Email, Password, Fullname, Birthdate, Nationality, Sex, Registration_Date, Specialization_Field) 
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """
            cursor.execute(journalist_query, (Email, hash_password, Fullname, Birthdate, Nationality, Sex, Registration_Date, Specialization_Field))
            
            # Second query: Insert into journalist_license table
            license_query = """
            INSERT INTO journalist_license (JEmail, Journalist_License) 
            VALUES (%s, %s)
            """
            cursor.execute(license_query, (Email, Journalist_License))

            # Commit both queries
            connection.commit()
            message = 'Signed up successfully! Rediracting...'
        except Error as e:
            message = f'Error: {e}'
        finally:
            if connection and connection.is_connected():
                cursor.close()
                connection.close()
    return render_template('signup_as_journ.html', message=message)

# Route for signin as engager
@app.route('/signin_as_engager', methods=['GET', 'POST'])
def signin_as_engager():
    connection = None
    message = None
    if request.method == 'POST':
        Email = request.form['Email']
        Password = request.form['Password']

        hash_object = hashlib.sha1(Password.encode())
        hash_Password = hash_object.hexdigest()  # Returns the 40-character hash
        
        try:
            connection = mysql.connector.connect(**db_config)
            cursor = connection.cursor(dictionary=True)############
            query = "SELECT Email, Fullname, Sex FROM engager WHERE Email=%s AND Password=%s"
            cursor.execute(query, (Email, hash_Password))
            user = cursor.fetchone()
            if user:
                session['userid'] = user['Email']  # Store user ID (email) in session
                session['Fullname'] = user['Fullname']  # Store fullname in session
                session['is_journalist'] = False  # Engager is not a journalist
                session['Sex'] = user['Sex']  # Engager Sex
                return redirect(url_for('homepage'))
            else:
                message = 'Invalid Email or Password.'
        except Error as e:
            message = f'Error: {e}'
        finally:
            if connection and connection.is_connected():
                cursor.close()
                connection.close()
    return render_template('signin_as_eng.html', message=message)

# Route for signin as Journalist
@app.route('/signin_as_journalist', methods=['GET', 'POST'])
def signin_as_journalist():
    connection = None
    message = None
    if request.method == 'POST':
        Email = request.form['Email']
        Password = request.form['Password']

        hash_object = hashlib.sha1(Password.encode())
        hash_Password = hash_object.hexdigest()  # Returns the 40-character hash

        try:
            connection = mysql.connector.connect(**db_config)
            cursor = connection.cursor(dictionary=True)
            query = "SELECT Email, Fullname, Sex FROM journalist WHERE Email=%s AND Password=%s"
            cursor.execute(query, (Email, hash_Password))
            user = cursor.fetchone()
            if user:
                session['userid'] = user['Email']  # Store user ID (email) in session
                session['Fullname'] = user['Fullname']  # Store fullname in session
                session['is_journalist'] = True  # Journalist role
                session['Sex'] = user['Sex']  # Journalist Sex
                return redirect(url_for('homepage'))
            else:
                message = 'Invalid Email or Password.'
        except Error as e:
            message = f'Error: {e}'
        finally:
            if connection and connection.is_connected():
                cursor.close()
                connection.close()
    return render_template('signin_as_journ.html', message=message)

# Route for homepage
@app.route('/homepage', methods=['GET'])
def homepage():
    if 'userid' not in session:
        return redirect(url_for('/'))
    
    post = []  # List to hold all posts
    hashtag = []  # List to hold all hashtags
    comment = [] # List to hold all comments
    reference = [] #List which connects posts and hashtags
    try:
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor(dictionary=True)


        # Fetch all posts with likes, dislikes and journalist's info
        query_posts = """
            SELECT post.*, journalist.Fullname, journalist.Sex,
            COALESCE(likes_per_post.NumLikes, 0) AS NumLikes,
            COALESCE(dislikes_per_post.NumLikes, 0) AS NumDislikes
            FROM post
            JOIN journalist ON post.JEmail = journalist.Email
            LEFT JOIN likes_per_post ON post.JEmail = likes_per_post.JEmail AND post.PostDate = likes_per_post.Post_Date
            LEFT JOIN dislikes_per_post ON post.JEmail = dislikes_per_post.JEmail AND post.PostDate = dislikes_per_post.Post_Date
            ORDER BY post.PostDate DESC
            """
        post = cursor.execute(query_posts)
        post = cursor.fetchall()
        if not post:
            flash('No posts found in the database.', 'info')


        # Fetch all hashtags
        query_hashtag = """
            SELECT *
            FROM hashtag  
            ORDER BY Text ASC
        """
        hashtag = cursor.execute(query_hashtag)
        hashtag = cursor.fetchall()
        if not post:
            flash('No posts found in the database.', 'info')


        # Fetch all comments
        query_comments = """
            SELECT *
            FROM comment
            JOIN engager
            ON comment.Commenter = engager.Email
            ORDER BY Comment_Date DESC
        """
        comment = cursor.execute(query_comments)
        comment = cursor.fetchall()
        if not comment:
            flash('No comments found in the database.', 'info')


        # Fetch all references
        query_reference = """   
            SELECT *    
            FROM reference
            """
        reference = cursor.execute(query_reference)
        reference = cursor.fetchall()

            
    except Error as e:
        flash(f'Error: {e}', 'danger')
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
    
    return render_template('homepage.html', post=post, hashtag=hashtag, comment=comment, reference=reference)

#Route to add post
@app.route('/add_post', methods=['GET', 'POST'])
def add_post():
    if 'userid' not in session or not session.get('is_journalist'):
        return redirect(url_for('/'))
    
    all_hashtags = []

    message = None
    if request.method == 'POST':
        Post_Text = request.form['Post_Text']
        PostDate = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        Journalist_Email = session['userid']

        hashtags_in_post = request.form.getlist('hashtags_in_post')  

        try:
            connection = mysql.connector.connect(**db_config)
            cursor = connection.cursor()

            # Fetch all hashtags
            query_hashtags = """
                SELECT *
                FROM hashtag
                ORDER BY Text ASC
            """
            all_hashtags = cursor.execute(query_hashtags)
            all_hashtags = cursor.fetchall()
            if not all_hashtags:
                flash('No hashtags found in the database.', 'info')
            
            # Insert into 'post' table
            query = "INSERT INTO post (Post_Text, PostDate, JEmail) VALUES (%s, %s, %s)"
            cursor.execute(query, (Post_Text, PostDate, Journalist_Email))
            connection.commit()

            # Insert in references
            if hashtags_in_post:
                query_reference = "INSERT INTO reference (JEmail, Post_Date, Text) VALUES (%s, %s, %s)"
                for h in hashtags_in_post:
                    cursor.execute(query_reference, (Journalist_Email, PostDate, h))
                connection.commit()

            message = 'Post created successfully! Rediracting...'
        except Error as e:
            message = f'Error: {e}'
        finally:
            if connection and connection.is_connected():
                cursor.close()
                connection.close()

    return render_template('add_post.html', message=message, all_hashtags=all_hashtags)

# Route to react to posts
@app.route('/react', methods=['POST'])
def react():
    if 'userid' not in session or session.get('is_journalist'):
        flash("Unauthorized access to react.", "danger")
        return redirect(url_for('homepage'))

    Reactioner = session['userid']
    JEmail = request.form['JEmail']
    Post_Date = request.form['Post_Date']
    Reaction_Type = int(request.form['Reaction_Type'])  # 1 for like, 0 for dislike
    Reaction_Date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    try:
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()

        # Check if the reaction already exists
        query_check = """
            SELECT * FROM reaction WHERE Reactioner=%s AND JEmail=%s AND Post_Date=%s
        """
        cursor.execute(query_check, (Reactioner, JEmail, Post_Date))
        existing_reaction = cursor.fetchone()
        
        if existing_reaction:
            query_update = """
                UPDATE reaction 
                SET Reaction_Type=%s, Reaction_Date=%s 
                WHERE Reactioner=%s AND JEmail=%s AND Post_Date=%s
            """
            cursor.execute(query_update, (Reaction_Type, Reaction_Date, Reactioner, JEmail, Post_Date))
        else:
            query_insert = """
                INSERT INTO reaction (Reactioner, JEmail, Post_Date, Reaction_Type, Reaction_Date) 
                VALUES (%s, %s, %s, %s, %s)
            """
            cursor.execute(query_insert, (Reactioner, JEmail, Post_Date, Reaction_Type, Reaction_Date))

        connection.commit()
        flash('Reaction recorded successfully!', 'success')
    except Error as e:
        flash(f'Error: {e}', 'danger')
        print(f"Database error: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
    return redirect(url_for('homepage'))


# Route to react to create comment
@app.route('/add_comment', methods=['POST'])
def add_comment():
    if 'userid' not in session or session.get('is_journalist'):
        flash("Unauthorized access to comment.", "danger")
        return redirect(url_for('homepage'))
    

    Commenter = session['userid']
    JEmail = request.form['JEmail']
    Post_Date = request.form['Post_Date']
    Comment_Text = request.form['Comment_Text']
    Comment_Date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    try:
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()

        query_insert = """
            INSERT INTO comment (Commenter, JEmail, Post_Date, Comment_Text, Comment_Date) 
            VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(query_insert, (Commenter, JEmail, Post_Date, Comment_Text, Comment_Date))

        connection.commit()
        flash('Comment recorded successfully!', 'success')
    except Error as e:
        flash(f'Error: {e}', 'danger')
        print(f"Database error: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
    return redirect(url_for('homepage'))


# Route to add a hashtag
@app.route('/add_hashtag', methods=['POST'])
def add_hashtag():
    if 'userid' not in session:
        return redirect(url_for('/'))

    Text = request.form['Text']

    try:
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()

        query_insert = """
            INSERT INTO hashtag (Text) 
            VALUES (%s)
        """
        cursor.execute(query_insert, (Text,))

        connection.commit()
        flash('Text recorded successfully!', 'success')
    except Error as e:
        flash(f'Error: {e}', 'danger')
        print(f"Database error: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
    return redirect(url_for('homepage'))

    
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, debug=True)

from flask import Flask, render_template, request, redirect, url_for
from db import get_connection

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/tables')
def show_tables():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("SHOW FULL TABLES")
    results = cursor.fetchall()

    tables = []
    views = []

    for row in results:
        if row[1] == 'BASE TABLE':
            tables.append({'name': row[0]})
        elif row[1] == 'VIEW':
            views.append({'name': row[0]})

    cursor.close()
    conn.close()

    return render_template(
        'tables.html',
        tables=tables,
        views=views
    )

@app.route('/books')
def show_books():
    search = request.args.get('search', '')

    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT * FROM Books
        WHERE title LIKE %s OR author LIKE %s
    """, ('%' + search + '%', '%' + search + '%'))

    books = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('books.html', books=books)



@app.route('/members')
def show_members():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Members")
    members = cursor.fetchall()
    cursor.close()
    conn.close()

    return render_template('members.html', members=members)


@app.route('/librarians')
def show_librarians():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Librarians")
    librarians = cursor.fetchall()
    cursor.close()
    conn.close()

    return render_template('librarians.html', librarians=librarians)

@app.route('/borrow-records')
def show_borrow_records():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Borrow_records")
    records = cursor.fetchall()
    cursor.close()
    conn.close()

    return render_template('borrow_records.html', records=records)

@app.route('/reservations')
def show_reservations():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Reservations")
    reservations = cursor.fetchall()
    cursor.close()
    conn.close()

    return render_template('reservations.html', reservations=reservations)

@app.route('/add-book', methods=['GET', 'POST'])
def add_book():
    if request.method == 'POST':
        title = request.form['title']
        author = request.form['author']
        publisher = request.form['publisher']
        category = request.form['category']
        price = request.form['price']
        availability_status = request.form['availability_status']

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT COALESCE(MAX(book_id), 0) + 1 FROM Books")
        next_book_id = cursor.fetchone()[0]

        query = """
        INSERT INTO Books
        (book_id, title, author, publisher, category, price,
         availability_status, date_added)
        VALUES (%s, %s, %s, %s, %s, %s, %s, CURDATE())
        """

        cursor.execute(query, (
            next_book_id, title, author, publisher,
            category, price, availability_status
        ))

        conn.commit()
        cursor.close()
        conn.close()

        return redirect(url_for('show_books'))

    return render_template('add_book.html')

@app.route('/add-member', methods=['GET', 'POST'])
def add_member():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        address = request.form['address']

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute(
            "SELECT COALESCE(MAX(member_id), 0) + 1 FROM Members"
        )
        next_member_id = cursor.fetchone()[0]

        query = """
        INSERT INTO Members
        (member_id, name, email, phone, address, membership_date)
        VALUES (%s, %s, %s, %s, %s, CURDATE())
        """

        cursor.execute(query, (
            next_member_id, name, email, phone, address
        ))

        conn.commit()
        cursor.close()
        conn.close()

        return redirect(url_for('show_members'))

    return render_template('add_member.html')


@app.route('/delete-member/<int:member_id>', methods=['POST'])
def delete_member(member_id):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute(
        "SELECT COUNT(*) FROM Borrow_records WHERE member_id=%s",
        (member_id,)
    )
    borrow_count = cursor.fetchone()[0]

    if borrow_count == 0:
        cursor.execute(
            "DELETE FROM Members WHERE member_id=%s",
            (member_id,)
        )
        conn.commit()
        message = "Member deleted successfully."
    else:
        message = "Cannot delete member because borrowing history exists."

    cursor.close()
    conn.close()

    return message

@app.route('/edit-book/<int:book_id>', methods=['GET', 'POST'])
def edit_book(book_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    if request.method == 'POST':
        title = request.form['title']
        author = request.form['author']
        publisher = request.form['publisher']
        category = request.form['category']
        price = request.form['price']
        availability_status = request.form['availability_status']

        cursor.execute("""
            UPDATE Books
            SET title=%s, author=%s, publisher=%s,
                category=%s, price=%s, availability_status=%s
            WHERE book_id=%s
        """, (title, author, publisher, category,
              price, availability_status, book_id))

        conn.commit()
        cursor.close()
        conn.close()

        return redirect(url_for('show_books'))

    cursor.execute("SELECT * FROM Books WHERE book_id=%s", (book_id,))
    book = cursor.fetchone()

    cursor.close()
    conn.close()

    return render_template('edit_book.html', book=book)

@app.route('/edit-member/<int:member_id>', methods=['GET', 'POST'])
def edit_member(member_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        address = request.form['address']

        cursor.execute("""
            UPDATE Members
            SET name=%s, email=%s, phone=%s, address=%s
            WHERE member_id=%s
        """, (name, email, phone, address, member_id))

        conn.commit()
        cursor.close()
        conn.close()

        return redirect(url_for('show_members'))

    cursor.execute(
        "SELECT * FROM Members WHERE member_id=%s",
        (member_id,)
    )
    member = cursor.fetchone()

    cursor.close()
    conn.close()

    return render_template('edit_member.html', member=member)
@app.route('/delete-borrow-record/<int:borrow_id>', methods=['POST'])
def delete_borrow_record(borrow_id):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute(
        "DELETE FROM Borrow_records WHERE borrow_id=%s AND status='Returned'",
        (borrow_id,)
    )

    conn.commit()
    cursor.close()
    conn.close()

    return redirect(url_for('show_borrow_records'))

@app.route('/global-search')
def global_search():
    search = request.args.get('search', '')

    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    pattern = '%' + search + '%'

    cursor.execute("""
        SELECT * FROM Books
        WHERE title LIKE %s OR author LIKE %s
    """, (pattern, pattern))
    books = cursor.fetchall()

    cursor.execute("""
        SELECT * FROM Members
        WHERE name LIKE %s OR email LIKE %s
    """, (pattern, pattern))
    members = cursor.fetchall()

    cursor.execute("""
        SELECT * FROM Librarians
        WHERE name LIKE %s OR phone LIKE %s
    """, (pattern, pattern))
    librarians = cursor.fetchall()

    cursor.execute("""
        SELECT * FROM Borrow_records
        WHERE CAST(borrow_id AS CHAR) LIKE %s
        OR CAST(member_id AS CHAR) LIKE %s
        OR CAST(book_id AS CHAR) LIKE %s
        OR status LIKE %s
    """, (pattern, pattern, pattern, pattern))
    records = cursor.fetchall()

    cursor.execute("""
        SELECT * FROM Reservations
        WHERE CAST(reservation_id AS CHAR) LIKE %s
        OR CAST(member_id AS CHAR) LIKE %s
        OR CAST(book_id AS CHAR) LIKE %s
    """, (pattern, pattern, pattern))
    reservations = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template(
        'search_results.html',
        search=search,
        books=books,
        members=members,
        librarians=librarians,
        records=records,
        reservations=reservations
    )

@app.route('/dashboard')
def dashboard():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT COUNT(*) FROM Books")
    total_books = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(*) FROM Members")
    total_members = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(*) FROM Librarians")
    total_librarians = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(*) FROM Borrow_records")
    total_borrow_records = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(*) FROM Reservations")
    total_reservations = cursor.fetchone()[0]

    cursor.execute("""
        SELECT COUNT(*) FROM Borrow_records
        WHERE status = 'Borrowed'
    """)
    borrowed_books = cursor.fetchone()[0]

    cursor.close()
    conn.close()

    return render_template(
        'dashboard.html',
        total_books=total_books,
        total_members=total_members,
        total_librarians=total_librarians,
        total_borrow_records=total_borrow_records,
        total_reservations=total_reservations,
        borrowed_books=borrowed_books
    )

if __name__ == '__main__':
    app.run(debug=True)
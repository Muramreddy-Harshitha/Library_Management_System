-- create database
create database LibraryManagement;

-- use database
use LibraryManagement;

-- create table books
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    publisher VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    availability_status VARCHAR(20),
    date_added DATE
);

-- create table members
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255),
    membership_date DATE
);

-- create table librarians
CREATE TABLE Librarians (
    librarian_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    joining_date DATE
);

-- create table borrow_records
CREATE TABLE Borrow_Records (
    borrow_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    librarian_id INT,
    borrow_date DATE,
    return_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (librarian_id) REFERENCES Librarians(librarian_id)
);

-- create table reservations
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    reservation_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- insert data into books table
INSERT INTO Books (book_id, title, author, publisher, category, price, availability_status, date_added) VALUES
(1, 'Fiction Book 001', 'A. Sharma', 'Penguin', 'Fiction', 253.50, 'Available', '2023-01-03'),
(2, 'Science Book 002', 'R. Kumar', 'HarperCollins', 'Science', 327.00, 'Available', '2024-02-06'),
(3, 'Technology Book 003', 'S. Reddy', 'Oxford Press', 'Technology', 399.00, 'Available', '2025-03-09'),
(4, 'History Book 004', 'P. Mehta', 'Pearson', 'History', 472.50, 'Borrowed', '2026-04-12'),
(5, 'Biography Book 005', 'K. Rao', 'Scholastic', 'Biography', 546.00, 'Available', '2022-05-15'),
(6, 'Mystery Book 006', 'M. Iyer', 'Rupa Publications', 'Mystery', 618.00, 'Available', '2023-06-18'),
(7, 'Education Book 007', 'N. Das', 'Sage', 'Education', 691.50, 'Available', '2024-07-21'),
(8, 'Fantasy Book 008', 'V. Patel', 'McGraw Hill', 'Fantasy', 765.00, 'Borrowed', '2025-08-24'),
(9, 'Business Book 009', 'L. Singh', 'Penguin', 'Business', 837.00, 'Available', '2026-09-27'),
(10, 'Self-Help Book 010', 'D. Thomas', 'HarperCollins', 'Self-Help', 910.50, 'Available', '2022-10-03'),
(11, 'Fiction Book 011', 'A. Sharma', 'Oxford Press', 'Fiction', 984.00, 'Available', '2023-11-06'),
(12, 'Science Book 012', 'R. Kumar', 'Pearson', 'Science', 1056.00, 'Borrowed', '2024-12-09'),
(13, 'Technology Book 013', 'S. Reddy', 'Scholastic', 'Technology', 1129.50, 'Available', '2025-01-12'),
(14, 'History Book 014', 'P. Mehta', 'Rupa Publications', 'History', 253.00, 'Available', '2026-02-15'),
(15, 'Biography Book 015', 'K. Rao', 'Sage', 'Biography', 325.00, 'Available', '2022-03-18'),
(16, 'Mystery Book 016', 'M. Iyer', 'McGraw Hill', 'Mystery', 398.50, 'Borrowed', '2023-04-21'),
(17, 'Education Book 017', 'N. Das', 'Penguin', 'Education', 472.00, 'Available', '2024-05-24'),
(18, 'Fantasy Book 018', 'V. Patel', 'HarperCollins', 'Fantasy', 544.00, 'Available', '2025-06-27'),
(19, 'Business Book 019', 'L. Singh', 'Oxford Press', 'Business', 617.50, 'Available', '2026-07-03'),
(20, 'Self-Help Book 020', 'D. Thomas', 'Pearson', 'Self-Help', 691.00, 'Borrowed', '2022-08-06'),
(21, 'Fiction Book 021', 'A. Sharma', 'Scholastic', 'Fiction', 763.00, 'Available', '2023-09-09'),
(22, 'Science Book 022', 'R. Kumar', 'Rupa Publications', 'Science', 836.50, 'Available', '2024-10-12'),
(23, 'Technology Book 023', 'S. Reddy', 'Sage', 'Technology', 910.00, 'Available', '2025-11-15'),
(24, 'History Book 024', 'P. Mehta', 'McGraw Hill', 'History', 982.00, 'Borrowed', '2026-12-18'),
(25, 'Biography Book 025', 'K. Rao', 'Penguin', 'Biography', 1055.50, 'Available', '2022-01-21'),
(26, 'Mystery Book 026', 'M. Iyer', 'HarperCollins', 'Mystery', 1129.00, 'Available', '2023-02-24'),
(27, 'Education Book 027', 'N. Das', 'Oxford Press', 'Education', 251.00, 'Available', '2024-03-27'),
(28, 'Fantasy Book 028', 'V. Patel', 'Pearson', 'Fantasy', 324.50, 'Borrowed', '2025-04-03'),
(29, 'Business Book 029', 'L. Singh', 'Scholastic', 'Business', 398.00, 'Available', '2026-05-06'),
(30, 'Self-Help Book 030', 'D. Thomas', 'Rupa Publications', 'Self-Help', 470.00, 'Available', '2022-06-09'),
(31, 'Fiction Book 031', 'A. Sharma', 'Sage', 'Fiction', 543.50, 'Available', '2023-07-12'),
(32, 'Science Book 032', 'R. Kumar', 'McGraw Hill', 'Science', 617.00, 'Borrowed', '2024-08-15'),
(33, 'Technology Book 033', 'S. Reddy', 'Penguin', 'Technology', 689.00, 'Available', '2025-09-18'),
(34, 'History Book 034', 'P. Mehta', 'HarperCollins', 'History', 762.50, 'Available', '2026-10-21'),
(35, 'Biography Book 035', 'K. Rao', 'Oxford Press', 'Biography', 836.00, 'Available', '2022-11-24'),
(36, 'Mystery Book 036', 'M. Iyer', 'Pearson', 'Mystery', 908.00, 'Borrowed', '2023-12-27'),
(37, 'Education Book 037', 'N. Das', 'Scholastic', 'Education', 981.50, 'Available', '2024-01-03'),
(38, 'Fantasy Book 038', 'V. Patel', 'Rupa Publications', 'Fantasy', 1055.00, 'Available', '2025-02-06'),
(39, 'Business Book 039', 'L. Singh', 'Sage', 'Business', 1127.00, 'Available', '2026-03-09'),
(40, 'Self-Help Book 040', 'D. Thomas', 'McGraw Hill', 'Self-Help', 250.50, 'Borrowed', '2022-04-12'),
(41, 'Fiction Book 041', 'A. Sharma', 'Penguin', 'Fiction', 324.00, 'Available', '2023-05-15'),
(42, 'Science Book 042', 'R. Kumar', 'HarperCollins', 'Science', 396.00, 'Available', '2024-06-18'),
(43, 'Technology Book 043', 'S. Reddy', 'Oxford Press', 'Technology', 469.50, 'Available', '2025-07-21'),
(44, 'History Book 044', 'P. Mehta', 'Pearson', 'History', 543.00, 'Borrowed', '2026-08-24'),
(45, 'Biography Book 045', 'K. Rao', 'Scholastic', 'Biography', 615.00, 'Available', '2022-09-27'),
(46, 'Mystery Book 046', 'M. Iyer', 'Rupa Publications', 'Mystery', 688.50, 'Available', '2023-10-03'),
(47, 'Education Book 047', 'N. Das', 'Sage', 'Education', 762.00, 'Available', '2024-11-06'),
(48, 'Fantasy Book 048', 'V. Patel', 'McGraw Hill', 'Fantasy', 834.00, 'Borrowed', '2025-12-09'),
(49, 'Business Book 049', 'L. Singh', 'Penguin', 'Business', 907.50, 'Available', '2026-01-12'),
(50, 'Self-Help Book 050', 'D. Thomas', 'HarperCollins', 'Self-Help', 981.00, 'Available', '2022-02-15'),
(51, 'Fiction Book 051', 'A. Sharma', 'Oxford Press', 'Fiction', 1053.00, 'Available', '2023-03-18'),
(52, 'Science Book 052', 'R. Kumar', 'Pearson', 'Science', 1126.50, 'Borrowed', '2024-04-21'),
(53, 'Technology Book 053', 'S. Reddy', 'Scholastic', 'Technology', 250.00, 'Available', '2025-05-24'),
(54, 'History Book 054', 'P. Mehta', 'Rupa Publications', 'History', 322.00, 'Available', '2026-06-27'),
(55, 'Biography Book 055', 'K. Rao', 'Sage', 'Biography', 395.50, 'Available', '2022-07-03'),
(56, 'Mystery Book 056', 'M. Iyer', 'McGraw Hill', 'Mystery', 469.00, 'Borrowed', '2023-08-06'),
(57, 'Education Book 057', 'N. Das', 'Penguin', 'Education', 541.00, 'Available', '2024-09-09'),
(58, 'Fantasy Book 058', 'V. Patel', 'HarperCollins', 'Fantasy', 614.50, 'Available', '2025-10-12'),
(59, 'Business Book 059', 'L. Singh', 'Oxford Press', 'Business', 688.00, 'Available', '2026-11-15'),
(60, 'Self-Help Book 060', 'D. Thomas', 'Pearson', 'Self-Help', 760.00, 'Borrowed', '2022-12-18'),
(61, 'Fiction Book 061', 'A. Sharma', 'Scholastic', 'Fiction', 833.50, 'Available', '2023-01-21'),
(62, 'Science Book 062', 'R. Kumar', 'Rupa Publications', 'Science', 907.00, 'Available', '2024-02-24'),
(63, 'Technology Book 063', 'S. Reddy', 'Sage', 'Technology', 979.00, 'Available', '2025-03-27'),
(64, 'History Book 064', 'P. Mehta', 'McGraw Hill', 'History', 1052.50, 'Borrowed', '2026-04-03'),
(65, 'Biography Book 065', 'K. Rao', 'Penguin', 'Biography', 1126.00, 'Available', '2022-05-06'),
(66, 'Mystery Book 066', 'M. Iyer', 'HarperCollins', 'Mystery', 248.00, 'Available', '2023-06-09'),
(67, 'Education Book 067', 'N. Das', 'Oxford Press', 'Education', 321.50, 'Available', '2024-07-12'),
(68, 'Fantasy Book 068', 'V. Patel', 'Pearson', 'Fantasy', 395.00, 'Borrowed', '2025-08-15'),
(69, 'Business Book 069', 'L. Singh', 'Scholastic', 'Business', 467.00, 'Available', '2026-09-18'),
(70, 'Self-Help Book 070', 'D. Thomas', 'Rupa Publications', 'Self-Help', 540.50, 'Available', '2022-10-21'),
(71, 'Fiction Book 071', 'A. Sharma', 'Sage', 'Fiction', 614.00, 'Available', '2023-11-24'),
(72, 'Science Book 072', 'R. Kumar', 'McGraw Hill', 'Science', 686.00, 'Borrowed', '2024-12-27'),
(73, 'Technology Book 073', 'S. Reddy', 'Penguin', 'Technology', 759.50, 'Available', '2025-01-03'),
(74, 'History Book 074', 'P. Mehta', 'HarperCollins', 'History', 833.00, 'Available', '2026-02-06'),
(75, 'Biography Book 075', 'K. Rao', 'Oxford Press', 'Biography', 905.00, 'Available', '2022-03-09'),
(76, 'Mystery Book 076', 'M. Iyer', 'Pearson', 'Mystery', 978.50, 'Borrowed', '2023-04-12'),
(77, 'Education Book 077', 'N. Das', 'Scholastic', 'Education', 1052.00, 'Available', '2024-05-15'),
(78, 'Fantasy Book 078', 'V. Patel', 'Rupa Publications', 'Fantasy', 1124.00, 'Available', '2025-06-18'),
(79, 'Business Book 079', 'L. Singh', 'Sage', 'Business', 247.50, 'Available', '2026-07-21'),
(80, 'Self-Help Book 080', 'D. Thomas', 'McGraw Hill', 'Self-Help', 321.00, 'Borrowed', '2022-08-24'),
(81, 'Fiction Book 081', 'A. Sharma', 'Penguin', 'Fiction', 393.00, 'Available', '2023-09-27'),
(82, 'Science Book 082', 'R. Kumar', 'HarperCollins', 'Science', 466.50, 'Available', '2024-10-03'),
(83, 'Technology Book 083', 'S. Reddy', 'Oxford Press', 'Technology', 540.00, 'Available', '2025-11-06'),
(84, 'History Book 084', 'P. Mehta', 'Pearson', 'History', 612.00, 'Borrowed', '2026-12-09'),
(85, 'Biography Book 085', 'K. Rao', 'Scholastic', 'Biography', 685.50, 'Available', '2022-01-12'),
(86, 'Mystery Book 086', 'M. Iyer', 'Rupa Publications', 'Mystery', 759.00, 'Available', '2023-02-15'),
(87, 'Education Book 087', 'N. Das', 'Sage', 'Education', 831.00, 'Available', '2024-03-18'),
(88, 'Fantasy Book 088', 'V. Patel', 'McGraw Hill', 'Fantasy', 904.50, 'Borrowed', '2025-04-21'),
(89, 'Business Book 089', 'L. Singh', 'Penguin', 'Business', 978.00, 'Available', '2026-05-24'),
(90, 'Self-Help Book 090', 'D. Thomas', 'HarperCollins', 'Self-Help', 1050.00, 'Available', '2022-06-27'),
(91, 'Fiction Book 091', 'A. Sharma', 'Oxford Press', 'Fiction', 1123.50, 'Available', '2023-07-03'),
(92, 'Science Book 092', 'R. Kumar', 'Pearson', 'Science', 247.00, 'Borrowed', '2024-08-06'),
(93, 'Technology Book 093', 'S. Reddy', 'Scholastic', 'Technology', 319.00, 'Available', '2025-09-09'),
(94, 'History Book 094', 'P. Mehta', 'Rupa Publications', 'History', 392.50, 'Available', '2026-10-12'),
(95, 'Biography Book 095', 'K. Rao', 'Sage', 'Biography', 466.00, 'Available', '2022-11-15'),
(96, 'Mystery Book 096', 'M. Iyer', 'McGraw Hill', 'Mystery', 538.00, 'Borrowed', '2023-12-18'),
(97, 'Education Book 097', 'N. Das', 'Penguin', 'Education', 611.50, 'Available', '2024-01-21'),
(98, 'Fantasy Book 098', 'V. Patel', 'HarperCollins', 'Fantasy', 685.00, 'Available', '2025-02-24'),
(99, 'Business Book 099', 'L. Singh', 'Oxford Press', 'Business', 757.00, 'Available', '2026-03-27'),
(100, 'Self-Help Book 100', 'D. Thomas', 'Pearson', 'Self-Help', 830.50, 'Borrowed', '2022-04-03');

select * from books;

-- insert data into members
INSERT INTO Members (member_id, name, email, phone, address, membership_date) VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', '9756824641', '101, Hyderabad, Telangana', '2022-01-05'),
(2, 'Ananya Sharma', 'ananya@gmail.com', '9745367232', '102, Secunderabad, Telangana', '2023-02-10'),
(3, 'Arjun Sharma', 'arjun@gmail.com', '9779895053', '103, Madhapur, Hyderabad, Telangana', '2024-03-15'),
(4, 'Diya Sharma', 'diyasharma@gmail.com', '9777994544', '104, Kukatpally, Hyderabad, Telangana', '2025-04-20'),
(5, 'Ishaan Sharma', 'ishaan@gmail.com', '9734893095', '105, Miyapur, Hyderabad, Telangana', '2021-05-25'),
(6, 'Kavya Sharma', 'kavya@gmail.com', '9767893456', '106, Gachibowli, Hyderabad, Telangana', '2022-06-03'),
(7, 'Krishna Sharma', 'krishna@gmail.com', '9745343277', '107, Warangal, Telangana', '2023-07-08'),
(8, 'Meera Sharma', 'meerasharma@gmail.com', '9723450008', '108, Vijayawada, Telangana', '2024-08-13'),
(9, 'Neha Sharma', 'nehasharma@gmail.com', '9702345509', '109, Nizamabad, Telangana', '2025-09-18'),
(10, 'Rahul Sharma', 'rahul@gmail.com', '9745678910', '110, Karimnagar, Telangana', '2021-10-23'),
(11, 'Saanvi Sharma', 'saanvi@gmail.com', '9701234511', '111, Hyderabad, Telangana', '2022-11-01'),
(12, 'Sai Sharma', 'saisharma@gmail.com', '9745267312', '112, Secunderabad, Telangana', '2023-12-06'),
(13, 'Tara Sharma', 'tarasharma@gmail.com', '9712278901', '113, Madhapur, Hyderabad, Telangana', '2024-01-11'),
(14, 'Varun Sharma', 'varun43@gmail.com', '9776849414', '114, Kukatpally, Hyderabad, Telangana', '2025-02-16'),
(15, 'Aditi Sharma', 'aditi342@gmail.com', '9700768715', '115, Miyapur, Hyderabad, Telangana', '2021-03-21'),
(16, 'Rohan Sharma', 'rohan6@gmail.com', '9704567016', '116, Gachibowli, Hyderabad, Telangana', '2022-04-26'),
(17, 'Pooja Sharma', 'pooja35@gmail.com', '9706729817', '117, Warangal, Telangana', '2023-05-04'),
(18, 'Vikram Sharma', 'vikram@gmail.com', '9734567018', '118, Vijayawada, Telangana', '2024-06-09'),
(19, 'Nisha Sharma', 'nishasharma@gmail.com', '9712456719', '119, Nizamabad, Telangana', '2025-07-14'),
(20, 'Kiran Sharma', 'kiran20@gmail.com', '9798989820', '120, Karimnagar, Telangana', '2021-08-19'),
(21, 'Aarav Reddy', 'aarav345@gmail.com', '9700456721', '121, Hyderabad, Telangana', '2022-09-24'),
(22, 'Ananya Reddy', 'reddyananya@gmail.com', '9720987022', '122, Secunderabad, Telangana', '2023-10-02'),
(23, 'Arjun Reddy', 'arjunreddy023@gmail.com', '9707802923', '123, Madhapur, Hyderabad, Telangana', '2024-11-07'),
(24, 'Diya Reddy', 'diya674@gmail.com', '9700000024', '124, Kukatpally, Hyderabad, Telangana', '2025-12-12'),
(25, 'Ishaan Reddy', 'ishaan5@gmail.com', '9700000025', '125, Miyapur, Hyderabad, Telangana', '2021-01-17'),
(26, 'Karan', 'karunteja@gmail.com', '9700345626', '126, Gachibowli, Hyderabad, Telangana', '2022-02-22'),
(27, 'Kamala', 'kamala27@gmail.com', '9798978627', '127, Warangal, Telangana', '2023-03-27'),
(28, 'Meghana', 'meghana@gmail.com', '9700000028', '128, Vijayawada, Telangana', '2024-04-05'),
(29, 'Nikitha', 'nikitha9@gmail.com', '9700000029', '129, Nizamabad, Telangana', '2025-05-10'),
(30, 'Rahul Reddy', 'rahul030@gmail.com', '9700000030', '130, Karimnagar, Telangana', '2021-06-15'),
(31, 'Surya', 'surya1@gmail.com', '9779895031', '131, Hyderabad, Telangana', '2022-07-20'),
(32, 'Sai Reddy', 'sai032@gmail.com', '9700000032', '132, Secunderabad, Telangana', '2023-08-25'),
(33, 'Tarun', 'tarun033@gmail.com', '9700000033', '133, Madhapur, Hyderabad, Telangana', '2024-09-03'),
(34, 'Vennela', 'vennela34@gmail.com', '9707809834', '134, Kukatpally, Hyderabad, Telangana', '2025-10-08'),
(35, 'Aarya', 'aarya5@gmail.com', '9700000035', '135, Miyapur, Hyderabad, Telangana', '2021-11-13'),
(36, 'Rohan Reddy', 'rohan036@gmail.com', '9700000036', '136, Gachibowli, Hyderabad, Telangana', '2022-12-18'),
(37, 'Poojitha', 'poojitha@gmail.com', '9700000037', '137, Warangal, Telangana', '2023-01-23'),
(38, 'Vineel', 'vineel8@gmail.com', '9700090038', '138, Vijayawada, Telangana', '2024-02-01'),
(39, 'Nisha Reddy', 'reddynisha9@gmail.com', '9700000039', '139, Nizamabad, Telangana', '2025-03-06'),
(40, 'Kalyan Reddy', 'kalyan90@gmail.com', '9700000040', '140, Karimnagar, Telangana', '2021-04-11'),
(41, 'Aarav Kumar', 'aaravkumar@gmail.com', '9700000041', '141, Hyderabad, Telangana', '2022-05-16'),
(42, 'Ananya Kumar', 'ananya4657@gmail.com', '9702345642', '142, Secunderabad, Telangana', '2023-06-21'),
(43, 'Arjun Kumar', 'arjun11@gmail.com', '9700000043', '143, Madhapur, Hyderabad, Telangana', '2024-07-26'),
(44, 'Diyansh', 'diyansh@gmail.com', '9700000044', '144, Kukatpally, Hyderabad, Telangana', '2025-08-04'),
(45, 'Iran', 'iran45@gmail.com', '9712345425', '145, Miyapur, Hyderabad, Telangana', '2021-09-09'),
(46, 'Kartheek', 'kartheek6@gmail.com', '9701234046', '146, Gachibowli, Hyderabad, Telangana', '2022-10-14'),
(47, 'Karishma', 'karishma@gmail.com', '9700005547', '147, Warangal, Telangana', '2023-11-19'),
(48, 'Maithri', 'maithri@gmail.com', '9700000048', '148, Vijayawada, Telangana', '2024-12-24'),
(49, 'Naresh', 'naresh9@gmail.com', '9735674049', '149, Nizamabad, Telangana', '2025-01-02'),
(50, 'Ram Mohan', 'rammohan@gmail.com', '9876543210', '150, Karimnagar, Telangana', '2021-02-07'),
(51, 'Sasirekha', 'sasirekha@gmail.com', '9700000051', '151, Hyderabad, Telangana', '2022-03-12'),
(52, 'Srinadh', 'srinadh@gmail.com', '9700000052', '152, Secunderabad, Telangana', '2023-04-17'),
(53, 'Tamanna', 'tamanna@gmail.com', '7680893193', '153, Madhapur, Hyderabad, Telangana', '2024-05-22'),
(54, 'Varun Kumar', 'varun054@gmail.com', '9700000054', '154, Kukatpally, Hyderabad, Telangana', '2025-06-27'),
(55, 'Akash', 'akash5@gmail.com', '7989604545', '155, Miyapur, Hyderabad, Telangana', '2021-07-05'),
(56, 'Rohith', 'rohith@gmail.com', '9349012356', '156, Gachibowli, Hyderabad, Telangana', '2022-08-10'),
(57, 'Pranavi', 'pranavi@gmail.com', '9700892357', '157, Warangal, Telangana', '2023-09-15'),
(58, 'venkatesh', 'venkatesh8@gmail.com', '9708923058', '158, Vijayawada, Telangana', '2024-10-20'),
(59, 'Nivedhitha', 'nivedhitha9@gmail.com', '9700000059', '159, Nizamabad, Telangana', '2025-11-25'),
(60, 'kanthara', 'kanthara0@gmail.com', '9700000060', '160, Karimnagar, Telangana', '2021-12-03'),
(61, 'Manjusha', 'manjusha@gmail.com', '9700989661', '161, Hyderabad, Telangana', '2022-01-08'),
(62, 'arshitha', 'arshitha@gmail.com', '9700988062', '162, Secunderabad, Telangana', '2023-02-13'),
(63, 'Ajay', 'ajay063@gmail.com', '9778690663', '163, Madhapur, Hyderabad, Telangana', '2024-03-18'),
(64, 'Dikshitha', 'dikshitha@gmail.com', '5679700064', '164, Kukatpally, Hyderabad, Telangana', '2025-04-23'),
(65, 'Ishitha', 'ishitha5@gmail.com', '9708912065', '165, Miyapur, Hyderabad, Telangana', '2021-05-01'),
(66, 'Kavitha','kavitha66@gmail.com', '9700000066', '166, Gachibowli, Hyderabad, Telangana', '2022-06-06'),
(67, 'Krishnaveni', 'krisha067@gmail.com', '9700897067', '167, Warangal, Telangana', '2023-07-11'),
(68, 'Meenakshi', 'meenakshi@gmail.com', '9708900068', '168, Vijayawada, Telangana', '2024-08-16'),
(69, 'Neha Patel', 'nehareddy69@gmail.com', '9701234569', '169, Nizamabad, Telangana', '2025-09-21'),
(70, 'Rahul Patel', 'rahul070@gmail.com', '9702345570', '170, Karimnagar, Telangana', '2021-10-26'),
(71, 'Saanvi Patel', 'saanvi56@gmail.com', '9700000071', '171, Hyderabad, Telangana', '2022-11-04'),
(72, 'Sai Priya', 'saipriya@gmail.com', '9702349872', '172, Secunderabad, Telangana', '2023-12-09'),
(73, 'Tara Patel', 'tarapatel@gmail.com', '9702398473', '173, Madhapur, Hyderabad, Telangana', '2024-01-14'),
(74, 'Vaishnavi', 'vaishnavi@gmail.com', '9707892174', '174, Kukatpally, Hyderabad, Telangana', '2025-02-19'),
(75, 'Akhila', 'akhila5@gmail.com', '5678940085', '175, Miyapur, Hyderabad, Telangana', '2021-03-24'),
(76, 'Rashmi', 'rashmi76@gmail.com', '9708967176', '176, Gachibowli, Hyderabad, Telangana', '2022-04-02'),
(77, 'kesava', 'kesava@gmail.com', '9705546077', '177, Warangal, Telangana', '2023-05-07'),
(78, 'Aadharva', 'aadharva@gmail.com', '9700998878', '178, Vijayawada, Telangana', '2024-06-12'),
(79, 'nithya', 'nithya9@gmail.com', '9704500079', '179, Nizamabad, Telangana', '2025-07-17'),
(80, 'kalyan', 'kalyan0@gmail.com', '9707689180', '180, Karimnagar, Telangana', '2021-08-22'),
(81, 'sharmila', 'sharmila@gmail.com', '9712345681', '181, Hyderabad, Telangana', '2022-09-27'),
(82, 'abhishek', 'abhishek@gmail.com', '9767903482', '182, Secunderabad, Telangana', '2023-10-05'),
(83, 'rishi', 'rishi@gmail.com', '9848200083', '183, Madhapur, Hyderabad, Telangana', '2024-11-10'),
(84, 'Deepika', 'deepika4@gmail.com', '9765098384', '184, Kukatpally, Hyderabad, Telangana', '2025-12-15'),
(85, 'Ishaa', 'ishaa@gmail.com', '9700673485', '185, Miyapur, Hyderabad, Telangana', '2021-01-20'),
(86, 'anirudh', 'anirudh86@gmail.com', '9756784986', '186, Gachibowli, Hyderabad, Telangana', '2022-02-25'),
(87, 'Krish', 'krish7@gmail.com', '9700456087', '187, Warangal, Telangana', '2023-03-03'),
(88, 'Meera Bai', 'bai088@gmail.com', '9701892888', '188, Vijayawada, Telangana', '2024-04-08'),
(89, 'Harshitha', 'harshitha@gmail.com', '9776748189', '189, Nizamabad, Telangana', '2025-05-13'),
(90, 'Santhosh', 'santhosh@gmail.com', '9767800090', '190, Karimnagar, Telangana', '2021-06-18'),
(91, 'Saanvi Rao', 'saanvi091@gmail.com', '9709864441', '191, Hyderabad, Telangana', '2022-07-23'),
(92, 'Sai Rao', 'sairao98@gmail.com', '9350922292', '192, Secunderabad, Telangana', '2023-08-01'),
(93, 'Tara Rao', 'tara093@gmail.com', '9702340993', '193, Madhapur, Hyderabad, Telangana', '2024-09-06'),
(94, 'Varun Rao', 'varunrao094@gmail.com', '9709087094', '194, Kukatpally, Hyderabad, Telangana', '2025-10-11'),
(95, 'Aditi Rao', 'adithirao095@gmail.com', '9700123095', '195, Miyapur, Hyderabad, Telangana', '2021-11-16'),
(96, 'Rohan Rao', 'rohan096@gmail.com', '9707890096', '196, Gachibowli, Hyderabad, Telangana', '2022-12-21'),
(97, 'Pooja Rao', 'pooja097@gmail.com', '9703409197', '197, Warangal, Telangana', '2023-01-26'),
(98, 'Vikram Rao', 'vikram098@gmail.com', '9701234598', '198, Vijayawada, Telangana', '2024-02-04'),
(99, 'Nisha Rao', 'nisha099@gmail.com', '9723456099', '199, Nizamabad, Telangana', '2025-03-09'),
(100, 'Kiran Rao', 'kiranrao100@gmail.com', '9779895100', '200, Karimnagar, Telangana', '2021-04-14');

select * from members;

-- insert data into librarians table
INSERT INTO Librarians (librarian_id, name, phone, joining_date) VALUES
(1, 'Krishna Patel', '8600000001', '2016-01-07'),
(2, 'Meera Rao', '8600000002', '2017-02-14'),
(3, 'Neha Mehta', '8600000003', '2018-03-21'),
(4, 'Rahul Iyer', '8600000004', '2019-04-01'),
(5, 'Saanvi Das', '8600000005', '2020-05-08'),
(6, 'Sai Singh', '8600000006', '2021-06-15'),
(7, 'Tara Thomas', '8600000007', '2022-07-22'),
(8, 'Varun Sharma', '8600000008', '2023-08-02'),
(9, 'Aditi Reddy', '8600000009', '2024-09-09'),
(10, 'Rohan Kumar', '8600000010', '2015-10-16'),
(11, 'Pooja Patel', '8600000011', '2016-11-23'),
(12, 'Vikram Rao', '8600000012', '2017-12-03'),
(13, 'Nisha Mehta', '8600000013', '2018-01-10'),
(14, 'Kiran Iyer', '8600000014', '2019-02-17'),
(15, 'Aarav Das', '8600000015', '2020-03-24'),
(16, 'Ananya Singh', '8600000016', '2021-04-04'),
(17, 'Arjun Thomas', '8600000017', '2022-05-11'),
(18, 'Diya Sharma', '8600000018', '2023-06-18'),
(19, 'Ishaan Reddy', '8600000019', '2024-07-25'),
(20, 'Kavya Kumar', '8600000020', '2015-08-05'),
(21, 'Krishna Patel', '8600000021', '2016-09-12'),
(22, 'Meera Rao', '8600000022', '2017-10-19'),
(23, 'Neha Mehta', '8600000023', '2018-11-26'),
(24, 'Rahul Iyer', '8600000024', '2019-12-06'),
(25, 'Saanvi Das', '8600000025', '2020-01-13'),
(26, 'Sai Singh', '8600000026', '2021-02-20'),
(27, 'Tara Thomas', '8600000027', '2022-03-27'),
(28, 'Varun Sharma', '8600000028', '2023-04-07'),
(29, 'Aditi Reddy', '8600000029', '2024-05-14'),
(30, 'Rohan Kumar', '8600000030', '2015-06-21'),
(31, 'Pooja Patel', '8600000031', '2016-07-01'),
(32, 'Vikram Rao', '8600000032', '2017-08-08'),
(33, 'Nisha Mehta', '8600000033', '2018-09-15'),
(34, 'Kiran Iyer', '8600000034', '2019-10-22'),
(35, 'Aarav Das', '8600000035', '2020-11-02'),
(36, 'Ananya Singh', '8600000036', '2021-12-09'),
(37, 'Arjun Thomas', '8600000037', '2022-01-16'),
(38, 'Diya Sharma', '8600000038', '2023-02-23'),
(39, 'Ishaan Reddy', '8600000039', '2024-03-03'),
(40, 'Kavya Kumar', '8600000040', '2015-04-10'),
(41, 'Krishna Patel', '8600000041', '2016-05-17'),
(42, 'Meera Rao', '8600000042', '2017-06-24'),
(43, 'Neha Mehta', '8600000043', '2018-07-04'),
(44, 'Rahul Iyer', '8600000044', '2019-08-11'),
(45, 'Saanvi Das', '8600000045', '2020-09-18'),
(46, 'Sai Singh', '8600000046', '2021-10-25'),
(47, 'Tara Thomas', '8600000047', '2022-11-05'),
(48, 'Varun Sharma', '8600000048', '2023-12-12'),
(49, 'Aditi Reddy', '8600000049', '2024-01-19'),
(50, 'Rohan Kumar', '8600000050', '2015-02-26'),
(51, 'Pooja Patel', '8600000051', '2016-03-06'),
(52, 'Vikram Rao', '8600000052', '2017-04-13'),
(53, 'Nisha Mehta', '8600000053', '2018-05-20'),
(54, 'Kiran Iyer', '8600000054', '2019-06-27'),
(55, 'Aarav Das', '8600000055', '2020-07-07'),
(56, 'Ananya Singh', '8600000056', '2021-08-14'),
(57, 'Arjun Thomas', '8600000057', '2022-09-21'),
(58, 'Diya Sharma', '8600000058', '2023-10-01'),
(59, 'Ishaan Reddy', '8600000059', '2024-11-08'),
(60, 'Kavya Kumar', '8600000060', '2015-12-15'),
(61, 'Krishna Patel', '8600000061', '2016-01-22'),
(62, 'Meera Rao', '8600000062', '2017-02-02'),
(63, 'Neha Mehta', '8600000063', '2018-03-09'),
(64, 'Rahul Iyer', '8600000064', '2019-04-16'),
(65, 'Saanvi Das', '8600000065', '2020-05-23'),
(66, 'Sai Singh', '8600000066', '2021-06-03'),
(67, 'Tara Thomas', '8600000067', '2022-07-10'),
(68, 'Varun Sharma', '8600000068', '2023-08-17'),
(69, 'Aditi Reddy', '8600000069', '2024-09-24'),
(70, 'Rohan Kumar', '8600000070', '2015-10-04'),
(71, 'Pooja Patel', '8600000071', '2016-11-11'),
(72, 'Vikram Rao', '8600000072', '2017-12-18'),
(73, 'Nisha Mehta', '8600000073', '2018-01-25'),
(74, 'Kiran Iyer', '8600000074', '2019-02-05'),
(75, 'Aarav Das', '8600000075', '2020-03-12'),
(76, 'Ananya Singh', '8600000076', '2021-04-19'),
(77, 'Arjun Thomas', '8600000077', '2022-05-26'),
(78, 'Diya Sharma', '8600000078', '2023-06-06'),
(79, 'Ishaan Reddy', '8600000079', '2024-07-13'),
(80, 'Kavya Kumar', '8600000080', '2015-08-20'),
(81, 'Krishna Patel', '8600000081', '2016-09-27'),
(82, 'Meera Rao', '8600000082', '2017-10-07'),
(83, 'Neha Mehta', '8600000083', '2018-11-14'),
(84, 'Rahul Iyer', '8600000084', '2019-12-21'),
(85, 'Saanvi Das', '8600000085', '2020-01-01'),
(86, 'Sai Singh', '8600000086', '2021-02-08'),
(87, 'Tara Thomas', '8600000087', '2022-03-15'),
(88, 'Varun Sharma', '8600000088', '2023-04-22'),
(89, 'Aditi Reddy', '8600000089', '2024-05-02'),
(90, 'Rohan Kumar', '8600000090', '2015-06-09'),
(91, 'Pooja Patel', '8600000091', '2016-07-16'),
(92, 'Vikram Rao', '8600000092', '2017-08-23'),
(93, 'Nisha Mehta', '8600000093', '2018-09-03'),
(94, 'Kiran Iyer', '8600000094', '2019-10-10'),
(95, 'Aarav Das', '8600000095', '2020-11-17'),
(96, 'Ananya Singh', '8600000096', '2021-12-24'),
(97, 'Arjun Thomas', '8600000097', '2022-01-04'),
(98, 'Diya Sharma', '8600000098', '2023-02-11'),
(99, 'Ishaan Reddy', '8600000099', '2024-03-18'),
(100, 'Kavya Kumar', '8600000100', '2015-04-25');

select * from librarians;

-- insert data into borrow_records table
INSERT INTO Borrow_Records (borrow_id, member_id, book_id, librarian_id, borrow_date, return_date, status) VALUES
(1, 3, 7, 5, '2024-01-05', NULL, 'Borrowed'),
(2, 6, 14, 10, '2024-01-09', '2024-01-18', 'Overdue'),
(3, 9, 21, 15, '2024-01-13', '2024-01-23', 'Returned'),
(4, 12, 28, 20, '2024-01-17', NULL, 'Borrowed'),
(5, 15, 35, 25, '2024-01-21', '2024-02-02', 'Overdue'),
(6, 18, 42, 30, '2024-01-25', '2024-02-07', 'Returned'),
(7, 21, 49, 35, '2024-01-29', NULL, 'Borrowed'),
(8, 24, 56, 40, '2024-02-02', '2024-02-17', 'Overdue'),
(9, 27, 63, 45, '2024-02-06', '2024-02-22', 'Returned'),
(10, 30, 70, 50, '2024-02-10', NULL, 'Borrowed'),
(11, 33, 7, 55, '2024-02-14', '2024-03-03', 'Overdue'),
(12, 36, 14, 60, '2024-02-18', '2024-03-08', 'Returned'),
(13, 39, 21, 65, '2024-02-22', NULL, 'Borrowed'),
(14, 42, 28, 70, '2024-02-26', '2024-03-18', 'Overdue'),
(15, 45, 35, 75, '2024-03-01', '2024-03-23', 'Returned'),
(16, 48, 42, 80, '2024-03-05', NULL, 'Borrowed'),
(17, 51, 49, 85, '2024-03-09', '2024-04-02', 'Overdue'),
(18, 54, 56, 90, '2024-03-13', '2024-03-20', 'Returned'),
(19, 57, 63, 95, '2024-03-17', NULL, 'Borrowed'),
(20, 60, 70, 100, '2024-03-21', '2024-03-30', 'Overdue'),
(21, 63, 7, 5, '2024-03-25', '2024-04-04', 'Returned'),
(22, 66, 14, 10, '2024-03-29', NULL, 'Borrowed'),
(23, 69, 21, 15, '2024-04-02', '2024-04-14', 'Overdue'),
(24, 72, 28, 20, '2024-04-06', '2024-04-19', 'Returned'),
(25, 75, 35, 25, '2024-04-10', NULL, 'Borrowed'),
(26, 78, 42, 30, '2024-04-14', '2024-04-29', 'Overdue'),
(27, 1, 49, 35, '2024-04-18', '2024-05-04', 'Returned'),
(28, 4, 56, 40, '2024-04-22', NULL, 'Borrowed'),
(29, 7, 63, 45, '2024-04-26', '2024-05-14', 'Overdue'),
(30, 10, 70, 50, '2024-04-30', '2024-05-19', 'Returned'),
(31, 13, 7, 55, '2024-05-04', NULL, 'Borrowed'),
(32, 16, 14, 60, '2024-05-08', '2024-05-29', 'Overdue'),
(33, 19, 21, 65, '2024-05-12', '2024-06-03', 'Returned'),
(34, 22, 28, 70, '2024-05-16', NULL, 'Borrowed'),
(35, 25, 35, 75, '2024-05-20', '2024-06-13', 'Overdue'),
(36, 28, 42, 80, '2024-05-24', '2024-05-31', 'Returned'),
(37, 31, 49, 85, '2024-05-28', NULL, 'Borrowed'),
(38, 34, 56, 90, '2024-06-01', '2024-06-10', 'Overdue'),
(39, 37, 63, 95, '2024-06-05', '2024-06-15', 'Returned'),
(40, 40, 70, 100, '2024-06-09', NULL, 'Borrowed'),
(41, 43, 7, 5, '2024-06-13', '2024-06-25', 'Overdue'),
(42, 46, 14, 10, '2024-06-17', '2024-06-30', 'Returned'),
(43, 49, 21, 15, '2024-06-21', NULL, 'Borrowed'),
(44, 52, 28, 20, '2024-06-25', '2024-07-10', 'Overdue'),
(45, 55, 35, 25, '2024-06-29', '2024-07-15', 'Returned'),
(46, 58, 42, 30, '2024-07-03', NULL, 'Borrowed'),
(47, 61, 49, 35, '2024-07-07', '2024-07-25', 'Overdue'),
(48, 64, 56, 40, '2024-07-11', '2024-07-30', 'Returned'),
(49, 67, 63, 45, '2024-07-15', NULL, 'Borrowed'),
(50, 70, 70, 50, '2024-07-19', '2024-08-09', 'Overdue'),
(51, 73, 7, 55, '2024-07-23', '2024-08-14', 'Returned'),
(52, 76, 14, 60, '2024-07-27', NULL, 'Borrowed'),
(53, 79, 21, 65, '2024-07-31', '2024-08-24', 'Overdue'),
(54, 2, 28, 70, '2024-08-04', '2024-08-11', 'Returned'),
(55, 5, 35, 75, '2024-08-08', NULL, 'Borrowed'),
(56, 8, 42, 80, '2024-08-12', '2024-08-21', 'Overdue'),
(57, 11, 49, 85, '2024-08-16', '2024-08-26', 'Returned'),
(58, 14, 56, 90, '2024-08-20', NULL, 'Borrowed'),
(59, 17, 63, 95, '2024-08-24', '2024-09-05', 'Overdue'),
(60, 20, 70, 100, '2024-08-28', '2024-09-10', 'Returned'),
(61, 23, 7, 5, '2024-09-01', NULL, 'Borrowed'),
(62, 26, 14, 10, '2024-09-05', '2024-09-20', 'Overdue'),
(63, 29, 21, 15, '2024-09-09', '2024-09-25', 'Returned'),
(64, 32, 28, 20, '2024-09-13', NULL, 'Borrowed'),
(65, 35, 35, 25, '2024-09-17', '2024-10-05', 'Overdue'),
(66, 38, 42, 30, '2024-09-21', '2024-10-10', 'Returned'),
(67, 41, 49, 35, '2024-09-25', NULL, 'Borrowed'),
(68, 44, 56, 40, '2024-09-29', '2024-10-20', 'Overdue'),
(69, 47, 63, 45, '2024-10-03', '2024-10-25', 'Returned'),
(70, 50, 70, 50, '2024-10-07', NULL, 'Borrowed'),
(71, 53, 7, 55, '2024-10-11', '2024-11-04', 'Overdue'),
(72, 56, 14, 60, '2024-10-15', '2024-10-22', 'Returned'),
(73, 59, 21, 65, '2024-10-19', NULL, 'Borrowed'),
(74, 62, 28, 70, '2024-10-23', '2024-11-01', 'Overdue'),
(75, 65, 35, 75, '2024-10-27', '2024-11-06', 'Returned'),
(76, 68, 42, 80, '2024-10-31', NULL, 'Borrowed'),
(77, 71, 49, 85, '2024-11-04', '2024-11-16', 'Overdue'),
(78, 74, 56, 90, '2024-11-08', '2024-11-21', 'Returned'),
(79, 77, 63, 95, '2024-11-12', NULL, 'Borrowed'),
(80, 80, 70, 100, '2024-11-16', '2024-12-01', 'Overdue'),
(81, 3, 7, 5, '2024-11-20', '2024-12-06', 'Returned'),
(82, 6, 14, 10, '2024-11-24', NULL, 'Borrowed'),
(83, 9, 21, 15, '2024-11-28', '2024-12-16', 'Overdue'),
(84, 12, 28, 20, '2024-12-02', '2024-12-21', 'Returned'),
(85, 15, 35, 25, '2024-12-06', NULL, 'Borrowed'),
(86, 18, 42, 30, '2024-12-10', '2024-12-31', 'Overdue'),
(87, 21, 49, 35, '2024-12-14', '2025-01-05', 'Returned'),
(88, 24, 56, 40, '2024-12-18', NULL, 'Borrowed'),
(89, 27, 63, 45, '2024-12-22', '2025-01-15', 'Overdue'),
(90, 30, 70, 50, '2024-12-26', '2025-01-02', 'Returned'),
(91, 33, 7, 55, '2024-12-30', NULL, 'Borrowed'),
(92, 36, 14, 60, '2025-01-03', '2025-01-12', 'Overdue'),
(93, 39, 21, 65, '2025-01-07', '2025-01-17', 'Returned'),
(94, 42, 28, 70, '2025-01-11', NULL, 'Borrowed'),
(95, 45, 35, 75, '2025-01-15', '2025-01-27', 'Overdue'),
(96, 48, 42, 80, '2025-01-19', '2025-02-01', 'Returned'),
(97, 51, 49, 85, '2025-01-23', NULL, 'Borrowed'),
(98, 54, 56, 90, '2025-01-27', '2025-02-11', 'Overdue'),
(99, 57, 63, 95, '2025-01-31', '2025-02-16', 'Returned'),
(100, 60, 70, 100, '2025-02-04', NULL, 'Borrowed');

select * from borrow_records;

-- insert data into reservations table
INSERT INTO Reservations (reservation_id, member_id, book_id, reservation_date) VALUES
(1, 11, 13, '2025-01-03'),
(2, 22, 26, '2025-01-05'),
(3, 33, 39, '2025-01-07'),
(4, 44, 52, '2025-01-09'),
(5, 55, 65, '2025-01-11'),
(6, 66, 78, '2025-01-13'),
(7, 77, 91, '2025-01-15'),
(8, 88, 4, '2025-01-17'),
(9, 99, 17, '2025-01-19'),
(10, 10, 30, '2025-01-21'),
(11, 21, 43, '2025-01-23'),
(12, 32, 56, '2025-01-25'),
(13, 43, 69, '2025-01-27'),
(14, 54, 82, '2025-01-29'),
(15, 65, 95, '2025-01-31'),
(16, 76, 8, '2025-02-02'),
(17, 87, 21, '2025-02-04'),
(18, 98, 34, '2025-02-06'),
(19, 9, 47, '2025-02-08'),
(20, 20, 60, '2025-02-10'),
(21, 31, 73, '2025-02-12'),
(22, 42, 86, '2025-02-14'),
(23, 53, 99, '2025-02-16'),
(24, 64, 12, '2025-02-18'),
(25, 75, 25, '2025-02-20'),
(26, 86, 38, '2025-02-22'),
(27, 97, 51, '2025-02-24'),
(28, 8, 64, '2025-02-26'),
(29, 19, 77, '2025-02-28'),
(30, 30, 90, '2025-03-02'),
(31, 41, 3, '2025-03-04'),
(32, 52, 16, '2025-03-06'),
(33, 63, 29, '2025-03-08'),
(34, 74, 42, '2025-03-10'),
(35, 85, 55, '2025-03-12'),
(36, 96, 68, '2025-03-14'),
(37, 7, 81, '2025-03-16'),
(38, 18, 94, '2025-03-18'),
(39, 29, 7, '2025-03-20'),
(40, 40, 20, '2025-03-22'),
(41, 51, 33, '2025-03-24'),
(42, 62, 46, '2025-03-26'),
(43, 73, 59, '2025-03-28'),
(44, 84, 72, '2025-03-30'),
(45, 95, 85, '2025-04-01'),
(46, 6, 98, '2025-04-03'),
(47, 17, 11, '2025-04-05'),
(48, 28, 24, '2025-04-07'),
(49, 39, 37, '2025-04-09'),
(50, 50, 50, '2025-04-11'),
(51, 61, 63, '2025-04-13'),
(52, 72, 76, '2025-04-15'),
(53, 83, 89, '2025-04-17'),
(54, 94, 2, '2025-04-19'),
(55, 5, 15, '2025-04-21'),
(56, 16, 28, '2025-04-23'),
(57, 27, 41, '2025-04-25'),
(58, 38, 54, '2025-04-27'),
(59, 49, 67, '2025-04-29'),
(60, 60, 80, '2025-05-01'),
(61, 71, 93, '2025-05-03'),
(62, 82, 6, '2025-05-05'),
(63, 93, 19, '2025-05-07'),
(64, 4, 32, '2025-05-09'),
(65, 15, 45, '2025-05-11'),
(66, 26, 58, '2025-05-13'),
(67, 37, 71, '2025-05-15'),
(68, 48, 84, '2025-05-17'),
(69, 59, 97, '2025-05-19'),
(70, 70, 10, '2025-05-21'),
(71, 81, 23, '2025-05-23'),
(72, 92, 36, '2025-05-25'),
(73, 3, 49, '2025-05-27'),
(74, 14, 62, '2025-05-29'),
(75, 25, 75, '2025-05-31'),
(76, 36, 88, '2025-06-02'),
(77, 47, 1, '2025-06-04'),
(78, 58, 14, '2025-06-06'),
(79, 69, 27, '2025-06-08'),
(80, 80, 40, '2025-06-10'),
(81, 91, 53, '2025-06-12'),
(82, 2, 66, '2025-06-14'),
(83, 13, 79, '2025-06-16'),
(84, 24, 92, '2025-06-18'),
(85, 35, 5, '2025-06-20'),
(86, 46, 18, '2025-06-22'),
(87, 57, 31, '2025-06-24'),
(88, 68, 44, '2025-06-26'),
(89, 79, 57, '2025-06-28'),
(90, 90, 70, '2025-06-30'),
(91, 1, 83, '2025-07-02'),
(92, 12, 96, '2025-07-04'),
(93, 23, 9, '2025-07-06'),
(94, 34, 22, '2025-07-08'),
(95, 45, 35, '2025-07-10'),
(96, 56, 48, '2025-07-12'),
(97, 67, 61, '2025-07-14'),
(98, 78, 74, '2025-07-16'),
(99, 89, 87, '2025-07-18'),
(100, 100, 100, '2025-07-20');

select * from reservations;

select 'books' as table_name, count(*) as total_records from books
union all 
select 'members', count(*) from members
union all 
select 'librarians', count(*) from librarians
union all 
select 'borrow_records',count(*) from borrow_records
union all
select 'reservations',count(*) from reservations;

-- display all books
select * from books;

-- display book titles and authors. 
select title,author from books;

-- find books that are available.
select * from books where availability_status='available';

-- find books with a price greater than 500. 
select * from books where price>500;

-- display members from hyderabad. 
select * from members where address like '%hyderabad%';

-- display books in descending order of price.
select * from books order by price desc;

-- display the first 10 books. 
select * from books limit 10;

-- display book titles with member names for borrowed books.
select m.name,b.title from borrow_records BR join members m on BR.member_id=m.member_id join books b on BR.book_id=b.book_id;

-- display member names with their borrowing dates. 
select m.name,br.borrow_date from members m join borrow_records br on m.member_id=br.member_id;

-- display all members ,including members who have not borrowed books. 
select m.name,br.borrow_id from members m left join borrow_records br on m.member_id=br.member_id;

-- display book titles with librarian names. 
select b.title,l.name as librarian_name from borrow_records br join books b on br.book_id=b.book_id join librarians l on br.librarian_id=l.librarian_id; 

-- find the total number of books.
select count(*) as total_books from books;

-- find the average price of books. 
select avg(price) as average_price from books;

-- find the highest priced book.
select max(price) as highest_price from books;

-- find the lowest-priced book.
select min(price) as lowest_price from books;

-- calculate the total value of all books. 
select sum(price) as total_value from books;

-- count books in each category. 
select category ,count(*) as total_books from books group by category;

-- display categories having more than 5 books. 
select category,count(*) as total_books from books group by category having count(*)>5;

-- find books whose price is greater than the average book price. 
select * from books where price> (
select avg(price) from books );

-- find members who have borrowed books. 
select * from members where member_id in (
select member_id from borrow_records);

-- find the most expensive book. 
select * from books where price =( 
select max(price) from books);

-- find books that have never been borrowed. 
select * from books where book_id not in (
select book_id from borrow_records);

-- create a view for available books.
create view available_books as
select book_id,title,author,price from books where availability_status ="available";

-- display the view. 
select * from available_books;

-- create a view showing borrowing details. 
create view borrowing_details as
select m.name as member_name,b.title as book_title ,br.borrow_date,br.return_date,br.status from borrow_records br join members m on br.member_id=m.member_id join books b on br.book_id=b.book_id;

-- display a view
select * from borrowing_details;

-- create a procedure to display all books. 
delimiter //
create procedure getallbooks()
begin
select * from books;
end //
delimiter ;
call getallbooks();

-- create a procedure to find books by category.
delimiter //
create procedure get_books_by_category(in cat_name varchar(50))
begin
select * from books where category=cat_name;
end //
delimiter ;
call get_books_by_category('science');

-- create a procedure to display a member's borrowing details. 
delimiter //
create procedure get_member_borrowings(in mem_id int)
begin
select m.name,b.title,br.borrow_date,br.status from borrow_records br join members m on br.member_id=m.member_id join books b on br.book_id=b.book_id where br.member_id =mem_id;
end //
delimiter ;
call get_member_borrowings(3);

-- total number of books by availability status.
select availability_status ,count(*) as total_books from books group by availability_status;

-- borrowing count for each member. 
select m.name,count(br.borrow_id) as total_borrowed from members m left join borrow_records br on m.member_id=br.member_id group by m.member_id,m.name order by total_borrowed desc;

-- list all overdue books with member details. 
select m.name,b.title,br.borrow_date,br.return_date,br.status from borrow_records br join members m on br.member_id=m.member_id join books b on br.book_id=b.book_id where br.status="overdue";

-- find the most borrowed books.
select b.title,count(br.borrow_id) as borrow_count from books b join borrow_records br on b.book_id=br.book_id group by b.book_id,b.title order by borrow_count desc limit 10;

describe books;

describe members;

describe librarians;

describe borrow_records;

describe reservations;

select count(*) from books;

select count(*) from members;

select database();

describe books;

describe members;

alter table books modify book_id int not null auto_increment;

show create table books;

show create table borrow_records;

delete from members where member_id="101";

select * from members where member_id=101;
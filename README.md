1. What is PostgreSQL?

PostgreSQL হল একটি ওপেন সোর্স অবজেক্ট-রিলেশনাল ডাটাবেস। এটি একটি শক্তিশালী ডাটাবেস সিস্টেম যা SQL ভাষা ব্যবহার করে। এটি সবচেয়ে জটিল ডেটা ওয়ার্কলোড নিরাপদে সংরক্ষণ এবং স্কেল করে। PostgreSQL হল একটি উন্নত, এন্টারপ্রাইজ-শ্রেণীর ডাটাবেস যা রিলেশনাল এবং নন-রিলেশনাল উভয় ধরণের কোয়েরি সমর্থন করে।

2. What is the purpose of a database schema in PostgreSQL?

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

### Primary Key: 
Primary Key হল এমন একটি কী যা ডাটাবেসের টপলকে অনন্যভাবে সনাক্ত করতে সাহায্য করে । অথবা একটি নির্দিষ্ট কলামের ডেটা অনন্য কিনা তা নিশ্চিত করার জন্য  Primary Key ব্যবহার করা হয়। Primary Key কলামের মান NULL থাকতে পারে না। এটি একটি কলাম যা নির্দিষ্টভাবে একটি সংজ্ঞায়িত ক্রম অনুসারে ডাটাবেস দ্বারা তৈরি করা হয়।

Example: 
```
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name TEXT,
    age INT
);

```
এখানে student_id হলো Primary Key, যা প্রতিটি শিক্ষার্থীকে আলাদা করে চিহ্নিত করে।

### Foreign Key:
Foreign Key হল এমন একটি কী যা একটি টেবিলের Primary Key অন্য টেবিলের জন্য একটি Foreign Key হিসাবে কাজ করে। Foreign Key কলামের মান NULL থাকতে পারে না।

Example:
```
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_name VARCHAR(50)
);

```
এখানে student_id হলো Foreign Key, যা students টেবিলের student_id কে রেফারেন্স করে।

4. What is the difference between the VARCHAR and CHAR data types?

VARCHAR এবং CHAR হল SQL-এ ব্যবহৃত দুটি সাধারণ স্ট্রিং ডেটা টাইপ। নিচে বাংলা ভাষায় বিস্তারিতভাবে ব্যাখ্যা করা হলো।

### CHAR (Character): 
CHAR হল একটি ডেটা টাইপ যা নির্দিষ্ট দৈর্ঘ্যের একটি অক্ষর স্ট্রিং সংরক্ষণ করতে দেয়।

Example:
ধরুন, আপনি CHAR (10) ডেটা টাইপের একটি ভেরিয়েবল নিলেন। আপনি একটি অক্ষর, পাঁচটি অক্ষর, সাতটি অক্ষর, অথবা দশটি অক্ষর সংরক্ষণ করুন না কেন, এটি সর্বদা 10 বাইট ডেটা গ্রহণ করবে। এটি সবসময় 10 বাইট গ্রহণ করবে, অর্থাৎ, আপনি একটি কলামে সর্বাধিক 10টি অক্ষর সংরক্ষণ করতে পারবেন। এর কারণে, কখনও কখনও, প্রচুর ডাটাবেস স্টোরেজ নষ্ট হয়।

### VARCHAR (Variable Character): 
VARCHAR হল একটি ডেটা টাইপ যা আপনাকে পরিবর্তনশীল দৈর্ঘ্যের কিন্তু নির্দিষ্ট দৈর্ঘ্যের সর্বোচ্চ অক্ষর স্ট্রিং সংরক্ষণ করতে দেয়।

Example:
ধরুন আপনি VARCHAR (10) ডাটা টাইপের একটি ভেরিয়েবল ডিক্লেয়ার করলেন; তাহলে এটি অক্ষরের সংখ্যার সমান বাইট ব্যবহার করবে। সুতরাং, দুটি অক্ষর সংরক্ষণ করতে দুটি বাইট লাগবে; যদি আপনি পাঁচটি অক্ষর সংরক্ষণ করেন, তাহলে 5 বাইট লাগবে, ইত্যাদি। এর ফলে, অনেক ডাটাবেস স্টোরেজ সাশ্রয় হয়, যা CHAR ডাটা টাইপ ব্যবহার করার সময় নষ্ট হয়।

5. Explain the purpose of the WHERE clause in a SELECT statement.

6. What are the LIMIT and OFFSET clauses used for?

LIMIT এবং OFFSET হলো SQL-এর দুটি ক্লজ, যেগুলো সাধারণত ডেটাবেইজ থেকে নির্দিষ্ট পরিমাণে ডেটা আনতে এবং স্কিপ করতে ব্যবহৃত হয়।

### LIMIT:
এটি রেকর্ডের সংখ্যা সীমিত করতে ব্যবহৃত হয়। দীর্ঘমেয়াদী কোয়েরি এড়াতে LIMIT ক্লজটি একটি কার্যকর উপায়, কারণ এটি প্রক্রিয়াকরণ বন্ধ করে দেয় এবং প্রয়োজনীয়তা পূরণ হওয়ার সাথে সাথে ফলাফল ফেরত দেয়। এটি প্রক্রিয়াকরণের সময় হ্রাস করে।

Example:
```
SELECT * FROM students LIMIT 5;
```
এখানে প্রথম ৫টি শিক্ষার্থীর তথ্য দেখাবে।

### OFFSET:
এটি নির্দেশ করে যে কোন অবস্থান থেকে সারি বা রেকর্ডগুলি দেখানো শুরু করতে হবে, অর্থাৎ, OFFSET ক্লজ ব্যবহার করে আপনি প্রথম কতটি সারি স্কিপ করতে চান, তা নির্ধারণ করতে পারেন।

Example:
```
SELECT * FROM students LIMIT 5 OFFSET 10;
```
এটি প্রথম ১০টি সারি স্কিপ করে পরবর্তী ৫টি সারি দেখাবে।
অর্থাৎ, এটি ১১তম থেকে ১৫তম শিক্ষার্থীর তথ্য রিটার্ন করবে।

7. How can you modify data using UPDATE statements?

8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

9. Explain the GROUP BY clause and its role in aggregation operations.

10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
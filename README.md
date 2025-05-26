1. What is PostgreSQL?

PostgreSQL হল একটি ওপেন সোর্স অবজেক্ট-রিলেশনাল ডাটাবেস। এটি একটি শক্তিশালী ডাটাবেস সিস্টেম যা SQL ভাষা ব্যবহার করে। এটি সবচেয়ে জটিল ডেটা ওয়ার্কলোড নিরাপদে সংরক্ষণ এবং স্কেল করে। PostgreSQL হল একটি উন্নত, এন্টারপ্রাইজ-শ্রেণীর ডাটাবেস যা রিলেশনাল এবং নন-রিলেশনাল উভয় ধরণের কোয়েরি সমর্থন করে।

2. What is the purpose of a database schema in PostgreSQL?

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Primary Key: Primary Key হল এমন একটি কী যা ডাটাবেসের টপলকে অনন্যভাবে সনাক্ত করতে সাহায্য করে । অথবা একটি নির্দিষ্ট কলামের ডেটা অনন্য কিনা তা নিশ্চিত করার জন্য  Primary Key ব্যবহার করা হয়। Primary Key কলামের মান NULL থাকতে পারে না। এটি হয় একটি বিদ্যমান টেবিল কলাম বা একটি কলাম যা নির্দিষ্টভাবে একটি সংজ্ঞায়িত ক্রম অনুসারে ডাটাবেস দ্বারা তৈরি করা হয়।

Example: 
```
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name TEXT,
    age INT
);

```
এখানে student_id হলো Primary Key, যা প্রতিটি শিক্ষার্থীকে আলাদা করে চিহ্নিত করে।

Foreign Key: Foreign Key হল এমন একটি কী যা একটি টেবিলের Primary Key অন্য টেবিলের জন্য একটি Foreign Key হিসাবে কাজ করে। Foreign Key কলামের মান NULL থাকতে পারে না।

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

5. Explain the purpose of the WHERE clause in a SELECT statement.

6. What are the LIMIT and OFFSET clauses used for?

7. How can you modify data using UPDATE statements?

8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

9. Explain the GROUP BY clause and its role in aggregation operations.

10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
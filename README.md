# JSON Processing with jq

This project is a deep dive into **jq**, a lightweight and flexible command-line JSON processor. Using a sample `exos.json` file containing a list of users, we solved several data manipulation challenges commonly encountered in DevOps and System Administration tasks.

## Data Structure
The exercise uses a `exos.json` file structured as follows:
- An array of `users`.
- Each user has an `id`, `firstname`, `lastname`, `role`, and an `active` status (boolean).

## Challenges & Solutions

Here are the specific questions we addressed and the `jq` commands used to solve them:

### 1. List all first names
Extract only the `firstname` of every user in the list.

jq -r '.users[].firstname' token.json


### 2. Display only active users
Filter the list to show users where active is true.
Bash

jq '.users[] | select(.active == true)' token.json

### 3. Count the number of developers
Find out how many users have the role "developer".
Bash

jq '[.users[] | select(.role == "developer")] | length' token.json

### 4. Display full names sorted alphabetically
Combine firstname and lastname, then sort the result.
Bash

jq -r '.users[] | "\(.firstname) \(.lastname)"' token.json | sort

### 5. Find the user with ID = 3
Locate a specific record using its unique identifier.
Bash

jq '.users[] | select(.id == 3)' token.json

### 6. Extract only active developers
Combine multiple filters (boolean and string matching).
Bash

jq '.users[] | select(.active == true and .role == "developer")' token.json

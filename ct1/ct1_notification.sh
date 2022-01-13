#!/bin/bash

INFO=ct1_info.json

DATE=$(jq -r .date $INFO)
TIME=$(jq -r .time $INFO)
ROOM=$(jq -r .room $INFO)
WEIGHT=$(jq -r .weight $INFO)
TIME_ALLOWED=$(jq -r .time_allowed $INFO)

SUBJECT="class test $DATE at $TIME in $ROOM"
BODY="Class Test will take place on $DATE at $TIME in $ROOM.

Module marks: $WEIGHT

Time allowed: $TIME_ALLOWED

This is a closed-book closed-notes test.

The test will be on paper.

Approx 25 questions.

Questions will take the forms of:
- true / false
- multiple choice
- short answer

It will cover all material in the course up to and including the end of this week (22/10/2021).

You will receive the grade on Moodle at a later time.
Verbal feedback is available on request.

Non-personal queries about the test should be sent to the Q&A forum on Moodle.

You should familiarise yourself with the DkIT academic integrity policy:
https://www.dkit.ie/registrars-office/academic-policies/academic-integrity-policy-procedures
"

echo "$BODY" | ../../class_mail.sh "$SUBJECT"


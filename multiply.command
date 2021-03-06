#!/usr/bin/env python

import time
import os
#from my_quiz import check_multiplication_answer, generate_multiplication_question, calculate_total_time
#import my_quiz
import my_quiz as mq

if __name__ == "__main__":
    print(os.getcwd())
    num_of_question = 5

    name = input("Please Enter your Name: ") # This will be changed to other forms of ID

    play_again = "Y"
    assessment_id = time.time() # Use time as ID.
    while play_again.upper().startswith("Y"):
        num_correct = 0
        records = []
        input("\nPress Enter to start...\n")
        start_time = time.time()
        for i in range(num_of_question):
            cur_time = time.time()
            a, b = mq.generate_multiplication_question(12)
            question = f"\n({i+1}) {a} X {b} = ? "
            ans = input(question)
            duration = time.time() - cur_time
            is_correct = mq.check_multiplication_answer(a, b, int(ans))
            time_stamp = time.strftime("%a %d %b %Y %H:%M:%S +0000", time.gmtime())
            records.append((assessment_id, name, time_stamp, a, b, a*b, duration, is_correct))
            
            if ans.isdigit() and is_correct:
                num_correct += 1
                print("Correct")
            else:
                print(f"Wrong... The answer is {a*b}.\n")
                print("\nG A M E   O V E R   ! ! !\n")
                break
        

        mq.log_assessment_result(records, name.lower())

        if num_correct == num_of_question:
            end_time = time.time()
            total_time = mq.calculate_total_time(start_time, end_time)

            print("\nFinished!\n")
            print(f"Time: {total_time} seconds")
            print(f"Score: {num_correct} out of {num_of_question}\n")

        play_again = input("Play again (Y/N)? ")

    print("Bye!")

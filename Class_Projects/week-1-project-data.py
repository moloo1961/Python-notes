

print("WEEK 1 PROJECT QUESTIONS")

# List to be used in the project
Questions = [{"question": "What is the capital of France?", 
              "Choices": "A) Paris\nB) Lyon\nC) Marseille\nD) Nice", 
              "Answer": "A"},
               {"question": "H2O is known as?", 
                "Choices": "A) Hydrogen\nB) Sulphur\nC) Oxygen\nD) Water", 
                "Answer": "D"},
             {"question": "2 + 2?", 
              "Choices": "A) 4\nB) 3\nC) 5\nD) 6", 
              "Answer": "A"},
               {"question": "Author of 1984?", 
                "Choices": "A) Alldous Huxley\nB) George Orwel\nC)Ray Bradbury\nD) Lana del Rae",
                  "Answer": "B"},
                 {"question": "What is the name of the largest planet?", 
                  "Choices": "A) Earth\nB) Mars\nC) Jupiter\nD) Venus", 
                  "Answer": "C"}]

print(Questions) 

que = "question"
cho = "choices"
ans = "answer"
def add_questions(que, cho, ans):
    return {"question": que, "choices": cho, "answer": ans}

Questions = [add_questions("What is the capital of France?", "A) Paris B) Lyon C) Marseille D) Nice", "A"),
             add_questions("H2O is known as?", "A) Hydrogen B) Sulphur C) Oxygen D) Water", "D"),
             add_questions("2 + 2?", "A) 4 B) 3 C) 5 D) 6", "A"),
             add_questions("Author of 1984?", "A) Alldous Huxley B) George Orwel C)Ray Bradbury D) Lana del Rae", "B"),
             add_questions("What is the name of the largest planet?", "A) Earth B) Mars C) Jupiter D) Venus", "C")]
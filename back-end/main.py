import pyttsx3 

def voiceChange():
    eng = pyttsx3.init()
    voice = eng.getProperty('voices') 
    eng.setProperty('voice', voice[0].id) 
    eng.say("sheraz")
    eng.setProperty('voice', voice[1].id) 
    eng.say("sheraz")
    eng.runAndWait() 

if __name__ == "__main__":
    voiceChange()
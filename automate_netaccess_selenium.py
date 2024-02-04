from selenium import webdriver
import time
import sys

username = sys.argv[1]
password = sys.argv[2]

driver = webdriver.Chrome()
driver.get("https://netaccess.iitm.ac.in/account/login")
time.sleep(15)

print(driver.current_url)

#bypassing the SSL certificate error
try:
    driver.find_element(by="id", value="details-button").click()
    driver.find_element(by="id", value="proceed-link").click()
    time.sleep(2)

except:
    print("No SSL error")
    
#user login
driver.find_element(by="id", value="username").send_keys(username)
driver.find_element(by="id", value="password").send_keys(password)
driver.find_element(by="id", value="submit").click()
time.sleep(2)

#approve access site
driver.get("https://netaccess.iitm.ac.in/account/approve")
time.sleep(2)

#access for one day
driver.find_element(by="id", value="radios-2").click()
time.sleep(2)

driver.find_element(by="id", value="approveBtn").click()
time.sleep(2)
driver.quit()
# 🔍 Windows Grep Alternatives Cheatsheet

This **cheatsheet** provides `grep` alternatives for **Windows CMD** and **PowerShell** to search for usernames, passwords, hashes, API keys, and database connection strings.

---

## **🔍 1️⃣ CMD (Command Prompt) Grep Alternatives**
CMD does not have `grep`, but you can use `findstr` instead.

### **🔹 Search for "username:password" Patterns**
```cmd
findstr /R /I "username[:=].* password[:=].*" /S C:\path\to\folder\*.*
```
✅ Matches:
```
username=admin
password:SuperSecret123
```

---

### **🔹 Search for Hashes (MD5, SHA1, SHA256, NTLM)**
```cmd
findstr /R /I "[a-f0-9]\{32,64\}" /S C:\path\to\folder\*.*
```
✅ Matches:
```
5f4dcc3b5aa765d61d8327deb882cf99  # MD5
d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2  # SHA1
```

---

### **🔹 Search for Database Connection Strings**
```cmd
findstr /R /I "mysql:\/\/.*:.*@.*" /S C:\path\to\folder\*.*
```
✅ Matches:
```
mysql://root:BackDropJ2024DS2024@127.0.0.1/backdrop
postgresql://admin:SuperSecure123@localhost:5432/mydb
```

---

### **🔹 Search for API Keys and Secrets**
```cmd
findstr /R /I "api[_\-]?key[=:].*" /S C:\path\to\folder\*.*
```
✅ Matches:
```
api_key = "sk_test_4eC39HqLyjWDarjtT1zdp7dc"
apiKey='AKIAIOSFODNN7EXAMPLE'
```

---

## **🔍 2️⃣ PowerShell Grep Alternatives**
PowerShell provides more powerful filtering with `Select-String`.

### **🔹 Search for "username:password" Patterns**
```powershell
Get-ChildItem -Path "C:\path\to\folder" -Recurse | Select-String -Pattern "username[:=].* password[:=].*" -CaseSensitive
```
✅ Matches:
```
username=admin
password=SuperSecret123
```

---

### **🔹 Search for Hashes (MD5, SHA1, SHA256, NTLM)**
```powershell
Get-ChildItem -Path "C:\path\to\folder" -Recurse | Select-String -Pattern "[a-f0-9]{32,64}" -CaseSensitive
```
✅ Matches:
```
5f4dcc3b5aa765d61d8327deb882cf99  # MD5
d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2  # SHA1
```

---

### **🔹 Search for Database Connection Strings**
```powershell
Get-ChildItem -Path "C:\path\to\folder" -Recurse | Select-String -Pattern "([a-zA-Z_]*\s*=\s*[\"']?[a-z]+:\/\/[a-zA-Z0-9._%-]+:[a-zA-Z0-9%^&*()_+=-]+@[a-zA-Z0-9._-]+\/[a-zA-Z0-9._-]+)" -CaseSensitive
```
✅ Matches:
```
mysql://root:BackDropJ2024DS2024@127.0.0.1/backdrop
postgresql://admin:SuperSecure123@localhost:5432/mydb
```

---

### **🔹 Search for API Keys and Secrets**
```powershell
Get-ChildItem -Path "C:\path\to\folder" -Recurse | Select-String -Pattern "(api[_\-]?key[=:].*|aws[_\-]?secret[_\-]?access[_\-]?key[=:].*)" -CaseSensitive
```
✅ Matches:
```
api_key = "sk_test_4eC39HqLyjWDarjtT1zdp7dc"
aws_secret_access_key="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
```

---

## **🔍 Bonus: Find Passwords in Registry**
### **🔹 Search for Stored Credentials in Windows Registry**
```powershell
reg query HKLM /f "password" /t REG_SZ /s
reg query HKCU /f "password" /t REG_SZ /s
```
✅ Finds stored passwords in registry keys.

---

## **🚀 Summary**
| Feature | CMD (`findstr`) | PowerShell (`Select-String`) |
|---------|----------------|-----------------------------|
| Search for "username:password" | ✅ | ✅ |
| Search for Hashes | ✅ | ✅ |
| Search for Database Connections | ✅ | ✅ |
| Search for API Keys | ✅ | ✅ |
| Search in Windows Registry | ❌ | ✅ |

---

### **🚀 Why Use This?**
✔️ Find **hardcoded passwords, API keys, and hashes** in **config files, logs, and scripts**.  
✔️ Useful for **pentesting, security audits, and incident response**.  

🔥 **This cheatsheet is perfect for security professionals and penetration testers!** Let me know if you need **modifications or Windows-specific regex tweaks!** 🚀🔥


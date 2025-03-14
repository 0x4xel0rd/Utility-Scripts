# 🔍 Linux Grep Cheatsheet for Finding Credentials

This **cheatsheet** provides `grep` commands to search for usernames, passwords, hashes, API keys, and database connection strings in **Linux** environments.

---

## **🔍 1️⃣ Search for "username:password" Patterns**
```sh
grep -E -r -i '^[a-zA-Z0-9._%-]+[:=][a-zA-Z0-9!@#$%^&*()_+=-]+' /path/to/folder
```
✅ Matches:
```
admin:password123
root=Super$ecret!
test_user:Pa$$w0rd
```

---

## **🔍 2️⃣ Search for Credentials in Config Files**
```sh
grep -E -r -i '(user(name)?|login|auth)[^:]*[:=][^:\n]+' /path/to/folder
```
✅ Matches:
```
username = admin
user:root
login=JohnDoe
auth_key: superSecret!
```

---

## **🔍 3️⃣ Search for Hashes (MD5, SHA1, SHA256, NTLM, etc.)**
### **🔹 General Hash Search** (32-64 character hex sequences)
```sh
grep -E -r -i '\b[a-f0-9]{32,64}\b' /path/to/folder
```
✅ Matches:
```
5f4dcc3b5aa765d61d8327deb882cf99  # MD5
d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2  # SHA1
```

### **🔹 Search for NTLM Hashes**
```sh
grep -E -r -i '\b[a-f0-9]{32}:[a-f0-9]{32}\b' /path/to/folder
```
✅ Matches:
```
aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0
```

---

## **🔍 4️⃣ Search for Credentials in `.env`, `.ini`, and Shell Scripts**
```sh
grep -E -r -i '^(export\s+)?(USER|USERNAME|LOGIN|PASS|PASSWORD|SECRET|TOKEN)\s*=\s*["\']?[^"\']+["\']?' /path/to/folder
```
✅ Matches:
```ini
USERNAME=admin
PASSWORD="MyP@ssw0rd"
export SECRET=SuperSecretToken
```

---

## **🔍 5️⃣ Search for Database Connection Strings (Embedded Credentials)**
```sh
grep -E -r -i "([a-zA-Z_]*\s*=\s*[\"']?[a-z]+:\/\/[a-zA-Z0-9._%-]+:[a-zA-Z0-9%^&*()_+=-]+@[a-zA-Z0-9._-]+\/[a-zA-Z0-9._-]+)" /path/to/folder
```
✅ Matches:
```php
$database = "mysql://root:BackDropJ2024DS2024@127.0.0.1/backdrop";
$db_conn = 'postgres://user:SuperSecr3t@localhost:5432/postgresdb';
ftp_credentials = "ftp://ftp_user:ftpPass!2024@ftp.example.com/public";
```

---

## **🔍 6️⃣ Search for API Keys, AWS Keys, and Secrets**
### **🔹 Generic API Key Search**
```sh
grep -E -r -i 'api[_\-]?key\s*=\s*[\"'][A-Za-z0-9]{20,50}[\"']' /path/to/folder
```
✅ Matches:
```
api_key = "sk_test_4eC39HqLyjWDarjtT1zdp7dc"
apiKey='AKIAIOSFODNN7EXAMPLE'
```

### **🔹 AWS Secret Key Search**
```sh
grep -E -r -i 'aws[_\-]?secret[_\-]?access[_\-]?key\s*=\s*[\"'][A-Za-z0-9/+]{40}[\"']' /path/to/folder
```
✅ Matches:
```
aws_secret_access_key="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
```

---

## **📌 Additional Options for Customization**
- **Limit search to config files only**  
  ```sh
  grep -E -r -i --include=\*.{conf,ini,env,json,xml,yml,properties,php,sh} 'your_regex_here' /path/to/folder
  ```
- **Exclude system directories**  
  ```sh
  grep -E -r -i --exclude-dir={bin,lib,tmp,cache,logs,vendor} 'your_regex_here' /path/to/folder
  ```
- **Show line numbers and filenames**  
  ```sh
  grep -E -r -i -n -H 'your_regex_here' /path/to/folder
  ```

---

## **🚀 Summary**
| Feature | Linux `grep` Command |
|---------|----------------|
| Search for "username:password" | ✅ |
| Search for Hashes | ✅ |
| Search for Database Connections | ✅ |
| Search for API Keys | ✅ |

---

### **🚀 Why Use This?**
✔️ Find **hardcoded passwords, API keys, and hashes** in **config files, logs, and scripts**.  
✔️ Useful for **pentesting, security audits, and incident response**.  

🔥 **This cheatsheet is perfect for security professionals and penetration testers!** Let me know if you need **modifications or Linux-specific regex tweaks!** 🚀🔥


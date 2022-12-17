# 反詐不煩炸

## 簡介
反詐騙 App  

使用者可輸入可疑的 Line ID、傳言、網站，透過165反詐騙諮詢專線提供的 API 搜尋是否被認定為詐騙資訊，不需特別去找[警政署的網站](https://165.npa.gov.tw/#/)，翻了好幾頁找很久才知道自己碰到的資訊是不是詐騙

## APIs
來自[政府資料開放平臺](https://data.gov.tw/)
- [165反詐騙諮詢專線-詐騙LINE ID](https://data.gov.tw/dataset/78432)
- [165反詐騙諮詢專線－詐騙闢謠專區](https://data.gov.tw/dataset/38262)
- [165反詐騙諮詢專線_假投資(博弈)網站](https://data.gov.tw/dataset/160055)

## 開發過程
- [Kanban](https://volcano-equipment-e0e.notion.site/7d963c838f1946a3b1b235fafe845b48?v=04198f69aa1c410cb8c376de46fe85e4)
- [Development Diary](https://volcano-equipment-e0e.notion.site/Development-Diary-aa5418ba93994006815769caaac1df79)

## Development 
- 如果使用 vscode 開發，可使用 [Better Comment](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments) 這個 extension，附上我的 vscode settings (vscode_settings.json)
- 必須新增 .env
  ```
  FRAUD_LINE_IDS_URL="https://od.moi.gov.tw/api/v1/rest/datastore/A01010000C-001277-053"
  FRAUD_WEBSITES_URL="https://od.moi.gov.tw/api/v1/rest/datastore/A01010000C-002150-005"
  FRAUD_INFORMATION_URL="https://od.moi.gov.tw/api/v1/rest/datastore/A01010000C-000962-156"
  NPA_165_URL="https://165.npa.gov.tw/#/report/statement"
  ```
- Config -> DevMode
  - Debug
  - Release 
  - SimulateNetworkDisconneted (若使用 iOS simulator 但不想關 mac 網路時可用)
- Architecture (實際只有用到 CRUD 裡面的 R )
  - ![image](https://github.com/Risetto-Kao/anti_fraud_165/blob/main/architecture.png)

## Use case
- 使用者可以檢視、搜尋被認定為詐騙的 Line ID 
  - ![image](https://github.com/Risetto-Kao/anti_fraud_165/blob/main/preview_images/line_id.png)
- 使用者可以檢視、搜尋被認定為詐騙的網站
  - ![image](https://github.com/Risetto-Kao/anti_fraud_165/blob/main/preview_images/website.png)
- 使用者可以檢視反詐騙資訊標題，點擊可以進階顯示內容（如下圖）
  - ![image](https://github.com/Risetto-Kao/anti_fraud_165/blob/main/preview_images/info.png)
- 內有連結可以讓使用者快速連到165官網的「[我要檢舉、我要通報](https://165.npa.gov.tw/#/report/statement)」頁面

## Resources
- 首頁照片：[【法令宣導】反詐騙，謹記3C原則](https://life.ocu.edu.tw/p/406-1028-47822,r1015.php?Lang=zh-tw)
- App Icon: [165 Auti-Fraud Hot Line](https://www.npa.gov.tw/en/app/artwebsite/view?module=artwebsite&id=8035&serno=ed2427e1-de0a-4f6f-8f68-8f83b604e89b)

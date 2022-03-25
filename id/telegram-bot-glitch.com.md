# Membuat bot telegram

### Persyaratan
- akun glitch.com
- akun telegram

## Mendapatkan Token Bot
- Chat BotFather https://t.me/botfather
![image](https://user-images.githubusercontent.com/77704356/160114489-37627456-3fdf-43b7-9f36-5b1ed529cfc8.png)
-  Pastikan bisa chat dengan bot yang telah dibuat
![image](https://user-images.githubusercontent.com/77704356/160114611-bbe4e78b-1923-44f8-a110-962ca5ba89cd.png)

## Hosting Bot
- Kunjungi https://glitch.com/ pastikan sudah login
- Klik "New Project" -> "glitch-hello-node"\
![image](https://user-images.githubusercontent.com/77704356/160114953-f3073c9d-47a4-43f3-af77-b7f983619adf.png)

- Buka "package.json" -> "add package"
![image](https://user-images.githubusercontent.com/77704356/160115156-1266ae5b-f027-400d-aa31-5688f7a1f9e3.png)

- Cari package "node-telegram-bot-api" lalu install/klik\
![image](https://user-images.githubusercontent.com/77704356/160115249-e3ee2ccb-3882-4cb3-b93f-b410b0a752d7.png)

- Buka "server.js" ganti semua text dengan text yang dibawah
```js
const TelegramBot = require('node-telegram-bot-api');

// ganti text berikut dengan token yang diberikan oleh BotFather
const token = 'TELEGRAM_BOT_TOKEN';

// Buat bot dengan sistem [polling](https://en.wikipedia.org/wiki/Polling_(computer_science))
const bot = new TelegramBot(token, {polling: true});

// Mencocokan dengan "/echo text apa saja"
bot.onText(/\/echo (.+)/, (msg, match) => {
  // 'msg'  pesan dari telegram
  // 'match' hasil dari pencocokan text diatas

  const chatId = msg.chat.id;
  const resp = match[1]; // "text apa saja"

  // mengirim pesan "text apa saja" kembali
  bot.sendMessage(chatId, resp);
});

// Dengarkan pesan apa pun. Ada berbagai jenis pesan.
bot.on('message', (msg) => {
  const chatId = msg.chat.id;
  
  // Mengirim pesan
  bot.sendMessage(chatId, 'Pesan Diterima');
});
```
- Pastikan tokennya sesuai\
![image](https://user-images.githubusercontent.com/77704356/160118339-73fe9e20-1925-48a1-828c-a5e12f0b6e77.png)

- Buka telegram, lalu chat dengan bot yang sudah dibuat
![image](https://user-images.githubusercontent.com/77704356/160118313-11e9d060-4d41-4d6c-9353-5354bca69501.png)

- Selesai
- Bonus:
```js
bot.on('message', (msg) => {
  const chatId = msg.chat.id;
  bot.sendMessage(chatId, 'Pesan diterima: ' + msg.text);
});
```
```js
bot.on('message', (msg) => {
  const chatId = msg.chat.id;
  const text = msg.text;
  if (text === "hai"){
    bot.sendMessage(chatId, 'Hai ' + msg.chat.first_name);
  }
});
```
```js
bot.on('message', (msg) => {
  const chatId = msg.chat.id;
  bot.sendMessage(chatId, 'Pesan diterima: ' + JSON.stringify(msg));
});
```

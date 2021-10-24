# wallet
Смарт-контракт <b>Wallet</b> позволяет пеерводить средства на счет <b>SallerWallet</b>

### Установка
<code>tondev sol compile Wallet.sol</code>
<br>
<code>tondev sol compile SallerWallet.sol</code>
<br>
<code>tondev c d Wallet -v 12345678901234</code>
<br>
<code>tondev c d SallerWallet</code>

### Функционал
Отправить с оплатой комисси за свой счет:
<code>tondev c r Wallet sendWithComission</code>
Отправить без оплаты комиссии за свой счет:
<code>tondev c r Wallet sendWithoutComission</code>
Отправить все деньги и уничтожить кошелек:
<code>tondev c r Wallet sendAndDelete</code>

При вызове команд следует указывать в запросе <code>dest (adress):</code> знчение кошелька <b>SallerWallet</b>. Например, <code>0:ed3555fdhgvuitFFVYTDfahjsdusd</code>.
В запросе <code>amount (uint128)</code> - желаемую сумму для первода.
В запросе <code>bounce (bool):</code> - указать <code>true</code>.

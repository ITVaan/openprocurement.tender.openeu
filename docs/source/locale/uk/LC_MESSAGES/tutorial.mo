��    z      �      �      �  ,   �  l   �  ?   W  7   �  :   �  5   
	     @	     H	     Z	     k	  0   |	  #   �	  =   �	  m   
  k  }
  ,   �       4   (  >   ]     �     �  x   �     >  *   N  X   y  	   �  :   �  8     G   P     �  >   �  B   �  T   0  r   �  <   �  �   5  T   �  �     X   �  X     N   f  /   �  #   �  S   	     ]  %   x  8   �  +   �  3     )   7  -   a  ,   �  L   �     	     )  &   H     o  '   �  '   �  �   �  �   {  -   �     ,  "   J  \   m  L   �  E     !   ]  �     '     o   +     �  G   �  [   �     R     i  -   y  3   �  t   �     P     h      �  u   �  �    P   �  ?   4  6   t  �   �  W   �  9   �  �   "   z   �   G   ,!  2   t!  l   �!     "  "   "     @"      Y"     z"  !   �"     �"  :   �"  (   #  �   0#  �   �#  �   �$  c   %  6   z%  ;   �%  D   �%  9   2&  D   l&  �   �&  `   W'  W   �'  r   (  |   �(  F    )  7   G)     )     �)  L   �+  �   �+  j   �,  �   ;-  ]   �-  v   .     �.  -   �.  /   �.  0   /  s   2/  S   �/  �   �/  �   �0  V  r1  K   �3  '   4  O   =4  l   �4      �4  3   5  �   O5  %   6  b   56  �   �6  (   E7  �   n7  P   �7  p   B8     �8  \   �8  k   ,9  �   �9    #:  �   0;  /  �;  �   =    �=  �   �>  �   �?  �   @@  J   �@  9   !A  u   [A  =   �A  >   B  @   NB  <   �B  Z   �B  b   'C  L   �C  H   �C  �    D  3   �D  ;   �D  B   E  )   UE  @   E  :   �E  6  �E  Q  2G  �   �H  :   I  ;   WI  �   �I  x   UJ  }   �J  ;   LK  �   �K  o   }L  �   �L  -   �M  U   �M  �   ?N  <   �N  )   O  V   >O     �O  �   P  4   �P  A   �P  9   @Q    zQ  �  �R  �   �U  j   'V  �   �V  l  W  �   �X  j   1Y  9  �Y  �   �Z  �   �[  U   1\  �   �\     &]  =   7]  *   u]  A   �]  -   �]  �   ^  3   �^  g   �^  L   3_    �_  %  �`  r  �a  �   .c  e   �c  �   Md  v   �d  ]   be  o   �e  D  0f  �   ug  �   h    �h  �   �i  �   �j  ^   (k  '   �k   Activating the request and cancelling tender After auction is scheduled anybody can visit it to watch. The auction can be reached at `Tender.auctionUrl`: And again we can confirm that there are two documents uploaded. And check that qualified bids are switched to `active`: And we can see that it is overriding the original version: Approve first two bids through qualification objects: Auction Bid Qualification Bid confirmation Bid invalidation Bidder can register a bid with ``draft`` status: Bidder should confirm bid proposal: Bidders can find out their participation URLs via their bids: By default contract value is set based on the award, but there is a possibility to set custom contract value. By default, document language is Ukrainian. You can can change it and set another language for the document by assigning appropriate language code to the `language` field (available options: ``uk``, ``en``, ``ru``). You can also set document's title (e.g. `title_en`) and description (e.g. `description_en`) fields. See :ref:`Document` data structure for details. Cancel the tender with the prepared reasons. Cancelling tender Change the document description and other properties Checking the listing again reflects the new modification date: Confidentiality Confirming qualification Content of private documents (`buyerOnly`) can be accessed only by procuring entity or by participant who uploaded them. Creating tender Documents can be either public or private: Eligibility documents will be stored in `eligibility_documents` attribute of :ref:`Bid`. Enquiries Enquiries can be made only during ``Tender.enqueryPeriod`` Error states that no `data` has been found in JSON body. Error states that the only accepted Content-Type is `application/json`. Exploring basic rules Fill it with the protocol describing the cancellation reasons. Filling cancellation with protocol and supplementary documentation Financial documents will be stored in `financial_documents` attribute of :ref:`Bid`. Financial, eligibility and qualification documents are also a part of Bid but are located in different end-points. Financial, eligibility and qualification documents uploading Financial, eligibility and qualification documents will be publicly accessible after the auction. Here is bidder proposal with all documents. If tender has status `active.qualification` winner can upload only public documents. If tender is modified, status of all bid proposals will be changed to ``invalid``. Bid proposal will look the following way after tender has been modified: If this date is not set, it will be auto-generated on the date of contract registration. If you want to **lower contract value**, you can insert new one into the `amount` field. In case we made an error, we can reupload the document over the older version: It is possible to check the uploaded documents: Just invoking it reveals empty set. Let's access the URL of the created object (the `Location` header of the response): Let's list qualifications: Let's mark the document as "private": Let's provide the data attribute in the submitted body : Let's satisfy the Content-type requirement: Let's see the list of all added contract documents: Let's see the list of contract documents: Let's see what listing of tenders reveals us: Let's try exploring the `/tenders` endpoint: Let's update tender by supplementing it with all other essential properties: Let's upload contract document: Let's upload private document: Let's view separate contract document: Modifying tender Now let's attempt creating some tender: One can retrieve either questions list: Only the request that has been activated (3rd step above) has power to cancel tender.  I.e.  you have to not only prepare cancellation request but to activate it as well. Open EU procedure demands at least two bidders, so there should be at least two bid proposals registered to move to auction stage: Open EU procedure requires bid qualification. Prepare cancellation request. Preparing the cancellation request Privacy settings can be changed only during `tenderPeriod` (with `active.tendering` status). Privacy settings can be changed only for the latest version of the document. Procuring entity approves qualifications by switching to next status: Procuring entity can answer them: Procuring entity can not change tender if there are less than 7 days before tenderPeriod ends. Changes will not be accepted by API. Procuring entity can set bid guarantee: Procuring entity can upload PDF files into the created tender. Uploading should follow the :ref:`upload` rules. Proposal Uploading Qualification commission registers its decision via the following call: Qualification documents will be stored in `qualificationDocuments` attribute of :ref:`Bid`. Register one more bid: Registering bid Rejected bid is not shown in `bids/` listing. See :ref:`cancellation` data structure for details. See the `Bid.participationUrl` in the response. Similar, but different, URL can be retrieved for other participants: Setting  contract value Setting contract signature date Setting contract validity period Setting contract validity period is optional, but if it is needed, you can set appropriate `startDate` and `endDate`. Success! Now we can see that new object was created. Response code is `201` and `Location` response header reports the location of the created object.  The body of response reveals the information about the created tender: its internal `id` (that matches the `Location` segment), its official `tenderID` and `dateModified` datestamp stating the moment in time when tender was last modified.  Note that tender is created with `active.tendering` status. Tender creator can cancel tender anytime. The following steps should be applied: Tender status ``active.tendering`` allows registration of bids. That is why tenderPeriod has to be extended by 7 days. The peculiarity of the Open EU procedure is that ``procurementMethodType`` was changed from ``belowThreshold`` to ``aboveThresholdEU``. Also there is no opportunity to set up ``enquiryPeriod``, it will be assigned automatically. The single array element describes the uploaded document. We can upload more documents: Then bidder should upload proposal technical document(s): There are two possible types of cancellation reason: tender was `cancelled` or `unsuccessful`. By default ``reasonType`` value is `cancelled`. There is a possibility to set custom contract signature date. You can insert appropriate date into the `dateSigned` field. There is possibility to upload eligibility and qualification documents: There is possibility to upload financial document: To define the document as "private" - `confidentiality` and `confidentialityRationale` fields should be set. Tutorial Upload new version of the document Upload the file contents Uploading contract documentation Uploading documentation We can access rejected bid by id: We can also reject bid: We can see the same response we got after creating tender. We can upload another contract document: We do see the internal `id` of a tender (that can be used to construct full URL by prepending `http://api-sandbox.openprocurement.org/api/0/tenders/`) and its `dateModified` datestamp. We see the added properies have merged with existing tender data. Additionally, the `dateModified` property was updated to reflect the last modification datestamp. When tender has ``active.tendering`` status and ``Tender.enqueryPeriod.endDate``  hasn't come yet, interested parties can ask questions: When you upload new version of the document, privacy settings are copied from the previous version. You can change ``reasonType`` value to `unsuccessful`. You can upload contract documents for the OpenEU procedure. You may notice 10 day stand-still time set in `qualificationPeriod`. You should pass `reason`, `status` defaults to `pending`. `200 OK` response was returned. The value was modified successfully. `201 Created` response code and `Location` header confirm document creation. We can additionally query the `documents` collection API endpoint to confirm the action: `201 Created` response code and `Location` header confirm that the second document was uploaded. `201 Created` response code and `Location` header confirm that this document was added. `confidentialityRationale` field is required only for private documents and should contain at least 30 characters. `confidentiality` field value can be either `buyerOnly` (document is private) or `public` (document is publicly accessible). `id` is autogenerated and passed in the `Location` header of response. and then approve bid by changing status to ``pending``: or individual answer: Project-Id-Version: openprocurement.tender.openeu 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-02-16 12:53+0200
PO-Revision-Date: 2016-06-13 13:12+0200
Last-Translator: sorenabell <sorenabell@quintagroup.com>
Language-Team: Ukrainian <support@quintagroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: uk
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
X-Generator: Lokalize 2.0
 Активація запиту та скасування закупівлі Після того, як аукціон заплановано, будь-хто може його відвідати для перегляду. Аукціон можна подивитись за допомогою `Tender.auctionUrl`: І знову можна перевірити, що є два завантажених документа. Та перевірити, що вже кваліфіковані пропозиції переключені в стан `active`: І ми бачимо, що вона перекриває оригінальну версію: Підтвердіть перші дві пропозиції через кваліфікаційні об’єкти: Аукціон Кваліфікація пропозицій Підтвердження пропозиції Пропозиція стає недійсною Учасник може зареєструвати ставку із статусом ``draft`` (чернетка): Учасник повинен підтвердити свою пропозицію: Учасники можуть дізнатись свої URL-адреси для участі через свої пропозиції: За замовчуванням вартість угоди встановлюється на основі рішення про визначення переможця, але є можливість змінити це значення. За замовчуванням мовою документа є українська. Ви можете змінити це і встановити іншу мову для документа, призначивши відповідний код мови полю `language` (можливі варіанти: ``uk``, ``en``, ``ru``). Ви можете також додати поля назви (наприклад, `title_en`) та опису (наприклад, `description_en`). Див. структуру даних :ref:`Document` для більш детальної інформації. Скасуйте закупівлю через подані причини. Скасування закупівлі Змініть опис документа та інші властивості Ще одна перевірка списку відображає нову дату модифікації: Конфіденційність Підтвердження кваліфікації Вміст приватних документів (`buyerOnly`) закритий для всіх крім замовника і учасника, який подав ці документи. Створення закупівлі Документи можуть бути або публічними, або приватними: Документи для критеріїв прийнятності зберігатимуться в атрибуті `eligibility_documents` об’єкта :ref:`Bid`. Уточнення і запитання Запитання можна задавати лише протягом періоду уточнень ``Tender.enqueryPeriod``. Помилка вказує, що `data` не знайдено у тілі JSON. Помилка вказує, що єдиний прийнятний тип вмісту це `application/json`. Базові правила Наповніть його протоколом про причини скасування. Наповнення протоколом та іншою супровідною документацією Фінансові документи зберігатимуться в атрибуті `financial_documents` об’єкта :ref:`Bid`. Документи для критеріїв прийнятності, фінансові та кваліфікаційні документи також є частиною пропозиції, але зберігаються в різних точках входу. Завантаження документів для критеріїв прийнятності, фінансових та кваліфікаційних документів. Документи для критеріїв прийнятності, фінансові та кваліфікаційні документи стануть публічно доступні після аукціону. Ось пропозиція учасника з усіма документами. Якщо закупівля має статус `active.qualification`, переможець може завантажувати тільки публічні документи. Якщо закупівля була модифікована, статус всіх пропозицій змінюється на ``invalid`` (недійсний). Ось так пропозиція буде виглядати після редагування закупівлі: Якщо ви не встановите дату підписання, то вона буде згенерована автоматично під час реєстрації угоди. Якщо ви хочете **знизити вартість угоди**, ви можете встановити нове значення для поля `amount`. Якщо сталась помилка, ми можемо ще раз завантажити документ поверх старої версії: Можна перевірити завантажені документи: При виклику видає пустий набір. Використаємо URL створеного об’єкта (заголовок відповіді `Location`): Переглянемо список кваліфікацій: Позначимо документ як "приватний": Введемо data атрибут у поданому тілі: Задовільнимо вимогу типу вмісту: Подивимось список усіх доданих документів угоди: Подивимось на список документів пов’язаних з угодою: Подивимось, що показує список закупівель: Подивимось як працює точка входу `/tenders`: Оновимо закупівлю шляхом надання їй усіх інших важливих властивостей: Завантажимо документ угоди: Завантажимо приватний документ: Переглянемо окремий документ угоди: Редагування закупівлі Спробуймо створити нову закупівлю: Можна отримати список запитань: Запит на скасування, який не пройшов активації (3-й крок), не матиме сили, тобто, для скасування закупівлі буде обов’язковим не тільки створити заявку, але і активувати її. Для того, щоб процедура відкритих торгів з публікацією англ. мовою відбулась, необхідно хоча б два учасника, тобто хоча б дві пропозиції повинні бути зареєстровані до початку аукціону: Для відкритих торгів з публікацією англ. мовою необхідна кваліфікація пропозицій. Приготуйте запит на скасування. Формування запиту на скасування Налаштування приватності можна міняти тільки під час періоду подання пропозицій (зі статусом `active.tendering`). Приватність документа можна змінити тільки для останньої версії. Замовник підтверджує кваліфікацію переходом до наступного статусу: Замовник може відповісти на них: Замовник не може редагувати закупівлю, якщо залишилось менше 7 днів до завершення періоду подання пропозицій. API таких змін не прийме. Замовник може встановити забезпечення тендерної пропозиції Замовник може завантажити PDF файл у створену закупівлю. Завантаження повинно відбуватись згідно правил :ref:`upload`. Завантаження пропозиції Кваліфікаційна комісія реєструє своє рішення: Кваліфікаційні документи зберігатимуться в атрибуті `qualificationDocuments` об’єкта :ref:`Bid`. Зареєструємо ще одну пропозицію: Реєстрація пропозиції Відхилена пропозиція не присутня в списку `bids/`. Дивіться структуру запиту :ref:`cancellation` для більш детальної інформації. Дивіться на `Bid.participationUrl` у відповіді. Схожу, але іншу, URL-адресу можна отримати для інших учасників. Встановлення вартості угоди Встановлення дати підписання угоди Встановлення терміну дії угоди Встановлення терміну дії угоди необов’язкове, але, якщо є необхідність, ви можете встановити відповідну дату початку `startDate` та кінця `endDate` терміну дії. Успіх! Тепер ми бачимо, що новий об’єкт було створено. Код відповіді `201` та заголовок відповіді `Location` вказує місцерозташування створеного об’єкта. Тіло відповіді показує інформацію про створену закупівлю, її внутрішнє `id` (яке співпадає з сегментом `Location`), її офіційне `tenderID` та `dateModified` дату, що показує час, коли закупівля востаннє модифікувалась. Зверніть увагу, що закупівля створюється зі статусом `active.tendering`. Замовник може скасувати закупівлю у будь-який момент. Для цього виконайте наступні кроки: Статус закупівлі ``active.tendering`` дозволяє подання пропозицій. Ось чому потрібно продовжити період подання пропозицій (`tenderPeriod`) на 7 днів. Особливість відкритих торгів з публікацією англ. мовою в тому, що ``procurementMethodType`` було змінено з ``belowThreshold`` на ``aboveThresholdEU``.  Також тут неможливо встановити ``enquiryPeriod``, бо він буде призначений автоматично. Один елемент масиву описує завантажений документ. Ми можемо завантажити більше документів: Потім учасник повинен завантажити документ(и) пропозиції: При скасуванні, замовник має визначити один з двох типів ``reasonType``: торги відмінені - `cancelled`, або торги не відбулися - `unsuccessful`. За замовчуванням, значення ``reasonType`` рівне `cancelled`. Є можливість встановити дату підписання угоди. Для цього вставте відповідну дату в поле `dateSigned`. Є можливість завантажити кваліфікаційні документи та документи для критеріїв прийнятності. Є можливість завантажити фінансовий документ: Щоб зробити документ "приватним", потрібно встановити поля `confidentiality` та `confidentialityRationale`. Туторіал Завантажте нову версію документа Завантажте вміст файлу Завантаження документації по угоді Завантаження документів Можна отримати доступ до відхиленої пропозиції за її ідентифікатором `id`: Можна відхилити пропозицію: Ми бачимо ту ж відповідь, що і після створення закупівлі. Можна завантажити ще один документ угоди: Ми бачимо внутрішнє `id` закупівлі (що може бути використано для побудови повної URL-адреси, якщо додати `http://api-sandbox.openprocurement.org/api/0/tenders/`) та її `dateModified` дату. Ми бачимо, що додаткові властивості об’єднані з існуючими даними закупівлі. Додатково оновлена властивість `dateModified`, щоб відображати останню дату модифікації. Якщо закупівля має статус ``active.tendering`` та дата завершення періоду подання пропозицій ``Tender.enqueryPeriod.endDate`` ще не прийшла , то зацікавлені учасники можуть задавати питання чи просити уточнень умов закупівлі: При завантаженні нової версії, налаштування приватності копіюються з попередньої версії документа. Ви можете виправити тип на `unsuccessful` (торги не відбулися). Ви можете завантажити документи угоди для відкритих торгів з публікацією англ. мовою. Зверніть увагу на період блокування в 10 днів під час `qualificationPeriod`. Ви повинні передати змінні `reason`, `status` у стані `pending`. Було повернуто код відповіді `200 OK`. Значення змінено успішно. Код відповіді `201 Created` та заголовок `Location` підтверджують, що документ було створено. Додатково можна зробити запит точки входу API колекції документів (`documents`), щоб підтвердити дію: Код відповіді `201 Created` та заголовок `Location` підтверджують, що ще один документ було додано. Код відповіді `201 Created` та заголовок `Location` підтверджують, що документ було додано. Поле `confidentialityRationale` необхідне лише для приватних документів. Його значенням має бути пояснення причини конфіденційності документа (не менше ніж 30 символів). Значенням поля `confidentiality` може бути або `buyerOnly` - документ приватний, або `public` - документ публічно доступний. `id` генерується автоматично і повертається у додатковому заголовку відповіді `Location`: та підтвердити ставку, змінивши її статус на ``pending``: або окрему відповідь: 
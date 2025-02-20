# Tutorial 2: Introduction to Game Engine 🎮

![image](https://github.com/user-attachments/assets/df2c0da0-a30f-422b-a469-69f677aafd8b)

# Latihan: Playtest

## Apa saja pesan log yang dicetak pada panel Output?

Saat run project pertama kali, tercetak output **"Platform initialized"**, yang berasal dari function `_ready()` pada `PlatformBlue.gd`, menandakan bahwa node memasuki scene tree pertama kali. Ketika objek landasan digerakkan ke atas hingga objek pesawatnya hampir menyentuh batas atas area permainan/window, tercetak output **"Reached objective!"** yang berasal dari function `_on_ObjectiveArea_body_entered(body: RigidBody2D)` pada `ObjectiveArea.gd`. Fungsi tersebut akan mengecek nama objek RigidBody2D yang memasuki ObjectiveArea, jika objeknya bernama "BlueShip", maka akan me-print output **"Reached objective!"**

## Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?

![Screenshot 2025-02-20 225253](https://github.com/user-attachments/assets/e935a9cc-37c3-405d-a211-7e1eb4b2630d)

Ketika landasan digerakkan ke batas area bawah, tidak keluar pesan log apapun pada panel output. Namun, ketika landasan digerakkan kembali ke atas hingga hampir menyentuh batas atas, tercetak output **"Reached objective!"**.

## Buka scene MainLevel dengan tampilan workspace 2D. Apakah lokasi scene ObjectiveArea memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?

Pada tampilan workspace 2D, terlihat bahwa lokasi scene ObjectiveArea beserta CollisionShape2Dnya berada pojok kiri atas area permainan/window. Hal ini membuat event akan ter-trigger ketika landasan (beserta pesawatnya) di gerakkan ke atas dan mencapai ObjectiveArea.

---

# Latihan: Memanipulasi Node dan Scene

## Scene BlueShip dan StonePlatform sama-sama memiliki sebuah child node bertipe Sprite. Apa fungsi dari node bertipe Sprite?

![Screenshot 2025-02-20 220359](https://github.com/user-attachments/assets/c5a2f447-be98-438a-9e33-2b46e25bb271)

Node bertipe Sprite adalah node yang menampilkan texture atau representasi visual dari objek di dalam game. Berdasarkan Godot [docs](https://docs.godotengine.org/en/stable/classes/class_sprite2d.html), Sprite2D menampilkan 2D texture, yang dapat berupa region dari atlas texture yang lebih besar, atau frame dari sprite sheet animation.

## Root node dari scene BlueShip dan StonePlatform menggunakan tipe yang berbeda. BlueShip menggunakan tipe RigidBody2D, sedangkan StonePlatform menggunakan tipe StaticBody2D. Apa perbedaan dari masing-masing tipe node?

* [RigidBody2D](https://docs.godotengine.org/en/stable/classes/class_rigidbody2d.html) adalah 2D physics body yang akan bergerak jika dikenakan simulasi fisika. Node ini tidak dapat dikontrol secara langsung, namun bisa dikenakan gaya/force, seperti gravitasi, impuls, collision, dll. Rigid body akan selalu me-maintain bentuk dan ukurannya, bahkan jika dikenakan gaya. Seperti pada BlueShip, bentuk dan ukurannya berubah walaupun terkena gravitasi dan bertubrukan dengan StonePlatform.

* [StaticBody2D](https://docs.godotengine.org/en/stable/classes/class_staticbody2d.html) adalah 2D physics body yang bersifat statis. Artinya objek tidak dapat dipindahkan oleh external forces pada lingkungan atau kontak dengan objek lain, namun bisa dipindahkan secara manual dengan cara lain, seperti code, AnimationMixers, dan RemoteTransform2D.

## Ubah nilai atribut Mass pada tipe RigidBody2D secara bebas di scene BlueShip, lalu coba jalankan scene MainLevel. Apa yang terjadi?

Saya mencoba mengganti nilai mass menjadi 0.001 kg dan 1000 kg, namun, **tidak terlihat perbedan** yang signifikan antara mass 0.001 kg, 1 kg, dan 1000 kg. Ketiga BlueShip dengan mass berbeda tersebut jatuh dengan kecepatan yang sama. Hal ini mungkin dapat terjadi mengikuti hukum fisika di dunia nyata, dimana kecepatan jatuh benda hanya dipengaruhi oleh percepatan gravitasi dan gaya gesek. Selain itu, StaticBody2D (StonePlatform) tidak memiliki properti physics seperti gaya atau impuls, sehingga mungkin tidak ada perbedaan "feel" berat ketika mengangkat BlueShip yang bermassa 1000 kg dengan 0.001 kg.

Namun, jika saya mencoba mengganti gravity scale menjadi 10, terlihat bahwa BlueShip sangat cepat jatuh hingga cenderung menempel dengan StonePlatform.

## Ubah nilai atribut Disabled pada tipe CollisionShape2D di scene StonePlatform, lalu coba jalankan scene MainLevel. Apa yang terjadi?

![Screenshot 2025-02-20 224949](https://github.com/user-attachments/assets/1479e49b-9d0a-46c5-a91d-ac367befae20)

Ketika diinisialisasi, StonePlatform akan dilewati oleh BlueShip, dan BlueShip akan jatuh ke bawah.

## Pada scene MainLevel, coba manipulasi atribut Position, Rotation, dan Scale milik node BlueShip secara bebas. Apa yang terjadi pada visualisasi BlueShip di Viewport?

Visualisasi BlueShip pada viewport akan berubah mengikuti atribut yang diubah. Atribut **position** mengatur posisi (x, y) pada area permainan, **rotation** mengatur rotasi dari objek dalam derajat, dan **scale** mengatur skala atau ukuran dari objek.

## Pada scene MainLevel, perhatikan nilai atribut Position node PlatformBlue, StonePlatform, dan StonePlatform2. Mengapa nilai Position node StonePlatform dan StonePlatform2 tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?

Dalam scene MainLevel, node StonePlatform dan StonePlatform2 berada di dalam node PlatformBlue sebagai child. Dalam Godot, posisi node child dihitung relatif terhadap parent-nya. StonePlatform memiliki posisi (0, 0), yang berarti StonePlatform berada tepat di pusat PlatformBlue. Sedangkan StonePlatform2 berada pada (70, 0), yang berarti StonePlatform2 berada 70 pixel ke kanan dari pusat PlatformBlue.

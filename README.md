# Latihan: Playtest

## Apa saja pesan log yang dicetak pada panel Output?

Saat run project pertama kali, tercetak output **"Platform initialized"**, yang berasal dari function `_ready()` pada `PlatformBlue.gd`, menandakan bahwa node memasuki scene tree pertama kali. Ketika objek landasan digerakkan ke atas hingga objek pesawatnya hampir menyentuh batas atas area permainan/window, tercetak output **"Reached objective!"** yang berasal dari function `_on_ObjectiveArea_body_entered(body: RigidBody2D)` pada `ObjectiveArea.gd`. Fungsi tersebut akan mengecek nama objek RigidBody2D yang memasuki ObjectiveArea, jika objeknya bernama "BlueShip", maka akan me-print output **"Reached objective!"**

## Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?

Ketika landasan digerakkan ke batas area bawah, tidak keluar pesan log apapun pada panel output. Namun, ketika landasan digerakkan kembali ke atas hingga hampir menyentuh batas atas, tercetak output **"Reached objective!"**.

## Buka scene MainLevel dengan tampilan workspace 2D. Apakah lokasi scene ObjectiveArea memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?

Pada tampilan workspace 2D, terlihat bahwa lokasi scene ObjectiveArea beserta CollisionShape2Dnya berada pojok kiri atas area permainan/window. Hal ini membuat event akan ter-trigger ketika landasan (beserta pesawatnya) di gerakkan ke atas dan mencapai ObjectiveArea.
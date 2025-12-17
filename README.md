
Bu repository, Terraform öğrenirken attığım adımları bilinçli ve sindirerek ilerlemek amacıyla oluşturulmuştur.

Buradaki hedef “çalışıyor olması”ndan çok:
	•	neden çalıştığını anlamak
	•	hata yaptığımda nerede ve neden hata yaptığımı görebilmek
	•	gerçek dünyadaki DevOps / Cloud senaryolarına yavaş yavaş yaklaşmaktır.

⸻

🧭 Bu Repo Ne Yapıyor?

Bu repo şu an için çok küçük bir iş yapıyor gibi görünebilir:

👉 AWS üzerinde bir S3 bucket oluşturuyor.

Ama asıl kazanım:
	•	Terraform’un nasıl düşündüğünü
	•	state dosyasının ne işe yaradığını
	•	bazı kaynakların neden “değiştirilemez (immutable)” olduğunu
	•	Git ile birlikte nasıl güvenli kullanıldığını

bilerek ve adım adım öğrenmek.

⸻

Yaklaşımım şu prensiplerle ilerliyor:
	•	Küçük adımlar
	•	Her adımda neden böyle yaptık? sorusu
	•	Ezber yerine mantık
	•	Gerçek AWS kaynakları ile çalışma

Amaç: “Terraform biliyorum” demek değil,
Terraform ile düşünebilmek.

⸻

🧱 Şu Ana Kadar Yapılanlar (Gün Gün)

✅ Gün 1–2: Temeller
	•	Terraform kurulumu
	•	AWS provider tanımı
	•	Variable kullanımı
	•	terraform init / plan / apply / destroy
	•	AWS S3 bucket oluşturma

Bu aşamada özellikle:
	•	state dosyası
	•	Terraform’un mevcut durum ile kodu nasıl karşılaştırdığı
	•	Bucket name değiştiğinde neden destroy + create yaptığı

üzerine odaklanıldı.

⸻

📁 Proje Yapısı

terraform-docker/
├── .gitignore        # State ve gizli dosyalar bilerek dışarıda
├── main.tf           # Provider ve resource tanımları
├── variables.tf      # Değişkenler
└── README.md         # Bu öğrenme notları


⸻

🔐 Git ve Güvenlik

Aşağıdaki dosyalar bilinçli olarak GitHub’a eklenmez:
	•	terraform.tfstate
	•	.terraform/
	•	terraform.tfvars

Sebep:
	•	State dosyası canlı altyapıyı temsil eder
	•	AWS bilgileri ve kaynak detayları içerir

Bu repo aynı zamanda Git + Terraform birlikte nasıl kullanılır sorusuna pratik bir cevaptır.daha sonra docker ile birlikte kullanmayı düşünüyorum.

⸻

 Nasıl Çalıştırılır?

Bu repo’yu çalıştırmak için:

terraform init
terraform plan
terraform apply

Kaynakları kaldırmak için:

terraform destroy


⸻

🔜 Sonraki Adımlar (Planlanan)

Bu repo zamanla aşağıdaki adımlarla büyüyecek:
	•	Terraform ile EC2 oluşturma
	•	EC2 üzerinde Docker kurulumu
	•	Basit bir container deploy etme
	•	Terraform module yapısını genişletme
	•	Değişikliklerin Git üzerinden yönetimi

Her adım ayrı bir öğrenme konusu olacak şekilde ilerleyecek.
 
Yani bu bir sonuç değil, başlangıç.

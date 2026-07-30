Bu repository, Terraform öğrenirken attığım adımları bilinçli ve sindirerek ilerlemek amacıyla oluşturulmuştur.

Buradaki hedef "çalışıyor olması"ndan çok:
	•	neden çalıştığını anlamak
	•	hata yaptığımda nerede ve neden hata yaptığımı görebilmek
	•	gerçek dünyadaki DevOps / Cloud senaryolarına yavaş yavaş yaklaşmaktır.

⸻

🧭 Bu Repo Ne Yapıyor?

Bu repo şu an için AWS üzerinde temel bir altyapı oluşturuyor:

👉 AWS üzerinde bir S3 bucket oluşturuyor.
👉 Docker çalıştıran bir EC2 instance oluşturuyor.
👉 Security Group ile SSH ve HTTP erişimi sağlıyor.
👉 EC2 üzerinde Nginx ve Whoami container'larını çalıştırıyor.

Ama asıl kazanım:
	•	Terraform'un nasıl düşündüğünü
	•	state dosyasının ne işe yaradığını
	•	bazı kaynakların neden "değiştirilemez (immutable)" olduğunu
	•	Git ile birlikte nasıl güvenli kullanıldığını
	•	Modüler yapıyı nasıl kurduğunu

bilerek ve adım adım öğrenmek.

⸻

Yaklaşımım şu prensiplerle ilerliyor:
	•	Küçük adımlar
	•	Her adımda neden böyle yaptık? sorusu
	•	Ezber yerine mantık
	•	Gerçek AWS kaynakları ile çalışma

Amaç: "Terraform biliyorum" demek değil,
Terraform ile düşünebilmek.

⸻

🧱 Şu Ana Kadar Yapılanlar (Gün Gün)

✅ Gün 1–2: Temeller
	•	Terraform kurulumu
	•	AWS provider tanımı
	•	Variable kullanımı
	•	terraform init / plan / apply / destroy
	•	AWS S3 bucket oluşturma

✅ Gün 3–4: EC2 ve Docker
	•	EC2 instance oluşturma
	•	Security Group yapılandırması
	•	User data ile otomatik kurulum
	•	Docker ve Nginx kurulumu
	•	Container çalıştırma

✅ Gün 5: Modüler Yapı
	•	S3 modülü oluşturma
	•	Variables ve outputs yapılandırması
	•	Module kullanımı
	•	Hata ayıklama ve syntax düzeltmeleri

Bu aşamada özellikle:
	•	state dosyası yönetimi
	•	Terraform'un mevcut durum ile kodu nasıl karşılaştırdığı
	•	Bucket name değiştiğinde neden destroy + create yaptığı
	•	Module yapılandırması ve hata ayıklama
	•	Output'ların nasıl kullanılacağı

üzerinde odaklanıldı.

⸻

📁 Proje Yapısı

terraform-docker/
├── .gitignore           # State ve gizli dosyalar bilerek dışarıda
├── main.tf              # Provider, security group ve modül çağrıları
├── ec2.tf               # EC2 instance ve user_data konfigürasyonu
├── variables.tf         # Global değişkenler
├── terraform.tfvars     # Değişken değerleri (Git'e eklenmez)
├── modules/             # Modüler yapı
│   └── s3/              # S3 modülü
│       ├── main.tf      # S3 bucket resource'u
│       ├── variables.tf # Modül değişkenleri
│       └── outputs.tf   # Modül output'ları
└── README.md            # Bu öğrenme notları

⸻

🔐 Git ve Güvenlik

Aşağıdaki dosyalar dynamodb de saklanarak bilinçli olarak GitHub'a eklenmez:
	•	terraform.tfstate
	•	.terraform/
	•	terraform.tfvars
	•	*.backup dosyaları

Sebep:
	•	State dosyası canlı altyapıyı temsil eder
	•	AWS bilgileri ve kaynak detayları içerir
	•	Sensitive verileri korumak için

Bu repo aynı zamanda Git + Terraform birlikte nasıl kullanılır sorusuna pratik bir cevaptır.

⸻

🚀 Nasıl Çalıştırılır?

Bu repo'yu çalıştırmak için:

```bash
terraform init
terraform plan
terraform apply
```

Kaynakları kaldırmak için:

```bash
terraform destroy
```

⸻

🔍 Öğrenilen Konular

### Terraform Temelleri
- Provider konfigürasyonu
- Resource oluşturma ve yönetme
- Variables ve outputs kullanımı
- State dosyası yönetimi

### AWS Kaynakları
- S3 bucket oluşturma ve yapılandırma
- EC2 instance yönetimi
- Security Group kuralları
- IAM rolleri ve politikaları

### Modüler Yapı
- Module oluşturma ve kullanma
- Değişken yönetimi
- Output'ların kullanımı
- Hata ayıklama ve syntax düzeltmeleri

### Docker Entegrasyonu
- EC2 üzerinde Docker kurulumu
- Container yönetimi
- User data ile otomatizasyon

⸻

🔜 Sonraki Adımlar (Planlanan)

Bu repo zamanla aşağıdaki adımlarla büyüyecek:
	•	S3 bucket güvenlik yapılandırmaları (encryption, versioning)
	•	IAM rolleri ve instance profile'lar
	•	Remote backend (S3 + DynamoDB)
	•	Load Balancer ekleme
	•	Auto Scaling Group yapılandırması
	•	Terraform workspace kullanımı
	•	Multi-environment yönetimi

Her adım ayrı bir öğrenme konusu olacak şekilde ilerleyecek.
 
Yani bu bir sonuç değil, başlangıç.

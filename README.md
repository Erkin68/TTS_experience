# TTS_experience
TTS training experience using uzbek language.

Avval C da kompilyatsiya qilish uchun tensorflowni build qilib oldim.
Bazel versiyasi 3.3.1.

Tacotron - Cpp qismini cmake bilan bajardim:
1. .//scripts/bootstrap.sh
2. cd build
3. make

Bunda faqatgina tf_synthesizer.cc.o fayli menga kerak edi.4 qatorda 25%,50%,75% larni ko'rsatib so'ngra xato beradi.
Shuni o'zi bizga yetadi.Obj-faylimiz - tayyor.

GCC obj faylni faqat ulashda ishlatishni ko'rsatsak ham qiyin bajaradi, shundan Qt da loyiha ko'taramiz.

Hammasi yaxshi yakun topib elf faylimiz tayyor bo'lganda ham shunday syurprizga duch keldikki:...
Pythonga qaytishga majbur bo'ldik. Ming urinmaylik CUDA initda tashlab yuborayapti.
Tensorflowni C tayyor library sini gpu uchun har xilini o'rnatib ko'rsak ham shu ahvol.
Eng zo'r variantda CPU: AWX,SSE2-3-4 lar bilan - 6-8 sek, odatiyda 25-35 sek.
Pythonda esa CUDA bilan 1-sekund atrofida, treyning - 1 - kechada.

Tamom, hozir o'zbekcha wav fayllarni kutayapman.

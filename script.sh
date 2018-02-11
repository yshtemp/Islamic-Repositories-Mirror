sudo apt install -y -q sox libsox-fmt-mp3
echo "Fetching:"
for i in 0 {1..22}; do echo http://resources.zad-academy.com/Semester1/Aqeedah/Audios/lecture$i\_Aqeedah_Semester1.mp3 >> Aqeedah.txt ; done
for i in 0 {1..22}; do echo http://resources.zad-academy.com/Semester1/Tafsir/Audios/lecture$i\_Tafsir_Semester1.mp3 >> Tafsir.txt ; done
for i in 0 {1..22}; do echo http://resources.zad-academy.com/Semester1/Hadith/Audios/lecture$i\_Hadith_Semester1.mp3 >> Hadith.txt ; done
for i in 0 {1..22}; do echo http://resources.zad-academy.com/Semester1/Seerah/Audios/lecture$i\_Seerah_Semester1.mp3 >> Seerah.txt ; done
for i in 0 {1..36}; do echo http://resources.zad-academy.com/Semester1/Fiqh/Audios/lecture$i\_Fiqh_Semester1.mp3 >> Fiqh.txt ; done
for i in 0 {1..22}; do echo http://resources.zad-academy.com/Semester1/Tarbiyah/Audios/lecture$i\_Tarbiyah_Semester1.mp3 >> Tarbiyah.txt ; done
for i in 0 {1..22}; do echo http://resources.zad-academy.com/Semester1/Arabic/Audios/lecture$i\_Arabic_Semester1.mp3 >> Arabic.txt ; done
echo "Downloading:"
for list in *.txt; do wget -q -i $list ; done
for name in $(cat subjects.txt); do mkdir $name ; done
echo "Converting:"
for file in *.mp3; do name=$(echo $file | cut -d . -f1) ; sox $file $name.ogg rate 48000 ; done
echo "Moving:"
mv *Aqeedah*.ogg Aqeedah
mv *Tafsir*.ogg Tafsir
mv *Hadith*.ogg Hadith
mv *Seerah*.ogg Seerah
mv *Fiqh*.ogg Fiqh
mv *Tarbiyah*.ogg Tarbiyah
mv *Arabic*.ogg Arabic
exit

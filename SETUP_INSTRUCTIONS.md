# تعليمات نقل وتشغيل المشروع على جهاز آخر

## المتطلبات الأساسية:
1. تثبيت Flutter SDK
2. تثبيت Android Studio (للتطوير على Android)
3. تثبيت VS Code أو Android Studio (كـ IDE)

## خطوات التثبيت:

### 1. تثبيت Flutter:
```bash
# تنزيل Flutter
cd ~
git clone https://github.com/flutter/flutter.git -b stable

# إضافة Flutter إلى PATH
export PATH="$PATH:`pwd`/flutter/bin"

# التحقق من التثبيت
flutter doctor
```

### 2. نقل المشروع:
```bash
# نسخ المشروع إلى الجهاز الجديد
# (يمكن استخدام USB، Git، أو أي طريقة أخرى)
```

### 3. تثبيت الحاجات الناقصة:
```bash
cd /path/to/shika
flutter pub get
```

### 4. تشغيل التطبيق:
```bash
# عرض الأجهزة المتاحة
flutter devices

# تشغيل على Android Emulator
flutter run

# أو تشغيل على جهاز محدد
flutter run -d <device-id>
```

## ملاحظات مهمة:
- تأكد من تثبيت Android SDK إذا كنت تريد تشغيله على Android
- تأكد من تثبيت Xcode إذا كنت تريد تشغيله على iOS (macOS فقط)
- ملفات `build/` و `.dart_tool/` لا تحتاج نقلها (سيتم إنشاؤها تلقائياً)

## المشاكل الشائعة:
- إذا ظهرت أخطاء في `flutter pub get`، جرب:
  ```bash
  flutter clean
  flutter pub get
  ```

- إذا لم يظهر Android Emulator:
  - افتح Android Studio
  - اذهب إلى Tools → Device Manager
  - أنشئ محاكي جديد



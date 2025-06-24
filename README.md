# 👕 FitYou – Personaliza, crea, comparte

**FitYou** es una aplicación móvil desarrollada en **Flutter** para la gestión digital de ropa, inspirada en Vinted. Permite a los usuarios crear su armario virtual, compartir publicaciones de prendas y descubrir contenido de otros usuarios mediante una interfaz moderna e intuitiva.

*Proyecto universitario desarrollado para la asignatura DSDM-23 (Desarrollo de Software para Dispositivos Móviles)*

---

## 🚀 Funcionalidades principales

### 🏠 **Pantalla Principal (Home)**
- Feed de publicaciones de otros usuarios con algoritmo basado en interacciones
- Sistema de favoritos con icono de corazón
- Anuncios patrocinados integrados (pequeños y a pantalla completa)
- Navegación fluida entre contenidos

### 🔍 **Búsqueda Avanzada**
- **Búsqueda por texto**: Barra de búsqueda con caracteres
- **Búsqueda por categorías**: Iconos personalizados para cada tipo de prenda
- Filtrado inteligente basado en títulos de publicaciones
- Marcado de favoritos desde resultados de búsqueda

### 👔 **Armario Personal**
- Subida de ítems desde **galería** o **cámara directa**
- Gestión completa de publicaciones (crear, editar, eliminar)
- **Función de recuperación** con patrón Command (deshacer eliminación)
- Vista en cuadrícula optimizada

### 👤 **Perfil de Usuario**
- Foto de perfil personalizable
- Contador de seguidores y seguidos
- Enlaces a redes sociales
- Lista de ítems favoritos
- Estadísticas de publicaciones realizadas

### 🔐 **Autenticación**
- Registro e inicio de sesión con **Firebase Authentication**
- Opción de navegación como invitado (solo lectura)
- Gestión segura de sesiones

---

## 📋 Estructura de Publicaciones

Cada ítem publicado incluye:
- **📸 Imagen**: Capturada con cámara o subida desde galería
- **📝 Título y descripción**: Información detallada de la prenda
- **🏪 URL de tienda**: Enlace donde encontrar el producto
- **📏 Talla**: Información de tallas disponibles
- **💰 Precio**: Precio de referencia encontrado por el usuario

---

## 🛠️ Tecnologías y Arquitectura

### **Stack Tecnológico**
- **Framework**: Flutter (Dart)
- **Backend**: Firebase Realtime Database
- **Autenticación**: Firebase Authentication
- **Almacenamiento**: Firebase Storage (imágenes)
- **Diseño**: Figma para prototipado y wireframes

### **Librerías Utilizadas**
- `CarouselSlider`: Visualización de listas de ítems
- `ImagePicker`: Captura y selección de imágenes
- Componentes nativos de Flutter para UI/UX

---

## 🏗️ Patrones de Diseño Implementados

### **Principios SOLID**
- ✅ **Principio Abierto-Cerrado**: Clases que heredan de `StatefulWidget`
- ✅ **Principio de Sustitución de Liskov**: Herencia correcta en `_ArmarioState`
- ✅ **Principio DRY**: Reutilización de componentes como botones

### **Patrones de Diseño**
- 🏗️ **Factory Pattern**: Creación dinámica de widgets según contexto
- 🎯 **Command Pattern**: Sistema de deshacer acciones (eliminar ítems)
- 👁️ **Observer Pattern**: Botones que escuchan eventos de UI
- 🔄 **Singleton Pattern**: Instancia única de `ImagePicker`
- 📦 **Composite Pattern**: Organización de elementos con `CarouselSlider`

---

## 🧪 Proceso de Diseño y Testing

### **Metodología de Diseño**
1. **Wireframing** inicial en Figma
2. **Maqueta física** a escala real (iPhone 12 Pro)
3. **Mockups** de alta fidelidad
4. **Prototipo funcional** en Flutter
5. **Testing** con usuarios reales

### **Pruebas de Usabilidad**
Se realizaron **pruebas de guerrilla** con 5+ usuarios reales para evaluar la experiencia.

#### ✅ **Fortalezas identificadas**
- Diseño atractivo y llamativo (unanimidad)
- Excelente fluidez y velocidad de respuesta
- Funcionalidad de cámara bien integrada
- Interfaz de login muy atractiva
- Navegación intuitiva

#### ⚠️ **Áreas de mejora**
- Ajustes de layout para diferentes versiones de Android
- Competencia en el mercado (análisis competitivo)
- Indicadores textuales adicionales para funciones de cámara/galería

---

## 📱 Capturas y Demo

### **Flujo de Navegación**
```
Inicio → [Registro/Login/Invitado] → Home → [Búsqueda/Armario/Perfil]
    ↓
Subir ítem → [Cámara/Galería] → Formulario → Publicación
    ↓
Interacción → [Favoritos/Compartir] → Perfil personal
```

### **Enlaces de Recursos**
- 🎨 **Diseño en Figma**: [Ver prototipo](https://www.figma.com/file/wDTILbYfHaoR0mVtmwOQcm/Untitled?node-id=0%3A1&t=1g9G5DDzSRSOnGuX-1)
- 📹 **Video demostrativo**: [Ver demo en Google Drive](https://drive.google.com/file/d/1pwhAHsC3yhroIRLOkKmRAIGOKPHwTCnj/view?usp=sharing)

---

## 🚀 Instalación y Configuración

### **Prerrequisitos**
- Flutter SDK (versión estable)
- Android Studio / VS Code
- Cuenta de Firebase configurada
- Dispositivo Android/iOS o emulador

### **Pasos de instalación**
```bash
# Clonar el repositorio
git clone https://github.com/AlbertoGuirado/FitYou
cd fityou

# Instalar dependencias
flutter pub get

# Configurar Firebase
# (Seguir documentación oficial de Firebase para Flutter)

# Ejecutar la aplicación
flutter run
```

---

## 👥 Equipo de Desarrollo

**Desarrolladores**:
- **Alberto Guirado Fernández**
- **Álvaro Rosales Zafra** 
**Año**: 2023

---

## 📚 Referencias y Documentación

### **Documentación Técnica**
- [Flutter Official Documentation](https://docs.flutter.dev/)
- [Firebase for Flutter](https://firebase.flutter.dev/)
- [BLoC Pattern Library](https://bloclibrary.dev)

### **Recursos de Aprendizaje**
- [Flutter Community Medium](https://medium.com/flutter-community)
- [Flutter YouTube Playlist](https://www.youtube.com/playlist?list=PLl_hIu4u7P677H9f6zPOHiOz2izkvQq2E)

---

## 🤝 Contribuciones

Para sugerencias o consultas sobre la implementación, contacta con los desarrolladores originales.

---

*Desarrollado con ❤️ y Flutter*
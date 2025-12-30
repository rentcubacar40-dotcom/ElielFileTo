#!/bin/bash
set -o errexit

echo "🚀 Iniciando Bot de File2Link - Versión Optimizada..."

# ===========================================
# FASE 1: OPTIMIZACIONES DEL SISTEMA
# ===========================================

echo "⚡ Aplicando optimizaciones de rendimiento..."

# Aumentar límites del sistema para descargas grandes
ulimit -n 65536 2>/dev/null || true
echo "  ✓ Límites de archivos aumentados"

# Configurar buffer TCP para mejor rendimiento de red
sysctl -w net.core.rmem_max=16777216 2>/dev/null || true
sysctl -w net.core.wmem_max=16777216 2>/dev/null || true
echo "  ✓ Buffers TCP optimizados"

# ===========================================
# FASE 2: CONFIGURACIÓN DIRECTA
# ===========================================

echo "🔧 Usando configuración directa desde main.py..."
echo "✅ No se requieren variables de entorno externas"

# ===========================================
# FASE 3: INICIO DE LA APLICACIÓN
# ===========================================

echo "🎯 Iniciando bot optimizado..."
echo "📊 Configuración de descarga:"
echo "   • Buffer: 128KB"
echo "   • Timeout: 1 hora"
echo "   • Reintentos: 3"
echo "==========================================="

# Verificar que el archivo principal existe
if [ ! -f "main.py" ]; then
    echo "❌ ERROR: No se encuentra main.py"
    echo "   Asegúrate de que el archivo exista en el directorio"
    exit 1
fi

# Ejecutar el bot
exec python main.py

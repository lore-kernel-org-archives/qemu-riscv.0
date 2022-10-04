Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofe9t-0004CI-BV
	for mharc-qemu-riscv@gnu.org; Tue, 04 Oct 2022 05:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9s-0004AJ-4M
 for qemu-riscv@nongnu.org; Tue, 04 Oct 2022 05:24:12 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9k-0004MW-Oc
 for qemu-riscv@nongnu.org; Tue, 04 Oct 2022 05:24:11 -0400
Received: by mail-pf1-x42a.google.com with SMTP id w2so12679165pfb.0
 for <qemu-riscv@nongnu.org>; Tue, 04 Oct 2022 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=tn1Lf1hywhKaXdBFMhzTN4ztaESwvV9b7qo9S+GKeVI=;
 b=S+xs67k6jFbRaa4GCYofhhRbpijcXN7bNuhlsxghdXsoMxuxtO2MB1p4/1XVzvgk3w
 dT3b5GDwW9ecyH6Ulhgjn+0orRCQ+ArDq6lKxX3KKAFiDEFuuj7Jduh3FUkSxgN/I3/U
 ccTwwytLvYx2rF8Kec6P5HqJoxdhW7cz05qLvSTn3zj6FDfo81jhyYK87gjpGvCV9DFK
 CnDaI3sTgxgmA5hAL+sE+RnXngMEeJLxnw0MHZJ3M3BZ7QmKt125s7sUMUyrUc49WH5y
 P2xuo6he99oI0jsuoEl5Y4i/Ue+z7DDbh27Dh7y8hyvGEbtmASIRK22UsHuLo2HQlmvg
 Z/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tn1Lf1hywhKaXdBFMhzTN4ztaESwvV9b7qo9S+GKeVI=;
 b=eGTRrdrcYXe0vm1YblpXYDzLpNHN7YSEAQs5SkC6i5TgAJWO8EAGKf+Z1MoKo58fnh
 5HXK81G2R0mpc4J/ZRkwX5kb/3cuU6FUw9Gs2jFEucJ/UW8cV+oyCgI5hgIwGaJ0RG5i
 SrkHWICstnED33ngX+4KoU4K+tvYilEzW5g8idrT0enua3YV7GzRcKzoQfUinwAk+Yrm
 cmMGsWo39P0lbKX9SGWqA4GtRC6N0/gB1esIpw2SsOCRlQmd4cvcIWObkyWgonOjRXOG
 hgP+mPypoY8uAQ5HsJdWL9PDtOVWsDoQnMqytDcYDkIA+XqRwSZyiepT+CxifmrBIL/v
 E/yA==
X-Gm-Message-State: ACrzQf3J4o5qYL6nvEfIHTJcv7hgnVCjfGJqX56H7asP52l+vKIqtNSV
 Oe9YEtVH3vGebBhwgXIX8poWyQ==
X-Google-Smtp-Source: AMsMyM4+2q6g1WFEQPtLy61G62k0nSs3NDXTaHKleOujmf7w5UQ83VmwYdnt1A2w+d8tGixs5VAGSQ==
X-Received: by 2002:a05:6a00:1989:b0:546:410f:bdd2 with SMTP id
 d9-20020a056a00198900b00546410fbdd2mr26628601pfl.83.1664875443484; 
 Tue, 04 Oct 2022 02:24:03 -0700 (PDT)
Received: from localhost.localdomain ([49.206.9.142])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a17090b070200b001fba4716f11sm2934551pjz.22.2022.10.04.02.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 02:24:03 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V5 1/3] hw/arm,
 loongarch: Move load_image_to_fw_cfg() to common location
Date: Tue,  4 Oct 2022 14:53:49 +0530
Message-Id: <20221004092351.18209-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004092351.18209-1-sunilvl@ventanamicro.com>
References: <20221004092351.18209-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Oct 2022 09:24:12 -0000

load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
function will be required by riscv too. So, it's time to refactor and
move this function to a common path.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Song Gao <gaosong@loongson.cn>
---
 hw/arm/boot.c             | 49 ---------------------------------------
 hw/loongarch/virt.c       | 33 --------------------------
 hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
 include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
 4 files changed, 53 insertions(+), 82 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..704f368d9c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -818,55 +818,6 @@ static void do_cpu_reset(void *opaque)
     }
 }
 
-/**
- * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
- *                          by key.
- * @fw_cfg:         The firmware config instance to store the data in.
- * @size_key:       The firmware config key to store the size of the loaded
- *                  data under, with fw_cfg_add_i32().
- * @data_key:       The firmware config key to store the loaded data under,
- *                  with fw_cfg_add_bytes().
- * @image_name:     The name of the image file to load. If it is NULL, the
- *                  function returns without doing anything.
- * @try_decompress: Whether the image should be decompressed (gunzipped) before
- *                  adding it to fw_cfg. If decompression fails, the image is
- *                  loaded as-is.
- *
- * In case of failure, the function prints an error message to stderr and the
- * process exits with status 1.
- */
-static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
-                                 uint16_t data_key, const char *image_name,
-                                 bool try_decompress)
-{
-    size_t size = -1;
-    uint8_t *data;
-
-    if (image_name == NULL) {
-        return;
-    }
-
-    if (try_decompress) {
-        size = load_image_gzipped_buffer(image_name,
-                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
-    }
-
-    if (size == (size_t)-1) {
-        gchar *contents;
-        gsize length;
-
-        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
-            error_report("failed to load \"%s\"", image_name);
-            exit(1);
-        }
-        size = length;
-        data = (uint8_t *)contents;
-    }
-
-    fw_cfg_add_i32(fw_cfg, size_key, size);
-    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
-}
-
 static int do_arm_linux_init(Object *obj, void *opaque)
 {
     if (object_dynamic_cast(obj, TYPE_ARM_LINUX_BOOT_IF)) {
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 29df99727d..4b595a9ea4 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -598,39 +598,6 @@ static void reset_load_elf(void *opaque)
     }
 }
 
-/* Load an image file into an fw_cfg entry identified by key. */
-static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
-                                 uint16_t data_key, const char *image_name,
-                                 bool try_decompress)
-{
-    size_t size = -1;
-    uint8_t *data;
-
-    if (image_name == NULL) {
-        return;
-    }
-
-    if (try_decompress) {
-        size = load_image_gzipped_buffer(image_name,
-                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
-    }
-
-    if (size == (size_t)-1) {
-        gchar *contents;
-        gsize length;
-
-        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
-            error_report("failed to load \"%s\"", image_name);
-            exit(1);
-        }
-        size = length;
-        data = (uint8_t *)contents;
-    }
-
-    fw_cfg_add_i32(fw_cfg, size_key, size);
-    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
-}
-
 static void fw_cfg_add_kernel_info(FWCfgState *fw_cfg)
 {
     /*
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index d605f3f45a..371a45dfe2 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -41,6 +41,7 @@
 #include "qapi/error.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/loader.h"
 
 #define FW_CFG_FILE_SLOTS_DFLT 0x20
 
@@ -1221,6 +1222,37 @@ FWCfgState *fw_cfg_find(void)
     return FW_CFG(object_resolve_path_type("", TYPE_FW_CFG, NULL));
 }
 
+void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
+                          uint16_t data_key, const char *image_name,
+                          bool try_decompress)
+{
+    size_t size = -1;
+    uint8_t *data;
+
+    if (image_name == NULL) {
+        return;
+    }
+
+    if (try_decompress) {
+        size = load_image_gzipped_buffer(image_name,
+                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
+    }
+
+    if (size == (size_t)-1) {
+        gchar *contents;
+        gsize length;
+
+        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
+            error_report("failed to load \"%s\"", image_name);
+            exit(1);
+        }
+        size = length;
+        data = (uint8_t *)contents;
+    }
+
+    fw_cfg_add_i32(fw_cfg, size_key, size);
+    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
+}
 
 static void fw_cfg_class_init(ObjectClass *klass, void *data)
 {
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 0e7a8bc7af..c1f81a5f13 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -342,4 +342,25 @@ bool fw_cfg_dma_enabled(void *opaque);
  */
 const char *fw_cfg_arch_key_name(uint16_t key);
 
+/**
+ * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
+ *                          by key.
+ * @fw_cfg:         The firmware config instance to store the data in.
+ * @size_key:       The firmware config key to store the size of the loaded
+ *                  data under, with fw_cfg_add_i32().
+ * @data_key:       The firmware config key to store the loaded data under,
+ *                  with fw_cfg_add_bytes().
+ * @image_name:     The name of the image file to load. If it is NULL, the
+ *                  function returns without doing anything.
+ * @try_decompress: Whether the image should be decompressed (gunzipped) before
+ *                  adding it to fw_cfg. If decompression fails, the image is
+ *                  loaded as-is.
+ *
+ * In case of failure, the function prints an error message to stderr and the
+ * process exits with status 1.
+ */
+void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
+                          uint16_t data_key, const char *image_name,
+                          bool try_decompress);
+
 #endif
-- 
2.25.1



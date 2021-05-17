Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liasG-00081c-Jv
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lias8-0007e7-Fc; Mon, 17 May 2021 06:53:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lias5-000766-Io; Mon, 17 May 2021 06:53:15 -0400
Received: by mail-wr1-x429.google.com with SMTP id q5so5887349wrs.4;
 Mon, 17 May 2021 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ZG0pkj4UWtVe9/4Fh6Wi0BGus1XDQNTQXT8vjTo2FU=;
 b=hDRrrf4jR9nv3UB5od7RygSuLKh0xnmIRXeIqmy3a/frnSBlWG1eFTyK1uti3d5FRV
 9ADQ6Kn7jEZT7wUSoQhrUOPh4G91S2Qae1b4ANV1qDMBA5dA2i471FAp1RzReI/Z+3MP
 ULQoh/YAPBnsSO4Ap5OsrwrjUyyA8FdWQZTLhNtUg2sXrTLU6woejpmzPdJIKSToNuHD
 KYwGiqZU8aoRS6g0PvrblkivL0r/U/cfif34hBHTJQpvLgz3Riq5QUX8yp/PW3D1oRro
 Dg39CGj8arSffctLQyXka4mvZNwMKzd0Fdfp5M52Q7ER/W61Hl6Ll359kEirUu/fZDKJ
 5a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4ZG0pkj4UWtVe9/4Fh6Wi0BGus1XDQNTQXT8vjTo2FU=;
 b=T0YpCgjmhCt1pi1YJTuBlt6I+GJ8XGSHaEm1PrqwB8DZZY20dga/B84xqmer4pwpQZ
 //KkANdmTqveCKUemV4k5JbVMPFMaIG0mkepxIf6rUd3WFy2u6j+14mzohdKIlqpq7Rg
 /mXbO0CHUez7AECehbDZ536TbOcxOArSmIQDIMxNwNt1XAl3Vt/yzGr+/47prTtjcUoU
 2x3cMDMc0rgum5IUAIAwF57GFTEkX4kHbrKTetPLiKUYOvvCq6vZULcP/cRZnh+vT83B
 N+w4Mzf+QhYHBhOvV8nNlmUN+lciSgGrKYqqI9vYXrmJ01Y9+49yP+o83itA8Kwkmwtl
 9Qmw==
X-Gm-Message-State: AOAM533NoLBFs60ld0Yc5Xn7AQIXg3WsDstEU8HzZKqM48kdM8RiCayI
 9eOxk9nw3n7BspS4REgScVSm132KqhYF4g==
X-Google-Smtp-Source: ABdhPJxZhDi0X1JTY82rI7bQ5kO/AHO15yHSeY1NOQEZAwEItv5gJrXRFgdB6j9EqCuk2A5EGrjZzg==
X-Received: by 2002:a5d:5184:: with SMTP id k4mr28144900wrv.84.1621248789949; 
 Mon, 17 May 2021 03:53:09 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r5sm11135324wrw.96.2021.05.17.03.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:53:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 18/23] cpu: Move CPUClass::write_elf* to SysemuCPUOps
Date: Mon, 17 May 2021 12:51:35 +0200
Message-Id: <20210517105140.1062037-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 May 2021 10:53:19 -0000

The write_elf*() handlers are used to dump vmcore images.
This feature is only meaningful for system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 17 -----------------
 include/hw/core/sysemu-cpu-ops.h | 24 ++++++++++++++++++++++++
 hw/core/cpu-sysemu.c             | 16 ++++++++--------
 target/arm/cpu.c                 |  4 ++--
 target/i386/cpu.c                |  8 ++++----
 target/riscv/cpu.c               |  4 ++--
 target/s390x/cpu.c               |  2 +-
 target/ppc/translate_init.c.inc  |  6 ++----
 8 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 6f5e04ae580..fce9bdc686e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -112,14 +112,6 @@ struct AccelCPUClass;
  *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
- * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
- * 64-bit VM coredump.
- * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
- * note to a 32-bit VM coredump.
- * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
- * 32-bit VM coredump.
- * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
- * note to a 32-bit VM coredump.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
@@ -163,15 +155,6 @@ struct CPUClass {
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
 
-    int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
-    int (*write_elf64_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
-    int (*write_elf32_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
-    int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
-
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index c6ec9b0a7f6..19247d330dc 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -21,6 +21,30 @@ typedef struct SysemuCPUOps {
      * GUEST_PANICKED events.
      */
     GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
+    /**
+     * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
+     * 32-bit VM coredump.
+     */
+    int (*write_elf32_note)(WriteCoreDumpFunction f, CPUState *cpu,
+                            int cpuid, void *opaque);
+    /**
+     * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
+     * 64-bit VM coredump.
+     */
+    int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
+                            int cpuid, void *opaque);
+    /**
+     * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
+     * note to a 32-bit VM coredump.
+     */
+    int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
+                                void *opaque);
+    /**
+     * @write_elf64_qemunote: Callback for writing a CPU- and QEMU-specific ELF
+     * note to a 64-bit VM coredump.
+     */
+    int (*write_elf64_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
+                                void *opaque);
     /**
      * @virtio_is_big_endian: Callback to return %true if a CPU which supports
      *       runtime configurable endianness is currently big-endian.
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 90b5ac8eb9e..d55ef8d23d1 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -84,10 +84,10 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf32_qemunote) {
+    if (!cc->sysemu_ops->write_elf32_qemunote) {
         return 0;
     }
-    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
+    return (*cc->sysemu_ops->write_elf32_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -95,10 +95,10 @@ int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf32_note) {
+    if (!cc->sysemu_ops->write_elf32_note) {
         return -1;
     }
-    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
+    return (*cc->sysemu_ops->write_elf32_note)(f, cpu, cpuid, opaque);
 }
 
 int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
@@ -106,10 +106,10 @@ int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf64_qemunote) {
+    if (!cc->sysemu_ops->write_elf64_qemunote) {
         return 0;
     }
-    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
+    return (*cc->sysemu_ops->write_elf64_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -117,10 +117,10 @@ int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf64_note) {
+    if (!cc->sysemu_ops->write_elf64_note) {
         return -1;
     }
-    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
+    return (*cc->sysemu_ops->write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
 bool cpu_virtio_is_big_endian(CPUState *cpu)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9100947905a..a56de47d1fa 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1944,6 +1944,8 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .write_elf32_note = arm_cpu_write_elf32_note,
+    .write_elf64_note = arm_cpu_write_elf64_note,
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .legacy_vmsd = &vmstate_arm_cpu,
 };
@@ -1988,8 +1990,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->write_elf64_note = arm_cpu_write_elf64_note;
-    cc->write_elf32_note = arm_cpu_write_elf32_note;
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1106dc3fc98..44c9546eda2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6717,6 +6717,10 @@ static Property x86_cpu_properties[] = {
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
     .get_crash_info = x86_cpu_get_crash_info,
+    .write_elf32_note = x86_cpu_write_elf32_note,
+    .write_elf64_note = x86_cpu_write_elf64_note,
+    .write_elf32_qemunote = x86_cpu_write_elf32_qemunote,
+    .write_elf64_qemunote = x86_cpu_write_elf64_qemunote,
     .legacy_vmsd = &vmstate_x86_cpu,
 };
 #endif
@@ -6751,10 +6755,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
-    cc->write_elf64_note = x86_cpu_write_elf64_note;
-    cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
-    cc->write_elf32_note = x86_cpu_write_elf32_note;
-    cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e724c10a2ed..d86e44ca07d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -598,6 +598,8 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps riscv_sysemu_ops = {
+    .write_elf64_note = riscv_cpu_write_elf64_note,
+    .write_elf32_note = riscv_cpu_write_elf32_note,
     .legacy_vmsd = &vmstate_riscv_cpu,
 };
 #endif
@@ -645,8 +647,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     cc->sysemu_ops = &riscv_sysemu_ops;
-    cc->write_elf64_note = riscv_cpu_write_elf64_note;
-    cc->write_elf32_note = riscv_cpu_write_elf32_note;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 470aaeb72e6..058ffcef15f 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps s390_sysemu_ops = {
     .get_crash_info = s390_cpu_get_crash_info,
+    .write_elf64_note = s390_cpu_write_elf64_note,
     .legacy_vmsd = &vmstate_s390_cpu,
 };
 #endif
@@ -523,7 +524,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 73e859ea0d3..86b11e1356a 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10239,6 +10239,8 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .write_elf32_note = ppc32_cpu_write_elf32_note,
+    .write_elf64_note = ppc64_cpu_write_elf64_note,
     .virtio_is_big_endian = ppc_cpu_is_big_endian,
     .legacy_vmsd = &vmstate_ppc_cpu,
 };
@@ -10288,10 +10290,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
-#if defined(CONFIG_SOFTMMU)
-    cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-    cc->write_elf32_note = ppc32_cpu_write_elf32_note;
-#endif
 
     cc->gdb_num_core_regs = 71;
 #ifndef CONFIG_USER_ONLY
-- 
2.26.3



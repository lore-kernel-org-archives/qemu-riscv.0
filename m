Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liasA-0007g9-QL
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarv-0007WV-2n; Mon, 17 May 2021 06:53:03 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarr-0006yY-H1; Mon, 17 May 2021 06:53:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id b7so2715021wmh.5;
 Mon, 17 May 2021 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J3KkyeAHowjlEzex1WLthgPCVr0R+I2QlAwoz2UGp0U=;
 b=k72uOhN3De4XB0RFeJSsYEv20VpS2bwY/EgWxdrqyk0hFb/o6y5KKN2WjLmgI6hRqQ
 1SXixgRr2my9rAsxUftcur++udG4Yd3EHw5J7PWb8r/NJv4JMPRhNnW3bYj0/U6lWHM3
 As//QVnAeNyn8JBhSB+PRbQCIwzb/NeS7kQ0R9rwh6DPdWWk3Ly0stfYCL1mpU8h1hzj
 t8djT6xKzNtzcr2N/Ij01FpfC8sbgMA6CrsqImVTroK9ZLihY3iggqNym9p8ZfARswsJ
 MPt/NzvMRtU9PZb3YZaUhMcfdWiKI1lNx7vZyBALrjDrEENXpDxSLZOI2evxFz4uWGyE
 7vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J3KkyeAHowjlEzex1WLthgPCVr0R+I2QlAwoz2UGp0U=;
 b=on18tOGPzVQ8764RSwJGxNwR8u4wlwXsZ6NFe5mHvoLZUT4AJ4hVZy4tYj6zNsfIEa
 FiuCYF9Pq7mOUejN/ARr7R5y3/X+2OMTZmq7RgnICSOH9yX5UUO+jEO+wZ4ADOVENO+f
 XtUSXstbqSalXCWWPvwcrKUGMOTRwNWY1NV44ZGNxonEEFq+sh4FM1crKnbWzhKQTieY
 rauKB5hV+SSEOKNm4TGczFtUT0bkLfjRFw05pFXZaOcyOdPNX9FUgl5avtTnvOYgzRQs
 mVWobMmOWL+waudCsIP3XjTgZbhvwHZnTBsSxJp3TeZUaVmhCN5wWDrfWJh6tUabwnXR
 AAVQ==
X-Gm-Message-State: AOAM530cA5/8LSN0n0MShz4AEBRp1tNGiz39MgceT/JCSdzJlyOmHtlv
 ZnGYulbdaubuhQwWpjk7eQod5L/TfEXkxw==
X-Google-Smtp-Source: ABdhPJzbve7Elmdz0zpUPEI3D7THwAgrpv6jYPvYg1YlosjUEqQwkDmR0R2QN4VmFej+fbuI4vMhFQ==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr22680958wmi.72.1621248775774; 
 Mon, 17 May 2021 03:52:55 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v12sm18894444wrv.76.2021.05.17.03.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 15/23] cpu: Move CPUClass::vmsd to SysemuCPUOps
Date: Mon, 17 May 2021 12:51:32 +0200
Message-Id: <20210517105140.1062037-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Mon, 17 May 2021 10:53:07 -0000

Migration is specific to system emulation.

- Move the CPUClass::vmsd field to SysemuCPUOps,
- restrict VMSTATE_CPU() macro to sysemu,
- vmstate_dummy is now unused, remove it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            |  8 ++------
 include/hw/core/sysemu-cpu-ops.h |  6 ++++++
 include/migration/vmstate.h      |  2 --
 cpu.c                            | 15 +++++++--------
 stubs/vmstate.c                  |  2 --
 target/arm/cpu.c                 |  2 +-
 target/i386/cpu.c                |  2 +-
 target/mips/cpu.c                |  2 +-
 target/riscv/cpu.c               |  2 +-
 target/s390x/cpu.c               |  2 +-
 target/sparc/cpu.c               |  2 +-
 target/ppc/translate_init.c.inc  |  2 +-
 12 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index da55d310d4b..8e4f0662eb5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -124,8 +124,6 @@ struct AccelCPUClass;
  * 32-bit VM coredump.
  * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
  * note to a 32-bit VM coredump.
- * @legacy_vmsd: Legacy state description for migration.
- *               Do not use in new targets, use #DeviceClass::vmsd instead.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
@@ -180,7 +178,6 @@ struct CPUClass {
     int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
                                 void *opaque);
 
-    const VMStateDescription *legacy_vmsd;
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
@@ -1064,10 +1061,8 @@ bool target_words_bigendian(void);
 #ifdef NEED_CPU_H
 
 #ifdef CONFIG_SOFTMMU
+
 extern const VMStateDescription vmstate_cpu_common;
-#else
-#define vmstate_cpu_common vmstate_dummy
-#endif
 
 #define VMSTATE_CPU() {                                                     \
     .name = "parent_obj",                                                   \
@@ -1076,6 +1071,7 @@ extern const VMStateDescription vmstate_cpu_common;
     .flags = VMS_STRUCT,                                                    \
     .offset = 0,                                                            \
 }
+#endif /* CONFIG_SOFTMMU */
 
 #endif /* NEED_CPU_H */
 
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index e54a08ea25e..0370ac15196 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,12 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @legacy_vmsd: Legacy state for migration.
+     *               Do not use in new targets, use #DeviceClass::vmsd instead.
+     */
+    const VMStateDescription *legacy_vmsd;
+
 } SysemuCPUOps;
 
 #endif /* SYSEMU_CPU_OPS_H */
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 075ee800960..8df7b69f389 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -194,8 +194,6 @@ struct VMStateDescription {
     const VMStateDescription **subsections;
 };
 
-extern const VMStateDescription vmstate_dummy;
-
 extern const VMStateInfo vmstate_info_bool;
 
 extern const VMStateInfo vmstate_info_int8;
diff --git a/cpu.c b/cpu.c
index c57f4c302bc..76047fcd4d6 100644
--- a/cpu.c
+++ b/cpu.c
@@ -127,7 +127,9 @@ const VMStateDescription vmstate_cpu_common = {
 
 void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
+#ifndef CONFIG_USER_ONLY
     CPUClass *cc = CPU_GET_CLASS(cpu);
+#endif
 
     cpu_list_add(cpu);
     if (!accel_cpu_realizefn(cpu, errp)) {
@@ -143,26 +145,23 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #ifdef CONFIG_USER_ONLY
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
            qdev_get_vmsd(DEVICE(cpu))->unmigratable);
-    assert(cc->legacy_vmsd == NULL);
 #else
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-    if (cc->legacy_vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->legacy_vmsd, cpu);
+    if (cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cc->sysemu_ops->legacy_vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
 }
 
 void cpu_exec_unrealizefn(CPUState *cpu)
 {
+#ifndef CONFIG_USER_ONLY
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-#ifdef CONFIG_USER_ONLY
-    assert(cc->legacy_vmsd == NULL);
-#else
-    if (cc->legacy_vmsd != NULL) {
-        vmstate_unregister(NULL, cc->legacy_vmsd, cpu);
+    if (cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_unregister(NULL, cc->sysemu_ops->legacy_vmsd, cpu);
     }
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
diff --git a/stubs/vmstate.c b/stubs/vmstate.c
index cc4fe41dfc2..8513d9204e4 100644
--- a/stubs/vmstate.c
+++ b/stubs/vmstate.c
@@ -1,8 +1,6 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
 
-const VMStateDescription vmstate_dummy = {};
-
 int vmstate_register_with_alias_id(VMStateIf *obj,
                                    uint32_t instance_id,
                                    const VMStateDescription *vmsd,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a9c9389859b..0a104cec633 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1944,6 +1944,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .legacy_vmsd = &vmstate_arm_cpu,
 };
 #endif
 
@@ -1986,7 +1987,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->legacy_vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 35ef2eb1a41..f8750f6400f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6716,6 +6716,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .legacy_vmsd = &vmstate_x86_cpu,
 };
 #endif
 
@@ -6754,7 +6755,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
-    cc->legacy_vmsd = &vmstate_x86_cpu;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index e61677fab74..a74b7fab318 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -523,6 +523,7 @@ static Property mips_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps mips_sysemu_ops = {
+    .legacy_vmsd = &vmstate_mips_cpu,
 };
 #endif
 
@@ -566,7 +567,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_mips_cpu;
     cc->sysemu_ops = &mips_sysemu_ops;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f23eb63d186..e724c10a2ed 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -598,6 +598,7 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps riscv_sysemu_ops = {
+    .legacy_vmsd = &vmstate_riscv_cpu,
 };
 #endif
 
@@ -643,7 +644,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_riscv_cpu;
     cc->sysemu_ops = &riscv_sysemu_ops;
     cc->write_elf64_note = riscv_cpu_write_elf64_note;
     cc->write_elf32_note = riscv_cpu_write_elf32_note;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 1fb4af4f2ca..aafe5fa2ef5 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -478,6 +478,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps s390_sysemu_ops = {
+    .legacy_vmsd = &vmstate_s390_cpu,
 };
 #endif
 
@@ -521,7 +522,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_s390_cpu;
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 743a7287a4f..543853c24dc 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -850,6 +850,7 @@ static Property sparc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps sparc_sysemu_ops = {
+    .legacy_vmsd = &vmstate_sparc_cpu,
 };
 #endif
 
@@ -894,7 +895,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_sparc_cpu;
     cc->sysemu_ops = &sparc_sysemu_ops;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 9e828402a35..9f20cdb569b 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10239,6 +10239,7 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .legacy_vmsd = &vmstate_ppc_cpu,
 };
 #endif
 
@@ -10284,7 +10285,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_ppc_cpu;
     cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
 #if defined(CONFIG_SOFTMMU)
-- 
2.26.3



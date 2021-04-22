Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfBG-00036l-M8
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfBE-00033P-FA; Thu, 22 Apr 2021 15:40:04 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfBC-0005Zs-37; Thu, 22 Apr 2021 15:40:04 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h4so36903088wrt.12;
 Thu, 22 Apr 2021 12:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=geK1FL9BfBSzKYrYLCYKzr+Rs4N62lLrBU0a9dBAM/U=;
 b=Nl0YtqttuvNibxtHdC7V16eAWQoec2etPKOGpgf9XnFgw4C678GtTngNMKIiTzwgeM
 ysjbRL7zNSX6Mk8+DWxFHffkkxUu+K6Y5zGdqNG9NK+BEKz0moFkflHLHCEVKnHSBjlV
 J6PjIko6hwiH3QjaagwQlhPran8zaVizTmdu2qCHxcuiObrJ9lg1jyW/x7+MZIGQJUZ3
 SGq5kDTu5Ae7Z66ZqVZGy/2FgzqXhVt6i9hG6okcxh2hxdCaztx2pGs2EmEnyOO2UbvR
 pkYat6iuR7BxCV2wPNqHTGS+d/HIJihSOs7ryrq8mwsDZnENloiskjiahSQ3aReyY0iQ
 4QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=geK1FL9BfBSzKYrYLCYKzr+Rs4N62lLrBU0a9dBAM/U=;
 b=YJ5pYEkW1yqbYclzRM/jtkThfvSXGw0IPVCIXQk1JJkLXAF1V9jylTNfYjE+Cl1G2c
 kmacpjswO1iJmM2U5Ix1QZBswW5BgbYaBY/ds0gsws3sK3aVnEygrOqo7ElmDJnKBNQq
 4qGaOs/q1f3Qs5VBSpzKsKx1hnueIcLs8nYJze1zbTkMoRJ6yhYeZrCiyu15ihOt1uPQ
 BYdtKsUB+mhUkshGe/BZNZYNigvZmq1McjTiSOH+9DAO29qLNKG0MCljRC2vzwLAGAom
 SCU/TaD/DXKQ1nzUVlNyrO96r5xaPQYGrAG7tYz6ivc0c9YnqnIMKfA+2VIUB5qv+5rJ
 eW5w==
X-Gm-Message-State: AOAM5335qPp+jAPel9ydVg0XU9pZbis9x6I61mKXNOI/lNE5AJQZuz+7
 +epNb5v5+/UDHXktZa/cgqF8iCI42/I4Jg==
X-Google-Smtp-Source: ABdhPJwYdZr7z0HYSrTBAyjxzjX0b+lskkju9d4QCTNNev0Yk05gG/E4yHj5mgdsQlFlN3Ae2OAzdw==
X-Received: by 2002:a5d:6487:: with SMTP id o7mr36460wri.152.1619120398751;
 Thu, 22 Apr 2021 12:39:58 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b15sm7470096wmj.46.2021.04.22.12.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:39:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v6 10/18] cpu: Move CPUClass::vmsd to SysemuCPUOps
Date: Thu, 22 Apr 2021 21:38:54 +0200
Message-Id: <20210422193902.2644064-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 19:40:05 -0000

Migration is specific to system emulation.

- Move the CPUClass::vmsd field to SysemuCPUOps,
- restrict VMSTATE_CPU() macro to sysemu,
- vmstate_dummy is now unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Since v3: Merged in patch 1 (Eduardo)
therefore removed Richard R-b.

'vmsd' is not a 'system operation' prototype but a const
pointer field, so it belongs to a const structure,
but maybe this structure could be better named than SysemuCPUOps?

This field comes from:

commit b170fce3dd06372f7bfec9a780ebcb1fce6d57e4
Author: Andreas Färber <afaerber@suse.de>
Date:   Sun Jan 20 20:23:22 2013 +0100

    cpu: Register VMStateDescription through CPUState

    In comparison to DeviceClass::vmsd, CPU VMState is split in two,
    "cpu_common" and "cpu", and uses cpu_index as instance_id instead of -1.
    Therefore add a CPU-specific CPUClass::vmsd field.

    Unlike the legacy CPUArchState registration, rather register CPUState.
---
 include/hw/core/cpu.h            |  8 ++------
 include/hw/core/sysemu-cpu-ops.h |  5 +++++
 include/migration/vmstate.h      |  2 --
 cpu.c                            | 15 +++++++--------
 stubs/vmstate.c                  |  2 --
 target/arm/cpu.c                 |  2 +-
 target/i386/cpu.c                |  2 +-
 target/mips/cpu.c                |  2 +-
 target/riscv/cpu.c               |  4 ++--
 target/s390x/cpu.c               |  2 +-
 target/sparc/cpu.c               |  2 +-
 target/ppc/translate_init.c.inc  |  2 +-
 12 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 23b718a4a51..bdc702894bf 100644
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
@@ -1058,10 +1055,8 @@ bool target_words_bigendian(void);
 #ifdef NEED_CPU_H
 
 #ifdef CONFIG_SOFTMMU
+
 extern const VMStateDescription vmstate_cpu_common;
-#else
-#define vmstate_cpu_common vmstate_dummy
-#endif
 
 #define VMSTATE_CPU() {                                                     \
     .name = "parent_obj",                                                   \
@@ -1070,6 +1065,7 @@ extern const VMStateDescription vmstate_cpu_common;
     .flags = VMS_STRUCT,                                                    \
     .offset = 0,                                                            \
 }
+#endif /* CONFIG_SOFTMMU */
 
 #endif /* NEED_CPU_H */
 
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index e54a08ea25e..a10d9fbdd16 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @legacy_vmsd: Legacy state for migration.
+     *               Do not use in new targets, use #DeviceClass::vmsd instead.
+     */
+    const VMStateDescription *legacy_vmsd;
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
index c1c9cdebc3e..47eb8c40775 100644
--- a/cpu.c
+++ b/cpu.c
@@ -126,7 +126,9 @@ const VMStateDescription vmstate_cpu_common = {
 
 void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
+#ifndef CONFIG_USER_ONLY
     CPUClass *cc = CPU_GET_CLASS(cpu);
+#endif
 
     cpu_list_add(cpu);
 
@@ -139,26 +141,23 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 
 #ifdef CONFIG_USER_ONLY
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL);
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
index c1943194cf1..9b598bf10a8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1945,6 +1945,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .legacy_vmsd = &vmstate_arm_cpu,
 };
 #endif
 
@@ -1987,7 +1988,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->legacy_vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0920eeef1e7..eb96dd42556 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7393,6 +7393,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .legacy_vmsd = &vmstate_x86_cpu,
 };
 #endif
 
@@ -7436,7 +7437,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
-    cc->legacy_vmsd = &vmstate_x86_cpu;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 0bbaff3b57a..4023d487669 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -682,6 +682,7 @@ static Property mips_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps mips_sysemu_ops = {
+    .legacy_vmsd = &vmstate_mips_cpu,
 };
 #endif
 
@@ -725,7 +726,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_mips_cpu;
     cc->sysemu_ops = &mips_sysemu_ops;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c465695f00d..5514e23c1d2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -583,6 +583,8 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps riscv_sysemu_ops = {
+    /* For now, mark unmigratable: */
+    .legacy_vmsd = &vmstate_riscv_cpu,
 };
 #endif
 
@@ -628,8 +630,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
-    /* For now, mark unmigratable: */
-    cc->legacy_vmsd = &vmstate_riscv_cpu;
     cc->sysemu_ops = &riscv_sysemu_ops;
     cc->write_elf64_note = riscv_cpu_write_elf64_note;
     cc->write_elf32_note = riscv_cpu_write_elf32_note;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7503b9e0c8b..131e7dfdf82 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps s390_sysemu_ops = {
+    .legacy_vmsd = &vmstate_s390_cpu,
 };
 #endif
 
@@ -522,7 +523,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
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
index b15abc36851..e3f2f2fefa3 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10880,6 +10880,7 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .legacy_vmsd = &vmstate_ppc_cpu,
 };
 #endif
 
@@ -10925,7 +10926,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_ppc_cpu;
     cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
 #if defined(CONFIG_SOFTMMU)
-- 
2.26.3



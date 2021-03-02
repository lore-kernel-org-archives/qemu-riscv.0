Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH6Uj-0007Ab-0z
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 09:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6Ug-000743-BM; Tue, 02 Mar 2021 09:59:26 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6Ud-0005Fu-N6; Tue, 02 Mar 2021 09:59:25 -0500
Received: by mail-ej1-x635.google.com with SMTP id r17so35757769ejy.13;
 Tue, 02 Mar 2021 06:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZ9LzGr+2KjxpCj3ls57BgL9kGnnOtUuV1kbA258rRM=;
 b=Qku6TwEgKUaQXnOJFXPA+3Y4nINTs+nelaGV4mRLkZArdg7FjHDuCCiHcYB4XjgeUg
 epBMpOZQnQoxVSQfzmMb2YyqRAMIZ1obQ2pJ/B5tJLUTrSmbbVR13Mxmaccg5r2msz22
 NiWZdbc5xaTLwkaw+orHdN7K3ohVkza3kTSxma3rH4ftokkz7FH0C2emjKE6Q1fbmClG
 en99SgVKaUJKtvpuYySVVYzNueQL8kiM8Rb81i/vd+t2YVgMIbXak+mG2wXHxb0nMbVI
 L0/ngsbcvPDK/DG6ZbpMfQKEPf9Vl5yn7bz+tiYMUTUYLq8mCgg/XLuGR80IQPVGwTRv
 Swfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jZ9LzGr+2KjxpCj3ls57BgL9kGnnOtUuV1kbA258rRM=;
 b=gWBmfomvR7tZrddPcNQGN7myUoDQ+j6esoGduRlf5WBcxxIv1RG1z9WijCklqCqkPo
 BVKXPjYi5rnrFyCZKGX9aMboj2MArmMGlonwLzCPeurhid5mxYh1SML/ILZyvE8ywYbU
 aZdzS9c+67JC835pbZ6ZXdg/w50H3p6D1JO6Y8Ybg1P2/PwMvkvzR5yuQBPuruvvT9OT
 hqRwFDlKvEon0d+zrq05Os4HaU5zLnu4Kq6rqsLQY76WVQ0tTqteFpb6C1OLsi0JwSXY
 T8aBOSteFdY9tcIElxPb/M3Yv7Dr2n+Ff+we4HRSMcpsyWYGqpJY2yMl16zkg1M39B0A
 97AQ==
X-Gm-Message-State: AOAM533v52uThoW9lOtukIJmg5eK9rVCf3hZWRa1/Uarr3n0SgbJ/WaF
 jb+IoQsdaaXfzbPRP3kBHC62WnpO42c=
X-Google-Smtp-Source: ABdhPJwuoxshdz+AFrJkD4fBIj2VXGLA+kuwQzjIJIOKMe81VFaY4lqiyq/QeeK15ewIn1QAz7wkGQ==
X-Received: by 2002:a17:906:19d9:: with SMTP id
 h25mr11666585ejd.453.1614697160367; 
 Tue, 02 Mar 2021 06:59:20 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id cb17sm9171004edb.10.2021.03.02.06.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:59:19 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Rolnik <mrolnik@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stafford Horne <shorne@gmail.com>,
 qemu-ppc@nongnu.org, Anthony Green <green@moxielogic.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Walle <michael@walle.cc>, Marek Vasut <marex@denx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 08/27] cpu: Move CPUClass::vmsd to SysemuCPUOps
Date: Tue,  2 Mar 2021 15:57:59 +0100
Message-Id: <20210302145818.1161461-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
X-List-Received-Date: Tue, 02 Mar 2021 14:59:27 -0000

Migration is specific to system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            |  2 --
 include/hw/core/sysemu-cpu-ops.h |  4 ++++
 cpu.c                            | 18 ++++++++----------
 target/alpha/cpu.c               |  2 +-
 target/arm/cpu.c                 |  2 +-
 target/avr/cpu.c                 |  2 +-
 target/cris/cpu.c                |  2 +-
 target/hppa/cpu.c                |  2 +-
 target/i386/cpu.c                |  2 +-
 target/lm32/cpu.c                |  2 +-
 target/m68k/cpu.c                |  2 +-
 target/microblaze/cpu.c          |  2 +-
 target/mips/cpu.c                |  2 +-
 target/moxie/cpu.c               |  2 +-
 target/nios2/cpu.c               |  7 +++++++
 target/openrisc/cpu.c            |  2 +-
 target/riscv/cpu.c               |  4 ++--
 target/rx/cpu.c                  |  6 ++++++
 target/s390x/cpu.c               |  2 +-
 target/sh4/cpu.c                 |  4 ++--
 target/sparc/cpu.c               |  2 +-
 target/tricore/cpu.c             |  7 +++++++
 target/unicore32/cpu.c           |  2 +-
 target/xtensa/cpu.c              |  4 ++--
 target/ppc/translate_init.c.inc  |  2 +-
 25 files changed, 54 insertions(+), 34 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3c26471d0fa..471c99d9f04 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -124,7 +124,6 @@ struct AccelCPUClass;
  * 32-bit VM coredump.
  * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
  * note to a 32-bit VM coredump.
- * @vmsd: State description for migration.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
@@ -179,7 +178,6 @@ struct CPUClass {
     int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
                                 void *opaque);
 
-    const VMStateDescription *vmsd;
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index e54a08ea25e..05f19b22070 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,10 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @vmsd: State description for migration.
+     */
+    const VMStateDescription *vmsd;
 } SysemuCPUOps;
 
 #endif /* SYSEMU_CPU_OPS_H */
diff --git a/cpu.c b/cpu.c
index bfbe5a66f95..64e17537e21 100644
--- a/cpu.c
+++ b/cpu.c
@@ -126,7 +126,9 @@ const VMStateDescription vmstate_cpu_common = {
 
 void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
+#ifndef CONFIG_USER_ONLY
     CPUClass *cc = CPU_GET_CLASS(cpu);
+#endif
 
     cpu_list_add(cpu);
 
@@ -137,27 +139,23 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     }
 #endif /* CONFIG_TCG */
 
-#ifdef CONFIG_USER_ONLY
-    assert(cc->vmsd == NULL);
-#else
+#ifndef CONFIG_USER_ONLY
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-    if (cc->vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->vmsd, cpu);
+    if (cc->sysemu_ops->vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cc->sysemu_ops->vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
 }
 
 void cpu_exec_unrealizefn(CPUState *cpu)
 {
+#ifndef CONFIG_USER_ONLY
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-#ifdef CONFIG_USER_ONLY
-    assert(cc->vmsd == NULL);
-#else
-    if (cc->vmsd != NULL) {
-        vmstate_unregister(NULL, cc->vmsd, cpu);
+    if (cc->sysemu_ops->vmsd != NULL) {
+        vmstate_unregister(NULL, cc->sysemu_ops->vmsd, cpu);
     }
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index b9b431102f2..8d7a73d638e 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -208,6 +208,7 @@ static void alpha_cpu_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps alpha_sysemu_ops = {
+    .vmsd = &vmstate_alpha_cpu,
 };
 #endif
 
@@ -242,7 +243,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_alpha_cpu;
     cc->sysemu_ops = &alpha_sysemu_ops;
 #endif
     cc->disas_set_info = alpha_cpu_disas_set_info;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 994e7b344d4..e03977e4c3c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,6 +2262,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps arm_sysemu_ops = {
+    .vmsd = &vmstate_arm_cpu,
 };
 #endif
 
@@ -2304,7 +2305,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 84f7ad4167e..b455a5e3434 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -185,6 +185,7 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 }
 
 static struct SysemuCPUOps avr_sysemu_ops = {
+    .vmsd = &vms_avr_cpu,
 };
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -216,7 +217,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
-    cc->vmsd = &vms_avr_cpu;
     cc->sysemu_ops = &avr_sysemu_ops;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index a97ad7c9c65..3ffd47c488d 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -195,6 +195,7 @@ static void cris_cpu_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps cris_sysemu_ops = {
+    .vmsd = &vmstate_cris_cpu,
 };
 #endif
 
@@ -298,7 +299,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = cris_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_cris_cpu;
     cc->sysemu_ops = &cris_sysemu_ops;
 #endif
 
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 48946cf6669..ba6401a4979 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -133,6 +133,7 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps hppa_sysemu_ops = {
+    .vmsd = &vmstate_hppa_cpu,
 };
 #endif
 
@@ -167,7 +168,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_hppa_cpu;
     cc->sysemu_ops = &hppa_sysemu_ops;
 #endif
     cc->disas_set_info = hppa_cpu_disas_set_info;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fa517555e73..2d1e61da8ea 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7388,6 +7388,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps i386_sysemu_ops = {
+    .vmsd = &vmstate_x86_cpu,
 };
 #endif
 
@@ -7431,7 +7432,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
-    cc->vmsd = &vmstate_x86_cpu;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index 2d8d16d5535..bc754034c7e 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -212,6 +212,7 @@ static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps lm32_sysemu_ops = {
+    .vmsd = &vmstate_lm32_cpu,
 };
 #endif
 
@@ -246,7 +247,6 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = lm32_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_lm32_cpu;
     cc->sysemu_ops = &lm32_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 32 + 7;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 5c43981c35d..1641cf87a52 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -504,6 +504,7 @@ static const VMStateDescription vmstate_m68k_cpu = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps m68k_sysemu_ops = {
+    .vmsd = &vmstate_m68k_cpu,
 };
 #endif
 
@@ -538,7 +539,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
 #if defined(CONFIG_SOFTMMU)
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_m68k_cpu;
     cc->sysemu_ops = &m68k_sysemu_ops;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 34a60edd1cc..f59a1dd8576 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -354,6 +354,7 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps mb_sysemu_ops = {
+    .vmsd = &vmstate_mb_cpu,
 };
 #endif
 
@@ -392,7 +393,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
-    cc->vmsd = &vmstate_mb_cpu;
     cc->sysemu_ops = &mb_sysemu_ops;
 #endif
     device_class_set_props(dc, mb_properties);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ea9259896f2..50ab8f2a88c 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -682,6 +682,7 @@ static Property mips_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps mips_sysemu_ops = {
+    .vmsd = &vmstate_mips_cpu,
 };
 #endif
 
@@ -725,7 +726,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_mips_cpu;
     cc->sysemu_ops = &mips_sysemu_ops;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index dbc9e022b61..86f6665a048 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -95,6 +95,7 @@ static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
 }
 
 static struct SysemuCPUOps moxie_sysemu_ops = {
+    .vmsd = &vmstate_moxie_cpu,
 };
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -125,7 +126,6 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = moxie_cpu_set_pc;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = moxie_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_moxie_cpu;
 #endif
     cc->disas_set_info = moxie_cpu_disas_set_info;
     cc->sysemu_ops = &moxie_sysemu_ops;
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 57023e38cb8..971c0d8a00a 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -25,6 +25,7 @@
 #include "exec/log.h"
 #include "exec/gdbstub.h"
 #include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
 
 static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -208,7 +209,13 @@ static Property nios2_properties[] = {
 };
 
 #ifndef CONFIG_USER_ONLY
+static const VMStateDescription vmstate_nios2_cpu = {
+    .name = "cpu",
+    .unmigratable = 1,
+};
+
 static struct SysemuCPUOps nios2_sysemu_ops = {
+    .vmsd = &vmstate_nios2_cpu,
 };
 #endif
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index e00678ae038..55eb195df40 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -176,6 +176,7 @@ static void openrisc_any_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps openrisc_sysemu_ops = {
+    .vmsd = &vmstate_openrisc_cpu,
 };
 #endif
 
@@ -209,7 +210,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_openrisc_cpu;
     cc->sysemu_ops = &openrisc_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fd85e6fc6af..3e42f7265eb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -582,6 +582,8 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps riscv_sysemu_ops = {
+    /* For now, mark unmigratable: */
+    .vmsd = &vmstate_riscv_cpu,
 };
 #endif
 
@@ -627,8 +629,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
-    /* For now, mark unmigratable: */
-    cc->vmsd = &vmstate_riscv_cpu;
     cc->sysemu_ops = &riscv_sysemu_ops;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 812cf718732..cb8718a58dc 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -174,7 +174,13 @@ static void rx_cpu_init(Object *obj)
 }
 
 #ifndef CONFIG_USER_ONLY
+static const VMStateDescription vmstate_rx_cpu = {
+    .name = "cpu",
+    .unmigratable = 1,
+};
+
 static struct SysemuCPUOps rx_sysemu_ops = {
+    .vmsd = &vmstate_rx_cpu,
 };
 #endif
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 0efb1381647..a480f4abbaf 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps s390_sysemu_ops = {
+    .vmsd = &vmstate_s390_cpu,
 };
 #endif
 
@@ -522,7 +523,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_s390_cpu;
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 41f1c7c0507..038dfa25e84 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -218,13 +218,14 @@ static void superh_cpu_initfn(Object *obj)
     env->movcal_backup_tail = &(env->movcal_backup);
 }
 
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_sh_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
 
-#ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps sh4_sysemu_ops = {
+    .vmsd = &vmstate_sh_cpu,
 };
 #endif
 
@@ -268,7 +269,6 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_num_core_regs = 59;
 
-    cc->vmsd = &vmstate_sh_cpu;
     cc->tcg_ops = &superh_tcg_ops;
 }
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 377378ca1f2..6a324c2765b 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -850,6 +850,7 @@ static Property sparc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps sparc_sysemu_ops = {
+    .vmsd = &vmstate_sparc_cpu,
 };
 #endif
 
@@ -894,7 +895,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_sparc_cpu;
     cc->sysemu_ops = &sparc_sysemu_ops;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 75f8a2d8014..f1f72be8281 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "qemu/error-report.h"
+#include "migration/vmstate.h"
 
 static inline void set_feature(CPUTriCoreState *env, int feature)
 {
@@ -142,7 +143,13 @@ static void tc27x_initfn(Object *obj)
     set_feature(&cpu->env, TRICORE_FEATURE_161);
 }
 
+static const VMStateDescription vmstate_tricore_cpu = {
+    .name = "cpu",
+    .unmigratable = 1,
+};
+
 static struct SysemuCPUOps tricore_sysemu_ops = {
+    .vmsd = &vmstate_tricore_cpu,
 };
 
 #include "hw/core/tcg-cpu-ops.h"
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 37e57178657..50a61ac0b83 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -121,6 +121,7 @@ static const VMStateDescription vmstate_uc32_cpu = {
 };
 
 static struct SysemuCPUOps uc32_sysemu_ops = {
+    .vmsd = &vmstate_uc32_cpu,
 };
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -149,7 +150,6 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_uc32_cpu;
     cc->sysemu_ops = &uc32_sysemu_ops;
     cc->tcg_ops = &uc32_tcg_ops;
 }
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 7b925468203..7efe5b4f207 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -176,13 +176,14 @@ static void xtensa_cpu_initfn(Object *obj)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_xtensa_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
 
-#ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps xtensa_sysemu_ops = {
+    .vmsd = &vmstate_xtensa_cpu,
 };
 #endif
 
@@ -224,7 +225,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
-    cc->vmsd = &vmstate_xtensa_cpu;
     cc->tcg_ops = &xtensa_tcg_ops;
 }
 
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index a835bd86214..b5ed1dbfd26 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10845,6 +10845,7 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps ppc_sysemu_ops = {
+    .vmsd = &vmstate_ppc_cpu,
 };
 #endif
 
@@ -10890,7 +10891,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_ppc_cpu;
     cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
 #if defined(CONFIG_SOFTMMU)
-- 
2.26.2



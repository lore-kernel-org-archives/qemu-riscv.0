Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHZM8-0005GZ-Ba
	for mharc-qemu-riscv@gnu.org; Wed, 03 Mar 2021 16:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZM4-0005Aw-Jp; Wed, 03 Mar 2021 16:48:28 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZM1-0002Mb-MR; Wed, 03 Mar 2021 16:48:28 -0500
Received: by mail-wm1-x32d.google.com with SMTP id w7so6322243wmb.5;
 Wed, 03 Mar 2021 13:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXKcRBx6DyaBPlolssOm9PcYgrKAw92o6BreAJ9X3O0=;
 b=ZD+XzyE1FKGjHE1RZf9uN0VcRExALzY3sDQI9lSnQhG5zIaIhnNV4QmNY+NIlWFNBt
 pEme1zXvEJ+lvLOPJezWbw/G1ycuiT4pTafWOdmFRKUFxGbS9hRGJOTck0iFAh0DqoIS
 ou7V1kFN9VKHDbe62MMAKF5PXq2gOc+3j8LDKYs8iGbL3PWS3K4+c4LhfQpO25TIXRJi
 KzXTo6LuDh9iO+JJXFWW3/l0J4S/oPVTcxvBotiN95l0eNgCBdqi0ZsCoGRyG4/dVYD1
 WD7fPSldQgynqHTWmAl3/PUnjdFKG5jrrQ+GW6FeDX7xccSiaA3MAiZmlQqFYcR+4826
 3FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YXKcRBx6DyaBPlolssOm9PcYgrKAw92o6BreAJ9X3O0=;
 b=gyabrmOmwsU3RaR3fW/To02UEoaRv6k6uZM1HB52atAYtPwyoybczQ3QCwP3fOnahu
 82GP6S76hTWAV7ooQV+MY0QzhSbtQqdDSguui8BmPFm6XyrbFxQn/CrrwNnAlSS3Cq7p
 rDDChB9tybl20JdEUOTsp2N9IPtICnsnv4/1HlfV/oW3EH+m0edmW8URiGg1q3JNa2SD
 C/IgvdourfCIEyPzW+FxwbWPeTWcF99hYMa7spdKqNmAVIcBwSM6yrVyuv/8HTC91ZRo
 tgpV0lQw3bpx4jOEcAMhjsl5vV90++Y8LGn8YmlIvNwXBsskT62guMnOCDjAm6WvkCi5
 mZ4Q==
X-Gm-Message-State: AOAM531tTS2jwOncCCQiWEoXWwNRUax2ol2H9dTBJEaGoo1whuSk39EA
 dzum2IQo/bDplTpM5zGNo9bYYAs/P9U=
X-Google-Smtp-Source: ABdhPJz1L1VkH6/bGWBaT8vHt2Tbc2noq5Z/IbG+0eY/5NhsFBfw38eKb+cQHDD0gHtGBNFVm/5fxg==
X-Received: by 2002:a1c:9a92:: with SMTP id c140mr781213wme.167.1614808102320; 
 Wed, 03 Mar 2021 13:48:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s124sm6857300wms.40.2021.03.03.13.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:48:21 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v4 13/28] cpu: Move CPUClass::get_phys_page_debug to
 SysemuCPUOps
Date: Wed,  3 Mar 2021 22:46:53 +0100
Message-Id: <20210303214708.1727801-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
X-List-Received-Date: Wed, 03 Mar 2021 21:48:29 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            |  8 --------
 include/hw/core/sysemu-cpu-ops.h | 13 +++++++++++++
 hw/core/cpu.c                    |  6 +++---
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
 target/moxie/cpu.c               |  4 +---
 target/nios2/cpu.c               |  2 +-
 target/openrisc/cpu.c            |  2 +-
 target/riscv/cpu.c               |  2 +-
 target/rx/cpu.c                  |  2 +-
 target/s390x/cpu.c               |  2 +-
 target/sh4/cpu.c                 |  2 +-
 target/sparc/cpu.c               |  2 +-
 target/tricore/cpu.c             |  2 +-
 target/unicore32/cpu.c           |  2 +-
 target/xtensa/cpu.c              |  2 +-
 target/ppc/translate_init.c.inc  |  2 +-
 25 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 6713a615916..9a86c707cf7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -103,11 +103,6 @@ struct AccelCPUClass;
  *       If the target behaviour here is anything other than "set
  *       the PC register to the value passed in" then the target must
  *       also implement the synchronize_from_tb hook.
- * @get_phys_page_debug: Callback for obtaining a physical address.
- * @get_phys_page_attrs_debug: Callback for obtaining a physical address and the
- *       associated memory transaction attributes to use for the access.
- *       CPUs which use memory transaction attributes should implement this
- *       instead of get_phys_page_debug.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
@@ -146,9 +141,6 @@ struct CPUClass {
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
                                Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
-    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
-    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
-                                        MemTxAttrs *attrs);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 3c3f211136d..0c8f616a565 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,19 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @get_phys_page_debug: Callback for obtaining a physical address.
+     */
+    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
+    /**
+     * @get_phys_page_attrs_debug: Callback for obtaining a physical address
+     *       and the associated memory transaction attributes to use for the
+     *       access.
+     * CPUs which use memory transaction attributes should implement this
+     * instead of get_phys_page_debug.
+     */
+    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
+                                        MemTxAttrs *attrs);
     /**
      * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
      *       a memory access with the specified memory transaction attributes.
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index c44229205ff..6932781425a 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -96,12 +96,12 @@ hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_phys_page_attrs_debug) {
-        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
+    if (cc->sysemu_ops->get_phys_page_attrs_debug) {
+        return cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, attrs);
     }
     /* Fallback for CPUs which don't implement the _attrs_ hook */
     *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->get_phys_page_debug(cpu, addr);
+    return cc->sysemu_ops->get_phys_page_debug(cpu, addr);
 }
 
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index de8f9c648fa..fbef4c0923f 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -208,6 +208,7 @@ static void alpha_cpu_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps alpha_sysemu_ops = {
+    .get_phys_page_debug = alpha_cpu_get_phys_page_debug,
     .vmsd = &vmstate_alpha_cpu,
 };
 #endif
@@ -242,7 +243,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
     cc->sysemu_ops = &alpha_sysemu_ops;
 #endif
     cc->disas_set_info = alpha_cpu_disas_set_info;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7edb9f581bc..09566a535e5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,6 +2262,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
@@ -2307,7 +2308,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 20a48bdfbab..436d001a679 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -185,6 +185,7 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 }
 
 static const struct SysemuCPUOps avr_sysemu_ops = {
+    .get_phys_page_debug = avr_cpu_get_phys_page_debug,
     .vmsd = &vms_avr_cpu,
 };
 
@@ -216,7 +217,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
-    cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
     cc->sysemu_ops = &avr_sysemu_ops;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index c05707bad2c..6c1eb8d6172 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -195,6 +195,7 @@ static void cris_cpu_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps cris_sysemu_ops = {
+    .get_phys_page_debug = cris_cpu_get_phys_page_debug,
     .vmsd = &vmstate_cris_cpu,
 };
 #endif
@@ -298,7 +299,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = cris_cpu_gdb_read_register;
     cc->gdb_write_register = cris_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
     cc->sysemu_ops = &cris_sysemu_ops;
 #endif
 
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 110cc8a6d68..f0eeaea22bb 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -133,6 +133,7 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps hppa_sysemu_ops = {
+    .get_phys_page_debug = hppa_cpu_get_phys_page_debug,
     .vmsd = &vmstate_hppa_cpu,
 };
 #endif
@@ -167,7 +168,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
     cc->sysemu_ops = &hppa_sysemu_ops;
 #endif
     cc->disas_set_info = hppa_cpu_disas_set_info;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4f64f9c2d68..0de4ee18bee 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7388,6 +7388,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
     .write_elf32_note = x86_cpu_write_elf32_note,
@@ -7431,7 +7432,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
 #ifndef CONFIG_USER_ONLY
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
-    cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index 4ff54fd9204..d31c33575f6 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -212,6 +212,7 @@ static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps lm32_sysemu_ops = {
+    .get_phys_page_debug = lm32_cpu_get_phys_page_debug,
     .vmsd = &vmstate_lm32_cpu,
 };
 #endif
@@ -246,7 +247,6 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = lm32_cpu_gdb_read_register;
     cc->gdb_write_register = lm32_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
     cc->sysemu_ops = &lm32_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 32 + 7;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index e7ddcf2ee28..67ea33c8200 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -504,6 +504,7 @@ static const VMStateDescription vmstate_m68k_cpu = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps m68k_sysemu_ops = {
+    .get_phys_page_debug = m68k_cpu_get_phys_page_debug,
     .vmsd = &vmstate_m68k_cpu,
 };
 #endif
@@ -538,7 +539,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
 #if defined(CONFIG_SOFTMMU)
-    cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
     cc->sysemu_ops = &m68k_sysemu_ops;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 8b86b99c15b..49d6f16ca70 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -354,6 +354,7 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps mb_sysemu_ops = {
+    .get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug,
     .vmsd = &vmstate_mb_cpu,
 };
 #endif
@@ -392,7 +393,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = mb_cpu_gdb_write_register;
 
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
     cc->sysemu_ops = &mb_sysemu_ops;
 #endif
     device_class_set_props(dc, mb_properties);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ef997bcd67f..d8f2086c69e 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -682,6 +682,7 @@ static Property mips_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps mips_sysemu_ops = {
+    .get_phys_page_debug = mips_cpu_get_phys_page_debug,
     .vmsd = &vmstate_mips_cpu,
 };
 #endif
@@ -725,7 +726,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = mips_cpu_gdb_read_register;
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
     cc->sysemu_ops = &mips_sysemu_ops;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 1e87f07ca73..c488bbc894a 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -95,6 +95,7 @@ static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
 }
 
 static const struct SysemuCPUOps moxie_sysemu_ops = {
+    .get_phys_page_debug = moxie_cpu_get_phys_page_debug,
     .vmsd = &vmstate_moxie_cpu,
 };
 
@@ -124,9 +125,6 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = moxie_cpu_has_work;
     cc->dump_state = moxie_cpu_dump_state;
     cc->set_pc = moxie_cpu_set_pc;
-#ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = moxie_cpu_get_phys_page_debug;
-#endif
     cc->disas_set_info = moxie_cpu_disas_set_info;
     cc->sysemu_ops = &moxie_sysemu_ops;
     cc->tcg_ops = &moxie_tcg_ops;
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index a785f3ea7b6..6fc73ed8693 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -215,6 +215,7 @@ static const VMStateDescription vmstate_nios2_cpu = {
 };
 
 static const struct SysemuCPUOps nios2_sysemu_ops = {
+    .get_phys_page_debug = nios2_cpu_get_phys_page_debug,
     .vmsd = &vmstate_nios2_cpu,
 };
 #endif
@@ -249,7 +250,6 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = nios2_cpu_get_phys_page_debug;
     cc->sysemu_ops = &nios2_sysemu_ops;
 #endif
     cc->gdb_read_register = nios2_cpu_gdb_read_register;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 2149e9564fa..1b05f4e3567 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -176,6 +176,7 @@ static void openrisc_any_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps openrisc_sysemu_ops = {
+    .get_phys_page_debug = openrisc_cpu_get_phys_page_debug,
     .vmsd = &vmstate_openrisc_cpu,
 };
 #endif
@@ -209,7 +210,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
     cc->sysemu_ops = &openrisc_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a6b1ff93299..14dc8583615 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -582,6 +582,7 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps riscv_sysemu_ops = {
+    .get_phys_page_debug = riscv_cpu_get_phys_page_debug,
     /* For now, mark unmigratable: */
     .vmsd = &vmstate_riscv_cpu,
 };
@@ -628,7 +629,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     cc->sysemu_ops = &riscv_sysemu_ops;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index f293f3630d0..5f8226ed31c 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -180,6 +180,7 @@ static const VMStateDescription vmstate_rx_cpu = {
 };
 
 static const struct SysemuCPUOps rx_sysemu_ops = {
+    .get_phys_page_debug = rx_cpu_get_phys_page_debug,
     .vmsd = &vmstate_rx_cpu,
 };
 #endif
@@ -218,7 +219,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
 #endif
     cc->gdb_read_register = rx_cpu_gdb_read_register;
     cc->gdb_write_register = rx_cpu_gdb_write_register;
-    cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
     cc->disas_set_info = rx_cpu_disas_set_info;
 
     cc->gdb_num_core_regs = 26;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 2b249f47eb9..96e8342fb96 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps s390_sysemu_ops = {
+    .get_phys_page_debug = s390_cpu_get_phys_page_debug,
     .get_crash_info = s390_cpu_get_crash_info,
     .write_elf64_note = s390_cpu_write_elf64_note,
     .vmsd = &vmstate_s390_cpu,
@@ -524,7 +525,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = s390_cpu_gdb_read_register;
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 8c1d0ba53b1..2f7b43a0353 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -225,6 +225,7 @@ static const VMStateDescription vmstate_sh_cpu = {
 };
 
 static const struct SysemuCPUOps sh4_sysemu_ops = {
+    .get_phys_page_debug = superh_cpu_get_phys_page_debug,
     .vmsd = &vmstate_sh_cpu,
 };
 #endif
@@ -262,7 +263,6 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
     cc->sysemu_ops = &sh4_sysemu_ops;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index f5862e74baf..b13d586f79d 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -850,6 +850,7 @@ static Property sparc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps sparc_sysemu_ops = {
+    .get_phys_page_debug = sparc_cpu_get_phys_page_debug,
     .vmsd = &vmstate_sparc_cpu,
 };
 #endif
@@ -894,7 +895,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = sparc_cpu_gdb_read_register;
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
     cc->sysemu_ops = &sparc_sysemu_ops;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 9374f8440a0..b1776c10205 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -149,6 +149,7 @@ static const VMStateDescription vmstate_tricore_cpu = {
 };
 
 static const struct SysemuCPUOps tricore_sysemu_ops = {
+    .get_phys_page_debug = tricore_cpu_get_phys_page_debug,
     .vmsd = &vmstate_tricore_cpu,
 };
 
@@ -180,7 +181,6 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
-    cc->get_phys_page_debug = tricore_cpu_get_phys_page_debug;
     cc->sysemu_ops = &tricore_sysemu_ops;
     cc->tcg_ops = &tricore_tcg_ops;
 }
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 345b6e9e417..1b2bb25f508 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -121,6 +121,7 @@ static const VMStateDescription vmstate_uc32_cpu = {
 };
 
 static const struct SysemuCPUOps uc32_sysemu_ops = {
+    .get_phys_page_debug = uc32_cpu_get_phys_page_debug,
     .vmsd = &vmstate_uc32_cpu,
 };
 
@@ -149,7 +150,6 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = uc32_cpu_has_work;
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
-    cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
     cc->sysemu_ops = &uc32_sysemu_ops;
     cc->tcg_ops = &uc32_tcg_ops;
 }
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index fd65246015f..8b1d827e747 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -183,6 +183,7 @@ static const VMStateDescription vmstate_xtensa_cpu = {
 };
 
 static const struct SysemuCPUOps xtensa_sysemu_ops = {
+    .get_phys_page_debug = xtensa_cpu_get_phys_page_debug,
     .vmsd = &vmstate_xtensa_cpu,
 };
 #endif
@@ -222,7 +223,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &xtensa_sysemu_ops;
-    cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
     cc->tcg_ops = &xtensa_tcg_ops;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 598304bd636..cd22a1ce3f0 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10845,6 +10845,7 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .get_phys_page_debug = ppc_cpu_get_phys_page_debug,
     .write_elf32_note = ppc32_cpu_write_elf32_note,
     .write_elf64_note = ppc64_cpu_write_elf64_note,
     .virtio_is_big_endian = ppc_cpu_is_big_endian,
@@ -10893,7 +10894,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
 
-- 
2.26.2



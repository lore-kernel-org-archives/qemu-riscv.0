Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfBl-0003Vo-Pg
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfBj-0003Nw-6k; Thu, 22 Apr 2021 15:40:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfBf-0005oE-AN; Thu, 22 Apr 2021 15:40:34 -0400
Received: by mail-wr1-x430.google.com with SMTP id p6so39273839wrn.9;
 Thu, 22 Apr 2021 12:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kimPdITTY4oOTcXSVRZ5/sMJGOTbvA4T6HV5zeAHBX4=;
 b=i7G4/RvuB0FsqaFnmk2o6fkLDGkG5/GPSyfAPaIUBFfrj1CaQ3RO/QHvA4bn8/QQnZ
 EAOIdvaiFeeOhfT4vcEyNk76qG3OXcZ40LyW8M4WqEjsAeRM2Uyse+YJk1LatpW4gsiU
 OHs7xtyMuDIb6delpTNBHLkOfDFi/OO0rDsA++nv9Ljp+0WZCbwlFW95W5Gps+WCadlb
 sV9q9+Q7F3lIxRGzbsg5Ed55cI6RYcHOasJIDov3CafIcYmn2M7wOVTr2rCJJsjKUIwm
 Ulamy2r0bg1X0N9TZL3qe1nlS6dKEyORipvT2jx6uL7ZVXa2y8naIOiqeGmqxnRgfxyG
 NHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kimPdITTY4oOTcXSVRZ5/sMJGOTbvA4T6HV5zeAHBX4=;
 b=ifU8jKWRuQxo6gvGfdF5u+K30Lb6/6xON/lUVyxkM9LHh1oirHgIoOA4kxavyfjmVQ
 dN0vMMew/rmhvRkYPeLNP6jeRF6mlysDGJycnsMfcdWNOVlathrzDZ+5Y2LgBylpI6KQ
 QigWzBI6Y0Pm6EYXwjwz3BVlRAQkOQfaJy7PmtqYbflQUzj9xkpMOM4XPfmfOVY9wDXw
 QbkOOlxEROfNZL0V60COsofArRPQDVhu2Abf7z48lB6bjgxx2EGHD9UeF46X0gB4fRyk
 8bqu6IBMkqgHFBm3QmA6ymDJXc2/lQurjORAhGrfJdsHGxia3XzWmK3RppjCtymBSQTC
 l/Yg==
X-Gm-Message-State: AOAM533OhHyK+gtr/F32Hyk2V4mwnJybUMrRm993kVRGnv62a2lN+Qo8
 xJfk64BYTGvoZPKBWrnW4Sth+G4GHYscQg==
X-Google-Smtp-Source: ABdhPJyEw2XF9FKop4IiRIfwu2sT/6HNWKaRVbjp23x6O7BwWlLdmi0DHq5NrVA9DzmcjgArwCxBtg==
X-Received: by 2002:adf:f081:: with SMTP id n1mr2950wro.137.1619120426328;
 Thu, 22 Apr 2021 12:40:26 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z14sm6293246wrt.54.2021.04.22.12.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:40:25 -0700 (PDT)
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
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Aurelien Jarno <aurelien@aurel32.net>,
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
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v6 15/18] cpu: Move CPUClass::get_phys_page_debug to
 SysemuCPUOps
Date: Thu, 22 Apr 2021 21:38:59 +0200
Message-Id: <20210422193902.2644064-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 19:40:35 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
 target/moxie/cpu.c               |  2 +-
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
 25 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 28c4fc541a2..88a0a90ac7b 100644
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
index 52a05ea9b3e..4be4a4b4da7 100644
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
index cd01d34d92f..979a4c0be1e 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -208,6 +208,7 @@ static void alpha_cpu_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps alpha_sysemu_ops = {
+    .get_phys_page_debug = alpha_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -241,7 +242,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_alpha_cpu;
     cc->sysemu_ops = &alpha_sysemu_ops;
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e030890c11b..4b7d298827f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1945,6 +1945,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
@@ -1990,7 +1991,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5c8bb9b3fec..a357ff0bffb 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -185,6 +185,7 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 }
 
 static const struct SysemuCPUOps avr_sysemu_ops = {
+    .get_phys_page_debug = avr_cpu_get_phys_page_debug,
 };
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -215,7 +216,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
-    cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
     dc->vmsd = &vms_avr_cpu;
     cc->sysemu_ops = &avr_sysemu_ops;
     cc->disas_set_info = avr_cpu_disas_set_info;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 394df655c9f..58193c02cbf 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -195,6 +195,7 @@ static void cris_cpu_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps cris_sysemu_ops = {
+    .get_phys_page_debug = cris_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -297,7 +298,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = cris_cpu_gdb_read_register;
     cc->gdb_write_register = cris_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_cris_cpu;
     cc->sysemu_ops = &cris_sysemu_ops;
 #endif
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 6605c42e509..0d755b8a880 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -133,6 +133,7 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps hppa_sysemu_ops = {
+    .get_phys_page_debug = hppa_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -166,7 +167,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_hppa_cpu;
     cc->sysemu_ops = &hppa_sysemu_ops;
 #endif
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 70b0108b748..ead0aafd9d1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7393,6 +7393,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
     .write_elf32_note = x86_cpu_write_elf32_note,
@@ -7436,7 +7437,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
 #ifndef CONFIG_USER_ONLY
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
-    cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index 2b40f2b2559..01fbd751eb2 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -212,6 +212,7 @@ static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps lm32_sysemu_ops = {
+    .get_phys_page_debug = lm32_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -245,7 +246,6 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = lm32_cpu_gdb_read_register;
     cc->gdb_write_register = lm32_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_lm32_cpu;
     cc->sysemu_ops = &lm32_sysemu_ops;
 #endif
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 600812d682b..f743a86c7d5 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -505,6 +505,7 @@ static const VMStateDescription vmstate_m68k_cpu = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps m68k_sysemu_ops = {
+    .get_phys_page_debug = m68k_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -538,7 +539,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
 #if defined(CONFIG_SOFTMMU)
-    cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_m68k_cpu;
     cc->sysemu_ops = &m68k_sysemu_ops;
 #endif
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index c6a10b1a52b..8ccac373631 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -354,6 +354,7 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps mb_sysemu_ops = {
+    .get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug,
 };
 #endif
 
@@ -391,7 +392,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = mb_cpu_gdb_write_register;
 
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
     dc->vmsd = &vmstate_mb_cpu;
     cc->sysemu_ops = &mb_sysemu_ops;
 #endif
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 4023d487669..dd6033c576e 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -682,6 +682,7 @@ static Property mips_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps mips_sysemu_ops = {
+    .get_phys_page_debug = mips_cpu_get_phys_page_debug,
     .legacy_vmsd = &vmstate_mips_cpu,
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
index e7bf5298c67..295ccde10e5 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -95,6 +95,7 @@ static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
 }
 
 static const struct SysemuCPUOps moxie_sysemu_ops = {
+    .get_phys_page_debug = moxie_cpu_get_phys_page_debug,
 };
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -124,7 +125,6 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = moxie_cpu_dump_state;
     cc->set_pc = moxie_cpu_set_pc;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = moxie_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_moxie_cpu;
 #endif
     cc->disas_set_info = moxie_cpu_disas_set_info;
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 296ccc0ed3c..f3b51732c29 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -209,6 +209,7 @@ static Property nios2_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps nios2_sysemu_ops = {
+    .get_phys_page_debug = nios2_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -242,7 +243,6 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = nios2_cpu_get_phys_page_debug;
     cc->sysemu_ops = &nios2_sysemu_ops;
 #endif
     cc->gdb_read_register = nios2_cpu_gdb_read_register;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index cd8e3ae6754..babe637cda6 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -176,6 +176,7 @@ static void openrisc_any_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps openrisc_sysemu_ops = {
+    .get_phys_page_debug = openrisc_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -208,7 +209,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_openrisc_cpu;
     cc->sysemu_ops = &openrisc_sysemu_ops;
 #endif
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cacec059754..0c350195e07 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -583,6 +583,7 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps riscv_sysemu_ops = {
+    .get_phys_page_debug = riscv_cpu_get_phys_page_debug,
     .write_elf64_note = riscv_cpu_write_elf64_note,
     .write_elf32_note = riscv_cpu_write_elf32_note,
     /* For now, mark unmigratable: */
@@ -631,7 +632,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     cc->sysemu_ops = &riscv_sysemu_ops;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index bbee1cb913f..e76b7708b89 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -175,6 +175,7 @@ static void rx_cpu_init(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps rx_sysemu_ops = {
+    .get_phys_page_debug = rx_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -212,7 +213,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
 #endif
     cc->gdb_read_register = rx_cpu_gdb_read_register;
     cc->gdb_write_register = rx_cpu_gdb_write_register;
-    cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
     cc->disas_set_info = rx_cpu_disas_set_info;
 
     cc->gdb_num_core_regs = 26;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index afb55be5c8c..5b3551e290c 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps s390_sysemu_ops = {
+    .get_phys_page_debug = s390_cpu_get_phys_page_debug,
     .get_crash_info = s390_cpu_get_crash_info,
     .write_elf64_note = s390_cpu_write_elf64_note,
     .legacy_vmsd = &vmstate_s390_cpu,
@@ -524,7 +525,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = s390_cpu_gdb_read_register;
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 85e15ec9954..09de295cf91 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -225,6 +225,7 @@ static const VMStateDescription vmstate_sh_cpu = {
 };
 
 static const struct SysemuCPUOps sh4_sysemu_ops = {
+    .get_phys_page_debug = superh_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -261,7 +262,6 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
     cc->sysemu_ops = &sh4_sysemu_ops;
     dc->vmsd = &vmstate_sh_cpu;
 #endif
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 543853c24dc..90658ba8e61 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -850,6 +850,7 @@ static Property sparc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps sparc_sysemu_ops = {
+    .get_phys_page_debug = sparc_cpu_get_phys_page_debug,
     .legacy_vmsd = &vmstate_sparc_cpu,
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
index 8865fa18fce..4572dde1486 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -143,6 +143,7 @@ static void tc27x_initfn(Object *obj)
 }
 
 static const struct SysemuCPUOps tricore_sysemu_ops = {
+    .get_phys_page_debug = tricore_cpu_get_phys_page_debug,
 };
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -173,7 +174,6 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
-    cc->get_phys_page_debug = tricore_cpu_get_phys_page_debug;
     cc->sysemu_ops = &tricore_sysemu_ops;
     cc->tcg_ops = &tricore_tcg_ops;
 }
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 60ae917f0ee..36d712259f2 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -122,6 +122,7 @@ static const VMStateDescription vmstate_uc32_cpu = {
 };
 
 static const struct SysemuCPUOps uc32_sysemu_ops = {
+    .get_phys_page_debug = uc32_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -150,7 +151,6 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = uc32_cpu_has_work;
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
-    cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &uc32_sysemu_ops;
     dc->vmsd = &vmstate_uc32_cpu;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index d0bf06696e4..eb61ee55be4 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -183,6 +183,7 @@ static const VMStateDescription vmstate_xtensa_cpu = {
 };
 
 static const struct SysemuCPUOps xtensa_sysemu_ops = {
+    .get_phys_page_debug = xtensa_cpu_get_phys_page_debug,
 };
 #endif
 
@@ -221,7 +222,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &xtensa_sysemu_ops;
-    cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_xtensa_cpu;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index b348b08868d..dc53cc545f4 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10880,6 +10880,7 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .get_phys_page_debug = ppc_cpu_get_phys_page_debug,
     .write_elf32_note = ppc32_cpu_write_elf32_note,
     .write_elf64_note = ppc64_cpu_write_elf64_note,
     .virtio_is_big_endian = ppc_cpu_is_big_endian,
@@ -10928,7 +10929,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
 
-- 
2.26.3



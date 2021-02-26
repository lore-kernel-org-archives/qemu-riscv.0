Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFg4G-0005NN-Ry
	for mharc-qemu-riscv@gnu.org; Fri, 26 Feb 2021 11:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg42-00056g-Qk; Fri, 26 Feb 2021 11:34:02 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3y-0007rF-HO; Fri, 26 Feb 2021 11:34:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id f12so5360860wrx.8;
 Fri, 26 Feb 2021 08:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQ4YHlwNbSL25AZUo/xOoa8axE7iYMW7r02UBMH2a6M=;
 b=DkI5fKT3UPEsAUYxLuKMv3jzzcXgExFTLX6nF4QIqTkXbaKOFW5+KNOfqxec7JfznW
 0fwTVjOGyr/dKGHpEZiay1mHgBKHBWrU4ESfMf8SYVWsMcED9hEXdH++r29oKRYC91c/
 6PK21j6JtF6tUvG9P1HXSisnADjG7kLZEg4tSbNUSuhWuqwsgI0YrZUgVEAYSMqVN2zv
 bD8S5d8BnsJmxORm6SeRCdROGKxOQRi6HJ3M1KBjfGgcHm/2NyEFrqGlF8adb9Bjxa4t
 9q+8JMuNrr0SmKCZ7PExWoVDftG0sAB6L0eIzcny0iUmKrR2IxzoNfd27oaO5iO7rwSI
 k7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gQ4YHlwNbSL25AZUo/xOoa8axE7iYMW7r02UBMH2a6M=;
 b=udyj7U+8jmUcQ/GdxiFB6HTW7fnQexzbEwR1YhLpjUQU7vHP3Xkf/Ud+f2fL4mlYvh
 BgR/8C5nHbyNn8Z2J+Ln/T/Jg89kMuud72AnUjavkIzQEjTmyRkBm8kBk9lBqrhPWbr5
 7suANsD/ed2vSc5xyKrigqcHiFYLNSW64WvVeQSfy1TO4sp4/VE9nc92viNT82OcEHpw
 gJS3QlEOwvlcaEQ5hHTuaford/xgoBRZy0IeGYM42DNGQR+9oR7yyq0pewnCo7V5Abio
 quL6kRzFfMeQjzmtXlqTF2MN7jTLROlqWdn+KlxDs5mJzX0A7V4NNkUMmNXAI9zIjzE8
 bHHw==
X-Gm-Message-State: AOAM532hw4XyylCtw4Ni/1roc3TnOM5Ny7P/pNkjENo1G/WyV2Y2d6Jt
 ceQGQEsVZfNQTodU3HxLlhrnjAsZBXQ=
X-Google-Smtp-Source: ABdhPJx1Mzhs4AoKmJtCNTryhP1c2cJTsmBcpFJwcPJsWyebPgg0DRG2DcDjr5ApFn+jJkWWBZgJzw==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr4089240wrd.126.1614357234852; 
 Fri, 26 Feb 2021 08:33:54 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a14sm15954469wrg.84.2021.02.26.08.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:54 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-ppc@nongnu.org,
 Marek Vasut <marex@denx.de>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Laurent Vivier <laurent@vivier.eu>, Anthony Green <green@moxielogic.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Greg Kurz <groug@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 13/16] cpu: Move CPUClass::get_phys_page_debug to
 CPUSystemOperations
Date: Fri, 26 Feb 2021 17:32:24 +0100
Message-Id: <20210226163227.4097950-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
X-List-Received-Date: Fri, 26 Feb 2021 16:34:04 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h           | 21 +++++++++++++--------
 hw/core/cpu.c                   |  6 +++---
 target/alpha/cpu.c              |  2 +-
 target/arm/cpu.c                |  2 +-
 target/avr/cpu.c                |  2 +-
 target/cris/cpu.c               |  2 +-
 target/hppa/cpu.c               |  2 +-
 target/i386/cpu.c               |  2 +-
 target/lm32/cpu.c               |  2 +-
 target/m68k/cpu.c               |  2 +-
 target/microblaze/cpu.c         |  2 +-
 target/mips/cpu.c               |  2 +-
 target/moxie/cpu.c              |  2 +-
 target/nios2/cpu.c              |  2 +-
 target/openrisc/cpu.c           |  2 +-
 target/riscv/cpu.c              |  2 +-
 target/rx/cpu.c                 |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/sh4/cpu.c                |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/tricore/cpu.c            |  2 +-
 target/unicore32/cpu.c          |  2 +-
 target/xtensa/cpu.c             |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 24 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fc3c4c217b1..5bc66653c19 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -84,6 +84,19 @@ struct AccelCPUClass;
  * struct CPUSystemOperations: System operations specific to a CPU class
  */
 typedef struct CPUSystemOperations {
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
@@ -153,11 +166,6 @@ typedef struct CPUSystemOperations {
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
@@ -196,9 +204,6 @@ struct CPUClass {
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
                                Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
-    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
-    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
-                                        MemTxAttrs *attrs);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index d38eda36bc3..f0c558c002e 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -96,12 +96,12 @@ hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_phys_page_attrs_debug) {
-        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
+    if (cc->system_ops.get_phys_page_attrs_debug) {
+        return cc->system_ops.get_phys_page_attrs_debug(cpu, addr, attrs);
     }
     /* Fallback for CPUs which don't implement the _attrs_ hook */
     *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->get_phys_page_debug(cpu, addr);
+    return cc->system_ops.get_phys_page_debug(cpu, addr);
 }
 
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index ee65971da8e..b430771b7c8 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -236,7 +236,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = alpha_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_alpha_cpu;
 #endif
     cc->disas_set_info = alpha_cpu_disas_set_info;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 86af15b0625..87a581fa47c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2297,7 +2297,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
+    cc->system_ops.get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->system_ops.asidx_from_attrs = arm_asidx_from_attrs;
     cc->system_ops.vmsd = &vmstate_arm_cpu;
     cc->system_ops.virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 0e55d5f4838..d532a579c1b 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -212,7 +212,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
-    cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = avr_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vms_avr_cpu;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index c0392c7def3..6434f170387 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -292,7 +292,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = cris_cpu_gdb_read_register;
     cc->gdb_write_register = cris_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = cris_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_cris_cpu;
 #endif
 
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 58c09824fff..cc72a6ea1ce 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -161,7 +161,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = hppa_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_hppa_cpu;
 #endif
     cc->disas_set_info = hppa_cpu_disas_set_info;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 36b34eee62f..f6f5c333b7e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7420,7 +7420,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->system_ops.asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
-    cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
+    cc->system_ops.get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->system_ops.get_crash_info = x86_cpu_get_crash_info;
     cc->system_ops.write_elf64_note = x86_cpu_write_elf64_note;
     cc->system_ops.write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index bc5f448584c..515728b7f5d 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -240,7 +240,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = lm32_cpu_gdb_read_register;
     cc->gdb_write_register = lm32_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = lm32_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_lm32_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 7;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 30cf308633f..63c45e98e97 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -532,7 +532,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
 #if defined(CONFIG_SOFTMMU)
-    cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = m68k_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_m68k_cpu;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 17670bbfb59..73e99d2d9be 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -386,7 +386,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = mb_cpu_gdb_write_register;
 
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
+    cc->system_ops.get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
     cc->system_ops.vmsd = &vmstate_mb_cpu;
 #endif
     device_class_set_props(dc, mb_properties);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 3389b879087..b95856e3137 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -719,7 +719,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = mips_cpu_gdb_read_register;
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = mips_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_mips_cpu;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 953a440576f..8512bc50715 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -121,7 +121,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = moxie_cpu_dump_state;
     cc->set_pc = moxie_cpu_set_pc;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = moxie_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = moxie_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_moxie_cpu;
 #endif
     cc->disas_set_info = moxie_cpu_disas_set_info;
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index e9c9fc3a389..615aed9729f 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -237,7 +237,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = nios2_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = nios2_cpu_get_phys_page_debug;
 #endif
     cc->gdb_read_register = nios2_cpu_gdb_read_register;
     cc->gdb_write_register = nios2_cpu_gdb_write_register;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index c127bcc0680..02397842757 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -203,7 +203,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_openrisc_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 70651c9b721..7abf7685184 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -621,7 +621,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     /* For now, mark unmigratable: */
     cc->system_ops.vmsd = &vmstate_riscv_cpu;
 #endif
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 7ac6618b26b..1191c686637 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -204,7 +204,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
 
     cc->gdb_read_register = rx_cpu_gdb_read_register;
     cc->gdb_write_register = rx_cpu_gdb_write_register;
-    cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = rx_cpu_get_phys_page_debug;
     cc->disas_set_info = rx_cpu_disas_set_info;
 
     cc->gdb_num_core_regs = 26;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index dcfbb7832e1..11acf9b5727 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -516,7 +516,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = s390_cpu_gdb_read_register;
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = s390_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_s390_cpu;
     cc->system_ops.get_crash_info = s390_cpu_get_crash_info;
     cc->system_ops.write_elf64_note = s390_cpu_write_elf64_note;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 706ef971c3d..533e02bd3d9 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -256,7 +256,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = superh_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index f14a26c154a..46d3e0ec668 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -888,7 +888,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = sparc_cpu_gdb_read_register;
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = sparc_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_sparc_cpu;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 0b1e139bcba..c9ae4249fc1 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -170,7 +170,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
-    cc->get_phys_page_debug = tricore_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = tricore_cpu_get_phys_page_debug;
     cc->tcg_ops = &tricore_tcg_ops;
 }
 
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 277b41194fb..eb4eec341a1 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -145,7 +145,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = uc32_cpu_has_work;
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
-    cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = uc32_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_uc32_cpu;
     cc->tcg_ops = &uc32_tcg_ops;
 }
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 80f12ebf995..befcb004d6f 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -215,7 +215,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = xtensa_cpu_gdb_write_register;
     cc->gdb_stop_before_watchpoint = true;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
     cc->system_ops.vmsd = &vmstate_xtensa_cpu;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index b1ac3291be1..82438c5c72b 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10884,7 +10884,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
+    cc->system_ops.get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_ppc_cpu;
 #endif
 #if defined(CONFIG_SOFTMMU)
-- 
2.26.2



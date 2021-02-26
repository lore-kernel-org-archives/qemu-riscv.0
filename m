Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFg46-0005HK-LK
	for mharc-qemu-riscv@gnu.org; Fri, 26 Feb 2021 11:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3X-0004qf-Lj; Fri, 26 Feb 2021 11:33:31 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3Q-0007iz-Br; Fri, 26 Feb 2021 11:33:31 -0500
Received: by mail-wm1-x32e.google.com with SMTP id x16so7890761wmk.3;
 Fri, 26 Feb 2021 08:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vuc9PsSLt2QcMz7V44LFADU1+acM0s5lJbReK29D000=;
 b=Bfi19QPGpQFQ3L5Iqi+WyuiNpxkTNf4P8xxDYMle/dTLWa+0XAxhG2ERuZEfItnFGg
 GeELWChCYC79YyddyOATVRgUstihC+kGEWhApztxLfHBk8M/h+CXrxovwUSEp1dsipxj
 n4E+wh0kJVhJAfVXp7EgsIU5+2fowHNTl4x/P99wJB1UfE206Zmh3PbQYbNSeKfPjU08
 p5k4IdCULqrNCRKoqkTaYER70ZDB2mweOxJ6Z1UiWnkiQJc808WOhltnkLL3LxKB0MYl
 f9/dXvAHbTZAWyttCUDcAv/Dg2VGDZhVvMoOzQQ2MthYAFB0Hwt3c/D6J55kV8CXfFg/
 wVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vuc9PsSLt2QcMz7V44LFADU1+acM0s5lJbReK29D000=;
 b=OfttT2ASUwVvhA88+b5qtVx3whkc9ClgLpKjfxIVfhZJSNcjvLppm68t1XFHpXlUQj
 Ap+e9hmkXQKuY6Kl2Q45tO+sH9NCAIpGJcE79HCgubBzi6XB3Hd/8nU/u+01Z1bgbR6V
 gOE2CzT8FFqICohmXWsGsiREyECMRmCtL8F+Y/CRrWirR+0ALlrwTMilNNv5RDsGuwP0
 G7N0ZYp6AYrOsCRiM5aZUcMw2eGsYjbuiHrxYH+c3OXgNArWiWlEWrf4vHpM+81N6rH6
 4JbcK/pMwPJhwTk7+Y7qn997ZpZrs4PG4Fsrk/XWsSPkxzFeGPRVa7m1pEJWl2s6DqF7
 pI3A==
X-Gm-Message-State: AOAM5330I9AMUm7dfic329W3S4Y/G4h7m7AGJbiJWs8zXV+Y6xBispyX
 igSlkRubzJjFKB2ZQBdeRq8y6Yk0ZD8=
X-Google-Smtp-Source: ABdhPJyhPNOa1XWROgQB+EA4KJqUQUEQ597fWUb8xq1bcW7m5/CqxV8d2Gxq0gAR4w78qCB6yjD4Tg==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr3617650wmi.127.1614357199103; 
 Fri, 26 Feb 2021 08:33:19 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f2sm10929721wrq.34.2021.02.26.08.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:18 -0800 (PST)
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
Subject: [PATCH 08/16] cpu: Move CPUClass::vmsd to CPUSystemOperations
Date: Fri, 26 Feb 2021 17:32:19 +0100
Message-Id: <20210226163227.4097950-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 16:33:34 -0000

Migration is specific to system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h           |  6 ++++--
 cpu.c                           | 12 ++++++------
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
 target/openrisc/cpu.c           |  2 +-
 target/riscv/cpu.c              |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/sh4/cpu.c                |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/unicore32/cpu.c          |  2 +-
 target/xtensa/cpu.c             |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 21 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index ab89235cb45..bd1cb3b0d37 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -84,6 +84,10 @@ struct AccelCPUClass;
  * struct CPUSystemOperations: System operations specific to a CPU class
  */
 typedef struct CPUSystemOperations {
+    /**
+     * @vmsd: State description for migration.
+     */
+    const VMStateDescription *vmsd;
 } CPUSystemOperations;
 
 /**
@@ -128,7 +132,6 @@ typedef struct CPUSystemOperations {
  * 32-bit VM coredump.
  * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
  * note to a 32-bit VM coredump.
- * @vmsd: State description for migration.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
@@ -183,7 +186,6 @@ struct CPUClass {
     int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
                                 void *opaque);
 
-    const VMStateDescription *vmsd;
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
diff --git a/cpu.c b/cpu.c
index bfbe5a66f95..619b8c14f94 100644
--- a/cpu.c
+++ b/cpu.c
@@ -138,13 +138,13 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #endif /* CONFIG_TCG */
 
 #ifdef CONFIG_USER_ONLY
-    assert(cc->vmsd == NULL);
+    assert(cc->system_ops.vmsd == NULL);
 #else
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-    if (cc->vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->vmsd, cpu);
+    if (cc->system_ops.vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cc->system_ops.vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
 }
@@ -154,10 +154,10 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
 #ifdef CONFIG_USER_ONLY
-    assert(cc->vmsd == NULL);
+    assert(cc->system_ops.vmsd == NULL);
 #else
-    if (cc->vmsd != NULL) {
-        vmstate_unregister(NULL, cc->vmsd, cpu);
+    if (cc->system_ops.vmsd != NULL) {
+        vmstate_unregister(NULL, cc->system_ops.vmsd, cpu);
     }
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index faabffe0796..ee65971da8e 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -237,7 +237,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_alpha_cpu;
+    cc->system_ops.vmsd = &vmstate_alpha_cpu;
 #endif
     cc->disas_set_info = alpha_cpu_disas_set_info;
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b8bc89e71fc..11505e1db10 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2299,7 +2299,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->vmsd = &vmstate_arm_cpu;
+    cc->system_ops.vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 0f4596932ba..0e55d5f4838 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -213,7 +213,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
-    cc->vmsd = &vms_avr_cpu;
+    cc->system_ops.vmsd = &vms_avr_cpu;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 29a865b75d2..c0392c7def3 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -293,7 +293,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = cris_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_cris_cpu;
+    cc->system_ops.vmsd = &vmstate_cris_cpu;
 #endif
 
     cc->gdb_num_core_regs = 49;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 4f142de6e45..58c09824fff 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -162,7 +162,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_hppa_cpu;
+    cc->system_ops.vmsd = &vmstate_hppa_cpu;
 #endif
     cc->disas_set_info = hppa_cpu_disas_set_info;
     cc->gdb_num_core_regs = 128;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a53446e6a5..ae7f7763dfc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7426,7 +7426,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
-    cc->vmsd = &vmstate_x86_cpu;
+    cc->system_ops.vmsd = &vmstate_x86_cpu;
 #endif /* !CONFIG_USER_ONLY */
 
     cc->gdb_arch_name = x86_gdb_arch_name;
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index c23d72874c0..bc5f448584c 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -241,7 +241,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = lm32_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_lm32_cpu;
+    cc->system_ops.vmsd = &vmstate_lm32_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 7;
     cc->gdb_stop_before_watchpoint = true;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index c98fb1e33be..30cf308633f 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -533,7 +533,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
 #if defined(CONFIG_SOFTMMU)
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_m68k_cpu;
+    cc->system_ops.vmsd = &vmstate_m68k_cpu;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 335dfdc734e..17670bbfb59 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -387,7 +387,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
-    cc->vmsd = &vmstate_mb_cpu;
+    cc->system_ops.vmsd = &vmstate_mb_cpu;
 #endif
     device_class_set_props(dc, mb_properties);
     cc->gdb_num_core_regs = 32 + 27;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index bf70c77295f..3389b879087 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -720,7 +720,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_mips_cpu;
+    cc->system_ops.vmsd = &vmstate_mips_cpu;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
     cc->gdb_num_core_regs = 73;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 83bec34d36c..953a440576f 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -122,7 +122,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = moxie_cpu_set_pc;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = moxie_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_moxie_cpu;
+    cc->system_ops.vmsd = &vmstate_moxie_cpu;
 #endif
     cc->disas_set_info = moxie_cpu_disas_set_info;
     cc->tcg_ops = &moxie_tcg_ops;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 79d246d1930..c127bcc0680 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -204,7 +204,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_openrisc_cpu;
+    cc->system_ops.vmsd = &vmstate_openrisc_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
     cc->disas_set_info = openrisc_disas_set_info;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16f1a342388..70651c9b721 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -623,7 +623,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     /* For now, mark unmigratable: */
-    cc->vmsd = &vmstate_riscv_cpu;
+    cc->system_ops.vmsd = &vmstate_riscv_cpu;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d35eb39a1bb..8ba8a96b4d5 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -517,7 +517,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_s390_cpu;
+    cc->system_ops.vmsd = &vmstate_s390_cpu;
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
 #endif
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index bd44de53729..706ef971c3d 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -262,7 +262,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_num_core_regs = 59;
 
-    cc->vmsd = &vmstate_sh_cpu;
+    cc->system_ops.vmsd = &vmstate_sh_cpu;
     cc->tcg_ops = &superh_tcg_ops;
 }
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index aece2c7dc83..f14a26c154a 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -889,7 +889,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_sparc_cpu;
+    cc->system_ops.vmsd = &vmstate_sparc_cpu;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
 
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 12894ffac6a..277b41194fb 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -146,7 +146,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_uc32_cpu;
+    cc->system_ops.vmsd = &vmstate_uc32_cpu;
     cc->tcg_ops = &uc32_tcg_ops;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 6bedd5b97b8..80f12ebf995 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -218,7 +218,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
-    cc->vmsd = &vmstate_xtensa_cpu;
+    cc->system_ops.vmsd = &vmstate_xtensa_cpu;
     cc->tcg_ops = &xtensa_tcg_ops;
 }
 
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index e7324e85cdb..65c45e7870a 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10885,7 +10885,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_ppc_cpu;
+    cc->system_ops.vmsd = &vmstate_ppc_cpu;
 #endif
 #if defined(CONFIG_SOFTMMU)
     cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-- 
2.26.2



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfB4-0002eS-Sm
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAx-0002c3-N9; Thu, 22 Apr 2021 15:39:49 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:44745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAu-0005Ps-Tp; Thu, 22 Apr 2021 15:39:46 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f195-20020a1c1fcc0000b029012eb88126d7so3741786wmf.3; 
 Thu, 22 Apr 2021 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BMW/DG33xhlbjWUsaqVzUdZIFTJ6NXEk+Ef5RupUShU=;
 b=o8nhOKlI3i0SGPgQwrz9Acu7N4pDw4huGjb0uwmRYD+KbeTP7l2+/nd2R858dhai0G
 ILRyNhPefSKsUBTlkd3+EQK/EqDpjKY/yUa1B/7OkJe5zcD9qJ1vVSYa52NtP3dIGqRr
 kXm/maQvl7TQuliMPFWeNLvQv/EhRsg+46K186UYchlVa28d+xssszg9B57LwallOqAC
 DiuBJj1Z1ACVe6sIvcf8EMGwQSWiFQEIypinrqDZ6CgxzWaW0J/tdHsww6EP+xD07E9N
 +BEsM4cQCfyzTKlP7vXVcxCnZmDpICWkq+lFXHMs29+pOcStQCDT5XLR1zAVQPQR7x5T
 JouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BMW/DG33xhlbjWUsaqVzUdZIFTJ6NXEk+Ef5RupUShU=;
 b=XmolyCGXT2DpwAH2eZQJ+CERtJSA3w/2ZZBFMj5l2mBmoXPLH189YENpfhz+JkLhAW
 k/gXCcACbCT6f6UNoytb+SqnXil68ln7up5MkTMM6FEF3fY7j4twJXhVpRXJv1i41H91
 4bkl0sIrFPxkVuqcgEYPNNZlawmv6Wzrm8IA9T6xGCa/HExcU7MjCGSdJ+/do12AvvBo
 MnIatJJpflYP0qNt4IOzFsS0A/O+vaIeq22ZJemh2oLvmPSuXiCMl2QpJgukEr/MKSIE
 Mn6fP6NyjewKwWGFVoYF41xC5bZWQsa5f19gtILFmGRZf4TprwzphF3syo5FD5DSWeTT
 Wzdw==
X-Gm-Message-State: AOAM531thNlO+g5dPq+i+wdTG4l7biXjh/VkqObXYo4WSfqKvmIXYpTI
 pMOuZz8QELl0WKqAvqnosC49okl0mtTwcQ==
X-Google-Smtp-Source: ABdhPJxQHShL/+nWoSsA7zxzCAhXLCp5WRpyNAyj+fZlD6eec/uFLDDTeStLIjPGsl1CFUjxNEXrpA==
X-Received: by 2002:a7b:c012:: with SMTP id c18mr1734447wmb.94.1619120381709; 
 Thu, 22 Apr 2021 12:39:41 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i15sm5484288wru.12.2021.04.22.12.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:39:41 -0700 (PDT)
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
 Michael Rolnik <mrolnik@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Walle <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Anthony Green <green@moxielogic.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v6 07/18] cpu: Rename CPUClass vmsd -> legacy_vmsd
Date: Thu, 22 Apr 2021 21:38:51 +0200
Message-Id: <20210422193902.2644064-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 19:39:51 -0000

Quoting Peter Maydell [*]:

  There are two ways to handle migration for
  a CPU object:

  (1) like any other device, so it has a dc->vmsd that covers
  migration for the whole object. As usual for objects that are a
  subclass of a parent that has state, the first entry in the
  VMStateDescription field list is VMSTATE_CPU(), which migrates
  the cpu_common fields, followed by whatever the CPU's own migration
  fields are.

  (2) a backwards-compatible mechanism for CPUs that were
  originally migrated using manual "write fields to the migration
  stream structures". The on-the-wire migration format
  for those is based on the 'env' pointer (which isn't a QOM object),
  and the cpu_common part of the migration data is elsewhere.

  cpu_exec_realizefn() handles both possibilities:

  * for type 1, dc->vmsd is set and cc->vmsd is not,
    so cpu_exec_realizefn() does nothing, and the standard
    "register dc->vmsd for a device" code does everything needed

  * for type 2, dc->vmsd is NULL and so we register the
    vmstate_cpu_common directly to handle the cpu-common fields,
    and the cc->vmsd to handle the per-CPU stuff

  You can't change a CPU from one type to the other without breaking
  migration compatibility, which is why some guest architectures
  are stuck on the cc->vmsd form. New targets should use dc->vmsd.

To avoid new targets to start using type (2), rename cc->vmsd as
cc->legacy_vmsd. The correct field to implement is dc->vmsd (the
DeviceClass one).

See also commit b170fce3dd0 ("cpu: Register VMStateDescription
through CPUState") for historic background.

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg800849.html

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h           |  5 +++--
 cpu.c                           | 12 ++++++------
 target/arm/cpu.c                |  2 +-
 target/avr/cpu.c                |  2 +-
 target/i386/cpu.c               |  2 +-
 target/lm32/cpu.c               |  2 +-
 target/mips/cpu.c               |  2 +-
 target/moxie/cpu.c              |  2 +-
 target/riscv/cpu.c              |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 12 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 08af2c383a5..10dd16531ba 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -122,7 +122,8 @@ struct AccelCPUClass;
  * 32-bit VM coredump.
  * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
  * note to a 32-bit VM coredump.
- * @vmsd: State description for migration.
+ * @legacy_vmsd: Legacy state description for migration.
+ *               Do not use in new targets, use #DeviceClass::vmsd instead.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
@@ -177,7 +178,7 @@ struct CPUClass {
     int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
                                 void *opaque);
 
-    const VMStateDescription *vmsd;
+    const VMStateDescription *legacy_vmsd;
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
diff --git a/cpu.c b/cpu.c
index 4fed04219df..c1c9cdebc3e 100644
--- a/cpu.c
+++ b/cpu.c
@@ -139,13 +139,13 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 
 #ifdef CONFIG_USER_ONLY
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL);
-    assert(cc->vmsd == NULL);
+    assert(cc->legacy_vmsd == NULL);
 #else
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-    if (cc->vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->vmsd, cpu);
+    if (cc->legacy_vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cc->legacy_vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
 }
@@ -155,10 +155,10 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
 #ifdef CONFIG_USER_ONLY
-    assert(cc->vmsd == NULL);
+    assert(cc->legacy_vmsd == NULL);
 #else
-    if (cc->vmsd != NULL) {
-        vmstate_unregister(NULL, cc->vmsd, cpu);
+    if (cc->legacy_vmsd != NULL) {
+        vmstate_unregister(NULL, cc->legacy_vmsd, cpu);
     }
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0dd623e5909..3062e8c702e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1982,7 +1982,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->vmsd = &vmstate_arm_cpu;
+    cc->legacy_vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 0f4596932ba..37a8ebcc86f 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -213,7 +213,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
-    cc->vmsd = &vms_avr_cpu;
+    cc->legacy_vmsd = &vms_avr_cpu;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad0e7c..f85ae518dd4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7431,7 +7431,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
-    cc->vmsd = &vmstate_x86_cpu;
+    cc->legacy_vmsd = &vmstate_x86_cpu;
 #endif /* !CONFIG_USER_ONLY */
 
     cc->gdb_arch_name = x86_gdb_arch_name;
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index c23d72874c0..c0388142528 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -241,7 +241,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = lm32_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_lm32_cpu;
+    cc->legacy_vmsd = &vmstate_lm32_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 7;
     cc->gdb_stop_before_watchpoint = true;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index dce1e166bde..11604954504 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -720,7 +720,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_mips_cpu;
+    cc->legacy_vmsd = &vmstate_mips_cpu;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
     cc->gdb_num_core_regs = 73;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 83bec34d36c..3c81a088eaa 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -122,7 +122,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = moxie_cpu_set_pc;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = moxie_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_moxie_cpu;
+    cc->legacy_vmsd = &vmstate_moxie_cpu;
 #endif
     cc->disas_set_info = moxie_cpu_disas_set_info;
     cc->tcg_ops = &moxie_tcg_ops;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b6..70be7e8287a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -624,7 +624,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     /* For now, mark unmigratable: */
-    cc->vmsd = &vmstate_riscv_cpu;
+    cc->legacy_vmsd = &vmstate_riscv_cpu;
     cc->write_elf64_note = riscv_cpu_write_elf64_note;
     cc->write_elf32_note = riscv_cpu_write_elf32_note;
 #endif
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d35eb39a1bb..197c4b87f30 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -517,7 +517,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_s390_cpu;
+    cc->legacy_vmsd = &vmstate_s390_cpu;
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
 #endif
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index aece2c7dc83..ba497561bfa 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -889,7 +889,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_sparc_cpu;
+    cc->legacy_vmsd = &vmstate_sparc_cpu;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
 
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index c03a7c4f526..110a68a867e 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10920,7 +10920,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_ppc_cpu;
+    cc->legacy_vmsd = &vmstate_ppc_cpu;
 #endif
 #if defined(CONFIG_SOFTMMU)
     cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-- 
2.26.3



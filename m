Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFg46-0005Hw-Tg
	for mharc-qemu-riscv@gnu.org; Fri, 26 Feb 2021 11:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3j-0004yH-BM; Fri, 26 Feb 2021 11:33:45 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3g-0007nF-7K; Fri, 26 Feb 2021 11:33:42 -0500
Received: by mail-wm1-x330.google.com with SMTP id n4so6904833wmq.3;
 Fri, 26 Feb 2021 08:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yppSFDQsnap9fkQDMIB4LM/Hd6+rcDegPvCr9hlrbG4=;
 b=RqsbZxiETkb9P1vuejki+clVSger/BhVc0Y+i01T/lyJFro47QMOYFEMQqeEX1LpL7
 egUkAka5uPw2lBcHNJ0vmPvzX9kShILCt1LYd8Pc9NUFZF7PVRR9mU/2Ba6LPYuoFGiX
 0QzMPnkIQ8Gipw3mRI7eJ5wJbatX3hOLnjEQwf7/+Ea9Hazd3VKiE3yb8f1F8053wia+
 8dVtdlIqd1a81+yFEZNVyrWfaC1WXzW0A1HUaR85voFyhcrK+7V6v7I6GBmEZphGFTaO
 SNXSDtatdL7TS9VV6VAY2aMOUueFGtwOyHf5y1DLVof1oYhLzgBmOalNvfEGE7DeiYIl
 6cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yppSFDQsnap9fkQDMIB4LM/Hd6+rcDegPvCr9hlrbG4=;
 b=VQpeohn97auRht7GdS5WCjYStRWDXeD9mOnBlJI5rLvAxsjpn0qjWxH0TA4SSP0Ymv
 b5DA4nDnGIhflQgL0o/xsw0m3iDcUKdsj9RQQCtQYqKY/D1vHHBNO+4y2HOZwOo+tLQz
 AJCnZ6fh2bAv5XnHv0stT2T3gjPIztdvlYd8m6kDr1O03zVKwkIusmvPFL+NkbDZk3aZ
 JsnLyPjlELIApkDeiowXfn3deu3M9FgEF8aM+FBwTd8n3yNxZ5HeBlccLvrCcFoiYNqS
 Bb2CGbWLHC8Pjn2Ie+6JFJTliFGiFrBs8mVsGrlMbIEuOOHRv6kKd5V3z2Zz77kvxjh0
 VstQ==
X-Gm-Message-State: AOAM531aFs1o6u57DNKO+UjNT3CbGYWqtyPsTZNwsGrymsiISDMiwc+U
 c1qTRg501AVgbUhrJHo8FOy2Cvt+Od0=
X-Google-Smtp-Source: ABdhPJyOK9RTuFTedODbjc7g1TL8cebAOnvvMApPg5J3vznBAKYuBzcDbmpndB9iBqkymNzHHyJROA==
X-Received: by 2002:a1c:f409:: with SMTP id z9mr3633637wma.141.1614357217212; 
 Fri, 26 Feb 2021 08:33:37 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm15756579wry.90.2021.02.26.08.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:36 -0800 (PST)
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
Subject: [PATCH 11/16] cpu: Move CPUClass::write_elf* to CPUSystemOperations
Date: Fri, 26 Feb 2021 17:32:22 +0100
Message-Id: <20210226163227.4097950-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 16:33:56 -0000

The write_elf*() handlers are used to dump vmcore images.
This feature is only meaningful for system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h           | 41 +++++++++++++++++++--------------
 hw/core/cpu.c                   | 16 ++++++-------
 target/arm/cpu.c                |  4 ++--
 target/i386/cpu.c               |  8 +++----
 target/s390x/cpu.c              |  2 +-
 target/ppc/translate_init.c.inc |  4 ++--
 6 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 87186e85d44..e8c2e9af3bb 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,6 +89,30 @@ typedef struct CPUSystemOperations {
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
@@ -133,14 +157,6 @@ typedef struct CPUSystemOperations {
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
@@ -184,15 +200,6 @@ struct CPUClass {
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
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index ddf5635d87b..3dc8faf6086 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -151,10 +151,10 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf32_qemunote) {
+    if (!cc->system_ops.write_elf32_qemunote) {
         return 0;
     }
-    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
+    return (*cc->system_ops.write_elf32_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -162,10 +162,10 @@ int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf32_note) {
+    if (!cc->system_ops.write_elf32_note) {
         return -1;
     }
-    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
+    return (*cc->system_ops.write_elf32_note)(f, cpu, cpuid, opaque);
 }
 
 int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
@@ -173,10 +173,10 @@ int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf64_qemunote) {
+    if (!cc->system_ops.write_elf64_qemunote) {
         return 0;
     }
-    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
+    return (*cc->system_ops.write_elf64_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -184,10 +184,10 @@ int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf64_note) {
+    if (!cc->system_ops.write_elf64_note) {
         return -1;
     }
-    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
+    return (*cc->system_ops.write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
 static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3cbb17a5879..4941a651e64 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2301,8 +2301,8 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->system_ops.vmsd = &vmstate_arm_cpu;
     cc->system_ops.virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
-    cc->write_elf64_note = arm_cpu_write_elf64_note;
-    cc->write_elf32_note = arm_cpu_write_elf32_note;
+    cc->system_ops.write_elf64_note = arm_cpu_write_elf64_note;
+    cc->system_ops.write_elf32_note = arm_cpu_write_elf32_note;
 #endif
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "arm-core.xml";
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9692843256c..c34d41d4c79 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7422,10 +7422,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->system_ops.get_crash_info = x86_cpu_get_crash_info;
-    cc->write_elf64_note = x86_cpu_write_elf64_note;
-    cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
-    cc->write_elf32_note = x86_cpu_write_elf32_note;
-    cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
+    cc->system_ops.write_elf64_note = x86_cpu_write_elf64_note;
+    cc->system_ops.write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
+    cc->system_ops.write_elf32_note = x86_cpu_write_elf32_note;
+    cc->system_ops.write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
     cc->system_ops.vmsd = &vmstate_x86_cpu;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index f9107cb7179..dcfbb7832e1 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -519,7 +519,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_s390_cpu;
     cc->system_ops.get_crash_info = s390_cpu_get_crash_info;
-    cc->write_elf64_note = s390_cpu_write_elf64_note;
+    cc->system_ops.write_elf64_note = s390_cpu_write_elf64_note;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
     cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 2e5c272190b..b1ac3291be1 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10888,8 +10888,8 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->system_ops.vmsd = &vmstate_ppc_cpu;
 #endif
 #if defined(CONFIG_SOFTMMU)
-    cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-    cc->write_elf32_note = ppc32_cpu_write_elf32_note;
+    cc->system_ops.write_elf64_note = ppc64_cpu_write_elf64_note;
+    cc->system_ops.write_elf32_note = ppc32_cpu_write_elf32_note;
 #endif
 
     cc->gdb_num_core_regs = 71;
-- 
2.26.2



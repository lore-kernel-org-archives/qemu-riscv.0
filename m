Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liarg-00078a-W0
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liare-0006yB-66; Mon, 17 May 2021 06:52:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarc-0006qj-0U; Mon, 17 May 2021 06:52:45 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h4so5853885wrt.12;
 Mon, 17 May 2021 03:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5+gvNlAktZ3R/5laA6wCqdudeSBg0Z7c6s+SBPqNIIY=;
 b=bR892HYfwwHBg/vgifAlkOOxTfAFp4pHdOKV5RWbZij8oCOytRLrmAfZ8TIGJxQCYw
 W8wslVt8DKGT1KMOLiAfEjXxX3Bfqc60m+81DvHK3H6km4IS1UtOeEQseAegw6+CkGgd
 OlKokQ3UZ41iDLLWmjZ/QE2HvaV1hWUxcuaVVwg4oCjG0hHsK9WcVIsilnxso7WAuoFG
 O68Ohzc4ncHmAIfUhn4DNMvxWYEDyRuo/VUSZfzmL7NiioA5BbsKBtMxoqEpw2hYHQVH
 WSxB87KaZolBEEx8uA4+CFZcNmv5qD2u7mUCYY0QAsNuyUxuOvT7XZkrSjE7Q76oYNa8
 qblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5+gvNlAktZ3R/5laA6wCqdudeSBg0Z7c6s+SBPqNIIY=;
 b=YUoArhfSzaCUhUWt1lk89JJYIcY/zcXmm6MjQiLwGFLGfF3jEk05OdThbXNoscmY3O
 KOqt+vqzEqcg3GVeuo7ZZXNvrRk+dwJU9vXNWAkDYnZoLMayrVZKFYCQgSuHBph7xe5n
 3TskvQ05QRi+g38/GaIxfQZMOy3NPGg8WGQxRxUzI+4cNZ3k/CGQJSnEDKmYw4RVKf9b
 5f8cdXIafcJDOmNLiXV4tpz/bc8C09we/bQAyb3DkUHpbcferiUEZcKDCjR96MxeIK5a
 G7KKInJPcjv1W2TNWtifRHZ/rneOndHA4+D4hjJ2UMfhNA06UYmBzr8FnjBXr7k6rDMy
 M63w==
X-Gm-Message-State: AOAM530HnacmfCKASZZlgVNjTuyatyRmResWA6wzhnNolZZEQS3ZJDrK
 /MZKde/dJjPGpsreyEYlu26d05nIFMmxHg==
X-Google-Smtp-Source: ABdhPJwUVb/K957DjQSpTi+XYOVrdkz5o/cJDNZJgaxcUKqADJREYW2UlikacX40ZzT0QMMd7Pwo6A==
X-Received: by 2002:a5d:5409:: with SMTP id g9mr3148894wrv.321.1621248760948; 
 Mon, 17 May 2021 03:52:40 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m9sm9985812wrs.36.2021.05.17.03.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 12/23] cpu: Rename CPUClass vmsd -> legacy_vmsd
Date: Mon, 17 May 2021 12:51:29 +0200
Message-Id: <20210517105140.1062037-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Mon, 17 May 2021 10:52:47 -0000

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h           |  5 +++--
 cpu.c                           | 12 ++++++------
 target/arm/cpu.c                |  2 +-
 target/avr/cpu.c                |  2 +-
 target/i386/cpu.c               |  2 +-
 target/mips/cpu.c               |  2 +-
 target/riscv/cpu.c              |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 10 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d96ff4dace0..1dfb788415b 100644
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
index 6fe4af27975..c57f4c302bc 100644
--- a/cpu.c
+++ b/cpu.c
@@ -143,13 +143,13 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #ifdef CONFIG_USER_ONLY
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
            qdev_get_vmsd(DEVICE(cpu))->unmigratable);
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
@@ -159,10 +159,10 @@ void cpu_exec_unrealizefn(CPUState *cpu)
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
index 4eb0d2f85c4..e9ad85dd706 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1981,7 +1981,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
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
index c496bfa1c23..5a1c8ead8ed 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6749,7 +6749,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
-    cc->vmsd = &vmstate_x86_cpu;
+    cc->legacy_vmsd = &vmstate_x86_cpu;
 #endif /* !CONFIG_USER_ONLY */
 
     cc->gdb_arch_name = x86_gdb_arch_name;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 1ad2fe4aa33..eba56ac8996 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -561,7 +561,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_mips_cpu;
+    cc->legacy_vmsd = &vmstate_mips_cpu;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
     cc->gdb_num_core_regs = 73;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d459e8427e2..16510da2597 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -638,7 +638,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_riscv_cpu;
+    cc->legacy_vmsd = &vmstate_riscv_cpu;
     cc->write_elf64_note = riscv_cpu_write_elf64_note;
     cc->write_elf32_note = riscv_cpu_write_elf32_note;
 #endif
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 64455cf309a..7ce425f6111 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -516,7 +516,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
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
index 66e6a4a746f..f0f198e717f 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10279,7 +10279,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
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



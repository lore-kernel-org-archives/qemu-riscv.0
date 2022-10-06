Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogStf-0003Sr-MY
	for mharc-qemu-riscv@gnu.org; Thu, 06 Oct 2022 11:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStd-0003P2-Ou
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:34:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStZ-00008R-A9
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVvpc/SrUvmDLkZ9chOAhp6yjjLI22kiwBGCNoZZB4s=;
 b=fhH+3gLA7i9GASWqNxX1PBb0dgi1UUsb7GWt1pu79cRV7/W6Jvtm6T1bIiymiX+UL037Yj
 LTgG/8tNwA/JfCwTNB9GnoHVhSi/Eywb5jORmDneNWYEkqx309liP+Mg04eRDjQG33ESeE
 PW+B77A98JfXK0XG7Fc6vbtajbOrQfE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-a3lxBPbnOJetHbbjZawmqA-1; Thu, 06 Oct 2022 11:34:41 -0400
X-MC-Unique: a3lxBPbnOJetHbbjZawmqA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F28A858F17;
 Thu,  6 Oct 2022 15:34:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 642BD403167;
 Thu,  6 Oct 2022 15:34:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 viktor.prutyanov@redhat.com, Greg Kurz <groug@kaod.org>,
 frankja@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 01/10] dump: Replace opaque DumpState pointer with a typed one
Date: Thu,  6 Oct 2022 19:34:20 +0400
Message-Id: <20221006153430.2775580-2-marcandre.lureau@redhat.com>
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Oct 2022 15:34:50 -0000

From: Janosch Frank <frankja@linux.ibm.com>

It's always better to convey the type of a pointer if at all
possible. So let's add the DumpState typedef to typedefs.h and move
the dump note functions from the opaque pointers to DumpState
pointers.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Cédric Le Goater <clg@kaod.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Greg Kurz <groug@kaod.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Bin Meng <bin.meng@windriver.com>
CC: Cornelia Huck <cohuck@redhat.com>
CC: Thomas Huth <thuth@redhat.com>
CC: Richard Henderson <richard.henderson@linaro.org>
CC: David Hildenbrand <david@redhat.com>
Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220811121111.9878-2-frankja@linux.ibm.com>
---
 include/hw/core/sysemu-cpu-ops.h |  8 ++++----
 include/qemu/typedefs.h          |  1 +
 target/arm/cpu.h                 |  4 ++--
 target/i386/cpu.h                |  8 ++++----
 target/ppc/cpu.h                 |  4 ++--
 target/riscv/cpu.h               |  4 ++--
 target/s390x/s390x-internal.h    |  2 +-
 target/arm/arch_dump.c           |  6 ++----
 target/i386/arch_dump.c          | 30 +++++++++++++++---------------
 target/ppc/arch_dump.c           | 18 +++++++++---------
 target/riscv/arch_dump.c         |  6 ++----
 target/s390x/arch_dump.c         | 10 +++++-----
 12 files changed, 49 insertions(+), 52 deletions(-)

diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index a9ba39e5f2..ee169b872c 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -53,25 +53,25 @@ typedef struct SysemuCPUOps {
      * 32-bit VM coredump.
      */
     int (*write_elf32_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
+                            int cpuid, DumpState *s);
     /**
      * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
      * 64-bit VM coredump.
      */
     int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
+                            int cpuid, DumpState *s);
     /**
      * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
      * note to a 32-bit VM coredump.
      */
     int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
+                                DumpState *s);
     /**
      * @write_elf64_qemunote: Callback for writing a CPU- and QEMU-specific ELF
      * note to a 64-bit VM coredump.
      */
     int (*write_elf64_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
+                                DumpState *s);
     /**
      * @virtio_is_big_endian: Callback to return %true if a CPU which supports
      * runtime configurable endianness is currently big-endian.
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 5f95169827..6d4e6d9708 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -131,6 +131,7 @@ typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef struct VMChangeStateEntry VMChangeStateEntry;
 typedef struct VMStateDescription VMStateDescription;
+typedef struct DumpState DumpState;
 
 /*
  * Pointer types
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 429ed42eec..85dc263318 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1102,9 +1102,9 @@ int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 const char *arm_gdb_get_dynamic_xml(CPUState *cpu, const char *xmlname);
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque);
+                             int cpuid, DumpState *s);
 int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque);
+                             int cpuid, DumpState *s);
 
 #ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 82004b65b9..b75108d6a3 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1938,13 +1938,13 @@ extern const VMStateDescription vmstate_x86_cpu;
 int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
 
 int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
-                             int cpuid, void *opaque);
+                             int cpuid, DumpState *s);
 int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
-                             int cpuid, void *opaque);
+                             int cpuid, DumpState *s);
 int x86_cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                                 void *opaque);
+                                 DumpState *s);
 int x86_cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                                 void *opaque);
+                                 DumpState *s);
 
 void x86_cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                                 Error **errp);
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 7f73e2ac81..cca6c4e51c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1354,9 +1354,9 @@ void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque);
+                               int cpuid, DumpState *s);
 int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque);
+                               int cpuid, DumpState *s);
 #ifndef CONFIG_USER_ONLY
 void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b131fa8c8e..3a9e25053f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -534,9 +534,9 @@ extern const char * const riscv_fpr_regnames[];
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
 void riscv_cpu_do_interrupt(CPUState *cpu);
 int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque);
+                               int cpuid, DumpState *s);
 int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque);
+                               int cpuid, DumpState *s);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 6aba7fd0ca..b5ae0ae364 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -227,7 +227,7 @@ static inline hwaddr decode_basedisp_s(CPUS390XState *env, uint32_t ipb,
 
 /* arch_dump.c */
 int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                              int cpuid, void *opaque);
+                              int cpuid, DumpState *s);
 
 
 /* cc_helper.c */
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index b1f040e69f..2d8e41ab8a 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -232,12 +232,11 @@ static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
 #endif
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque)
+                             int cpuid, DumpState *s)
 {
     struct aarch64_note note;
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    DumpState *s = opaque;
     uint64_t pstate, sp;
     int ret, i;
 
@@ -360,12 +359,11 @@ static int arm_write_elf32_vfp(WriteCoreDumpFunction f, CPUARMState *env,
 }
 
 int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque)
+                             int cpuid, DumpState *s)
 {
     struct arm_note note;
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    DumpState *s = opaque;
     int ret, i;
     bool fpvalid = cpu_isar_feature(aa32_vfp_simd, cpu);
 
diff --git a/target/i386/arch_dump.c b/target/i386/arch_dump.c
index 004141fc04..c290910a04 100644
--- a/target/i386/arch_dump.c
+++ b/target/i386/arch_dump.c
@@ -42,7 +42,7 @@ typedef struct {
 
 static int x86_64_write_elf64_note(WriteCoreDumpFunction f,
                                    CPUX86State *env, int id,
-                                   void *opaque)
+                                   DumpState *s)
 {
     x86_64_user_regs_struct regs;
     Elf64_Nhdr *note;
@@ -94,7 +94,7 @@ static int x86_64_write_elf64_note(WriteCoreDumpFunction f,
     buf += descsz - sizeof(x86_64_user_regs_struct)-sizeof(target_ulong);
     memcpy(buf, &regs, sizeof(x86_64_user_regs_struct));
 
-    ret = f(note, note_size, opaque);
+    ret = f(note, note_size, s);
     g_free(note);
     if (ret < 0) {
         return -1;
@@ -148,7 +148,7 @@ static void x86_fill_elf_prstatus(x86_elf_prstatus *prstatus, CPUX86State *env,
 }
 
 static int x86_write_elf64_note(WriteCoreDumpFunction f, CPUX86State *env,
-                                int id, void *opaque)
+                                int id, DumpState *s)
 {
     x86_elf_prstatus prstatus;
     Elf64_Nhdr *note;
@@ -170,7 +170,7 @@ static int x86_write_elf64_note(WriteCoreDumpFunction f, CPUX86State *env,
     buf += ROUND_UP(name_size, 4);
     memcpy(buf, &prstatus, sizeof(prstatus));
 
-    ret = f(note, note_size, opaque);
+    ret = f(note, note_size, s);
     g_free(note);
     if (ret < 0) {
         return -1;
@@ -180,7 +180,7 @@ static int x86_write_elf64_note(WriteCoreDumpFunction f, CPUX86State *env,
 }
 
 int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque)
+                             int cpuid, DumpState *s)
 {
     X86CPU *cpu = X86_CPU(cs);
     int ret;
@@ -189,10 +189,10 @@ int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
     bool lma = !!(first_x86_cpu->env.hflags & HF_LMA_MASK);
 
     if (lma) {
-        ret = x86_64_write_elf64_note(f, &cpu->env, cpuid, opaque);
+        ret = x86_64_write_elf64_note(f, &cpu->env, cpuid, s);
     } else {
 #endif
-        ret = x86_write_elf64_note(f, &cpu->env, cpuid, opaque);
+        ret = x86_write_elf64_note(f, &cpu->env, cpuid, s);
 #ifdef TARGET_X86_64
     }
 #endif
@@ -201,7 +201,7 @@ int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 }
 
 int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque)
+                             int cpuid, DumpState *s)
 {
     X86CPU *cpu = X86_CPU(cs);
     x86_elf_prstatus prstatus;
@@ -224,7 +224,7 @@ int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
     buf += ROUND_UP(name_size, 4);
     memcpy(buf, &prstatus, sizeof(prstatus));
 
-    ret = f(note, note_size, opaque);
+    ret = f(note, note_size, s);
     g_free(note);
     if (ret < 0) {
         return -1;
@@ -329,7 +329,7 @@ static void qemu_get_cpustate(QEMUCPUState *s, CPUX86State *env)
 
 static inline int cpu_write_qemu_note(WriteCoreDumpFunction f,
                                       CPUX86State *env,
-                                      void *opaque,
+                                      DumpState *s,
                                       int type)
 {
     QEMUCPUState state;
@@ -369,7 +369,7 @@ static inline int cpu_write_qemu_note(WriteCoreDumpFunction f,
     buf += ROUND_UP(name_size, 4);
     memcpy(buf, &state, sizeof(state));
 
-    ret = f(note, note_size, opaque);
+    ret = f(note, note_size, s);
     g_free(note);
     if (ret < 0) {
         return -1;
@@ -379,19 +379,19 @@ static inline int cpu_write_qemu_note(WriteCoreDumpFunction f,
 }
 
 int x86_cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cs,
-                                 void *opaque)
+                                 DumpState *s)
 {
     X86CPU *cpu = X86_CPU(cs);
 
-    return cpu_write_qemu_note(f, &cpu->env, opaque, 1);
+    return cpu_write_qemu_note(f, &cpu->env, s, 1);
 }
 
 int x86_cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cs,
-                                 void *opaque)
+                                 DumpState *s)
 {
     X86CPU *cpu = X86_CPU(cs);
 
-    return cpu_write_qemu_note(f, &cpu->env, opaque, 0);
+    return cpu_write_qemu_note(f, &cpu->env, s, 0);
 }
 
 int cpu_get_dump_info(ArchDumpInfo *info,
diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index 1139cead9f..f58e6359d5 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -270,23 +270,23 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
 static int ppc_write_all_elf_notes(const char *note_name,
                                    WriteCoreDumpFunction f,
                                    PowerPCCPU *cpu, int id,
-                                   void *opaque)
+                                   DumpState *s)
 {
-    NoteFuncArg arg = { .state = opaque };
+    NoteFuncArg arg = { .state = s };
     int ret = -1;
     int note_size;
     const NoteFuncDesc *nf;
 
     for (nf = note_func; nf->note_contents_func; nf++) {
-        arg.note.hdr.n_namesz = cpu_to_dump32(opaque, sizeof(arg.note.name));
-        arg.note.hdr.n_descsz = cpu_to_dump32(opaque, nf->contents_size);
+        arg.note.hdr.n_namesz = cpu_to_dump32(s, sizeof(arg.note.name));
+        arg.note.hdr.n_descsz = cpu_to_dump32(s, nf->contents_size);
         strncpy(arg.note.name, note_name, sizeof(arg.note.name));
 
         (*nf->note_contents_func)(&arg, cpu);
 
         note_size =
             sizeof(arg.note) - sizeof(arg.note.contents) + nf->contents_size;
-        ret = f(&arg.note, note_size, opaque);
+        ret = f(&arg.note, note_size, s);
         if (ret < 0) {
             return -1;
         }
@@ -295,15 +295,15 @@ static int ppc_write_all_elf_notes(const char *note_name,
 }
 
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque)
+                               int cpuid, DumpState *s)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, opaque);
+    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, s);
 }
 
 int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque)
+                               int cpuid, DumpState *s)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, opaque);
+    return ppc_write_all_elf_notes("CORE", f, cpu, cpuid, s);
 }
diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
index 709f621d82..736a232956 100644
--- a/target/riscv/arch_dump.c
+++ b/target/riscv/arch_dump.c
@@ -64,12 +64,11 @@ static void riscv64_note_init(struct riscv64_note *note, DumpState *s,
 }
 
 int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque)
+                               int cpuid, DumpState *s)
 {
     struct riscv64_note note;
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    DumpState *s = opaque;
     int ret, i = 0;
     const char name[] = "CORE";
 
@@ -134,12 +133,11 @@ static void riscv32_note_init(struct riscv32_note *note, DumpState *s,
 }
 
 int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                               int cpuid, void *opaque)
+                               int cpuid, DumpState *s)
 {
     struct riscv32_note note;
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    DumpState *s = opaque;
     int ret, i;
     const char name[] = "CORE";
 
diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index 08daf93ae1..f60a14920d 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -204,7 +204,7 @@ static const NoteFuncDesc note_linux[] = {
 static int s390x_write_elf64_notes(const char *note_name,
                                        WriteCoreDumpFunction f,
                                        S390CPU *cpu, int id,
-                                       void *opaque,
+                                       DumpState *s,
                                        const NoteFuncDesc *funcs)
 {
     Note note;
@@ -222,7 +222,7 @@ static int s390x_write_elf64_notes(const char *note_name,
         (*nf->note_contents_func)(&note, cpu, id);
 
         note_size = sizeof(note) - sizeof(note.contents) + nf->contents_size;
-        ret = f(&note, note_size, opaque);
+        ret = f(&note, note_size, s);
 
         if (ret < 0) {
             return -1;
@@ -235,16 +235,16 @@ static int s390x_write_elf64_notes(const char *note_name,
 
 
 int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                              int cpuid, void *opaque)
+                              int cpuid, DumpState *s)
 {
     S390CPU *cpu = S390_CPU(cs);
     int r;
 
-    r = s390x_write_elf64_notes("CORE", f, cpu, cpuid, opaque, note_core);
+    r = s390x_write_elf64_notes("CORE", f, cpu, cpuid, s, note_core);
     if (r) {
         return r;
     }
-    return s390x_write_elf64_notes("LINUX", f, cpu, cpuid, opaque, note_linux);
+    return s390x_write_elf64_notes("LINUX", f, cpu, cpuid, s, note_linux);
 }
 
 int cpu_get_dump_info(ArchDumpInfo *info,
-- 
2.37.3



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9WJ-0003k5-3O
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9WH-0003bt-3O
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:34:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9WA-0004H3-Vx
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xY/JLYmYivkDx/PTFg1nLvvMJr1mCcIozxofn9Axypg=;
 b=Wp+PFRzfYOCVewzZqh6wVJID2i4/c3lyTbH3+jp3nHaC+z7v3FjHPDTqk72XD2vbaWmoyl
 AScOt2wbEvHtVHOdzPlR3oNG+vZ3Ev/cmD1dY8B8QkK5ht61IkI2U4BipukzwTgOjDB7Vk
 jemct7dBze1hFBIQQgMm26Xjc67b3FY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-cHcYVXAuP--92nrDZaG9dw-1; Tue, 14 Sep 2021 10:34:36 -0400
X-MC-Unique: cHcYVXAuP--92nrDZaG9dw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA12B802929;
 Tue, 14 Sep 2021 14:34:32 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E52E85D9CA;
 Tue, 14 Sep 2021 14:34:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Xu <peterx@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Halil Pasic <pasic@linux.ibm.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 46/53] target/ppc: convert to use format_tlb callback
Date: Tue, 14 Sep 2021 15:20:35 +0100
Message-Id: <20210914142042.1655100-47-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 14 Sep 2021 14:34:46 -0000

Change the "info tlb" implementation to use the format_tlb callback.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/ppc/cpu.h        |   3 +-
 target/ppc/cpu_init.c   |   3 +
 target/ppc/mmu-hash64.c |   8 +-
 target/ppc/mmu-hash64.h |   2 +-
 target/ppc/mmu_common.c | 167 ++++++++++++++++++++++------------------
 target/ppc/monitor.c    |  10 ++-
 6 files changed, 107 insertions(+), 86 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c84ae29b98..37b44bfbc3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1257,6 +1257,7 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
 void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_format_state(CPUState *cpu, GString *buf, int flags);
+void ppc_cpu_format_tlb(CPUState *cpu, GString *buf);
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int reg);
@@ -2667,8 +2668,6 @@ static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu)
     return false;
 }
 
-void dump_mmu(CPUPPCState *env);
-
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
 void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
 uint32_t ppc_get_vscr(CPUPPCState *env);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 3456be465c..98d6f40a49 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9044,6 +9044,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = ppc_cpu_class_by_name;
     cc->has_work = ppc_cpu_has_work;
     cc->format_state = ppc_cpu_format_state;
+#ifndef CONFIG_USER_ONLY
+    cc->format_tlb = ppc_cpu_format_tlb;
+#endif
     cc->set_pc = ppc_cpu_set_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 19832c4b46..73927a0819 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -80,7 +80,7 @@ static ppc_slb_t *slb_lookup(PowerPCCPU *cpu, target_ulong eaddr)
     return NULL;
 }
 
-void dump_slb(PowerPCCPU *cpu)
+void dump_slb(PowerPCCPU *cpu, GString *buf)
 {
     CPUPPCState *env = &cpu->env;
     int i;
@@ -88,15 +88,15 @@ void dump_slb(PowerPCCPU *cpu)
 
     cpu_synchronize_state(CPU(cpu));
 
-    qemu_printf("SLB\tESID\t\t\tVSID\n");
+    g_string_append_printf(buf, "SLB\tESID\t\t\tVSID\n");
     for (i = 0; i < cpu->hash64_opts->slb_size; i++) {
         slbe = env->slb[i].esid;
         slbv = env->slb[i].vsid;
         if (slbe == 0 && slbv == 0) {
             continue;
         }
-        qemu_printf("%d\t0x%016" PRIx64 "\t0x%016" PRIx64 "\n",
-                    i, slbe, slbv);
+        g_string_append_printf(buf, "%d\t0x%016" PRIx64 "\t0x%016" PRIx64 "\n",
+                               i, slbe, slbv);
     }
 }
 
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index c5b2f97ff7..99e03a5849 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -4,7 +4,7 @@
 #ifndef CONFIG_USER_ONLY
 
 #ifdef TARGET_PPC64
-void dump_slb(PowerPCCPU *cpu);
+void dump_slb(PowerPCCPU *cpu, GString *buf);
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid);
 bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 754509e556..d7b716f30a 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -937,19 +937,19 @@ static const char *book3e_tsize_to_str[32] = {
     "1T", "2T"
 };
 
-static void mmubooke_dump_mmu(CPUPPCState *env)
+static void mmubooke_dump_mmu(CPUPPCState *env, GString *buf)
 {
     ppcemb_tlb_t *entry;
     int i;
 
     if (kvm_enabled() && !env->kvm_sw_tlb) {
-        qemu_printf("Cannot access KVM TLB\n");
+        g_string_append_printf(buf, "Cannot access KVM TLB\n");
         return;
     }
 
-    qemu_printf("\nTLB:\n");
-    qemu_printf("Effective          Physical           Size PID   Prot     "
-                "Attr\n");
+    g_string_append_printf(buf, "\nTLB:\n");
+    g_string_append_printf(buf, "Effective          Physical           "
+                           "Size PID   Prot     Attr\n");
 
     entry = &env->tlb.tlbe[0];
     for (i = 0; i < env->nb_tlb; i++, entry++) {
@@ -973,22 +973,24 @@ static void mmubooke_dump_mmu(CPUPPCState *env)
         } else {
             snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size / KiB);
         }
-        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %s %-5u %08x %08x\n",
-                    (uint64_t)ea, (uint64_t)pa, size_buf, (uint32_t)entry->PID,
-                    entry->prot, entry->attr);
+        g_string_append_printf(buf, "0x%016" PRIx64 " 0x%016" PRIx64
+                               " %s %-5u %08x %08x\n",
+                               (uint64_t)ea, (uint64_t)pa, size_buf,
+                               (uint32_t)entry->PID,
+                               entry->prot, entry->attr);
     }
 
 }
 
 static void mmubooke206_dump_one_tlb(CPUPPCState *env, int tlbn, int offset,
-                                     int tlbsize)
+                                     int tlbsize, GString *buf)
 {
     ppcmas_tlb_t *entry;
     int i;
 
-    qemu_printf("\nTLB%d:\n", tlbn);
-    qemu_printf("Effective          Physical           Size TID   TS SRWX"
-                " URWX WIMGE U0123\n");
+    g_string_append_printf(buf, "\nTLB%d:\n", tlbn);
+    g_string_append_printf(buf, "Effective          Physical           "
+                           "Size TID   TS SRWX URWX WIMGE U0123\n");
 
     entry = &env->tlb.tlbm[offset];
     for (i = 0; i < tlbsize; i++, entry++) {
@@ -1004,37 +1006,38 @@ static void mmubooke206_dump_one_tlb(CPUPPCState *env, int tlbn, int offset,
         ea = entry->mas2 & ~(size - 1);
         pa = entry->mas7_3 & ~(size - 1);
 
-        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %4s %-5u %1u  S%c%c%c"
-                    "U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
-                    (uint64_t)ea, (uint64_t)pa,
-                    book3e_tsize_to_str[tsize],
-                    (entry->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT,
-                    (entry->mas1 & MAS1_TS) >> MAS1_TS_SHIFT,
-                    entry->mas7_3 & MAS3_SR ? 'R' : '-',
-                    entry->mas7_3 & MAS3_SW ? 'W' : '-',
-                    entry->mas7_3 & MAS3_SX ? 'X' : '-',
-                    entry->mas7_3 & MAS3_UR ? 'R' : '-',
-                    entry->mas7_3 & MAS3_UW ? 'W' : '-',
-                    entry->mas7_3 & MAS3_UX ? 'X' : '-',
-                    entry->mas2 & MAS2_W ? 'W' : '-',
-                    entry->mas2 & MAS2_I ? 'I' : '-',
-                    entry->mas2 & MAS2_M ? 'M' : '-',
-                    entry->mas2 & MAS2_G ? 'G' : '-',
-                    entry->mas2 & MAS2_E ? 'E' : '-',
-                    entry->mas7_3 & MAS3_U0 ? '0' : '-',
-                    entry->mas7_3 & MAS3_U1 ? '1' : '-',
-                    entry->mas7_3 & MAS3_U2 ? '2' : '-',
-                    entry->mas7_3 & MAS3_U3 ? '3' : '-');
+        g_string_append_printf(buf, "0x%016" PRIx64 " 0x%016" PRIx64
+                               " %4s %-5u %1u  S%c%c%c"
+                               "U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
+                               (uint64_t)ea, (uint64_t)pa,
+                               book3e_tsize_to_str[tsize],
+                               (entry->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT,
+                               (entry->mas1 & MAS1_TS) >> MAS1_TS_SHIFT,
+                               entry->mas7_3 & MAS3_SR ? 'R' : '-',
+                               entry->mas7_3 & MAS3_SW ? 'W' : '-',
+                               entry->mas7_3 & MAS3_SX ? 'X' : '-',
+                               entry->mas7_3 & MAS3_UR ? 'R' : '-',
+                               entry->mas7_3 & MAS3_UW ? 'W' : '-',
+                               entry->mas7_3 & MAS3_UX ? 'X' : '-',
+                               entry->mas2 & MAS2_W ? 'W' : '-',
+                               entry->mas2 & MAS2_I ? 'I' : '-',
+                               entry->mas2 & MAS2_M ? 'M' : '-',
+                               entry->mas2 & MAS2_G ? 'G' : '-',
+                               entry->mas2 & MAS2_E ? 'E' : '-',
+                               entry->mas7_3 & MAS3_U0 ? '0' : '-',
+                               entry->mas7_3 & MAS3_U1 ? '1' : '-',
+                               entry->mas7_3 & MAS3_U2 ? '2' : '-',
+                               entry->mas7_3 & MAS3_U3 ? '3' : '-');
     }
 }
 
-static void mmubooke206_dump_mmu(CPUPPCState *env)
+static void mmubooke206_dump_mmu(CPUPPCState *env, GString *buf)
 {
     int offset = 0;
     int i;
 
     if (kvm_enabled() && !env->kvm_sw_tlb) {
-        qemu_printf("Cannot access KVM TLB\n");
+        g_string_append_printf(buf, "Cannot access KVM TLB\n");
         return;
     }
 
@@ -1045,12 +1048,12 @@ static void mmubooke206_dump_mmu(CPUPPCState *env)
             continue;
         }
 
-        mmubooke206_dump_one_tlb(env, i, offset, size);
+        mmubooke206_dump_one_tlb(env, i, offset, size, buf);
         offset += size;
     }
 }
 
-static void mmu6xx_dump_BATs(CPUPPCState *env, int type)
+static void mmu6xx_dump_BATs(CPUPPCState *env, int type, GString *buf)
 {
     target_ulong *BATlt, *BATut, *BATu, *BATl;
     target_ulong BEPIl, BEPIu, bl;
@@ -1073,51 +1076,59 @@ static void mmu6xx_dump_BATs(CPUPPCState *env, int type)
         BEPIu = *BATu & 0xF0000000;
         BEPIl = *BATu & 0x0FFE0000;
         bl = (*BATu & 0x00001FFC) << 15;
-        qemu_printf("%s BAT%d BATu " TARGET_FMT_lx
-                    " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
-                    TARGET_FMT_lx " " TARGET_FMT_lx "\n",
-                    type == ACCESS_CODE ? "code" : "data", i,
-                    *BATu, *BATl, BEPIu, BEPIl, bl);
+        g_string_append_printf(buf, "%s BAT%d BATu " TARGET_FMT_lx
+                               " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
+                               TARGET_FMT_lx " " TARGET_FMT_lx "\n",
+                               type == ACCESS_CODE ? "code" : "data", i,
+                               *BATu, *BATl, BEPIu, BEPIl, bl);
     }
 }
 
-static void mmu6xx_dump_mmu(CPUPPCState *env)
+static void mmu6xx_dump_mmu(CPUPPCState *env, GString *buf)
 {
     PowerPCCPU *cpu = env_archcpu(env);
     ppc6xx_tlb_t *tlb;
     target_ulong sr;
     int type, way, entry, i;
 
-    qemu_printf("HTAB base = 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_base(cpu));
-    qemu_printf("HTAB mask = 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_mask(cpu));
+    g_string_append_printf(buf, "HTAB base = 0x%"HWADDR_PRIx"\n",
+                           ppc_hash32_hpt_base(cpu));
+    g_string_append_printf(buf, "HTAB mask = 0x%"HWADDR_PRIx"\n",
+                           ppc_hash32_hpt_mask(cpu));
 
-    qemu_printf("\nSegment registers:\n");
+    g_string_append_printf(buf, "\nSegment registers:\n");
     for (i = 0; i < 32; i++) {
         sr = env->sr[i];
         if (sr & 0x80000000) {
-            qemu_printf("%02d T=%d Ks=%d Kp=%d BUID=0x%03x "
-                        "CNTLR_SPEC=0x%05x\n", i,
-                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
-                        sr & 0x20000000 ? 1 : 0, (uint32_t)((sr >> 20) & 0x1FF),
-                        (uint32_t)(sr & 0xFFFFF));
+            g_string_append_printf(buf, "%02d T=%d Ks=%d Kp=%d BUID=0x%03x "
+                                   "CNTLR_SPEC=0x%05x\n", i,
+                                   sr & 0x80000000 ? 1 : 0,
+                                   sr & 0x40000000 ? 1 : 0,
+                                   sr & 0x20000000 ? 1 : 0,
+                                   (uint32_t)((sr >> 20) & 0x1FF),
+                                   (uint32_t)(sr & 0xFFFFF));
         } else {
-            qemu_printf("%02d T=%d Ks=%d Kp=%d N=%d VSID=0x%06x\n", i,
-                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
-                        sr & 0x20000000 ? 1 : 0, sr & 0x10000000 ? 1 : 0,
-                        (uint32_t)(sr & 0x00FFFFFF));
+            g_string_append_printf(buf, "%02d T=%d Ks=%d Kp=%d N=%d "
+                                   "VSID=0x%06x\n", i,
+                                   sr & 0x80000000 ? 1 : 0,
+                                   sr & 0x40000000 ? 1 : 0,
+                                   sr & 0x20000000 ? 1 : 0,
+                                   sr & 0x10000000 ? 1 : 0,
+                                   (uint32_t)(sr & 0x00FFFFFF));
         }
     }
 
-    qemu_printf("\nBATs:\n");
-    mmu6xx_dump_BATs(env, ACCESS_INT);
-    mmu6xx_dump_BATs(env, ACCESS_CODE);
+    g_string_append_printf(buf, "\nBATs:\n");
+    mmu6xx_dump_BATs(env, ACCESS_INT, buf);
+    mmu6xx_dump_BATs(env, ACCESS_CODE, buf);
 
     if (env->id_tlbs != 1) {
-        qemu_printf("ERROR: 6xx MMU should have separated TLB"
-                    " for code and data\n");
+        g_string_append_printf(buf, "ERROR: 6xx MMU should have separated TLB"
+                               " for code and data\n");
     }
 
-    qemu_printf("\nTLBs                       [EPN    EPN + SIZE]\n");
+    g_string_append_printf(buf,
+                           "\nTLBs                       [EPN    EPN + SIZE]\n");
 
     for (type = 0; type < 2; type++) {
         for (way = 0; way < env->nb_ways; way++) {
@@ -1126,48 +1137,52 @@ static void mmu6xx_dump_mmu(CPUPPCState *env)
                  entry++) {
 
                 tlb = &env->tlb.tlb6[entry];
-                qemu_printf("%s TLB %02d/%02d way:%d %s ["
-                            TARGET_FMT_lx " " TARGET_FMT_lx "]\n",
-                            type ? "code" : "data", entry % env->nb_tlb,
-                            env->nb_tlb, way,
-                            pte_is_valid(tlb->pte0) ? "valid" : "inval",
-                            tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE);
+                g_string_append_printf(buf, "%s TLB %02d/%02d way:%d %s ["
+                                       TARGET_FMT_lx " " TARGET_FMT_lx "]\n",
+                                       type ? "code" : "data",
+                                       entry % env->nb_tlb,
+                                       env->nb_tlb, way,
+                                       pte_is_valid(tlb->pte0) ?
+                                       "valid" : "inval",
+                                       tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE);
             }
         }
     }
 }
 
-void dump_mmu(CPUPPCState *env)
+void ppc_cpu_format_tlb(CPUState *cpu, GString *buf)
 {
+    CPUPPCState *env = cpu->env_ptr;
+
     switch (env->mmu_model) {
     case POWERPC_MMU_BOOKE:
-        mmubooke_dump_mmu(env);
+        mmubooke_dump_mmu(env, buf);
         break;
     case POWERPC_MMU_BOOKE206:
-        mmubooke206_dump_mmu(env);
+        mmubooke206_dump_mmu(env, buf);
         break;
     case POWERPC_MMU_SOFT_6xx:
     case POWERPC_MMU_SOFT_74xx:
-        mmu6xx_dump_mmu(env);
+        mmu6xx_dump_mmu(env, buf);
         break;
 #if defined(TARGET_PPC64)
     case POWERPC_MMU_64B:
     case POWERPC_MMU_2_03:
     case POWERPC_MMU_2_06:
     case POWERPC_MMU_2_07:
-        dump_slb(env_archcpu(env));
+        dump_slb(env_archcpu(env), buf);
         break;
     case POWERPC_MMU_3_00:
         if (ppc64_v3_radix(env_archcpu(env))) {
-            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU is unsupported\n",
-                          __func__);
+            g_string_append_printf(buf, "PPC64 MMU not supported\n");
         } else {
-            dump_slb(env_archcpu(env));
+            dump_slb(env_archcpu(env), buf);
         }
         break;
 #endif
     default:
-        qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
+        g_string_append_printf(buf, "MMU model %d not supported\n",
+                               env->mmu_model);
     }
 }
 
diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
index a475108b2d..401a36c2eb 100644
--- a/target/ppc/monitor.c
+++ b/target/ppc/monitor.c
@@ -67,13 +67,17 @@ static target_long monitor_get_tbl(Monitor *mon, const struct MonitorDef *md,
 
 void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    CPUArchState *env1 = mon_get_cpu_env(mon);
+    g_autoptr(GString) buf = g_string_new("");
+    CPUState *cpu = mon_get_cpu(mon);
 
-    if (!env1) {
+    if (!cpu) {
         monitor_printf(mon, "No CPU available\n");
         return;
     }
-    dump_mmu(env1);
+
+    cpu_format_tlb(cpu, buf);
+
+    monitor_printf(mon, "%s", buf->str);
 }
 
 const MonitorDef monitor_defs[] = {
-- 
2.31.1



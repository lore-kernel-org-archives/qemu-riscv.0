Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55659606A329
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 07:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=theorem-dev.20260707.gappssmtp.com header.i=@theorem-dev.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WSketthn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xO8yD-000331-VN; Tue, 03 Nov 2026 02:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xO8yC-00032V-C2
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 02:30:12 -0500
Received: from mail-dl2-x03.google.com ([2607:f8b0:4864:38::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xO8yA-00068i-Dh
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 02:30:12 -0500
Received: by mail-dl2-x03.google.com with SMTP id
 a92af1059eb24-1b22fcac215so43283c88.0
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 23:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theorem-dev.20260707.gappssmtp.com; s=20260707; t=1793691009; x=1794295809;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uMDgBHFCfShr3L6FJGE9YvoXrYO8PUeN2gLlvwmxBXw=;
 b=WSketthnBtHAdY6DOg43+bAdjqwp+8agAIlah6EseUfmcB6ejyaWaAh1kSFWxc8JUV
 S8RItEmIx8vdHY45b/R6HM9RPDjR4bE+73yJOeNf0RWM+Iz30B5b5bvXXVC5jGCwRGN9
 NA4V4/EeBt3LddTB7I3lI38fmfO2N5SHHbY0d+r2gC1FKau1Jm6rea72ekeWZMmYyngM
 XXnQCMbfFvmbCz3o6r5XxwLneQfN5jwvmYv5s0GUr/jMHxgKttgII44lKcBPzCetmRJn
 n4QUjngPsLaBVZtyEyPqvNxfCsTxGXqXrtJUvpVkjWStAHkGtt0wMNYWvhqGm/D2BU3G
 S1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793691009; x=1794295809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uMDgBHFCfShr3L6FJGE9YvoXrYO8PUeN2gLlvwmxBXw=;
 b=ZPNANKzJ1B+VnKbIBntxqHqUjQKVJHfiGbNV/7H9mYwFDbkKh1YRJmlHkEYsnOFbFS
 QylkVupedzoULN9cknNPbJOhAxedyqHgPhc73rOA+jd6OvhMo7KS6NokItx35dvivaKZ
 JrYC7RK9+QffS23GWSk1M4zatDNpCED8GjrNwMncldU4H2zK8v0yxmu2DeDRrbW/oHJh
 K+1L9c80Yc+bbzC1xCvrxjPSNQQtBmCWrW5CUZ/YYd4hgAItD3wBprDccUsKLmuftAKt
 Oys8TLJitd7fRBPlBErxMSjx9VI3Jg/Oziv5ZIgXXMUhp7PFRefAw95ULygU/UuBddRg
 r/dQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzWFovNW33CvCITGuz+n/Ovn+GLt5zlzate+P9S6AMr5lcKkEqaaNY/zCzcgSlU11uoc1vRPQQomz4s@nongnu.org
X-Gm-Message-State: APuU4Z813ebWd5hEXQgRbJHPpsIlP+KlqmZEYZeWbpvSII6Tu5aryB7U
 fty5nbcd7iFZ516B8FVMgEFk9uX8H+E5bHEo/+Czp7ne31umtfWLVmblDbx7TlY9J36vi/f7VQv
 zv+1Onz0rb3Sk
X-Gm-Gg: AYBFou3o+PWj/aYegTnrpODp/zS949zreOsPVnCz0EPEfK4MyIW07IHc+BXM1jLgxKt
 7iIXIxKBy/CTa/blM0QNDtmT9J4q4Ze1MKKYMPmUCRPwKqrMN4Snx17333ibnEXEZoDGPfI8cig
 m5//Sx98W7aI3+HSdo+fwSE+hGtnA+tJMQYPl2GRL8iJWHXxYWqQJxPmPQWKY9xGuOv/GJXF9Er
 I3QUMIoVC+ibQmBmbGmKosdH7thFrQTaRDakr53gNqMdBGhKXQ3NkSMWa8uFrmFFtIW7KwXpFCa
 BLj/wB3hu0aRhq42XRkJN+uXPeu/Xa1lup/0H0upjWqLc+oaNVzvQ6zni2GsTwa3j9s4LnQF6cA
 3BCen6f3NP3/6eZnw8y3ALj9dj72iiKXQoh8ArXk+DX49fAYDWZ+eOZnQGVffHcpjYf7TOxTumz
 jifRs1mILnaQUk5soabbcGmho/+1wHO6DbisoWvbMCGLsCRJRU8H14W2zJPdPYF4LDy6PVb9+QT
 NDINZ/ZJ4QULhhY8tgaygQm1Q2tSIIaV3uEqLrq1N3YsxlYrMWxhDwBEDiKKT/slb3etuHKsknz
 v5MnKBL22b4NXHa+tvP4ZrFReUTMpz2zQKH5Pkh1BO956za4ajKfjE+MK4+6aMy/PRj4EVk=
X-Received: by 2002:a05:7023:903:b0:17f:7280:1332 with SMTP id
 a92af1059eb24-1ac5c92f6e4mr20648389c88.40.1793691008732; 
 Mon, 02 Nov 2026 23:30:08 -0800 (PST)
Received: from tewaros-MacBook-Pro.local
 ([2601:647:6300:1230:9da3:3d82:7292:c937])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b106edc7f8sm23226592c88.9.2026.11.02.23.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 23:30:07 -0800 (PST)
From: tewaro <tewaro@theorem.dev>
To: qemu-devel@nongnu.org
Cc: disclosures@theorem.dev, tewaro <tewaro@tewaro.org>, imaginos32@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 1/2] target/riscv: report the write pseudoinstruction for a
 failed VS-stage A/D update
Date: Mon,  2 Nov 2026 23:29:52 -0800
Message-ID: <d14b2d1dcfa4eddff7d3bde86cb560130fd07877.1793677944.git.tewaro@theorem.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1793677944.git.tewaro@theorem.dev>
References: <20260705140508.17692-1-imaginos32@gmail.com>
 <cover.1793677944.git.tewaro@theorem.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::3;
 envelope-from=tewaro@theorem.dev; helo=mail-dl2-x03.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a G-stage fault is taken during a VS-stage page-table walk,
riscv_cpu_do_interrupt() writes a pseudoinstruction to mtinst/htinst.
This instruction says if the walk's access was a read (0x3000) or a
write (0x3020) of the PTE [1]. Commit 366b4fba0fae made the A/D update
check G-stage write permission, and sets the write bit when the trap
cause is a store guest-page fault.

The trap cause is the wrong signal. The cause follows the original
access [2], but the pseudoinstruction describes the implicit access
that failed. The two disagree in two cases:

  original access   failed access   Spike reports   QEMU reports
  load or fetch     A/D write       0x3020          0x3000
  store             PTE read        0x3000          0x3020

They agree only for a store that fails on the A/D write, which is the
case 366b4fba0fae was tested with.

Record in the CPU state that the G-stage fault came from the A/D
write, and use that for both the data and the instruction tinst
sites. Clear it on entry to riscv_cpu_tlb_fill() and after the trap.

[1] Privileged ISA v1.12, 8.6.3, Table 8.12
[2] Privileged ISA v1.12, 8.5.1 "Guest Physical Address Translation"
https://github.com/riscv/riscv-isa-manual/releases/tag/Priv-v1.12

Fixes: 366b4fba0fae ("target/riscv: check G-stage write permission for VS-stage A/D updates")
Signed-off-by: tewaro <tewaro@theorem.dev>
---
 target/riscv/cpu.h            | 1 +
 target/riscv/tcg/cpu_helper.c | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 49a1186bdb..d56566d8c8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -445,6 +445,7 @@ struct CPUArchState {
      * address translation for the VS-stage page table walk.
      */
     bool two_stage_indirect_lookup;
+    bool two_stage_indirect_write;
 
     uint32_t scounteren;
     uint32_t mcounteren;
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 58e98e975c..063525cfc5 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -1544,6 +1544,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
                 if (fault_pte_addr) {
                     *fault_pte_addr = pte_gpa >> 2;
                 }
+                env->two_stage_indirect_write = true;
                 return TRANSLATE_G_STAGE_FAIL;
             }
         }
@@ -1785,6 +1786,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     hwaddr tlb_size = TARGET_PAGE_SIZE;
 
     env->guest_phys_fault_addr = 0;
+    env->two_stage_indirect_write = false;
 
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
@@ -2233,7 +2235,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                  */
                 tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
 
-                if (cause == RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT) {
+                if (env->two_stage_indirect_write) {
                     tinst |= 0x20;
                 }
             } else {
@@ -2256,6 +2258,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                  * doing VS-stage page table walk.
                  */
                 tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
+                if (env->two_stage_indirect_write) {
+                    tinst |= 0x20;
+                }
             }
             break;
         case RISCV_EXCP_ILLEGAL_INST:
@@ -2506,6 +2511,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     env->two_stage_lookup = false;
     env->two_stage_indirect_lookup = false;
+    env->two_stage_indirect_write = false;
 }
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.54.0 (Apple Git-157)



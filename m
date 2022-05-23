Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntHq7-0004yP-NT
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 19:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHq6-0004wU-V4
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 19:51:54 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHps-0000QL-MI
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 19:51:54 -0400
Received: by mail-pf1-x434.google.com with SMTP id i24so15010540pfa.7
 for <qemu-riscv@nongnu.org>; Mon, 23 May 2022 16:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rl/bIy4sIdeQ+LppbeDLoegjUd00vZYCBef7PVEx7x8=;
 b=sMMBV9W/fa0y64jfk+4WtDUmnTcJzT/EgZcubni9z4GWmWQYH+lA3OuLkM/2JZbFIm
 f/XV11wGVlk5JM+JCIWr4fzNZfYP57OYuU/WQPKSnY2Yj1NzLUf91v7QD7eoukzDtfF1
 3QbGQEHHRokIuILsIjIGrm6+mIns+OER21XvpMcl9662uEkP68WxM43J2L+cdL77BXL7
 Bjm0of4Dpr4b6mspH8iHJ45C+Dt1EUr+iUAJ3JXnxpQmB8RUs9GrRMDNKOcm+CAdeHa1
 I033D6n7x1GedNxqMiA13ELA5krU8NCAZzZgRQrkUY1JEbd6TuymYZrC7aN2MxXG/srt
 F+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rl/bIy4sIdeQ+LppbeDLoegjUd00vZYCBef7PVEx7x8=;
 b=JZ4ZpPL+gLQ5jS9z4n3gi4p0KkO0JinbTKZlY2cjbANFB7+vSIQGj2J8dwPNVYhuK4
 xuwFwxftzHYNmz1gC5F7tvg6PUO2mh1zS9akgG3XJXJZG2RP8IG2vz6K+5aazc4is4Mf
 RyU9WpKW2TdQWYydTqP65KxDRMuXSMfBsxyhiJZEIpILjuZoKxvwaDvkmJDL6I9Dk0sq
 D/5p2SQNydltDnXwUuinwVCqWt3979Mr3nHAFAcGhuNxPnS9AuNcGUC+97/Wsrct2Q9h
 HtDNeYWBWZ21lKAnMRL53OoD0Xve/kNsYo05rlclOBUkx5ECGcNguwVZgljk71zn3bTX
 qwLA==
X-Gm-Message-State: AOAM5309Lxr1gDuv93HF193sBmPGnfblBYfloZb/skNZQys6jPHclLG8
 q4KJTmyWlwqseO3sDdfHLlfoum9dbcZBPg==
X-Google-Smtp-Source: ABdhPJye6cnpZrbyV6ZTK5yoXxhp37OeSpLvnn+M4BhP7JS+U61bhMRsDiz0iLb9bRCF7pNcmnaNgw==
X-Received: by 2002:a63:1d12:0:b0:3f6:3a64:7594 with SMTP id
 d18-20020a631d12000000b003f63a647594mr21014301pgd.294.1653349899436; 
 Mon, 23 May 2022 16:51:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 pl15-20020a17090b268f00b001df4b919937sm257084pjb.16.2022.05.23.16.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 16:51:38 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v9 10/12] target/riscv: Add few cache related PMU events
Date: Mon, 23 May 2022 16:50:55 -0700
Message-Id: <20220523235057.123882-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523235057.123882-1-atishp@rivosinc.com>
References: <20220523235057.123882-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 23 May 2022 23:51:55 -0000

From: Atish Patra <atish.patra@wdc.com>

Qemu can monitor the following cache related PMU events through
tlb_fill functions.

1. DTLB load/store miss
3. ITLB prefetch miss

Increment the PMU counter in tlb_fill function.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1aa4f2097c1..004cef0febad 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,10 +21,12 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#include "cpu_bits.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -1178,6 +1180,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     cpu_loop_exit_restore(cs, retaddr);
 }
 
+
+static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
+{
+    enum riscv_pmu_event_idx pmu_event_type;
+
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
+        break;
+    case MMU_DATA_LOAD:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
+        break;
+    case MMU_DATA_STORE:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS;
+        break;
+    default:
+        return;
+    }
+
+    riscv_pmu_incr_ctr(cpu, pmu_event_type);
+}
+
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr)
@@ -1274,6 +1298,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.25.1



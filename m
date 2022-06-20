Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3Qdf-0001Yq-NS
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 19:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3QdC-00017n-CE
 for qemu-riscv@nongnu.org; Mon, 20 Jun 2022 19:16:31 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3Qd7-0006V4-Ik
 for qemu-riscv@nongnu.org; Mon, 20 Jun 2022 19:16:30 -0400
Received: by mail-pf1-x429.google.com with SMTP id s37so11471127pfg.11
 for <qemu-riscv@nongnu.org>; Mon, 20 Jun 2022 16:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZuVSkTV60zvZsucT7Fx/e5abIWdp+ZaBnxnCxugKw/c=;
 b=YBSwWX5VKLrjNVIxJ88iHakbF8doXkqO5au4tBTJmPMvsRFXOnc7y+rWroee4Oj6p8
 D1b5P8tErhA0PIIBgKnDmE/Wt2hBMiw6F1HkzsDP+TMRTT4iyr11Cts9HMNgzjO97hk7
 l3lAl5GfEiC49aAvKrGMwUIIo0BYsLTkfZeVcIFSVmL5hTTCGu5Iyl9o7dhQhSkHaWVU
 MRkcOktH0+s92nQO43Uwp1KaWLgETlbVDHEyOin2cp17C+RPWOsgGXS1wA7b7TtYadWz
 hIam/D50BG7e+YVlA/RNskBISkRMQyEb5/5m9LqGZ6DLfIrBdiRILptYWI5w6Euk5hlu
 6xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZuVSkTV60zvZsucT7Fx/e5abIWdp+ZaBnxnCxugKw/c=;
 b=749SiIjN55Ih85M8x7Dfe4KOkLzatip8VuHAL6kAGJygo5Ecjt8g82OxmCigUiLR5i
 1Q0I/6ZpvH0PI3GEM1+YKpJmMOr0MXZ6is4iR/teTSafdd0NSuwXUkABPXl4eWO/m13U
 b7NbHRZNg6um1cJFXkiX1nnw72CeefPDT9SDmDmuZ6b6qqpdt0ZcT1390V1bp37Jc+HF
 k0t2pxDppDWbJ6MW4g0ydCNdkjQ+W4iiaY1GHkqAHHfJf5nFngFAiW7RLBlaL0/gG/oh
 ptiDsf5UFqhvSmhthJ80ivRUyAn+33+tfce2Bf2WNhTyt2SHFtIbb3UtQ7w6KX2/IXDW
 /vOg==
X-Gm-Message-State: AJIora8DJ5UeTfJMG9DES9yrjX26jVCff0KUP5oeKglhSCTV/r99wqF+
 LSZpeW98odVDbyGtbyqx0pksF+EN30HxXw==
X-Google-Smtp-Source: AGRyM1sk60zq3TDSYH0ubEK+dIB9/+NNbWsAQFqPLi6r28QokqU0r3cWsYv+8RjzhG1TxXkTKDEfTQ==
X-Received: by 2002:a63:84c8:0:b0:40c:7d4a:ac66 with SMTP id
 k191-20020a6384c8000000b0040c7d4aac66mr12347937pgd.424.1655766984430; 
 Mon, 20 Jun 2022 16:16:24 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902a40200b0015e8d4eb285sm9191008plq.207.2022.06.20.16.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 16:16:23 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com
Subject: [PATCH v10 10/12] target/riscv: Add few cache related PMU events
Date: Mon, 20 Jun 2022 16:16:00 -0700
Message-Id: <20220620231603.2547260-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620231603.2547260-1-atishp@rivosinc.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 20 Jun 2022 23:16:31 -0000

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
index 4a6700c89086..99e944a8c115 100644
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
@@ -1180,6 +1182,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
@@ -1276,6 +1300,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.25.1



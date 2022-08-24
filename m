Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQyhL-00009R-0c
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 18:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQyh3-0008PO-H3
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 18:17:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQyh1-0006cJ-1b
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 18:17:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id g8so12999375plq.11
 for <qemu-riscv@nongnu.org>; Wed, 24 Aug 2022 15:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gCjE3VT6UzdtMXrMkp8tiepgyAPqA6FlwcHDo01mpfw=;
 b=lyjWDFasCSZdkYkXa/J89iIgh6qsaZaPAWyzn5Yu0TVdGDfzLfqD/MDzFwdhm16ruc
 I07/O7fJ8mrtgS0qHZk4kWcM6DDlHz5AW+sO6BMhO+v3GnyHwnr/cbCH0DZLbKYFKJO7
 lyd1YnM9aTZ10QAHwQ/H7lK+tSZulhLX62IKpu5PJNDWmhTzePNkOkvpMH2LcQuu4X3b
 JM7Jym+OKHY3mrvLpgNXEMnJk+tzq5q2WDsoBSzqq1uWp230vaSn0vFq84C1rhjevYJj
 LPaOb9TibCUpmckDbPu3QtvfwQeWIM94d3oTNtTrfPOQLtTZO5bF1EWurkFK/S/AHEh5
 ezhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gCjE3VT6UzdtMXrMkp8tiepgyAPqA6FlwcHDo01mpfw=;
 b=dLNBrmdg1az7U2gr72oRQ1zJs9yysuE35dsxd1jhqA/Dnf8uHfhzlsx2xtdZbCHH0r
 Ocm/zL+2tccBvJYVAS81yZSayoWO5fSyjWl07t3ok8uCIFNqBT0GMEcLdtUk/lazKK+T
 3uDrlrd2/idfszUUQ+2M4HhZh7B3pdHqyqx2F0OVo3ktUVMH31W6Vt0IRyeUItUNQvKt
 OPh69pNFZZ0FiTye1dCwC3QNBkJYPtS48DxuMl0PM0cvODxiv1IPDn/MEGcFgGyZ0Ukb
 Q4dcLok+eEknsVxhEPDWKXS3Q/LOUqU95glYizE4QByu60adNM8URXuVomRae5TXPxN8
 7npQ==
X-Gm-Message-State: ACgBeo0h9rlki82DUkv/xF+SJdQt90LVupfL+nrQ+45qS/IUS77qAXlf
 DW6qI0nkciImOOkDISupDFEzWw==
X-Google-Smtp-Source: AA6agR6vvx+G5XihognC1kNu1r5JqkH1GNp6dnLKLOK5aCQjlJZAqsTEFMKqgsJeDebblp3dZQ9K9w==
X-Received: by 2002:a17:90a:de96:b0:1fa:e427:e18e with SMTP id
 n22-20020a17090ade9600b001fae427e18emr10564910pjv.116.1661379465213; 
 Wed, 24 Aug 2022 15:17:45 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a170902f71200b0016909be39e5sm4243031plo.177.2022.08.24.15.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 15:17:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Heiko Stuebner <heiko@sntech.de>, Atish Patra <atishp@rivosinc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v14 3/5] target/riscv: Add few cache related PMU events
Date: Wed, 24 Aug 2022 15:16:59 -0700
Message-Id: <20220824221701.41932-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824221701.41932-1-atishp@rivosinc.com>
References: <20220824221701.41932-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Wed, 24 Aug 2022 22:18:02 -0000

From: Atish Patra <atish.patra@wdc.com>

Qemu can monitor the following cache related PMU events through
tlb_fill functions.

1. DTLB load/store miss
3. ITLB prefetch miss

Increment the PMU counter in tlb_fill function.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 719c5d5d0209..67e4c0efd216 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,11 +21,13 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "exec/exec-all.h"
 #include "instmap.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#include "cpu_bits.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -1189,6 +1191,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
@@ -1287,6 +1311,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.25.1



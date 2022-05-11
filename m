Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nouO0-00050a-5K
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 18:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNe-0004mL-Ak
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 18:00:28 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNb-0006mx-OT
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 18:00:25 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so6103685pjv.4
 for <qemu-riscv@nongnu.org>; Wed, 11 May 2022 15:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rl/bIy4sIdeQ+LppbeDLoegjUd00vZYCBef7PVEx7x8=;
 b=6XDcJOAhJN+rBrE/zRACmI8IndmffeqKQONoxxv6s3kxsXXU07eqNsYpDj2XyhRAT2
 hGZkS5blQgntJik7IfT9EPLqi2FX2K6Lz50xHbNaIgMcOtSIxCB/k6LBtDgYsjvcvVyM
 PeKRBepTgiBmSo2sG2r9QFoO5ojbbaR+g1g/gC6A+1yDOc6oByiuZ+ONSbU9AVKHTeBJ
 1pATZRKPkDWq6HGkxneOeSdxcQXBn8sMAhnw+GTuGReU4PgB6DknIBLcTY60HwGx/f68
 ivc8KNoXBWmWzOON+3CLmtEnve/cceFmFRhlyf6v6/TYGsBodwTgVHJ8z8s5LlY74Anl
 z+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rl/bIy4sIdeQ+LppbeDLoegjUd00vZYCBef7PVEx7x8=;
 b=1hvbXO2+/9z0WpBtPPvsqLOyL0iIBzxZOP9n/4gX6LkyH2Ui5+Zx1V4jPDRjp01yJt
 8PRODFWvYELtOdK6b6RRknumjH3iRRb+OhhjRFFWzWZUoKFjtG2QdVtt6PFkeAUIXZhS
 2I/WABbLyFUxi+GppH5si0srlZbFlxDIdxzlXjSmyyjqBn+AQMBpqBPgGfpGHnuqt4Qt
 IlF5y+nOR/0qGL7v6nllnyM+YAWthFJpxbLKKcoS/wMZ9+VNqueU29MrWtjM/1M2awNy
 WBzmeyiXyIDroarjMlkYA3kKjY2g9TbZFxZTq9E9dpmjkaSiQqAINUr43vETzcOW+Wcl
 jNmw==
X-Gm-Message-State: AOAM530Ufeidy8PFeNqNlO3Ry+D0iFIgZYiiD/txrgFSs+++UU6aimj5
 SjImfLBTwfqka1hgWC8Zi9WKgbRw1lslFQ==
X-Google-Smtp-Source: ABdhPJy2axMEpnhXpcegSt4PRtZLSdgXgs1lzAhGg4dNqS4cRKarIJHwIcsAK+psu1xIhqt4zJ7Ixg==
X-Received: by 2002:a17:902:9884:b0:15f:4eb:8e76 with SMTP id
 s4-20020a170902988400b0015f04eb8e76mr19397445plp.57.1652306422324; 
 Wed, 11 May 2022 15:00:22 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a62e417000000b0050dc762816asm2261303pfh.68.2022.05.11.15.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 15:00:21 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v8 10/12] target/riscv: Add few cache related PMU events
Date: Wed, 11 May 2022 14:59:54 -0700
Message-Id: <20220511215956.2351243-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511215956.2351243-1-atishp@rivosinc.com>
References: <20220511215956.2351243-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Wed, 11 May 2022 22:00:28 -0000

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



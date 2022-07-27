Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGarE-0002pM-Ru
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 02:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarD-0002mZ-LO
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 02:49:23 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarB-0003DE-O9
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 02:49:23 -0400
Received: by mail-pl1-x62b.google.com with SMTP id iw1so1300221plb.6
 for <qemu-riscv@nongnu.org>; Tue, 26 Jul 2022 23:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D/VjWM0J+rR8xAS7iOwrdTtOwWSXtXsbBRJhDPNIvng=;
 b=gOTuAx2tajc3qycqZeZANfS5QeYtFCI7+KSldqV1FNJ7r0oDD+02q6D/YWY9iijWb+
 Ol8FGm7yn8/UCwdGJSzTPmOu/WSeCURpTak008GQcsXagmFkV56JtfSViIMdWTUxFRtp
 4FhL9R7FJRjKzyAW8QM21tCx7zAYqZBHbMdoejMXao6DkNkqtDERulwquQSvkil3sV0L
 w1JaooLU2j3LdVFWdBIGBusxkL4vLs9ZmwzssNcevwdHUhbCDKyGEmTBTFcVs0fKHX9q
 8Ur3zFqjw2LLnt4l7CtQAMDOB7tT/WU0O0y3kDlEfKxATxpBB2pK2bOo273NmMn/iE7G
 6gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D/VjWM0J+rR8xAS7iOwrdTtOwWSXtXsbBRJhDPNIvng=;
 b=SNoIyeRo8VALXhjoGdOkBQ9i4vf1ZdhmEqMpcXnl0Iue88Ba9iqcD8wdpMJO1Cd33Z
 0cOpdNXnPZIgy8Bv0rfDkN8P7o2Jy609y+8HAFkH4AOI/PdyO/MQP9GsfgjzTdU9jgXI
 KRzkYCGWxyFt8LuZs/+1zKZHGHa3ztltcC9Ufc0HHHETwiObcZUDSExQQNkEvlPPEpUS
 /g8eQxwg40+569WLq9eL6wNPP/F0w4kZiwzgwrpLEGuZVNuxsh/BBYv95o+73mx2dqnr
 8WRpkvZJIvr2O+1SEjLE3qvS20M0mCVPMZ9QGqrGEENtBey5FKBAJskjpd6UQmxDLdD8
 qRKA==
X-Gm-Message-State: AJIora/MD9xVEo99Er45Dm6heqPDGzqsBm/z8RRiv1pN/x15lsME9bFv
 k85NH+1w9o6k3ItI/BcE22P1EQ==
X-Google-Smtp-Source: AGRyM1vlglq5nzuBnJPE3u71PsCQHUhaBno+XcIsMHeNgXyrZBP0LMuye8o5UhWmVZMiyf85onxAVA==
X-Received: by 2002:a17:902:c40c:b0:16d:b4c9:c360 with SMTP id
 k12-20020a170902c40c00b0016db4c9c360mr883722plk.26.1658904560428; 
 Tue, 26 Jul 2022 23:49:20 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a170902ab9000b0016d2d2c7df1sm12764851plr.188.2022.07.26.23.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 23:49:20 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Heiko Stuebner <heiko@sntech.de>, Atish Patra <atishp@rivosinc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v11 3/6] target/riscv: Add few cache related PMU events
Date: Tue, 26 Jul 2022 23:49:10 -0700
Message-Id: <20220727064913.1041427-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727064913.1041427-1-atishp@rivosinc.com>
References: <20220727064913.1041427-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Wed, 27 Jul 2022 06:49:24 -0000

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
index 59b3680b1b23..37afb4e0cc72 100644
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
@@ -1176,6 +1178,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
@@ -1272,6 +1296,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.25.1



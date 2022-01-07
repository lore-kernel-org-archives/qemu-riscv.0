Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5ely-0001mN-3g
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 21:14:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRt-0001gL-4s
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:49:42 -0500
Received: from [2607:f8b0:4864:20::22c] (port=40863
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRr-0003bT-GR
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:49:40 -0500
Received: by mail-oi1-x22c.google.com with SMTP id t204so6124534oie.7
 for <qemu-riscv@nongnu.org>; Thu, 06 Jan 2022 16:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QO4W2orHMUIEGgVLqHlQDSztkcs6iInWNOtkvj8q0FM=;
 b=4+LmrWL77uGbhC3BQvrDflx1p1SNhrhuDJOyHF/ta3YtraUtHDIQ+qqAMuwUcKe51l
 iS3fUrVjRzf8ViiuqlaTD/Wxopi868Kg2j5z0Pz9RAj2+JXpQGWcyjphpU/l9SfkBkN3
 GgxffZd3/JUpqiU8He6Dz8pt43Hmp1D+dFW7OVKTCm9AA0pCcT++OHtNrOcQOGSxYku5
 cN4h1olAVJSjDk20ocePDLjgh6qKiaKMGaKhZ2886/584ZDPkvYNXc0R+royEyCaJ6aA
 E89gWwDdyEYw6ovFAEkA//uGeqOB/ZZqkkMvraZ5tBPhNNryg5d0avPjCRT+NHr4AnW9
 eTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QO4W2orHMUIEGgVLqHlQDSztkcs6iInWNOtkvj8q0FM=;
 b=zZojOuZIVZDW6zfuqBeqacltdhoq33R+lpZJ7vRKLBkd48vPgeMdkYypQ87lJfSUuG
 gfslOw0DSQixXoUQfgmRWMb8kkAs0N/8/MBd2ZJcpUIdFEji+M2bVIONLw9Pt+UmSPhc
 L3ZgL0s5hoAbrtBfnD1+nUB6Ezi09iGU60V3ha1A+jl8SDvMki+Z1f8CCeKahB2qBO4K
 489bi1pMZI5rUolq/1LTSdbteHsVxgygy1mQhJ6sZ2//M/j169CZQQ7bJju6Ts+sHdet
 +1JZqK4FbOxC90FQZauyd5nbBeOJpN2CNxsU5/2lMOG+Uv+KS2pJexynvoHqJ1MkKK12
 kgVw==
X-Gm-Message-State: AOAM530rVzr5lAwxlKVd4Fns1ApGtl0uCi2wLErQ4Ry74VHQHzQeV/ou
 KGnbAukZVGYGZGWxfCY0fQFpUw==
X-Google-Smtp-Source: ABdhPJxIP9paxXMqxR5aZflz1lYEloykOFdfWC/kLnQEGA60Jm3upexpUPiIfwo42a6v8WdbP8/7PA==
X-Received: by 2002:a05:6808:221c:: with SMTP id
 bd28mr8059822oib.27.1641516578379; 
 Thu, 06 Jan 2022 16:49:38 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id e4sm678441oiy.12.2022.01.06.16.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:49:37 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 10/11] target/riscv: Add few cache related PMU events
Date: Thu,  6 Jan 2022 16:48:45 -0800
Message-Id: <20220107004846.378859-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107004846.378859-1-atishp@rivosinc.com>
References: <20220107004846.378859-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 21:14:12 -0500
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
X-List-Received-Date: Fri, 07 Jan 2022 00:49:42 -0000

From: Atish Patra <atish.patra@wdc.com>

Qemu can monitor the following cache related PMU events through
tlb_fill functions.

1. DTLB load/store miss
3. ITLB prefetch miss

Increment the PMU counter in tlb_fill function.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 10f3baba5339..bd7871f7b92f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,10 +21,13 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#include "cpu.h"
+#include "cpu_bits.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -846,6 +849,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     riscv_raise_exception(env, cs->exception_index, retaddr);
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
@@ -942,6 +967,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.30.2



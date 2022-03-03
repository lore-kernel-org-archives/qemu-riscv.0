Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPvHr-0003yo-Mt
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 18:55:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHk-0003qC-CC
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:55:04 -0500
Received: from [2607:f8b0:4864:20::72c] (port=38637
 helo=mail-qk1-x72c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHi-0003cz-Me
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:55:04 -0500
Received: by mail-qk1-x72c.google.com with SMTP id n185so5259426qke.5
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 15:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpzbdEbflLz87fODEao4q3bZvbQAhTB7hffle9QzzR0=;
 b=rvYTiP2MtioVCRu+m2fzqzNa2ZyFTzjVcCEbqDfsax/cmSO9IskTIUCii38mcC3np9
 jUKk5i2UNYkLR1pSdz8cbKPMeSAbvlRiYL6vfgRMu+Ox0aGWutWjzvBqmv83Kv2FsrdL
 g3cuALOPiq1Ev2JUlkWmzwGqUXPakDELXJtGwIajdPpc7/SxANdVWwrKJ4tVFqV9f91G
 19hdF/qodZ/vl9+4SjTAI7UKkk5+yPxa9lw2XsfEUYsV+q52wT6ew0b/lFqxxiABKJhl
 DJCOU9bhFGPx34/Du1wSCNk9xQeNYx+xMQwZ9SJ07ggdn3IjeyJICQuMF01gDTXQchxw
 edgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpzbdEbflLz87fODEao4q3bZvbQAhTB7hffle9QzzR0=;
 b=xzQJK1D+uo8YaMwDh9gPV+/wSkOlsj5rd9ib8oGpCeF86RUbC+s8cYyJx94qx/xvP2
 /ENHo58BlGiuI3zRQi7PKHJQJcbhTKRAcw94bAduMEYQgTmjC3TsKCMI/TCSLeGkhC3x
 PyOk8JNNmHoPbIQ+gl+yy3//r5/HNIXHSuumt4YAmy7WTC4vQqfc1QpWtT4iZ6IUu1Tv
 gmX/0l7iC9//O5bc0F+IGwqXEE2mRQcx0gXynGyH4FkQ9Fs2oPc1Ry//ZZIVN4upq3oR
 GW9VNC3HPsv4uvq34CgeH6WgJe57kK66E59WtM5z9OeVogqIbpieFObZkKH0x5qWSAcD
 /21g==
X-Gm-Message-State: AOAM532xCCAJy3TrTgrfdfCus2oIM3HmwYr4I5N9hLsIRQJpnjcAuQ4I
 S36fx2WWm/2UXxODUgnI+/oriQ==
X-Google-Smtp-Source: ABdhPJzhLVhOAIlCE/pCOUBSyZBFDdKA9ZM4jc3kK+tCsNZV/DPvt8KPznqgsbRjiDh8FJNFAywIsA==
X-Received: by 2002:a05:620a:1673:b0:62c:da57:aa32 with SMTP id
 d19-20020a05620a167300b0062cda57aa32mr1085659qko.203.1646351701802; 
 Thu, 03 Mar 2022 15:55:01 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 h188-20020a376cc5000000b00648d7e2a36bsm1768390qkc.117.2022.03.03.15.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 15:55:01 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v6 10/12] target/riscv: Add few cache related PMU events
Date: Thu,  3 Mar 2022 15:54:38 -0800
Message-Id: <20220303235440.638790-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303235440.638790-1-atishp@rivosinc.com>
References: <20220303235440.638790-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=atishp@rivosinc.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 03 Mar 2022 23:55:04 -0000

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
 target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1c60fb2e8057..72ae1a612ae8 100644
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
@@ -1178,6 +1181,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
@@ -1274,6 +1299,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.30.2



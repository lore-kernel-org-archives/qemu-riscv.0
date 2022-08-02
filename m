Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJ1O7-0003Ib-Fy
	for mharc-qemu-riscv@gnu.org; Tue, 02 Aug 2022 19:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O5-0003EI-CC
 for qemu-riscv@nongnu.org; Tue, 02 Aug 2022 19:33:21 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O2-0007lo-Gj
 for qemu-riscv@nongnu.org; Tue, 02 Aug 2022 19:33:21 -0400
Received: by mail-pl1-x633.google.com with SMTP id w10so14871912plq.0
 for <qemu-riscv@nongnu.org>; Tue, 02 Aug 2022 16:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=esQ//Au5WJ+tRLUgnJjRoCcWT37iXzjJWjBOyFruxfI=;
 b=EHq8TPD7K7tFU/KiC5uhS76u+o8aAy1kG2c09goPWCmQO/SqNeUH0gnqn2yrNedtt8
 YeUe/INP5voasT/baSu+WWwIawvL24UyrZyp3ZG6ClPZQgAo1JExv3HkbI92cZC4ARDL
 j5oY1P9qaQoJTcbNtaA9COlEaXXAZ21UhJvvocwyGPXe2C9pLAMNEB3C7dkJXi80/1Gv
 YqPsZTsaHHegiQt7CDauzyAK3+Dxg4FaXmCInfsKCVpPn4ptRs0DFCpl1tL86aPJC18s
 Ezin9q6IQDSG+nXFF2XdY94WPubBs6ebQUQiKJr6DmT+ERPAgj5javPsri+/k0t7YmSu
 CwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=esQ//Au5WJ+tRLUgnJjRoCcWT37iXzjJWjBOyFruxfI=;
 b=TCy3Cjq6AukjZ8K5vPSzIeeoQch1jtEP1W5jz27ky4FpSNSGojWGAX47V/GLQocKSW
 jfWmsmHv/QESje9nmuZ8Xl7H99+RSU/W1vHBxf4wTP6VLsrYizQRflwJfXcVHN214mmA
 uiOwN5pYVyZ0zttwJeh+OZTfOVJqwUZyFB/69aLy7+dz6B+O+HTJmjbnqJWx9iB203XX
 PQRAh0nYPsfakMqUdIn5ClZKKsIyohGzaTPZoFt3pbWInw3tnH7milyhVXie12keferc
 cSUN8/TXEOT2CgWMAdt9vL2P2Nz+SGb5cNikXqn74471V3Up6V2DR1Yx85oy1EGhv63Y
 bCrQ==
X-Gm-Message-State: ACgBeo3TYyJX6tGkgQEJr7r0FjSjBwtvggk9yzkvbow03muPgLzWsXGk
 gi1Eut9QNRa75D0LqqEx4KF+hQ==
X-Google-Smtp-Source: AA6agR6+znEvMnOkO57sNauMBGwgvj6p05CqhMKnp8a0MzMaAwD4C0Q+JFY/qtuc2d0oqGcvKZg4yQ==
X-Received: by 2002:a17:903:244c:b0:16e:fa53:a54c with SMTP id
 l12-20020a170903244c00b0016efa53a54cmr8448445pls.46.1659483197256; 
 Tue, 02 Aug 2022 16:33:17 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a170902a50a00b001636d95fe59sm250543plq.172.2022.08.02.16.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 16:33:16 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Heiko Stuebner <heiko@sntech.de>, Atish Patra <atishp@rivosinc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v12 3/6] target/riscv: Add few cache related PMU events
Date: Tue,  2 Aug 2022 16:33:04 -0700
Message-Id: <20220802233307.2106839-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802233307.2106839-1-atishp@rivosinc.com>
References: <20220802233307.2106839-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Tue, 02 Aug 2022 23:33:21 -0000

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
index 650574accf0a..c9333cc00389 100644
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
@@ -1183,6 +1185,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
@@ -1281,6 +1305,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.25.1



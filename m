Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZiGG-0005bu-Cx
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 20:02:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiG9-0005Rv-0R
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:53 -0400
Received: from [2607:f8b0:4864:20::1029] (port=45781
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiG7-0005XT-CD
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:52 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so1867504pjk.4
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 17:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCjdZOccCEWHYO45C+UstKMpK8tFrn4kR42VYKlwl2Q=;
 b=q4dbcI4eoSmfrv68p5XXx0cZTXKMRV/6ePIMj1Ug9yieaSiBX3aGSo7CaB67gM0uP9
 r0VSkAgrbcsyOVKQK7MuUADeSidUvK0g/jNng0BYUlJZoAch6qQHM2Xj+GepCWcJXg4a
 3H45NMHfXn5oDM8O1WiAaQCh+Qgl6wVTUq6zvpmswuII5xvAIz9cOdbhvJZ/J6F7dZZv
 5V3Cy250Hw6Wal5nmGG8OX9HRwwCxdLxugNvadXA6llhx5fffa4eeW9OsU7XhR+GWSrZ
 wTVtVXTUZSnbtJiaK9TbJLw1iUzWOf5LXZjkBOgb79yhFN9V7t7ME7vbbJ8JawRshbxc
 aRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCjdZOccCEWHYO45C+UstKMpK8tFrn4kR42VYKlwl2Q=;
 b=gnNC1I6umnr3/TW12ZtJIvE3c1cksEWE0DSzMYWfaRYvsC8lLO6aeKNnANNYug+gEp
 zWk+9wrZBv+cS69dZTLh7y47G1lSycW9qu+ds9a9YrMJwPp+qolnldf41jtL53b2+TY1
 CkahXTgt5xIwVCzTWRWQA2Dlmvh42Wi6qwG/0+F4T62DNVR6Z/YHjXzqCDMUK3XOESwv
 AknUkzJei2oAvl+Iuws5Gdw84yZvPui5B6uu7AM1z0NWeq4vQO2CEaYcyawzViFPyyfN
 hrQFBDmuAKXFEbnaRqSjmtLxHz/TDvG1GQmcvt5F70ny5FOpSvyCxgEULt4j6JT8z8BY
 GiwA==
X-Gm-Message-State: AOAM533lclwReOdQMn0ZX+dJE0oLLL2H1Te0ilsGzfhiPdMGtJcU5Kw+
 aW6iyjCuJ5bEZwqmx31XbhuRMA==
X-Google-Smtp-Source: ABdhPJy2zn8CJKS55Hd3Eq74R3k8IIFpjzw6OopUnFf37Z1yqugn5LbRpScHDFJZM2W8C5Ixk2HoEg==
X-Received: by 2002:a17:902:ea0d:b0:156:4c14:87dd with SMTP id
 s13-20020a170902ea0d00b001564c1487ddmr2154987plg.6.1648684910086; 
 Wed, 30 Mar 2022 17:01:50 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm8891669pjb.2.2022.03.30.17.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:01:49 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v7 10/12] target/riscv: Add few cache related PMU events
Date: Wed, 30 Mar 2022 17:01:24 -0700
Message-Id: <20220331000127.2107823-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331000127.2107823-1-atishp@rivosinc.com>
References: <20220331000127.2107823-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Thu, 31 Mar 2022 00:01:53 -0000

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
index 1c60fb2e8057..ffc57e4cd0d4 100644
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



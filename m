Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1la92p-00070G-Rr
	for mharc-qemu-riscv@gnu.org; Fri, 23 Apr 2021 23:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la92o-000703-JD; Fri, 23 Apr 2021 23:33:22 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:13296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la92j-0003OF-N9; Fri, 23 Apr 2021 23:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619235197; x=1650771197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D6P6yUd5iDfYHgJdxhkkY5EVlfJB3ZVeD4QbkrzJvH0=;
 b=Rjqx9p5YvSyQrY1YahzKeKnSPwSarXcy8wlvtR6c46y2tqzUJHj7/2xa
 eZDJfrJLM1+yODSJOUZOIHyEJLBOnVexk0QlI2VgxIDpZ3PzvAogGAp6e
 8vjlcqGldbs9v7BnmkMdDI33oqPmZ/iA3Mf+VdhrCxekVfbpOX+AYEVqH
 4NqUOcsYtf5UgbIg0SpxDKudWO6KC9BZYBRBYOmGh0LrXMsnm/ucOgdOW
 besEBx9uGEtGtSAi5DBCIUGTZPyjOwiYHFQMOwo2DIrwk7c3Wc3pQC2ut
 a7/VPT3JbYs/hs4S7pkCxTPWbjK8gu1SweXoKU/BsFf5H4fZc40cmRbMc g==;
IronPort-SDR: ps7y//ayHEMI37HEwza56OqudFrQ6G6UVyefo8O3r2JBRllL/lxf+bb/YBk+6ziQYxHDKYg+rG
 jR4mdyPbeLGbboBU7b6D2YppX8HgMmiFrxZGFyqyqXdGWV3vvF6hupTtkGZL5xBqvz3vErk4KR
 pUhgAqYEfk1xgka/BVRdZAf6m4QS+gqmxw0qrLc1WdzirGdMdhx+CQRwCdC9xptBZgBGjZ61vK
 fPHSQBunBc65NS1Zuw9CXrqy2A1aZW9jMlr84oKnfR7ehtPusRv/z77XQO5adHQripqlstOY0l
 jes=
X-IronPort-AV: E=Sophos;i="5.82,247,1613404800"; d="scan'208";a="277100802"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2021 11:33:15 +0800
IronPort-SDR: C02DEEu3E77DuxMX8+8rxojepO77hE6Tf2T6LJjx4pIzNckSewrD0H/BUXqNOAkmbcxWSB3ISw
 iSqQJJkjMyNSG0SwwwZAeqMm0d82xnSXnGfK+kBksHGuN9d9MwnfTZYzg1IGm41+HE70Zs3NLB
 cCwSgp97x/BrXzsxQfiMjAO8loFHTfijgaoqg/iZaA38qAlnx5sfX92pC/+t2UXl8CzNrvGYcE
 SpZKTFQfppJFOytRSEqfPc6IJMQaIw/0m/FOi6FNOqooBTxfvpz/3RKbhSZYt9HjgaXTFEAYew
 UC2crOa78zNmTGk4Ro8iI1zq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 20:12:17 -0700
IronPort-SDR: B4kU5D9/kLRZe6uuHV7fcGEJ2PH2y/AtQ2MkX9F/0LDQUIbKJsVsNojM8014ioVIouNkFD7P3U
 VtAd85+iGMdr5ZXfq+RgmKYwZCU1gLb2zzYv2+7qaiomBRj5torWjwPSbWbg/Qpp+BnwgYjRXw
 x5JeqFIl7EnJcZuJ3CUnVpyMShkyKMastGDkGG048Zhcn8UNMa94i4CmI6JpVNWP/ktBS6+EeT
 KZQ+lzT+6xeIGrUvazBcSww+abyWh6x6lCutoGgsEIx73kF5v4hCaas0uToz2OoCqBToFYHvET
 I1s=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.34])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2021 20:32:34 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 03/10] target/riscv: Remove the hardcoded HGATP_MODE macro
Date: Sat, 24 Apr 2021 13:31:55 +1000
Message-Id: <665f624bfdc2e3ca64265004b07de7489c77a766.1619234854.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1619234854.git.alistair.francis@wdc.com>
References: <cover.1619234854.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=7413b051c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Apr 2021 03:33:22 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_bits.h   | 11 -----------
 target/riscv/cpu_helper.c | 24 +++++++++++++++---------
 2 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 3a0e79e545..d738e2fdbd 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -195,17 +195,6 @@
 #define CSR_HTIMEDELTA      0x605
 #define CSR_HTIMEDELTAH     0x615
 
-#if defined(TARGET_RISCV32)
-#define HGATP_MODE           SATP32_MODE
-#define HGATP_VMID           SATP32_ASID
-#define HGATP_PPN            SATP32_PPN
-#endif
-#if defined(TARGET_RISCV64)
-#define HGATP_MODE           SATP64_MODE
-#define HGATP_VMID           SATP64_ASID
-#define HGATP_PPN            SATP64_PPN
-#endif
-
 /* Virtual CSRs */
 #define CSR_VSSTATUS        0x200
 #define CSR_VSIE            0x204
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1018c0036d..d9defbdd34 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -413,8 +413,13 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 0;
     } else {
-        base = (hwaddr)get_field(env->hgatp, HGATP_PPN) << PGSHIFT;
-        vm = get_field(env->hgatp, HGATP_MODE);
+        if (riscv_cpu_is_32bit(env)) {
+            base = (hwaddr)get_field(env->hgatp, SATP32_PPN) << PGSHIFT;
+            vm = get_field(env->hgatp, SATP32_MODE);
+        } else {
+            base = (hwaddr)get_field(env->hgatp, SATP64_PPN) << PGSHIFT;
+            vm = get_field(env->hgatp, SATP64_MODE);
+        }
         widened = 2;
     }
     /* status.SUM will be ignored if execute on background */
@@ -618,16 +623,17 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
                                 bool first_stage, bool two_stage)
 {
     CPUState *cs = env_cpu(env);
-    int page_fault_exceptions;
+    int page_fault_exceptions, vm;
+
     if (first_stage) {
-        page_fault_exceptions =
-            get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
-            !pmp_violation;
+        vm = get_field(env->satp, SATP_MODE);
+    } else if (riscv_cpu_is_32bit(env)) {
+        vm = get_field(env->hgatp, SATP32_MODE);
     } else {
-        page_fault_exceptions =
-            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
-            !pmp_violation;
+        vm = get_field(env->hgatp, SATP64_MODE);
     }
+    page_fault_exceptions = vm != VM_1_10_MBARE && !pmp_violation;
+
     switch (access_type) {
     case MMU_INST_FETCH:
         if (riscv_cpu_virt_enabled(env) && !first_stage) {
-- 
2.31.1



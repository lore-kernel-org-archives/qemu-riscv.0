Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWSXu-0007Q4-6D
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 19:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSXs-0007Mu-Bz; Tue, 13 Apr 2021 19:34:12 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSXq-0004CY-Dq; Tue, 13 Apr 2021 19:34:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618356850; x=1649892850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PiQTXEwQu3RiJSXj4xoGn51Zq/7w+z2924F5u09lUTc=;
 b=BNTG99sL/7ot6Qz5yCiM1X+0WuhKmnI5FP2c3VLigbhy3XWzYq/Qn7NG
 mXa+uWV9pZ5sYsyviunvG3zAqxCAM8RnOU6VJEhzsiLxRT7M92grbckQ6
 BfYzsnDHTn/g1DiFVcp0z5IdzAd/MxKnHOOlveOcxufXhST42uTHO3UvC
 p9z9IeF0ZMQBbvfTViVbMN6wJ77NhUo141+7Cd2Cn+JCWZwCqILcuZs5d
 Dm6+05rbzFPZACNw8I50JpeEbYZbW5pOCXGgJAOqUh+zUCMZMhxq8bzdR
 ugwmk6O4gqahtQtk13trWn8LAwrhnP47ebInxoNjQubOuitvkq0XmjYWB w==;
IronPort-SDR: fecAjceiYIROAPqLr7A1rTrxHsfOrat0EZLw/YlHltmFRY2px8CLRw0XJdi/dX9k3rdLGxlarN
 oeqK0KFDWMaj+pYb5SQuTcaaFrz/Ot/u8g8fi/99xRNnZHs7M2tYn9P4OGZ09wG2fp81DP9FVT
 fzm5y3BULkHFDDmBUdk8C034pLqCVYwjmizoZFQVUBXHsamzTfJqt95q+Yc656DeXpiisV9bPb
 KdKwb+EdGPtVsot1QsYsPemzbPS2HQidq6sfO2623tdE6vOOKT0HK3cG9xvEhCVK0mbbE+XENE
 ONQ=
X-IronPort-AV: E=Sophos;i="5.82,220,1613404800"; d="scan'208";a="164258282"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2021 07:33:53 +0800
IronPort-SDR: ytOkxgzJrnL13p+M9JNAYdhL5a4vMqC6+CInhRtH7S4az86TYWEJm9S8xMRtejx2cb0Wf5y4il
 Pap4uHKewR2FKxjodn0+DE+KvZVBLfuA3RZpwl2ilOzrabcBACWKzJbxrt/dxpkPPvqYPDI4uK
 hAyDcUwJdjy0IS0NlDDgQjY3jpS93i9UMViM9HlzVv1QN7ACQwR65CEbpveOyDx1ziUSnoBEsQ
 YfK47pHizqlkB64OSWoJlRH6mqIkfEOsu3nwWPhmRhaQ06t3wFPCpNb8T1hSCGJvxVYh5kX5l+
 GDDQtUDN4UcwvsdpTRK6QeC3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 16:13:14 -0700
IronPort-SDR: PpxMjERwrgXzSKYUzqgdG1DgECqf08FtPc6oMknVsziCCuexmd+1rikiwAnOF3Di1nuD4ycM1w
 4a4MQHQXVNgc6MLtKXIkl1trBMXOAfRXdvnafawW6ATWBftfkpmnLc9T94Ufjct3RAtrTICQwX
 PcSpp2fl+aLUq+bHze53wmRV2W5PGiBARwNgxmk8CQvg7Wx0uHAYfbIEeMx0mKaCfrCaMW1DAL
 owQDDR8bjxCopYY1R+8BJh6Z7sAM/RZFY8fVT+LollKv/x5CmoT8fcprk2+8V507r3TFouvWMW
 wag=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.17])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Apr 2021 16:33:44 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 3/9] target/riscv: Remove the hardcoded HGATP_MODE macro
Date: Wed, 14 Apr 2021 09:33:36 +1000
Message-Id: <4d1cd51a6f6330b13af1be5cfd45f98d09b8b850.1618356725.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618356725.git.alistair.francis@wdc.com>
References: <cover.1618356725.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 13 Apr 2021 23:34:12 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h   | 11 -----------
 target/riscv/cpu_helper.c | 24 +++++++++++++++---------
 2 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 969dd05eae..8caab23b62 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -207,17 +207,6 @@
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
index 21c54ef561..b065ddb681 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -411,8 +411,13 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
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
@@ -615,16 +620,17 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
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



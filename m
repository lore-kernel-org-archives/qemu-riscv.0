Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSQ1s-0005VK-Jo
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 16:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ1q-0005TR-Kb; Fri, 02 Apr 2021 16:04:26 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:6378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ1k-0003Lx-MU; Fri, 02 Apr 2021 16:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617393860; x=1648929860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ESpMWahl8MjArAHmAXc2r8EVAlfKvgwoIfZGUx8aO9A=;
 b=FM22dV+ZQfljGSELSFtkIwpkc2Qk4Wbk2SMiSL2jCtsYNMD4AkxpkaK1
 cRE15T69d8Oyp815Dyc9npn5Dx5P/1PvOuR53Xw8tlmSCIbAKGmi61XWj
 fU1lqbaT4wNzYEokREzSJNpnkR5FtBeyk5xRawtxN6Edj7ua54e2i/EeM
 d1+4QjtkCILOCa/Ge/6bsB5RUn9os4ph/rAtJiT4OJFUVM5+d2ELJyliY
 cepjCARHH6I+zDRtPPcW1Y8gxYfOKt2NUF4wIgTCpGxADbnn9Hf0g9Zey
 zss7gnQvu6x6QNimbEqKKlfCs0zpGzJYY0SsPOmKuo6x8Kr3eSWZ2Edk7 Q==;
IronPort-SDR: j+WyWuoHD29Vr/XhcUXmxX4kET18yKyazzWlgZl2ByznS8SUD5zQqCq19GroPDWuOrVjJDPVXR
 w1Uw9e2Ckuu6EiLgDmtOuqbN7mJrxmYpZ5ExfaJ5nYoqPn02TF551AlAR+jkJyraZMy4WY5Uiv
 5Ap2tk6z9neLQibaQXlpSAg2IDpSwRiqxsfxhJ2n2U0p3DcSgsK5pAmXI95V7gRGMJjV+N2VBO
 KUKkrHFC764ckILQPbRMJbM3zYtrVFzVuRuFMqN7shTVqfC00XxuNb4Zg6vRofM9mNcSs+9v2w
 soE=
X-IronPort-AV: E=Sophos;i="5.81,300,1610380800"; d="scan'208";a="163694229"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2021 04:04:18 +0800
IronPort-SDR: irbnrYtoWXspzReWxR2xQW3yPBEdR85oHQe6ecrP7qantAgUjdYATLvz9qjouE0jwnyKTLZ6BE
 9bES8eTnlZuYroccEMf21EI1pP1XTXew4/T6vB8kV7sYDRWrgWtiB8J9dfI0SLo3e4x3D7difC
 DTRoG+/BwDxsdYEiSUTdEMJLTJW9YjQ4O1BgMHp7NT6tM1qgNSxKB4rhhnAFK4DQQoDRVFPAWz
 ePdMo8m5gJqXvwghN7Cho6D4y7nodLY+aYfcOlRDQdbRog6z25qv+/h+Aez2CQ2nmwAju4jV9n
 QGd4wvf8a0JGSUKurf1p+tpw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 12:45:59 -0700
IronPort-SDR: AwXhyd9C9Sq9eKPKKHcoG/2VlmKw5uMK3M+dJ8DZal2jEBtf6Y4JJFMa6rHzV3YhlpSf2uh/XE
 icZ2cdpXiAZRtwK8EyBLecf/UXbghaBpVNQ0dbvx7YN0Q/gtzga4Irz/jkc8vFAOypsKu3tmTw
 a9oZltXB84qICh82TkoDxgHy++7Psl3fTNCL1J5q2Ly7X3q0f+vyXTzjxqxmKgItpShAUA0prm
 JyaHSztWREcQoYvz4nqfmPwUJIwvCNtA0+k0jZziFMslfrxhxX+m1BRjH9QhAaoPvhS4fVGXgr
 Lnw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.80])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Apr 2021 13:04:18 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 3/8] target/riscv: Remove the hardcoded HGATP_MODE macro
Date: Fri,  2 Apr 2021 16:02:22 -0400
Message-Id: <91de8cea886eaef39f8ff51d3962fc9b75ef1a0c.1617393702.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617393702.git.alistair.francis@wdc.com>
References: <cover.1617393702.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 02 Apr 2021 20:04:27 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h   | 11 -----------
 target/riscv/cpu_helper.c | 21 ++++++++++++++++-----
 2 files changed, 16 insertions(+), 16 deletions(-)

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
index 21c54ef561..6446af5de0 100644
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
@@ -621,9 +626,15 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
             get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
             !pmp_violation;
     } else {
-        page_fault_exceptions =
-            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
-            !pmp_violation;
+        if (riscv_cpu_is_32bit(env)) {
+            page_fault_exceptions =
+                get_field(env->hgatp, SATP32_MODE) != VM_1_10_MBARE &&
+                !pmp_violation;
+        } else {
+            page_fault_exceptions =
+                get_field(env->hgatp, SATP64_MODE) != VM_1_10_MBARE &&
+                !pmp_violation;
+        }
     }
     switch (access_type) {
     case MMU_INST_FETCH:
-- 
2.31.0



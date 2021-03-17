Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMaAP-0007tM-4h
	for mharc-qemu-riscv@gnu.org; Wed, 17 Mar 2021 13:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=703660e7d=alistair.francis@wdc.com>)
 id 1lMaAN-0007p9-2x; Wed, 17 Mar 2021 13:41:07 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:29204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=703660e7d=alistair.francis@wdc.com>)
 id 1lMaAJ-0006pp-IU; Wed, 17 Mar 2021 13:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616002866; x=1647538866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y6287f7K/OgcHnis2WMvgKGzwZCp/G5UW6glnR+/jN8=;
 b=OFriimPCvrZvIJ/TE34Kb9ByQikUkCXg4pAsNenHeKsCHlw63qtOzX67
 kbphkHhfZbR2v1i7AtBJcXZG5m5UkjnXRrCvZVKDqU1hmGkjZpPrD/v87
 RoMQTkSWLwmf33vMlkKT8DucZi3S656eljSNQHxVAGfWlfJInnKgcg3kA
 AcoMI6F0Upl1X2/Iv2HrK6k6m7aZkh1gooBvo/J90RGgJncgYKhgg+/3g
 wbZ1rIERNIWoMRUtEmjZ/1nBSmSVorx1BO7Ro7cX9lS32x48eYUOaRwxX
 qTuN4n7POkHw12mGcQGgc88bhusKIij4WuZbt9BPVuNwQkZEkrIHRW2ET Q==;
IronPort-SDR: 4KBC8yj2iaujEj80Z0W4DPmaOnF8Hcz21DJ3at2x44S0z7IDFknafeej2gU4w/a+Nbn685Xgds
 2lUhgfNqTWLkOJJIVOIwkd9p3eOAx+jJzrBBjU7FHf+p3YsIuSuzji8qbaT+ZHIVTcmbQA59Z5
 SluAzj0IbYM87nQ6T7NPxPJAwWnJ8lIFpUPegYWr+xrWUdU8IT7wBRrmRoTp7GPs3p7oxydCs8
 vOr4wxxU3pd7/UJtHxSWCYNoQcwXg2dXoiqvkt+Zpzt0/DWWMRPAGrXW4P//Ryykzh6qhrFx6g
 Xdg=
X-IronPort-AV: E=Sophos;i="5.81,257,1610380800"; d="scan'208";a="266778841"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Mar 2021 01:41:05 +0800
IronPort-SDR: ZsQw+8yO5ZaBp4D89U+eSd0pvXRmUB8sT7hRYjVqR7uDclSn2Rnt2oUwy22LITBlUxe7UUYoi3
 YAsyZluXgdKyRWHsZfc1eYG8GJ7l6jYcnEUYbqD8pflh+trnH0ltt/I5VdcWmTBk8X0fn9k8QW
 7CiTNOhTZuQO4BxfE/Tqay9TXRK9GfwdX/G5GW7okhgD//rE8VaDW+hU1HBJkOawFK5tsIKaBa
 5RL86hgRT9ruFCZGm8zTSWDIj0q2f1/iDLa3lk2s3924pN0DgFOV6G0Q3wi0wFuCrt6Xid2NJs
 8Vxoq8NcPCI516CbMJxr5a3t
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 10:23:20 -0700
IronPort-SDR: K9BvYAPd7urqccffcRg6og+LmnCyiiwtkJC0+6t8hhlu17YDMdifIdYlD81SA5TuM6seM+YWwC
 dfNmJLzf2WL9lHYLMUMkRzTfrhMnpQJbFl4e6EGzrY6olWyo5FXyGm6fFHSJLhDUBGAZPABl9K
 zXp70DlPSHmQLNy0A/yiThKhSTewUtNEs3q5gcuPDhMFClD2am9YQ1Qcbzn8gJN9pUqGpqZcK7
 LDu3BY/PflGU7t0EoVUH3W4xMwUr6yMHPu9k9xJR6KN1V7vy1wsaJZex5ABBMlx4QmURawgc05
 o2E=
WDCIronportException: Internal
Received: from fvwlp12.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.223])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Mar 2021 10:41:01 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/5] target/riscv: Convert the RISC-V exceptions to an enum
Date: Wed, 17 Mar 2021 13:39:48 -0400
Message-Id: <685a79eb7992d8b780570501cdb784b607144f02.1616002766.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1616002766.git.alistair.francis@wdc.com>
References: <cover.1616002766.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=703660e7d=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Wed, 17 Mar 2021 17:41:07 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h   | 44 ++++++++++++++++++++-------------------
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu_helper.c |  4 ++--
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf4599207..8ae404c32a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -527,27 +527,29 @@
 #define DEFAULT_RSTVEC      0x1000
 
 /* Exception causes */
-#define EXCP_NONE                                -1 /* sentinel value */
-#define RISCV_EXCP_INST_ADDR_MIS                 0x0
-#define RISCV_EXCP_INST_ACCESS_FAULT             0x1
-#define RISCV_EXCP_ILLEGAL_INST                  0x2
-#define RISCV_EXCP_BREAKPOINT                    0x3
-#define RISCV_EXCP_LOAD_ADDR_MIS                 0x4
-#define RISCV_EXCP_LOAD_ACCESS_FAULT             0x5
-#define RISCV_EXCP_STORE_AMO_ADDR_MIS            0x6
-#define RISCV_EXCP_STORE_AMO_ACCESS_FAULT        0x7
-#define RISCV_EXCP_U_ECALL                       0x8
-#define RISCV_EXCP_S_ECALL                      0x9
-#define RISCV_EXCP_VS_ECALL                      0xa
-#define RISCV_EXCP_M_ECALL                       0xb
-#define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
-#define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
-#define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
-#define RISCV_EXCP_SEMIHOST                      0x10
-#define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
-#define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
-#define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
-#define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT  0x17
+typedef enum RiscVException {
+    RISCV_EXCP_NONE = -1, /* sentinel value */
+    RISCV_EXCP_INST_ADDR_MIS = 0x0,
+    RISCV_EXCP_INST_ACCESS_FAULT = 0x1,
+    RISCV_EXCP_ILLEGAL_INST = 0x2,
+    RISCV_EXCP_BREAKPOINT = 0x3,
+    RISCV_EXCP_LOAD_ADDR_MIS = 0x4,
+    RISCV_EXCP_LOAD_ACCESS_FAULT = 0x5,
+    RISCV_EXCP_STORE_AMO_ADDR_MIS = 0x6,
+    RISCV_EXCP_STORE_AMO_ACCESS_FAULT = 0x7,
+    RISCV_EXCP_U_ECALL = 0x8,
+    RISCV_EXCP_S_ECALL = 0x9,
+    RISCV_EXCP_VS_ECALL = 0xa,
+    RISCV_EXCP_M_ECALL = 0xb,
+    RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
+    RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
+    RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
+    RISCV_EXCP_SEMIHOST = 0x10,
+    RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
+    RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT = 0x15,
+    RISCV_EXCP_VIRT_INSTRUCTION_FAULT = 0x16,
+    RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT = 0x17,
+} RiscVException;
 
 #define RISCV_EXCP_INT_FLAG                0x80000000
 #define RISCV_EXCP_INT_MASK                0x7fffffff
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2a990f6253..63584b4a20 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -357,7 +357,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mcause = 0;
     env->pc = env->resetvec;
 #endif
-    cs->exception_index = EXCP_NONE;
+    cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
 }
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 83a6bcfad0..af702f65b1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -72,7 +72,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
     if (irqs) {
         return ctz64(irqs); /* since non-zero */
     } else {
-        return EXCP_NONE; /* indicates no pending interrupt */
+        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
     }
 }
 #endif
@@ -1017,5 +1017,5 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      */
 
 #endif
-    cs->exception_index = EXCP_NONE; /* mark handled to qemu */
+    cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
 }
-- 
2.30.1



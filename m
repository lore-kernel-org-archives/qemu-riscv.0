Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRz6w-0006uh-MS
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 11:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz6u-0006rX-Qv; Thu, 01 Apr 2021 11:19:52 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:23952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz6s-0004bc-Sl; Thu, 01 Apr 2021 11:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617290390; x=1648826390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zoHC4AzVEMXtlU03lfldjp69ztUi/A9eWdMTD404NeU=;
 b=S4aY87QLEFy3V5eP0NmyU1QlUA/r+fuR+RDTKli/5Zewrn/YtynXN0Hb
 eWeTve9M/6fmGzwLyjIP0ahNDgNw0Mbre9eEvOs+eDCdBE9mxEEARpAyV
 4f9ajgn5yEk24bInTxfrN0WPSkEe+6QifHsRhDfc9NIEsDKH58LvaCc99
 4j9lTnEqfiBharDR1tEgU+pQR3FwH9YphgsruWg1cVBu2ZY3zvzM36Lbh
 oteZLT2jDKhDEAaY5Qa5Njp/Q5vN7gLk8YRPa6C3PqvNxSlK/8YOpzlez
 LHUWn5Jkl0qhJelJ78QCt6bbltwpQwvQi4IhH0Z0XwMTJwKY4Vq1th5zv w==;
IronPort-SDR: ZFzMLAEKriHE9fQTDZiWq3B287xbzGiQ70A7VdEbZ3wilRHToTX5SPPuaNMalMOAgCPuzz1v8+
 gpAjepoujJkMUhnQWLTOQiaZuJlHMOZ+fFvivyq7baI4OgjpIf9p837NnJ6xKTUm3DG4PxG3RZ
 qsqX/13AhAmXTv9apNUTIqyKE/B6xP67OPOI5Z5f45eKoAD1h2MMi4eTEv9V0im00dVtJzslyR
 jU0xJmTp78ZkpNuj2GDxJD41r/OHQoIOKJDMp8IqWs7gjx02Ae1Pg1u11y4heEdv5BMA5j8uGZ
 fUs=
X-IronPort-AV: E=Sophos;i="5.81,296,1610380800"; d="scan'208";a="163455419"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2021 23:19:21 +0800
IronPort-SDR: wbLkO5XoO534lhqxUeQTR53Gxpaa1A9n/HUZ3JF+i1LzwmCfUeSZjlMx5ULdXv7it42J+GCsRL
 COXToohO940gbZUx3Rfq2mYs9ehwuY5X/lt98oIme6TXRLQtu9wlasyhBcpFUashi5JrTEbOMB
 h6DfvVxE3se61GbjBY81Ls/NUNbPQ1GeX5TxqdmkYf1i124+XjpfnnnMGejRTWEs1dnv7KiJb5
 aGG4p/9QHxxOhDBgHbegR6FFbmM5N6HY4lF6k/ra2cMH8O+Bqa3aED55avBpgSRsC1ER56y9OE
 mr3okU6MKmUl3redLLlsjyHK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 08:01:01 -0700
IronPort-SDR: uj2lWVMIvUualg/MLCKa7i/JHtBeNyG5W5Kf8LhFlqhKsX43zpM8DPQNJZtNwug4afXffSv0nK
 ZIXebYDb8ZVtwA1SewuV5/eK83o/9xjwY3LrDHm5HBwXbJInc5CQSTh7xh/HN8Hj2XDGfjd8wy
 SBGeZgPo7XBBIccK8RRLpXJ54rd//HbHEwt9+FJUD0s6bJanaFlsX5J0lJ6XkQf4B28piDbMkE
 jQ2whrKhvkZ3M1OHe8RaEztO0eV7eJ/op+BhGAghUKCT8z5E4h3e2ViNprhiSzz1dDcuMRWxn+
 crg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.75])
 by uls-op-cesaip01.wdc.com with ESMTP; 01 Apr 2021 08:19:19 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 1/5] target/riscv: Convert the RISC-V exceptions to an enum
Date: Thu,  1 Apr 2021 11:17:29 -0400
Message-Id: <f191dcf08bf413a822e743a7c7f824d68879a527.1617290165.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617290165.git.alistair.francis@wdc.com>
References: <cover.1617290165.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=718ae7c5e=alistair.francis@wdc.com;
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
X-List-Received-Date: Thu, 01 Apr 2021 15:19:53 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_bits.h   | 44 ++++++++++++++++++++-------------------
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu_helper.c |  4 ++--
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf4599207..f9ff932e85 100644
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
+typedef enum RISCVException {
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
+} RISCVException;
 
 #define RISCV_EXCP_INT_FLAG                0x80000000
 #define RISCV_EXCP_INT_MASK                0x7fffffff
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b..500c9595bc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -358,7 +358,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
 #endif
-    cs->exception_index = EXCP_NONE;
+    cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
 }
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef561..be7aaa0965 100644
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
@@ -1069,5 +1069,5 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     env->two_stage_lookup = false;
 #endif
-    cs->exception_index = EXCP_NONE; /* mark handled to qemu */
+    cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
 }
-- 
2.31.0



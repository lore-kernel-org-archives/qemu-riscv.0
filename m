Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pexJN-0004cC-2P
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 08:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pexJK-0004ae-9D; Wed, 22 Mar 2023 08:11:22 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pexJH-0000l7-7k; Wed, 22 Mar 2023 08:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679487079; x=1711023079;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fDqA+VclOgg1pNCzgeDZaKhJQmwXiB4dsnZiqF9d0tE=;
 b=mP5/BoLvgcmRBthI7JbBkvXYTY8rcgsEL7JR/+U3MeBNM/Ntp6O0AWnE
 ebBgWrrUEu/QpaU63Z5QJECdxhLJPveIOM8LcbIy1W1VXYfYODE4CNP+V
 K65e3BOFTWC6fSsGjsGPC1sbjfyYzw0c55c8XcIIb4Ligkcy39M8ktX/O
 vJhyyiHUmSmTsOLYjrjEsNN35zm/EjDFa58s5Punkat+8yt1frcQj9Xnh
 41ZJzMrug/ZiTStuImguHpA4pJUmAUdPMKlPUQV+0NXSaZiU2vrvvvgSo
 Yc7llcCaObktFCM8KI+FZd0tLkB8MbAqidl/Von7MQ72b1O7JxoQAxF0h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="337917096"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="337917096"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 05:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="681872368"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="681872368"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by orsmga002.jf.intel.com with ESMTP; 22 Mar 2023 05:11:09 -0700
From: Fei Wu <fei2.wu@intel.com>
To: 
Cc: Fei Wu <fei2.wu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v3] target/riscv: reduce overhead of MSTATUS_SUM change
Date: Wed, 22 Mar 2023 20:12:40 +0800
Message-Id: <20230322121240.232303-1-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=fei2.wu@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Mar 2023 12:11:22 -0000

Kernel needs to access user mode memory e.g. during syscalls, the window
is usually opened up for a very limited time through MSTATUS.SUM, the
overhead is too much if tlb_flush() gets called for every SUM change.

This patch creates a separate MMU index for S+SUM, so that it's not
necessary to flush tlb anymore when SUM changes. This is similar to how
ARM handles Privileged Access Never (PAN).

Result of 'pipe 10' from unixbench boosts from 223656 to 1705006. Many
other syscalls benefit a lot from this too.

Signed-off-by: Fei Wu <fei2.wu@intel.com>
---
 target/riscv/cpu-param.h  |  2 +-
 target/riscv/cpu.h        |  2 +-
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 11 +++++++++++
 target/riscv/csr.c        |  2 +-
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index ebaf26d26d..9e21b943f9 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -27,6 +27,6 @@
  *  - S mode HLV/HLVX/HSV 0b101
  *  - M mode HLV/HLVX/HSV 0b111
  */
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 16
 
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..ac8bee11a7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -624,7 +624,7 @@ target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
 #define TB_FLAGS_PRIV_MMU_MASK                3
-#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
+#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 3)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
 #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fca7ef0cef..dd9e62b6e4 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -606,6 +606,7 @@ typedef enum {
 #define PRV_S 1
 #define PRV_H 2 /* Reserved */
 #define PRV_M 3
+#define MMUIdx_S_SUM 5
 
 /* Virtulisation Register Fields */
 #define VIRT_ONOFF          1
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..e52e9765d0 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -36,6 +36,17 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifdef CONFIG_USER_ONLY
     return 0;
 #else
+    if (ifetch) {
+        return env->priv;
+    }
+
+    int mode = env->priv;
+    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+        mode = get_field(env->mstatus, MSTATUS_MPP);
+    }
+    if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
+        return MMUIdx_S_SUM;
+    }
     return env->priv;
 #endif
 }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ab566639e5..eacc40e912 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1246,7 +1246,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
-            MSTATUS_MPRV | MSTATUS_SUM)) {
+            MSTATUS_MPRV)) {
         tlb_flush(env_cpu(env));
     }
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
-- 
2.25.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixhI7-0003SJ-64
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jan 2020 20:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhI1-0003Em-PH
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:09:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhHz-0006Xc-K4
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:09:37 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17129)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhHw-00069K-9Y; Fri, 31 Jan 2020 20:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1580519371; x=1612055371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eaC16dTb7VAW/Z9ZjL9u40sSSooOd9NV2bgykh5oIsY=;
 b=abGH6ee08vjiRqqdxjXV/lQ8yM1+DxoHMZUoeBdy6DbleuCElsgAYVcW
 vA4sa77tA0mWxHXN4exLaBH37fxQZ08K0unpP8kYEpNYzyqEOkp+4rK9g
 8iKWMmhw9+yGvMgvYwiEFOg95DzhHxiBc+yjRH0GeykhpSjwwWjqWevw/
 ZcW9wlRaH3fwUfyS/fLMC3qekBfShIVn/mu+asQ7EBJ/su8ZrbtuA9HDn
 SEmCc0HE3KFn3p8G7YUKDviqkjDOgHaAZyu0g2zzEkUgdO34uYkBzGPUP
 k/UpeFERQBMImkPgIm8IGBmLBqPp6Bqphvjp0qwr1+vORFsMfVa8rSuoY w==;
IronPort-SDR: gZQK8R1IzI7W0nH+n4YN4U3Vd+S7YPnBzbQwFgWiyEA3/GCG8zjCLlZkw363DnhENmEu7U5wAQ
 7Xtb2JGY4+16FVDfU+1IN8jilINh8o8Pyf1Fr+Rndasvpf9MKXh3MmZFopUWq3pkUefC1xv70d
 j1EsqM/eEAz6kNys+ar2k/gufJPNfGRogbOvgYn2yPw3RcPqYnfY3CsZQecvRoeXXrW2xo9DP+
 lkoFD6dG/WDqu22SZScHSCGNnlcAqkUlwGPcwzCCg6hwbRYA8n32/Co0X+ktrroyfPklxaXw9u
 HEw=
X-IronPort-AV: E=Sophos;i="5.70,388,1574092800"; d="scan'208";a="128872471"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2020 09:08:59 +0800
IronPort-SDR: 1f27kokrnzSsWJTvoUiI0ETdslbyDbgTzMJsvGexYOYa61qdWtV+4CYA1KnCnYPhpCkCklsvxR
 WCId8PDksYYYJ6gWkGwUH8PKTF4UbEJ/EqS+aNcEOEHiwhjb8ATBUCbkunb6WxTIBWhFOZMrQ2
 PeCGxD9j1+YysehoBeQKAu6RS26qTraEptCouC+HBZNFjRVp6cEg8N5/Yd2hCUC0tfaGTbbaxs
 BjnS0UB6seHXQVEybNKCmRvJkvuhNzWNypDvC2wnqUHzfKfoRSSb5OcSrPvMSqdyMf30L6S9dY
 sc5UX396yq0TcRkXJAYM9BCe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 17:02:08 -0800
IronPort-SDR: 9Ila5rgbIUzWGDb7JN1/fL2yQkjU5LUT4tB/S0ksJjE5vmtXKdkgwJS5DMKWDhWaQr/bUggSuL
 Wu/weAly4aM1tPMl5p2oZKTK+MMKTHmuEWBbnx2xJsPxpTTc5Tp+2tX0xPpKId1vbXMUS3a+RS
 h8G61V69onpkwFsWJiV9ftEiXAlOOZm9zNhEHO8uMtNzehVhQG4vDlhyxXI0VUqdaHKt6RKh3D
 B+cE1LFqIUYbvL9i491lmVKvQOh8Rcjult8ReyNp9MgPsAGjRrtKYZE2mLnNRqe2q+aaEkCCja
 UCU=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip01.wdc.com with ESMTP; 31 Jan 2020 17:09:00 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v2 18/35] target/riscv: Add support for virtual interrupt
 setting
Date: Fri, 31 Jan 2020 17:02:23 -0800
Message-Id: <036c8ae28107a7d328050c611e26d45f15ef8025.1580518859.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580518859.git.alistair.francis@wdc.com>
References: <cover.1580518859.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.154.42
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
X-List-Received-Date: Sat, 01 Feb 2020 01:09:39 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e9d75b45d6..3984a1f1ac 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -37,13 +37,36 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
+    target_ulong irqs;
+
     target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
     target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
-    target_ulong pending = env->mip & env->mie;
-    target_ulong mie = env->priv < PRV_M || (env->priv == PRV_M && mstatus_mie);
-    target_ulong sie = env->priv < PRV_S || (env->priv == PRV_S && mstatus_sie);
-    target_ulong irqs = (pending & ~env->mideleg & -mie) |
-                        (pending &  env->mideleg & -sie);
+    target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);
+
+    target_ulong pending = env->mip & env->mie &
+                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+    target_ulong vspending = (env->mip & env->mie &
+                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)) >> 1;
+
+    target_ulong mie    = env->priv < PRV_M ||
+                          (env->priv == PRV_M && mstatus_mie);
+    target_ulong sie    = env->priv < PRV_S ||
+                          (env->priv == PRV_S && mstatus_sie);
+    target_ulong hs_sie = env->priv < PRV_S ||
+                          (env->priv == PRV_S && hs_mstatus_sie);
+
+    if (riscv_cpu_virt_enabled(env)) {
+        target_ulong pending_hs_irq = pending & -hs_sie;
+
+        if (pending_hs_irq) {
+            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
+            return ctz64(pending_hs_irq);
+        }
+
+        pending = vspending;
+    }
+
+    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
 
     if (irqs) {
         return ctz64(irqs); /* since non-zero */
-- 
2.25.0



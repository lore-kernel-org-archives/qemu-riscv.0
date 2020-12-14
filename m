Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouYF-0001nP-G4
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouYD-0001hm-AV; Mon, 14 Dec 2020 15:34:33 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:60614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouYB-0007vm-HI; Mon, 14 Dec 2020 15:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978071; x=1639514071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hsj4JIbnoPeXWo3xGpMTNzMelbtCFmgMYA0wdibbDmk=;
 b=cxjdgrp/PAFPsy3mzA3P5ztELu1IeCUVqrZcjJG0sScJbJ8IEqYDYits
 0quLITWZyzE5ryC91cKqhvzaUh09pBmv0eNXCfGXV7uBkTwLW9OgAGGjD
 2pf+jZKFtmaC4n67lT0W8KvgtqSifArzZwSJKRBFUE+oa6cc80WEi9Nrj
 6mLp4Ux81syeXOYQERFq5RIwmZD0M/i5fIfxbJePxrx1GKkNNYMUl70+0
 JOy3QBaoS5r3W3vdUEmLsHsUc6nd8Lg3lbt4KdxM3JWckhuS/se+kxGHk
 9c4s1TCPceMRp+BP2oMi9dQ9SYlJNsTnbQjjlccX6VKaiKOzO27iprwEW w==;
IronPort-SDR: Y6V7SgpR9+C7VYhOmjjem06NWRKL2LeM/mBAEDzxzYuX5vfsa5usrwpJk7h4l28C42ZFdqJv0j
 P6onT7DGTgT6XI6jvgCWRUiHliVN3DO4iZnBUrAelV5JD1OE5e/38sDKi/b+N7WSWAu4Odh47R
 8YKPSaV2QhvVuaXAx5HTkqUpPlhdpYaP8inpXFhvw1y+SX/gkmWJNM/p/lM5dBuWQrF5U2aqqW
 aEzNryJz0371n1bs8p0BcWoKzRTnGxEEESfM56GQyQkq7ah5XmljHjW1kw8JOqxzoTUVFBTvY0
 8WY=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="159586006"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:29 +0800
IronPort-SDR: J+p7Ppq85p4iI3Dd6Y3GRpFuVr3TFtbSaYeTzf1bGcGdVfrCjO6+LHC2Fv+U/ccvaPTcyNNlt9
 x3NHv7/sSxCXDTYGj9/NZSXwYUm0OaU1MZSUCGzYKJ40yPnFO9zu6C/P8QNl7CVYqb9RyYJ1yY
 om93JRgVcTm0ZpsCWCuP9c9seRmGV/7eQzC32EqiAvNVYPSGAujpMB2nmv+E2JzG6ch/MFxvhb
 qQX1Bt3QAe4LoTSomqyj0z15YJiVCKnJn+SQ5L/rqhOXtyQnSuyyOcH6w0N7rgYGbCnBCU3XXs
 NMjtzr1Id/u9JWA/jQoAG9Cu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:18:13 -0800
IronPort-SDR: ISD3HW5l0fQwogWCx/BOX06ayM9yZdTRVKAf9lUytQv16qjkzNKcbEQLojOOrTbF06sEN3RAx4
 kMG5fL++qSwWel5FMx0As0ZEUEhfo3k9qlkyk7Iun39ul3Ad/8zyADT2QbxJvTI9ILhwCgHZ9g
 S3fDl+9YBnfp6CzFDHf+IbvjKoSYjJZd+nMOtl23W1Th5p9TS0n2xWo6jn2ZaEvu1mz7YHyxF+
 Kqn+P+EI63LDrqM8PZSwLPQJ2zsHJMSdAqwcXfEjOCnLexMFmR7Afr7G9kJr+KnAYLKihRIsGr
 a1A=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Dec 2020 12:34:29 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 12/15] target/riscv: cpu: Remove compile time XLEN checks
Date: Mon, 14 Dec 2020 12:34:29 -0800
Message-Id: <cb1be394a971d3e4c38a9892e40ba6ceaa4d00d7.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:33 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6f032122..47b738c314 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -240,10 +240,10 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
-#ifdef TARGET_RISCV32
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
-                 (target_ulong)(env->mstatus >> 32));
-#endif
+    if (riscv_cpu_is_32bit(env)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
+                     (target_ulong)(env->mstatus >> 32));
+    }
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
@@ -356,11 +356,12 @@ static void riscv_cpu_reset(DeviceState *dev)
 
 static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
-#if defined(TARGET_RISCV32)
-    info->print_insn = print_insn_riscv32;
-#elif defined(TARGET_RISCV64)
-    info->print_insn = print_insn_riscv64;
-#endif
+    RISCVCPU *cpu = RISCV_CPU(s);
+    if (riscv_cpu_is_32bit(&cpu->env)) {
+        info->print_insn = print_insn_riscv32;
+    } else {
+        info->print_insn = print_insn_riscv64;
+    }
 }
 
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
-- 
2.29.2



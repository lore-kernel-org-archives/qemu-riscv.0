Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmlua-0008M0-46
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluX-0008Is-O4; Tue, 08 Dec 2020 17:56:45 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:31153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluV-0004FJ-GL; Tue, 08 Dec 2020 17:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468203; x=1639004203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nH/9r+gXjKjpbkuITm/idupfR0J4HXqqRTNfDPKx2+8=;
 b=fpc9rPL9MZLF7r4UocE4EcRn05kpIuCxIaCbB4G6kdOks/CKsJrJpCUo
 m2DynqFuV73hWj4jYLYFlcY59LV2zom4TzbWZFpZhwX9yjqcsqe9jRCcj
 /rVAhjVA3JMieWg/LYqfSHTP8t4zKvjoWwztxN6gBd7POjFHENZyvfUY4
 dm3e/m+zXw5htV8wfe5aAR4Fs34dO2xJDC3k2TkVa7LqEof+Yjbz7EalI
 nmeiQ18zxICVbMzpUybZrEuTXfIi6SQq9CY4/5csMzm9Tr2lWJxI2ypzb
 madfsFyx60bUprkj9C1dxdM7uljDvAevLr44c01Wue9HBy+n2GdK8wl+U Q==;
IronPort-SDR: jqoTCTbyRHMHO45BlWaLC11NfouoZ4JSQYR+3H4okGviNFISc9rDjfwYIzkF2EDWnMEEA9dGP6
 x55dpRGG/hJolZ9lI5sL14D2CyYBAal5c4y/AQ8a7a3hTda4BN2oihSLBpul3Lyb20A7BHE/LA
 Qc2S02E+XYrR1hUyaOwFOlMzpVzGM29itEsy+S9OUztj1FEyRjBL3eVLGeE5M+SBLdOAQ2+gnu
 3fabs218fOPWWVUYkUnWXh8OzSUXI9k5Q5Cqa9sRUxwys4oqJ8XMDR+JzFLwWwBiB/IcLcrn0i
 JXE=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="154713832"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:42 +0800
IronPort-SDR: nL5n9WJM5k+owV0XLoKbe++Tf0WZiCNOT1wDCfFXJNbz+F1Jn3jUKLcECdISO7s9KkStfcE0Pt
 lBxsnlqnPa53hg7A4A81p4fwIQthHGJSI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:42:09 -0800
IronPort-SDR: XZh1voLPhVy9b04iiyIOT4imXUXncx+EFONKiWM11FkOmN1BBgKpA9pffgeWPnqkWszY3mZgl6
 zLHyc3BddouQ==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:42 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 12/15] target/riscv: cpu: Remove compile time XLEN checks
Date: Tue,  8 Dec 2020 14:56:42 -0800
Message-Id: <eb21fe949282cdc06e07fa7347eb5e4f26b08eb4.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:46 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
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



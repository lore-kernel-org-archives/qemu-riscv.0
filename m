Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbS6-0005s0-Ue
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbS3-0005nX-51; Wed, 16 Dec 2020 13:23:03 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRy-0000MW-9h; Wed, 16 Dec 2020 13:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608143456; x=1639679456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1zLmtXNN99ByuG6SY7cbVOGEnCnWCQpRWpzJGw+Gb/M=;
 b=DKLC+OumyxEIuXbFrkuLgDXwW4ZU/QXF2xNold/76HnDTeJJcu+PPLAo
 xCWpvZH7rg9tZksajs//avsVa6lCdCkG/iBwzfR+hnUM8Hlqw4r1AV7Nz
 zPOzu7PW20KfP8oE4sp1UsZr8beUTbPo7bey6PmhNa8TXve+gi5+Mm8g7
 Zi5ILKdVUYBFuBrhR352YDaWDNhCgUz4ytvigOiBVivMxIq5TqqEh+ZLh
 ycCp++0hOh1byEqTYrNwSi8el5NzwnOAk/CY8g2f/pf0gXRVUf+Nm4J1y
 d8v9XYMEgVtHsCa9eKYSTC/GjZlFjUO53O3FcprYtthstLDE1uERv8Fbh w==;
IronPort-SDR: d18NWFSAO3aKh+TZRWNKfFZSyUEUD0bxe7QQ189DhIcIoZX7kSipL4UGsmoOeTe0HQ1AFbvRe8
 mE/YVenU+/IHlWdN6aZjTlPBjobDDCHuWG+WoSPGazm8l/8HSZeJ3fd6JTU9a14gG1sHwthCHH
 8zfU0OdP/HYPQt86lcqpLPOjLxe8Iy3CUyTnv8kGe1S/U5jWYNFG8O/q5YJ+Eq8X4tYvTE2O79
 f6DXBzii1GMTUfly5Q49R85GazpfZyHL986Cvs/otPtj1YgubvvmFIO5GdtW6sNLKzm8QZkEaG
 plw=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="259080375"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:30:55 +0800
IronPort-SDR: 7rKkuclalf2fqRI2ROkTG7Ynnzpo9KiGnkS77yyURw7P6buItnGSeXKDwiHcXKu0SWpvyS1N3j
 HcYgYfMauTsJKDziIEdM4nU+4K31tEZr3g2OAeq9mN26YXoZHxbmwJ06TnzDixhrGFF1C9K2H3
 /YwqdkuvJbc+zEH/FyiPG5KZ55ZFLskmZO35iqt47LmjjZGkli2kmvVH5zmzIpS//Rw1idq/Gz
 UQob1FdzhPJ3pX18F3dcUwKg6LuGy291MOWXlZLoOjAsTHHMTploN2yq+moYwNyxJVSGxYxcPg
 ZD0FN174rJja+ImEBMLE8eRL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:06:32 -0800
IronPort-SDR: 5TU1A5WCHP/OQaRHhRusflQPP/n+L7PtCRFzgSdlyFIsHroiegrtJBU0Tbty1E8Z1OB5aXp3jU
 +knC/X7N2063CQNxoLcqGxr3iq8IU9YO8IuW8KmGA5lzbXwqwQNCY19ZDF87+sceBxoh1rTvFz
 wjCbN/noCFq/OhlaUbTFVdSExhOTRCeooy00nmcq4XOaPcNOhhGAsCbW4Djds7MTX/FAnup4mN
 f903vFwJ2Y0pvIJID0/0VMXrJczlbuObllmY6F7Uy4sjAYoOygrD1OvAhxdBf7ZyUpMu3PYd0R
 mC8=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Dec 2020 10:22:57 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 12/16] target/riscv: cpu: Remove compile time XLEN checks
Date: Wed, 16 Dec 2020 10:22:56 -0800
Message-Id: <a426ead44db5065a0790066d43e91245683509d7.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Wed, 16 Dec 2020 18:23:04 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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



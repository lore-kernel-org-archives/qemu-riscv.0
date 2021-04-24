Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1la933-0007GR-7j
	for mharc-qemu-riscv@gnu.org; Fri, 23 Apr 2021 23:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la931-0007Eg-Nw; Fri, 23 Apr 2021 23:33:35 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:30729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la92z-0003ZF-Ul; Fri, 23 Apr 2021 23:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619235213; x=1650771213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5qpLFkZI8ARu9VDdsKVtYaczs0XvC0KW+StVQqe5e3M=;
 b=UwUBdg+EuBeuKDku5VU8Po+KFL3etzrGBMTgIbQLx2qQRjjWD+99Rbca
 z3MP9N9iehYFKFigvuMZBICU8EXCeI5+qolVN0SzCt9v+4hhmepzDtLVh
 lq77Rao6xxtLo0So/sQ48TgJXQ5OBh/qIBOSB6/pOK9I4QWfZnQB5/6LB
 ImspeeGJCo2XFMsrmaSf9Y5HYFR0NI0n2LWWsE7W2Xyzzen8aLffoz3Wv
 XxOGJI7xi33Y7P5Sr0zhhNLW3pWndl8eOu8hEQKTnviYtAqTztmgKnPcf
 F9J3rdmH1TkiQU74WwjuPFrMTWvKka8ysoGSMzJJ710sIVtxVrtbpVBHn A==;
IronPort-SDR: +Zvy6vmNbKwER8i6R1xpv3CIYTeYw3c+I9A2kqzNJLW/oa9+ZXSz+o8897pbaG0oZlythCeFkK
 LTCpUFKlllmhoo5wPSxzM/7N0HiPiqteZyymWQssNNZGsBfxhYgCYsxHrf/if7V2nq+fS+x6Cs
 A8TRcg6LtG1eSZ5SGWfu0+VMhzPOOTROHz6IwT2pLue7ECtP/rc7wlSMXudgNEVbFi8rM1kH++
 CwZVIVWY3xpuxieXcz9tiHaJgg9WZ6G6T2qSIVeJjoUYzKJgno8uMQTxSgiTRdg5XwfzEgn8v3
 YYg=
X-IronPort-AV: E=Sophos;i="5.82,247,1613404800"; d="scan'208";a="165465285"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2021 11:33:27 +0800
IronPort-SDR: 7iHm7ipA7myjr8q7rIP++yo3fiqJqvKz5lpgiGZeD01VXOjXhqDESDeOw7/ASjYCvdhmQ4mahD
 Cho6Fzq8+nHHyqd++FL4QRr91JDgh3WXdEVL7o+DZIkdxWtYZXGPE+mDcO7AChgtStbtlNmQ+s
 n+yFXJ/xM3z4XeyrS+9RE3dEl6qRcRB8wyyV11IR2VIqnqBhN2mvebt4Xoib5+p3+Qxz1W9s1S
 noVPkcUmNDRtv1LWIDuIvaWPLiCJfMYZNFA/Ji+CucfMlNRlMTY7yzQILlk2MDIrDfmXocKTBP
 bKOQFdKxSPa9ezaR2K9RZ5Wu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 20:12:29 -0700
IronPort-SDR: Hn15hJXKu79Kmg+ncUOHTjMRYY2d1mbsSnzxNwTwaD3STEzRW9HGI9iM8sCalWt4Mjfzooz3yF
 RZApS13ZVbqqX1g5aiOzmXkMseX7LQTUiR0bsXVntOkJ12UOL5e8SSuK06nw5mJ1n+7DWOCgAm
 d0CL+2e9rcJPUp2ypdIzwU05xgrHAFNqb6zLj/qk7zi5pb1TMoyttkhfr+O3238/yobXVIypRP
 iVjrokswe3MiwpLMhPzl0Qm+R6y9PisxqVPYt49is74uBuhJmzEQF63fV0/UU6qNmCwREPUGAm
 9B4=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.34])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2021 20:33:25 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 04/10] target/riscv: Remove the hardcoded MSTATUS_SD macro
Date: Sat, 24 Apr 2021 13:33:18 +1000
Message-Id: <fcc125d96da941b56c817c9dd6068dc36478fc53.1619234854.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1619234854.git.alistair.francis@wdc.com>
References: <cover.1619234854.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=7413b051c=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Sat, 24 Apr 2021 03:33:36 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h  | 10 ----------
 target/riscv/csr.c       | 12 ++++++++++--
 target/riscv/translate.c | 19 +++++++++++++++++--
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index d738e2fdbd..6e30b312f0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -368,16 +368,6 @@
 #define MXL_RV64            2
 #define MXL_RV128           3
 
-#if defined(TARGET_RISCV32)
-#define MSTATUS_SD MSTATUS32_SD
-#define MISA_MXL MISA32_MXL
-#define MXL_VAL MXL_RV32
-#elif defined(TARGET_RISCV64)
-#define MSTATUS_SD MSTATUS64_SD
-#define MISA_MXL MISA64_MXL
-#define MXL_VAL MXL_RV64
-#endif
-
 /* sstatus CSR bits */
 #define SSTATUS_UIE         0x00000001
 #define SSTATUS_SIE         0x00000002
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 41951a0a84..e955753441 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -538,7 +538,11 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
-    mstatus = set_field(mstatus, MSTATUS_SD, dirty);
+    if (riscv_cpu_is_32bit(env)) {
+        mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
+    } else {
+        mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
+    }
     env->mstatus = mstatus;
 
     return RISCV_EXCP_NONE;
@@ -614,7 +618,11 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     }
 
     /* misa.MXL writes are not supported by QEMU */
-    val = (env->misa & MISA_MXL) | (val & ~MISA_MXL);
+    if (riscv_cpu_is_32bit(env)) {
+        val = (env->misa & MISA32_MXL) | (val & ~MISA32_MXL);
+    } else {
+        val = (env->misa & MISA64_MXL) | (val & ~MISA64_MXL);
+    }
 
     /* flush translation cache */
     if (val != env->misa) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 26eccc5eb1..a596f80f20 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -78,6 +78,17 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
     return ctx->misa & ext;
 }
 
+#ifdef TARGET_RISCV32
+# define is_32bit(ctx)  true
+#elif defined(CONFIG_USER_ONLY)
+# define is_32bit(ctx)  false
+#else
+static inline bool is_32bit(DisasContext *ctx)
+{
+    return (ctx->misa & RV32) == RV32;
+}
+#endif
+
 /*
  * RISC-V requires NaN-boxing of narrower width floating point values.
  * This applies when a 32-bit value is assigned to a 64-bit FP register.
@@ -369,6 +380,8 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
+    target_ulong sd;
+
     if (ctx->mstatus_fs == MSTATUS_FS) {
         return;
     }
@@ -376,13 +389,15 @@ static void mark_fs_dirty(DisasContext *ctx)
     ctx->mstatus_fs = MSTATUS_FS;
 
     tmp = tcg_temp_new();
+    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
+    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
     tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
 
     if (ctx->virt_enabled) {
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
     }
     tcg_temp_free(tmp);
-- 
2.31.1



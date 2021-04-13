Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWSc6-0004sr-PG
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 19:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSc1-0004rm-BI; Tue, 13 Apr 2021 19:38:30 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:18260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSbz-00067s-BU; Tue, 13 Apr 2021 19:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618357107; x=1649893107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gClJqvtrofsMCZbbHISCzYXc5qnbHPBYwu5MI5uMNbo=;
 b=rOggX5WjFKHtQUq0AK8I83SvUoed9gSCoiIaQpkaIlI6Yc7hh+P2dtXO
 huKK/fJhawvjSM9LzYmP7LRUxasPaW9Aw0/1/1UcpZhU9SIyz5lnMnaqL
 CDL8UygwSG8r5e2LFH384ZRSqLzwlwiLT8np/ALesq8xr/cqF+uqInsss
 /nf6HcFhq4c8WUTRFt3gUJNFOkerEVtHYTL7Z7Gk0iIYBL4zSJ+SgQ7bG
 9vki+JMfkjWYmiWBWJZw48ThjsnJL4ilUAo9VGem390ZIIdaNJlR7inYl
 +qe9i9oa6uwAJ+wERHsTFxZRdsAjMNHOG+bmq13dWtwrIOyQLu4txMmN6 w==;
IronPort-SDR: B9UlfdJIqDlwQWVNaa2qbcBlqXfCi7KQTUfM79AmCyBGZhzb4L+UQKeriXmQ+EQdx7V8MFg06v
 tvwo3k/DnzEPkET08293d6w+Ji3dmmbACq2Qf8x5PQ94ci/TNCrLypCIhRtm9joTvxL5HheC5U
 rGPKl9kSyk+G9Kv1IGjlGVvbBpig0ZuvPt3eVeKCISbELYOhKFQBA4937SKldEb1MvqEGDpmNy
 37FrCY+HYeLS9AHjSua44lVVbhEjfnyNu4Vr3BFA9zOY2dzVTveuJlty4m0HjeD50+qkFg9UPO
 6Z0=
X-IronPort-AV: E=Sophos;i="5.82,220,1613404800"; d="scan'208";a="164660163"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2021 07:33:59 +0800
IronPort-SDR: EJhRY557mZzizeXN8pgNjbC4AOozKK/BO2X/jv8teJTVMCTxCAmq6lC3G0f76We8Qg0ihYOhye
 q7zDKDJdh9a//WvVXehjTMzC4kWQF6BlIhR7VlwYIr4dl8QQwI13zLwvAo89eqQtfHLrPD5dKo
 WQSX+2QIksSUX+Br+/djhjCVeRcSmfgxHWSdtMAooehiR3wmVmehRlIRHWMUpPZm2BVoyiFdp3
 hveHaKJyMy89OYSE2iWg2vXfa1J3tNZzHGBoM5q12siOuypd4WZZCgUjDwoVSRXJ/DL6ol+8Y0
 YChGlgnt6lR4H+txOwrh2Z/C
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 16:15:02 -0700
IronPort-SDR: 8ZaFDS7RbC3m62OU+rd8esoihhdXZY6JMWPJS/E1Olh/hGcxJ3Jku4uD3lU3i3x0QwjBa8KKby
 nVwv/C0JBH0/8Cz8LgzTFeYeQAcYMazscVp8s5LX8GwlEn8zNEuPzRbl/20I3wcEvj/d836w41
 FGBa/qaoN+ga+Gr3DbikWxkiH3mDbfGebyw1E0smhtTlX/RZUhWVtuFK1OIg/oa+qYY8w+sVp8
 L4XOKBQRebQOImKJtpxUHEIwkQe+1ZMQQXVrc9Y2+WwO3NJW4FpjxOKzL8kSrBx2AmGmHr3d6u
 G1A=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.17])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Apr 2021 16:33:57 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 4/9] target/riscv: Remove the hardcoded MSTATUS_SD macro
Date: Wed, 14 Apr 2021 09:33:49 +1000
Message-Id: <2d6d0483c1a1e7aedd1c410b34812ea8e076cb33.1618356725.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618356725.git.alistair.francis@wdc.com>
References: <cover.1618356725.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 13 Apr 2021 23:38:31 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h  | 10 ----------
 target/riscv/csr.c       | 12 ++++++++++--
 target/riscv/translate.c | 20 ++++++++++++++++++--
 3 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8caab23b62..dd643d0f63 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -387,16 +387,6 @@
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
index 832c3bf7fd..6052b2d6e9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -492,7 +492,11 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
 
     dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
-    mstatus = set_field(mstatus, MSTATUS_SD, dirty);
+    if (riscv_cpu_is_32bit(env)) {
+        mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
+    } else {
+        mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
+    }
     env->mstatus = mstatus;
 
     return 0;
@@ -564,7 +568,11 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
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
index 2f9f5ccc62..74636b9db7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -78,6 +78,17 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
     return ctx->misa & ext;
 }
 
+#ifndef CONFIG_USER_ONLY
+# ifdef TARGET_RISCV32
+#  define is_32bit(ctx)  true
+# else
+static inline bool is_32bit(DisasContext *ctx)
+{
+    return !(ctx->misa & RV64);
+}
+# endif
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
@@ -376,13 +389,16 @@ static void mark_fs_dirty(DisasContext *ctx)
     ctx->mstatus_fs = MSTATUS_FS;
 
     tmp = tcg_temp_new();
+    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+
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



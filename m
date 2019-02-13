Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwis-00026F-Ja
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:45:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwiq-000266-LP
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwio-0006fD-Mq
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:16 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33951)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwik-0006WU-I5
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:13 -0500
Received: by mail-pg1-x530.google.com with SMTP id i130so1311831pgd.1
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=m3QyX5GKKen9C2A//gm0itW+Zbw+s4kREoS0dubIg4I=;
	b=kCTva/bCuZgpfp8RwGvbQTfUHGpkSlpsFKtZfUTL6Ymp3wmAXBqC6jyF3hud7VMWx4
	/zq+kG/kmEfPYDYWnEf59H+WyrJIDQ5ecCwZCZm6LtgslxeRJepvE+xLB/HOiLW103nY
	Gr+MzMrJcQo4BRSYy4IN1RTilmkgADmFbaBIb0YsmiEYVxoboN/a3ecdQzIioNNM0yBt
	8xn1hik+638pGgHdOQE2dzPgPCfqe+cro3kW/4TkFmw0UKJzpohPMYDmEjiWmCLxlpyM
	wypIqs6MPDbfIDx3QwXh1xru1/38Fe3dwXE5N/aOVLT+FTxApOxehoS2Wy0gJNI/Ip+N
	8Kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=m3QyX5GKKen9C2A//gm0itW+Zbw+s4kREoS0dubIg4I=;
	b=Bh+mh3Jeh/hsfZF6yHdsBZeLGKNNdGIMJiC2YP3x0E2PUH4laP0RuX4W5duRujzNZe
	D2zgUasBtX2u33uQPkEn7i+zbPkXNRYkcNAcSzKAF/tP4Bl8ABMZMmaGerBIO+m6TEDn
	KBzYzgh70Fvc8WBjtE8X9XPkHazB5eL88Of0U/d/QKQQPrKztRJLOyg13hlIRXDSRvyR
	QD7FYHidRwtJ01Sv6V9i67qCLOYm80cHgOVhtFe56w58hG5ECWNnum6i36xtnjrbwp+c
	tAB3XhqxmgLsxp58cGz3VL4lEp8DcSbSY5hhbzwtXXJPS9pw8eGStbIm1rhgB9MKcVhQ
	bfsA==
X-Gm-Message-State: AHQUAuYqTPgUfE8rcqLb3871efeAOKOT7yD148cpAwziEkK/PPeih+cH
	5HGZOw2kL4cS7FTtxa273phqlZom2mE=
X-Google-Smtp-Source: AHgI3IZEOhVXw3glOawBCtcZ0HH0llfU6FTZXCk4H1Ai8mMKXkSAONSKekfF5bpEjvKO2VFDc10mog==
X-Received: by 2002:aa7:8249:: with SMTP id e9mr1081289pfn.93.1550072705135;
	Wed, 13 Feb 2019 07:45:05 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	z14sm19318423pgv.47.2019.02.13.07.45.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:45:04 -0800 (PST)
Date: Wed, 13 Feb 2019 07:44:41 -0800
Message-Id: <20190213154450.14749-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213154450.14749-1-palmer@sifive.com>
References: <20190213154450.14749-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Clark <mjc@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::530
Subject: [Qemu-riscv] [PULL 02/11] RISC-V: Mark mstatus.fs dirty
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2019 15:45:18 -0000

From: Richard Henderson <richard.henderson@linaro.org>

Modifed from Richard Henderson's patch [1] to integrate
with the new control and status register implementation.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2018-03/msg07034.html

Note: the f* CSRs already mark mstatus.FS dirty using
env->mstatus |= mstatus.FS so the bug in the first
spin of this patch has been fixed in a prior commit.

Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Co-authored-by: Richard Henderson <richard.henderson@linaro.org>
Co-authored-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/csr.c       | 12 ------------
 target/riscv/translate.c | 40 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5e7e7d16b8b5..571414768992 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -317,18 +317,6 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
-    /* Note: this is a workaround for an issue where mstatus.FS
-       does not report dirty after floating point operations
-       that modify floating point state. This workaround is
-       technically compliant with the RISC-V Privileged
-       specification as it is legal to return only off, or dirty.
-       at the expense of extra floating point save/restore. */
-
-    /* FP is always dirty or off */
-    if (mstatus & MSTATUS_FS) {
-        mstatus |= MSTATUS_FS;
-    }
-
     int dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
                 ((mstatus & MSTATUS_XS) == MSTATUS_XS);
     mstatus = set_field(mstatus, MSTATUS_SD, dirty);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3d07d651b60c..0581b3c1f7d7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -651,6 +651,31 @@ static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
     tcg_temp_free(dat);
 }
 
+#ifndef CONFIG_USER_ONLY
+/* The states of mstatus_fs are:
+ * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
+ * We will have already diagnosed disabled state,
+ * and need to turn initial/clean into dirty.
+ */
+static void mark_fs_dirty(DisasContext *ctx)
+{
+    TCGv tmp;
+    if (ctx->mstatus_fs == MSTATUS_FS) {
+        return;
+    }
+    /* Remember the state change for the rest of the TB.  */
+    ctx->mstatus_fs = MSTATUS_FS;
+
+    tmp = tcg_temp_new();
+    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
+    tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+    tcg_temp_free(tmp);
+}
+#else
+static inline void mark_fs_dirty(DisasContext *ctx) { }
+#endif
+
 static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
         int rs1, target_long imm)
 {
@@ -679,6 +704,8 @@ static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
         break;
     }
     tcg_temp_free(t0);
+
+    mark_fs_dirty(ctx);
 }
 
 static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
@@ -944,6 +971,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
                          int rs1, int rs2, int rm)
 {
     TCGv t0 = NULL;
+    bool fp_output = true;
 
     if (ctx->mstatus_fs == 0) {
         goto do_illegal;
@@ -1006,6 +1034,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         }
         gen_set_gpr(rd, t0);
         tcg_temp_free(t0);
+        fp_output = false;
         break;
 
     case OPC_RISC_FCVT_W_S:
@@ -1035,6 +1064,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         }
         gen_set_gpr(rd, t0);
         tcg_temp_free(t0);
+        fp_output = false;
         break;
 
     case OPC_RISC_FCVT_S_W:
@@ -1085,6 +1115,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         }
         gen_set_gpr(rd, t0);
         tcg_temp_free(t0);
+        fp_output = false;
         break;
 
     case OPC_RISC_FMV_S_X:
@@ -1177,6 +1208,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         }
         gen_set_gpr(rd, t0);
         tcg_temp_free(t0);
+        fp_output = false;
         break;
 
     case OPC_RISC_FCVT_W_D:
@@ -1206,6 +1238,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         }
         gen_set_gpr(rd, t0);
         tcg_temp_free(t0);
+        fp_output = false;
         break;
 
     case OPC_RISC_FCVT_D_W:
@@ -1254,6 +1287,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         default:
             goto do_illegal;
         }
+        fp_output = false;
         break;
 
 #if defined(TARGET_RISCV64)
@@ -1271,7 +1305,11 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
             tcg_temp_free(t0);
         }
         gen_exception_illegal(ctx);
-        break;
+        return;
+    }
+
+    if (fp_output) {
+        mark_fs_dirty(ctx);
     }
 }
 
-- 
2.18.1



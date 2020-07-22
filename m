Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAwp-0006S4-P9
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwl-0006QH-OL
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:55 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwj-00067h-Rk
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:55 -0400
Received: by mail-pf1-x432.google.com with SMTP id a23so851432pfk.13
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xX3TKxwO5nmbDDyxQK/BmEY05aUhOyzJvahr+HIJ9h4=;
 b=D7cz6OtPrbkQvc6NbIiVcoACkN8DH1Df5IniPbq2Mk9UaSRssiuXjt83yS+LpFHBfD
 dy1h0PMo2O0fS03gS/Fpe0+SFLYVXYDBOvHJuaoMQPus1AQt/rfVPL3KBOUok/kn6/kh
 BwjpySWhMtOWoe75bT8ZDwg9eQA+oVmyapVMztEsSyVHmKpc2JktQN54yNXBRcTWZ0rt
 imj/Hwr9McWhCOEfnCmIu6mXfWVsMMS16M9BGTxtgOBlzBEmIG8QViedptJVZezBquJy
 gb6NK5yy7x9MxL7Z2nqNyNBMLkdqhC2ryLxrPF7zTqPsVHqTKU6MZjPZmd/R0JWZOLsr
 X4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xX3TKxwO5nmbDDyxQK/BmEY05aUhOyzJvahr+HIJ9h4=;
 b=hq/xwQaA1/UaLsIeEhu/XtAlR3O7jUmAWXJkiXICX6yfwuHY8eiYKJXoj46OIk72BQ
 XkaEpHh+mhh6Jhu2ocT9nzlS4wZVhWSfwzpvijW31546JWRJC0nHwe0Ttlk0MqI9n2zr
 WUJ8u/Z4uhsVJK2EuCoMqFc7/+ZU+jSxoiaU9RmzcPpbpX6kKqhZ1sIKAKJ0sgrAY0H1
 Sg4cx9SswXhUfa22jXiLiBT41EgrscqqZkBR3jEpqLftGlyQO/fQI2rP0s8DFwad8WvB
 xObEIHvZU76XvVccvlLUVjSbXMQuYGXK37Od9zwUFF3DxG6ZP6QMZtOTvcc8+I9Q4lvg
 IgSA==
X-Gm-Message-State: AOAM533PFPq/mTH0zBTqwDLVw5jR8sasxnIkmlC4WOjUHBhUvs9GxWjr
 klRN65bnA8PPuLqQTS+QJN7OkHkLo0c=
X-Google-Smtp-Source: ABdhPJxWpeT75Uyjza6HMWETjZ/g1srxU+s64l+4h8wiRdQRYUyh/ru6OSYskxfsGVfa387MBNtf2g==
X-Received: by 2002:a63:7c56:: with SMTP id l22mr25299688pgn.127.1595409712687; 
 Wed, 22 Jul 2020 02:21:52 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 61/76] target/riscv: rvv-0.9: floating-point/integer
 type-convert instructions
Date: Wed, 22 Jul 2020 17:16:24 +0800
Message-Id: <20200722091641.8834-62-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 09:21:56 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfcvt.rtz.xu.f.v
* vfcvt.rtz.x.f.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  6 ++++
 target/riscv/insn32.decode              | 11 ++++---
 target/riscv/insn_trans/trans_rvv.inc.c |  2 ++
 target/riscv/vector_helper.c            | 38 +++++++++++++++++++++++++
 4 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9dfe1c2b10..318fe643f4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -994,6 +994,12 @@ DEF_HELPER_5(vfcvt_f_xu_v_d, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_xu_f_v_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_x_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_x_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_x_f_v_d, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vfwcvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index dc3965c050..e4b36af89e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -547,10 +547,13 @@ vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
-vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-vfcvt_x_f_v     100010 . ..... 00001 001 ..... 1010111 @r2_vm
-vfcvt_f_xu_v    100010 . ..... 00010 001 ..... 1010111 @r2_vm
-vfcvt_f_x_v     100010 . ..... 00011 001 ..... 1010111 @r2_vm
+
+vfcvt_xu_f_v       010010 . ..... 00000 001 ..... 1010111 @r2_vm
+vfcvt_x_f_v        010010 . ..... 00001 001 ..... 1010111 @r2_vm
+vfcvt_f_xu_v       010010 . ..... 00010 001 ..... 1010111 @r2_vm
+vfcvt_f_x_v        010010 . ..... 00011 001 ..... 1010111 @r2_vm
+vfcvt_rtz_xu_f_v   010010 . ..... 00110 001 ..... 1010111 @r2_vm
+vfcvt_rtz_x_f_v    010010 . ..... 00111 001 ..... 1010111 @r2_vm
 vfwcvt_xu_f_v   100010 . ..... 01000 001 ..... 1010111 @r2_vm
 vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
 vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 9ea58bf14b..c1fc168043 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2879,6 +2879,8 @@ GEN_OPFV_TRANS(vfcvt_xu_f_v, opfv_check)
 GEN_OPFV_TRANS(vfcvt_x_f_v, opfv_check)
 GEN_OPFV_TRANS(vfcvt_f_xu_v, opfv_check)
 GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
+GEN_OPFV_TRANS(vfcvt_rtz_xu_f_v, opfv_check)
+GEN_OPFV_TRANS(vfcvt_rtz_x_f_v, opfv_check)
 
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c8d3168cee..bbd3be527c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4480,6 +4480,44 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_h, 2, 2, clearh)
 GEN_VEXT_V_ENV(vfcvt_f_x_v_w, 4, 4, clearl)
 GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8, clearq)
 
+#define FCVT_RTZ_F_V(STYPE, DTYPE)                                  \
+static DTYPE##_t STYPE##_to_##DTYPE##_rtz(STYPE a, float_status *s) \
+{                                                                   \
+    signed char frm = s->float_rounding_mode;                       \
+    s->float_rounding_mode = float_round_to_zero;                   \
+    DTYPE##_t result = STYPE##_to_##DTYPE(a, s);                    \
+    s->float_rounding_mode = frm;                                   \
+    return result;                                                  \
+}
+
+/*
+ * vfcvt.rtz.xu.f.v vd, vs2, vm
+ * Convert float to unsigned integer, truncating.
+ */
+FCVT_RTZ_F_V(float16, uint16)
+FCVT_RTZ_F_V(float32, uint32)
+FCVT_RTZ_F_V(float64, uint64)
+RVVCALL(OPFVV1, vfcvt_rtz_xu_f_v_h, OP_UU_H, H2, H2, float16_to_uint16_rtz)
+RVVCALL(OPFVV1, vfcvt_rtz_xu_f_v_w, OP_UU_W, H4, H4, float32_to_uint32_rtz)
+RVVCALL(OPFVV1, vfcvt_rtz_xu_f_v_d, OP_UU_D, H8, H8, float64_to_uint64_rtz)
+GEN_VEXT_V_ENV(vfcvt_rtz_xu_f_v_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfcvt_rtz_xu_f_v_w, 4, 4, clearl)
+GEN_VEXT_V_ENV(vfcvt_rtz_xu_f_v_d, 8, 8, clearq)
+
+/*
+ * vfcvt.rtz.x.f.v  vd, vs2, vm
+ * Convert float to signed integer, truncating.
+ */
+FCVT_RTZ_F_V(float16, int16)
+FCVT_RTZ_F_V(float32, int32)
+FCVT_RTZ_F_V(float64, int64)
+RVVCALL(OPFVV1, vfcvt_rtz_x_f_v_h, OP_UU_H, H2, H2, float16_to_int16_rtz)
+RVVCALL(OPFVV1, vfcvt_rtz_x_f_v_w, OP_UU_W, H4, H4, float32_to_int32_rtz)
+RVVCALL(OPFVV1, vfcvt_rtz_x_f_v_d, OP_UU_D, H8, H8, float64_to_int64_rtz)
+GEN_VEXT_V_ENV(vfcvt_rtz_x_f_v_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfcvt_rtz_x_f_v_w, 4, 4, clearl)
+GEN_VEXT_V_ENV(vfcvt_rtz_x_f_v_d, 8, 8, clearq)
+
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
 #define WOP_UU_H uint32_t, uint16_t, uint16_t
-- 
2.17.1



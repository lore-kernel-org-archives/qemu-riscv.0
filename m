Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsci-0006KA-Eh
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfH-00062Q-JO
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:59 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfF-0006xG-RR
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:59 -0400
Received: by mail-pj1-x1029.google.com with SMTP id ls15so2461454pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N+Zlw06kpp/RiaAloGQ0f0c+AHuhSdGx8pUcwZlbTFs=;
 b=jKUxGf1UoQI4yxy1oXqB0UY5D6+U2vh6qqY6FH1WyW/qfcf6t0cRUEG9EJGrM2j2eP
 Lj4CIU6I/3kx3F54roPuEUbst59LJhCnPt1qOBa01VoXJlr5orxZaRbA/72gFr9Zj6bF
 +2kroxvr/6SuG1q/iK5ftnAUmfQSaLzamtB28pXpwbfmnjlIAUd0uBrPjf+CpGztnpNB
 iyxNgMaluIUToBB65O6B5Osvs5nG/V/Ih9U1FvU6XT3MdkNQ+oj00D+IzAbx5DkYxQ5y
 v86EpC8VbOzL54BdY+2nCn82fUp4xhIWrg5IYm/m2jZsvf+9rHVtWLu4vOojEvDqKkUq
 Uasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N+Zlw06kpp/RiaAloGQ0f0c+AHuhSdGx8pUcwZlbTFs=;
 b=ZQmBNxNAmYIWr44mvne/9tTTY5KnAYz22uOGU2AdeTACC7HFVCXvqBtxYAZq+LYNFm
 zGB754wrqPW04VZdY1v6y63XNazf14DRq0gxlBIoy8x1Bw/9KskMNo4LlIt1n0ABEXrB
 +q1T48PKKTvfwPQTwycVhSvfTsWuenSbmtNYmGOm5i0j/kmuwRG0nUjFgqO3AKd1ZDcJ
 6MC4hCE+H6tu01hsF+lqHE6zUfSBJLuOD65YAC74k+bEfnb64qkckgMoqp+5760wPTri
 qd5UEvrgNwsMrFJ2fIA7n+klfmHu9RPLjw84eliMTKYKV1NNC9mDFxDyxqKGUBfjqfCq
 3mRg==
X-Gm-Message-State: AOAM533d9UascqLXB02evQHq+rq8hSx9b8YBvg5bErDkY3k44uyID+0w
 9e5RLSvpwNxC3EklN2XLddbG0w==
X-Google-Smtp-Source: ABdhPJzIfmh6IsQpS9XGbUmC6eF4AQP+GclwUgFOJxJYhO/oGtKW7yRD+9dKUOQ58/uWAMPnCx3yuA==
X-Received: by 2002:a17:90b:1296:: with SMTP id
 fw22mr5094898pjb.20.1594378436434; 
 Fri, 10 Jul 2020 03:53:56 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:53:56 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 50/65] target/riscv: rvv-0.9: floating-point/integer
 type-convert instructions
Date: Fri, 10 Jul 2020 18:49:04 +0800
Message-Id: <20200710104920.13550-51-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:53:59 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  6 ++++
 target/riscv/insn32.decode              | 11 ++++---
 target/riscv/insn_trans/trans_rvv.inc.c |  2 ++
 target/riscv/vector_helper.c            | 38 +++++++++++++++++++++++++
 4 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 353a1b7868..caf335a703 100644
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
index 264cd6509f..f022c5f5e8 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2637,6 +2637,8 @@ GEN_OPFV_TRANS(vfcvt_xu_f_v, opfv_check)
 GEN_OPFV_TRANS(vfcvt_x_f_v, opfv_check)
 GEN_OPFV_TRANS(vfcvt_f_xu_v, opfv_check)
 GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
+GEN_OPFV_TRANS(vfcvt_rtz_xu_f_v, opfv_check)
+GEN_OPFV_TRANS(vfcvt_rtz_x_f_v, opfv_check)
 
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 035ccef9c3..0a8f62b4a9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4473,6 +4473,44 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_h, 2, 2, clearh)
 GEN_VEXT_V_ENV(vfcvt_f_x_v_w, 4, 4, clearl)
 GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8, clearq)
 
+#define FCVT_RTZ_F_V(STYPE, DTYPE)                                   \
+static DTYPE##_t STYPE##_to_##DTYPE##_rtz(STYPE a, float_status * s) \
+{                                                                    \
+    signed char frm = s->float_rounding_mode;                        \
+    s->float_rounding_mode = float_round_to_zero;                    \
+    DTYPE##_t result = STYPE##_to_##DTYPE(a, s);                     \
+    s->float_rounding_mode = frm;                                    \
+    return result;                                                   \
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



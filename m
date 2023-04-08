Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYK-0007KX-VA
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYH-0007FJ-64
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:41 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY2-0005cU-Kh
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:40 -0400
Received: by mail-pj1-x1029.google.com with SMTP id c3so663856pjg.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sP5CjebAYUXj5rVCuD1nZxY6A1WIZTxGRkOq6Q7Wr6Q=;
 b=hh+YlP8JpzBESToJ3lnax/UACDCrbSuIRe0vMFmxuh+eY8AHeN4ppThS/dgupzJgOB
 lq6YjScs7udH54FLiYfI7EGmj+mLgkdFK5Qd0jrrsqaFes0Z650O8QHCDdxo8Q2S03JY
 pRuJC8nwDNBCpOFJI5pe8LKREawJAk5FMhNTDjlWgZIpiGiWwqWNtOPQ2Xcd6P3v3p3p
 ktWOqNdQB0ua+aBTr+/edNfSi4aubc8tBVMeqOBJI5UWJmuV11U4ljBoVxLN9hAOAz8c
 diPadZpck2sMg+/egHDWJUZ1SUGd3I7m/01MS42So8UB2vRQyvhgJbBD+qfCDWv4DXM6
 we3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sP5CjebAYUXj5rVCuD1nZxY6A1WIZTxGRkOq6Q7Wr6Q=;
 b=AkayYHHFbdmOYyrM1EEoH7e0gwA/CfT9npVQrBSjKumuIbisloULykXZdmMyCSpcar
 TbCswuJuiIZK/fB+RwmdJ5VO+y1TxjMEeLPowI9mUeJx/HZIwhvuLr/637SFC80s71o8
 0HOkbybqCI5lbx+f1nb5hcr7a7QtUihzthd+bKOG2vhqPAEXgqguP9sHiqW4yZx4eH1b
 8Z4U6FA+Uq/OtAauSrfr2QIKkb/2avTjhbMXfjCnCmUC+CrPAgXxd5nnw7nERVmcifEz
 oNSYr/+0cCID7rxet3i8tpjB1Io61yUAn3bsuTafnILp2ocgsGcE7BWyZm3oWmYU+9j5
 Dlvw==
X-Gm-Message-State: AAQBX9fPh1yoci8jwm6gbk40/kjQ1vORHf8ZaR7WZuwwEqSae7XKz528
 HRIPdxcooi7Dqi14RBb6Gl+GnwZq+plZnLpfKVI=
X-Google-Smtp-Source: AKy350bcarDVUIonfyFXYmixqtgt6eUFwxrA+YW5VyHp4pvqsASShtn0/OIqSju1KWcq42N8sga6Pg==
X-Received: by 2002:a17:903:1ca:b0:1a4:f75e:4feb with SMTP id
 e10-20020a17090301ca00b001a4f75e4febmr5044692plh.34.1680921805142; 
 Fri, 07 Apr 2023 19:43:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 09/42] tcg: Split out tcg_out_exts_i32_i64
Date: Fri,  7 Apr 2023 19:42:41 -0700
Message-Id: <20230408024314.3357414-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:41 -0000

We will need a backend interface for type extension with sign.
Use it in tcg_reg_alloc_op in the meantime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 4 ++++
 tcg/aarch64/tcg-target.c.inc     | 9 ++++++---
 tcg/arm/tcg-target.c.inc         | 5 +++++
 tcg/i386/tcg-target.c.inc        | 9 ++++++---
 tcg/loongarch64/tcg-target.c.inc | 7 ++++++-
 tcg/mips/tcg-target.c.inc        | 7 ++++++-
 tcg/ppc/tcg-target.c.inc         | 9 ++++++---
 tcg/riscv/tcg-target.c.inc       | 7 ++++++-
 tcg/s390x/tcg-target.c.inc       | 9 ++++++---
 tcg/sparc64/tcg-target.c.inc     | 9 ++++++---
 tcg/tci/tcg-target.c.inc         | 7 ++++++-
 11 files changed, 63 insertions(+), 19 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a182771c01..b0498170ea 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -111,6 +111,7 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg);
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4529,6 +4530,9 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext32u_i64:
         tcg_out_ext32u(s, new_args[0], new_args[1]);
         break;
+    case INDEX_op_ext_i32_i64:
+        tcg_out_exts_i32_i64(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index bca5f03dfb..58596eaa4b 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1434,6 +1434,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_sxt(s, TCG_TYPE_I64, MO_32, rd, rn);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_ext32s(s, rd, rn);
+}
+
 static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
                                TCGReg rd, TCGReg rn)
 {
@@ -2260,9 +2265,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext_i32_i64:
-        tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
-        break;
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, a0, a1);
         break;
@@ -2332,6 +2334,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 5c48b92f83..2ca25a3d81 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1003,6 +1003,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rn)
     g_assert_not_reached();
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 1e9f61dbf3..df7c2409cd 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1299,6 +1299,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_modrm(s, OPC_MOVSLQ, dest, src);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_ext32s(s, dest, src);
+}
+
 static inline void tcg_out_bswap64(TCGContext *s, int reg)
 {
     tcg_out_opc(s, OPC_BSWAP + P_REXW + LOWREGMASK(reg), 0, reg, 0);
@@ -2757,9 +2762,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32u(s, a0, a1);
         break;
-    case INDEX_op_ext_i32_i64:
-        tcg_out_ext32s(s, a0, a1);
-        break;
     case INDEX_op_extrh_i64_i32:
         tcg_out_shifti(s, SHIFT_SHR + P_REXW, a0, 32);
         break;
@@ -2838,6 +2840,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d2511eda7a..989632e08a 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -456,6 +456,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_opc_addi_w(s, ret, arg, 0);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32s(s, ret, arg);
+}
+
 static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
                            TCGReg a0, TCGReg a1, TCGReg a2,
                            bool c2, bool is_32bit)
@@ -1251,7 +1256,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_extrl_i64_i32:
-    case INDEX_op_ext_i32_i64:
         tcg_out_ext32s(s, a0, a1);
         break;
 
@@ -1615,6 +1619,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index fe90547c43..df36bec5c0 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -580,6 +580,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_opc_sa(s, OPC_SLL, rd, rs, 0);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32s(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -2294,7 +2299,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_extrh_i64_i32:
         tcg_out_dsra(s, a0, a1, 32);
         break;
-    case INDEX_op_ext_i32_i64:
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32s(s, a0, a1);
         break;
@@ -2447,6 +2451,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 5d25e30851..6b4742fd7b 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -806,6 +806,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out_rld(s, RLDICL, dst, src, 0, 32);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out_ext32s(s, dst, src);
+}
+
 static inline void tcg_out_shli32(TCGContext *s, TCGReg dst, TCGReg src, int c)
 {
     tcg_out_rlw(s, RLWINM, dst, src, c, 0, 31 - c);
@@ -2980,9 +2985,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_ext_i32_i64:
-        tcg_out_ext32s(s, args[0], args[1]);
-        break;
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, args[0], args[1]);
         break;
@@ -3132,6 +3134,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1d91fd19c6..7bd3b421ad 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -602,6 +602,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_opc_imm(s, OPC_ADDIW, ret, arg, 0);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32s(s, ret, arg);
+}
+
 static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
                          TCGReg addr, intptr_t offset)
 {
@@ -1602,7 +1607,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_extrl_i64_i32:
-    case INDEX_op_ext_i32_i64:
         tcg_out_ext32s(s, a0, a1);
         break;
 
@@ -1639,6 +1643,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 825dbfc523..60deaa9a95 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1122,6 +1122,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_insn(s, RRE, LLGFR, dest, src);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_ext32s(s, dest, src);
+}
+
 static void tgen_andi_risbg(TCGContext *s, TCGReg out, TCGReg in, uint64_t val)
 {
     int msb, lsb;
@@ -2524,9 +2529,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext_i32_i64:
-        tcg_out_ext32s(s, args[0], args[1]);
-        break;
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, args[0], args[1]);
         break;
@@ -2627,6 +2629,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 6464d1fb5e..56ffc6ed91 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -527,6 +527,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_arithi(s, rd, rs, 0, SHIFT_SRL);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32s(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1677,9 +1682,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_divu_i64:
         c = ARITH_UDIVX;
         goto gen_arith;
-    case INDEX_op_ext_i32_i64:
-        tcg_out_ext32s(s, a0, a1);
-        break;
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, a0, a1);
         break;
@@ -1738,6 +1740,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index bc7b5a410c..7886f21bf5 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -629,6 +629,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_op_rr(s, INDEX_op_ext32u_i64, rd, rs);
 }
 
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32s(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -787,7 +792,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_64(ext_i32)
     CASE_64(extu_i32)
     CASE_32_64(ctpop)    /* Optional (TCG_TARGET_HAS_ctpop_*). */
     case INDEX_op_bswap32_i32: /* Optional (TCG_TARGET_HAS_bswap32_i32). */
@@ -871,6 +875,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1



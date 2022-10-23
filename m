Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omkTV-0003SU-Ra
	for mharc-qemu-riscv@gnu.org; Sun, 23 Oct 2022 19:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omkTU-0003Rx-7J
 for qemu-riscv@nongnu.org; Sun, 23 Oct 2022 19:33:48 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omkTS-0006Gr-8R
 for qemu-riscv@nongnu.org; Sun, 23 Oct 2022 19:33:47 -0400
Received: by mail-pf1-x433.google.com with SMTP id f140so7686149pfa.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Oct 2022 16:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MewdPyktiyBkCdehsIltkoxQQEY+GMy0CMNIdAP60v4=;
 b=uZGiOAM70E9/02YjLIzNyvbbV+fOUU03cl0Drl5L5GMVQl3VoRqlXgCfdVoWiGBSjM
 IVa7mf9zzLRk7qaWsdsJmCxCWWePp8Cd+5F3f6tVBv8jqIHnAJn090orn3g9q9SC8oe7
 zS92448MkH1VcfVWCD5Jh8J1RQxsMoKZnDLMP+D9c2W6uM9nD80pV5HA58s7cGJqYy+n
 1TdddKeQoVxOuhxFz2NEZiQr6bmOtHkg961NJ1Qo5P05nSLk7q52EnVqXZMmP2eOdFi+
 QE9FwOBxBoXIiAOzG06y4pluOLCD61KfBw+c1K8JYk9FIiJa71Ybs0OwFMjRPpTwaw7N
 xK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MewdPyktiyBkCdehsIltkoxQQEY+GMy0CMNIdAP60v4=;
 b=eO8fpM4sdExruG2LTieOLAu8ehcPH8ghGTcaCk+CcB0iQZYctiyeHcE4Iw8mniJLW0
 SR+XFamxvik6FXNwJ8KV/HSd+qkVLTqH8mW+IvbkfxrXZWpmRQ90j7hOTujFiQv5yocr
 XT7XFRjy/4JFRyseQDglEq6sD612YmaZjaYigsqtGIFHPvXcK7afE/i0r+yt4t1GyKHb
 c7vzea9BKpTy3VILa0ekCR4G0qdBmrK5lTgc89V1m/K08fYPU1He4RCq6BqqiOmno9iB
 sBxIVsBhI1M0y11ZzBm5j7EE0Xb91YKKibh0gPX5f9+ruS5K8pgLOCVGCepgSD3Gm/PI
 NSxw==
X-Gm-Message-State: ACrzQf3jFUTRcUEv6StCfDungY8mhFXedJrYTfd/dvAkFLlSXTRW2EI1
 ydg4a+J1fMIicBt9bgpvpISPGw==
X-Google-Smtp-Source: AMsMyM4dARr4aAQaRFNFRM41KHSgifykruu0sdP59W9fj2Y6NKdz1MxYY0HmqdG6vS1BGDA2PUmbRg==
X-Received: by 2002:a63:2253:0:b0:43c:c924:e56a with SMTP id
 t19-20020a632253000000b0043cc924e56amr25044462pgm.122.1666568024547; 
 Sun, 23 Oct 2022 16:33:44 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 y12-20020a63fa0c000000b0045dc85c4a5fsm16645427pgh.44.2022.10.23.16.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 16:33:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] tcg/riscv: Fix base register for user-only qemu_ld/st
Date: Mon, 24 Oct 2022 09:33:37 +1000
Message-Id: <20221023233337.2846860-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 23 Oct 2022 23:33:48 -0000

When guest_base != 0, we were not coordinating the usage of
TCG_REG_TMP0 as base properly, leading to a previous zero-extend
of the input address being discarded.

Shuffle the alignment check to the front, because that does not
depend on the zero-extend, and it keeps the register usage clear.
Set base after each step of the address arithmetic instead of before.

Return the base register used from tcg_out_tlb_load, so as to
keep that register choice localized to that function.

Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 39 +++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 2a84c57bec..e3b608034f 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -923,9 +923,9 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
     tcg_debug_assert(ok);
 }
 
-static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
-                             TCGReg addrh, MemOpIdx oi,
-                             tcg_insn_unit **label_ptr, bool is_load)
+static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
+                               TCGReg addrh, MemOpIdx oi,
+                               tcg_insn_unit **label_ptr, bool is_load)
 {
     MemOp opc = get_memop(oi);
     unsigned s_bits = opc & MO_SIZE;
@@ -975,6 +975,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
         addrl = TCG_REG_TMP0;
     }
     tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
+    return TCG_REG_TMP0;
 }
 
 static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
@@ -1177,7 +1178,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 #else
     unsigned a_bits;
 #endif
-    TCGReg base = TCG_REG_TMP0;
+    TCGReg base;
 
     data_regl = *args++;
     data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
@@ -1187,23 +1188,25 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     opc = get_memop(oi);
 
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1);
+    base = tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1);
     tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
     add_qemu_ldst_label(s, 1, oi,
                         (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
-    }
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addr_regl, a_bits);
     }
+    base = addr_regl;
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, base);
+        base = TCG_REG_TMP0;
+    }
     if (guest_base != 0) {
-        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
+        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
+        base = TCG_REG_TMP0;
     }
     tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
 #endif
@@ -1249,7 +1252,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 #else
     unsigned a_bits;
 #endif
-    TCGReg base = TCG_REG_TMP0;
+    TCGReg base;
 
     data_regl = *args++;
     data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
@@ -1259,23 +1262,25 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     opc = get_memop(oi);
 
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0);
+    base = tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0);
     tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
     add_qemu_ldst_label(s, 0, oi,
                         (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
-    }
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addr_regl, a_bits);
     }
+    base = addr_regl;
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, base);
+        base = TCG_REG_TMP0;
+    }
     if (guest_base != 0) {
-        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
+        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
+        base = TCG_REG_TMP0;
     }
     tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
 #endif
-- 
2.34.1



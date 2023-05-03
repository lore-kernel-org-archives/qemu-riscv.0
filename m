Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6bI-0001ym-Sl
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ac-0007hY-RB
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:51 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a6-0005mK-OF
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:50 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so46255685e9.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097637; x=1685689637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=knj9vLRVgMuHbxUsbTpxPOOdPonmqcw2C7rsb1Cv/YA=;
 b=yCaNAwLgqG2lVfPtK/AQezWWlBLk51lXTQHiUHce1ujQTleWX1IeXN2+4No0mrd3+Q
 TDIACK0+XhYFD5VPXa9ockPg0F/GiD0wv+MfQdlCMJqCSrzxIT1KH7rgI1Mj5Ng8DIy2
 zjdvzHc8Qxw69z+/DxayZVXDkiryAfVLdgcaZPoJ8oV4aaPPNU6thz7kUrhuQVwg924e
 IERL0CTU9vwfMHlDYSupLqN/sAR5tt74TGpeE0ok3UAoQYODjksDghj/+vHF/3q537by
 x0sDqfo9Nt7ozRf4OkzVq6yOBGJ0Yzmm4/lhdWez+G0nuOZ9nLBqYUh4PBNrAKaMpYTc
 9jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097637; x=1685689637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=knj9vLRVgMuHbxUsbTpxPOOdPonmqcw2C7rsb1Cv/YA=;
 b=gFhSaXTOuhOLdHBOdgu9SizOafPt650W8+Bl/sWlao22A9sYj5K/as9igm+2brlj/H
 EO2FrDhSwrlbjxS3GI3BOlv8/li1x/cWHr+YqnjnUOzFGaZ69VYKCTQlJOM3sa9Uagis
 /9+2QIgb5vqUHfFQqt1NS9vD+IL+CBVz7xYLRbKdvYBoXAqoU2XUxu0vgCAxtATBQ83O
 zf1/Kf0kQ2Ii5BdVoHQfLmAn0+jTzZQokr4LFlQ0FuE/vTuqzy2jioD+EBhJv8jtbUwm
 IjBEVFtaqZbdaNHS3SHMt3u4a1ssfeoIGxqrDdnwCziwlAaW3MlMMdXJPofe4saw54QK
 bwdg==
X-Gm-Message-State: AC+VfDyQTJHa7PcoPy5D6JYBTa6gsmP2Wx7qmik4X1uhQe5Pw/ABasSt
 VY1Cqg+ec3F7sZ9YMMRMIs7Onw==
X-Google-Smtp-Source: ACHHUZ7x5vYzBSs/V9YiuAc6SEProXVK0WQpR9juyhg6+3f2wwy86z6qrQazMZZUm76EKzOBUV+g7A==
X-Received: by 2002:a05:600c:ad9:b0:3f1:7bac:d411 with SMTP id
 c25-20020a05600c0ad900b003f17bacd411mr14672180wmr.39.1683097637180; 
 Wed, 03 May 2023 00:07:17 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 26/57] tcg/arm: Adjust constraints on qemu_ld/st
Date: Wed,  3 May 2023 08:06:25 +0100
Message-Id: <20230503070656.1746170-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 07:07:51 -0000

Always reserve r3 for tlb softmmu lookup.  Fix a bug in user-only
ALL_QLDST_REGS, in that r14 is clobbered by the BLNE that leads
to the misaligned trap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h | 16 ++++++++--------
 tcg/arm/tcg-target-con-str.h |  5 ++---
 tcg/arm/tcg-target.c.inc     | 23 ++++++++---------------
 3 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index b8849b2478..229ae258ac 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -12,19 +12,19 @@
 C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I2(r, rIN)
-C_O0_I2(s, s)
+C_O0_I2(q, q)
 C_O0_I2(w, r)
-C_O0_I3(s, s, s)
-C_O0_I3(S, p, s)
+C_O0_I3(q, q, q)
+C_O0_I3(Q, p, q)
 C_O0_I4(r, r, rI, rI)
-C_O0_I4(S, p, s, s)
-C_O1_I1(r, l)
+C_O0_I4(Q, p, q, q)
+C_O1_I1(r, q)
 C_O1_I1(r, r)
 C_O1_I1(w, r)
 C_O1_I1(w, w)
 C_O1_I1(w, wr)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, l, l)
+C_O1_I2(r, q, q)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rIK)
@@ -39,8 +39,8 @@ C_O1_I2(w, w, wZ)
 C_O1_I3(w, w, w, w)
 C_O1_I4(r, r, r, rI, rI)
 C_O1_I4(r, r, rIN, rIK, 0)
-C_O2_I1(e, p, l)
-C_O2_I2(e, p, l, l)
+C_O2_I1(e, p, q)
+C_O2_I2(e, p, q, q)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, r, r, rIN, rIK)
 C_O2_I4(r, r, rI, rI, rIN, rIK)
diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
index 24b4b59feb..f83f1d3919 100644
--- a/tcg/arm/tcg-target-con-str.h
+++ b/tcg/arm/tcg-target-con-str.h
@@ -10,9 +10,8 @@
  */
 REGS('e', ALL_GENERAL_REGS & 0x5555) /* even regs */
 REGS('r', ALL_GENERAL_REGS)
-REGS('l', ALL_QLOAD_REGS)
-REGS('s', ALL_QSTORE_REGS)
-REGS('S', ALL_QSTORE_REGS & 0x5555)  /* even qstore */
+REGS('q', ALL_QLDST_REGS)
+REGS('Q', ALL_QLDST_REGS & 0x5555)   /* even qldst */
 REGS('w', ALL_VECTOR_REGS)
 
 /*
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8b0d526659..a02804dd69 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -353,23 +353,16 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define ALL_VECTOR_REGS   0xffff0000u
 
 /*
- * r0-r2 will be overwritten when reading the tlb entry (softmmu only)
- * and r0-r1 doing the byte swapping, so don't use these.
- * r3 is removed for softmmu to avoid clashes with helper arguments.
+ * r0-r3 will be overwritten when reading the tlb entry (softmmu only);
+ * r14 will be overwritten by the BLNE branching to the slow path.
  */
 #ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
+#define ALL_QLDST_REGS \
     (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
                           (1 << TCG_REG_R2) | (1 << TCG_REG_R3) | \
                           (1 << TCG_REG_R14)))
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
-                          (1 << TCG_REG_R2) | (1 << TCG_REG_R14) | \
-                          ((TARGET_LONG_BITS == 64) << TCG_REG_R3)))
 #else
-#define ALL_QLOAD_REGS   ALL_GENERAL_REGS
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1)))
+#define ALL_QLDST_REGS   (ALL_GENERAL_REGS & ~(1 << TCG_REG_R14))
 #endif
 
 /*
@@ -2203,13 +2196,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I4(r, r, r, rI, rI);
 
     case INDEX_op_qemu_ld_i32:
-        return TARGET_LONG_BITS == 32 ? C_O1_I1(r, l) : C_O1_I2(r, l, l);
+        return TARGET_LONG_BITS == 32 ? C_O1_I1(r, q) : C_O1_I2(r, q, q);
     case INDEX_op_qemu_ld_i64:
-        return TARGET_LONG_BITS == 32 ? C_O2_I1(e, p, l) : C_O2_I2(e, p, l, l);
+        return TARGET_LONG_BITS == 32 ? C_O2_I1(e, p, q) : C_O2_I2(e, p, q, q);
     case INDEX_op_qemu_st_i32:
-        return TARGET_LONG_BITS == 32 ? C_O0_I2(s, s) : C_O0_I3(s, s, s);
+        return TARGET_LONG_BITS == 32 ? C_O0_I2(q, q) : C_O0_I3(q, q, q);
     case INDEX_op_qemu_st_i64:
-        return TARGET_LONG_BITS == 32 ? C_O0_I3(S, p, s) : C_O0_I4(S, p, s, s);
+        return TARGET_LONG_BITS == 32 ? C_O0_I3(Q, p, q) : C_O0_I4(Q, p, q, q);
 
     case INDEX_op_st_vec:
         return C_O0_I2(w, r);
-- 
2.34.1



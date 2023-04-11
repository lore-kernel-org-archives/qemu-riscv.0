Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Wl-0005iC-8A
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wc-0004lL-Um
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:23 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WW-0001yV-JW
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:22 -0400
Received: by mail-pl1-x633.google.com with SMTP id h24so6416014plr.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWJA4vLLwxGPidVodRLkRYaaEaGcCGWbkamg0HPu/eo=;
 b=nxYMeDvhtDak8NMXf1FEh4bt0ivTuvOpWPQnxtL9nrxEbBRdyYzUAPgeyYoiKTTiWR
 0wEZEopfLF0wzZgdi1lSefZIE1YXVYKjW8rGxHLflfYhx10SfyUWVD/dxiq9AQkMGqjt
 RN4psRAA+0dftB4GZ5aV8Cd/szcqdcYq2HhThby9VqvKwVlvGgXSAGm7SpmP5tSHddZj
 Of34HGVBRH3fZJKSICOUL2fLG6jXROXOKMRegPnqHfo5Ru5mAAhEIfAw45vTHWLSGVJ2
 BYKFiiaOYinnp1CT+P/lIR4dr9AuY/nORmgeDi1LKxX8y3aSk0LisB0JuejsD0Xsd8HA
 zyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nWJA4vLLwxGPidVodRLkRYaaEaGcCGWbkamg0HPu/eo=;
 b=ydOU4IMf7jmSn7mVu7K5SsD44MWbKO2iGFArCBJ0XcAyeyZxIy8I+YMDVTKDTMOqx2
 f6KL4WETAgt8TPt/EfDUVnzDEFFivh/VWjY7uhxZ33Mii7bjKm+s3Dm3oDdp3VEo9P0o
 onaL5fgj9GtoMHxZyLBaqaQhAKxlJipTNJgg1xAEIG5xBYZHBhpBy1fsnTfbX6Rk7vAD
 faqa1Q9h9yY2xpdEZYPP5J7YFs1slx1PZHcyzNSrg+DBDTq5O8zsIRlSzuEoqh974+J8
 Yl97RIUUSiKleoHlZctZqWWDCW8eYu09QYew5ri/8rMIq1bYYtn4IMloj43ktzX5Hgcf
 NTDA==
X-Gm-Message-State: AAQBX9dV9OoFlsdubeTMbV21ht5EN1trUepwsY+R2xuUhToIME1a4/Nz
 Z52AOSq9I0coYTKz7wDZp5Cm7Q==
X-Google-Smtp-Source: AKy350ZuexYwY7qqb0maYcvEGJa9x4P0CTEDB1tc0gdnmgQlkX8d2OQ4+gSZRyEU3uUZh6JUnwb0vw==
X-Received: by 2002:a17:90b:1d0f:b0:246:d185:bd7c with SMTP id
 on15-20020a17090b1d0f00b00246d185bd7cmr1950162pjb.5.1681175413709; 
 Mon, 10 Apr 2023 18:10:13 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 48/54] tcg/mips: Simplify constraints on qemu_ld/st
Date: Mon, 10 Apr 2023 18:05:06 -0700
Message-Id: <20230411010512.5375-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:10:23 -0000

The softmmu tlb uses TCG_REG_TMP[0-3], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target-con-set.h | 13 +++++--------
 tcg/mips/tcg-target-con-str.h |  2 --
 tcg/mips/tcg-target.c.inc     | 30 ++++++++----------------------
 3 files changed, 13 insertions(+), 32 deletions(-)

diff --git a/tcg/mips/tcg-target-con-set.h b/tcg/mips/tcg-target-con-set.h
index fe3e868a2f..864034f468 100644
--- a/tcg/mips/tcg-target-con-set.h
+++ b/tcg/mips/tcg-target-con-set.h
@@ -12,15 +12,13 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O0_I2(SZ, S)
-C_O0_I3(SZ, S, S)
-C_O0_I3(SZ, SZ, S)
+C_O0_I3(rZ, r, r)
+C_O0_I3(rZ, rZ, r)
 C_O0_I4(rZ, rZ, rZ, rZ)
-C_O0_I4(SZ, SZ, S, S)
-C_O1_I1(r, L)
+C_O0_I4(rZ, rZ, r, r)
 C_O1_I1(r, r)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, L, L)
+C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rIK)
@@ -30,7 +28,6 @@ C_O1_I2(r, rZ, rN)
 C_O1_I2(r, rZ, rZ)
 C_O1_I4(r, rZ, rZ, rZ, 0)
 C_O1_I4(r, rZ, rZ, rZ, rZ)
-C_O2_I1(r, r, L)
-C_O2_I2(r, r, L, L)
+C_O2_I1(r, r, r)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, rZ, rZ, rN, rN)
diff --git a/tcg/mips/tcg-target-con-str.h b/tcg/mips/tcg-target-con-str.h
index e4b2965c72..413c280a7a 100644
--- a/tcg/mips/tcg-target-con-str.h
+++ b/tcg/mips/tcg-target-con-str.h
@@ -9,8 +9,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_QLOAD_REGS)
-REGS('S', ALL_QSTORE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 2a6376cd0a..08ef62f567 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -176,20 +176,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_WSZ  0x2000   /* word size */
 
 #define ALL_GENERAL_REGS  0xffffffffu
-#define NOA0_REGS         (ALL_GENERAL_REGS & ~(1 << TCG_REG_A0))
-
-#ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
-    (NOA0_REGS & ~((TCG_TARGET_REG_BITS < TARGET_LONG_BITS) << TCG_REG_A2))
-#define ALL_QSTORE_REGS \
-    (NOA0_REGS & ~(TCG_TARGET_REG_BITS < TARGET_LONG_BITS   \
-                   ? (1 << TCG_REG_A2) | (1 << TCG_REG_A3)  \
-                   : (1 << TCG_REG_A1)))
-#else
-#define ALL_QLOAD_REGS   NOA0_REGS
-#define ALL_QSTORE_REGS  NOA0_REGS
-#endif
-
 
 static bool is_p2m1(tcg_target_long val)
 {
@@ -2293,18 +2279,18 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O1_I1(r, L) : C_O1_I2(r, L, L));
+                ? C_O1_I1(r, r) : C_O1_I2(r, r, r));
     case INDEX_op_qemu_st_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O0_I2(SZ, S) : C_O0_I3(SZ, S, S));
+                ? C_O0_I2(rZ, r) : C_O0_I3(rZ, r, r));
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
-                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, L)
-                : C_O2_I2(r, r, L, L));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
+                : C_O2_I2(r, r, r, r));
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(SZ, S)
-                : TARGET_LONG_BITS == 32 ? C_O0_I3(SZ, SZ, S)
-                : C_O0_I4(SZ, SZ, S, S));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(rZ, r)
+                : TARGET_LONG_BITS == 32 ? C_O0_I3(rZ, rZ, r)
+                : C_O0_I4(rZ, rZ, r, r));
 
     default:
         g_assert_not_reached();
-- 
2.34.1



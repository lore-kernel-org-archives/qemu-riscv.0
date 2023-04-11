Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2T8-000654-Uu
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SW-0004m0-1J
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:10 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2ST-0000V7-GI
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:07 -0400
Received: by mail-pl1-x629.google.com with SMTP id o2so6254528plg.4
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yL6NJmcl0CM1R5lo/bJh1PmBiH0GQnMmMt1aJezqFLc=;
 b=NGOYsPrBlSl/LAm56a5s4WtQL1T8t06YaBmde4sqRqOwavga/bGnHfA4tOuCTkS+px
 4QfFlL7XEk7HX7f/nqBlp2FnB/0QqR8dNQRh1DLPlGjt18EM/bsHnnpnl1zX72w6bLQ8
 qrpcfDkhg9hJPGFy6bsdRjyUGo8GAiWdAWrBpSEq1AX02r1o4o0jIEi/hT+LWl0dirVB
 IsW3my8c7A+LIjgvegAtMlShCle/e77x9wzvZn1pR7+Gb+80s+oqq21i6NCPxJx18uX0
 bLvSgSfJ3tJOX3nvagvAxthZLJ9xS4AnVmHile/RXmQLWy32xkGn/ddHnOAsC0KuKdEB
 gltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yL6NJmcl0CM1R5lo/bJh1PmBiH0GQnMmMt1aJezqFLc=;
 b=K474IabDLFEIDu7ctr9cT5HiFWMtiqeagIAk5nhcbMg6S76XOYNO6a2nCHNYEwE2mA
 oYUG5m/CfQPKIEMNIuEn451GjsE+tVxu9nH7uD9xOKXXOdwqlP8fOd917HsZuE0ybPCy
 CBOVpbZto+TuMc/n5X20AX/jNFkwAEZCs1xsgT3fpUkhI0yJP4gY9rUVNCaDnMmZ3RsP
 dsRyy3G0yw0/0Gbi0JE+Mnij+y38TCUCOigsHJFvLyhLckm+LDB0029nj/Y9Vrwcnbhl
 Yom7qgZV94a90wXfQzXKimTQ2Frzy6GXLYQmzyutJTXTScSAq0MMe883z8bo3fgjQuaV
 UffQ==
X-Gm-Message-State: AAQBX9dOB98Tdc5nR4GL40KEWdXKKd8Mfrl2+KbriweFRHWg9NDfUQOO
 cfQFaoqxP2wuQreYmztpSr5u9g==
X-Google-Smtp-Source: AKy350ZdlRWvqsEz8FLpA4X+lZEPS41ZQSTLrK4KC3bQcPJLIic6V3TtdmarRVIWHSA1WNZMAhvlig==
X-Received: by 2002:a05:6a20:aaa9:b0:db:314d:c19a with SMTP id
 ck41-20020a056a20aaa900b000db314dc19amr681082pzb.50.1681175164616; 
 Mon, 10 Apr 2023 18:06:04 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 17/54] tcg: Introduce tcg_out_xchg
Date: Mon, 10 Apr 2023 18:04:35 -0700
Message-Id: <20230411010512.5375-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:06:10 -0000

We will want a backend interface for register swapping.
This is only properly defined for x86; all others get a
stub version that always indicates failure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 2 ++
 tcg/aarch64/tcg-target.c.inc     | 5 +++++
 tcg/arm/tcg-target.c.inc         | 5 +++++
 tcg/i386/tcg-target.c.inc        | 8 ++++++++
 tcg/loongarch64/tcg-target.c.inc | 5 +++++
 tcg/mips/tcg-target.c.inc        | 5 +++++
 tcg/ppc/tcg-target.c.inc         | 5 +++++
 tcg/riscv/tcg-target.c.inc       | 5 +++++
 tcg/s390x/tcg-target.c.inc       | 5 +++++
 tcg/sparc64/tcg-target.c.inc     | 5 +++++
 tcg/tci/tcg-target.c.inc         | 5 +++++
 11 files changed, 55 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 328e018a80..fde5ccc57c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -115,6 +115,8 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+    __attribute__((unused));
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 29bc97ed1c..4ec3cf3172 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1106,6 +1106,11 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     tcg_out_insn(s, 3305, LDR, 0, rd);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index f865294861..4a5d57a41c 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2607,6 +2607,11 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out_movi32(s, COND_AL, ret, arg);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4847da7e1a..ce87f8fbc9 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -460,6 +460,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPTERNLOGQ  (0x25 | P_EXT3A | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
 #define OPC_XCHG_ax_r32	(0x90)
+#define OPC_XCHG_EvGv   (0x87)
 
 #define OPC_GRP3_Eb     (0xf6)
 #define OPC_GRP3_Ev     (0xf7)
@@ -1078,6 +1079,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    int rexw = type == TCG_TYPE_I32 ? 0 : P_REXW;
+    tcg_out_modrm(s, OPC_XCHG_EvGv + rexw, r1, r2);
+    return true;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index fc98b9b31b..0940788c6f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -419,6 +419,11 @@ static void tcg_out_addi(TCGContext *s, TCGType type, TCGReg rd,
     }
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index f103cdb4e6..a83ebe8729 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -597,6 +597,11 @@ static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32s(s, rd, rs);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index b1d9c0bbe4..77abb7d20c 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1154,6 +1154,11 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg ret,
     }
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 081782d8c6..266fe1433d 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -561,6 +561,11 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     tcg_out_opc_imm(s, OPC_LD, rd, rd, 0);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 0578fce4d7..b399798664 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1076,6 +1076,11 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 99ba0fdc2b..086981f097 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -542,6 +542,11 @@ static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_mov(s, TCG_TYPE_I32, rd, rs);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 68531e35ec..4cf03a579c 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -645,6 +645,11 @@ static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_mov(s, TCG_TYPE_I32, rd, rs);
 }
 
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
-- 
2.34.1



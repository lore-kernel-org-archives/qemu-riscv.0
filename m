Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELaF-0006IW-N5
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELaE-0006GB-8N
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:50 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZK-0004l6-8f
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:49 -0500
Received: by mail-pl1-x629.google.com with SMTP id jl4so5864198plb.8
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+jhW1VfMMjd/T4xu5tAsEJqCQwclAn0GfVV3GJNGabg=;
 b=kx3dZpEnOsRyJybrCApOMyixn7rk94XTr86uSFAz4gz4LCGvDUzT8H3U2TvjF/zo4U
 shqAEmhOxZxKOdvz9+dVhcG7otKDN35yjmul1xbZ02fFffIkV3cEfnSwL34W2F/gtyeE
 EVl/vBlO5zfUrrhOsrSpBl3NhR8u5OBEKApfMEo6eOsvlFS9sOHF0s0IqwI2aPBJDhZm
 4RniVlYOeDWSx0pB/+tjO8kscq1pqJ23fJMT3CToo6q/HvjmB/XcPOuTAryvjKrjxUqP
 P0WMbvcJs06QrCb0iGqqT4/5e/FTyIQT3aqPlnl13F92l5ysLVI9yyiQM120ORH3dpeS
 iYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+jhW1VfMMjd/T4xu5tAsEJqCQwclAn0GfVV3GJNGabg=;
 b=wW4gzd7dxiQ1UVip0X2auCdYEXXdvFhpmog608nBwZQhUIFmkzr2iIPbyETQXFrCP+
 8kdAE1IWYxWh3H1cM+LqOZ1+rFusPW7XSMs0CFxCNHghmTXv/rCtQbajTh8enfny/5cu
 3ZpcCr6rG/UPjLaWRpBJ8C0Jyeh+y7U6f870RSiU8w65y39zSL5DzeKwBxnlXRuVbU01
 Zb7FVB2IlF3ZbonGa76TuaOWU+4B5+voh3wU7S1BqYGEPcAIqZR7E7OCoFxYYE0PbGu0
 zTX49y0Gw/QPPTWSJcGsiqkqJ9Xj+Wpy99qSwAOEBARsW3uIdbeNyattQtnpK/L+D65Z
 O6+A==
X-Gm-Message-State: AFqh2kqThHJTIg7FBKfz54bDXJEeZ/jm1sq91TlC5pCyIxbCyEXP4ipY
 uHhqhciUFUiggzd/Of9VBh+dhA==
X-Google-Smtp-Source: AMrXdXuvDxAZnMo1is9x/LroMRMBk9qdOto9Z9/wW/cVRaWq7NqZrO09poD3kVHDMDC0yx4hxiTxfw==
X-Received: by 2002:a17:902:e944:b0:189:d8fb:1523 with SMTP id
 b4-20020a170902e94400b00189d8fb1523mr70590119pll.36.1673145473024; 
 Sat, 07 Jan 2023 18:37:53 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 29/36] target/s390x: Copy wout_x1 to wout_x1_P
Date: Sat,  7 Jan 2023 18:37:12 -0800
Message-Id: <20230108023719.2466341-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 08 Jan 2023 02:38:50 -0000

Make a copy of wout_x1 before modifying it, as wout_x1_P
emphasizing that it operates on the out/out2 pair.  The insns
that use x1_P are data movement that will not change to Int128.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/insn-data.h.inc | 12 ++++++------
 target/s390x/tcg/translate.c     |  8 ++++++++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 79c6ab509a..d0814cb218 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -422,7 +422,7 @@
     F(0x3800, LER,     RR_a,  Z,   0, e2, 0, cond_e1e2, mov2, 0, IF_AFP1 | IF_AFP2)
     F(0x7800, LE,      RX_a,  Z,   0, m2_32u, 0, e1, mov2, 0, IF_AFP1)
     F(0xed64, LEY,     RXY_a, LD,  0, m2_32u, 0, e1, mov2, 0, IF_AFP1)
-    F(0xb365, LXR,     RRE,   Z,   x2h, x2l, 0, x1, movx, 0, IF_AFP1)
+    F(0xb365, LXR,     RRE,   Z,   x2h, x2l, 0, x1_P, movx, 0, IF_AFP1)
 /* LOAD IMMEDIATE */
     C(0xc001, LGFI,    RIL_a, EI,  0, i2, 0, r1, mov2, 0)
 /* LOAD RELATIVE LONG */
@@ -461,7 +461,7 @@
     C(0xe332, LTGF,    RXY_a, GIE, 0, a2, r1, 0, ld32s, s64)
     F(0xb302, LTEBR,   RRE,   Z,   0, e2, 0, cond_e1e2, mov2, f32, IF_BFP)
     F(0xb312, LTDBR,   RRE,   Z,   0, f2, 0, f1, mov2, f64, IF_BFP)
-    F(0xb342, LTXBR,   RRE,   Z,   x2h, x2l, 0, x1, movx, f128, IF_BFP)
+    F(0xb342, LTXBR,   RRE,   Z,   x2h, x2l, 0, x1_P, movx, f128, IF_BFP)
 /* LOAD AND TRAP */
     C(0xe39f, LAT,     RXY_a, LAT, 0, m2_32u, r1, 0, lat, 0)
     C(0xe385, LGAT,    RXY_a, LAT, 0, a2, r1, 0, lgat, 0)
@@ -483,7 +483,7 @@
     C(0xb913, LCGFR,   RRE,   Z,   0, r2_32s, r1, 0, neg, neg64)
     F(0xb303, LCEBR,   RRE,   Z,   0, e2, new, e1, negf32, f32, IF_BFP)
     F(0xb313, LCDBR,   RRE,   Z,   0, f2, new, f1, negf64, f64, IF_BFP)
-    F(0xb343, LCXBR,   RRE,   Z,   x2h, x2l, new_P, x1, negf128, f128, IF_BFP)
+    F(0xb343, LCXBR,   RRE,   Z,   x2h, x2l, new_P, x1_P, negf128, f128, IF_BFP)
     F(0xb373, LCDFR,   RRE,   FPSSH, 0, f2, new, f1, negf64, 0, IF_AFP1 | IF_AFP2)
 /* LOAD COUNT TO BLOCK BOUNDARY */
     C(0xe727, LCBB,    RXE,   V,   la2, 0, r1, 0, lcbb, 0)
@@ -552,7 +552,7 @@
     C(0xb911, LNGFR,   RRE,   Z,   0, r2_32s, r1, 0, nabs, nabs64)
     F(0xb301, LNEBR,   RRE,   Z,   0, e2, new, e1, nabsf32, f32, IF_BFP)
     F(0xb311, LNDBR,   RRE,   Z,   0, f2, new, f1, nabsf64, f64, IF_BFP)
-    F(0xb341, LNXBR,   RRE,   Z,   x2h, x2l, new_P, x1, nabsf128, f128, IF_BFP)
+    F(0xb341, LNXBR,   RRE,   Z,   x2h, x2l, new_P, x1_P, nabsf128, f128, IF_BFP)
     F(0xb371, LNDFR,   RRE,   FPSSH, 0, f2, new, f1, nabsf64, 0, IF_AFP1 | IF_AFP2)
 /* LOAD ON CONDITION */
     C(0xb9f2, LOCR,    RRF_c, LOC, r1, r2, new, r1_32, loc, 0)
@@ -577,7 +577,7 @@
     C(0xb910, LPGFR,   RRE,   Z,   0, r2_32s, r1, 0, abs, abs64)
     F(0xb300, LPEBR,   RRE,   Z,   0, e2, new, e1, absf32, f32, IF_BFP)
     F(0xb310, LPDBR,   RRE,   Z,   0, f2, new, f1, absf64, f64, IF_BFP)
-    F(0xb340, LPXBR,   RRE,   Z,   x2h, x2l, new_P, x1, absf128, f128, IF_BFP)
+    F(0xb340, LPXBR,   RRE,   Z,   x2h, x2l, new_P, x1_P, absf128, f128, IF_BFP)
     F(0xb370, LPDFR,   RRE,   FPSSH, 0, f2, new, f1, absf64, 0, IF_AFP1 | IF_AFP2)
 /* LOAD REVERSED */
     C(0xb91f, LRVR,    RRE,   Z,   0, r2_32u, new, r1_32, rev32, 0)
@@ -588,7 +588,7 @@
 /* LOAD ZERO */
     F(0xb374, LZER,    RRE,   Z,   0, 0, 0, e1, zero, 0, IF_AFP1)
     F(0xb375, LZDR,    RRE,   Z,   0, 0, 0, f1, zero, 0, IF_AFP1)
-    F(0xb376, LZXR,    RRE,   Z,   0, 0, 0, x1, zero2, 0, IF_AFP1)
+    F(0xb376, LZXR,    RRE,   Z,   0, 0, 0, x1_P, zero2, 0, IF_AFP1)
 
 /* LOAD FPC */
     F(0xb29d, LFPC,    S,     Z,   0, m2_32u, 0, 0, sfpc, 0, IF_BFP)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f3e4b70ed9..d25b6f3c03 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5518,6 +5518,14 @@ static void wout_x1(DisasContext *s, DisasOps *o)
 }
 #define SPEC_wout_x1 SPEC_r1_f128
 
+static void wout_x1_P(DisasContext *s, DisasOps *o)
+{
+    int f1 = get_field(s, r1);
+    store_freg(f1, o->out);
+    store_freg(f1 + 2, o->out2);
+}
+#define SPEC_wout_x1_P SPEC_r1_f128
+
 static void wout_cond_r1r2_32(DisasContext *s, DisasOps *o)
 {
     if (get_field(s, r1) != get_field(s, r2)) {
-- 
2.34.1



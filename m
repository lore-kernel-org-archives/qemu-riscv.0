Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6dw-0004xm-Jo
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dW-00030V-6p
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:52 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-00076T-HH
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:49 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f3331f928cso29230535e9.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097837; x=1685689837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZO7SCJGqCS84y/GA95YftKK1byl/0ehMpYN3JvXR7I=;
 b=hEhSLcYygoqsEbTL+lw+jbCnLzEl6y/CQ4QPoPtcNeHEBsukUvEbIR1pQcCZYeSztr
 We9Vl3whUaqGoMB7Si9cLm4FZCtbz1OcvTIsf7s/7S0ioJAxBZA0bhJ/XlPrr56dCfqu
 TYv888rq3eD+qp/EOrSJ8RD8RuH5OBBSAyQiWuwXlbdiBVu6jWarmmnfaSL/xnX9bd0D
 Aw5S/oW5qC4BNNJCLCDS6kMYPVu0dgHr7FkZehDZnkuS1/h5xBRtG304bNiDKUoYGXLX
 4g/Z+v2dGb6Fq0MGHyRiUF3tclFs01GDwh4zc/zfkYqw3BC5aqKHeulpA0/Z3Z33cHoQ
 ZStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097837; x=1685689837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZO7SCJGqCS84y/GA95YftKK1byl/0ehMpYN3JvXR7I=;
 b=db0R+GWMFCW78mdFeN6LatDnXiTjxZVpxsCCj0oqFFMXJ3LZfIsVLEoLRTbGmNk05d
 8yacMu7hVR8NBXiJkthZ7NoLBYblH2S5uyqUf2VxReqGw/9dEQ+FeoEbsxmGaYNDte2s
 p5iAoZf5TYAFzK8enKKTB1xFFLKWrWWS5BrCZ+kweSET0tTwrqlQcrLcey2dLEAOY8dR
 TAPOPEdOYAmhIt2r/x2lOooRbHFxiMqJJ2yekQEbKyNWXYv4zgofe6JDYbkFJGrwbng2
 LAfUPqNxnD/zQhgGBIrb3tsjHBCPmiQvhQ2MumRxOa9lnN+TPITS/Amj3Yye1kWcwH0N
 mPmw==
X-Gm-Message-State: AC+VfDwtbG+pRxwGukVqa4aFHta4ZpCfQLtRIIRAuIwlWTy5iqNlt+SI
 QE+Zdt66LQj3s7l/xyuyPOMoAg==
X-Google-Smtp-Source: ACHHUZ6v3x2gbtF8wK4pg/+2JalqZR+fxvRhMqmcRMPqd1jIcL2YtUNtvto4hRqZy8u1+zuZ8CmuQg==
X-Received: by 2002:a1c:7404:0:b0:3f1:92aa:4eb8 with SMTP id
 p4-20020a1c7404000000b003f192aa4eb8mr14667499wmc.16.1683097837035; 
 Wed, 03 May 2023 00:10:37 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 52/57] tcg/i386: Honor 64-bit atomicity in 32-bit mode
Date: Wed,  3 May 2023 08:06:51 +0100
Message-Id: <20230503070656.1746170-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 07:10:56 -0000

Use the fpu to perform 64-bit loads and stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 44 +++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 3e21f067d6..5c6c64c48a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -468,6 +468,10 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_GRP5        (0xff)
 #define OPC_GRP14       (0x73 | P_EXT | P_DATA16)
 
+#define OPC_ESCDF       (0xdf)
+#define ESCDF_FILD_m64  5
+#define ESCDF_FISTP_m64 7
+
 /* Group 1 opcode extensions for 0x80-0x83.
    These are also used as modifiers for OPC_ARITH.  */
 #define ARITH_ADD 0
@@ -2091,7 +2095,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
             datalo = datahi;
             datahi = t;
         }
-        if (h.base == datalo || h.index == datalo) {
+        if (h.atom == MO_64) {
+            /*
+             * Atomicity requires that we use use a single 8-byte load.
+             * For simplicity and code size, always use the FPU for this.
+             * Similar insns using SSE/AVX are merely larger.
+             * Load from memory in one go, then store back to the stack,
+             * from whence we can load into the correct integer regs.
+             */
+            tcg_out_modrm_sib_offset(s, OPC_ESCDF + h.seg, ESCDF_FILD_m64,
+                                     h.base, h.index, 0, h.ofs);
+            tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FISTP_m64, TCG_REG_ESP, 0);
+            tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
+            tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
+        } else if (h.base == datalo || h.index == datalo) {
             tcg_out_modrm_sib_offset(s, OPC_LEA, datahi,
                                      h.base, h.index, 0, h.ofs);
             tcg_out_modrm_offset(s, movop + h.seg, datalo, datahi, 0);
@@ -2161,12 +2178,27 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datalo,
                                      h.base, h.index, 0, h.ofs);
+            break;
+        }
+        if (use_movbe) {
+            TCGReg t = datalo;
+            datalo = datahi;
+            datahi = t;
+        }
+        if (h.atom == MO_64) {
+            /*
+             * Atomicity requires that we use use one 8-byte store.
+             * For simplicity, and code size, always use the FPU for this.
+             * Similar insns using SSE/AVX are merely larger.
+             * Assemble the 8-byte quantity in required endianness
+             * on the stack, load to coproc unit, and store.
+             */
+            tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
+            tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
+            tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FILD_m64, TCG_REG_ESP, 0);
+            tcg_out_modrm_sib_offset(s, OPC_ESCDF + h.seg, ESCDF_FISTP_m64,
+                                     h.base, h.index, 0, h.ofs);
         } else {
-            if (use_movbe) {
-                TCGReg t = datalo;
-                datalo = datahi;
-                datahi = t;
-            }
             tcg_out_modrm_sib_offset(s, movop + h.seg, datalo,
                                      h.base, h.index, 0, h.ofs);
             tcg_out_modrm_sib_offset(s, movop + h.seg, datahi,
-- 
2.34.1



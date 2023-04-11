Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Wg-0005Bv-Cd
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WX-0003yh-Dr
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:17 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WQ-0001vk-CL
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:16 -0400
Received: by mail-pl1-x631.google.com with SMTP id y6so5191799plp.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HnK4BFECi7OHgKxYc+lfZT/h6gVPJh9T4yUQ5x3FKOM=;
 b=eWWR9GIp+q1RVVQ+IMfttFoogEtW3T7uH7j/Znp6Z6W/IRuchKYx5H8Lb3fuKnppmK
 3S1jsVJdNJ0qXq5Gt4jrVmNZF+SdaZS4ezG2EHoONCyhucoPsb0p9ww3XUcLGIAcPtab
 hCwbX9V0Fvk5VCvWTmo9A+ob8BGfE4Eq84bPnbOx6fPefm9iTn4hCSJjgn3L8c7HBWGC
 w06y5EhLcULFCwWipLN9eWcgU3UAdP4I6aMVEE08PEHgEkX7STQwAIEioqoVRqDTVcV2
 wruxqtqcRGjapUDgGkScuLNOfg8Pj7fiy3GNEcCIe3rgBU99//7kx05FhQkEAuPZPCJw
 gwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HnK4BFECi7OHgKxYc+lfZT/h6gVPJh9T4yUQ5x3FKOM=;
 b=3Ad9w+uOVXeMFO1WkkZ3Cku0ZDF9pH1gXf2HsLB6reXFTxCZ7y69ntrPaJlgvuhu8R
 eAfn7sXxULnJetB8FEjWS4ZjqAKTeB/uMkO6UVrpKyFOSEBzzum0GJTKREzVzvo25HOt
 WePSF3xTu4GzWQbocB7cpLjCpnn+YB6Cv51q5knNJPHedTh5+1y34EjK/wJWaryjRLuI
 TdS/fgdu4HOiXEyqOsSgLixVi2dLtHDVxV2v1wdN5+rmA3JPlx6Tm/SIpuZDdeq/5uYY
 ZMxKt1q63B1dCfjpNq9DMJxDNfwRrBaA4pJP4eKbT6O4SHTC1LzU3jhieJdvnsatIXLQ
 UZow==
X-Gm-Message-State: AAQBX9dY1i5pT+1eiXq1n+zs2CUTy1ul8etvzBYQOGeOx6KvFEGyRqU8
 hnU21afWO0iEOEIg49i5iVO0aw==
X-Google-Smtp-Source: AKy350biFBf92gT3Ot+vlEDfCOjjHsHzUFPmT6A8prWOiSIj1azWL/Sic8j53QSTfixQY2XEBSzetA==
X-Received: by 2002:a17:902:f34a:b0:1a4:fca9:7f46 with SMTP id
 q10-20020a170902f34a00b001a4fca97f46mr11108288ple.11.1681175408528; 
 Mon, 10 Apr 2023 18:10:08 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 44/54] tcg/s390x: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 10 Apr 2023 18:05:02 -0700
Message-Id: <20230411010512.5375-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:10:18 -0000

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index d610fe4fbb..6d7b056931 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1784,26 +1784,22 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
     label->label_ptr[0] = label_ptr;
 }
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_TMP0 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg addr_reg = lb->addrlo_reg;
-    TCGReg data_reg = lb->datalo_reg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R3, addr_reg);
-    }
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R4, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R5, (uintptr_t)lb->raddr);
-    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
-    tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_R2);
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
@@ -1811,25 +1807,14 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg addr_reg = lb->addrlo_reg;
-    TCGReg data_reg = lb->datalo_reg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(lb->oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R3, addr_reg);
-    }
-    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   TCG_REG_R4, lb->type, size, data_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R5, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R6, (uintptr_t)lb->raddr);
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
-- 
2.34.1



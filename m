Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B2BC5AD4E
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:45:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7k-0000oG-NH; Sun, 09 Aug 2026 18:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7j-0000nI-D2
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:07 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7h-0007LR-OP
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:07 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-cb5b8572b70so1314602a12.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314964; x=1786919764; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3xN9uF24PxcjCHBEneq1+0Tduc7DpGTZFeyk6b0loig=;
 b=DJueIR4O1NmSmZa5qs7P7DHtp+7eA/5AlokZKCJlz5ZlVZ8nUYCnE0Pzes3BcfC06J
 0xj1BCyhtjj1Ll8G4xVVL88cxwRrXzkjFDq4+OQAkb19C0Sfz0Swk86NtiPBPqCzlTY6
 3QtG04iGVvR7sAREpRRQAn6wYnkW4xb5XRPBXaUZUVNIWG20ow73qvFX3vutD0Q6fwGb
 7GPyg3tvv8YmHyIvW+1hpW75AK62RFo93F4DhJbimNQ24DDxJylUfY9wcYnofUOQxI+u
 g12Cz8oc2wA/kztHyfEAcwAg9PQePvZdK4CJClstVxPaUJUNWe9G77PilsvZAIoeNB4r
 /QLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314964; x=1786919764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3xN9uF24PxcjCHBEneq1+0Tduc7DpGTZFeyk6b0loig=;
 b=WaDmwTh5TQwl2T3FNS1nb9GAotnec07N6bIgO+IbeKwik8tn7cWU1+ZPjJwJZ66o36
 KRIsMFF0jbf0IOnikFqSYQ/BnwoVPiKS8NFYQ8BP8iWbaTqSVWxwKSzSSsHHQaxE+5jj
 CFChaL1Wy89NxxVblAjvM2w5FX2sahO3jjwihmGVQQJcKQM5vwkslmaXFTOQOh66F1Nu
 HSsZtCTEDsHA0maPLTf9C0hbR+yzFkvS7hIbNqiUHxNuPfx+H7L2hdMd5DV76I7TjK6K
 Zt7ZuOdY45UaxZB+VA3zWaOWK0Vjl9RB92s8qytwdsN+hW5IEBZsZNfY9cv49UrXCCIv
 0UqA==
X-Gm-Message-State: AOJu0YyfELuCQFdtimg7A6B93uDkzsHl2zfBaXRHDxUbxRLGGf44YYAJ
 IqV6XCDdGROkLNZBj4rbFAfPeR8+ETvE2uABA6J11TcqOBG0fc3ZI0nk3Rpt4sIGzZeqBVpq8MH
 v9WeC
X-Gm-Gg: AR+sD13Sl9EEtNHEPLp44G8R45NpkKHBR7HdKcuR7f33UipmbDiBDVCxNHSxUSEvjnV
 1XY7zl9v87/KJX1Z13Wh1QXmt9iSOV7oX2bKEX6/xqlc57Exe7SDjMHcitbT/dXb7ebwIVkFpOk
 5NBOTgJvERfKJ+oJpKYOqurL5CK7BUbpbJgFxvPC9HQLPRWAXHtbZ6c44eSHfT1nAC6EDsZtVMt
 3+VnR6xslrC3JeghMkkZUP498RKEKoVWXgeLYnW3jgGSguG+zd2VYF+fZtjuVnTuXR4I5KvK+ka
 mtq3h7OcscANN3dhvxPHXRDr+Ext94Jv2wP46GNyVuGm7/rc9MCvoxh5UBPT6LjUvP27ro4lNDf
 y0nvU7txWi2rpjwVdFmm7yFm4vsWnz6wX7w/1H6gHwoxYV0+7fL6bxnhySv4hSMs27erlJ2UGkA
 SU6R3Y0pyColhnItsyFlbn+1x3Wit71nQdL+JUGo/zQIMMJ4RAc9vRNDmxHg1YLip3uzodEUGXM
 AZh9FjH9LmuBhaAv6Fx/eGWLBOzNsM=
X-Received: by 2002:a05:6a00:a116:b0:846:bc60:5bf7 with SMTP id
 d2e1a72fcca58-84f2dfcf7f5mr42979532b3a.6.1786314964295; 
 Sun, 09 Aug 2026 15:36:04 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 13/56] disas/riscv: Tidy disasm_inst main loop
Date: Sun,  9 Aug 2026 15:35:02 -0700
Message-ID: <20260809223545.730664-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Unroll first iteration, so that always_true_p is not used,
Drop some local variables and use 'decoders' directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 63 +++++++++++++++++++++++++--------------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 70ea41f125..9880b8de20 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5419,41 +5419,40 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
         .inst = inst,
         .cfg = cfg,
     };
-
-    static const struct {
-        bool (*guard_func)(const RISCVCPUConfig *);
-        const rv_opcode_data *opcode_data;
-        void (*decode_func)(rv_decode *, rv_isa);
-    } decoders[] = {
-        { always_true_p, rvi_opcode_data, decode_inst_opcode },
-        { has_xtheadba_p, xthead_opcode_data, decode_xtheadba },
-        { has_xtheadbb_p, xthead_opcode_data, decode_xtheadbb },
-        { has_xtheadbs_p, xthead_opcode_data, decode_xtheadbs },
-        { has_xtheadcmo_p, xthead_opcode_data, decode_xtheadcmo },
-        { has_xtheadcondmov_p, xthead_opcode_data, decode_xtheadcondmov },
-        { has_xtheadfmemidx_p, xthead_opcode_data, decode_xtheadfmemidx },
-        { has_xtheadfmv_p, xthead_opcode_data, decode_xtheadfmv },
-        { has_xtheadmac_p, xthead_opcode_data, decode_xtheadmac },
-        { has_xtheadmemidx_p, xthead_opcode_data, decode_xtheadmemidx },
-        { has_xtheadmempair_p, xthead_opcode_data, decode_xtheadmempair },
-        { has_xtheadsync_p, xthead_opcode_data, decode_xtheadsync },
-        { has_XVentanaCondOps_p, ventana_opcode_data, decode_xventanacondops },
-        { has_xlrbr_p, rv_xlrbr_opcode_data, decode_xlrbr },
-    };
-
     const rv_opcode_data *op;
 
-    for (size_t i = 0; i < ARRAY_SIZE(decoders); i++) {
-        bool (*guard_func)(const RISCVCPUConfig *) = decoders[i].guard_func;
-        const rv_opcode_data *opcode_data = decoders[i].opcode_data;
-        void (*decode_func)(rv_decode *, rv_isa) = decoders[i].decode_func;
+    dec.opcode_data = rvi_opcode_data;
+    decode_inst_opcode(&dec, isa);
 
-        /* always_true_p don't dereference cfg */
-        if (((i == 0) || cfg) && guard_func(cfg)) {
-            dec.opcode_data = opcode_data;
-            decode_func(&dec, isa);
-            if (dec.op != rv_op_illegal)
-                break;
+    if (dec.op == rv_op_illegal && cfg) {
+        static const struct {
+            bool (*guard_func)(const RISCVCPUConfig *);
+            const rv_opcode_data *opcode_data;
+            void (*decode_func)(rv_decode *, rv_isa);
+        } decoders[] = {
+            { has_xtheadba_p, xthead_opcode_data, decode_xtheadba },
+            { has_xtheadbb_p, xthead_opcode_data, decode_xtheadbb },
+            { has_xtheadbs_p, xthead_opcode_data, decode_xtheadbs },
+            { has_xtheadcmo_p, xthead_opcode_data, decode_xtheadcmo },
+            { has_xtheadcondmov_p, xthead_opcode_data, decode_xtheadcondmov },
+            { has_xtheadfmemidx_p, xthead_opcode_data, decode_xtheadfmemidx },
+            { has_xtheadfmv_p, xthead_opcode_data, decode_xtheadfmv },
+            { has_xtheadmac_p, xthead_opcode_data, decode_xtheadmac },
+            { has_xtheadmemidx_p, xthead_opcode_data, decode_xtheadmemidx },
+            { has_xtheadmempair_p, xthead_opcode_data, decode_xtheadmempair },
+            { has_xtheadsync_p, xthead_opcode_data, decode_xtheadsync },
+            { has_XVentanaCondOps_p, ventana_opcode_data, decode_xventanacondops },
+            { has_xlrbr_p, rv_xlrbr_opcode_data, decode_xlrbr },
+        };
+
+        for (size_t i = 0; i < ARRAY_SIZE(decoders); i++) {
+            if (decoders[i].guard_func(cfg)) {
+                dec.opcode_data = decoders[i].opcode_data;
+                decoders[i].decode_func(&dec, isa);
+                if (dec.op != rv_op_illegal) {
+                    break;
+                }
+            }
         }
     }
 
-- 
2.43.0



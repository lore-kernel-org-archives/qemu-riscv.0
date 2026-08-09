Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85D3C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:37:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC89-0001Go-NL; Sun, 09 Aug 2026 18:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC87-00018N-O5
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:31 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC86-0007Up-1W
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:31 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-ca97d139d5fso1042679a12.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314989; x=1786919789; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0BY9TIRrsUSJx50LoiD28uvbBs5FTX1e/Ge2Ja87Ilc=;
 b=Ga3bTE36iOJmekOLDYguOsKFhOM310JS54Unhe9yf2JkzxucgKxvkR/Ad3h7KcBNvR
 eloB3tVch7vmtYczd7MuFgZtETDodlz3Rgoj8ijo8tdNcsmPKxPL8h7I5LhRUoQDeDgu
 hrRsGrLcpkArUtBvtg58OiFBWmuush/k+iA4BQIbnyVt++/STQ10/jhU5UxpGj3ADeov
 YwS7tVLyjxOPnsIh1h/7HMEDDmLo0G6pc0GiZLMiaBx0NfhD2Tk6b3IAuATEVlCCy80Y
 /GqHvqa5HtrDVa/hw599IMrf7eBvhqrBTnfQJGMvDYYZ0Zho0yexriKeLVJTXbs7sd+5
 Ucpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314989; x=1786919789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0BY9TIRrsUSJx50LoiD28uvbBs5FTX1e/Ge2Ja87Ilc=;
 b=GKrbH7v+q4z4gHQ+hMeQiGfYOYJMc0/neQIpqWWdIzmWLg4rGomoAx8bXbe9I2F6Lk
 ZpW6CspJYqwoFaNf15Bu3S8FG1sUuq1OEoEzijUnQY1UKdkuOsmh3tTnUjosSDAVdq0k
 49FP+b0FOJmId5+UbSMFrLQuY6E7cdICoyzHQarhCH+fLH06Y1u0jFzNUjOv+D93lA56
 lt4zTD934tPIToX157Ts0LexN8C7TxZWUy8gdeZuuIl+pECQHzy3pMIR+1Os9EWeywCg
 FOxhv82y7TGT0D3F/B51Vx8IusZopZZCVWHJDs9d3bIWF+QYHAgnhSz/MHUsmL5vaaj1
 KAvg==
X-Gm-Message-State: AOJu0YyhcV3vNy3FOz4WtyeptUlTjV1FtLhfQ41D3nRP/h9VTtVleNEb
 MugJd22SgsIIMZ6cvpNskt4sNDiBW86wN8vkNGKbTmsVBZE5g/3ZL4dn8pF6Nv7n/D8=
X-Gm-Gg: AR+sD12ShqN0AhzCzpDzwSXs1A3ZTOGhT3/1Y6qpmxBXhFMpPV0F+oZO6VclRNqFpQY
 Dd0l5MloWLaLb4bEuVwMFHjyJEbq3qQcD756gQEpXoUoB9nqu9qRZ0Jpw+iTw2qmpQPheGa80ZZ
 HShJNd01Em08ACiLgZzMazzl6wh5T0LJPtEntz3+bb3AC3lbGrcmjj7AUws8a0GsEZKwkz+7aD4
 d00KItgDYfUgArHigpLcUCwKvvsL+RrCBrarYonUrRz9vHpLlF2lxrAJvkSO7VbQpOJtPFP9fsO
 yYuRBl+QfGYBnnlessWxFWtSChrogyqQeWzsdy1HdFJFdjVqritJ6Z+DboH80m3/6xHyeEGwQjX
 bZ1Y2eqH2c8Ll9/q4Q7fr7gpvL/QOAleyBnAix4FEV1BD+/eqQr5ozK9F+pOZKXvc02IcnVhiHr
 ux/1h9UHOzEkUjQ0ANlZxbMcQOKo8pGCAyHQnJzInSucj0rxBXw7TpTwmwhY/CVFQgmORJXrEZj
 +53ZtT2kGKZIqE0+EAp
X-Received: by 2002:a05:6a21:6013:b0:3c3:7ac4:dac0 with SMTP id
 adf61e73a8af0-3cb85df2790mr48743228637.13.1786314988637; 
 Sun, 09 Aug 2026 15:36:28 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 34/56] disas/riscv: Tidy rv_comp_data terminators
Date: Sun,  9 Aug 2026 15:35:23 -0700
Message-ID: <20260809223545.730664-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Use { } instead of two zeros.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 9904b4db03..bb4779614b 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1072,123 +1072,123 @@ static const rvc_constraint rvcc_true[] = { rvc_end };
 static const rv_comp_data rvcp_jal[] = {
     { rv_op_j, rvcc_j },
     { rv_op_jal_ra, rvcc_jal_ra },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_jalr[] = {
     { rv_op_ret, rvcc_ret },
     { rv_op_jr, rvcc_jr },
     { rv_op_jalr_ra, rvcc_jalr_ra },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_beq[] = {
     { rv_op_beqz, rvcc_beqz },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_bne[] = {
     { rv_op_bnez, rvcc_bnez },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_blt[] = {
     { rv_op_bltz, rvcc_bltz },
     { rv_op_bgtz, rvcc_bgtz },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_bge[] = {
     { rv_op_blez, rvcc_blez },
     { rv_op_bgez, rvcc_bgez },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_addi[] = {
     { rv_op_nop, rvcc_nop },
     { rv_op_mv, rvcc_mv },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_sltiu[] = {
     { rv_op_seqz, rvcc_seqz },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_xori[] = {
     { rv_op_not, rvcc_not },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_sub[] = {
     { rv_op_neg, rvcc_neg },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_slt[] = {
     { rv_op_sltz, rvcc_sltz },
     { rv_op_sgtz, rvcc_sgtz },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_sltu[] = {
     { rv_op_snez, rvcc_snez },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_addiw[] = {
     { rv_op_sext_w, rvcc_sext_w },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_subw[] = {
     { rv_op_negw, rvcc_negw },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_fsgnj_s[] = {
     { rv_op_fmv_s, rvcc_fmv_s },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_fsgnjn_s[] = {
     { rv_op_fneg_s, rvcc_fneg_s },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_fsgnjx_s[] = {
     { rv_op_fabs_s, rvcc_fabs_s },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_fsgnj_d[] = {
     { rv_op_fmv_d, rvcc_fmv_d },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_fsgnjn_d[] = {
     { rv_op_fneg_d, rvcc_fneg_d },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_fsgnjx_d[] = {
     { rv_op_fabs_d, rvcc_fabs_d },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_fsgnj_q[] = {
     { rv_op_fmv_q, rvcc_fmv_q },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_fsgnjn_q[] = {
     { rv_op_fneg_q, rvcc_fneg_q },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 static const rv_comp_data rvcp_fsgnjx_q[] = {
     { rv_op_fabs_q, rvcc_fabs_q },
-    { rv_op_illegal, NULL }
+    { },
 };
 
 /* Convert compressed insns into normal insns via pseudo expansion. */
-- 
2.43.0



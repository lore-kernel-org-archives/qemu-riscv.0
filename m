Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB00C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:38:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHV5-0008Mt-A1; Wed, 12 Aug 2026 18:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUg-0007SG-I1
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:19 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUd-00015w-0q
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:18 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2cace91f112so1634805ad.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573933; x=1787178733; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cA6y19WYR+ZAc4f26QmWU2yJ4TpQFssjUF5z0anUrHw=;
 b=gIDI28BdTTy0m8Egmvyxde9ew4v1zXDR66u+qJqBJMQyVU0DLwjh6TcFdVvVZA1E5j
 26P47eTOZvzgK8Bjsfk4Kq/73Qdcd/ve71vXLoDDKw66HS0EeP486tWEvlDczxquEUAP
 BRUCoqJc7Wy5jLnVvXVs9UroEYTJUrzsVjsS9HCbNojEZ0ApvOo977Mjy9eUe9Lv98Vu
 11iIJs6vTfMKmDaKqr3UBDlye9yg38kKbujt+xKK4LOlKs1I+/bnoQiuKpt5RWcfYhN2
 hiIO6YYkhSUqriR6MRkry8//rijO0jYKQd/ndYKJRnmCmCy6VMyokYz91WSeyVoJwczl
 hRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573933; x=1787178733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cA6y19WYR+ZAc4f26QmWU2yJ4TpQFssjUF5z0anUrHw=;
 b=iW7HkiykpIM/18e5j+KxsyoeNmCKiX8ItgB7KV59nljf0IhXMB4q46V3xJZC4DCpvr
 u3zJJYTLvO1eFQXec3qLfQpoPG4TR5bJS3HkaCFzNG8sMXOh+0CeY6ZMOrYQyWdbGxQb
 oAG9YuISWUu5oOzJVDhcI/UxJIRruXNgsfRln5+TTrYuq/uwCLy/4+sTnl+EXR98ersL
 ofbHSFP7FljL/G9qaM11EXy/2pIxGCYfU9gC7BpIo2drZA1aJFNFW3nocctm5GVhgfwk
 mpoSEBwBAuOglIJHi8adopd+TdN43TKt1jqL64CKny/MLvjGibbto6iq5bohrNjoXtnF
 XtzQ==
X-Gm-Message-State: AOJu0YyvRbCxouxETM3ZjpZWxKOHw+x97ZFcPANZxqvzxBkjgwQ7t+KV
 G/14TJuPkl03pyCml/SWApLvrGBgJ08E97hYSox8QNgoCKiwoFMZ7N2F9dm++TvT2Rg=
X-Gm-Gg: AR+sD11wdRQsMrKuFTG/DE1E3x9u291XM9Sm+mC7kJMYsLUN+WeSf4MO5YVjqRqeQ6l
 r1SZzMJYgfIp5CGbyYQZ6jUm86bJeWVpGmN+Kl3aiS+grQtQ+95XS25AN0/YKyUGNTJWzB/81pi
 6DTRLmbb5ub4AmzmSgX6Gg44QyF4ioYNjV0Z5SFKCn3WJDyhy2lzo7JASVECaWuuBYk6GHuKx/E
 Xd9+NpJ9zExD79tt0l6Fva2d6nH9CxWLT34k8CuePmvLZqNc3z7mWDzI0bCLmgsx/b+oCY8g5dc
 cghA3EZzefsp4RoxJaMP7QU1vm5nVPXy/mWS74x6+sLQsDdjcNT9F+CnXtofLekpiJ+OspWHnnp
 PfbXoGgfq4FHAubAK9BG8eiX1+g1ckxUkELaymFCoV4avE7ifKQbEKtBtSLln8+aEcGYl6VPBFS
 wAqkI81dB+gLcmbyJNlqnlXR0GKWg0+M0TL7l1KpboRM1MkBZXBSZT0peyoNpoyH81ZX8poJB7Y
 XfQuQRrK6AaxMdakiiH
X-Received: by 2002:a05:6a21:8904:b0:3cc:56be:a559 with SMTP id
 adf61e73a8af0-3cc56bea69dmr1168579637.23.1786573933265; 
 Wed, 12 Aug 2026 15:32:13 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 29/52] disas/riscv: Tidy rv_comp_data terminators
Date: Wed, 12 Aug 2026 15:31:19 -0700
Message-ID: <20260812223142.349142-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Use { } instead of two zeros.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index e0b3d22031..f3c9213fd1 100644
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



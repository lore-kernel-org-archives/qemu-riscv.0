Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED19C5DF65
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:34:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUq-0007dj-PQ; Wed, 12 Aug 2026 18:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUg-0007SH-Hz
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:19 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUd-00016B-CI
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:18 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2d032846c95so17504015ad.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573934; x=1787178734; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NKy04xWnqxJ/w1mEDaTYOnGDnsSA7zl91xsEylOSPqI=;
 b=ONTz5EvXN8N6zer3BJp/8V3zhWm0lWnZGD+8fFHuZgZozExevJBOCzjfINMPMMQcBa
 aFp6aKWil0RyHkMNnjYjHVLLdE7DnMIcUE38r5g5D0N3XyjcOcKH20Vr6YEuZZb0Vbcf
 d9oMVxZ7aXJbQHGeFScHozpB1sDDQXicOcpMOo1vCA0dAzEFnDLel76RituRTmqGufEk
 5dKWf1oASt7lLkeAryo3kYMtgDwq3lobC9erZG3MKGA2/zz4ZX1jO7ErzPZ8ZyMUdby1
 lBibrAciD5Qnc3gky0uURp6+tGVLZJO4fva9RDJ3zViTUklkKIFL30x5mEUtPmQtSuVu
 9eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573934; x=1787178734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NKy04xWnqxJ/w1mEDaTYOnGDnsSA7zl91xsEylOSPqI=;
 b=R4qxLLgZ6JdRtgMP7VvpYNGPNjOjYveiWHZE2LQ2WdQeXznF7cYV49ywvQ+NCKYdwG
 PDCgXOUo+fS5k8M39ejokRaK/5a0ys3LSoTrkxy8fSaacfIdc6cIw84jQdF/cYr/mMCE
 3b7Rxwo5guO+X9DbK5RBd7ZK2/08Ixi+D3hREVWxzbB4fbM78y/5Y5nXq0keiTqce3V6
 g5cm+7VqmeCGSWS5UhvTfIm3kSziF1VIONE3oSwLEh7bW8LCPfAnhNJ/oLQ9DSbkgc3m
 HhHDNBABMT5Q4RfD84BNK8xlLgz2Aw/Fa0UXfModP+u8pFcA/fIKdDbqV+E2pFHaHMvB
 JM2g==
X-Gm-Message-State: AOJu0Yw5nlZajykg+fxrMKJzVA8DTgQv3zXT+n5lxS/qUKXeRke5Zs/E
 r1n624cCuZ7ZbVqlsKt9Q/OMGMosugW5TigDZZA1jypBjkaPA88rmSNZK/t2tmADgWCIy/UThht
 d8Mb/
X-Gm-Gg: AR+sD11zO6+QMIAD3z9RYHQTxm6TmYTIrtV0ayOjQ6EooFxKmXImOLlT063ygncsQ3K
 CeTGEhdSvrmJyIGdtgrmBBGtukdK8SiW0ahknyglnoP++Rq/FgZtvxQfAEDT3hG1nabMynjOEDa
 aNEf/HEOpeG24KcHHw29ro/38nPhZInT3ocMUWviPuskQPe7lzKR7+uLAQCgeHzc5Y8MdnbjTJU
 /jgazKiVyl1cYgNT/OW4bb/PaCKDV7FxQzG8TTSvdjNkS+xlL85z/1eDUD9bO8ey9im8JvZddTt
 y5aL+w9HmBL2pkDMk28TeK1BanbLwBktuurTFtYCi+e7FTvDmbj1p8iz5bT5sqvmbBs4FVQIcav
 bks0ozlXYvtnlgtoRbqq6ahMrP36RsMmBmsWLhQBQzAOGzGjcSmUmN68efgJ6eJgDdpBI1fRQdn
 LzxbYQeGNvPH6j8mACml9Bo4K3vCdFWgLurXCHlZUETVLEcdXMYw2KKlyp7wkegtHi6nuZXarEV
 yoRmA7Z2508dwbVtAmr
X-Received: by 2002:a05:6a21:6f01:b0:3c3:7179:a640 with SMTP id
 adf61e73a8af0-3cc54f4b5femr2224639637.3.1786573933896; 
 Wed, 12 Aug 2026 15:32:13 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 30/52] disas/riscv: Chain "ret" pseudo off "jr" pseudo
Date: Wed, 12 Aug 2026 15:31:20 -0700
Message-ID: <20260812223142.349142-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

"jr" has already checked two conditions that apply to "ret".

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index f3c9213fd1..91f6d9e4af 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1061,8 +1061,7 @@ static const rvc_constraint rvcc_bgez[] = { rvc_rs2_eq_x0, rvc_end };
 static const rvc_constraint rvcc_bltz[] = { rvc_rs2_eq_x0, rvc_end };
 static const rvc_constraint rvcc_bgtz[] = { rvc_rs1_eq_x0, rvc_end };
 static const rvc_constraint rvcc_j[] = { rvc_rd_eq_x0, rvc_end };
-static const rvc_constraint rvcc_ret[] = { rvc_rd_eq_x0, rvc_rs1_eq_ra,
-                                           rvc_end };
+static const rvc_constraint rvcc_ret[] = { rvc_rs1_eq_ra, rvc_end };
 static const rvc_constraint rvcc_jr[] = { rvc_rd_eq_x0, rvc_imm_eq_zero,
                                           rvc_end };
 static const rvc_constraint rvcc_true[] = { rvc_end };
@@ -1076,12 +1075,16 @@ static const rv_comp_data rvcp_jal[] = {
 };
 
 static const rv_comp_data rvcp_jalr[] = {
-    { rv_op_ret, rvcc_ret },
     { rv_op_jr, rvcc_jr },
     { rv_op_jalr_ra, rvcc_jalr_ra },
     { },
 };
 
+static const rv_comp_data rvcp_jr[] = {
+    { rv_op_ret, rvcc_ret },
+    { },
+};
+
 static const rv_comp_data rvcp_beq[] = {
     { rv_op_beqz, rvcc_beqz },
     { },
@@ -1896,7 +1899,7 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { },
     { "j", rv_codec_uj, rv_fmt_offset },
     { "ret", rv_codec_i, rv_fmt_none },
-    { "jr", rv_codec_i, rv_fmt_rs1 },
+    { "jr", rv_codec_i, rv_fmt_rs1, rvcp_jr },
     { "rdcycle", rv_codec_i_csr, rv_fmt_rd },
     { "rdtime", rv_codec_i_csr, rv_fmt_rd },
     { "rdinstret", rv_codec_i_csr, rv_fmt_rd },
-- 
2.43.0



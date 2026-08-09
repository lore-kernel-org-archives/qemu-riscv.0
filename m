Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686A7C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:42:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC85-000163-0z; Sun, 09 Aug 2026 18:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC83-00014m-PQ
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:27 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC81-0007Si-GX
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:27 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c9c26a5fb98so738181a12.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314984; x=1786919784; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TSh1lfI0jX+r6FX1tpaxG4Gr8KvWJHl1oy8OeMmCwtY=;
 b=AgDKbotfSZP7HoeSk+5e3DGtFeIoSI6aJ0uZoiXBKR0kiG+EJSDLTlNiYdTT1WnCce
 8uAF8XJMt8ykQb0ouS69IV0rR/jto4p12QC5JsmBt5KpzVHhwVB7+B8aD/f9OftLldq6
 mFCjfenAm60Y80l95m8dPbzrlWEADhoYQRKsujOymtwxRMQOHzjBUifhOGwQgP3TXeWL
 RlKnBp8CAq4eG5I7llwz8aZXj6WbjBkD+4cPW1euSDXw1XUJ4Ud2rkxWrdWwNHIJpz6W
 FZDJVxvfuGZxrWsYogDvzeZBYaY9VXHOU09K2ibgyu39EswybZTla/pqaR5ngqmdKrwo
 8Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314984; x=1786919784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TSh1lfI0jX+r6FX1tpaxG4Gr8KvWJHl1oy8OeMmCwtY=;
 b=BkegmTIFCstJghAzhxmWyWQqTX0mLTjazoUH+1iQN0mZXQbnNEcsm9P3TWjfYOO+OG
 VxpnSGchJNrCO+AjCf6hMNH6BPv+EJx1puYmW0w5PWqNvYk3U72IGmyP280zB/pAfQ+M
 +KI1s2F/r7B+uIkeBSbM3eEDkNDt/EiuoOEMAQN9BaZXRFZMci3mXht0OT8md5K5dFuy
 8gVAgGLwCAFgF4nZqpWBAe3T8AUFwJAmNwLU2bgaFmgRKk5hmsaeHaWhjjIEcwPuyaGd
 CsfFEtHZ3Gg/cA5DMFCdBdfWjeH7OggLZHHmmCpNTmii/+XugtUMQLz4b8SmvZs9Hns+
 HN8w==
X-Gm-Message-State: AOJu0Ywg656jNSyGln6zDD3ba8S75tqYgo+HicPK2I+vA2izm+LO2uN6
 S0UPt/uPFC90p/yKPdUe1ZhzoWA31WreGHmlUQecTOkYhyoowZm9gON+Ujsdp8T2P6Q=
X-Gm-Gg: AR+sD10oAWxREKmT12Sy03rJuAGKIyd5mHIn3dXaPZzQDIWUj5wZmCXAYFU123eySkL
 rnjNWHpMM98huIj33QJiaZ8kfU7l/g4s7B1uwQgSi0hle7TJnVRV46F7gTKTe9r4xYq3lH1xyMl
 wB71Rt7t/WVtZ87wEdTbnO6mf0tD9R9EeTdCdQcAl0nLX0HzZ6H5U5HH5TvB5v2169v7yRU0Ds1
 oa8ykvgrArZ+5ZndmuQJrhAfKdO2AtlqVdodLc2Vtwa5NJdvFZu73x+uqJavZQuipT8vhe7voTl
 vPlTwVbeLBrdecno3J89kuVg7MhWKb/dl0JUkeyNlQdIT5wQMCEHPIba9d0SN3lwXibUKrQO5gw
 qMtmkyGwt8pgXzwsszXKli8RbJ5TauJ35C0Sozljl/ryQzRlY/ztbYwhq4wd12F89KPGiDNVCC2
 8fRkgta4qk9s6T7sDf4JuQPN2L06WQsLyhHvlhJqrZPM2TmLVcuKLFDbsx3sntD11V1ZU/ain7G
 iofQPDDgaxvzPEc2Q8m
X-Received: by 2002:a05:6a21:4d8f:b0:3bf:651d:fee0 with SMTP id
 adf61e73a8af0-3cbd3a9bbaemr15063620637.19.1786314983897; 
 Sun, 09 Aug 2026 15:36:23 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 30/56] disas/riscv: Break pseudo loop for jal and jalr
Date: Sun,  9 Aug 2026 15:35:19 -0700
Message-ID: <20260809223545.730664-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

These were clearly intending to simplify
	jal	ra, foo
to
	jal	foo
and similarly for jalr, but the pseudo expansion looped
back to the original jal/jalr with the full format.

Add new opcode expansions dropping the implied ra.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index d3cbfb86ac..fe503b6cae 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -326,6 +326,8 @@ typedef enum {
     rv_op_bgez = 295,
     rv_op_bltz = 296,
     rv_op_bgtz = 297,
+    rv_op_jal_ra = 298,
+    rv_op_jalr_ra = 299,
     rv_op_j = 302,
     rv_op_ret = 303,
     rv_op_jr = 304,
@@ -1029,9 +1031,9 @@ static const char rv_fli_name_const[32][9] =
 
 /* pseudo-instruction constraints */
 
-static const rvc_constraint rvcc_jal[] = { rvc_rd_eq_ra, rvc_end };
-static const rvc_constraint rvcc_jalr[] = { rvc_rd_eq_ra, rvc_imm_eq_zero,
-                                            rvc_end };
+static const rvc_constraint rvcc_jal_ra[] = { rvc_rd_eq_ra, rvc_end };
+static const rvc_constraint rvcc_jalr_ra[] = { rvc_rd_eq_ra, rvc_imm_eq_zero,
+                                               rvc_end };
 static const rvc_constraint rvcc_nop[] = { rvc_rd_eq_x0, rvc_rs1_eq_x0,
                                            rvc_imm_eq_zero, rvc_end };
 static const rvc_constraint rvcc_mv[] = { rvc_imm_eq_zero, rvc_end };
@@ -1068,14 +1070,14 @@ static const rvc_constraint rvcc_jr[] = { rvc_rd_eq_x0, rvc_imm_eq_zero,
 
 static const rv_comp_data rvcp_jal[] = {
     { rv_op_j, rvcc_j },
-    { rv_op_jal, rvcc_jal },
+    { rv_op_jal_ra, rvcc_jal_ra },
     { rv_op_illegal, NULL }
 };
 
 static const rv_comp_data rvcp_jalr[] = {
     { rv_op_ret, rvcc_ret },
     { rv_op_jr, rvcc_jr },
-    { rv_op_jalr, rvcc_jalr },
+    { rv_op_jalr_ra, rvcc_jalr_ra },
     { rv_op_illegal, NULL }
 };
 
@@ -1884,8 +1886,8 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "bgez", rv_codec_sb, rv_fmt_rs1_offset },
     { "bltz", rv_codec_sb, rv_fmt_rs1_offset },
     { "bgtz", rv_codec_sb, rv_fmt_rs2_offset },
-    { },
-    { },
+    { "jal", rv_codec_none, rv_fmt_offset }, /* rv_op_jal_ra */
+    { "jalr", rv_codec_none, rv_fmt_rs1 }, /* rv_op_jalr_ra */
     { },
     { },
     { "j", rv_codec_uj, rv_fmt_offset },
-- 
2.43.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A19C5DF65
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:38:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHV2-000885-9i; Wed, 12 Aug 2026 18:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUm-0007ah-AT
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:24 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUi-00019I-W0
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:24 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-84e3007a2b7so90870b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573939; x=1787178739; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2MEPpwP7V/VysUFPJnM82l5c3GlLv6c1vZw6bhKwsxQ=;
 b=yONCBxdU3xdP1qUQXOln/2i4MLzRfC0sMamDBSqNEUnKQ71w3tBfvrOyBsJ9ulFHq+
 pGo70jTADmhzgYPUMaCk5VQPMesapFVsa8rv+rNy2Ktl/gpxUN4LAOYropebO0PU2RtQ
 NsZsrMMBXWjyUSJzikOmya0t9Zhm2KGoEe1cNqhxOrM1wt+esNGtgleHa7eWAaW3cWxN
 cl1iG9bJkYeXQzsgqHDU8tkoVlPXWzSARBwiflF5vQdPYguSZ8i2l3+LVJb8ElIdcPyI
 in/RX6IGQr59w04NJVk8Zn8np28hRnNvoZ3QNowtuZEpJh754kWT9QI7bCzMa8VNNGGh
 itlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573939; x=1787178739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2MEPpwP7V/VysUFPJnM82l5c3GlLv6c1vZw6bhKwsxQ=;
 b=TEIb9nGaXJ28ByzzOrFr/PhKWY8RBgcIuX/r0EsjsMMyx61EQm/vZvYN5gUcu/EpJZ
 tvqz8QXJjExlm39UvvQYgiwpSRdZLTPsLGyuOpuwkSWoQN1SWYZCKMzqtb9FSruFPs+x
 GBTxjGGpYqDxzB8Q+XxEXKpIr9z9/AgLyYYdl8qoX+jKQaAO9kqNQCrxWMc9UA50DOVs
 1CJly3/V4r5xsf+FTqqmxhjCP0ZwvXNIoboFXY4ZcQIIe46+nVAyPJcYJo6XRqa/5L7I
 K72JjAczsn1NNQPvSa08KH+5ct+wPo46slZnSr7yFYIld7XTDVyvt7xkWfUmkLuxjzm7
 nEFA==
X-Gm-Message-State: AOJu0YyBzOVjoGYRN38mLvE18pzF5kdKjGxyWSCt3qWqdpi0Kdpq4sc1
 1MFtjMr9tvIYTFdd+ojEaPc33VGoGAkS1rn3zbEi7sglaxoCYGuPbpMld6EP+RjycXDh64pXrkx
 53vUX
X-Gm-Gg: AR+sD136GUABa24y4D+9mdUqtcEbaIWHMVp8cHt/ucc5Rv+NS3N/PMWwzcV5pV37npb
 KMMQyx0GyLyG5hNNhxa8lkayTUXhccVe+tLjccgTYZpM7HTNpk6kVn7OkfgWiqkJi6HMg/D7THk
 Bakf8wTNSmAOz/kY3s7MEKa0TAg6gqrYoSCec71rOVPcaSN0+u5ugI9vnPo1/fmnZeSpbszURZc
 tIiMOzcb86B9ABBELqTRvQVfZwGN2a1IoY0yoo+HRQw3NYo5SgFtGLaidXwZZQNS3RHFBHlU8Q1
 GHllNq++pQlgFkohEsH6IN2/n/OAcdLorhXuCBMr7L3cxynv49hXLoSF73r2FROXlNR871u/XK/
 7XXSGE+jnYXupBgoBvlXgdfiYepFxi23XiTq5sw6hJwI0YmregXAVQ47SDK9Zb36GRcvUeFlL/i
 scLCIJlZQfoImdqyl5IOF3P83t+5yx6jn+zC1ai+QXl16o5nk6zt3qA2l6Ol5Z9orSlrFCB55ij
 9UzqX5xDuE8bRHWByGepGi2PGWl1xI=
X-Received: by 2002:a05:6a00:1c92:b0:848:44c5:f801 with SMTP id
 d2e1a72fcca58-84fc763c541mr1216291b3a.33.1786573938928; 
 Wed, 12 Aug 2026 15:32:18 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 37/52] disas/riscv: Reject all of OP-32 and OP-IMM-32 for
 RV32
Date: Wed, 12 Aug 2026 15:31:27 -0700
Message-ID: <20260812223142.349142-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

These entire base opcodes are RV64.  Reject them all at once
rather than one at a time.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/disas/riscv.c b/disas/riscv.c
index 75c2fa11e6..e650ad7688 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -3311,6 +3311,10 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 6:
+            /* OP-IMM-32 */
+            if (isa == rv32) {
+                break;
+            }
             switch ((inst >> 12) & 0b111) {
             case 0: op = rv_op_addiw; break;
             case 1:
@@ -3557,6 +3561,10 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
             break;
         case 13: op = rv_op_lui; break;
         case 14:
+            /* OP-32 */
+            if (isa == rv32) {
+                break;
+            }
             switch (((inst >> 22) & 0b1111111000) |
                     ((inst >> 12) & 0b0000000111)) {
             case 0: op = rv_op_addw; break;
-- 
2.43.0



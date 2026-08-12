Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275C7C5CFDB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:34:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHV0-0007tB-Oi; Wed, 12 Aug 2026 18:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUl-0007Ys-ET
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:23 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUi-00018u-Uh
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:22 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-c9d1fff21edso1148966a12.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573938; x=1787178738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oP0xPjlLzI3yratNAQYhA0C1+FXrDvewHgZ6UdllNaY=;
 b=VXAZKe9Xa/GI6dO/Ec65v7DCpW5M2AD5tnnR6puLQB+MnmcQubZodFzebwdNWBMOPS
 sb9Jk5snTKDvWvURnynTKcsoUfhVdIizJ4UaWW0YaIQYiEsYJm0ZNJRvLPjW4jLRmsn8
 EsrGy+Iar4lCaXTToz4efwXcAPgbaiDgx2pJst6PsUEpxauDiAD2nc0Grwt5gV9YVxkW
 wNZV3O7pBe96yx6KJbTjVQF+25Dmohoppikows7UPRefVAvTwIBGg1ZbAIfHvb8QgtMR
 +JNkThsBLw9Z5b2a5O3pTa181TBeAB5rNcJOLV0tjhjR8bH3gfGrvrMG2WUbbyTVFDet
 +hTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573938; x=1787178738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oP0xPjlLzI3yratNAQYhA0C1+FXrDvewHgZ6UdllNaY=;
 b=R++bzxuX862L6Uh8wpBGWBfqC0sKaKgfWclg2tH4JsB2Ccx+FXFuqGb2HKQt7vt7Cu
 b56g3G9iCcJ8P07UvHiuwiP1nef2M9V1FI2EVDGdcxP/Fd58Le31hdDDM4yGv2+w3Y5V
 iCZEK+BK1Mnxyel9Z6GEZ1yr9AtBH4c22q9d9+/7Pd38XFX8I9+I7DzzBf4jFIQxi3TO
 Yh8pCaW34FzqsOaq8FcXHROe7bsoOjuuAfHI2d/aKSFSWH6hNGU33E93GvvZMlMkZ9di
 JiOYuQVx0hmwyeW5xsuFBiIkqw2A57AXG8XyFhr9w6y2q+BdIJ8FT2wJ3R60MRVMY5MR
 KsRQ==
X-Gm-Message-State: AOJu0Yxb61Guyoei7u8yVqBrRCsLH8IrsRJXGmh4P6nGaTZB/EUEmPY7
 v7zNCThmoWk9U8o23WMCLHezU6Z6874UI5K0V2tssDrFuTufM9wICOy9EGKL6e62o6y9ebqhXON
 RBWG0
X-Gm-Gg: AR+sD11S1mnrFL7dKf4sfWn7b1sPGwoQ/qkp/0cJ331J9wq5n5++EQxV6NfKupLskGk
 9H/RU+1T1mJE5asrNaS6jaHZNibA+lhMupkWTfBH/h/kUU8YVAQxPVjcZdrMI7WAwfQeGcPAKn0
 EXBWWmQ32DjfnODSPBkoX6ypTvfLOV7fOKYi5JJeK0rNYh5+ikUm1asgF6zUgoLjHxF9nwtyY2y
 xQNPgbMvf/ZOmIQGDGlZxHsdVmJBH5MdwGcMWy6AR9T8bZ1GMeALJnSgzPElgLXhUlH1HBAYbLI
 YddZ1kVkVASKDzIJDQJMpp84FxW1QJw3Nh9cwuAyUmnOXx/S4bpMMODJeLnKW61/twwTIqd9mhc
 XKhn+vmgOCz0322xdRpX8pPSdWOjSYDdzUG+C/tsXj+sgWrdJapjdun+lZGH76V+e9JFv37uiDY
 RHjQ9hyaHxbNRJmGEEkX8JlmSTPnkK8xmMRS1nRviMmf4a8ybPKEvuu180/8Rp2K9Op2jKD31Zz
 g9D8k6izske+so38H+a
X-Received: by 2002:a05:6a21:168d:b0:3c4:511e:26ab with SMTP id
 adf61e73a8af0-3cc550619a1mr2170310637.3.1786573938303; 
 Wed, 12 Aug 2026 15:32:18 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Alistair.Francis@wdc.com
Subject: [PATCH v2 36/52] disas/riscv: Skip post-processing of illegal insns
Date: Wed, 12 Aug 2026 15:31:26 -0700
Message-ID: <20260812223142.349142-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index bc86cb866a..75c2fa11e6 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5321,12 +5321,14 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
             }
         }
     }
-    if (!op) {
+
+    if (op) {
+        decode_inst_operands(&dec, isa, op);
+        op = decode_inst_lift_pseudo(&dec, op);
+    } else {
         op = &rvi_opcode_data[rv_op_illegal];
     }
 
-    decode_inst_operands(&dec, isa, op);
-    op = decode_inst_lift_pseudo(&dec, op);
     return format_inst(24, &dec, op);
 }
 
-- 
2.43.0



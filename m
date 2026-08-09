Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A46AC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:36:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7X-0000fE-45; Sun, 09 Aug 2026 18:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7U-0000de-4L
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:35:52 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7S-0007GO-H8
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:35:51 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-c9d1fff21edso880913a12.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314949; x=1786919749; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+47W1dMYD4zx8+XNZWBhMOb1gbJPKHgkxxVD63BRs5o=;
 b=fkALENKKNGDgvym3w6UxOleaazz3KgwAykMI8oWQyN0H/XdMV+eE3NXKb/6N2Djtt+
 vvNguf+qd7He9Pc1JVnMF4j/CjsE0IETOJA9zbDI+M21Pcxytz1mAHBskobj/+aK1z/g
 WkcpmVicE/EVeXujKPtTKFD9eoXzUyy27F7M0ukqnAqt5aq/o3JbP8imdcO87e7heUnO
 +w7YyWh2VyF8YFZtajaafeZDpiCCsBC43CX4iijyyZeNZnUTORBrHwje33kDAWzPvT/l
 9InMTytAj2E3+3t69EqnJ3t9IIWq9XMFAdGMw2O6TinICSthrgK6GwgOh9K7nfbtpkMT
 ctYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314949; x=1786919749;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+47W1dMYD4zx8+XNZWBhMOb1gbJPKHgkxxVD63BRs5o=;
 b=W+ZoJV1njrYuTKCJeAVq1+Ugnwg0phuQCrBvDrAaM0QyQJ4hwpwxmHYxBIJqmazJq+
 eYKehSpu7Yac1osIQxwyGsoKLKhU+mR+CrAjIxXzwMfL7VUTditP5j8eu1wgae7cG+J0
 JHy9fMl7Z8lS1W/uMgS4HTdUne132FDtixwIpbVoaBBBd1TSm5OtJqNB1su8Zba8EL+M
 9lxiPY+WfCRjRLp0dr652Evq2ew83XN3UhDFb1tJCZFtboUCHhhfOQwOrrqKpCLTm32o
 /jtKHgmMaakirfnyaYOYaUvhF0ZLJIh4YMMYYf0Gx1fGysgJCKNWHPs/LAocOaerLE9W
 0J/w==
X-Gm-Message-State: AOJu0YzQD+QnIKwd5diK9QhlM9YULNWwHfOmn+ufmWzEeDMExGnXBjin
 06EfDoYd5MnE+/5HwRaaLqQLTh3JoL7SDPxhLG96ANHlvxockPi39kkJkXsFlJ8FLTg=
X-Gm-Gg: AR+sD12Ktl7ai+GJqQb5KpuDdVTif9cTUEdjvMfXXPi9TXooxFOOUvLd/wR14r3X12y
 xLBERLa92tm/JJ4LmdPRZU9CXR7T875NUIXRLuPimWE+pc4MXUnYC+QJCjHP3fTQpcPiOaY1Qag
 FPgzn/HT4k203ptvs3qpC4pORKp9iP0R23sIVzFqj0naG9jkrcS5E7KRu9FQPvTk4fVo/Yzioy+
 sP5JLPaZmzq2yrstqpdECH6AK4nE+boPkj2yqH37tIIPuaAljPPNnL5+HAyZP4z/+NnV87B0KHb
 k8UxECVU0+FH2xSbtEnCw3QKtSgwJNK+bNef1mM5JdOHBxSIfR0AnGNlVK+LyBK/W3hu72bNKS5
 5CGUNn+nNTTI7AbNQ2Ex/ZEwrCjoBMOE4sOkVm2CbtDs/fxVCmkjVaKvGjaCQi/nJVVwS0s0aQy
 J+FrM1GiwrVHjxAM/JYbKnFnYyI6BalTjh/BuUxgxI/E6Z4G8C/l7rjTOVWcqCZqyPt6FTFGaih
 eVZAVgPrHwJTWutcuqY
X-Received: by 2002:a05:6a20:3d1a:b0:3c3:719d:dfe2 with SMTP id
 adf61e73a8af0-3cb85f4e179mr42084703637.36.1786314949015; 
 Sun, 09 Aug 2026 15:35:49 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:35:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, TANG Tiancheng <lyndra@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH 02/56] disas/riscv: Fix 6-bit immediate extraction
Date: Sun,  9 Aug 2026 15:34:51 -0700
Message-ID: <20260809223545.730664-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

From: TANG Tiancheng <lyndra@linux.alibaba.com>

rv_codec_r2_imm6 is used for XThead instructions whose 6-bit
immediate field is encoded in bits 25:20. The old expression
left-shifted by 38 and then right-shifted by 60, so it kept only
bits 25:22.

Use extract32() to decode bits 25:20 directly. This fixes the
immediate printed for th.srri and th.tst.

Fixes: 318df7238b9f ("disas/riscv: Add support for XThead* instructions")
Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Message-Id: <20260703-b4-disas-xthead-fix-riscv-next-v4-2-84c566330bc7@linux.alibaba.com>
---
 disas/riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 7f1b262773..fdf75a12ef 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -4546,7 +4546,7 @@ static uint32_t operand_zcmp_rlist(rv_inst inst)
 
 static uint32_t operand_imm6(rv_inst inst)
 {
-    return (inst << 38) >> 60;
+    return extract32(inst, 20, 6);
 }
 
 static uint32_t operand_imm2(rv_inst inst)
-- 
2.43.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D89EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 21:06:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLrrr-0002pc-Ne; Tue, 18 Jul 2023 17:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLrra-0002ao-8d
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 17:04:06 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLrrY-0007Q0-QX
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 17:04:05 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6b9edef7993so163639a34.2
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 14:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689714243; x=1692306243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mkt2khv3HlTYD2I5HX8C8vkoqmlMW0ZXesjrMFYxT0=;
 b=DBI+qYkK9W6vu3hfBpefdykWCaqqnFeIxxPxXKspstirayWCG6Zf72gv2MSStuDF8G
 wAZ+9ccBM+krXF04W6YbcTIpibzA/9mDynPiXcKUh7Va7Vv71Y225tSyVlZwrYkTJO7/
 KM8B8t9WOj33Pr2I+q5UL4Lr31y1GubmLDNdbCPN0nE5RvQQPog1pVqR0hGafJTCbPvm
 ewRl1tQBLSr6P3lJ80dCLgdM0k8of7/sFJOIAh6dy6PgFqzzgzBnVmCrskNGxTL3v8mK
 13cMMjeXaC1Ji3P5IExRzPUPUbCXYT3Yv/3OTpnu7kFZddiWKf1AIcZnegGJ3zmDvjkj
 zWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689714243; x=1692306243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mkt2khv3HlTYD2I5HX8C8vkoqmlMW0ZXesjrMFYxT0=;
 b=dTuOxkUfmmQWoTYeGY99mxHXZ/8pEIR3woWQ5eSUdQF5HHboFEEsGKGCA00R8Rpn5N
 Dma0U5N0VO6oeSssk0NF3hrnq1NbkmvMIM7M2C2zGiTL6kc/VW4a1faG6/BRR3lMJ1A6
 5bjD9jlvkOCrJp8yhI/hVy4Nz9/MmzDDNhJY5MdV6Ezf3d70D+pVZFONvtnO9JrN1LzN
 pbqp/Mtuf/94RgefLoVa521pUXOoR3apXkYlSChVJy5lrfe4Dr4Q+6MdiIMgvkwOg6I0
 o18If42E7qMV1BiV+qJNQNLzHoW9WSgnQSoXnVIT3jiopjaCRxMcNYcu8zNANx925lve
 qMeA==
X-Gm-Message-State: ABy/qLa+G5Ue6TTmjvRjoBwfwt0Fges2EqyojFCpDK7C7vlxlzFCbMw/
 5eWtccN7RNwSrHxB7VwmU+w5Rw==
X-Google-Smtp-Source: APBJJlHzufT/LL0gNoaUd+kv7YJsL71rEQsOfqSYhtI1Szmjv640+EMIZpeEDB27T1IFdSQNNScoXA==
X-Received: by 2002:a05:6830:22f6:b0:6b9:50a8:1e76 with SMTP id
 t22-20020a05683022f600b006b950a81e76mr4162228otc.17.1689714242950; 
 Tue, 18 Jul 2023 14:04:02 -0700 (PDT)
Received: from grind.. (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056830140200b006b96384ba1csm1160657otp.77.2023.07.18.14.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 14:04:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v4 10/11] avocado,
 risc-v: add opensbi tests for 'max' CPU
Date: Tue, 18 Jul 2023 18:03:28 -0300
Message-ID: <20230718210329.200404-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718210329.200404-1-dbarboza@ventanamicro.com>
References: <20230718210329.200404-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32d.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add smoke tests to ensure that we'll not break the 'max' CPU type when
adding new ratified extensions to be enabled.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 tests/avocado/riscv_opensbi.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
index bfff9cc3c3..15fd57fe51 100644
--- a/tests/avocado/riscv_opensbi.py
+++ b/tests/avocado/riscv_opensbi.py
@@ -61,3 +61,19 @@ def test_riscv64_virt(self):
         :avocado: tags=machine:virt
         """
         self.boot_opensbi()
+
+    def test_riscv32_virt_maxcpu(self):
+        """
+        :avocado: tags=arch:riscv32
+        :avocado: tags=machine:virt
+        :avocado: tags=cpu:max
+        """
+        self.boot_opensbi()
+
+    def test_riscv64_virt_maxcpu(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:virt
+        :avocado: tags=cpu:max
+        """
+        self.boot_opensbi()
-- 
2.41.0



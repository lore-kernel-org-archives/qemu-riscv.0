Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68820C6FA8F
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:18:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZIc3-00083s-Cn; Thu, 24 Aug 2023 18:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbn-0007p2-MJ
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:29 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbk-0006Ek-RR
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:19 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1ccc0d2e697so224517fac.0
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692915315; x=1693520115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pO3wz5fop7wDys5r1Ax7UI+xFmY6OiD4k73j8kol0RM=;
 b=N2fczt3dhPAEILgdP6fgrKOTfx626sOGK1B0GLWJD8ZiL1KEdGHChN84k3akxC30Yh
 8Rf8sSn/AIItk+K0ZKgKhC07DU3QxpmZCu4RKck9mcMIVCsuojZAeSVHAcLQThJKr3s7
 57UjJvE0wQ/UGLGx9JUtLRTGzMSMDxorxz1aHYl0ZMr6smdZf2Y3/AQaTUIP4hGRqcu3
 SQm3NMrclsUDnTR4B7BUOY1zGVYVVPlKmRH/9LepyGPksxMlYZGsf1bKDp6oQIi1uVF6
 HlGo0Z0mpboA7SETEOkZr4MaoiSa6EyRzfe8f2CDsDk7zq+o0XvVbmY7zDEsp4j2UJCv
 KjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692915315; x=1693520115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pO3wz5fop7wDys5r1Ax7UI+xFmY6OiD4k73j8kol0RM=;
 b=ioWjrKGOlmgh5KY9sxIpQMhNzAd8LcgFSy4h31vz0q2Prf0/p9iv0NbK0vP9LIUU5W
 6cWn6HatQQ98TIMqXv2t5Pc2TY1BpjoTrGuPESi1yUExzhdelRBO0ezNMWtvnidZIw5K
 Sha5G2rrDzIIm/jKt99j02SoaNMiZ2HUrGY+pDmjyh3ALM9yUbZFCG5I6GUPLmbB+5U+
 q27NlsbDiM5gM3lA4q/ZjjOXSWU3JS8rZZ/yyZKEW/ddX7kRJdRZRhOvfiu2JKFNPyrY
 gO0zAdKdlzMTl23I46DGGYvpsBQUyEEDCxGhnVmJ92oUXa2+m9cfePVL874XiIQF01FC
 NOxw==
X-Gm-Message-State: AOJu0Ywjhoamj0MFHYi/sh5ownlAbQ0RT0olz0+s3YMcGmCIYpYIXWAY
 U7tNrNM2a+T96xr3hEzdYJbteQ==
X-Google-Smtp-Source: AGHT+IGPSR20a6p7ErqCKnR6/dUQUXU/h1cnToeTkQkQCLl5n+haZEr+Bme0FS04v5F/nuDx7MxY1Q==
X-Received: by 2002:a05:6870:808a:b0:1be:d49b:a3c5 with SMTP id
 q10-20020a056870808a00b001bed49ba3c5mr1085055oab.29.1692915315527; 
 Thu, 24 Aug 2023 15:15:15 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 o129-20020a4a4487000000b00565fcfabab8sm256338ooa.21.2023.08.24.15.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 15:15:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v8 11/20] avocado,
 risc-v: add opensbi tests for 'max' CPU
Date: Thu, 24 Aug 2023 19:14:31 -0300
Message-ID: <20230824221440.484675-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824221440.484675-1-dbarboza@ventanamicro.com>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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

Add smoke tests to ensure that we'll not break the 'max' CPU type when
adding new ratified extensions to be enabled.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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



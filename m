Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95A1EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 17:20:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMXKT-00005y-E6; Thu, 20 Jul 2023 13:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMXKJ-00089w-10
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 13:20:32 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMXK2-0004oY-3L
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 13:20:30 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3a3ad1f39ebso1395960b6e.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Jul 2023 10:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689873609; x=1690478409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mkt2khv3HlTYD2I5HX8C8vkoqmlMW0ZXesjrMFYxT0=;
 b=ZRmzzzfwF6gsXbKrJ8642ga2z9t3M920KdSrjWOk/oRvWPfJmuwARTsuNrl+qRjfPf
 nf/d7HKin7/RMIM8o/zyBM1GKQDZiDQDevOtJcsqYaUIu93OG9S/I1TBMrksiAR4HA7a
 pYoqvUv9XFG3jK0VmO+nMPGtcYa7FKxCD5goJy8OHfeHjYooJLMYAnUEDwbGORaxs7x/
 YregULSMemmI0hlPS5WJRvp848W3v7mtDJQRVHw8CApiLmYg2oOTBLn45I0ZLfy8ZYMe
 rt+pU8MRhyPYujWRkxxVFI+zsUJsSPDby1PNia6lEDv/JgDo4wLvMPunELS+Tx2VWg5Y
 ROOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689873609; x=1690478409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mkt2khv3HlTYD2I5HX8C8vkoqmlMW0ZXesjrMFYxT0=;
 b=AmVsVBdn5U/DBndGFZJXjrrCDX4F0+TEPfDI/FjsZZI8VzNoMFa5G2u9WDsCRL4UAA
 /QUAE5BzmCIvwm48mQouL9axMrvv2IIAYSi7c6XqWSCWC1KtG0FGw1nO+QeACXVUe/tN
 Gu1Q23PJwutTT8TIlz6epWyDjFDc25z7flfGrciwrHmQKngsAaHoCkpxtI8m9yUTqsUP
 L5fhppekAZXm3A1MgkXDzme4I8WSQjktjV5RUoYbRWBOUHAYzSk+oYAQRMuYRo2AwTvJ
 LT3gw6PdUsbC2PJQ9W1ncacD50Z3QGicbV1biOpT0MHyNKSej+7E9l1RqHbJ8R9Tx2jn
 mIsw==
X-Gm-Message-State: ABy/qLYjyqGegLcuXUl8CB6YbQrzh9gLyTChq/OOwQowvNfuaqZi7lxA
 ftlA3EKyGR+V1j34Htmfr0HWow==
X-Google-Smtp-Source: APBJJlGwBh2kFb966wrebfiu4wERvyRCr/UIEGJt4QVaZoCaW1jiepZ/jif5DUHKsk8SIH+/s4hn4A==
X-Received: by 2002:aca:230d:0:b0:3a4:8e62:d9f1 with SMTP id
 e13-20020aca230d000000b003a48e62d9f1mr121486oie.1.1689873608763; 
 Thu, 20 Jul 2023 10:20:08 -0700 (PDT)
Received: from grind.. (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a4aab02000000b0055975f57993sm582564oon.42.2023.07.20.10.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 10:20:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v5 10/11] avocado,
 risc-v: add opensbi tests for 'max' CPU
Date: Thu, 20 Jul 2023 14:19:32 -0300
Message-ID: <20230720171933.404398-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720171933.404398-1-dbarboza@ventanamicro.com>
References: <20230720171933.404398-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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



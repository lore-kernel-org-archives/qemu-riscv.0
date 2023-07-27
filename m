Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D69EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 22:32:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qP9BM-0001Pe-D9; Thu, 27 Jul 2023 18:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9BL-0001PM-L7
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:10:03 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9BK-0004x9-4H
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:10:03 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-569bad45b63so1590271eaf.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690495801; x=1691100601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mkt2khv3HlTYD2I5HX8C8vkoqmlMW0ZXesjrMFYxT0=;
 b=Lwdha/gIYdC4/GM+l6EjL7fY5LOJkczjSyGS+G6LUdiRD0V/km1u4bmOP+oe474DRQ
 KAeaSFSHCd2uwmOfrV3X4emFyfvbzRg53Ktu1NwTzJO3P3FwbnMF2LZlbw8Y827T3pbV
 ygW5D/7RRlfVbxkksdg2G/yGf+b3B8IMpSycmX+KVP2xe/NVPca1etq67+CS049sZMfz
 AO2wIcLMKvp2slIIRXkefzOQffQ396MWa1LsWiMbuhC3Lt49OFZ3gAS2BWjBY+dSQ1nP
 lnFRwnDy7TlIxAqGhZgVP+fofiZf9h+uQqOzg4HBzkLxxwDoTsJw5ijJbbiURtd8kz5M
 37HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690495801; x=1691100601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mkt2khv3HlTYD2I5HX8C8vkoqmlMW0ZXesjrMFYxT0=;
 b=V26zd3k88O/FjEuqzaYX/kP6SYIO45OUkgAP+x1iSMFKtdNULCmJNmrZGATU5tZPwS
 1x+3mmk0GYAnGHmFfuKq8B81PMJrq+QI2ZR0wIfdWVIKTuxAXZnBLe+9onZI3m9Af5Tk
 /c4yZKpLqhWB8tN5kGApnbOe+bXe2oU6V28HgD147GZz9oTZROGkeajEofe1lA9RXZMT
 Jrnsgi3866tVo1t+WQnqL0nkmDs45jYkT45wv/TKxo9iUt1nDroFeVU8nEYeloMnlDZT
 uvRzEAoQjdDAOE/REPz6GUnoCuADrkMEf5oqGpf6f3mOQsTQD1OkWVkwJAgRi8LmMYXy
 uOLQ==
X-Gm-Message-State: ABy/qLb0mgrPA5ysrnXKniXRgBwhnyNdyBI4jtyI6ZcRqwcosJ8GY/Iu
 iHYwohRnbV5jmyMs8LfOAUPbJg==
X-Google-Smtp-Source: APBJJlHG7i18R7Hn5NvUd7U1TneQT0lhYxBJykJ42kr0UIQsWHrBrT+XFxIZE6U18TdaTW4Nl9CkEQ==
X-Received: by 2002:a05:6808:3081:b0:3a3:9b4a:3959 with SMTP id
 bl1-20020a056808308100b003a39b4a3959mr3520970oib.17.1690495801112; 
 Thu, 27 Jul 2023 15:10:01 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 y136-20020a4a458e000000b0051134f333d3sm1070471ooa.16.2023.07.27.15.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:10:00 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 11/12] avocado, risc-v: add opensbi tests for 'max' CPU
Date: Thu, 27 Jul 2023 19:09:26 -0300
Message-ID: <20230727220927.62950-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727220927.62950-1-dbarboza@ventanamicro.com>
References: <20230727220927.62950-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



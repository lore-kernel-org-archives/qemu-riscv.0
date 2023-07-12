Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F277C001B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 19:03:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJf6Y-0000rt-Cf; Wed, 12 Jul 2023 15:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJf6S-0000qV-Ll
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 15:02:22 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJf6Q-0006bZ-GO
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 15:02:19 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3a1c162cdfeso5510599b6e.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 12:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689188537; x=1691780537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mkt2khv3HlTYD2I5HX8C8vkoqmlMW0ZXesjrMFYxT0=;
 b=G90fywXRVjNZUxwCdKf2gXLAd7OFLWk74RkJN4o4DQl9/+rfUFN9As3xu5nCGdq/8n
 vUl1E3R31mDJh8+EoiHND40dZRKzL17EcpylIiJCS4ljAlo6AGrK8aL6Z3Y0w3i8WWQj
 Lr2x3fdd0BfxJUqPqAvAh0w0IFtLlQAXA+cJVJo3vHlzhSuMiqMhjidhrbDRX8VYEgXM
 othMn7VvZTTcNse4691CDbOX2ECu9QBT1ywcB0G3P2n5k4NHUcVwaT6tiBHm3XRhxFcW
 W8Hyl1zUNwNJlKURY9sdUKUnFI9N7RVBcndTG8JAddXgXlpSImvN714H5k+snTNXWard
 EekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689188537; x=1691780537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mkt2khv3HlTYD2I5HX8C8vkoqmlMW0ZXesjrMFYxT0=;
 b=ZT+Fb0UvtVQBO4n34g/m/3ZlqvrxmYt0vVCstGSFX7UR4PBnHPUIgbMcrGfbxWuBWf
 y8F601nkxLnunza0Xhwt8MuNtij9z2P8Y2sfV6gVWuiA0JIdBAydmEUL3nrmVm/l4yQd
 D+XBVAOoIUqlzcxWCPUIxiLnHq+/TZSOzJZ03glSrZFWcADZMB7Y75QOn9KT7frlDGdv
 y2xFQaYRiTKVleiSvQr1ObdG7K6N64l7hQM70aasBiZBwS/bNuNSO8WqKivQkTU02nhJ
 g1ikfdYrGdnbRp3qfT3CPA8HcfW8S10K4P+hqpObiV3yiRVjpf0+eB8b498REq6xIVhq
 2IyQ==
X-Gm-Message-State: ABy/qLb1xyPNArHW8OYO4e0lefFmjpt3PZRFvor+130eyZtus014zllU
 Pa9VxOXluWmr0l/K+NlQ2ml0Pg==
X-Google-Smtp-Source: APBJJlGTGiQvuAq4/clLcKpZZMqteVFx4h0vs61ilsUKjNQ2Ll9GiD3TzP3icMAgeJq6cHbxnKUisQ==
X-Received: by 2002:a05:6808:130e:b0:3a4:2460:2b9a with SMTP id
 y14-20020a056808130e00b003a424602b9amr4244006oiv.34.1689188536515; 
 Wed, 12 Jul 2023 12:02:16 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a05680802c900b003a020d24d7dsm2174435oid.56.2023.07.12.12.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 12:02:16 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 7/7] avocado, risc-v: add opensbi tests for 'max' CPU
Date: Wed, 12 Jul 2023 16:01:49 -0300
Message-ID: <20230712190149.424675-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712190149.424675-1-dbarboza@ventanamicro.com>
References: <20230712190149.424675-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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



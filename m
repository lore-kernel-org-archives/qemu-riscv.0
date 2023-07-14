Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921CDC04A94
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 17:45:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKMpR-0004cA-9q; Fri, 14 Jul 2023 13:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMpP-0004bU-UL
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:39 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMpO-0003zR-IR
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:39 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1b03ec2015fso1721306fac.3
 for <qemu-riscv@nongnu.org>; Fri, 14 Jul 2023 10:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689356617; x=1691948617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mkt2khv3HlTYD2I5HX8C8vkoqmlMW0ZXesjrMFYxT0=;
 b=l5WEBtepgqLWSUjxOIfZclSb3bvflwddezGGRGoTaSq8NoZ95olAEAg+/wQyNKimX1
 dYMR+R0Xr9DcGVD6kEWiEdSd360DmKelFMEeA2r4fz1WBrQ3YfwlAkAl7M8ZFGcZTDTH
 ADsWDthh6nPXkBl0ceq405ZBLkmhS7XJaIT5T+0sdNm0y888yQdeB2YfyJxgfe1rRNKE
 ibhQou0+kykeaUKKY80uB55Mk7JMGulNtDn4T8ye3fiP9AbHUfxY++wbQyOktcR3vRhl
 gw27re4Uf72so3lIlPrG6p0q9NyJhzVjU+HRj0m7e7RpMcPc7nxzeV5Voleji7advWE1
 VrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356617; x=1691948617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mkt2khv3HlTYD2I5HX8C8vkoqmlMW0ZXesjrMFYxT0=;
 b=j3c9RWythQiAtyMJt9wZl8Ddbqe50W7atdp5qc2ck3didYUOdXdrk0oI6qyISWxIlO
 sNkOzABOQbsY4qJdyfksypSZsQmaL2gB3IfFHS3TPbvWAT/8vZK6k/z+zGHRnqVBALal
 HFoVSh/oKeJ67Cdlt9xzLB/UD4/XtJyhx2MO8HJFNGPSYa6B5B+Lk9ZGybwZfmfbCZhk
 kyGZzng4LXbL/O0mSbvrr0DucFyRdcbJljhPfEq/cDH/6H51xYdQ9/aPfroOzzlMQQmV
 yl4n+0JWE0WXM3oUDd2bfh5yvJX0eXQH4ympRBL6tWAyv0BCjLKNGKqCqLViUTWXRVQF
 nxyA==
X-Gm-Message-State: ABy/qLZVwDxKK134hw5AnoVuNFo2Ga91MKcOYev8i6hBJw7Z1Ueyy4zS
 cqyMjNT9JA/3mDEwZJZ4V1XMMQ==
X-Google-Smtp-Source: APBJJlGOK2ztInEpvKxNLBOcGqdvL419suNQyYbfr7CUkQjVPO5xAXR0Uo6WiWuyYlMbLJLgYy/0Yw==
X-Received: by 2002:a05:6870:418c:b0:1ba:53ed:18c9 with SMTP id
 y12-20020a056870418c00b001ba53ed18c9mr1201921oac.37.1689356617628; 
 Fri, 14 Jul 2023 10:43:37 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 dw18-20020a056870771200b001b05c4b3b3dsm4240968oab.31.2023.07.14.10.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:43:37 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v3 7/8] avocado,
 risc-v: add opensbi tests for 'max' CPU
Date: Fri, 14 Jul 2023 14:43:10 -0300
Message-ID: <20230714174311.672359-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714174311.672359-1-dbarboza@ventanamicro.com>
References: <20230714174311.672359-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
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



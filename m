Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D815CA0ECF
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:32:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg3Oh-0003C6-OU; Tue, 12 Sep 2023 09:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3OQ-00031K-Rr
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:28 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3OB-0003ot-0j
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:25 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6bb07d274feso3723566a34.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694525110; x=1695129910; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7qpf/JkqOOyGkufcoz/cV+noVL88MwgaLJx1Pp2JNY=;
 b=hoz/YelyVcZJEG9hTa7dyfU7boawWted+16ywn7DKTeAFTXiULWPquLvP6iTuMwKXV
 9CfV/2w4e+OwRj+KzeAudWQYIv/nKSPX292b5qIzYqWWbHBgKseuay/qpEqBCK2LT+Ko
 wEtVTocWbfkdZVGKc0+YY3jYf8iiHlXWW/5Pyn+wNCkDdmUDbAPu0TAiGOsdwsKEWW1C
 AeEiIQE9ubn5Z8zOpAtIyfpuxCaRwZgXFi43j2M0dYUg5DrSqRKj7Awmz1MLFOR8OMwP
 XBktSueXL4QGsRptZJEemg85C5Teg/P2caa5UREV7DgZJY14KAtdgCuB1Zf503Y8afH0
 wVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694525110; x=1695129910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7qpf/JkqOOyGkufcoz/cV+noVL88MwgaLJx1Pp2JNY=;
 b=VVBjel+k65dohxqWysU4CtW8KPPJMc26sJbpeJqu1Ei2smXLHrZ9GFxD0nWVJW4tac
 XRgTg5olvmylxtf418Avv/LB0i4IK50ghkPl6UpfZrfeDeGluvwn7Zx63+XSSgW+M3Sa
 4ujrFmp8dn87yg1HQuATsRLUwMRcmyTAZVxqC/7CQZs2MEQaKMjePXRNras0BCmeZUhx
 Kj+hO9G031zYNJ+x2WkfNmsbUOV37k+5xbJyEOQgAUstAoBpi5DcYFjoviNoQeHILjZ1
 pnZqM5kCg8M3gdTHFnmTEQhjAE4DI8YlOII0WWrU1RmMR2STMl2s55i0/PapwxQR5Bi3
 J7ow==
X-Gm-Message-State: AOJu0YxjlPko2fJ9VmIH9hBM++8t/siV/jDtrcedu+jRv8A8QVxfnhbH
 f4XMhwldzrRL2dVFhon9k15FRw==
X-Google-Smtp-Source: AGHT+IHOhMg9uJl2DWoPge+uHoGmT8PuQMSWAe3c5YuIMWp6xEhRm/8Q50V6UzYXBqIFFELwAY/Z7g==
X-Received: by 2002:a9d:7501:0:b0:6bf:1f5f:ed18 with SMTP id
 r1-20020a9d7501000000b006bf1f5fed18mr13882966otk.1.1694525109943; 
 Tue, 12 Sep 2023 06:25:09 -0700 (PDT)
Received: from grind.. ([177.9.182.82]) by smtp.gmail.com with ESMTPSA id
 p15-20020a0568301d4f00b006af9d8af435sm3991255oth.50.2023.09.12.06.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 06:25:09 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 11/20] avocado, risc-v: add tuxboot tests for 'max' CPU
Date: Tue, 12 Sep 2023 10:24:14 -0300
Message-ID: <20230912132423.268494-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912132423.268494-1-dbarboza@ventanamicro.com>
References: <20230912132423.268494-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
adding new frozen/ratified RISC-V extensions.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/tuxrun_baselines.py | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index e12250eabb..c99bea6c0b 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -501,6 +501,38 @@ def test_riscv64(self):
 
         self.common_tuxrun(csums=sums)
 
+    def test_riscv32_maxcpu(self):
+        """
+        :avocado: tags=arch:riscv32
+        :avocado: tags=machine:virt
+        :avocado: tags=cpu:max
+        :avocado: tags=tuxboot:riscv32
+        """
+        sums = { "Image" :
+                 "89599407d7334de629a40e7ad6503c73670359eb5f5ae9d686353a3d6deccbd5",
+                 "fw_jump.elf" :
+                 "f2ef28a0b77826f79d085d3e4aa686f1159b315eff9099a37046b18936676985",
+                 "rootfs.ext4.zst" :
+                 "7168d296d0283238ea73cd5a775b3dd608e55e04c7b92b76ecce31bb13108cba" }
+
+        self.common_tuxrun(csums=sums)
+
+    def test_riscv64_maxcpu(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:virt
+        :avocado: tags=cpu:max
+        :avocado: tags=tuxboot:riscv64
+        """
+        sums = { "Image" :
+                 "cd634badc65e52fb63465ec99e309c0de0369f0841b7d9486f9729e119bac25e",
+                 "fw_jump.elf" :
+                 "6e3373abcab4305fe151b564a4c71110d833c21f2c0a1753b7935459e36aedcf",
+                 "rootfs.ext4.zst" :
+                 "b18e3a3bdf27be03da0b285e84cb71bf09eca071c3a087b42884b6982ed679eb" }
+
+        self.common_tuxrun(csums=sums)
+
     def test_s390(self):
         """
         :avocado: tags=arch:s390x
-- 
2.41.0



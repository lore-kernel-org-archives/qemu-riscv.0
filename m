Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9F1C54E58
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 13:18:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rl7LQ-0001rS-FC; Fri, 15 Mar 2024 09:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rl7KZ-0007R1-Jy
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:10:41 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rl7KW-0008CP-JI
 for qemu-riscv@nongnu.org; Fri, 15 Mar 2024 09:10:39 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a45f257b81fso270202966b.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2024 06:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710508235; x=1711113035; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ziq2wowWWC1u1AFoZqkoU9Vq9nlm9ySbjwCpiWVML/s=;
 b=op75yWP2kBjzzxO4AdYFmO4Wwo0v7v88JOe1Ykk8tAKJ0uI0EFjvxmuiLe0nmavjWX
 MJVkOvgR18oqw+jMCWtIu7E5CruYbj5uTFZiOdFfOZ37VzhYmpwLTJXyJYO0JCTmlKnJ
 Czkzl93KzuaVFic86Yf2+OYELIHTTNMivoaIe527tsfKkbf5YkKgEfn1ZZ0Cxp2AuNLh
 Gu44qFgAQXlZg3lk25436nEktmosFjajJCT5A3HXGkgQJs0XM1Jm12dAf+CyJG9IXyZB
 yBYDGRgL3AUXmRIgzQ6CtU3pXGijOhy1IhNy2GvuJpP4yOI1M/BL2QJiw737yDPN+QyL
 csmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508235; x=1711113035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ziq2wowWWC1u1AFoZqkoU9Vq9nlm9ySbjwCpiWVML/s=;
 b=XS2t4KcumCFJc6z/SOwxc8tn2bVdcHqDAULt2Wc3Rm6FQ1WLDn3ftF9EfXqRgvlYuk
 SPe6Kh7j9Y5J22nZUrvyPZE1NK7+yjsKdXAmGZJ0vd/kW8hMlWv3dH+UyCl0TH6n/8Lo
 By0szgByZw71kJT0qAjdhop2+nE4r5rrkjDebP25YWeAZdE/UDwbXeE33/m0UBEsEFKb
 vZq+kgCt52FU5j/DYoBXreaCpVNywI6mrHYaahPkcOI6rNGc0HMae2otLHY+H57Q17/s
 DF5Omwz3/cI+oRIJoVyo4oM2xao4g9e1FrFPNgIadzJN828kA1+CTNmzKTVTy0vzba6x
 PASQ==
X-Gm-Message-State: AOJu0YzJbSS+xZXN4CSRMAslyoj/9X2mhPsMuXUf4UUrf/kODNc/rrs9
 Sw8OM6Xk8yWBiNk87t4X+9x1QslA9s3J0DSTsXDsKbSeE6mig01mlEzSvMtTlH4=
X-Google-Smtp-Source: AGHT+IGM9lKIGYFKaZaCihcgLpVmcmySzlNiRx+Vc9T9AfUSHHHR2fR0Hvp2VtpFFpo3dT3QgLPrVA==
X-Received: by 2002:a17:906:40ca:b0:a45:2e21:c776 with SMTP id
 a10-20020a17090640ca00b00a452e21c776mr3334104ejk.3.1710508235156; 
 Fri, 15 Mar 2024 06:10:35 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.145.26])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906341300b00a462736feedsm1691257ejb.62.2024.03.15.06.10.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 Mar 2024 06:10:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 12/21] system: Introduce QemuArchBit enum
Date: Fri, 15 Mar 2024 14:09:00 +0100
Message-ID: <20240315130910.15750-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Current QEMU_ARCH_foo definitions are used as masks.
Extract the bit values, so we can easily iterate over.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/arch_init.h | 69 ++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 22 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 8850cb1a14..cf597c40a3 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -1,30 +1,55 @@
 #ifndef QEMU_ARCH_INIT_H
 #define QEMU_ARCH_INIT_H
 
+typedef enum QemuArchBit {
+    QEMU_ARCH_BIT_ALPHA         = 0,
+    QEMU_ARCH_BIT_ARM           = 1,
+    QEMU_ARCH_BIT_CRIS          = 2,
+    QEMU_ARCH_BIT_I386          = 3,
+    QEMU_ARCH_BIT_M68K          = 4,
+    QEMU_ARCH_BIT_MICROBLAZE    = 6,
+    QEMU_ARCH_BIT_MIPS          = 7,
+    QEMU_ARCH_BIT_PPC           = 8,
+    QEMU_ARCH_BIT_S390X         = 9,
+    QEMU_ARCH_BIT_SH4           = 10,
+    QEMU_ARCH_BIT_SPARC         = 11,
+    QEMU_ARCH_BIT_XTENSA        = 12,
+    QEMU_ARCH_BIT_OPENRISC      = 13,
+    QEMU_ARCH_BIT_TRICORE       = 16,
+    QEMU_ARCH_BIT_NIOS2         = 17,
+    QEMU_ARCH_BIT_HPPA          = 18,
+    QEMU_ARCH_BIT_RISCV         = 19,
+    QEMU_ARCH_BIT_RX            = 20,
+    QEMU_ARCH_BIT_AVR           = 21,
+    QEMU_ARCH_BIT_HEXAGON       = 22,
+    QEMU_ARCH_BIT_LOONGARCH     = 23,
 
-enum {
+    QEMU_ARCH_BIT_LAST          = QEMU_ARCH_BIT_LOONGARCH
+} QemuArchBit;
+
+enum QemuArchMask {
     QEMU_ARCH_ALL = -1,
-    QEMU_ARCH_ALPHA = (1 << 0),
-    QEMU_ARCH_ARM = (1 << 1),
-    QEMU_ARCH_CRIS = (1 << 2),
-    QEMU_ARCH_I386 = (1 << 3),
-    QEMU_ARCH_M68K = (1 << 4),
-    QEMU_ARCH_MICROBLAZE = (1 << 6),
-    QEMU_ARCH_MIPS = (1 << 7),
-    QEMU_ARCH_PPC = (1 << 8),
-    QEMU_ARCH_S390X = (1 << 9),
-    QEMU_ARCH_SH4 = (1 << 10),
-    QEMU_ARCH_SPARC = (1 << 11),
-    QEMU_ARCH_XTENSA = (1 << 12),
-    QEMU_ARCH_OPENRISC = (1 << 13),
-    QEMU_ARCH_TRICORE = (1 << 16),
-    QEMU_ARCH_NIOS2 = (1 << 17),
-    QEMU_ARCH_HPPA = (1 << 18),
-    QEMU_ARCH_RISCV = (1 << 19),
-    QEMU_ARCH_RX = (1 << 20),
-    QEMU_ARCH_AVR = (1 << 21),
-    QEMU_ARCH_HEXAGON = (1 << 22),
-    QEMU_ARCH_LOONGARCH = (1 << 23),
+    QEMU_ARCH_ALPHA             = (1 << QEMU_ARCH_BIT_ALPHA),
+    QEMU_ARCH_ARM               = (1 << QEMU_ARCH_BIT_ARM),
+    QEMU_ARCH_CRIS              = (1 << QEMU_ARCH_BIT_CRIS),
+    QEMU_ARCH_I386              = (1 << QEMU_ARCH_BIT_I386),
+    QEMU_ARCH_M68K              = (1 << QEMU_ARCH_BIT_M68K),
+    QEMU_ARCH_MICROBLAZE        = (1 << QEMU_ARCH_BIT_MICROBLAZE),
+    QEMU_ARCH_MIPS              = (1 << QEMU_ARCH_BIT_MIPS),
+    QEMU_ARCH_PPC               = (1 << QEMU_ARCH_BIT_PPC),
+    QEMU_ARCH_S390X             = (1 << QEMU_ARCH_BIT_S390X),
+    QEMU_ARCH_SH4               = (1 << QEMU_ARCH_BIT_SH4),
+    QEMU_ARCH_SPARC             = (1 << QEMU_ARCH_BIT_SPARC),
+    QEMU_ARCH_XTENSA            = (1 << QEMU_ARCH_BIT_XTENSA),
+    QEMU_ARCH_OPENRISC          = (1 << QEMU_ARCH_BIT_OPENRISC),
+    QEMU_ARCH_TRICORE           = (1 << QEMU_ARCH_BIT_TRICORE),
+    QEMU_ARCH_NIOS2             = (1 << QEMU_ARCH_BIT_NIOS2),
+    QEMU_ARCH_HPPA              = (1 << QEMU_ARCH_BIT_HPPA),
+    QEMU_ARCH_RISCV             = (1 << QEMU_ARCH_BIT_RISCV),
+    QEMU_ARCH_RX                = (1 << QEMU_ARCH_BIT_RX),
+    QEMU_ARCH_AVR               = (1 << QEMU_ARCH_BIT_AVR),
+    QEMU_ARCH_HEXAGON           = (1 << QEMU_ARCH_BIT_HEXAGON),
+    QEMU_ARCH_LOONGARCH         = (1 << QEMU_ARCH_BIT_LOONGARCH),
 };
 
 extern const uint32_t arch_type;
-- 
2.41.0



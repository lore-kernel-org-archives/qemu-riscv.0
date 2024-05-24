Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A778C25B79
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 May 2024 06:16:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sAOCP-0001xC-Dl; Fri, 24 May 2024 02:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCN-0001wX-W8
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 02:14:40 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCE-000174-I8
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 02:14:39 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6f8e9878514so480720b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 23 May 2024 23:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716531269; x=1717136069; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Etm0+s3up2JqM8ph6JUMLJUOz4fBS6haqZNSI55ovMA=;
 b=D2I1knQprli65yKXO8Z/WtGjbprH02kfLHM3G/KV51DDnp8r9ovN1GKI6XDw5ZcZVS
 m/aa0BB0xxwADRs6kC4cnYQCiCKvFRe2uVkrbOeb9D7KX52t4o5WUngsNRHTsRK60nyl
 R0ezPBGf74Fv/h5CbduWZ3GRoa6pdx4VHOXtchUlaP21Z3wlLUGqIYSt99gArfXBbecZ
 RFASGdNyTTLuMh4HLC0uTQOJTjemCUS68RyiH5l46J6dpLCLkUvKqY0NvdLBr4NSgAx1
 4IWrJ/G8OYXMYSGOKwkHiGLtgq7C5kSIfoXQv9iz0hvLb77hdUDie2ciI8GIO4nG5azO
 TMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716531269; x=1717136069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Etm0+s3up2JqM8ph6JUMLJUOz4fBS6haqZNSI55ovMA=;
 b=pnF8tXjrcQSVOlt9CxuUl1+yfippYe09CH+RwRwGPI0QlPbTqc2kdpNch5FQsMYlmO
 bxU0rCtvV683MuVGSzkBFQt6yU/qXDbQnArCpjJq6pcGXzJhwHZNu4i8Or4CNTX6d5gV
 LY9ritXLwILwFSvP8xvgEMdSulfDG1HsVoUp4fYIDdXpnfNCFuhZBp2mAEQckdiwZjCN
 O+Z3H4+KGu2xCTnAt+H6e7GYyDAexIXfFXHUTPhdN8E5Ej4k/8gIVmBPY0rB37y48jjh
 BdXfUXKK+Vd+3JNQhOz5Kws98MqpOprE3kLi7Q63VonyrW0gmhIuDt02aVFxIPW7251V
 XDXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD3a0yhB6HaGNMlLsh1awM6SIMljDOf4PR/ObOC9IegKp5MvjKrZdVOcshHrO9Y5nooDt5IanKkgzlmYtIO1P1bwkIy/0=
X-Gm-Message-State: AOJu0YxjuWls5ZCOHFQhCYh5+cNOG6O+xcxHvAwB+rNk22gAkQkmlozM
 DICJxV0S90YMmxMQBW89cZZiZT/yeIXq8+qV/zgC4XxPjJT14jHgmfgvFvu8PA8=
X-Google-Smtp-Source: AGHT+IGwVVhlhxIFzhnIvWCicRAcK0IONx8TaPqZSRou32PXzOv5pxSXgnACNtBXkqi/Un+CgS5DVA==
X-Received: by 2002:a05:6a00:4007:b0:6ed:21b2:cb17 with SMTP id
 d2e1a72fcca58-6f8f2c6dd92mr1353636b3a.4.1716531268908; 
 Thu, 23 May 2024 23:14:28 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.31])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcbea487sm516106b3a.107.2024.05.23.23.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 23:14:28 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 01/12] uefi-test-tools/UefiTestToolsPkg: Add RISC-V support
Date: Fri, 24 May 2024 11:44:00 +0530
Message-Id: <20240524061411.341599-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524061411.341599-1-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x433.google.com
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

Enable building the test application for RISC-V with appropriate
dependencies updated.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc b/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
index c8511cd732..0902fd3c73 100644
--- a/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
+++ b/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
@@ -19,7 +19,7 @@
   PLATFORM_VERSION        = 0.1
   PLATFORM_NAME           = UefiTestTools
   SKUID_IDENTIFIER        = DEFAULT
-  SUPPORTED_ARCHITECTURES = ARM|AARCH64|IA32|X64
+  SUPPORTED_ARCHITECTURES = ARM|AARCH64|IA32|X64|RISCV64
   BUILD_TARGETS           = DEBUG
 
 [BuildOptions.IA32]
@@ -60,6 +60,10 @@
 
 [LibraryClasses.IA32, LibraryClasses.X64]
   BaseMemoryLib|MdePkg/Library/BaseMemoryLibRepStr/BaseMemoryLibRepStr.inf
+  RegisterFilterLib|MdePkg/Library/RegisterFilterLibNull/RegisterFilterLibNull.inf
+
+[LibraryClasses.RISCV64]
+  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
 
 [PcdsFixedAtBuild]
   gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x8040004F
-- 
2.40.1



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777A5C3064D
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:09:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sM7n9-0001Fz-K0; Tue, 25 Jun 2024 11:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7n7-0001FI-K0
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 11:09:05 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7n4-0006Qo-Fe
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 11:09:05 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7066c799382so3076334b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328141; x=1719932941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J61sJoOBmQROnk8p3njEuKGc5ezAVKKkxaM0eVogGRo=;
 b=VjPRfIICi0L8EIfDWbriO4I+r8r1znqjHXsJoKPExScdKLA1PZkgsg60GWDx9HdsCU
 xviIuQ7nQ/wEKAxuV2O+l2F2XN9lNethe2KnJ6w1dJW2I+zAmj1ksi3moADGIL2GxZGR
 BCmoosqY6zVPjSHPHlA0lHIh+wac1gcxqW5tUJXNBU5V8FpAESfQ0R4tc0GQFosXpwbf
 hFiPWC9ZfY+1FI0s2XgoScY1n8C/Lx3uAC0+R+31jpYmEm3GaIxCk3mVJUzUtbbWf6j+
 xsIpr0Qodz7GFw5UKvFrXGmKYGpx6ba+xAdexsKxe1Y3bLthQUt1gEDCbBEye8IXc/sc
 CdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328141; x=1719932941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J61sJoOBmQROnk8p3njEuKGc5ezAVKKkxaM0eVogGRo=;
 b=QFVdbTQb+ArFhOyMHAXf3a1Sr6IE4q7Vu7Dk14qbxIxHwUwxExS+Kpf/ULhiUpHfL6
 quEjn1tEfr4rgQoNGgT7dtuvrHn2H7BVCips8C76P2KG+vxips3QCA76+sL1xpv+FlEV
 g+ExAeUN/r30nYvnQ+poKlWa7+e3GQJZ7rIt9cPvTSivUs+WQmJCpOf2Zfe2hfFQ8oUs
 xBOcGx79ULoEUdbDzCzj5UoQU1CYvAi2TRh5Rq6bc0ixIitu83lWi6FSepccA22NR32b
 0w2D7p9gM1XTdoScegH6lkEYoWF/Hr5riljE21pF4aBp5hlcC/BmTrN0hdSJc4yaXHXq
 qvmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbX0PsSxLDTFYVNn+hB37+H7k4Gb4561i8l7JUVh4gMlflZJHl7k9QKDpN3O83sW53a/lhC+gfnNdfxau9/oN8WWKt/6c=
X-Gm-Message-State: AOJu0Yzoe2BvDsn/gkoA2R5LEuB7a8NY72mk7VkI8F2+bTD45CvG9j8T
 Cstfdqj7tM2UAcBv4Tx3/SMX+71mf2bi6OY5R9M1e3VsSs3DneiT6SIEoYacLv4=
X-Google-Smtp-Source: AGHT+IF37Vxvc+jmsLAOdchvtFZC9YLZ58kksG+1p2+mnNhhPE/k0FjEVpzKYacibQ/HrtlX1/DNOg==
X-Received: by 2002:a05:6a20:bf1f:b0:1b8:d79:55f6 with SMTP id
 adf61e73a8af0-1bcf7ebf190mr7155217637.25.1719328140722; 
 Tue, 25 Jun 2024 08:09:00 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:09:00 -0700 (PDT)
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
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 02/16] uefi-test-tools/UefiTestToolsPkg: Add RISC-V support
Date: Tue, 25 Jun 2024 20:38:25 +0530
Message-Id: <20240625150839.1358279-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Enable building the test application for RISC-V with appropriate
dependencies updated.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
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



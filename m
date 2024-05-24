Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09DDC25B7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 May 2024 06:16:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sAODE-0002jU-Cu; Fri, 24 May 2024 02:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCy-0002NC-GN
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 02:15:17 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCv-0001Kb-Fx
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 02:15:16 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2454154e53aso3778850fac.3
 for <qemu-riscv@nongnu.org>; Thu, 23 May 2024 23:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716531311; x=1717136111; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2sFSRuC8+CxMlP5PVNh1RPxJK2RXSojBm6McPGcyLX8=;
 b=K/FOn/3/zAEnbbCQfIuTccMln61Hn9789BkVcuOYDyjwVstGAAPF6H0xFI70TMwO80
 U8X4jSamAmtz3Skaqi1dXpFrwXnO1vNA+1/v2YthdJaqH3wdNORV5wl70RRoKw5Hoy1v
 w7EaGXXgPUICupVF+QmTrByKcHRs+b0ZpX2sybthQXYXBQCS/zHb0BoAHsJ+U9sELXeh
 Sm5voLjPGC4zdY5EOZK/38N9wkBRMUIt2LMaq2iY2bx4pKyQxj9MHbkDB6zUVrL8f7+c
 co8R6gdzvVgJj9XJ4aPTF85+/c+KzVt6NsPPKU/2P527n2SemgqUqobQPV6FACRre65k
 48RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716531311; x=1717136111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2sFSRuC8+CxMlP5PVNh1RPxJK2RXSojBm6McPGcyLX8=;
 b=fjN0vU2ByvL9YGUV+p4DZtQO+w5b0ccewNWH9282LlmIMiy9j309EdAQ0ufe+ME+gP
 UyDWrscDrle716gwJqs+HE1CgL4eBB9kHtIEOi6YgsvGjIea8M+bm84IyKcfdic22GZP
 tvfar+cTOAfwRH74St8YJgO3lnRWFWwOTpHAHvOj6XcjJaMED2OFaXQQg0wJcqyD8Rb/
 7AdZq0daRKcl2xhbyFn4h4vv/TtguInrC8WTG+YrVnJ3ANj4pRkci1ZbaVF8k5QMKS9H
 E0WPnbU0mdwW3qd8jrCf7N9+o6LgjI2rcRjOus8lS6RLCNp+M1HwyGgAWA9qo7l4QbbW
 sn/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEEJ6f/YFwYbeE7wZiICVd04g9NatwhbzyTqIH8IvBsy70NPumZkDMB6+zl4d3yiuHFC84Hxbus8WUgSVnt4+89pCII8I=
X-Gm-Message-State: AOJu0Yw1d0PBPjR5wsvqVqQyGb7Pgt3l4cHJ82IGjiOYcXwzwv5fdCSl
 U6OWfc0g5F7hWSrlaHJ8dFseXRZoYIk5Qhum+BTq2FwqdcA+Q6sLo9NEbQcMR8M=
X-Google-Smtp-Source: AGHT+IFq9mGYMgGQ3biwrKf9GU227to/Vc80af/X6Miwmz2YD5gv28eIFIuWTu+ooDDizcmw0esAdw==
X-Received: by 2002:a05:6871:112:b0:24c:5d25:ed48 with SMTP id
 586e51a60fabf-24ca14e1c25mr1500113fac.46.1716531310853; 
 Thu, 23 May 2024 23:15:10 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.31])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcbea487sm516106b3a.107.2024.05.23.23.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 23:15:10 -0700 (PDT)
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
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 07/12] meson.build: Add RISC-V to the edk2-target list
Date: Fri, 24 May 2024 11:44:06 +0530
Message-Id: <20240524061411.341599-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524061411.341599-1-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oa1-x34.google.com
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

so that ACPI table test can be supported.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index a9de71d450..576c803a8a 100644
--- a/meson.build
+++ b/meson.build
@@ -93,7 +93,7 @@ else
   iasl = find_program(get_option('iasl'), required: true)
 endif
 
-edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
+edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu', 'riscv64-softmmu' ]
 unpack_edk2_blobs = false
 foreach target : edk2_targets
   if target in target_dirs
-- 
2.40.1



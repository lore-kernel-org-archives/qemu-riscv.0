Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546FDC83F27
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 15:00:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uc3bz-00011f-Bl; Wed, 16 Jul 2025 10:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uc3Ki-0000Y4-Ts
 for qemu-riscv@nongnu.org; Wed, 16 Jul 2025 10:42:09 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uc3Kb-0004D7-Ng
 for qemu-riscv@nongnu.org; Wed, 16 Jul 2025 10:42:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-313eeb77b1fso5621903a91.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Jul 2025 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1752676918; x=1753281718; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dvZMU+Jp2i+nkStnLXkRcOA2jT1hsR9XWGiTLF22h+c=;
 b=diPZXD7aYzdyq0T41Xy9oNQVLU0lHomfCYqc8DiravbHjpWqtn7X25l3CKXO1IOfhm
 25lEkVXLgvershvj3q6+irkr0rKDEuvcc8NAWHx4kPDNfQykn3YKpbsWxcA8RUOeMqHq
 guPOwEsGdWOwJxU13Jqz+hFXcw85rCkmVDDevyiL4wFCYpnlDX63h+dHcuMtZdj+gLFX
 Mm8YtQqdqAmzmoScu/2yB0rTK1auA/8E764dVFKo24Yll2hu8Hhad3zfaVVg1kW/wulA
 3EWxEeyKktsuKn2GgwfU7JpPEQsV5Xrk3datgyDCfwAtprsahNrga+mrr33IoSsPMcFJ
 O84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752676918; x=1753281718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dvZMU+Jp2i+nkStnLXkRcOA2jT1hsR9XWGiTLF22h+c=;
 b=sN1ha2FtETBCXyBwqVWKP9IDqdbwlghHbSmsTRuLpiDs+LPOaYTliH60cbJV8Y26Og
 biNmCGA7hO9S87ipbDGtDyNryBqdpByGkkz8/N5YWOLCTise0+2IJt5H77VTCSdYplm+
 uAURcYXPTm1gaD+ceHBuh9OsCYb5eaWGXJaUtbORXgGcXcxmaP0ESLvrZ5D4fXuIqHEQ
 mZpZQdguwVLinvO3Fejsd8My79bRE51yDyRFFCf+d152JznSLX/OPnLXMPEaSce+YdFI
 wlUWkCSTDKI9vn7W60YuKDaOKEawlOIqclPos4yXflawScclteJZguLIFYtXxpQJEa2S
 h4nA==
X-Gm-Message-State: AOJu0YzkMgUN2ELs3tEbBt4v4RzqSfafHIY2a2kdKNSpJeascTkrknyW
 jESGsB0vn5TXhyHmkbBwh4DLV0I24jxBoS6daqp078Wi891mdy912cOHlTeNJZcx+CzjQbQz+8W
 Sz/Map5s=
X-Gm-Gg: ASbGncvTdn1Dm7VOsfUq4JEa3mR6FDOVUokj/5k66fSNIry86KX6xyp5eKrCfgQF4y1
 MKM4wBwnzfNO7FBNlJhCeu0zizORVVrcEuWHVcGBo5g12hXuFdj0mriWo4NYuBpB3vmT67wUO1I
 EbMiOVe5AORpkKj7LNI/I31YMw1FRl2a1TbvF8TjIeMJICnHKdLy9WhDSK424b3S60a6LzH2BMz
 mb3jtljx1v1oHJ3eYQiGvAdsrrZwY330ccs12ZyHRRftSIk+IBr9VbNv4+FoLRaJ+L/UKznzJua
 dnVwKRU5VjotUFudbp5E7z/hWFHUm6mFKH0HGy5F0Y042sm9rrS3QTFwyprejM+375uhRoKEkiK
 kqD8F7iR2nDFz6n5NMDIbWe/K6Bznvt1H
X-Google-Smtp-Source: AGHT+IEONFlC7D4m23u8wP2sqs7iF1q5eTUOPlb1/yoBmV7j7soI3fKYeiqwB+sg8KxEWXH0J/OzUQ==
X-Received: by 2002:a17:90b:3905:b0:311:f99e:7f57 with SMTP id
 98e67ed59e1d1-31c9f4cf480mr4252500a91.23.1752676917836; 
 Wed, 16 Jul 2025 07:41:57 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f2879fcsm1622950a91.28.2025.07.16.07.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 07:41:57 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 2/3] hw/riscv/virt-acpi-build.c: Update FADT and MADT versions
Date: Wed, 16 Jul 2025 20:11:39 +0530
Message-ID: <20250716144140.3954431-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716144140.3954431-1-sunilvl@ventanamicro.com>
References: <20250716144140.3954431-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102c.google.com
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

RISC-V support is added only in ACPI 6.6. According to the ACPI 6.6
specification, the minor version of the Fixed ACPI Description Table
(FADT) should be 6, and the Multiple APIC Description Table (MADT)
should use revision 7. So, update the RISC-V FADT and MADT to reflect
correct versions.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index ee1416d264..d7e57cbb1f 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -429,7 +429,7 @@ static void build_fadt_rev6(GArray *table_data,
 {
     AcpiFadtData fadt = {
         .rev = 6,
-        .minor_ver = 5,
+        .minor_ver = 6,
         .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
         .xdsdt_tbl_offset = &dsdt_tbl_offset,
     };
@@ -537,7 +537,7 @@ static void build_madt(GArray *table_data,
 
     hart_index_bits = imsic_num_bits(imsic_max_hart_per_socket);
 
-    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
+    AcpiTable table = { .sig = "APIC", .rev = 7, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
 
     acpi_table_begin(&table, table_data);
-- 
2.43.0



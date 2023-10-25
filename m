Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BCCC07545
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:14:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvkAj-0007XC-De; Wed, 25 Oct 2023 16:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAd-0007Rc-Rv
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 16:08:04 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAa-0003Tx-Vn
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 16:08:03 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68fb85afef4so123993b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 13:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264479; x=1698869279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A4V6imvX7ziS3OOqurEvREGU5Yydx6YwutgjtwcggvY=;
 b=mzxllTB8QfOBhYOa7eV0tZfhByBrxBCOUBBAAuSExcIM0GWIVtG6vhiBMYIAV6h2Rj
 AEpmjpSUDiZFtJd3bZBaOWq+0BdudLlyBuyllGO4ciIwUMfFreEAT1R8No3tRjDVVpvV
 hbRg0wtyYcgLx+gvzJqRzaW8ayUi/wuMacezwbHXMAAWM3/QVttWawnSLIAn94uJAHvy
 Ecgga6u9j+WMmhEC7PN3njeoF0+fT5yxXrRx7w9wH2xl/HJ2DgrmiYgtzy07gn2WPYp8
 VAjLu5O2/Ow9kxmzy4skaDoAjQ4GbpMQZWR3W6T3qTNEjTIJaPch7blE8WirjKKJKOkN
 ZXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264479; x=1698869279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A4V6imvX7ziS3OOqurEvREGU5Yydx6YwutgjtwcggvY=;
 b=r/jGQhYshUQEs07/b1Zg4YSj4qtfrwneYupyjHnIxfhIPMVplaUUMs0kk4WkkZPJjR
 WCmm0wgyOLVjvDGP4sIDI4c1sj0pDvQ97kDw2MGV2iKEDEW2xzuM+DG/mQPkURu3dv9H
 3FRRb3rpYQ4Nf0r+gfo1innqI88KkUrPDN1ZcIJ7oRFbCHNBqJ3Idb0rRTe7CKNhZfxM
 xNMPjkauX8q8FFaxDZ1C2D6iQUd6nTAYQ36oUoIqKGcmEfJYF87txp64wkbry3xpORA9
 p4phqk5Mtwm66TZtOK2B9Min/AVYnHw8c0G8l048McCfCNf+r5n6jf+36xMjozh1ENPI
 ImHg==
X-Gm-Message-State: AOJu0YzBXY9tJKl2lyI2t0joIDNj5DzMbOaXje26uCoHX0rH9teMDCQY
 ksi7IhNmvKIgs+bnKwe4DekBmg==
X-Google-Smtp-Source: AGHT+IG9itOvFBYgzwLUbqsFNu51Jn2jLci++Mp6EOvIwiqDSvft9w1iDkgtE0FdTyRN9+xeCfKJKg==
X-Received: by 2002:a05:6a21:3289:b0:16b:cc6c:d728 with SMTP id
 yt9-20020a056a21328900b0016bcc6cd728mr7535901pzb.44.1698264479649; 
 Wed, 25 Oct 2023 13:07:59 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:07:59 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 06/13] hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
Date: Thu, 26 Oct 2023 01:37:06 +0530
Message-Id: <20231025200713.580814-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add IMSIC structure in MADT when IMSIC is configured.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 073c85f327..7f1a370e54 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -281,8 +281,20 @@ static void build_madt(GArray *table_data,
     uint8_t  guest_index_bits;
     uint32_t imsic_size;
     uint32_t local_cpu_id, socket_id;
+    uint8_t  hart_index_bits, group_index_bits, group_index_shift;
+    uint16_t imsic_max_hart_per_socket = 0;
+    uint8_t  socket;
+
+    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        }
+    }
 
     guest_index_bits = imsic_num_bits(s->aia_guests + 1);
+    hart_index_bits = imsic_num_bits(imsic_max_hart_per_socket);
+    group_index_bits = imsic_num_bits(riscv_socket_count(ms));
+    group_index_shift = IMSIC_MMIO_GROUP_MIN_SHIFT;
 
     AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -307,6 +319,28 @@ static void build_madt(GArray *table_data,
                                   s->aia_type, imsic_addr, imsic_size);
     }
 
+    /* IMSIC */
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        /* IMSIC */
+        build_append_int_noprefix(table_data, 0x19, 1);     /* Type */
+        build_append_int_noprefix(table_data, 16, 1);       /* Length */
+        build_append_int_noprefix(table_data, 1, 1);        /* Version */
+        build_append_int_noprefix(table_data, 0, 1);        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 4);        /* Flags */
+        /* Number of supervisor mode Interrupt Identities */
+        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
+        /* Number of guest mode Interrupt Identities */
+        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
+        /* Guest Index Bits */
+        build_append_int_noprefix(table_data, guest_index_bits, 1);
+        /* Hart Index Bits */
+        build_append_int_noprefix(table_data, hart_index_bits, 1);
+        /* Group Index Bits */
+        build_append_int_noprefix(table_data, group_index_bits, 1);
+        /* Group Index Shift */
+        build_append_int_noprefix(table_data, group_index_shift, 1);
+    }
+
     acpi_table_end(linker, &table);
 }
 
-- 
2.39.2



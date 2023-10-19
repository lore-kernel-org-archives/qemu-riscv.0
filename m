Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E82CDB465
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 13:28:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtT4G-0003uJ-7o; Thu, 19 Oct 2023 09:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT4E-0003sp-Do
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 09:28:02 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT4B-0006iY-IG
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 09:28:02 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6b2018a11efso5854681b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Oct 2023 06:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697722078; x=1698326878; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BTqjHSwvXnZ4FtIzUidovs3zewyMkdDm5J3DS6d49vA=;
 b=FU0fBRtGukcp8Kcek75rE2KG0rYUWVjqmAlJjXS32xdjYfbAKXbIlEKsWBOcHl3ces
 4+QyvUaOCWc7HQ5J88+X29VbW+MUFNBp3cmbxuJTMklovx321anxG5j2dajZTAPNVHd1
 gcK2bLdSxWd10GJp/PPznbJdnl8xxqa1414O7+6/BuXGqe+mJj6xqW0kqwn4r3T+jssq
 Y/Esvr1tBQiwF0/fIn2bplpJNbtEvJSEXrBuNe7eg4ZZ+OVg/ODGV5jxXHhj0XF6xGCX
 VlthJNxiu7O1AmyMF1xIbB5iwguuRV+VnBi07/hwOX/VldAr0CUWb9Ji+7zFND0tbVdC
 F+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697722078; x=1698326878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BTqjHSwvXnZ4FtIzUidovs3zewyMkdDm5J3DS6d49vA=;
 b=Evlkzv19wA61rTYxnD4U0ZbdShg/Gs1whu6LZrq7NJzEmQOdRWegRb4YVtkhidQDmo
 vD6m+kD5EewAK13o97B8AmPjWkKpR2pYESqfU+Cn+tZOb3D4nGlhwljFsZ3C9vEJMyGk
 ACGnlI6zwZ8yIyUusRWpEKkj7Ls67vpI9DImupEZyJV/0X5M1/BCZufuxslw23Z7HZ8R
 SfoOjAOsmhMdjVO9Jj/VXixHWtLpQNXfZc6CDHChI1nF+laU46AcB2oaYpnyJB1eF20J
 h1dIRKLpFExX36+kIdcMopq0iab0TrXa326qD/fIZBnK31dgHuuuVUuwoApoR8DI42yh
 C15Q==
X-Gm-Message-State: AOJu0YzVeAdiNcGIaxpdZ8aau0NbsJxX9LTT8IthWF9I5q5DFc+HZqCm
 xLYh3DuT99D0dIFganeyXn3xMvuOpQwfKNHCrvA=
X-Google-Smtp-Source: AGHT+IEoNXa8yv6qkGWM4o0x/LwdLCCNgnnGShAQwaDeYdpowzs0Q8uIA+HhMA94CcPjAu78rh/wRQ==
X-Received: by 2002:a05:6a00:138f:b0:6be:25c5:4f74 with SMTP id
 t15-20020a056a00138f00b006be25c54f74mr2249725pfg.13.1697722076410; 
 Thu, 19 Oct 2023 06:27:56 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com
 ([2409:4071:6e8b:3a98:dd76:4e82:7da6:44ab])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a056a00228b00b0068feb378b89sm5273113pfe.171.2023.10.19.06.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 06:27:55 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 05/12] hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
Date: Thu, 19 Oct 2023 18:56:41 +0530
Message-Id: <20231019132648.23703-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019132648.23703-1-sunilvl@ventanamicro.com>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x430.google.com
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

Add IMSIC structure in MADT when IMSIC is configured.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
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
2.34.1



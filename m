Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C539C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 15:05:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFF9v-0002XT-6F; Mon, 18 Dec 2023 10:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9g-00022U-1k
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 10:03:43 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9d-0007Ew-Cs
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 10:03:38 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6d87eadc43fso434733b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 07:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911816; x=1703516616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PB3DqcYgnFgdIBTb4dftT5adpHcIIMTtv2wlN9XjGFU=;
 b=I3L2ezTkqjSC+04mw7gmzkwyyndGphjox8IfahuY58WyTXwZD1Db970kHEzICCIzQK
 hPzj4p9DAVLTkAOvbLiUDlob7/By4RPNgJUjFz35CFqpOGzVQMrI4ZPS6fqpU7jZ7ksD
 bIjsuzaHQu2mfF3RXJ1eakNSZJ6Dmwm+iZpBDgVsxW3ERe+AimXnHsRZJ92okcJGGkjV
 aqU94sTgKn9FdOaZ8Q6k/CI1FfbYuC5omT6MWGObgl7n46GEESmg2VXeUvwadjfZqe1K
 oYgjD+xjDb9Er369LRHjPbtRAHIA/96v9FQmuq57PmyDFNbCvkfEmpd1UdQi0OV02JtT
 8VfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911816; x=1703516616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PB3DqcYgnFgdIBTb4dftT5adpHcIIMTtv2wlN9XjGFU=;
 b=L1eOHIuot1LT41LeoRjxY6zjcdq9ENTQAn1MD1Att/mqMh4dQD22oSi1TN3iLRPeAE
 HJuHlRDGoVuQr+/fkhIT5VpKhWmqzK8gCiWMYce6FBVtMXNWGkgiR90ET662SIu21Btn
 cjO5M8Ypq/iRjUxqX4qkvy3y0Wj9A4nyS61NYYlMgNFL5h7k23SVib6XrxyfUdxfzzTj
 tyeYXY4k2agfe2++7XR5UTQ5N7RpkEdu3iz+3aE71lcmouiWmNzR8IXHyE8qGyncwc9f
 20K0PKSvS8CI/Mb0JyAVtSqvY5IczVS9epePA1OhH3BEWfai6MZWahCBr5tezPJIKgs8
 2wqA==
X-Gm-Message-State: AOJu0YwuXoY9hZWXprp5V7K5mdD0e5MtEexXvMp1v9uZygInfL5c6P9v
 fXWzU25BaeLugUSRjysvIK9sHw==
X-Google-Smtp-Source: AGHT+IHKdZF410gEtepxRmBMFWpM9cbxgjNZsjqzjne/l7cH67Fd4cFEOjeIBHxuxb8fcldnJa4P8w==
X-Received: by 2002:a05:6a00:2d05:b0:6d7:e5d2:77a3 with SMTP id
 fa5-20020a056a002d0500b006d7e5d277a3mr741792pfb.30.1702911815936; 
 Mon, 18 Dec 2023 07:03:35 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:03:35 -0800 (PST)
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
Subject: [PATCH v8 06/13] hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
Date: Mon, 18 Dec 2023 20:32:40 +0530
Message-Id: <20231218150247.466427-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/riscv/virt-acpi-build.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 3f9536356e..6bb21014fd 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -270,6 +270,19 @@ static void build_madt(GArray *table_data,
     MachineClass *mc = MACHINE_GET_CLASS(s);
     MachineState *ms = MACHINE(s);
     const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
+    uint8_t  group_index_bits = imsic_num_bits(riscv_socket_count(ms));
+    uint8_t  guest_index_bits = imsic_num_bits(s->aia_guests + 1);
+    uint16_t imsic_max_hart_per_socket = 0;
+    uint8_t  hart_index_bits;
+    uint8_t  socket;
+
+    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        }
+    }
+
+    hart_index_bits = imsic_num_bits(imsic_max_hart_per_socket);
 
     AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -284,6 +297,28 @@ static void build_madt(GArray *table_data,
         riscv_acpi_madt_add_rintc(i, arch_ids, table_data, s);
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
+        build_append_int_noprefix(table_data, IMSIC_MMIO_GROUP_MIN_SHIFT, 1);
+    }
+
     acpi_table_end(linker, &table);
 }
 
-- 
2.39.2



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9852EC07545
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:09:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvkAw-0007hh-1x; Wed, 25 Oct 2023 16:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAu-0007hP-S5
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 16:08:20 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAt-0003Xh-9N
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 16:08:20 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6ba54c3ed97so117804b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264498; x=1698869298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=axfbQ/lCL4+TsO9FA+miqVFGldI0+BwW7Pnjw899woY=;
 b=gdyzvZtKGQ1CYbMbncSi+LIgZRU/wIBqGXX/2CPni4mLe/JxY+X1FIy5Gw7QvAr+wS
 h2WNdp7Qp6GauH6W518x73+9tl3uT+BFGahxFNCmvtIpDhbA3eY0YeTxqRpFdWjUBgJo
 5uRA8SXn/RQKDZQ79BLMyXKXLFJ35NSDHSVo5J6lWZ//Vr5FeTkUv3H4TMI8uAOY4enj
 inPYZik6YNrAkzPWzTqPPa4TSecwuLFyEAZpzPfxN+8d+H3e+s3VoUp86+m1TA0uKvLH
 1ivu84+rBMt7ymwp3vAFcgh0RAhUC2QdrFiFN+XcU70YvG880eqM+twPPUVZLEQZcdQu
 /B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264498; x=1698869298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=axfbQ/lCL4+TsO9FA+miqVFGldI0+BwW7Pnjw899woY=;
 b=tnGHK19jQ8MgsQDI5VQ6RQeweot0sJLrk4h1FPBI6yZvvwkzlvRDLu0A8K3uxNsNEW
 3L/OgzPfvyqUdEAnaCMLN3nlNL75cWJqYymB+cHPgIs/rMIy/QL9tE4NDoyPNbNFsqC7
 FQHN9bjJgsE7RCfN4XBe5RWHCfVZGSB481n261NXLmFoGI3rqxYOL9WkF4i0HcYs8kqm
 Xnqo4n03CGCL8Fef6cl9KliiJRYJGSJPB8EdKMDPfSI0EiF1xc5Gn4AIooUVTb4fwJaN
 3hIu9N9IUhfU5H8diz0GXdhebB+5OAZTQZuXGZO8Vcc78rcoMjs+sVUNAogL+NKJ1PeD
 MlcA==
X-Gm-Message-State: AOJu0YwMIpv9P+6SwWlQkPdAjkQqXcsZdiJJihDarRyw1OYu7qPzJpLp
 zsRQRtycu01cxQA2ndF5RaqcAQ==
X-Google-Smtp-Source: AGHT+IGkRA+teUpg98QEOboRfCuiDHTae7ktmVODrCFAq0hiCTa9FhVAAu5oJi54sMFS43ROk3bc/w==
X-Received: by 2002:a05:6a00:2e8e:b0:6be:9c0:7195 with SMTP id
 fd14-20020a056a002e8e00b006be09c07195mr18477385pfb.20.1698264498050; 
 Wed, 25 Oct 2023 13:08:18 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:08:17 -0700 (PDT)
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
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v4 09/13] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
Date: Thu, 26 Oct 2023 01:37:09 +0530
Message-Id: <20231025200713.580814-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x436.google.com
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

MMU type information is available via MMU node in RHCT. Add this node in
RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index ebe7062b9b..dc7c0213f5 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -159,6 +159,8 @@ static void build_rhct(GArray *table_data,
     size_t len, aligned_len;
     uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
     RISCVCPU *cpu = &s->soc[0].harts[0];
+    uint32_t mmu_offset = 0;
+    uint8_t satp_mode_max;
     char *isa;
 
     AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
@@ -178,6 +180,10 @@ static void build_rhct(GArray *table_data,
         num_rhct_nodes++;
     }
 
+    if (cpu->cfg.satp_mode.supported != 0) {
+        num_rhct_nodes++;
+    }
+
     /* Number of RHCT nodes*/
     build_append_int_noprefix(table_data, num_rhct_nodes, 4);
 
@@ -233,6 +239,26 @@ static void build_rhct(GArray *table_data,
         }
     }
 
+    /* MMU node structure */
+    if (cpu->cfg.satp_mode.supported != 0) {
+        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
+        mmu_offset = table_data->len - table.table_offset;
+        build_append_int_noprefix(table_data, 2, 2);    /* Type */
+        build_append_int_noprefix(table_data, 8, 2);    /* Length */
+        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
+        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
+        /* MMU Type */
+        if (satp_mode_max == VM_1_10_SV57) {
+            build_append_int_noprefix(table_data, 2, 1);    /* Sv57 */
+        } else if (satp_mode_max == VM_1_10_SV48) {
+            build_append_int_noprefix(table_data, 1, 1);    /* Sv48 */
+        } else if (satp_mode_max == VM_1_10_SV39) {
+            build_append_int_noprefix(table_data, 0, 1);    /* Sv39 */
+        } else {
+            assert(1);
+        }
+    }
+
     /* Hart Info Node */
     for (int i = 0; i < arch_ids->len; i++) {
         len = 16;
@@ -245,17 +271,26 @@ static void build_rhct(GArray *table_data,
             num_offsets++;
         }
 
+        if (mmu_offset) {
+            len += 4;
+            num_offsets++;
+        }
+
         build_append_int_noprefix(table_data, len, 2);
         build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
         /* Number of offsets */
         build_append_int_noprefix(table_data, num_offsets, 2);
         build_append_int_noprefix(table_data, i, 4);   /* ACPI Processor UID */
-
         /* Offsets */
         build_append_int_noprefix(table_data, isa_offset, 4);
+        if (mmu_offset) {
+            build_append_int_noprefix(table_data, mmu_offset, 4);
+        }
+
         if (cmo_offset) {
             build_append_int_noprefix(table_data, cmo_offset, 4);
         }
+
     }
 
     acpi_table_end(linker, &table);
-- 
2.39.2



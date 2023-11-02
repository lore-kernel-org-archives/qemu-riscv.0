Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B49C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 17:05:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyb6y-0004G8-8N; Thu, 02 Nov 2023 13:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb6t-00040F-H7
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 13:04:02 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb6q-0004QU-HH
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 13:03:59 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-28094a3b760so1073832a91.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698944633; x=1699549433; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kEJDi666XlkLe9PxXC5wqKzUtJirne5zNNBfjCv1MRg=;
 b=jWedxvZGiEQtE/MmpnnGOrO/d9kiRUxUf0zZctYfRPeTiooUq/M1jLLKjYrkE1T7xq
 wd3RueFXGnbpmf+vR+vwOv+xzdru8/HTjXLWiWr4HytxADMrrLCi85JubhcpFGxCDIZ4
 SqjQJJcc1GxUA40Jel4RqkueZbY0/+QgFOStWnmbEOi69HKqyQi1YRpmt1jIHQMKihvH
 aycEdzAq2dHdhanD+5jlFrTPT3GDOTrAQnvqYvYC2UkHaPklHAZ/L58yLJibsMUMDEla
 DV9/r1GS7ht8Pa07K6lJEn/qT8Ig71eYvw5NstGOdZIbJb/QDVAGEOKyylTx2aJTEjxe
 LB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944633; x=1699549433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kEJDi666XlkLe9PxXC5wqKzUtJirne5zNNBfjCv1MRg=;
 b=v1+RdF++NevgnPmIjDmw/DbWGwRz4PgiwLDROghiBnvu4BJ2VBCaq0KnuWVddlEwrS
 Hglf1wc7153CbUggFcMN1HeMrOCmMm2uIt33UsfM0glLDzvcVV7S0J0AXMfb0/6HoCUv
 F61ma7MnbE9Cln/K7xO4bAivLciSc+5kqGfgTHA/YWBu/E9a0FfkN6WPgij9L4gvVCZy
 wSO1vyy38kSjwt8JfP0CBEJOsCbgevyT0XO28C8cwCuHbG4okFOjYOHveHtVzbD/VixO
 oX2SkRBzs9Qdhn+X4w21JSvYNQ/7m41rI3K5bJ2xS5lHni7XB3Q1TxxQHIHzo72PeOp8
 8GsA==
X-Gm-Message-State: AOJu0YxupqtRW3Cjb7JwCnz4HIJ8uJaR3x7hNwX5GBePndf8F3Tfd+xn
 oztgmUvpDThmA2crz0LsUyC9Hg==
X-Google-Smtp-Source: AGHT+IEhbDJhNzSvod40tXKkLM/aKrA7f3l/Xgq4LBsYo6QTkK9kc3+9I+6LrNoRJWByhEODhocfBg==
X-Received: by 2002:a17:90a:1c3:b0:280:cc73:4c79 with SMTP id
 3-20020a17090a01c300b00280cc734c79mr4170827pjd.7.1698944633318; 
 Thu, 02 Nov 2023 10:03:53 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a031200b0026b70d2a8a2sm25098pje.29.2023.11.02.10.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 10:03:52 -0700 (PDT)
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
Subject: [PATCH v6 13/13] hw/riscv/virt-acpi-build.c: Add PLIC in MADT
Date: Thu,  2 Nov 2023 22:32:23 +0530
Message-Id: <20231102170223.2619260-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
References: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
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

Add PLIC structures for each socket in the MADT when system is
configured with PLIC as the external interrupt controller.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/riscv/virt-acpi-build.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 4d03a27efd..d4a02579d6 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -94,6 +94,12 @@ static void riscv_acpi_madt_add_rintc(uint32_t uid,
                                       arch_ids->cpus[uid].props.node_id,
                                       local_cpu_id),
                                   4);
+    } else if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+        build_append_int_noprefix(entry,
+                                  ACPI_BUILD_INTC_ID(
+                                      arch_ids->cpus[uid].props.node_id,
+                                      2 * local_cpu_id + 1),
+                                  4);
     } else {
         build_append_int_noprefix(entry, 0, 4);
     }
@@ -494,6 +500,29 @@ static void build_madt(GArray *table_data,
             build_append_int_noprefix(table_data,
                                       s->memmap[VIRT_APLIC_S].size, 4);
         }
+    } else {
+        /* PLICs */
+        for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+            aplic_addr = s->memmap[VIRT_PLIC].base +
+                         s->memmap[VIRT_PLIC].size * socket;
+            gsi_base = VIRT_IRQCHIP_NUM_SOURCES * socket;
+            build_append_int_noprefix(table_data, 0x1B, 1);   /* Type */
+            build_append_int_noprefix(table_data, 36, 1);     /* Length */
+            build_append_int_noprefix(table_data, 1, 1);      /* Version */
+            build_append_int_noprefix(table_data, socket, 1); /* PLIC ID */
+            build_append_int_noprefix(table_data, 0, 8);      /* Hardware ID */
+            /* Total External Interrupt Sources Supported */
+            build_append_int_noprefix(table_data,
+                                      VIRT_IRQCHIP_NUM_SOURCES - 1, 2);
+            build_append_int_noprefix(table_data, 0, 2);     /* Max Priority */
+            build_append_int_noprefix(table_data, 0, 4);     /* Flags */
+            /* PLIC Size */
+            build_append_int_noprefix(table_data, s->memmap[VIRT_PLIC].size, 4);
+            /* PLIC Address */
+            build_append_int_noprefix(table_data, aplic_addr, 8);
+            /* Global System Interrupt Vector Base */
+            build_append_int_noprefix(table_data, gsi_base, 4);
+        }
     }
 
     acpi_table_end(linker, &table);
-- 
2.39.2



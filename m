Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AFFC25B74
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 May 2024 08:50:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sCbUK-0007sc-Hb; Thu, 30 May 2024 04:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sCbUB-0007sC-IV
 for qemu-riscv@nongnu.org; Thu, 30 May 2024 04:50:11 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sCbU7-0007gp-LB
 for qemu-riscv@nongnu.org; Thu, 30 May 2024 04:50:10 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1f32a3b9491so4678465ad.0
 for <qemu-riscv@nongnu.org>; Thu, 30 May 2024 01:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1717059004; x=1717663804; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EuGNiLoanyDO7mD97RqI1BTp6/0+i7R30n1y2I4bdsk=;
 b=S/UsPskS+A4/PKpDXbAna+CHDUN/kK490pJ9e2I8ja0gIz94zUFOr6IWiQVb6p6XG4
 UNmhve0w9AHspZxX1xoSLRbdSaIuenyTxrQ4eZyYR29UrfA1cSznIIE9FG8iP+CZ6vil
 h4k2twdxlngECCt75F0M33UYcU8bginfR3qdq8Uz7cVOVQbp9d3VhArNd9y4CNEF+0EN
 4OqLOcCceZd30gJcevluTLEaSnCvmO4h20hJJ87uSjuY8+gaT61EqlpUynoEdXFZa9NC
 c6fPjtGrGXUz4xDJbRx6j1eiTcMH1UaMZdIcpj0LLJHD48qKKzWhReryoxzA/wT48P4D
 ESjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717059004; x=1717663804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EuGNiLoanyDO7mD97RqI1BTp6/0+i7R30n1y2I4bdsk=;
 b=fJKn/3kqm7HLwWpQbHwLZAlGX81FdmxHgF52hHgvYKC/nyc4yK6orXqtD9r7+uNgGR
 i1PInUpE55VIuiirhnuzl/U1ILuoKfAMhONDA7orp6sHfPWU7wGWPy9qgMrx4gdi2QsQ
 lAPp4uLZ9wbaifNHBvVyGyUb6I9KYwJIOUS8ierORbFVwNKKs9bUu3W1x1TRBcJ3efc6
 eVE0ugbjARJtbYvuRxyy4wAkLHnb0FsnXzmY1bOM5WuntMXxg4hV0mji7laJU52j3RmY
 MEhN9haiId+1UfCD039elIiTr34CAxjw7JhjjRYceB/GL/jI47gucrLAlY8xn91IzPnO
 MUSA==
X-Gm-Message-State: AOJu0YxNw0WabJL/BOwMak1IPqfLKg3ADZr+0zFYlOP0cvI7xZPRuzLG
 J2P4FNm41nt5xPSxY8XTpT5F4jR9Cv9NkJJ5ENGKdLvkbvTJ2MvNd0WWZSPwSxM=
X-Google-Smtp-Source: AGHT+IEemVpxrSoBWd6iw4JWn7UHRdks1gSyMP0zf6IgrVA/+toY9pgdZYU3vZaFOoSUs7NlJWoTRg==
X-Received: by 2002:a17:903:246:b0:1e6:f93:801d with SMTP id
 d9443c01a7336-1f61983941bmr14047475ad.58.1717059004530; 
 Thu, 30 May 2024 01:50:04 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c992a0asm113227115ad.197.2024.05.30.01.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 01:50:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] hw/riscv/virt.c: add address-cells in create_fdt_one_aplic()
Date: Thu, 30 May 2024 05:49:49 -0300
Message-ID: <20240530084949.761034-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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

We need #address-cells properties in all interrupt controllers that are
referred by an interrupt-map [1]. For the RISC-V machine, both PLIC and
APLIC controllers must have this property.

PLIC already sets it in create_fdt_socket_plic(). Set the property for
APLIC in create_fdt_one_aplic().

[1] https://lore.kernel.org/linux-arm-kernel/CAL_JsqJE15D-xXxmELsmuD+JQHZzxGzdXvikChn6KFWqk6NzPw@mail.gmail.com/

Suggested-by: Anup Patel <apatel@ventanamicro.com>
Fixes: e6faee65855b ("hw/riscv: virt: Add optional AIA APLIC support to virt machine")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c         | 2 ++
 include/hw/riscv/virt.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4fdb660525..1a7e1e73c5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -609,6 +609,8 @@ static void create_fdt_one_aplic(RISCVVirtState *s, int socket,
     aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
     qemu_fdt_add_subnode(ms->fdt, aplic_name);
     qemu_fdt_setprop_string(ms->fdt, aplic_name, "compatible", "riscv,aplic");
+    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "#address-cells",
+                          FDT_APLIC_ADDR_CELLS);
     qemu_fdt_setprop_cell(ms->fdt, aplic_name,
                           "#interrupt-cells", FDT_APLIC_INT_CELLS);
     qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, 0);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 3db839160f..c0dc41ff9a 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -118,6 +118,7 @@ enum {
 #define FDT_PLIC_ADDR_CELLS   0
 #define FDT_PLIC_INT_CELLS    1
 #define FDT_APLIC_INT_CELLS   2
+#define FDT_APLIC_ADDR_CELLS  0
 #define FDT_IMSIC_INT_CELLS   0
 #define FDT_MAX_INT_CELLS     2
 #define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
-- 
2.45.1



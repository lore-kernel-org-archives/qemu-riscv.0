Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5CCC35FFC
	for <qemu-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 04:32:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tvqWY-0006wL-NM; Sat, 22 Mar 2025 00:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1tvqWX-0006w1-8O
 for qemu-riscv@nongnu.org; Sat, 22 Mar 2025 00:31:53 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1tvqWV-0002XY-LH
 for qemu-riscv@nongnu.org; Sat, 22 Mar 2025 00:31:53 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2239c066347so62903365ad.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Mar 2025 21:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1742617909; x=1743222709; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GtxJMuQFfyWdLGQe0v57AqcYNUIPDkb5VuMIF6MREw4=;
 b=f/irDYweBkAh+o/7gzlCdSYmjlrpOR6NzVZSecnCpxegQddcoJwqeUI1IKq9ZimQwl
 /qEPT1NUT4MyWcXfpVHP4/1X45v6gJnXbMB9FenteQez3xFL/4WYwkZBRP41KsGyfWko
 8K8j/6KJh7guN4i1hhFhLsvgmIFRAylQYh0i1AvEfLQzArH9BMtCEK+spHlqOD1dONll
 XIPv2SKgxjV+auzhPagO0enkQYdMQ8uD3nubglRARsF176+4I2MtL6Pq9S+Z3fZzRGi2
 lP8iFL2Ns12VPVnYJZjc62661AZN5THw1PSo2jZr1XO3YcOXwCmpC/L4Tu9ipgbwR/GF
 J7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742617909; x=1743222709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GtxJMuQFfyWdLGQe0v57AqcYNUIPDkb5VuMIF6MREw4=;
 b=WZ55VEguCWaQ3X7LBTip6ZN3A85TGKpQU9eWY6iMgcFr1hvy7zM68R0vnh08LCvaL4
 4bJ2PzeBS0aOHsNv6rhoRWjBwR8STyJDx4hZm2ld5MuJMS103KegCg0oJHfEGuE9wdwU
 OMHXo8TNpuNrwz1Z2ig+mSJxvmzIpCIYvHH+EpDMS0ivC8opUuS9xfBaVhBfJJWOXJSP
 dWFr0DFuw+4WNYvdSBZH3tESNbDuXrVeskseoeFcuX2QdRXuIAuK1CcZkFXy4K9jh1yJ
 Nj2M+GRkNUSTJKWML2rDmJVXusbYCBgoIKj9e/JHVDbduA5q+aALYVOMMxh1V4fQcdX+
 E9+g==
X-Gm-Message-State: AOJu0YzxYJ6/CYYJ+rCxxVjThyHQtgsm+9k+dX8tzVrGamWWgYJQNdvG
 RP05V2nhLhTdUtZOo92kdklX3dVZfIGrh43JhVY3n46XXG7q0Mjgn7GFQlz+eXIULJh7Laze4+e
 KPjU=
X-Gm-Gg: ASbGncsxRXpoLrpqU7qPs7lCyITg+cXDTyp9YPSTnNDyWfbaBCGd/nsD5FrGm9XDMbA
 qnaytg2DquVwN17zOMnjcRg3GBdmMIiqkJbaha30kzgPpYNe2mNWF7YcGN5czKmkGBUYj2PiKOw
 bpEGO7IuSmf4431ySzKX0TYG0DTs2vh3dLkbTSNwxFu7F/SwdAscDqtidCE2K9VPdge45ArjdJk
 NFa4yXmSSdv5uURaCLYdV6xpXeMeEhrvFX9l+mWiv4OQlvhB/4bF6Pbdt1DVGmvCg9Iw4EIjiEM
 fhBpNr5YjDYAiz2myQK/L7eeGXlS38QSa0P3DZ3Vl+Kg/XqoZXVTyoY=
X-Google-Smtp-Source: AGHT+IHB+eFYNHkX6/Xlag0mI3TwtVaS6R9ciRl6HfFtKSPQN+vtqYmDF/1AEvuF8s471V9tzms4Fw==
X-Received: by 2002:a17:902:8b85:b0:223:4b8d:32f1 with SMTP id
 d9443c01a7336-22780c7e3bdmr71877945ad.1.1742617909629; 
 Fri, 21 Mar 2025 21:31:49 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.199.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2278120a5b6sm26824645ad.252.2025.03.21.21.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 21:31:49 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 1/2] hw/riscv/virt: Add the BDF of IOMMU to RISCVVirtState
 structure
Date: Sat, 22 Mar 2025 10:01:37 +0530
Message-ID: <20250322043139.2003479-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250322043139.2003479-1-sunilvl@ventanamicro.com>
References: <20250322043139.2003479-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x632.google.com
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

When the IOMMU is implemented as a PCI device, its BDF is created
locally in virt.c. However, the same BDF is also required in
virt-acpi-build.c to support ACPI. Therefore, make this information part
of the global RISCVVirtState structure so that it can be accessed
outside of virt.c as well.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c         | 1 +
 include/hw/riscv/virt.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index dae46f4733..ce256fb3b3 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1116,6 +1116,7 @@ static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
     qemu_fdt_setprop_cells(fdt, pci_node, "iommu-map",
                            0, iommu_phandle, 0, bdf,
                            bdf + 1, iommu_phandle, bdf + 1, 0xffff - bdf);
+    s->pci_iommu_bdf = bdf;
 }
 
 static void finalize_fdt(RISCVVirtState *s)
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 48a14bea2e..7b4c2c8b7d 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -63,6 +63,7 @@ struct RISCVVirtState {
     const MemMapEntry *memmap;
     struct GPEXHost *gpex_host;
     OnOffAuto iommu_sys;
+    uint16_t pci_iommu_bdf;
 };
 
 enum {
-- 
2.43.0



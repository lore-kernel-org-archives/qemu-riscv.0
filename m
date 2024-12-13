Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BE0E7717F
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 19:31:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tMB96-00015y-7k; Fri, 13 Dec 2024 14:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB7I-0007Cc-18
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 14:14:24 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB7C-0007Zj-2o
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 14:14:23 -0500
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3ebb1652729so114589b6e.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Dec 2024 11:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734117255; x=1734722055; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n5D+8o6Yro+Zz5cVKT8gicnF5oLBwjRb2DvBbHQ0DT4=;
 b=PpEGeeC9Tu1owfedzcwmhKASjwBf9BxEVafuSIxghO+02QHcu8uYMDCIM95K6BYWUM
 y6Ns7P+9SbD1dWib5XELepF2lYMIMulfR4bttuwqo6DWlRtW3BkY3zwHrxsOuRKfyA/A
 OBSVaMwer+XmfQyLFbB1PYS71x2+zJoyI7Zfj6iTJe16dVmvMcUAuozuLoZRtBlXCRhn
 JBTRXUUfrxgZOliiHMW/BStEVX80NDDXRsjF4Cs0k6UNMaBZ3kDo4uZLEB6l7VYPJ8Ao
 eTG5Zdf3pS2cqK8Vn15oO9yEY/NW3vyTqIcQ92lirMZjLDhTZew3uYvSzt77aCkLxzLr
 kFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734117255; x=1734722055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n5D+8o6Yro+Zz5cVKT8gicnF5oLBwjRb2DvBbHQ0DT4=;
 b=GTnWhRzNGbbrfr3dhqilsXzl2OLshAKGEluoEjV6Fp0o3e2jhVUolG7DCFbfo8bGPN
 /VTPuul5AvsgYvJF7uttsxHhMIodqeibzgOeczb6pN0R/nsPUi/qqpU1HkrrNiii2bVh
 ttcTpKIl16ksDwOFvUowZcl7/QzIcfzj4OPeqbJCYZ6gpUj1e6K1II3slmVg6HAxui/9
 Az4NuIjDVvqi4MFQdd6UiEdwwi8NMkYH1R9gCEZppuVqvP97njAxeC3TN+FJbXez1DoP
 F+OA2b7INrKpz14cYYfypmf9KcW/hqAjhLk5xg7waOMlex42u861BAzoUtur6hOTLMLE
 7iRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj1cHzPDLhwkAeOTvgztnv52Y53WlX7hVitHZ5aKqQggGoBTn5CHfaWB4/H/xQrWKexP2O/u7Kldq9@nongnu.org
X-Gm-Message-State: AOJu0Yz9/kaup92rtED8Ppr1VCC4ikSnzcaGWQJ0TDmZlSLvd8AREvVc
 PwIvJG1piOv94K4aaXGCztUFOICNds6iXwgUcUyw5uRRfKkHUwWO1fMltXTQEBk=
X-Gm-Gg: ASbGnctLs5rpvmWs2uTIAj67mCgW0riMtK9PmRyu0FKoFx+XkrVJXAdtdbgkyw/3nN4
 XxZwOgpvm5Frs5zLZh6bD06KyZ6+QPnlJJljcCIdfQ+732bz6rOXzR4XNAwD+pctcpfUh3/x+d4
 seFEgS27Kz+B9jDCfmJkdLQ5MfW4L+yz3eEtMT5t9QnOk+URPaAgaf1dsofXUzNUH1OPBVEUv6w
 CyqukC9TymcerudW7vnFvgFuaD3ZlOvSaDjL/ec23edxJa/F66RolMq4FTKYk6h
X-Google-Smtp-Source: AGHT+IFhcJeeQrJMN361yXRsu4JxFeL9dGBVLt0J+yFd3Tz9woaBSW+oEzuDMMNoGACH9/iM7xP1dQ==
X-Received: by 2002:a05:6808:1887:b0:3eb:556e:dde6 with SMTP id
 5614622812f47-3eba6867bb5mr1879165b6e.12.1734117255043; 
 Fri, 13 Dec 2024 11:14:15 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3ebb478a497sm3545b6e.10.2024.12.13.11.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:14:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:OpenTitan)
Subject: [PATCH 51/71] hw/riscv: Constify all Property
Date: Fri, 13 Dec 2024 13:07:25 -0600
Message-ID: <20241213190750.2513964-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/riscv/opentitan.c       | 2 +-
 hw/riscv/riscv-iommu-pci.c | 2 +-
 hw/riscv/riscv-iommu.c     | 2 +-
 hw/riscv/riscv_hart.c      | 2 +-
 hw/riscv/sifive_u.c        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index e2830e9dc2..8ce85ea9f7 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -306,7 +306,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
         memmap[IBEX_DEV_IBEX_CFG].base, memmap[IBEX_DEV_IBEX_CFG].size);
 }
 
-static Property lowrisc_ibex_soc_props[] = {
+static const Property lowrisc_ibex_soc_props[] = {
     DEFINE_PROP_UINT32("resetvec", LowRISCIbexSoCState, resetvec, 0x20000400),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/riscv/riscv-iommu-pci.c b/hw/riscv/riscv-iommu-pci.c
index a42242532d..a695314bbe 100644
--- a/hw/riscv/riscv-iommu-pci.c
+++ b/hw/riscv/riscv-iommu-pci.c
@@ -157,7 +157,7 @@ static void riscv_iommu_pci_init(Object *obj)
     iommu->icvec_avail_vectors = RISCV_IOMMU_PCI_ICVEC_VECTORS;
 }
 
-static Property riscv_iommu_pci_properties[] = {
+static const Property riscv_iommu_pci_properties[] = {
     DEFINE_PROP_UINT16("vendor-id", RISCVIOMMUStatePci, vendor_id,
                        PCI_VENDOR_ID_REDHAT),
     DEFINE_PROP_UINT16("device-id", RISCVIOMMUStatePci, device_id,
diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index bbc95425b3..07fed36986 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -2235,7 +2235,7 @@ static void riscv_iommu_unrealize(DeviceState *dev)
     g_hash_table_unref(s->ctx_cache);
 }
 
-static Property riscv_iommu_properties[] = {
+static const Property riscv_iommu_properties[] = {
     DEFINE_PROP_UINT32("version", RISCVIOMMUState, version,
         RISCV_IOMMU_SPEC_DOT_VER),
     DEFINE_PROP_UINT32("bus", RISCVIOMMUState, bus, 0x0),
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 613ea2aaa0..0df454772f 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -27,7 +27,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/riscv/riscv_hart.h"
 
-static Property riscv_harts_props[] = {
+static const Property riscv_harts_props[] = {
     DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
     DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
     DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index c5e74126b1..124ffd4842 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -936,7 +936,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
                        qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_QSPI2_IRQ));
 }
 
-static Property sifive_u_soc_props[] = {
+static const Property sifive_u_soc_props[] = {
     DEFINE_PROP_UINT32("serial", SiFiveUSoCState, serial, OTP_SERIAL),
     DEFINE_PROP_STRING("cpu-type", SiFiveUSoCState, cpu_type),
     DEFINE_PROP_END_OF_LIST()
-- 
2.43.0



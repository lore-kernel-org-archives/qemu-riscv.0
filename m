Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC33E77184
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 00:51:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tMzJI-0001Lg-3c; Sun, 15 Dec 2024 19:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJC-0001Ir-F0
 for qemu-riscv@nongnu.org; Sun, 15 Dec 2024 19:50:04 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJ9-00075L-PN
 for qemu-riscv@nongnu.org; Sun, 15 Dec 2024 19:50:02 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-725ed193c9eso2789827b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 15 Dec 2024 16:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734310197; x=1734914997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/txMo+Nnraz9AAcWBO+Ht1SEClLczXwE0l/xGp309E0=;
 b=cALPZs4gPoplCd4xK+AsOxHGgOm0gazgl2ccmMBlj/SCNEHh1KbYzkk5jEwJrHiOuj
 A0pBlO3Wj79MfHIGJOl6aRWTA9hYUGHOof3hGlMcFGbuANBeCnzREK0VGZZKIeUaGHWn
 Y4EzBqP8fqB+WJGdmnACWXz9zOYIhPSD8UPNRhji78lCQ1QbR78ojNnZW9g6aL7eFjf5
 Rrj+ZkqWVUJPC5lJCVnAP9A9Tk0Yelwwe2qOeRETBMaaNaktfqK6+vd73DlNaGJUcj7q
 9v5sb9qMoTEwSiQuMBe/t+IURoUVTbP8BjbX5WE27/Y15RhyB/X7SkfxDkEPMuEzs/yL
 Rwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734310197; x=1734914997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/txMo+Nnraz9AAcWBO+Ht1SEClLczXwE0l/xGp309E0=;
 b=gqpFB00gA85djuxNXju+cI9J39056LTxUYgX56QSY2ns5JIg5Wuh/TQUJFwpDmZEQ8
 5HtWxMjTz9qJOKo2WdkH+aIR+F9Kksbux5OWzzFEL6UpFxaMxiuR3fXRAyqL851VWM3i
 ekVNGXJu+D9nmMH4Deg0VWFgB/Vc4f7Kltbnkhn/qrEvD7bttHtWwJaetK86EzHzGZsq
 lWRPNSZkAdrEckV9pQF5qsHmGlKiDHQcIt2PF8MILN+Lq7uQn/6KhqPVMmW7//Ex03EL
 oUByQElrvGDZKA+Qxdap+DIN+VUtcNHTzaZaq88n0H/bLUDOwkId5A9kl08CDCx4kEQi
 GnBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXIy+0UV0cn0tSzm2O9CZ4MDpRxSrzny4GGC3V41cofVVWkNv5b3yOey2DBf97DxhwhE106Sv+e8zV@nongnu.org
X-Gm-Message-State: AOJu0Yx7mer1sSixcepTeUnr/nUc3jc+nKtyEfwsaB0aw6dz9042ohwX
 quT/XY5mdfIp8hl0YOdhhzjGa0nv+xeLhjkAy67syUBrT16VB3U5awt1Bs5tmLLBBqRW6b7Xtur
 y002/veh1
X-Gm-Gg: ASbGncvYaIXsr25Y5p3disYpG0fdNfxfwEgZBEHKnKVo4bjpRTWlQ2JPoxVUwm9ESdV
 Ts2FYdZ+NGxo0GWx5SIaXk7iPue+N/Az2w+lflSeGl1MFo5xfZ4xLmM6Ls10Of23nqjKw1d6Ri/
 AKS+pd8niQmnj+O1H4P1NkGmZb8yMsIasumCSqf9DZDu90LHGvfU13YQt+aYlI+gw2tyDkJFjJT
 x2DUPMH0wbPCb+ucQk+TBiklKeW9LDjUUxNfTRECgHwpjzIwVf2nLv2DDnaapsXZJBUPswlIpHG
 Xc25OC7T
X-Google-Smtp-Source: AGHT+IG7C/z9lqXQKhZELwgwHH6ev+PqxHmUpUtpuDtnyBnjuDPC1LlZ9b9OL21KR951RrunYjL69Q==
X-Received: by 2002:a05:6a20:9f05:b0:1e0:cf9a:87b1 with SMTP id
 adf61e73a8af0-1e1dfbfbcbemr15265933637.6.1734310197718; 
 Sun, 15 Dec 2024 16:49:57 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5addbf9sm3059586a12.47.2024.12.15.16.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 16:49:57 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [RFC PATCH 4/6] hw/riscv/riscv-iommu: Allow PCI hosts with iommu_ops
 registered connecting to the IOMMU
Date: Mon, 16 Dec 2024 08:48:55 +0800
Message-ID: <20241216004857.9367-5-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20241216004857.9367-1-jason.chien@sifive.com>
References: <20241216004857.9367-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x42a.google.com
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

pci_setup_iommu_downstream_mem() is called to set the downstream memory
region of the PCIe devices.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/riscv/riscv-iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index e9a0775d6e..f5d53a36b2 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -2436,6 +2436,14 @@ void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
         QLIST_INSERT_AFTER(last, iommu, iommus);
     } else if (!bus->iommu_ops && !bus->iommu_opaque) {
         pci_setup_iommu(bus, &riscv_iommu_ops, iommu);
+    } else if (bus->iommu_ops && bus->iommu_ops->set_memory_region) {
+        /*
+         * TODO:
+         * All memory transactions of this bus will be directed to this AS.
+         * We need to distinguish the source device dynamically.
+         */
+        AddressSpace *as = riscv_iommu_space(iommu, 0);
+        pci_setup_iommu_downstream_mem(bus, as->root);
     } else {
         error_setg(errp, "can't register secondary IOMMU for PCI bus #%d",
             pci_bus_num(bus));
-- 
2.43.2



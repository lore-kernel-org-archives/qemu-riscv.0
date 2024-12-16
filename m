Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50808E7716A
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 00:50:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tMzJ9-0001Hu-Bc; Sun, 15 Dec 2024 19:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJ4-0001Fz-Kq
 for qemu-riscv@nongnu.org; Sun, 15 Dec 2024 19:49:54 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzIw-000735-Ou
 for qemu-riscv@nongnu.org; Sun, 15 Dec 2024 19:49:53 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-216728b1836so24537525ad.0
 for <qemu-riscv@nongnu.org>; Sun, 15 Dec 2024 16:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734310181; x=1734914981; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGU2u7dc4vF2vyfDv3T9ZFSN7CKazY7j/eyKw4lus10=;
 b=MN9zGA17PStnPXAYgKMsCO1SAv3FCefEW7nhEpWTQ7PJAW/UXoQcPbq/ZdaP/HXz87
 Y6BTOB5AjhjKGAiQwf3X7Sa4i2rVjAlIXyfK2aNqH8SwmXo8kHXQkW6BBTvVjqYh7c1j
 oM8HhvYgGcXT1o6lSronAYTDa+CKcHC0EwciDvxopfneFxMbjTSLhmOnzf7LgUSB/44R
 c8+fAIvYLgV+CHDNk1JNPb8qQgdICe536CRR4845aTrPM46Eso/PUzCpWtF2AvBqK63Q
 unSiKHbvCmyCcjWO8oD8ollTjfstojMwiYFRIK4dLzThrSyMcHJKZoY0w3CEiGQ2SjF5
 tXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734310181; x=1734914981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KGU2u7dc4vF2vyfDv3T9ZFSN7CKazY7j/eyKw4lus10=;
 b=cqFWmDE1HZahp5OsdDjY0p71qSO7UizMSqjKuodY+UGXO09mQDYudFXVQ/ewybdol2
 MvPPqXFqnkfjgL9ndrIZg6KsAn9b+pIeYfcuYBIxBT6VcfVpzsMUHtHZMkJM45o0uOxF
 m/vE7VBfH8EBfLQxO4P9x9R4DF+6L07kHg2i9ZjBPzDy3lv0VR63Ma5m79019eGTLCx3
 vl4CncO/rWuamdyWeDIQ7XCD25TLRhH2ICfId/r6DyODEEwWueYpEIHGlxlTSDKqLxao
 RqYye/F/A3Oliv0YU1CeraMe5BRibQqW93BBH3ZWNLpp9CFR5Svet5/Lqj47/ON0Vq2h
 Kk8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSpG6X0Q6+Sk+2cbzuiNXhsSoYghabt5RjNNXM6yVceAbvmXOTncsQT8gHB9ok5W0N2cPxWIuiNY/e@nongnu.org
X-Gm-Message-State: AOJu0YxB+dyoI2vrkoo0DUc06FuSdWVM0tOBtI0I0gNdiC7bzNAHnc78
 0v4/p7hprPw2yn1s/5rhIhQHrllETaWcUdAZzxjABNxNYhY3/hEjqwNoiigyN0c=
X-Gm-Gg: ASbGncvz2VX+KNRiQXGC9rvGt7UPJx7teF2GXLX0ioFKwZtwZFduyvb3tsXrsa0eBZb
 r/iWlXwPa90gjCYHhVhWkvaK3C0K/GllGZJ+povcBtVmWLoJs98Q35Pcp8k6tqWidtyhJMbiXE5
 zQ5YV08+4S3Rn/gesESq8IErAvrlw9yyGI8h8/K2HYR8FBSfl+a/mYFylruHYd52RMLIQhUq93O
 KKXjns2K4bxistg16R0sfmI1S7JKY61mYh8OAo62g9gGHdZ7oZOKveUES7tQD14oDSLrJtvmYaF
 zi0RU85X
X-Google-Smtp-Source: AGHT+IHHXEDgr6REu1/UiEmWcihNjDhUHo43i90n1NWtN7yO5Bz8w417fbDj8Tgyg0Q2/o9Dcvfbpg==
X-Received: by 2002:a17:902:ced0:b0:216:1ec6:9888 with SMTP id
 d9443c01a7336-21892a13eeemr124259335ad.33.1734310180693; 
 Sun, 15 Dec 2024 16:49:40 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5addbf9sm3059586a12.47.2024.12.15.16.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 16:49:40 -0800 (PST)
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
Subject: [RFC PATCH 1/6] include/hw/pci: Add a callback to set the downstream
 memory region of a pci bus
Date: Mon, 16 Dec 2024 08:48:52 +0800
Message-ID: <20241216004857.9367-2-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20241216004857.9367-1-jason.chien@sifive.com>
References: <20241216004857.9367-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x62b.google.com
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

PCIIOMMUOps.set_memory_region() is introduced to set the downstream memory
region of a pci bus. When PCIIOMMUOps.get_address_space() is already
registered by the pci host(e.g. TYPE_DESIGNWARE_PCIE_HOST),
PCIIOMMUOps.set_memory_region() should be registered as well, so an IOMMU
can designate the downstream memory region for the pci bus.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 include/hw/pci/pci.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index c0717e3121..cb3039bce8 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -388,6 +388,19 @@ typedef struct PCIIOMMUOps {
      * @devfn: device and function number
      */
     AddressSpace * (*get_address_space)(PCIBus *bus, void *opaque, int devfn);
+    /**
+     * @set_memory_region: set the downstream memory region for a set of
+     * devices on a PCI bus.
+     *
+     * Optional callback, which should be implemented when get_address_space()
+     * is registered by the PCI host(e.g. TYPE_DESIGNWARE_PCIE_HOST), which
+     * makes an IOMMU not able to register get_address_space() again.
+     *
+     * @opaque: the data passed to pci_setup_iommu().
+     *
+     * @mr: the downsteam memory region
+     */
+    void (*set_memory_region)(void *opaque, MemoryRegion *mr);
     /**
      * @set_iommu_device: attach a HostIOMMUDevice to a vIOMMU
      *
-- 
2.43.2



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CAAC19F32
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 20:40:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqeUY-0004Oe-7X; Fri, 07 Mar 2025 15:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUW-0004Nq-Bu
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 15:40:20 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUT-0001uW-MZ
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 15:40:20 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2ff80290debso2011139a91.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Mar 2025 12:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1741380016; x=1741984816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FWXlQU/7CPw40ZorM5xTztxlUlpDOkFuJBD3+uMXoc=;
 b=bCftfwvBFIZxShhYR3QFk+HSrZFHnCL4LZ/Uf2/XPJfK3q7miRmbgOwpepDrEPx19W
 Z05KXDNks8cED2GTvUkUk2FC3heRT6hPg2FaFeOY9efOCvrMUJjXzxwL7hirlmeTgENQ
 Jf9OrzKJCKIyDSR/xz719IhZbfn2mYZUI0nQMQXWuEFGYRPy3AvyQMs6Z8/YAXS+B09B
 rmSGjgW5Ut9uypUj4LBW7Aaq5BxThYs33A/VHJgsVpDJr9aiXwsf0L1YNc/KAStf3uRj
 rhYauNxPmwX8+yGmYOAgdbXnA3eKyXCTUMIXRNlEYhebmkRHRp2S+nBq/aDuoZZmmLTG
 ds/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741380016; x=1741984816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2FWXlQU/7CPw40ZorM5xTztxlUlpDOkFuJBD3+uMXoc=;
 b=XiIecDP8waSUfx3AO/7ooQV/uNpDtDA1aK4ScrP17i9/Cn4T9k29eO3MTn4AtzARWS
 aapXNbLY1VwgxQhFbQ3G49YouGM3VG+DmJk52NquzaV0SuDz2DP8wW7fIflxFB6Bae27
 OKlxz2Ro9dd8rpzKs0Gaq9rtZ1h6aO9o2jb6QerkanhYhoijPhruAYvExmwHSIjsNoYk
 lfk2Y/q1SGl8/hc2WJS9uK1LqYsN4gXpZSYvfBpetANVXnh2MXF7OKVFtjeDJV/GnYz2
 QSyH0xMXJbNC89ttI+4+eeNnZoiCy6Z+wa9gdyCofmympwuDIy2jihCxKhhyqTQ00dII
 9sdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrYtAsgCOi2qhKFg2weK0BC4LiUX/14/HPqab6yBrGyRxxH8UgqfEdPpt/1vcDGrRZArBwDDBOfIZl@nongnu.org
X-Gm-Message-State: AOJu0Yw5Q3JoUJhJ5ndAThMUlUnEjQrsukXU43IEqFH8yrJV1nAT0ugg
 oyn1etzSMcoXv+0euWnbKTFIbX7sgOE+9/zJMDGK78o9ZgHvPw0DCmH+ZK4XHUU=
X-Gm-Gg: ASbGnctSJKhdM0dlVnYD1i7hTDGN9pouHSZR3Q1vwhXCrfoROhBy49jS9+9NVM9j+kB
 Kl4stM09eCn8wBJkcJmtzqk4tbWOX/eoFg9sGC1uMAZwyaI2bDBYTfFbquk3/MTdGji1Jg53Vtm
 ztU3MAhp75OQUDdGXWXLsSiw1K4Gbo7UeMu3sDKh7AEYc6gzsflNc/eZ/SzTXrI5cPDU58fwQY7
 yha8RZOrNK1YU4HMI1iq9UavZz1NNNlEb8PX7r5aFqB9Mp/xzVRNS210pc/ja+1TbFxjTPMaf1+
 OW9UjcrQXOmRufBq+K9UBagjRFEvBQ9hWIWfH6k2uTu7N9m618LtlT4dc3HETsBD13ReFUwn
X-Google-Smtp-Source: AGHT+IFFJ/V9KxlOpoiEFBw9twFP49rnKXcC+4GGHwI4zIUDhw+tjQ+4B2JBFaLUsizClPzhjcdYkA==
X-Received: by 2002:a17:90b:3950:b0:2ff:6167:e92d with SMTP id
 98e67ed59e1d1-2ff7cef761amr6758275a91.32.1741380016319; 
 Fri, 07 Mar 2025 12:40:16 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff5aa3d3ccsm3270900a91.0.2025.03.07.12.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 12:40:15 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 1/4] include/hw/pci: Introduce a callback to set the
 downstream mr of PCI hosts
Date: Sat,  8 Mar 2025 04:39:34 +0800
Message-ID: <20250307203952.13871-2-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250307203952.13871-1-jason.chien@sifive.com>
References: <20250307203952.13871-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=jason.chien@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Many PCI hosts utilize struct PCIIOMMUOps to implement their ATUs, preventing
coexistence with IOMMUs, which need to register struct PCIIOMMUOps as well.

To resolve this, set_downstream_mr() is introduced, allowing IOMMUs to
configure the downstream memory region of the PCI host, enabling both to
coexist.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 include/hw/pci/pci.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 4002bbeebd..fcf648da19 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -391,6 +391,18 @@ typedef struct PCIIOMMUOps {
      * @devfn: device and function number
      */
     AddressSpace * (*get_address_space)(PCIBus *bus, void *opaque, int devfn);
+    /**
+     * @set_downstream_mr: set the downstream memory region for the PCI host.
+     *
+     * Optional callback that should be implemented if a PCI host registers
+     * this PCIIOMMUOps. It allows an IOMMU to designate its memory region as
+     * the downstream memory region of the PCI host.
+     *
+     * @opaque: the data passed to pci_setup_iommu().
+     *
+     * @mr: the downstream memory region
+     */
+    void (*set_downstream_mr)(void *opaque, MemoryRegion *mr);
     /**
      * @set_iommu_device: attach a HostIOMMUDevice to a vIOMMU
      *
-- 
2.43.2



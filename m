Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCB2E7717F
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 00:51:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tMzJM-0001S9-HP; Sun, 15 Dec 2024 19:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJL-0001Pd-19
 for qemu-riscv@nongnu.org; Sun, 15 Dec 2024 19:50:11 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJJ-0007JM-7d
 for qemu-riscv@nongnu.org; Sun, 15 Dec 2024 19:50:10 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-728ea1e0bdbso2564722b3a.0
 for <qemu-riscv@nongnu.org>; Sun, 15 Dec 2024 16:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734310208; x=1734915008; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWmGdfs7I/39bU6vTy0i46WBke+O98sxD/aRcDZSQXA=;
 b=BEtw417p0hbGy2kmGzuSeU97E0qDM6CoKLm5ZZUe6/GsGhtHD6yWVRoIIgfW+JqQkW
 qEdUIcATUmN3gHqbXIA13AXG4Ln3zwExn4lxKq/LgUwMsdNVlCrJouGvcU5nQD/iOXQC
 EBtkdzwEryWQfnBMaLTQFPi8TTXlwhT66nv2YerUd3zXcD71uhbCn/jzK2DRbffqP+Hn
 x8taTB3HysBOtjZleMrzoauCbmj/t0hLJkNXlBDmJlYcqSntGp5iKd8QKeqmUyjZbiJQ
 fHxRcybq3TMbcDB9w3E9VLNUBxDbImvzYwF0I/4+rM44OOYap5w/AAH2r2NCcFYFrajN
 UFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734310208; x=1734915008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWmGdfs7I/39bU6vTy0i46WBke+O98sxD/aRcDZSQXA=;
 b=M82JYQDXfCYaOyMNN2fofE7oMsIoPVVRKWG+xYZIeUqB2jU4n+oEy3Fmgngk0N89Mb
 /qvxqtF7Hyl97BD651q20N+KJD7xqlDDUUCkAvWNRJBKJAaYJszBhvYgLWZ4IEQntRca
 tLiLBuFuyN2QMAugnfImMgaM/yqaKRwMpO+fD9U7Aezc7iPEULbHB9VzKQmwHSz1OFlT
 11NPd0ToemZxIRWF5rhZt712eGM0FqHLd3zfxxqC07XbBqYooY+2Fz/1O2CxdwqjGifn
 I9I/3pJZe6u2+VxQiwA57TZ5kjh/XN62kLrfsI+fE2Js3/WaVEhjS6R39Q5PaY+4v7JT
 oBTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgpUfHpoC8QHcrmwFhLZaoLWLlA0pMMHhis4KChFnSaPbz3uKvCCZO6kzEvRzpciKTbxJCGqeZPqmS@nongnu.org
X-Gm-Message-State: AOJu0YyuxnMw7VDHD/w7snFM/2SW8gVYEmedFKecvDYrWOhKGuED30Lv
 70/rMcv/AbtzM0PiX0Z53c7SQc5rIdMbZWdvn/w6o4ncCY264asRVXi6anbhZes=
X-Gm-Gg: ASbGncsS1DCUUEwsDMLUctb3sHtx2Qbn5Zg9E7kiUmIsPoDuH5+eiF3Rly/UHK7UXQh
 v+V2Z76usfq6M4We4aKjUmtuQX5yFONC+3s+e48/wKLi70tY9aeN0O0pxPARM47nB8xNjrkRvkb
 p52azed+A3J3Yq8O+RA06tOnTyXu8V1EhunMOp2bT3YxtVYN+b6Q7FSQu763KJ9oSG7YRO2MAJy
 CN3SUwxa4un1sXGhpQ2ysG8mjURpiYR7TrXY1FKhmEAtjcNGSy7XRZ2nfFwJQefsUgmUDg0eY7Q
 iY5BBGvm
X-Google-Smtp-Source: AGHT+IEUS1j5PJe2vcxu53unoG7gkVeDB2mRvah5pKoextxKD6OEt13xB3poaEE9+1mKa223oiQq8g==
X-Received: by 2002:a05:6a21:7185:b0:1e1:f281:8cfd with SMTP id
 adf61e73a8af0-1e1f281925dmr8531798637.15.1734310207905; 
 Sun, 15 Dec 2024 16:50:07 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5addbf9sm3059586a12.47.2024.12.15.16.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 16:50:07 -0800 (PST)
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
Subject: [RFC PATCH 6/6] include/hw/pci: Send PCI dma requests with memory
 attributes containing BDF
Date: Mon, 16 Dec 2024 08:48:57 +0800
Message-ID: <20241216004857.9367-7-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20241216004857.9367-1-jason.chien@sifive.com>
References: <20241216004857.9367-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x436.google.com
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

In order to distinguish which PCIe device sends the request over the IOMMU,
the requester_id must be set with the BDF of the device.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 include/hw/pci/pci_device.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
index 8eaf0d58bb..e22d05dae8 100644
--- a/include/hw/pci/pci_device.h
+++ b/include/hw/pci/pci_device.h
@@ -263,8 +263,11 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
 static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
                                        void *buf, dma_addr_t len)
 {
+    MemTxAttrs attrs = {};
+    attrs.requester_id = pci_requester_id(dev);
+
     return pci_dma_rw(dev, addr, buf, len,
-                      DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
+                      DMA_DIRECTION_TO_DEVICE, attrs);
 }
 
 /**
@@ -282,8 +285,11 @@ static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
 static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
                                         const void *buf, dma_addr_t len)
 {
+    MemTxAttrs attrs = {};
+    attrs.requester_id = pci_requester_id(dev);
+
     return pci_dma_rw(dev, addr, (void *) buf, len,
-                      DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
+                      DMA_DIRECTION_FROM_DEVICE, attrs);
 }
 
 #define PCI_DMA_DEFINE_LDST(_l, _s, _bits) \
@@ -327,8 +333,11 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
 static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
                                 dma_addr_t *plen, DMADirection dir)
 {
+    MemTxAttrs attrs = {};
+    attrs.requester_id = pci_requester_id(dev);
+
     return dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
-                          MEMTXATTRS_UNSPECIFIED);
+                          attrs);
 }
 
 static inline void pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len,
-- 
2.43.2



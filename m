Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB39E7716A
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 00:49:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tMzIp-0001DZ-TN; Sun, 15 Dec 2024 19:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzIn-0001D9-6s
 for qemu-riscv@nongnu.org; Sun, 15 Dec 2024 19:49:37 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzIk-00072H-JE
 for qemu-riscv@nongnu.org; Sun, 15 Dec 2024 19:49:36 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-72739105e02so3774247b3a.0
 for <qemu-riscv@nongnu.org>; Sun, 15 Dec 2024 16:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734310172; x=1734914972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EkAbQ8l4cE3htAJebY446JQ2pMWQgz+noRlfRZ4NeVQ=;
 b=MCSOqlVHkVrmVxxwqo8fFDdAiDm0caSy/u4CNDkH8myb+pePbspbD2tFQdy334Lavn
 0k99gdMdcPpE+72qqp8oPZlSefUi3lWN8PZW0j7i1oNycud5+nW1cswOeFXq47otjT1P
 T1pOf+5uDY+BTDHC75u/SyCXRVp7wnn48qde4165l0TmxzdO04lw5IFj2cduoEfkeRew
 /4G94kVOIlCWoVa0qdfBo2I8ddsuS6JQ9ntqjZ4XQZMZ2H6HGtvv3t6kbbx6DMp2BZ3C
 qWHI8o72f7kCbQIgJ04zfHU/dwfxfdXlOQJBpzhTMzZNg5SuL7VRmLAvB3mGo0GTvQWK
 kh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734310172; x=1734914972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EkAbQ8l4cE3htAJebY446JQ2pMWQgz+noRlfRZ4NeVQ=;
 b=Jw/nks9OkoKvpDy01VHkMc0DjXcBNgGDq7Ao+B/sKKPqJPfHc6hVEWnJMWkQ/SAnr2
 qwjfkdh3vPMlWvUPXmHXVIN3pk78EZbdV6NtMLazvfOByKbW+KS+Nv7lE3TfxpoVE6QX
 3Yt0Hkg5cgxQfsBbWDc5vE7lXdOHuv0RaaCs9q+Y2f3IZBac1gwrUaoQy6l98z4P8QeG
 /TNrjyja0I8o6pT1Ir5+KFtXL5/HBOgZUnbirm3uH6HiuchXAq0JOYohutj/dkwaHKb9
 Iud6QaU6WSYMg8VrXBKXdxfVPsFJ/Bb+dkofOlA1CoND38tN70VIFNYmA2ZeEY2/n9js
 czDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaEZvOsy7bL7yFSuySurW0rN7dNMhAYGWS3iKrokSNA/TQ06Wnt18AzsJxGmjrBBXmydFUpm1lR0NL@nongnu.org
X-Gm-Message-State: AOJu0YwTpvtI3X6sFaHjeBlp0ZRX941NnibbWZ4FC3oalZUPAH27G4U1
 loK37ywccv3OVWmPFivHNcOQ05W+SDi+5exs+W0x7AZ3cf7iNLGA/fR3WY0xntc=
X-Gm-Gg: ASbGncttKOqo6K/dKwxu7fkqeE0t5thH75K+P8W63AYzp3l7TtyO/mJHDLuvAiYngyT
 fnzilNUVwJlMGNXbgHUSeKJ6EWVSLss4PnBfP7+0YcesPS+Krxm5NALQVhL2aV4r6vejtFiI2BB
 Lf4AZEAR3xodPeZpGO9w2FFP9rlsxuztxFFhz5gZE+k+6YVRGNXr0m/GIfA5U3pWeSQKE4fz41P
 0IC/oz/MHnSo6QiQ43In3a1PQsf6FmNldjjRo37VJ9K9TMJzQ9Q/QYvb3iwXI6qimGGcKKuM9UV
 pAj/bkEK
X-Google-Smtp-Source: AGHT+IFik9rUa0aQDkCaFNDFpKFtw5PhG2sMtdXMOgxisPqilqhXwKazPWcScO03cVyX16CPUstvEQ==
X-Received: by 2002:a05:6a21:8985:b0:1e2:5c9:65e0 with SMTP id
 adf61e73a8af0-1e205c98ae6mr7213125637.32.1734310172128; 
 Sun, 15 Dec 2024 16:49:32 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5addbf9sm3059586a12.47.2024.12.15.16.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 16:49:31 -0800 (PST)
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
Subject: [RFC PATCH 0/6] Avoid contention for PCIIOMMUOps between IOMMU and
 PCIe host
Date: Mon, 16 Dec 2024 08:48:51 +0800
Message-ID: <20241216004857.9367-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x432.google.com
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

When PCIIOMMUOps.get_address_space() is already registered by the pci host,
e.g. TYPE_DESIGNWARE_PCIE_HOST, IOMMU cannot overwrite this hook without
breaking the PCIe translation rule, which means that IOMMU and the pci host
cannot coexist.

This RFC introduces a new callback, PCIIOMMUOps.set_memory_region(), and
an API, pci_setup_iommu_downstream_mem, to avoid the contention for
PCIIOMMUOps.get_address_space().

Jason Chien (6):
  include/hw/pci: Add a callback to set the downstream memory region of
    a pci bus
  hw/pci: Add an API to set the downstream memory region of a PCI bus
  hw/pci-host: Enable DW PCIe host to send memory transactions over
    specific mr
  hw/riscv/riscv-iommu: Allow PCI hosts with iommu_ops registered
    connecting to the IOMMU
  hw/riscv/riscv-iommu: Acquire device IDs dynamically
  include/hw/pci: Send PCI dma requests with memory attributes
    containing BDF

 hw/pci-host/designware.c         | 18 +++++++++++++++---
 hw/pci/pci.c                     |  6 ++++++
 hw/riscv/riscv-iommu.c           | 21 +++++++++++++++++++--
 include/hw/pci-host/designware.h |  2 ++
 include/hw/pci/pci.h             | 20 ++++++++++++++++++++
 include/hw/pci/pci_device.h      | 15 ++++++++++++---
 6 files changed, 74 insertions(+), 8 deletions(-)

-- 
2.43.2



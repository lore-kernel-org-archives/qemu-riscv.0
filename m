Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC47EB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 10:24:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTgLr-0006Nu-A9; Wed, 09 Aug 2023 06:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qTgLq-0006NL-FS
 for qemu-riscv@nongnu.org; Wed, 09 Aug 2023 06:23:38 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qTgLp-00055n-0E
 for qemu-riscv@nongnu.org; Wed, 09 Aug 2023 06:23:38 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-686bea20652so6478758b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Aug 2023 03:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1691576615; x=1692181415;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JjTpRtgk7g09UYe/5wWTzD2WRGklQow3z8dJyWIKW+k=;
 b=QPPqUOhPvJ9uQTJSPqAgfU5uOvcamSivXh1noFR7uSKtJ7bp4iBQKy8RtyoEnFUHWE
 t4TgU/o4gjM9pXLuphyT27mxPB7ryQBNdUkJqUAh6lyqtfclkfkDQXUAfjQCyw5ddHrN
 v7vqiqEqwuiGuRTcQdowO6WYi8tYaN8wuBB7rGuR+MuLpe8dPtIxc+AyGQBwKDoD59xF
 HPJAz9pp6ZazLRcp0aVDHBo+y1CqdKuhVTyi+3VsbrcA0giFjuzhP/qQSQFpQf4nKxkw
 1CI2kYW71aXp2XUmjsYf6Ylhyoh7opFH5mvkBKCWnNZ3M75c6PLBagWLrgJQ6jYk2IVn
 1Ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691576615; x=1692181415;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JjTpRtgk7g09UYe/5wWTzD2WRGklQow3z8dJyWIKW+k=;
 b=l93Spx9Y7jS1RLXXQKtG4rnfFbEnT+v5enW6aNyBxWbOTF3K8loUot1coZaquWrL1F
 uVdNu34J/DD/vcTSne8Xn8Tbp/FIsLgGDAn6TorH0WoZJpUFApG3fSSqmsrII8M8gSDq
 3e00TxoZzhvX7ninLHKPi6Fj2UvU1kle1nZYzyZvf5fNSppkAZVWZisIf0tH9Lrg8sH0
 UXfL9qc5aQueAwcPTimIBwa/xuoV1Rk902A2yTVPoZv/wuV65ZE9WKDktEpvYDlFxpov
 n7Sl0X1Irl1aYwueDT2+9Y6ks9NyNJ7x8q2N9UCj/4AG3TNqolUeNWwL9RVScvPta3e1
 V4kQ==
X-Gm-Message-State: AOJu0YzkMAXfnTTK4ujnfmung0rQL18QTa3MeIoWoY9dsxIIhSnqQlDC
 evwOrBlgkOS2BJUnbYE5vdLLsw==
X-Google-Smtp-Source: AGHT+IEvLTpKLQh5nzrSLkSIwo1I8XPBKy7MBizHB7oRdMAAPINtCfOSccIknAmrtOmGMZF2fFnaTQ==
X-Received: by 2002:a05:6a21:3291:b0:135:8a65:a772 with SMTP id
 yt17-20020a056a21329100b001358a65a772mr2392397pzb.50.1691576615407; 
 Wed, 09 Aug 2023 03:23:35 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a62b615000000b00687375d9135sm9557544pff.4.2023.08.09.03.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 03:23:34 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
Date: Wed,  9 Aug 2023 10:22:50 +0000
Message-Id: <20230809102257.25121-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x42c.google.com
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

In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-root
bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
the child bus "dw-pcie" is realized before the parent bus "pcie" which is
the root PCIe bus. Thus, the extended configuration space is not accessible
on "dw-pcie". The issue can be resolved by adding the
PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/pci-host/designware.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 9e183caa48..388d252ee2 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -694,6 +694,7 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
                                      &s->pci.io,
                                      0, 4,
                                      TYPE_PCIE_BUS);
+    pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
     memory_region_init(&s->pci.address_space_root,
                        OBJECT(s),
-- 
2.17.1



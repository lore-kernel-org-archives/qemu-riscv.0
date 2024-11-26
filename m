Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A94D3B984
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 11:23:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFteE-0003iA-Nb; Tue, 26 Nov 2024 06:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteC-0003h6-5g
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:22:24 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteA-0002XF-HE
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:22:23 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-434a0fd9778so15221445e9.0
 for <qemu-riscv@nongnu.org>; Tue, 26 Nov 2024 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620141; x=1733224941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qPY7Uz0dqRmk2gQ1cO3DBCcFXLLvxMC18yQC1ilSgA=;
 b=G31NQHlvGZkGawebft97sYhAhilqUvGvkbd1zMeMwhwlN14M5eRWiTdyyCvvbnxC4R
 RP34PkS1VK4rlcCJ/lPYuUJR1oGU2dbuBxD8DbTBC/kIlCS8YWBugmj496sPikjghPQZ
 w8jdIfgZIUwIT9xpBaE+LWrmstHQDEk573vvWcVNlOqpgEd+oKx31Ge3/EUqrg1BZ4R1
 oQmGr1FdTou24m7GXGJtJ2gnhCVZIOQ8MyvVsLEZW6eSXAsfHn5FY6LXLW0iTGF3hnoU
 WKGAmMMyFBQ61vrXbrC+fAX43htEOU62rrRhwji0xmbnQ83nZb9KIhRF+XXZhBwMMnqp
 KJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620141; x=1733224941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qPY7Uz0dqRmk2gQ1cO3DBCcFXLLvxMC18yQC1ilSgA=;
 b=CsD18Y4YCVfdaefgz8iz5z4LHZuhTzy2QvY0pjYvfDsvxwhPYxkSM9+jYg/EVGX2E6
 MrfNVBGipAXSAq2TfbTr4d21k5byeDsFGIx25zDioGdsmrJwc/xbjCvwZH/qJtqa7Ftp
 W/rC6iU2jrfQwKKYhMzUOQi1AfZN5gH2O52cDH39v/D29s0NNJURTDKs9aQh3YYJwbLx
 uu36hYyYrrAtixX05Q1SkdsvYacusVKpHU55mDJn+tV3JlY6GNTRc8Cb/tGSm2nJsKBq
 uGqkZQ0y3MZkG04x8I5ftRXIzW9O4xXKkNOHqdP7/UGn+r3y4n/a70xcBz9INTvRI0H7
 nsHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOUhR8aMKRNmSOc5oJFw2tmoqTsh3ZV2JrU7JtQEbgEk+3Qojw82CnDDb8zc4of/xN//7IfOdJK6cT@nongnu.org
X-Gm-Message-State: AOJu0YyNa1WZnaAWb4stZ+yBVGYKPScRyc3nE3dHl+eVdA4iNCOwDw/e
 cP5/WC868zhj4KanFDRNhS5nI9PtMxpccuZT1+T8DxWBxtF8rroAKmtlb9KKFyw=
X-Gm-Gg: ASbGncsPa2IiXLAIisHsUWTDuYFpMyRtt8ieZDYeZzVq0siay46R5qsnRgSwWOVdME6
 jIfLFfQKAy78o8u5wcVic5/PIEEZhuJR1sdhOopkWj5BgIrUW1VvKxfNzEQZ9aWK0SaJ/o/1MIR
 HhwtD2WkeHZcYcwTJiIyq8e/tNJCiNOky/FWC6wSrKyEZ8LNkpM5JsMF+pXKHxLtigCQBEP/LVV
 hzSi2yxKqBnYyN46G+JOZTTy5Iey1MyZJqh+rjf4BilP9HU3IxCLi7KEErD3uokQi5WHxC9
X-Google-Smtp-Source: AGHT+IEANCMTxsUE27Mx8fMzBEsH7EvxcIuDdUdjx5zx0IltCtoW4ouBVBLwarjkXR0wzLH5bYDn2w==
X-Received: by 2002:a05:600c:a12:b0:434:a19a:5965 with SMTP id
 5b1f17b1804b1-434a19a5bf9mr43582535e9.6.1732620141039; 
 Tue, 26 Nov 2024 03:22:21 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434a50613c5sm25019945e9.0.2024.11.26.03.22.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:22:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 01/13] hw/pci: Do not declare PCIBus::flags mask
 as enum
Date: Tue, 26 Nov 2024 12:22:00 +0100
Message-ID: <20241126112212.64524-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

We use PCIBus::flags to mask various flags. It is not
an enum, and doing so confuses static analyzers. Rename
the enum as singular. Use a generic unsigned type for
the mask.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pci_bus.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 22613125462..6ecfe2e06d5 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -19,7 +19,7 @@ struct PCIBusClass {
     uint16_t (*numa_node)(PCIBus *bus);
 };
 
-enum PCIBusFlags {
+enum PCIBusFlag {
     /* This bus is the root of a PCI domain */
     PCI_BUS_IS_ROOT                                         = 0x0001,
     /* PCIe extended configuration space is accessible on this bus */
@@ -32,7 +32,7 @@ enum PCIBusFlags {
 
 struct PCIBus {
     BusState qbus;
-    enum PCIBusFlags flags;
+    unsigned flags;
     const PCIIOMMUOps *iommu_ops;
     void *iommu_opaque;
     uint8_t devfn_min;
-- 
2.45.2



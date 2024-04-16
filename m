Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A86C4345F
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 13:54:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rwjFS-0001nF-Gp; Tue, 16 Apr 2024 09:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjFP-0001jK-Br
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 09:53:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjFM-0001Z3-0o
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 09:53:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4167fce0a41so30183285e9.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2024 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713275594; x=1713880394; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/B5UTN+VVzZIBHg8vuvzaIXLhoLwQMP7eYF+iW6nSk=;
 b=b23KKU09ePFrV1jVJJl/ioQJSuUgpPTMVX7uZDHfiyZDweIxQY56QHqQsukcYttyhv
 cIOjgnSuZFJQ5lu3NXnvHh7hjhYsscN47kIhyjjfyPoI4hL1+/ewr1cgmgvZ0tVNEtEU
 FPOVGnMGCfgFUNXfmWakC8hasbTGgNa+hYr0A3M8v2gwZA9lI7x3/jJ9HEtLf80QbxKi
 APKicOei6lluGwwahBPGJivJejlvU2slydSCVVLziA6yymXu0QdCJh3G7bmXrtHdK7Io
 uw0T30/lDgKPcSCxTE6rmdJQnwVW66UdCLpB8IZAp75VXn9U/R+MaeDoh0vNWi184Kes
 kKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713275594; x=1713880394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/B5UTN+VVzZIBHg8vuvzaIXLhoLwQMP7eYF+iW6nSk=;
 b=gk9JjBiFOFZbdJDSbZiRYIg/oph3Y/1f2qjEZZEjw1dc/7W7zNO1SueGiQZUI9tdu1
 JQETe+qFXYu+88/0C1Vv++CxBMobAA3xXdbsMNyXrm0IMJ99apivJ8RlvZ2fQ0QSBb8Q
 PJF4duTjjCWKOTwcqt/6A3rmhSXaBINKJuSRpNeLm44bW0o99Yv66PNCGRaK/D5IRvnb
 M+kXzEaK0WJQarTFB4BVDMBBUWK7WYT9FP5p8TqrGWeU26LacXy+Z+o4jtIPrCQa/h6v
 XhE67U2/eDNTaavGjUHHDpfuLKfLXDd2VMfu4Zp1nzOJnLAnxi9IrT3xGNSbtk1Cf0j+
 fpzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI+cSOqNgtqHOzcXUr6HtCMO/NUHN+sUeU5qKB9gW8Kn/qsZwCccWI09y/G/dhpyZrzRlrTw8WizpPPip9Rxwbf/CD7CQ=
X-Gm-Message-State: AOJu0YzxAKVMgNB1NQoow8hysV59Q2aoLyRlH1M/84XhqePf2M7ITinQ
 KynYA2cl8qSk7GeVj69NWiR8j9xnr2xVR9EOZGJhSlle00mA84OstPsz5AHCC/s=
X-Google-Smtp-Source: AGHT+IGr25g7tT9GOge8RppCUGG0XGC0pUUb6sMITSrWC+oN3oRm8Ll4CqHRAl7M2H0Fphqk+ClUQA==
X-Received: by 2002:a05:600c:1c0d:b0:418:9ff4:3eed with SMTP id
 j13-20020a05600c1c0d00b004189ff43eedmr1222847wms.20.1713275593925; 
 Tue, 16 Apr 2024 06:53:13 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c4f4200b0041892c774bcsm2586712wmq.2.2024.04.16.06.53.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 06:53:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 03/22] hw/usb/hcd-xhci: Remove XHCI_FLAG_FORCE_PCIE_ENDCAP
 flag
Date: Tue, 16 Apr 2024 15:52:32 +0200
Message-ID: <20240416135252.8384-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416135252.8384-1-philmd@linaro.org>
References: <20240416135252.8384-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

XHCI_FLAG_FORCE_PCIE_ENDCAP was only used by the
pc-i440fx-2.0 machine, which got removed. Remove it
and simplify usb_xhci_pci_realize().

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/usb/hcd-xhci.h     | 1 -
 hw/usb/hcd-xhci-nec.c | 2 --
 hw/usb/hcd-xhci-pci.c | 3 +--
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 98f598382a..1efa4858fb 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -37,7 +37,6 @@ typedef struct XHCIEPContext XHCIEPContext;
 
 enum xhci_flags {
     XHCI_FLAG_SS_FIRST = 1,
-    XHCI_FLAG_FORCE_PCIE_ENDCAP,
     XHCI_FLAG_ENABLE_STREAMS,
 };
 
diff --git a/hw/usb/hcd-xhci-nec.c b/hw/usb/hcd-xhci-nec.c
index 328e5bfe7c..5d5b069cf9 100644
--- a/hw/usb/hcd-xhci-nec.c
+++ b/hw/usb/hcd-xhci-nec.c
@@ -43,8 +43,6 @@ static Property nec_xhci_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("msix", XHCIPciState, msix, ON_OFF_AUTO_AUTO),
     DEFINE_PROP_BIT("superspeed-ports-first", XHCINecState, flags,
                     XHCI_FLAG_SS_FIRST, true),
-    DEFINE_PROP_BIT("force-pcie-endcap", XHCINecState, flags,
-                    XHCI_FLAG_FORCE_PCIE_ENDCAP, false),
     DEFINE_PROP_UINT32("intrs", XHCINecState, intrs, XHCI_MAXINTRS),
     DEFINE_PROP_UINT32("slots", XHCINecState, slots, XHCI_MAXSLOTS),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index 4423983308..cbad96f393 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -148,8 +148,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
                      PCI_BASE_ADDRESS_MEM_TYPE_64,
                      &s->xhci.mem);
 
-    if (pci_bus_is_express(pci_get_bus(dev)) ||
-        xhci_get_flag(&s->xhci, XHCI_FLAG_FORCE_PCIE_ENDCAP)) {
+    if (pci_bus_is_express(pci_get_bus(dev))) {
         ret = pcie_endpoint_cap_init(dev, 0xa0);
         assert(ret > 0);
     }
-- 
2.41.0



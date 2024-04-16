Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9CBC04FF6
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 19:01:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rwo3I-0001Jv-BZ; Tue, 16 Apr 2024 15:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwo2Q-0000tW-7O
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 15:00:15 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwo2N-0005Zl-LY
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 15:00:13 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5171a529224so6094324e87.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2024 12:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713294010; x=1713898810; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r03IbH4Q5jukHMDYRNDrIPnxYvDkdnR4utG+Rvdo7L0=;
 b=hLqgxtpEB5H4QcbmOK6mXxPG3N0D5AabwrCTq8kBJaeDVVzcw1VaVQmOW31GV3PXOt
 LtM8t2umMYJ1Ld6mNPxA6qSFpLbf08ZJtiSYmcReQIANih0P5loxPyGoiijrl5JUqung
 32McCauMNVBLSKLS+ylf5jVpbavxCL6C1hWbXTcWlHa9VvvUdCOt2aSQuoywGzCrIiVj
 ygGco1zN89jWwnyDAURbjq8jEOTJlY9qJYxNpOtcc1IZTqwCXH7cW/6l5De9Nrwxo1Wq
 RcCJz9tYmTpkvvh2ETmN3+UNAsInhenC/nPeLDaylUaFnNj/8iqMveMIkmR3TWqsa43w
 DD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713294010; x=1713898810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r03IbH4Q5jukHMDYRNDrIPnxYvDkdnR4utG+Rvdo7L0=;
 b=L35YTvyDZ3rIZ0Osspfo/4Do52CMSmh7E+Oya9tXwqQf2ufzF2AxWJ1pQZP1Div78E
 Jo2DkSplw3pk8iT3iWekX3GF5A0ZCrTl2VxbeWxi+jckjwcW2+sAOOBuA95hZxZY8tSg
 AcIhvG0Yr6PT6F6C+N9A54CpnXaFWp3DmAjas+MPo9qNIOU7ak1epC4gE9wKeNq6b5GP
 tFp3ZqLRg1SBpv9vLTTUAl4J7S9pFrv5BdxY4tDm5a/VHsTxm/RylyO9Wd0HF8HcSQoJ
 xIvPFj1gclIl5JRxTzitmnLR2pEE4ozCo0RATpoHjiUwHCW4QbDMlrxoV4l2b2lVIAB4
 X1nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTQeMHBW/jFSw8yTv11rxkQd3z67XWuCxSITulmfz3hGGjlr+aSJRC1gXnmaZqYPlFNTdcwnL96YZ/zbUIEXBk2m38+Nk=
X-Gm-Message-State: AOJu0YxdoNhLc5NYXh0B++S+5CfTnyk+aIcZw/ulOy6KBAfXfQHy0Ibq
 31o/KzwayMN6OHlvDwLzbppzOJS8KlBg68MamJmKbEgwcKyfEUJ87JzQjfhHiT8=
X-Google-Smtp-Source: AGHT+IHRsiss2Z7S14JYdvY6Yt6YrgQ0OojgolVzH0Nx8AY7SPkGC1icvBRPX09j77zZ7WWRP2L3sQ==
X-Received: by 2002:ac2:5544:0:b0:515:bee6:5e8c with SMTP id
 l4-20020ac25544000000b00515bee65e8cmr7857295lfk.40.1713294009690; 
 Tue, 16 Apr 2024 12:00:09 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 ae12-20020a17090725cc00b00a529aeb4eccsm2558072ejc.140.2024.04.16.12.00.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 12:00:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 04/22] hw/usb/hcd-xhci: Remove XHCI_FLAG_SS_FIRST flag
Date: Tue, 16 Apr 2024 20:59:20 +0200
Message-ID: <20240416185939.37984-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12f.google.com
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

XHCI_FLAG_SS_FIRST was only used by the pc-i440fx-2.0 machine,
which got removed. Remove it and simplify various functions in
hcd-xhci.c.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/usb/hcd-xhci.h     |  3 +--
 hw/usb/hcd-xhci-nec.c |  2 --
 hw/usb/hcd-xhci-pci.c |  1 -
 hw/usb/hcd-xhci.c     | 42 ++++++++----------------------------------
 4 files changed, 9 insertions(+), 39 deletions(-)

diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 1efa4858fb..fe16d7ad05 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -36,8 +36,7 @@ typedef struct XHCIStreamContext XHCIStreamContext;
 typedef struct XHCIEPContext XHCIEPContext;
 
 enum xhci_flags {
-    XHCI_FLAG_SS_FIRST = 1,
-    XHCI_FLAG_ENABLE_STREAMS,
+    XHCI_FLAG_ENABLE_STREAMS = 1,
 };
 
 typedef enum TRBType {
diff --git a/hw/usb/hcd-xhci-nec.c b/hw/usb/hcd-xhci-nec.c
index 5d5b069cf9..0c063b3697 100644
--- a/hw/usb/hcd-xhci-nec.c
+++ b/hw/usb/hcd-xhci-nec.c
@@ -41,8 +41,6 @@ struct XHCINecState {
 static Property nec_xhci_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("msi", XHCIPciState, msi, ON_OFF_AUTO_AUTO),
     DEFINE_PROP_ON_OFF_AUTO("msix", XHCIPciState, msix, ON_OFF_AUTO_AUTO),
-    DEFINE_PROP_BIT("superspeed-ports-first", XHCINecState, flags,
-                    XHCI_FLAG_SS_FIRST, true),
     DEFINE_PROP_UINT32("intrs", XHCINecState, intrs, XHCI_MAXINTRS),
     DEFINE_PROP_UINT32("slots", XHCINecState, slots, XHCI_MAXSLOTS),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index cbad96f393..264d7ebb77 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -242,7 +242,6 @@ static void qemu_xhci_instance_init(Object *obj)
     s->msix     = ON_OFF_AUTO_AUTO;
     xhci->numintrs = XHCI_MAXINTRS;
     xhci->numslots = XHCI_MAXSLOTS;
-    xhci_set_flag(xhci, XHCI_FLAG_SS_FIRST);
 }
 
 static const TypeInfo qemu_xhci_info = {
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index ad40232eb6..b6411f0bda 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -541,18 +541,10 @@ static XHCIPort *xhci_lookup_port(XHCIState *xhci, struct USBPort *uport)
     case USB_SPEED_LOW:
     case USB_SPEED_FULL:
     case USB_SPEED_HIGH:
-        if (xhci_get_flag(xhci, XHCI_FLAG_SS_FIRST)) {
-            index = uport->index + xhci->numports_3;
-        } else {
-            index = uport->index;
-        }
+        index = uport->index + xhci->numports_3;
         break;
     case USB_SPEED_SUPER:
-        if (xhci_get_flag(xhci, XHCI_FLAG_SS_FIRST)) {
-            index = uport->index;
-        } else {
-            index = uport->index + xhci->numports_2;
-        }
+        index = uport->index;
         break;
     default:
         return NULL;
@@ -2779,11 +2771,7 @@ static uint64_t xhci_cap_read(void *ptr, hwaddr reg, unsigned size)
         ret = 0x20425355; /* "USB " */
         break;
     case 0x28: /* Supported Protocol:08 */
-        if (xhci_get_flag(xhci, XHCI_FLAG_SS_FIRST)) {
-            ret = (xhci->numports_2<<8) | (xhci->numports_3+1);
-        } else {
-            ret = (xhci->numports_2<<8) | 1;
-        }
+        ret = (xhci->numports_2 << 8) | (xhci->numports_3 + 1);
         break;
     case 0x2c: /* Supported Protocol:0c */
         ret = 0x00000000; /* reserved */
@@ -2795,11 +2783,7 @@ static uint64_t xhci_cap_read(void *ptr, hwaddr reg, unsigned size)
         ret = 0x20425355; /* "USB " */
         break;
     case 0x38: /* Supported Protocol:08 */
-        if (xhci_get_flag(xhci, XHCI_FLAG_SS_FIRST)) {
-            ret = (xhci->numports_3<<8) | 1;
-        } else {
-            ret = (xhci->numports_3<<8) | (xhci->numports_2+1);
-        }
+        ret = (xhci->numports_3 << 8) | 1;
         break;
     case 0x3c: /* Supported Protocol:0c */
         ret = 0x00000000; /* reserved */
@@ -3349,13 +3333,8 @@ static void usb_xhci_init(XHCIState *xhci)
     for (i = 0; i < usbports; i++) {
         speedmask = 0;
         if (i < xhci->numports_2) {
-            if (xhci_get_flag(xhci, XHCI_FLAG_SS_FIRST)) {
-                port = &xhci->ports[i + xhci->numports_3];
-                port->portnr = i + 1 + xhci->numports_3;
-            } else {
-                port = &xhci->ports[i];
-                port->portnr = i + 1;
-            }
+            port = &xhci->ports[i + xhci->numports_3];
+            port->portnr = i + 1 + xhci->numports_3;
             port->uport = &xhci->uports[i];
             port->speedmask =
                 USB_SPEED_MASK_LOW  |
@@ -3366,13 +3345,8 @@ static void usb_xhci_init(XHCIState *xhci)
             speedmask |= port->speedmask;
         }
         if (i < xhci->numports_3) {
-            if (xhci_get_flag(xhci, XHCI_FLAG_SS_FIRST)) {
-                port = &xhci->ports[i];
-                port->portnr = i + 1;
-            } else {
-                port = &xhci->ports[i + xhci->numports_2];
-                port->portnr = i + 1 + xhci->numports_2;
-            }
+            port = &xhci->ports[i];
+            port->portnr = i + 1;
             port->uport = &xhci->uports[i];
             port->speedmask = USB_SPEED_MASK_SUPER;
             assert(i < XHCI_MAXPORTS);
-- 
2.41.0



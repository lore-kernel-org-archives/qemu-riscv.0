Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B924C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:18:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhLH-00082r-II; Thu, 31 Aug 2023 09:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHL-0005FY-I8
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:07 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHC-0006Em-1K
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31c8a710545so639012f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486796; x=1694091596; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jz+mAPNcv06ru/xM4IbBW81pQuhSFU668av4pwZWy+k=;
 b=SJ6iEr0dHXDeLocVItOF2wnF2e4LtKpw42ROzdMj+ACzGgjOk3USbHE/jOqUJUTNir
 QVuPSuUQ9BfRohD73enPuS01rQEmaBenrCVDDHyG47tdiK3zmmRubUEcAVJx10p9cgKW
 iwZPqdoUGKwSk5lgi45ucbQC38JvX/6r8EUHa0FKMJx0Pswc7yBLUR7T1wtnGuBV+goD
 EWusl9qgEuXqRxRAyD48T0h4fTsqXkgkisbuvKI9rZ25lFSuIKXQbv6MrU8YvT64Tr/G
 mLGQ1yOKF7eS/DwAI46lhyu05s+gkHVUKZpR9tbSDYWb+uA1Oc9/pTlSgZHWJH28A0x9
 a/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486796; x=1694091596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jz+mAPNcv06ru/xM4IbBW81pQuhSFU668av4pwZWy+k=;
 b=Zyjru8HVEonQ1/EDJz5mDzfALznvsC3uTDeDQ/wOXHyknEMMTXE0Xtff3EyL0Yd9rR
 6JWz67E2vU3EFHEeYPqgO4hb10WW3EjRcgZzE8BtcouzJbPkY7YUFkDA6SVmVpHDL47B
 k5b7I6tIvw8o0ki2UUmX85l2imDM9JhQWgor4dB0guNLhIWrJCUkaAV9fAF3szZMvGFa
 m2Roqc16scxhnqUA6jW1ARiDRpP+0VvP9Hl5Y6RLj/rHtw1qzkWXQzjf8Zc10xMjUPsj
 TzmQL9DZxK9JdrBC+WPQJzNQiPrO0k+XtMrgWvLc8viXGAMaMZ1Kecs6JIIliPYYsYcz
 GMOA==
X-Gm-Message-State: AOJu0YywXzB879WZ6n72zAkNSlziTWsmNQ1ArA7TnXjS4AtljtCWdPCa
 5JPkuSLQvPXzdjpHx5tIyRpxQQ==
X-Google-Smtp-Source: AGHT+IF5XiNzLTBBERzoj1rNTvtaHwuz+kfF0RRANgCO8wwx3ufA4kuJam/JdgfIRvMRRM9PunGxXg==
X-Received: by 2002:a5d:54c8:0:b0:317:5e5e:60e0 with SMTP id
 x8-20020a5d54c8000000b003175e5e60e0mr4055046wrv.28.1693486795961; 
 Thu, 31 Aug 2023 05:59:55 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 d4-20020adfe884000000b0030ae53550f5sm2144827wrm.51.2023.08.31.05.59.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:59:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: [PULL 31/41] hw/usb: spelling fixes
Date: Thu, 31 Aug 2023 14:56:33 +0200
Message-ID: <20230831125646.67855-32-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

From: Michael Tokarev <mjt@tls.msk.ru>

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20230823065335.1919380-14-mjt@tls.msk.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/quirks.h             | 2 +-
 hw/usb/ccid-card-emulated.c | 2 +-
 hw/usb/hcd-ehci.c           | 6 +++---
 hw/usb/hcd-ohci.c           | 2 +-
 hw/usb/redirect.c           | 2 +-
 hw/usb/xen-usb.c            | 2 +-
 hw/usb/trace-events         | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/usb/quirks.h b/hw/usb/quirks.h
index c3e595f40b..94b2c95341 100644
--- a/hw/usb/quirks.h
+++ b/hw/usb/quirks.h
@@ -67,7 +67,7 @@ static const struct usb_device_id usbredir_raw_serial_ids[] = {
     { USB_DEVICE(0x10C4, 0x800A) }, /* SPORTident BSM7-D-USB main station */
     { USB_DEVICE(0x10C4, 0x803B) }, /* Pololu USB-serial converter */
     { USB_DEVICE(0x10C4, 0x8044) }, /* Cygnal Debug Adapter */
-    { USB_DEVICE(0x10C4, 0x804E) }, /* Software Bisque Paramount ME build-in converter */
+    { USB_DEVICE(0x10C4, 0x804E) }, /* Software Bisque Paramount ME built-in converter */
     { USB_DEVICE(0x10C4, 0x8053) }, /* Enfora EDG1228 */
     { USB_DEVICE(0x10C4, 0x8054) }, /* Enfora GSM2228 */
     { USB_DEVICE(0x10C4, 0x8066) }, /* Argussoft In-System Programmer */
diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index c328660075..3ee9c73b87 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -518,7 +518,7 @@ static void emulated_realize(CCIDCardState *base, Error **errp)
         goto out2;
     }
 
-    /* TODO: a passthru backened that works on local machine. third card type?*/
+    /* TODO: a passthru backend that works on local machine. third card type?*/
     if (card->backend == BACKEND_CERTIFICATES) {
         if (card->cert1 != NULL && card->cert2 != NULL && card->cert3 != NULL) {
             ret = emulated_initialize_vcard_from_certificates(card);
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index c930c60921..19b4534c20 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1464,7 +1464,7 @@ static int ehci_process_itd(EHCIState *ehci,
                     usb_handle_packet(dev, &ehci->ipacket);
                     usb_packet_unmap(&ehci->ipacket, &ehci->isgl);
                 } else {
-                    DPRINTF("ISOCH: attempt to addess non-iso endpoint\n");
+                    DPRINTF("ISOCH: attempt to address non-iso endpoint\n");
                     ehci->ipacket.status = USB_RET_NAK;
                     ehci->ipacket.actual_length = 0;
                 }
@@ -1513,7 +1513,7 @@ static int ehci_process_itd(EHCIState *ehci,
 
 
 /*  This state is the entry point for asynchronous schedule
- *  processing.  Entry here consitutes a EHCI start event state (4.8.5)
+ *  processing.  Entry here constitutes a EHCI start event state (4.8.5)
  */
 static int ehci_state_waitlisthead(EHCIState *ehci,  int async)
 {
@@ -2458,7 +2458,7 @@ static void usb_ehci_vm_state_change(void *opaque, bool running, RunState state)
     /*
      * The schedule rebuilt from guest memory could cause the migration dest
      * to miss a QH unlink, and fail to cancel packets, since the unlinked QH
-     * will never have existed on the destination. Therefor we must flush the
+     * will never have existed on the destination. Therefore we must flush the
      * async schedule on savevm to catch any not yet noticed unlinks.
      */
     if (state == RUN_STATE_SAVE_VM) {
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index cc5cde6983..7ff1b65ced 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1355,7 +1355,7 @@ static uint32_t ohci_get_frame_remaining(OHCIState *ohci)
     if ((ohci->ctl & OHCI_CTL_HCFS) != OHCI_USB_OPERATIONAL) {
         return ohci->frt << 31;
     }
-    /* Being in USB operational state guarnatees sof_time was set already. */
+    /* Being in USB operational state guarantees sof_time was set already. */
     tks = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ohci->sof_time;
     if (tks < 0) {
         tks = 0;
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 4bbf8afb33..c9893df867 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -471,7 +471,7 @@ static int bufp_alloc(USBRedirDevice *dev, uint8_t *data, uint16_t len,
         DPRINTF("bufpq overflow, dropping packets ep %02X\n", ep);
         dev->endpoint[EP2I(ep)].bufpq_dropping_packets = 1;
     }
-    /* Since we're interupting the stream anyways, drop enough packets to get
+    /* Since we're interrupting the stream anyways, drop enough packets to get
        back to our target buffer size */
     if (dev->endpoint[EP2I(ep)].bufpq_dropping_packets) {
         if (dev->endpoint[EP2I(ep)].bufpq_size >
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 38ee660a30..09ec326aea 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -451,7 +451,7 @@ static int usbback_check_and_submit(struct usbback_req *usbback_req)
     wValue = le16_to_cpu(ctrl->wValue);
 
     /*
-     * When the device is first connected or resetted, USB device has no
+     * When the device is first connected or reset, USB device has no
      * address. In this initial state, following requests are sent to device
      * address (#0),
      *
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index 6bb9655c8d..ed7dc210d3 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -248,7 +248,7 @@ usb_set_device_feature(int addr, int feature, int ret) "dev %d, feature %d, ret
 
 # dev-hub.c
 usb_hub_reset(int addr) "dev %d"
-usb_hub_control(int addr, int request, int value, int index, int length) "dev %d, req 0x%x, value %d, index %d, langth %d"
+usb_hub_control(int addr, int request, int value, int index, int length) "dev %d, req 0x%x, value %d, index %d, length %d"
 usb_hub_get_port_status(int addr, int nr, int status, int changed) "dev %d, port %d, status 0x%x, changed 0x%x"
 usb_hub_set_port_feature(int addr, int nr, const char *f) "dev %d, port %d, feature %s"
 usb_hub_clear_port_feature(int addr, int nr, const char *f) "dev %d, port %d, feature %s"
-- 
2.41.0



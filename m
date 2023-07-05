Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B8EC001B0
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 13:33:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qH2cv-0006lY-LI; Wed, 05 Jul 2023 09:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2cr-0006bw-T0
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 09:32:57 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2cp-000276-RU
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 09:32:57 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-993a37b79e2so77595466b.1
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 06:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688563974; x=1691155974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HbPpVNUF+2VtKxJIu33BIAkZvOsT1iQzIQdIxYzIzlM=;
 b=Zs65T8lrpAsp7bPFCDIQITGy3XYVCr4pc2Ckgr3shVR6gqfoGdW3bYtQfs0X65ljgt
 Kb6n0Qs50ujvbyGuHtcyzv04HrvCNCluk1BweVB72QhUvOuiQitkK6XqArai7SY2xQdn
 7g2RIek8fi6WEZwmkR5h6iVJSHwk83Ozz5BN59IDO+V/A4cQE2xfI7tgY9IMJ7HHxTvJ
 5b4jly0w1duwswFIueRg1mdKdEtKINYIRQqb5Lhg89bNPsoC0C4/c3t8NwhIhnI3muQC
 shJvy0jN5zDrNsb42KuOn1HQg8/G2dPJpZhXSCjqpZgkmSjd9prfyGoQzLAi5XrvCXlT
 XgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688563974; x=1691155974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HbPpVNUF+2VtKxJIu33BIAkZvOsT1iQzIQdIxYzIzlM=;
 b=LCyGWtjkbrRvZSAwm7WM6KOyu8An1ZfMxgbJ5c+G3VoxQO7KdgEaIUhPgS5Y8rh9ve
 B5S1NIBZ8zMrjcrcWJYcGL/v+ZRgaJhMeMHefVzv3vI5S0u4IrEakI+zJqiRZpA0maan
 /Ph9qPbfnsvXXB60xnwNdhTBBJeX3mgcrZ52UVuzZbPdW9hFWd76bLhjzIpDy1fRvLV9
 RwLzJ1f9fvXN71hYoVKLUoaNYMWdN5mngoO8TfP05tnFHNjxivdJvdTaOzuind8d5Q2V
 eTDn0w+rgf5ftL7z+qUFrHznNH7EN8hvy4/uPamCZ9t11S0pefwivYwpjs8NvWUxgcOp
 HapA==
X-Gm-Message-State: ABy/qLbTLPje/A8S0/T5nSlQJIr/yY5uDyHj+KMrXxgLrnZbQIGyNRRD
 c9VbQpkqzH5AAzj5rnGES+1CzQ==
X-Google-Smtp-Source: APBJJlFrCCE5HTIQmuwHovVYZynRCUNQpI/ETUER5sVmjRQ1zCfUrGPW8GECPf/KcxsnSwv4i4maEw==
X-Received: by 2002:a17:906:113:b0:993:a37a:cb4c with SMTP id
 19-20020a170906011300b00993a37acb4cmr1600571eje.9.1688563974377; 
 Wed, 05 Jul 2023 06:32:54 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.142.96])
 by smtp.gmail.com with ESMTPSA id
 ot6-20020a170906ccc600b0098df7d0e096sm14299620ejb.54.2023.07.05.06.32.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Jul 2023 06:32:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/4] hw/char: Have FEWatchFunc handlers return
 G_SOURCE_CONTINUE/REMOVE
Date: Wed,  5 Jul 2023 15:31:39 +0200
Message-Id: <20230705133139.54419-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230705133139.54419-1-philmd@linaro.org>
References: <20230705133139.54419-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

GLib recommend to use G_SOURCE_REMOVE / G_SOURCE_CONTINUE
for GSourceFunc callbacks. Our FEWatchFunc is a GSourceFunc
returning such value. Use such definitions which are
"more memorable" [*].

[*] https://docs.gtk.org/glib/callback.SourceFunc.html#return-value

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/cadence_uart.c   | 8 ++++----
 hw/char/cmsdk-apb-uart.c | 6 +++---
 hw/char/ibex_uart.c      | 8 ++++----
 hw/char/nrf51_uart.c     | 4 ++--
 hw/char/serial.c         | 2 +-
 hw/char/virtio-console.c | 2 +-
 hw/usb/redirect.c        | 2 +-
 monitor/monitor.c        | 2 +-
 net/vhost-user.c         | 2 +-
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 807e398541..eff0304a18 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -307,11 +307,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
     /* instant drain the fifo when there's no back-end */
     if (!qemu_chr_fe_backend_connected(&s->chr)) {
         s->tx_count = 0;
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
     if (!s->tx_count) {
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
     ret = qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_count);
@@ -326,12 +326,12 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
                                         cadence_uart_xmit, s);
         if (!r) {
             s->tx_count = 0;
-            return FALSE;
+            return G_SOURCE_REMOVE;
         }
     }
 
     uart_update_status(s);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
index f8dc89ee3d..d466cd93de 100644
--- a/hw/char/cmsdk-apb-uart.c
+++ b/hw/char/cmsdk-apb-uart.c
@@ -199,7 +199,7 @@ static gboolean uart_transmit(void *do_not_use, GIOCondition cond, void *opaque)
     s->watch_tag = 0;
 
     if (!(s->ctrl & R_CTRL_TX_EN_MASK) || !(s->state & R_STATE_TXFULL_MASK)) {
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
     ret = qemu_chr_fe_write(&s->chr, &s->txbuf, 1);
@@ -215,7 +215,7 @@ static gboolean uart_transmit(void *do_not_use, GIOCondition cond, void *opaque)
         }
         /* Transmit pending */
         trace_cmsdk_apb_uart_tx_pending();
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
 buffer_drained:
@@ -227,7 +227,7 @@ buffer_drained:
         s->intstatus |= R_INTSTATUS_TX_MASK;
     }
     cmsdk_apb_uart_update(s);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static void uart_cancel_transmit(CMSDKAPBUART *s)
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index f70adb5308..51708c0836 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -147,7 +147,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCondition cond,
     /* instant drain the fifo when there's no back-end */
     if (!qemu_chr_fe_backend_connected(&s->chr)) {
         s->tx_level = 0;
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
     if (!s->tx_level) {
@@ -156,7 +156,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCondition cond,
         s->uart_intr_state |= R_INTR_STATE_TX_EMPTY_MASK;
         s->uart_intr_state &= ~R_INTR_STATE_TX_WATERMARK_MASK;
         ibex_uart_update_irqs(s);
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
     ret = qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_level);
@@ -171,7 +171,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCondition cond,
                                         ibex_uart_xmit, s);
         if (!r) {
             s->tx_level = 0;
-            return FALSE;
+            return G_SOURCE_REMOVE;
         }
     }
 
@@ -192,7 +192,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCondition cond,
     }
 
     ibex_uart_update_irqs(s);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static void uart_write_tx_fifo(IbexUartState *s, const uint8_t *buf,
diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c
index 3c6f982de9..dfe2276d71 100644
--- a/hw/char/nrf51_uart.c
+++ b/hw/char/nrf51_uart.c
@@ -93,13 +93,13 @@ static gboolean uart_transmit(void *do_not_use, GIOCondition cond, void *opaque)
              */
             goto buffer_drained;
         }
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
 buffer_drained:
     s->reg[R_UART_TXDRDY] = 1;
     s->pending_tx_byte = false;
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static void uart_cancel_transmit(NRF51UARTState *s)
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 270e1b1094..f3094f860f 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -226,7 +226,7 @@ static gboolean serial_watch_cb(void *do_not_use, GIOCondition cond,
     SerialState *s = opaque;
     s->watch_tag = 0;
     serial_xmit(s);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static void serial_xmit(SerialState *s)
diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
index dd5a02e339..dbe0b28e60 100644
--- a/hw/char/virtio-console.c
+++ b/hw/char/virtio-console.c
@@ -45,7 +45,7 @@ static gboolean chr_write_unblocked(void *do_not_use, GIOCondition cond,
 
     vcon->watch = 0;
     virtio_serial_throttle_port(VIRTIO_SERIAL_PORT(vcon), false);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 /* Callback function that's called when the guest sends us data */
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 39fbaaab16..4bbf8afb33 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -278,7 +278,7 @@ static gboolean usbredir_write_unblocked(void *do_not_use, GIOCondition cond,
     dev->watch = 0;
     usbredirparser_do_write(dev->parser);
 
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static int usbredir_write(void *priv, uint8_t *data, int count)
diff --git a/monitor/monitor.c b/monitor/monitor.c
index dc352f9e9d..941f87815a 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -144,7 +144,7 @@ static gboolean monitor_unblocked(void *do_not_use, GIOCondition cond,
     QEMU_LOCK_GUARD(&mon->mon_lock);
     mon->out_watch = 0;
     monitor_flush_locked(mon);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 /* Caller must hold mon->mon_lock */
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 5993e4afca..12555518e8 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -239,7 +239,7 @@ static gboolean net_vhost_user_watch(void *do_not_use, GIOCondition cond,
 
     qemu_chr_fe_disconnect(&s->chr);
 
-    return TRUE;
+    return G_SOURCE_CONTINUE;
 }
 
 static void net_vhost_user_event(void *opaque, QEMUChrEvent event);
-- 
2.38.1



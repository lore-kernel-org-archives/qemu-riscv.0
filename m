Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92445CA5FAB
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 03:18:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBOL3-0004gD-0Y; Mon, 28 Sep 2026 23:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xBOKx-0004ev-C6
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 23:16:59 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xBOKv-0006ui-G9
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 23:16:58 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-399026951a2so450358a91.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 20:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1790651816; x=1791256616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xgvmK5DxRC1HY1CRDGEPmN5s3hlr3uaLM+KbE+Mlu3o=;
 b=RDjx6J53LIE8is5kZ5uHD7e/zUYtzbTGBLVY9SKoWrfeDYoG3N6yZm5807lzmNelyn
 6zSzsG1bg5kV/JVFjc8KRTLWYcLVktJ/eBsSJBiMW9c6oG7RUg1uANHeGcDaCsqiEAVo
 RL26ysbrF6CNGp52mzWwQQabB6ZrDt4G5ar/haLPy9ltnpa62i4mNa7RiLLM6AfszVuj
 c3ObuTQcvkXMn66x3NcO14HStAxadgPUChCjd0qFDsCXz+34bZ6bNPgqqZvptVGr8AGC
 5xq7gMlxjHC8lbutMAFZlnFP+ItD7e0rl68+/CJnJ8+W1Vyv4KRYk0fDfk2wGywObAH2
 IphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790651816; x=1791256616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xgvmK5DxRC1HY1CRDGEPmN5s3hlr3uaLM+KbE+Mlu3o=;
 b=zZ5Pkwe//pU28H8ej7SQZoy5N2wgDbcvsvASNH5YqjWUe/qkx91kjXFDbnj1hJ5Axg
 OP//46yTZENwurRWgcuOc3lAcW+nIsr3jGHjTInPHJUY709NKZmWG1dV6Ru8sll4RCjh
 eSKTW6FS9k40tx/7hNAf/uQ8upigARfMYjElaKJwwJ4xTwk4nO7KYz7HdsbTeWIoTT+q
 n5re98RGotR1PKw0NdA4V6WaVTuXnXMOeyBrb7m+813RrP9zVrSzIuMSEAHg7zvAZLf0
 oqbLSYyibF0VENuYYeAhXfCk65DkEC4Nw8ZhwdvoG9MoyEUMDK2/aoRMOECY5YGNlmYA
 J9xw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwRZezMRw8Tc+K3RXUJ8TFBxhqzGXCQpHmlksLNRCQs6nfu2Y0BsJmHJ0iITMIfRRr/xasxR+Te96AT@nongnu.org
X-Gm-Message-State: AFq9FYJ4tKSYkmc27IHX+DdXm1RuAWMqQJLl5aTyhN1AD7zSeRQrNPMZ
 9aCBDPdRcNWsSK1NxBIuAo/Iu9kV418/yPUbQGbfdeCHJBkof8VL9OQtGFsnM1AuOow=
X-Gm-Gg: AYBFou0yeGqIqxS+H+ll0yBisl+hF1vGAn5s7tbd1nOdimagR7GHgXj4utShQyV01t/
 p29U56MaYCcRRJqcoM0NI1OZav+ZBm+wGU48tkJ17pVp4AVVrrpuFzRhitAXTTLB2pMSsItrRxn
 YCn/l80K4dmGljREQuffxpZ1mtCQmmhIfaSxqqYe5clD3BjS640TiQwwiDYzC7lh0Wy8x8lWGR+
 dWPOGzXfyw24O6jyvOp5emdSZqU4CX3jGgL3G2bQSr0jMeH4Zeis+y2vqJBxgek3PB5GlagZoVT
 qaUEkx801s1zJN3esWiJFc4VM1Zx9hgjvI6sS6bMdSaiwB7UI815/8QN54OQUzJ+p+3W+Ele0Fx
 dUWAOuhJrIA34TGXQD4il5U5K1zInISvFLNv0bnECuUnttlgKk77QSC2Qm+fQsBQs4isqPC/epE
 nsxxgAZAaBrJRdknsiKUOPPeGwMnKh55PyX22+Okvkk//Dnf3EfGj6n9gloAKV6FRpYFpM4gewR
 eoAgekULaaT/OtqnBnnkqKnfZEN5HRwJbUuLEljJpLDfEvzd96HERzT7Q==
X-Received: by 2002:a17:90b:388d:b0:39e:2f57:67c8 with SMTP id
 98e67ed59e1d1-3a0b25ca8a1mr17894962a91.4.1790651816069; 
 Mon, 28 Sep 2026 20:16:56 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a492dfc5absm1563641a91.3.2026.09.28.20.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 20:16:55 -0700 (PDT)
From: portias@oss.tenstorrent.com
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Joel Stanley <joel@jms.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/5] hw/char/dw8250: Fix leak when creating child device
Date: Tue, 29 Sep 2026 13:16:40 +1000
Message-ID: <20260929031644.1016354-2-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929031644.1016354-1-portias@oss.tenstorrent.com>
References: <20260929031644.1016354-1-portias@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=portias@tenstorrent.com; helo=mail-pj2-x10.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Portia Stephens <portias@oss.tenstorrent.com>

dw8250_instance_init() creates two references for serial_mm, one from
qdev_new() and one from object_property_add_child() which leaks the
serial_mm object. Fix embedding the SerialMM struct in the DW8250State.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 hw/char/dw8250.c         | 11 +++++------
 include/hw/char/dw8250.h |  3 ++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/char/dw8250.c b/hw/char/dw8250.c
index ccf05dd9ad..50baeae62c 100644
--- a/hw/char/dw8250.c
+++ b/hw/char/dw8250.c
@@ -72,23 +72,22 @@ static void dw8250_instance_init(Object *obj)
 {
     DW8250State *s = DW8250(obj);
 
-    s->serial_mm = qdev_new("serial-mm");
-    object_property_add_child(obj, "serial-mm", OBJECT(s->serial_mm));
-    object_property_add_alias(obj, "chardev", OBJECT(s->serial_mm), "chardev");
+    object_initialize_child(obj, "serial-mm", &s->serial_mm, TYPE_SERIAL_MM);
+    object_property_add_alias(obj, "chardev", OBJECT(&s->serial_mm), "chardev");
 }
 
 static void dw8250_realize(DeviceState *dev, Error **errp)
 {
     DW8250State *s = DW8250(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    SysBusDevice *serial_sbd = SYS_BUS_DEVICE(s->serial_mm);
+    SysBusDevice *serial_sbd = SYS_BUS_DEVICE(&s->serial_mm);
 
     memory_region_init(&s->container, OBJECT(dev), "dw8250-container",
                        DW_UART_REGION_SIZE);
     sysbus_init_mmio(sbd, &s->container);
 
-    qdev_prop_set_uint8(s->serial_mm, "regshift", s->regshift);
-    qdev_prop_set_uint8(s->serial_mm, "endianness", DEVICE_LITTLE_ENDIAN);
+    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "regshift", s->regshift);
+    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "endianness", DEVICE_LITTLE_ENDIAN);
     if (!sysbus_realize(serial_sbd, errp)) {
         return;
     }
diff --git a/include/hw/char/dw8250.h b/include/hw/char/dw8250.h
index 59396ad202..ce0b97715b 100644
--- a/include/hw/char/dw8250.h
+++ b/include/hw/char/dw8250.h
@@ -10,6 +10,7 @@
 
 #include "hw/core/sysbus.h"
 #include "qom/object.h"
+#include "hw/char/serial-mm.h"
 
 #define TYPE_DW8250 "dw8250"
 OBJECT_DECLARE_SIMPLE_TYPE(DW8250State, DW8250)
@@ -19,7 +20,7 @@ struct DW8250State {
 
     MemoryRegion container;
     MemoryRegion ext_iomem;
-    DeviceState *serial_mm;
+    SerialMM serial_mm;
 
     uint8_t regshift;
 };
-- 
2.43.0



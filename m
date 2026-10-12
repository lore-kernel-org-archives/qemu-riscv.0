Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC750CA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:03:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHYi-00040v-9t; Mon, 12 Oct 2026 11:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHY2-0003w3-MY
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:02:45 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHY0-0006MJ-UD
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:02:42 -0400
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so12919255e9.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817359; x=1792422159;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uBN2fajLUkSLR6UGUjgMftgFKf7I37iwakER3PeDYqk=;
 b=X4dtzxohyx/8t9phlGrN62a/hoVUKj0l+cv41eCRMzizguLFsYERQqNPnK+lL0bs1I
 otN1Bguut1JFE4CcwyyaQY6HxTWi+Eha7c48hjmfS+g4bz5Zt8gLcJtEeYHpsqYPPzOF
 UrbYmiPlVWJGAXI4nxwMIethP5RjrHCN5pjkjLRIxjcA+Fb6iPRK5q0R60yUW7Hb1nGJ
 5MFlTeQMJuJgI2m53hd/VmGZ7HqYtRh+Y0NvvmwLaEmv5ff3PPX/yqXcUveuhUIYuBEz
 FR+1/S+v3BO9RQncNYT20CU1bjFm9VRbV7tKRfocZ+w36inleYh2jcTu65WB1WSw5yVm
 Ltdg==
X-Forwarded-Encrypted: i=1;
 AKwUvBydQvC2nXRtlnbn71kXuAgqSFfi0iqTCPzfY9ubU++P0GyLS/Z9AK3DmtcYTLPuoh+6B00nI1b8oHPQ@nongnu.org
X-Gm-Message-State: AFq9FYKuvClz7Dl5zyhimLsXnlUNriGtdRfvrMDI9Y8CGgJdWtBROJfM
 JZM60BDUJ/3CUSwKZMadMyMlLcLsxrTnc000UsSH4lBCKUWYoFCKJ9gB
X-Gm-Gg: AYBFou23LUHsBgOgsD0k0Pz54VjlBjAUc0CUu1p5kQUurjlcC2pXnCShXJdWJiinmqq
 Ch+cw2KnYJnemw114dnhjN52lhqJBAJjyuMEHg6D9NnLd8aFhNdMi6V/K5tCkJS0bw1PLzgvzWy
 CsX082Nvkt6RKVZoUe4hT4ukJAFdZhX0r8EVDRVJwAo+7BrSimxoHw3x5tJZ4Q2y6Ct+pDlgmrx
 EernJv0n4t5rGpsalCy48ZZ2QLtsX5Ivf8FHAqNLiXCLwF+S6cjTNmp1hhWGmLXS/WOpXxwueoi
 2Gl416rQ2mwFTS9ohwc63IQ96ogUSpWhMLzjBYqsVpQ/GBmfODn7Dap/xCCaQAlGLcfEUUmdkWO
 r9kq3xbuaa84vG5oXSnPP/fi4DNwUtUtKGLMyPYijnN9P1w2X2wPQd1RawJl+xB/AQHhS4mrKwt
 wyntGa7c+i6QAPMLIbjgswLda6AAt8aLAcIfd7y1Q+bjnvG4jKneAaDu1wa0unbwWjOOJIyOmgN
 kZj7id6H/++GF1KoLDVx0ppn1d9cM3G/A5WFCBe/l6XhA==
X-Received: by 2002:a05:600c:4fd5:b0:4a0:5b:7bc0 with SMTP id
 5b1f17b1804b1-4a18e49a7e3mr194637505e9.21.1791817358991; 
 Mon, 12 Oct 2026 08:02:38 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ade914sm18383206f8f.54.2026.10.12.08.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:02:38 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:03 +0200
Subject: [PATCH v2 10/50] hw/rtc: ds1338: implement Resettable reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-10-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=1334;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=dw30TFJwCbFZiHnP+oufY0O0rlo9ULUgYxm9lxU/N6I=;
 b=gCj4ACC5dNO3AG53vFPudYQeLeg3WDZQQKwWNjs6v/cZ3h3uPGFGDM6JuLIwVPG18NEYST65k
 roUdGP4FuHQDD2mdnsTdMIHoe4q50k256ps4gb1YjL9Bhdbb5OBf1qA
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.46; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f46.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The device relied on device_class_set_legacy_reset(), a compatibility
shim around the legacy DeviceState reset hook. Convert ds1338_reset()
into a proper Resettable hold phase, dropping the legacy shim.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index f8b3340bf0..74aee6c746 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -208,9 +208,9 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
     return 0;
 }
 
-static void ds1338_reset(DeviceState *dev)
+static void ds1338_reset_hold(Object *obj, ResetType type)
 {
-    DS1338State *s = DS1338(dev);
+    DS1338State *s = DS1338(obj);
 
     /* The clock is running and synchronized with the host */
     s->offset = 0;
@@ -224,11 +224,12 @@ static void ds1338_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     k->event = ds1338_event;
     k->recv = ds1338_recv;
     k->send = ds1338_send;
-    device_class_set_legacy_reset(dc, ds1338_reset);
+    rc->phases.hold = ds1338_reset_hold;
     dc->vmsd = &vmstate_ds1338;
 }
 

-- 
2.50.1



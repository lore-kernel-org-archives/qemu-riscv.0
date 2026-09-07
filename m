Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30299C79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:14:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctz-00027Q-5i; Mon, 07 Sep 2026 13:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cSN-0002RN-M1
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:44:31 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cSK-00037g-OF
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:44:31 -0400
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so3642837f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799467; x=1789404267;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uBN2fajLUkSLR6UGUjgMftgFKf7I37iwakER3PeDYqk=;
 b=e/9eyQ2tSw4MeBjFqyvWlajIUGR/zNeUAcL5Ds0ak8yKNgZPL+T7HgHILE6YeSrwFh
 YoK+f66l9SVg60h94k7kK4SWqtsx9dzBKt4kwcfOP9QXSz4I/i06xPEa6oHkP43+2E5V
 LZplf/vpAQpZWc6p/6uZuuvriArtjObCVXsvVh7x976PTW1Eu6t2WCjXOR/6UjhiFjCT
 1NvTYnw2l+lsPbIkVYELPcLTkDgg+AAra5MBYyEkk1GxnvlK7eZLDlxt/qPm9cI+PGPT
 /57ABYWFuZ+dIj57nNhGnBXvKULKXkVKmoaDgsARo/6VZLqf/0EUGrgOkrIyAKawgBpg
 B8Xw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxHRml4AlwmRcS0YgWDa43+PZhxWHJKPMt3oUdAMn4rvedk6YKA3E7aE5r26XewYnG0Nxjf5R1b7Ira@nongnu.org
X-Gm-Message-State: AFuF++kMo/gMyTjeoyIP9zYzBd+It/cHYZlPLb9PJ8LVHJ0jVDrRk8QQ
 IVryi9IDP0ZkZzElAKD2KwpnFwYoho85xSusT/645e+0HGFcs82OOyRO
X-Gm-Gg: AYBFou0sWn7Ug8RU7pRE+4iISSGrmjTW8rNZbAGoSlog/XYAfGfWHA8rFTioDuHz9Xt
 pCFOr31k38C/ML7tfQ9sF39iijJVo1Z4jkT/oEYwjk6rY50Z5QBQAAncpD0AmnoCZscyPw3FY8U
 UUJ2E/CjoJi8vRWbZh60ViT1wpKhb06uwOR2PBvgrmXesZqIKYbYq27viwCf8X77yPP1kCrOXfL
 zBo3MyftKvMIpBYvvkNM3js44Gr4ZNTOIETmMiAThaw7pTJgWnzyLwJ1XuOqve0a7s4tVWFiCsE
 0G/EQd9ZKXNsTzhewGECZpHRY2dn9lsih/Y2CCxd2B69UPThYCffOl9Z7QkoHhtc9vRtyiRqY8R
 ysyED03bWeIuKMcqBExnQCgYkPRDb1Z/wf0ZiZzIMezuPORdKB4XV8vadHdjwjjANNJI6eYLUow
 TehmhG/wWmLXIxgGBI4/tQ4Tat5BljMaUiAmMzbQ/oJ/EfCZqgczZ8hCBZ6ctqt0Iz49mcxCM8+
 C2SWQdFmzZ5ngY3blRUTNWk4RL6tHQNqf00sgRswsdJ2A==
X-Received: by 2002:a5d:6f1e:0:b0:485:8c16:5ef0 with SMTP id
 ffacd0b85a97d-4858c166129mr22614304f8f.42.1788799467119; 
 Mon, 07 Sep 2026 09:44:27 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48594172546sm21043507f8f.15.2026.09.07.09.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:44:26 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:00 +0200
Subject: [PATCH 10/50] hw/rtc: ds1338: implement Resettable reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-10-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799320; l=1334;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=dw30TFJwCbFZiHnP+oufY0O0rlo9ULUgYxm9lxU/N6I=;
 b=pu9ebqJet/tiBDoaaf4BN7KUK21xC4ntJwcGAkWudZttiuCq9DRmHNE0e48w2ji6Ngrs8Oway
 igoMaykKGBXCwok8q42UE3LL5LVRMFqrmdFeQ6XBKAts6Zxg+dH4wlK
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.53; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f53.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Sep 2026 13:12:51 -0400
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



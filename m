Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlK8-0003Kd-1e
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlK4-0003IA-2k
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:43:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlK2-0006Yy-J8
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:43:27 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39482)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJs-0006Si-W4; Sun, 12 Apr 2020 18:43:17 -0400
Received: by mail-wr1-x442.google.com with SMTP id p10so8531185wrt.6;
 Sun, 12 Apr 2020 15:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3QRm8Wqt1J2otRs7IHGLTNCRC9I2pIq2Ldqm2vYIZwQ=;
 b=BI0OO7eQOT9kON+/WoQdaSkswe9KIOYn0LuVWTQG19Osoy7nIPv1kWrm01BaRVd+HY
 dKLe9U7lhvy1vxqRdTmkfVjoI8ZhCGIimT5f+twxLbXawn9ZJDmJDJ+cTDjHgN4C3Ocd
 Lp+43j3OY2meI1NI2VooapLB7emwYx9/PzaR5S6hFTZLWWsQWeUKG+SUiOe0DF+BfwXD
 PJWsyUBETLr/ALdZWbz2rf9oJdZCoYH60KzwzIoE6Xc8W2JqC1hjODQ/yjGusUcvIN7A
 iW3w5+XZ05inhuYtPMM/tE4a1aHIlJYUcBNTLRCbW7qMRoL+1w2Ar81lVYiwRmi2u+ul
 Jz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3QRm8Wqt1J2otRs7IHGLTNCRC9I2pIq2Ldqm2vYIZwQ=;
 b=o+pb5lj8gLWy4CUPByLXJSSMsLQSZpia65/N6skr+YaUD2UZYHfBpT4jfck1PFTxBP
 jhhpVDVM8sXwKvq/OwOpEJBa6GD+bMqHJStQ8yKzRzVJ1iKUOShwRxvpaLFzvOVZjUzi
 BwW1xcruWqwE1A18NJy2Mg+1j9t1tcVL5RV8i5TkXu2phwUgF4y+li6kBu3SjLFhgfGU
 rWqP2Hh73ucL0xP+GbfvHrboaaikKyYG7vw0n/NpOLo2b49OLhQs5Qxd+rtOA1ifeFBo
 9UJpRtLVguTYlIqV1c8HwK1+ydS5aa0eDein8afg0kC4hHiBEwm+g3zg4MPghoj5P11k
 rC/A==
X-Gm-Message-State: AGi0Pua7cMwiGlYAj70RmUKZyfhCTsvm9iuj8zPStdV8xu1LZL4pZ6er
 mhLGyu+szANBh/0Vz65uSZbfjn0EBuaB/w==
X-Google-Smtp-Source: APiQypK7QdJdqrw+hpKuFm1WJizwJEdtv7s86S/tUtKPH6Iv6i7VdrGKNo7cihiI0dSGjkHhEFTw5Q==
X-Received: by 2002:a05:6000:e:: with SMTP id
 h14mr16915034wrx.128.1586731392852; 
 Sun, 12 Apr 2020 15:43:12 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:43:12 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowang@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 Michael Walle <michael@walle.cc>, Joel Stanley <joel@jms.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.1 v3 23/23] hw/sd/milkymist-memcard: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:44 +0200
Message-Id: <20200412224144.12205-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Apr 2020 22:43:30 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/add-missing-error_propagate.cocci \
    --keep-comments --smpl-spacing --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/milkymist-memcard.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 926e1af475..87294c1b71 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -280,6 +280,10 @@ static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
     blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
     carddev = qdev_create(BUS(&s->sdbus), TYPE_SD_CARD);
     qdev_prop_set_drive(carddev, "drive", blk, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(carddev), true, "realized", &err);
     if (err) {
         error_setg(errp, "failed to init SD card: %s", error_get_pretty(err));
-- 
2.21.1



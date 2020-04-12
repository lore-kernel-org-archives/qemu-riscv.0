Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlJ9-0001cQ-2u
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49785)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJ6-0001Ve-3x
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJ5-00064q-5U
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:28 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41674)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIz-00060p-1b; Sun, 12 Apr 2020 18:42:21 -0400
Received: by mail-wr1-x442.google.com with SMTP id h9so8535752wrc.8;
 Sun, 12 Apr 2020 15:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+O8FSNw/XveJvWULa4+Jfl3G5r6TBg2LXwiWGWDolCA=;
 b=JghYvfP+OE/gAaq/k+cmw+2Cnl+0TTmOt8CBP/wmQxsJlyVf0LD4yuAuTnaqH7E3sh
 gKBJK18MKq1hOPHqbQ0z7G/6xjnUF4pOu1jZ31vWP42WkDuXGr7qkK5H80E0okppPU9h
 OGjA2noOGYb3H02VQ6W3c0xiC6X/ZCopm23cocS/K+EjZS/Wu3Y36MZ6rmY/uLJruDTA
 HqB5DGm7XAYgoUzcZ/ktwSnoDBzVd7qHbPLnMcuq75XMeULNER7wyhfm38wDttEL/mqW
 bRQetBsR+Sj2uPvuStv3YPCwtPkJ1L2vY49CDQdOTLjnr7fYgq8kmnt8Rjdn1IQ+ToNZ
 YrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+O8FSNw/XveJvWULa4+Jfl3G5r6TBg2LXwiWGWDolCA=;
 b=edadRrr9M6/DhanRZYuU3zSM9ckRcRaQX4oiF1raFLlRmGGb/uQXQmdxPWS3bFxDDI
 qgK3+kmpzcmG17OkPV1UMMvIOSa+TFHUcNZASlkQFcffaVn/89qO/xd8eqKhB8/4ZHDB
 uKkrGsw2B8CTTOnhXKjoQmR42BDVlMG/8a95sew+MQYdh4vdcRcUTcjyZvjVk18tIepW
 MZgKMG7M6udegEUeLJCPhQRZNU56JhAKTiXkIKF09uP9NgDFZv3i+7btGvfR4xp2NAIm
 ZRXvO1byV6AGE1tY3n/50CmlZnT+qAKxycAH+LES2dfbUNJ0qHgAI7S7qzQT5INy6633
 o7vw==
X-Gm-Message-State: AGi0PubWAbBPIOWh9ev+NGFju3hV+ebLyrfvGKL697az+MaBtHGVcKxQ
 3QtUNcSeIFbMTxacSVGFrzU/g4OEgXL+Hw==
X-Google-Smtp-Source: APiQypLZ1NMTXnAZenGdHIyB5P9HdjI1CtfX+Kh+BXtTBW28G1YeRa6BQP108OKwa/7Ig8phtUvQ9A==
X-Received: by 2002:adf:904e:: with SMTP id h72mr15645835wrh.367.1586731339864; 
 Sun, 12 Apr 2020 15:42:19 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:19 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 09/23] hw/intc/arm_gicv3_its_kvm: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:30 +0200
Message-Id: <20200412224144.12205-10-f4bug@amsat.org>
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
X-List-Received-Date: Sun, 12 Apr 2020 22:42:29 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/arm_gicv3_its_kvm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index ad0ebabc87..3d2c4e22f5 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -101,7 +101,11 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
 
     /* explicit init of the ITS */
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
-                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &error_abort);
+                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     /* register the base address */
     kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
-- 
2.21.1



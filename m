Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlJS-0001tE-GD
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJP-0001kM-2S
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJO-0006CC-1r
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:46 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36437)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJ8-00062j-Fm; Sun, 12 Apr 2020 18:42:30 -0400
Received: by mail-wm1-x344.google.com with SMTP id a201so8023330wme.1;
 Sun, 12 Apr 2020 15:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z9KZ6eY6DRrXTHj5N0HrtI0MTUlERzvy0/HLB/IrQH4=;
 b=bGgzjIEqniohf+mlvT6SPL2WUceu7HTqs+DBMzLs+vU9gSIDrdVjfTd8xcrgOCAky5
 TDh2vRuFihmMGB462TBdOQPKih5ksBuXcT+29C0YsOitDdaimi9uo5kpTY3XUszml15P
 fZinBnJCt+z9YaYN0iIH2+V+uqlAHzQaeWvGuCQoeTNPPLyFu68op8CfwQeEbN+Csh5A
 w2Ku3l/giqijPu5Ixf88DXrRo+hF7edx7sdWJC/7eRqGTWT6tNwng5+26SxcXf21o4pi
 fbssSyzOVeYjVLMjSV9OT3CBM/9zFMIyz5VD0NDH9aZNmY9PSR78I6K1mLwfwl598XW6
 frtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z9KZ6eY6DRrXTHj5N0HrtI0MTUlERzvy0/HLB/IrQH4=;
 b=RDny59dSGRgqiLldr71XbD0qcb6Ijr4VflxnpRd7zWB8wt8QBK8fAMBGE1a0EmYny6
 SvQuNXm76xCfSJl93jWMcOa6q1CuXpLVSptQI1/MPrvNo/f2Ve8H2EBr2eHLkwOdVtnv
 IuB7aksVA+oT1WYMffQK5VglHiqtgOlwoOz6Cj0TlFO+PLFDmEyThtCvfCXs32CkqOYX
 Cjr2EBKekzxNTh0UArVgDMx2JBnDtinm7PGm8Oe4CEbeQZsYPHygf03ahURBP5veENGK
 lLgbiZYT/pe93GtRlaykIW/g9+A2tUyK3ubB34dbWrETE0103pIXGfW5arEy+jl6qL0M
 0jfw==
X-Gm-Message-State: AGi0Pub4k0MVvTRFbdRtRNASUx3XgInYl/NaA5nCgFjQNuoDE1dABNMd
 Ku3jHU2giYku297I/ENIIYhRjEhgAUEX4w==
X-Google-Smtp-Source: APiQypLM5eyX9dZ+2OjFqysoVLHTT2ZiaOcl9zPGes7IMRWLxf7/1Fhiyo1+f+ujdIQ/6fOLwJNckw==
X-Received: by 2002:a05:600c:c9:: with SMTP id u9mr8334867wmm.15.1586731343376; 
 Sun, 12 Apr 2020 15:42:23 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:22 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 10/23] hw/microblaze/xlnx-zynqmp-pmu: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:31 +0200
Message-Id: <20200412224144.12205-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
X-List-Received-Date: Sun, 12 Apr 2020 22:42:48 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/microblaze/xlnx-zynqmp-pmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 2aa602cf85..4ecbea7fdc 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -123,7 +123,11 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
     /* Connect the IPI device */
     for (int i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
         object_property_set_bool(OBJECT(&s->ipi[i]), true, "realized",
-                                 &error_abort);
+                                 &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi[i]), 0, ipi_addr[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->intc), ipi_irq[i]));
-- 
2.21.1



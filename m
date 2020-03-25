Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHBYQ-0000X2-L0
	for mharc-qemu-riscv@gnu.org; Wed, 25 Mar 2020 15:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYM-0000QM-GM
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:19:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYL-000054-EJ
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:19:02 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35968)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYD-0008Pb-Be; Wed, 25 Mar 2020 15:18:53 -0400
Received: by mail-wr1-x442.google.com with SMTP id 31so4704302wrs.3;
 Wed, 25 Mar 2020 12:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wrJdKpRKJHYFpsu8f/k/XHLGFdJX1oGK4sHeuwFlD8Q=;
 b=BJ0/ut6kqXFsqLRtDlE1/SHKtzso+q2uxz1zm7jf93uWxv2mfeJdLUt6SEKSk2nqzS
 7sEy6HaszD3JvjQTtblkk6FKF/v3Bl22TTwo3/XaWfuRjNIJJeZAJCuxbt2v5yQ+YtdJ
 xQU4AtzCye4vIZyvBlSh+p4CnWwjPcgP5YF/5uahBIHXnfb/y3toH1QQmu4TQjvGbn8m
 jbKxSsc5nQ6J87jGpNvgC/F6dox3wQclJPjQHWW72hYX+4ndgS0/ltFTxZ9P1TxUDsfZ
 UE6TlrDps3hK5XMfvOcfYCOBLeJc5NsypvDiR+4+DnQhWJpbf/BbqmadAqTBgo+2c447
 6I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wrJdKpRKJHYFpsu8f/k/XHLGFdJX1oGK4sHeuwFlD8Q=;
 b=H8ug+Y8gRPUiHtMi6FB6iohC6pRvc/4yHmng8sYYcQbBF9bs/scxt7E4juT7+Ec1/u
 /4TenhZlu4M5l2PuqHC51/KmbI1RmVrymDZHuhuU6rLbvzr6XJYt1Y7b5YHKzmB5g0Xa
 125ZsRdByxMPAnMmp2VYdVBk4duEqT/8mhv8dlU8EgeTV1jg23MRSRgMvklk8bY64bVR
 goTS0s1uUZnC5vdqmJ+U6Y4Aw9uDOTmnYGk8iRH0KaKE1xezkGBDCCseZnVcNTFECNy1
 wUxbKYc4vS2je/fY/5i4PhwIXVYRPcSoiR4OKVLIMZT3ElBLDQgYSsw6GeMTC9O0vXk1
 6QIg==
X-Gm-Message-State: ANhLgQ0pjOBTd6YS1cKTSYh/B9gvgAOlKXGn53xjNc431JqsMP0kNOhU
 oaOHJRix0qlrcVKxSWqT4wZVxPZnH90=
X-Google-Smtp-Source: ADFU+vtLpvKpCB9LLgmIxRTvJrownfGJ5Y4wqJnSnshhMqp0Ce2Ane11vdQjML1kw2Kfbs9cXVvxSg==
X-Received: by 2002:adf:bb06:: with SMTP id r6mr5157392wrg.324.1585163932103; 
 Wed, 25 Mar 2020 12:18:52 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r17sm6345672wrx.46.2020.03.25.12.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 12:18:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Paul Burton <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.0 06/12] hw/dma/xilinx_axidma: Add missing
 error-propagation code
Date: Wed, 25 Mar 2020 20:18:24 +0100
Message-Id: <20200325191830.16553-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200325191830.16553-1-f4bug@amsat.org>
References: <20200325191830.16553-1-f4bug@amsat.org>
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
X-List-Received-Date: Wed, 25 Mar 2020 19:19:04 -0000

Running the coccinelle script produced:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/object_property_missing_error_propagate.cocci \
    --keep-comments --smpl-spacing --dir hw

  [[manual check required: error_propagate() might be missing in object_property_set_link() hw//dma/xilinx_axidma.c:542:4]]

Add the missing error_propagate() after manual review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/dma/xilinx_axidma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 018f36991b..6e3406321c 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -521,39 +521,42 @@ static const MemoryRegionOps axidma_ops = {
 static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
 {
     XilinxAXIDMA *s = XILINX_AXI_DMA(dev);
     XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
     XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(
                                                             &s->rx_control_dev);
     Error *local_err = NULL;
 
     object_property_add_link(OBJECT(ds), "dma", TYPE_XILINX_AXI_DMA,
                              (Object **)&ds->dma,
                              object_property_allow_set_link,
                              OBJ_PROP_LINK_STRONG,
                              &local_err);
     object_property_add_link(OBJECT(cs), "dma", TYPE_XILINX_AXI_DMA,
                              (Object **)&cs->dma,
                              object_property_allow_set_link,
                              OBJ_PROP_LINK_STRONG,
                              &local_err);
     if (local_err) {
         goto xilinx_axidma_realize_fail;
     }
     object_property_set_link(OBJECT(ds), OBJECT(s), "dma", &local_err);
+    if (local_err) {
+        goto xilinx_axidma_realize_fail;
+    }
     object_property_set_link(OBJECT(cs), OBJECT(s), "dma", &local_err);
     if (local_err) {
         goto xilinx_axidma_realize_fail;
     }
 
     int i;
 
     for (i = 0; i < 2; i++) {
         struct Stream *st = &s->streams[i];
 
         st->nr = i;
         st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_DEFAULT);
         ptimer_transaction_begin(st->ptimer);
         ptimer_set_freq(st->ptimer, s->freqhz);
         ptimer_transaction_commit(st->ptimer);
     }
     return;
-- 
2.21.1



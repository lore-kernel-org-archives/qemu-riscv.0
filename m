Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5C8s-0006If-44
	for mharc-qemu-riscv@gnu.org; Fri, 21 Feb 2020 12:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38105)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j5C8p-0006Bl-8X
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j5C8o-0007zy-74
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:07 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45117
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j5C8o-0007zc-3L
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2pPJB7dVv53xB+pM6ByHDe1JdpbC3cSQ0yop2iaXBM=;
 b=hp+Z/6WfvIPiaYqlrUspW9QVcKk7E0hIIOB/oPXy0L07wQpMayfIH1LhrkDlC3c31AyO9O
 uqKxDkwhvlNiMi9ANHd4dmlCOGb0HQ9Lcy0eKfcgIs9vDlSyPImCSSu1Cq77cbvsSMa70g
 +ROvvyEFU/JdE34KS4WqXc88dLaoiGw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-0SG40CO1P9ycWFg1z542-Q-1; Fri, 21 Feb 2020 12:31:01 -0500
X-MC-Unique: 0SG40CO1P9ycWFg1z542-Q-1
Received: by mail-wm1-f72.google.com with SMTP id f66so853583wmf.9
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2020 09:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1tNyRzGC0EsXOg8ox9ROXwfpcEcBwuRdTCHdqcdRxTY=;
 b=q5TssWnwz7vEldykc6vWo1NTLIFH+xiU5WqzwB4qsLOy3l73ydWTXj2+hhHAWnG7C4
 DVaQ81c/0I/tchLdq8aWbzXCOX1NrZ1fkLV+5eT/Y+oGxT7VoS1Qcnj5DJG0A80jdyex
 EwuQ1z90yuhcPMk0N74oFe51p9CyAy4LO6YYQ5qVN0bqFiQkDcZ/ah3FUNdqaKxdIvM+
 6IcbhL7C7yxBr6UYN6q75nf/0RE6YW6JhRf+2YK7kq2IC0RYrRdilUzwnq940I7SsxVi
 EZvSFi/wJfFCw2Qw17kpO82cQyHXb6eomOd/+W5h6Mo21UBaaCdIxNK83fsV5QxQvtNs
 dxfw==
X-Gm-Message-State: APjAAAWURy35izd76yAK+tV5DjQgEV1q12oERLagB6wO0qOpuuW3Peu3
 UUt+1iE1F2UhR8IbgffiVa+PCm9zCkzSfSWpHENgXtx/9lacAAbjWo5RxXW3iXtFNdHvLzNTpKC
 U6wiLRpYAd4U9ELw=
X-Received: by 2002:adf:f091:: with SMTP id n17mr48035232wro.387.1582306260614; 
 Fri, 21 Feb 2020 09:31:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxAW+qR5XRP7uwi7KWjtLc+Ik1gy311YfEvXAKKV0p8ZnHFE0EazAPFpnBibOLVdwTqQTE/UQ==
X-Received: by 2002:adf:f091:: with SMTP id n17mr48035215wro.387.1582306260447; 
 Fri, 21 Feb 2020 09:31:00 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id h18sm5000871wrv.78.2020.02.21.09.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:30:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 4/7] hw/core: Let devices own the MemoryRegion they create
Date: Fri, 21 Feb 2020 18:30:46 +0100
Message-Id: <20200221173049.18134-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200221173049.18134-1-philmd@redhat.com>
References: <20200221173049.18134-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 21 Feb 2020 17:31:08 -0000

To avoid orphean memory regions being added in the /unattached
QOM container, use the memory_region_owner_nonnull.cocci script
to set the correct ownership.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/core/platform-bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
index 22c5f76dd0..d494e5cec1 100644
--- a/hw/core/platform-bus.c
+++ b/hw/core/platform-bus.c
@@ -187,7 +187,8 @@ static void platform_bus_realize(DeviceState *dev, Erro=
r **errp)
     d =3D SYS_BUS_DEVICE(dev);
     pbus =3D PLATFORM_BUS_DEVICE(dev);
=20
-    memory_region_init(&pbus->mmio, NULL, "platform bus", pbus->mmio_size)=
;
+    memory_region_init(&pbus->mmio, OBJECT(dev), "platform bus",
+                       pbus->mmio_size);
     sysbus_init_mmio(d, &pbus->mmio);
=20
     pbus->used_irqs =3D bitmap_new(pbus->num_irqs);
--=20
2.21.1



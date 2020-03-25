Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHBYA-0008OW-6i
	for mharc-qemu-riscv@gnu.org; Wed, 25 Mar 2020 15:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBY7-0008HO-8K
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:18:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBY6-0008L5-0B
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:18:47 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37484)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBXy-0008Fe-Kg; Wed, 25 Mar 2020 15:18:38 -0400
Received: by mail-wm1-x343.google.com with SMTP id d1so4186648wmb.2;
 Wed, 25 Mar 2020 12:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CkPe9c7WtsqdNtQ1gIrLaLcoK0h9RvhM17e7zhHbNJ0=;
 b=XPPNTNEToSCPzF9RYiFistt/AyuGtTzjetGYj7RZU6CJ34srCCzuR+hcZqGawRHVjS
 v7Uhn0JoplmJG/Uzrok1/nKqwhJLt2b7M5JpwzdWWLXheMYI+iOrPqpxNL1qXj1hMfkS
 xo3dvBD10Fb4cf9SmCZuH5wtE0aFDaY4GpyleRETKqNomAgR1aDA1QvMQmEaQez+WVLL
 E/N5Vhgzlo5vCAnXPoWkC9DGDls9f9vj/JiaXWnPe+VGb2bnAtc4SVfvcZ5lYan4fNjf
 D1dDQ2R+mhJYu+Kv6Sak+5qpg0niyvjpQBbuWx6GJOPQ3OeIERx+7I2qCFL3YnUKkKj9
 YG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CkPe9c7WtsqdNtQ1gIrLaLcoK0h9RvhM17e7zhHbNJ0=;
 b=QJ5uVfjhk4uWMUq0zDy9eGWyDoXxJdFZGZvrnVsmQSDOuZO2Q0a65kwq12d9Zemr0z
 R6U8q7rzHchV6U83slqpJO0++3uj0nBIY/W0A59N3PetV6Csj3w0RoqlufHfbuCExrcQ
 2AgMUZqytdA5ISnnRDF/vIO4PcjgS/ZN5Ir/RsSVzZN4HbW3ycgu/rnv1Y+nyBf8WeBq
 aTr9vbfnXXQnbuRgufZudYr/eNuvKWOYpQJ/saNUHpD2I7T/7hMt6bZelkIMhvoBwBQd
 4bcIxIv4zWfjDX7eiC1unr2V4UmaXQzSCjrMe2T+0J264xdxtw37TsW57r/L0H4QESoQ
 sa/A==
X-Gm-Message-State: ANhLgQ0S70/tcHISxAgz1x7+gzJHnpkv0jC3zPso2BhnsVUxlPW8NxWf
 Nyae0rbzWVgmZcJuBDiMbARsbSjCkGA=
X-Google-Smtp-Source: ADFU+vu4Prm9QXq4qTH5OQBnEVGpDvhSS7WGWWe1lxLJHnTVcwZ+YzxFQUeEJzIvEU/NnGcnQr4VIA==
X-Received: by 2002:a05:600c:24d2:: with SMTP id
 18mr4767560wmu.38.1585163914865; 
 Wed, 25 Mar 2020 12:18:34 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r17sm6345672wrx.46.2020.03.25.12.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 12:18:33 -0700 (PDT)
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
Subject: [PATCH-for-5.0 00/12] hw: Add missing error-propagation code
Date: Wed, 25 Mar 2020 20:18:18 +0100
Message-Id: <20200325191830.16553-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
X-List-Received-Date: Wed, 25 Mar 2020 19:18:48 -0000

This series is inspired of Peter fix:
"hw/arm/xlnx-zynqmp.c: fix some error-handling code"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html

Add a cocci script to fix the other places.

Based-on: <20200324134947.15384-1-peter.maydell@linaro.org>

Philippe Mathieu-Daud=C3=A9 (12):
  scripts/coccinelle: Add script to catch missing error_propagate()
    calls
  hw/arm/bcm2835_peripherals: Add missing error-propagation code
  hw/arm/fsl-imx: Add missing error-propagation code
  hw/arm/stm32fx05_soc: Add missing error-propagation code
  hw/i386/x86: Add missing error-propagation code
  hw/dma/xilinx_axidma: Add missing error-propagation code
  hw/mips/cps: Add missing error-propagation code
  hw/mips/boston: Add missing error-propagation code
  hw/mips/mips_malta: Add missing error-propagation code
  hw/misc/macio/macio: Add missing error-propagation code
  hw/net/xilinx_axienet: Add missing error-propagation code
  hw/riscv/sifive_u: Add missing error-propagation code

 ...ect_property_missing_error_propagate.cocci | 58 +++++++++++++++++++
 hw/arm/bcm2835_peripherals.c                  |  8 +++
 hw/arm/fsl-imx25.c                            |  8 +++
 hw/arm/fsl-imx6.c                             |  8 +++
 hw/arm/stm32f205_soc.c                        |  4 ++
 hw/arm/stm32f405_soc.c                        |  4 ++
 hw/dma/xilinx_axidma.c                        |  3 +
 hw/i386/x86.c                                 |  4 ++
 hw/mips/boston.c                              | 17 ++----
 hw/mips/cps.c                                 | 52 +++++++++++++++++
 hw/mips/mips_malta.c                          | 19 ++++--
 hw/misc/macio/macio.c                         |  4 ++
 hw/net/xilinx_axienet.c                       |  3 +
 hw/riscv/sifive_u.c                           |  8 +++
 14 files changed, 184 insertions(+), 16 deletions(-)
 create mode 100644 scripts/coccinelle/object_property_missing_error_propagat=
e.cocci

--=20
2.21.1



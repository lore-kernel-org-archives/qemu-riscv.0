Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBss-0008Kz-Fi
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBsZ-0008BU-QD
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:05:04 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBsW-0004zW-Km
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:04:59 -0500
Received: by mail-ej1-x636.google.com with SMTP id tz12so85975429ejc.9
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TFfnwjftSBTQtlrSBz3RLCltb8prEkxU+BRsjCrCgtQ=;
 b=pCKy3Vgcn9frgL1Z6PKfnlIn4yF3aXjidG7SLKuNXzFpa3mU8tY2cNUadw4pji+k0F
 jvpcI50AwZiG3VGGcq9ma6u2qDa7eHF+2i8kQFHVey8/mdD64bhVe9IxFoIN7pJgyEf9
 2c7BWfk0pHq4Ja3VgwFKR6baxop3v5zgBfBmdwkLjZCalagvZxady8XUc2k0Biwihz8s
 CEJEEa6hlHhcbuSTswJ32VaW4KbPzupRCjO94mOhv0UuY/HIlezodfZJvRsu2ij2a1NM
 oKjxWkEjZPwRP+CDs82l4DPEDA57dMMt1e/I0mPPx/wMggcz0N8AyNqo2FMG0IOfNmG3
 hv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TFfnwjftSBTQtlrSBz3RLCltb8prEkxU+BRsjCrCgtQ=;
 b=T4EUbvkoK0VepBPUTgMkYA5vagOukXBmMCWqtLUW1TV+xGIfraEbH+AkP/ffToZ8mT
 QRRnMAauUWv5kQcClsmhLOwcW8+E1Gtx9/woTrI6af1vTY+HomYhaNjLF6nH7bH7FzB1
 bPrD+L0D1U17/lyk1yV0l3tGpfdIIuAHCFzAi2hxLC3gki6I04ZHoeGvoT+t5YYtrcYN
 y+yyHmyKD0hE68kL6eJ/DSlCSyhMIATLRaVkzBNqppVmcaADF1hSuyZ1LRkN64YtbVw5
 thE4vpAs6UQizHG2nTl89SZRRFR/LsjdDa3Si6lxLRfkR9gUxUFw2l60vC8CtbNVGq/4
 lDFw==
X-Gm-Message-State: AFqh2kp+3S4arcCIQAiIyZvAbX4+XTOoPQpzzXTZOe6wBm+MhJuif6zr
 ZRVlRBpOYgOl4Alq9y6r1WkByA==
X-Google-Smtp-Source: AMrXdXv8vYeyfvNZ6wMfRLyd7GkFBEmpWbZ4qZ0RgO9hI3ghNmrgaXrH0twPL68Bf7bsOSPFBGU6ow==
X-Received: by 2002:a17:907:c48d:b0:7c0:fe60:be12 with SMTP id
 tp13-20020a170907c48d00b007c0fe60be12mr38960273ejc.25.1672869894693; 
 Wed, 04 Jan 2023 14:04:54 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a170906115000b008373f9ea148sm15784340eja.71.2023.01.04.14.04.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:04:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 00/20] hw: Remove implicit sysbus_mmio_map() from pflash APIs
Date: Wed,  4 Jan 2023 23:04:29 +0100
Message-Id: <20230104220449.41337-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 04 Jan 2023 22:05:10 -0000

Paving the road toward heterogeneous QEMU, the limitations of
having a single machine sysbus become more apparent.

The sysbus_mmio_map() API forces the caller to map a sysbus
device to an address on the system bus (system bus here is
the root MemoryRegion returned by get_system_memory() ).

This is not practical when each core has its own address
space and group of cores have access to a part of the
peripherals.

Experimenting with the PFLASH devices. Here the fix is
quite easy, we split the pflash_cfi_register() -- which
does the implicit sysbus mapping -- into an explicit qdev
pflash_cfi_create() followed by the sysbus_mmio_map() call.

Since we were touching the PFLASH API, we restricted the
PFlashCFI0X structures to their models. The API now deals
with a generic qdev pointer (DeviceState*).

First 15 patches deal with the CFI type 1 model, then the
last 5 with the type 2.

The patch logic is mostly:

- extract pflash_cfi_create() from pflash_cfi_register()
- open-code pflash_cfi_register() for each hw/${ARCH}/
- remove unused pflash_cfi_register()
- reduce PFlashCFI0x structure scope

Please review,

Phil.

Philippe Mathieu-Daudé (20):
  hw/block: Pass DeviceState to pflash_cfi01_get_blk()
  hw/block: Use pflash_cfi01_get_blk() in pflash_cfi01_legacy_drive()
  hw/block: Pass DeviceState to pflash_cfi01_get_memory()
  hw/arm: Use generic DeviceState instead of PFlashCFI01
  hw/loongarch: Use generic DeviceState instead of PFlashCFI01
  hw/riscv: Use generic DeviceState instead of PFlashCFI01
  hw/i386: Use generic DeviceState instead of PFlashCFI01
  hw/xtensa: Use generic DeviceState instead of PFlashCFI01
  hw/block: Factor pflash_cfi01_create() out of pflash_cfi01_register()
  hw/arm: Open-code pflash_cfi01_register()
  hw/microblaze: Open-code pflash_cfi01_register()
  hw/mips: Open-code pflash_cfi01_register()
  hw/ppc: Open-code pflash_cfi01_register()
  hw/block: Remove unused pflash_cfi01_register()
  hw/block: Make PFlashCFI01 QOM declaration internal
  hw/block: Factor pflash_cfi02_create() out of pflash_cfi02_register()
  hw/arm: Open-code pflash_cfi02_register()
  hw/sh4: Open-code pflash_cfi02_register()
  hw/block: Remove unused pflash_cfi02_register()
  hw/block: Make PFlashCFI02 QOM declaration internal

 hw/arm/collie.c                          | 15 ++++---
 hw/arm/digic_boards.c                    | 14 +++---
 hw/arm/gumstix.c                         | 19 +++++---
 hw/arm/mainstone.c                       | 13 +++---
 hw/arm/musicpal.c                        | 13 +++---
 hw/arm/omap_sx1.c                        | 22 +++++----
 hw/arm/sbsa-ref.c                        |  8 ++--
 hw/arm/versatilepb.c                     | 13 +++---
 hw/arm/vexpress.c                        | 12 +++--
 hw/arm/virt.c                            |  6 +--
 hw/arm/xilinx_zynq.c                     | 10 ++---
 hw/arm/z2.c                              | 10 +++--
 hw/block/pflash_cfi01.c                  | 35 ++++++++-------
 hw/block/pflash_cfi02.c                  | 25 +++++------
 hw/i386/pc_sysfw.c                       |  6 +--
 hw/loongarch/virt.c                      |  9 ++--
 hw/microblaze/petalogix_ml605_mmu.c      |  8 ++--
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  8 ++--
 hw/mips/malta.c                          | 13 +++---
 hw/ppc/e500.c                            |  2 +-
 hw/ppc/sam460ex.c                        | 12 +++--
 hw/ppc/virtex_ml507.c                    |  7 +--
 hw/riscv/virt.c                          |  7 +--
 hw/sh4/r2d.c                             |  9 ++--
 hw/xtensa/xtfpga.c                       |  6 +--
 include/hw/arm/virt.h                    |  3 +-
 include/hw/block/flash.h                 | 57 ++++++++++++------------
 include/hw/i386/pc.h                     |  3 +-
 include/hw/loongarch/virt.h              |  3 +-
 include/hw/riscv/virt.h                  |  3 +-
 30 files changed, 200 insertions(+), 171 deletions(-)

-- 
2.38.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDmfh-0005eP-FE
	for mharc-qemu-riscv@gnu.org; Thu, 03 Sep 2020 06:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kDmff-0005ct-1N; Thu, 03 Sep 2020 06:40:47 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kDmfa-00028w-RA; Thu, 03 Sep 2020 06:40:46 -0400
Received: by mail-pj1-x1029.google.com with SMTP id s2so1267907pjr.4;
 Thu, 03 Sep 2020 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=q+lC995TWsBOdTSeX0ILDYm1c6nuuvXYuwarWFueNus=;
 b=BIrNAAfCsN7oAfgF6HOCZ7VdBqktOSLeziIN3havX/zCBO8Hvxxam+5yJAweXoAhN5
 cdZKsw24Eo9rpfbbe6wMIBwRZOVRa/NFkU1Y0claseGuAabjKAVb15lmgpxZUpHz8//R
 QhBPjxyezHPRdtxFKDHBwyBtTmHL/lPkUzkUGlZ5fcr7HJfoqoWxRZSwvsRBLwaw3XYs
 vkTQ6AcEw//U9UYcfw7VG2P6Vo49GZ3T74h6Rlg5aQRm8It9ZJ21THnwL/l6OPrYK+Hn
 I1GKbwdIaod1mIyaHgETYgE35KMSLjBFEvGSLIyW7jOnpUNT2vpJStH/GY8Q3QV3FWwO
 IqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=q+lC995TWsBOdTSeX0ILDYm1c6nuuvXYuwarWFueNus=;
 b=nDsuGvlg2UmvYW3DQk4UHp0liGJdOcHveRM+B6CAtYhQXgcQvACoKWjYC1wG9xJj5T
 YNF7FGemDLpIjl/M3+fPAzkgMOrf0V+h0OKvG1MdGfMZ0R103sw76oww5k37uyrWK6Kn
 48lauL6kZDxpCULNMBM4kdi1a98rlQUPwzxY2Gqo/eKULCjMfemwhQmyNQT5RHyrGLXU
 yaaXqYhdtI4cIFWNc25eCzymaAqQbhgEkRaa+WAZ0UM5r+i1N2B/Gb20D87h0ro39eRs
 ggOEyWwlPMWT2cbyxBCihX36Mn4r0VgS4BJonoSpmy1rFwhyxR/DfaXvP8h+NG1x0TsY
 mTtA==
X-Gm-Message-State: AOAM53068kdr8jMd1czun788d9g3VKGuRfh9zDewgyYJkRDoOA1oSxLd
 m/vhCEkxYesTJ52JYjK8YYM=
X-Google-Smtp-Source: ABdhPJxyzCBI/FpGwtwOx2Wx2kBC2JQmH88AFWNgBfIzitXSHZJGACd6UCbepJnQ1B9a21xCKsIG4A==
X-Received: by 2002:a17:90a:8c84:: with SMTP id
 b4mr2767820pjo.82.1599129639620; 
 Thu, 03 Sep 2020 03:40:39 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id b18sm2137098pjq.3.2020.09.03.03.40.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 03:40:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 00/12] hw/riscv: Clean up the directory
Date: Thu,  3 Sep 2020 18:40:11 +0800
Message-Id: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1029.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 03 Sep 2020 10:40:47 -0000

From: Bin Meng <bin.meng@windriver.com>

This is an effort to clean up the hw/riscv directory. Ideally it
should only contain the RISC-V SoC / machine codes plus generic
codes. Peripheral models for a specific SoC are moved to its
corresponding hw/* subdirectories.

This series should be applied after the PolarFire SoC series:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=198727


Bin Meng (12):
  hw/riscv: Move sifive_e_prci model to hw/misc
  hw/riscv: Move sifive_u_prci model to hw/misc
  hw/riscv: Move sifive_u_otp model to hw/misc
  hw/riscv: Move sifive_gpio model to hw/gpio
  hw/riscv: Move sifive_clint model to hw/intc
  hw/riscv: Move sifive_plic model to hw/intc
  hw/riscv: Move riscv_htif model to hw/char
  hw/riscv: Move sifive_uart model to hw/char
  hw/riscv: Move sifive_test model to hw/misc
  hw/riscv: Always build riscv_hart.c
  hw/riscv: Drop CONFIG_SIFIVE
  hw/riscv: Sort the Kconfig options in alphabetical order

 {include/hw/riscv => hw/intc}/sifive_plic.h |  0
 hw/riscv/trace.h                            |  1 -
 include/hw/{riscv => char}/riscv_htif.h     |  0
 include/hw/{riscv => char}/sifive_uart.h    |  0
 include/hw/{riscv => gpio}/sifive_gpio.h    |  0
 include/hw/{riscv => intc}/sifive_clint.h   |  0
 include/hw/{riscv => misc}/sifive_e_prci.h  |  0
 include/hw/{riscv => misc}/sifive_test.h    |  0
 include/hw/{riscv => misc}/sifive_u_otp.h   |  0
 include/hw/{riscv => misc}/sifive_u_prci.h  |  0
 include/hw/riscv/sifive_e.h                 |  2 +-
 include/hw/riscv/sifive_u.h                 |  6 +--
 hw/{riscv => char}/riscv_htif.c             |  2 +-
 hw/{riscv => char}/sifive_uart.c            |  2 +-
 hw/{riscv => gpio}/sifive_gpio.c            |  2 +-
 hw/{riscv => intc}/sifive_clint.c           |  2 +-
 hw/{riscv => intc}/sifive_plic.c            |  2 +-
 hw/{riscv => misc}/sifive_e_prci.c          |  2 +-
 hw/{riscv => misc}/sifive_test.c            |  2 +-
 hw/{riscv => misc}/sifive_u_otp.c           |  2 +-
 hw/{riscv => misc}/sifive_u_prci.c          |  2 +-
 hw/riscv/microchip_pfsoc.c                  |  4 +-
 hw/riscv/sifive_e.c                         |  8 ++--
 hw/riscv/sifive_u.c                         |  6 +--
 hw/riscv/spike.c                            |  4 +-
 hw/riscv/virt.c                             |  6 +--
 hw/char/Kconfig                             |  6 +++
 hw/char/meson.build                         |  2 +
 hw/gpio/Kconfig                             |  3 ++
 hw/gpio/meson.build                         |  1 +
 hw/gpio/trace-events                        |  6 +++
 hw/intc/Kconfig                             |  6 +++
 hw/intc/meson.build                         |  2 +
 hw/misc/Kconfig                             | 12 +++++
 hw/misc/meson.build                         |  6 +++
 hw/riscv/Kconfig                            | 74 +++++++++++++++--------------
 hw/riscv/meson.build                        | 11 +----
 hw/riscv/trace-events                       |  7 ---
 meson.build                                 |  1 -
 39 files changed, 110 insertions(+), 82 deletions(-)
 rename {include/hw/riscv => hw/intc}/sifive_plic.h (100%)
 delete mode 100644 hw/riscv/trace.h
 rename include/hw/{riscv => char}/riscv_htif.h (100%)
 rename include/hw/{riscv => char}/sifive_uart.h (100%)
 rename include/hw/{riscv => gpio}/sifive_gpio.h (100%)
 rename include/hw/{riscv => intc}/sifive_clint.h (100%)
 rename include/hw/{riscv => misc}/sifive_e_prci.h (100%)
 rename include/hw/{riscv => misc}/sifive_test.h (100%)
 rename include/hw/{riscv => misc}/sifive_u_otp.h (100%)
 rename include/hw/{riscv => misc}/sifive_u_prci.h (100%)
 rename hw/{riscv => char}/riscv_htif.c (99%)
 rename hw/{riscv => char}/sifive_uart.c (99%)
 rename hw/{riscv => gpio}/sifive_gpio.c (99%)
 rename hw/{riscv => intc}/sifive_clint.c (99%)
 rename hw/{riscv => intc}/sifive_plic.c (99%)
 rename hw/{riscv => misc}/sifive_e_prci.c (99%)
 rename hw/{riscv => misc}/sifive_test.c (98%)
 rename hw/{riscv => misc}/sifive_u_otp.c (99%)
 rename hw/{riscv => misc}/sifive_u_prci.c (99%)
 delete mode 100644 hw/riscv/trace-events

-- 
2.7.4



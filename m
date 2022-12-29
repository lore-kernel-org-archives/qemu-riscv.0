Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAxNc-0006m7-Me
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 13:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNb-0006jA-3s
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:11:47 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNZ-0003Vx-8b
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:11:46 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 j16-20020a056830271000b0067202045ee9so11865612otu.7
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 10:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GkPxuGqubo5gkcTC+CaHoKT5dFTep1pb+T85TAi9dGY=;
 b=DPqyRdRSEJZ/5yNNKFkhPzvlK0qZR3/kp72T7q8etRS/R1pURVukT68hh+34C27I/O
 JrXWNv4z15PZKaw5osmTPrBIIHN04H3ZmHGgPFIuqbAxSBkzAvLW6WStkxFkUkyPc/If
 qiv52YVWfMeHele2GAKJwGkvOpCbeDyhdbZaniI+NR7mkbII294XvmHWKso4a0PTJeBL
 2fVuWF90mmB3eBVRqlklD9E075Fy2mGAhARQ/iUVaHY+JG9d1lbsZuiXAU7dPQO5c5/K
 bTA0XcHA8AmQsrg/EMxZGOILFsqJlxfbMlSI+kfjnWHce6gyvSefSy+r4nuIeV3qvz+e
 UHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GkPxuGqubo5gkcTC+CaHoKT5dFTep1pb+T85TAi9dGY=;
 b=AiDBhOXtPwFZ6HyzB/DYU7Lt4SiaZ7rcVRgQkjxqVh3/XyCt1Sx9jCrhn9TKVXW/Tr
 ptSNiEgco6nO1yk3ObPisHGx1RuW/WVXC0t7wRoNbEuQp989d8P5RMxPK+O2L2uXgbDg
 jbzQS9YiVpKckY/IW/rBgxMzqS2Pp+3sOZWvicYhQvuWXoo7dVakRz4nzdfxv4c2JQLf
 WBUxZvBfz60nxvwLjsbAJFif1krwEH7wqpOnETb2cDuPxlO7CQL8UG+FZbshLFuaOHUF
 CiylRVKVwTMCxTrdn04yXgXiOcNbsgyvbVki+WHjwIgB5mg2F+qiYy29kVe2blNbRnBc
 +6Vg==
X-Gm-Message-State: AFqh2ko1OyWuv2g7MyHd9WGRT+WQ/8KhWzUnroNZvnR4j1PNb2qRW79C
 uYHd1mSI1ZpbtcvuRrB7PjU75w==
X-Google-Smtp-Source: AMrXdXs1VLwH/n8kJA64sg2PJHgTlOdiVctQ3pAU+TVup1lKbEGvXnS0boqtskGZNMsU3xVrGvWAqA==
X-Received: by 2002:a9d:4501:0:b0:670:75fc:9a04 with SMTP id
 w1-20020a9d4501000000b0067075fc9a04mr14005094ote.13.1672337502526; 
 Thu, 29 Dec 2022 10:11:42 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:11:42 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 00/11] riscv: OpenSBI boot test and cleanups
Date: Thu, 29 Dec 2022 15:11:24 -0300
Message-Id: <20221229181135.270661-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 29 Dec 2022 18:11:47 -0000

Hi,

This new version is still rebased on top of [1]:

"[PATCH 00/12] hw/riscv: Improve Spike HTIF emulation fidelity"

from Bin Meng.

In this version there's a new patch, patch 4, where we added a
g_assert() guard in both riscv_load_kernel() and riscv_load_initrd(), as
proposed by Alex in the v3 review.

There were also some aesthetic changes were made in patch 1 w.r.t the
order of the tests in the avocado file and fixing 'opensbi' and
'Opensbi' instances to 'OpenSBI'.

* Patch without reviews: 3

Changes from v3:
- patch 1:
  - fixed more instances of 'opensbi' and 'Opensbi' to 'OpenSBI'
  - changed tests order
- patch 4 (new):
  - added a g_assert(filename) guard in riscv_load_initrd() and
    riscv_load_kernel()
v3 link: https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04491.html 

Changes from v2:
- patch 1:
  - reduced code repetition with a boot_opensbi() helper
  - renamed 'opensbi' to 'OpenSBI' in the file header
- patch 9:
  - renamed riscv_load_kernel() to riscv_load_kernel_and_initrd()
v2 link: https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04466.html


Changes from v1:
- patches were rebased with [1]
- patches 13-15: removed
  * will be re-sent in a follow-up series
- patches 4-5: removed since they're picked by Bin in [1]
- patch 1:
  - added a 'skip' riscv32 spike test
v1 link: https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg03860.html


Based-on: <20221227064812.1903326-1-bmeng@tinylab.org>

Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>

[1] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159

Daniel Henrique Barboza (11):
  tests/avocado: add RISC-V OpenSBI boot test
  hw/riscv/spike: use 'fdt' from MachineState
  hw/riscv/sifive_u: use 'fdt' from MachineState
  hw/riscv/boot.c: exit early if filename is NULL in
    load_(kernel|initrd)
  hw/riscv/spike.c: load initrd right after riscv_load_kernel()
  hw/riscv: write initrd 'chosen' FDT inside riscv_load_initrd()
  hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()
  hw/riscv/boot.c: use MachineState in riscv_load_initrd()
  hw/riscv/boot.c: use MachineState in riscv_load_kernel()
  hw/riscv/boot.c: introduce riscv_load_kernel_and_initrd()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c                | 92 ++++++++++++++++++++++------------
 hw/riscv/microchip_pfsoc.c     | 20 +-------
 hw/riscv/opentitan.c           |  3 +-
 hw/riscv/sifive_e.c            |  4 +-
 hw/riscv/sifive_u.c            | 32 +++---------
 hw/riscv/spike.c               | 38 ++++----------
 hw/riscv/virt.c                | 21 +-------
 include/hw/riscv/boot.h        |  8 ++-
 include/hw/riscv/sifive_u.h    |  3 --
 include/hw/riscv/spike.h       |  2 -
 tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++
 11 files changed, 151 insertions(+), 137 deletions(-)
 create mode 100644 tests/avocado/riscv_opensbi.py

-- 
2.38.1



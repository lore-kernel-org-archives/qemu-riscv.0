Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbRZ-0005DK-HN
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRW-0005CK-TF; Wed, 16 Dec 2020 13:22:31 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:41986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRT-0000Jv-Ux; Wed, 16 Dec 2020 13:22:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608143411; x=1639679411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Zzlz0hC90R7f1l2LDWoeQSe4/YlT3ZgArsWJ+gMdXE=;
 b=lmuG26DQ/W+65SFffbKmi7bUE1VQ59h1GVmpP8a4gKHluIPHAzAOcZht
 t0txdszfiLmjRRMlzM/GNQiqdlrzaYfpuwmDnB2dVBpAzkOgSNQWzvj3r
 B7wtN5PG4+Eoyt54NuyGxofm2Hku4lj+j2a101s6NK+KNbtTgkdEKJ7Wf
 4c0B6LAYYoI/X2e0wA9v6jrUmpk6SkFkPPb95pJ22jLQGy1qyJVvUrxRB
 w3xTWdlIMak2eBmDSLJMarexgFKWkvd7uezHzu1a2szjAX/+7wUPHjpSV
 FFBCGWMCN3w7tp0NAXDe3ow1h6B/a9G3xj/wW7RqIPHgezUKi3M+KTnNW Q==;
IronPort-SDR: KbkzcP/mWF6kiz0TdySVbpzqjARRhGMShC/uCseGCjST+cMllNDH7qt1pNdw32lD/zcAKQbVex
 9eRedP/7UnTb/UNoDCrRcoj3tkH931laaMjkr/psC0R5e5WXF+t18QE3i/uS+rathSMVPGp7D2
 kyl1jYlxqRDujp4SnAKbLQN+q4s0RFQAc/CvFJ2CZ/c7eAlrbQoDcIDIwmC360si+WpPQdRfvb
 ET2kMiVbBfpmzkjglLykNem2HTTFIvVwsAKl4LA22xQAczBV3gn+j7mWfkwGX2btJww2ffGCwV
 f0M=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="259080327"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:30:05 +0800
IronPort-SDR: OXkBBrkM+K64T0IL+QIkRM/RcxVoOIIv6smzZlAyrtP4f7cVHy8Y4VBrkXUVsi+zN3tilIHx0v
 wbU2wZd6CL0/wteYoqeYGbKHQilw09Jmw26D22G7wRQqyhlrWKDRvaVO19k+amepbgBQOxpdV4
 Y3jKTDjk6KOou634I0pCtLrFkx7E0Rbq1X6/vZQebZiMkSKPOLukFn3583vDyaJPgoWIYx9UNk
 I61Qnc1AUr3/f0G8dYg4sdmc/3f8y/Mk3yLRX7bgZ5ptEOtB5HOv5vT0pnrAGRAT3H8NFYJrTb
 BlrdKgYKso4XaWZJXT0QUW+w
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:05:59 -0800
IronPort-SDR: Ns5h6xa216anIqSotJTRdqjfPykY4XmB5PLNc6ZYxsy/ahQXSBx88scUzNejD1dpOWtQgLF6RQ
 pFzpvFirZZBzBb1SelNIAH8ssDhLpsdwzlkfKCLG2gE9T3keynm/2PQH8zcLT4i7CQobnkMpVU
 t2cXjPyfgIw+J6bxQofs06lLE7LIwjTgAjsRpOmiE21Zw4makcXG5NfH1pGyVgyvuXIrnOUCGW
 QqfC7RZLWuVi+UdhR7WtIE3KXRwisfqhkwYyvs2s2eVSmjogMYLZqsSgSs/hSrLIgLH/kxuHza
 Ml0=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Dec 2020 10:22:24 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 00/16]  RISC-V: Start to remove xlen preprocess
Date: Wed, 16 Dec 2020 10:22:23 -0800
Message-Id: <cover.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 16 Dec 2020 18:22:31 -0000

The RISC-V QEMU port currently has lot of preprocessor directives that
check if we are targetting a 32-bit or 64-bit CPU. This means that the
64-bit RISC-V target can not run 32-bit CPUs. This is different to most
other QEMU architectures and doesn't allow us to mix xlens (such as when
running Hypervisors with different xlen guests).

This series is a step toward removing some of those to allow us to use
32-bit CPUs on 64-bit RISC-V targets.

v4:
 - Add a commit that converts the machine 32-bit check to use the CPU
v3:
 - Address Richard's comments
v2:
 - Rebase on the latest RISC-V tree

Alistair Francis (16):
  hw/riscv: Expand the is 32-bit check to support more CPUs
  target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
  riscv: spike: Remove target macro conditionals
  riscv: virt: Remove target macro conditionals
  hw/riscv: boot: Remove compile time XLEN checks
  hw/riscv: virt: Remove compile time XLEN checks
  hw/riscv: spike: Remove compile time XLEN checks
  hw/riscv: sifive_u: Remove compile time XLEN checks
  target/riscv: fpu_helper: Match function defs in HELPER macros
  target/riscv: Add a riscv_cpu_is_32bit() helper function
  target/riscv: Specify the XLEN for CPUs
  target/riscv: cpu: Remove compile time XLEN checks
  target/riscv: cpu_helper: Remove compile time XLEN checks
  target/riscv: csr: Remove compile time XLEN checks
  target/riscv: cpu: Set XLEN independently from target
  hw/riscv: Use the CPU to determine if 32-bit

 include/hw/riscv/boot.h   |  14 +--
 include/hw/riscv/spike.h  |   6 --
 include/hw/riscv/virt.h   |   6 --
 target/riscv/cpu.h        |   8 ++
 target/riscv/cpu_bits.h   |   4 +-
 target/riscv/helper.h     |  24 ++----
 hw/riscv/boot.c           |  70 ++++++++-------
 hw/riscv/sifive_u.c       |  59 +++++++------
 hw/riscv/spike.c          |  52 +++++------
 hw/riscv/virt.c           |  39 +++++----
 target/riscv/cpu.c        |  84 ++++++++++++------
 target/riscv/cpu_helper.c |  12 +--
 target/riscv/csr.c        | 176 ++++++++++++++++++++------------------
 target/riscv/fpu_helper.c |   8 --
 14 files changed, 299 insertions(+), 263 deletions(-)

-- 
2.29.2



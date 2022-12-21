Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p83kM-0007w7-GG
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 13:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kK-0007vV-Td
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:16 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kJ-0007og-63
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:16 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12c8312131fso20140717fac.4
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 10:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B8GL6PaPEzej1k2Pbr9jDouPSrZkVH2z8DtwdB2tclo=;
 b=mbeNQrsiRO5UHe7VQq6QpOi2x5ZVoPneZhlzIcKOyhRXjQXloJNDmO53ZCS1yVAAbm
 Mz0K5F+D7btUJZD45Bj6FRB7SR/5Izy0AO/4CZo0wk8oEeSwdSDqEjkiCYUVbeFhXrEs
 QNyqDqoI8AeAl5oQDepKhXdKQGM7K6OIX5gLMSaEHSFApFSvsjnbKAHSTHZ/a+sXh8LL
 whLbo/gIjVeHQbllgidwLCKLdM9qgha0g4UENi3W2dzxKcrHXVG/TrU31YM5Y2BpSEm+
 hUdkVanF01QGK++tBnxXEFtqGtC+2iRWGJy2tUgUf2o2tX+XMsVw/wJ2t/Mq5s7BCEuR
 Wp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B8GL6PaPEzej1k2Pbr9jDouPSrZkVH2z8DtwdB2tclo=;
 b=u/y87wvCv/uQZ8XTuYPbwR0h1GV5iScbMbHRxSdLCrO3jgaqFc9Z/I/e+woBIftzEU
 X7Ldm8H0PTsaipsNd17wW2K442O6GB+eT8Bg4Go6/Wy/DBUZz7acQqXEXmnCGlqf1gxQ
 E0uvZ48rcroV6+mjHMfh99e63qjXRkdMVhVmi4n3zue246/TPtq1cNct3ZDthTXaWZxK
 HKRT/8zJbWKH8mVNn7jHIBXsvD4wk078Wd2cNjWvifBRtAH7Zj62a9VcEs3OfGutjEzW
 HSXVvu1axpVeR8NK9sJUpgfTjct4IjXd4o7qFOpNotKnkrtB5aNuZvuPUrr6uH6qGlJx
 bN+A==
X-Gm-Message-State: AFqh2koq2F10wWZ/MxNOmft72bL5ZNnmzpiy8POZ2WrTxWGju1OnU69f
 ws1oRtLk5hpapsFkh1Nd4fTELw==
X-Google-Smtp-Source: AMrXdXvdztQjNI23lfUSKaPsch+Ojz53wyAeEMBjyjkjVed4+N/UiymJQC1fc+4YPt4h3oTvcKpgwA==
X-Received: by 2002:a05:6871:4316:b0:144:4bf1:a6f3 with SMTP id
 lu22-20020a056871431600b001444bf1a6f3mr1073082oab.8.1671646993441; 
 Wed, 21 Dec 2022 10:23:13 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:13 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 00/15] riscv: opensbi boot test and cleanups
Date: Wed, 21 Dec 2022 15:22:45 -0300
Message-Id: <20221221182300.307900-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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
X-List-Received-Date: Wed, 21 Dec 2022 18:23:17 -0000

Hi,

This series starts by adding a simple Avocado smoke test for RISC-V
machines that uses opensbi. The newly added test is then used to
validate the cleanups made along the way. With this test, running
'make check-avocado' after building all RISC-V targets will run the
test as follows:

 (06/17) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv64_virt: PASS (0.05 s)
 (07/17) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv64_spike: PASS (0.04 s)
 (08/17) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv64_sifive_u: PASS (0.06 s)
 (09/17) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv32_virt: PASS (0.05 s)
 (10/17) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv32_sifive_u: PASS (0.06 s)

Note that there are other tests that aren't being run with RISC-V yet.
We'll enable them as needed later on.

After adding this test, our goal is then to reduce boot code repetition
between RISC-V boards and consolidate all boot activities related with
the -kernel option in a single function, riscv_load_kernel().

Aside from allowing all boards to load initrd if -initrd is used (see
patch 11), no other functional changes were intended.

Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>

Daniel Henrique Barboza (15):
  tests/avocado: add RISC-V opensbi boot test
  hw/riscv/spike: use 'fdt' from MachineState
  hw/riscv/sifive_u: use 'fdt' from MachineState
  hw/riscv/boot.c: make riscv_find_firmware() static
  hw/riscv/boot.c: introduce riscv_default_firmware_name()
  hw/riscv/spike.c: load initrd right after riscv_load_kernel()
  hw/riscv: write initrd 'chosen' FDT inside riscv_load_initrd()
  hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()
  hw/riscv/boot.c: use MachineState in riscv_load_initrd()
  hw/riscv/boot.c: use MachineState in riscv_load_kernel()
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static
  hw/riscv/spike.c: simplify create_fdt()
  hw/riscv/virt.c: simplify create_fdt()
  hw/riscv/sifive_u: simplify create_fdt()

 hw/riscv/boot.c                | 137 ++++++++++++++++++++-------------
 hw/riscv/microchip_pfsoc.c     |  19 +----
 hw/riscv/opentitan.c           |   3 +-
 hw/riscv/sifive_e.c            |   3 +-
 hw/riscv/sifive_u.c            |  51 ++++--------
 hw/riscv/spike.c               |  53 ++++---------
 hw/riscv/virt.c                |  38 ++-------
 include/hw/riscv/boot.h        |   6 +-
 include/hw/riscv/sifive_u.h    |   3 -
 include/hw/riscv/spike.h       |   2 -
 tests/avocado/riscv_opensbi.py |  65 ++++++++++++++++
 11 files changed, 189 insertions(+), 191 deletions(-)
 create mode 100644 tests/avocado/riscv_opensbi.py

-- 
2.38.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouXq-0000ou-NR
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXo-0000kS-Mt; Mon, 14 Dec 2020 15:34:08 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:42382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXg-0007rg-6E; Mon, 14 Dec 2020 15:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978040; x=1639514040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mV3T9pqro5BlXPE6oCDooBs+n8ik+tEjjcPG+wvziMI=;
 b=DFOAGK//+V262R3rteIbpoJjxYqyQztZhz9/+ZndErUALmZ8djGj91H7
 WTqMYcRCtfNthGAGOcptyDi8owcg1R7kKTGHNjQsnlYPSbAs/LiCLZfA2
 pTsSnTP6jPhCFdQLgUrnSdQbApaxcHKvp0ZZH0etlMK94lFeKDm0M+qOn
 IKERLLCxR08scji5uHquiKa+z8ecuyida1LXZS6VMblNeKxfcV75gNAc8
 uNlii2tDtctDvvz3lQbbocvwoRM3LvFy8s+4KlPLxXCoKkFJPKsPLes5Q
 2TlQEb/vuKzfQ9xA474xmYorsUq0S1XgrIpFmmOFONrERXjx+ZBC/OI5R Q==;
IronPort-SDR: kZQVi+DBCJFcXt18pWP45+SPhjz/X/a7WmZcvYFt3CjmglqfZPDJgggfswlbUNMh5+7Q8JJDdx
 8Jph3aeySiFAxbhATBCIJVOqz8qGnkvgfKeyFoKvQLepiXbsZk9C+PXNC+mQKdGzY1tBoArvZD
 qF582Sz780XPkjwPKLzS/adSum1Q9GkZKYj3KOMUT6Du1IfgZEPXdYt92SuVzy16oxJypp0IJO
 3Hq5y/tXxILW7HFBuT2/+9kUHkzffCktgvPvwv6U8mN8bGsV4OZWjDrYtiYL3ws68rtM/inhY0
 9ho=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="156338100"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:33:57 +0800
IronPort-SDR: ApbWwqcZ2pIsfbA3dly8geQwUrvznmu9O2rcO4YGW9TbSD7B8OYxfyTcay6Khybxcurg7flvPS
 6KoG1hSrwx+fKhtUaPZGW8gdU3h6IIDutbEl86XihZGo3S8QhuAYF6B3LmKIMISWbrOb7v/za/
 l0R/0ZsaERC4l0OeGOWIwHuTer2msNsjnA02oquyvUkqbzGhGr0VbRn4RYctSKqNbHPzTgQLEV
 jSxnCjalv2f8lLlL5RkOq0s++eMildgDRZVAy17v79fPv7KqKJ5PxHFDbfXpJhO0MSKkHs86Mf
 RKppBbIG/MKIiHUZhlu31/SX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:17:40 -0800
IronPort-SDR: TonXMkvEKwrmXh9wWmoRUfihFLFkIYxsFhsZPH4p3iYCknq6NgElY6Sqb828kg598DyGUZEDVs
 U6bToDgj2idXfUW2z8ShgvHkSc/A5V6hgy8SgSOgCPl/C6WdSPAH8cGPVuFwEStnHBzOmZVvR0
 EKqxDKReEuvHjC3pUY+JJ5qZhZf72AjP0BVbIWjSpaTMJwmayEL7MecbSlmYm4s2Q9QKmtT9tm
 BrsxSkB5kAyFSHCpHXwhTxwtB6oVCN34xC/AP55XhkmwP6pANI+3NJ/UEXVJKIherOV7nouvOf
 Tq4=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Dec 2020 12:33:56 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 00/15]  RISC-V: Start to remove xlen preprocess
Date: Mon, 14 Dec 2020 12:33:56 -0800
Message-Id: <cover.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:09 -0000

The RISC-V QEMU port currently has lot of preprocessor directives that
check if we are targetting a 32-bit or 64-bit CPU. This means that the
64-bit RISC-V target can not run 32-bit CPUs. This is different to most
other QEMU architectures and doesn't allow us to mix xlens (such as when
running Hypervisors with different xlen guests).

This series is a step toward removing some of those to allow us to use
32-bit CPUs on 64-bit RISC-V targets.

v3:
 - Address Richard's comments
v2:
 - Rebase on the latest RISC-V tree

Alistair Francis (15):
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

 include/hw/riscv/boot.h   |   8 +-
 include/hw/riscv/spike.h  |   6 --
 include/hw/riscv/virt.h   |   6 --
 target/riscv/cpu.h        |   8 ++
 target/riscv/cpu_bits.h   |   4 +-
 hw/riscv/boot.c           |  67 +++++++++------
 hw/riscv/sifive_u.c       |  57 ++++++------
 hw/riscv/spike.c          |  50 ++++++-----
 hw/riscv/virt.c           |  36 ++++----
 target/riscv/cpu.c        |  84 ++++++++++++------
 target/riscv/cpu_helper.c |  12 +--
 target/riscv/csr.c        | 176 ++++++++++++++++++++------------------
 target/riscv/fpu_helper.c |  16 ++--
 13 files changed, 295 insertions(+), 235 deletions(-)

-- 
2.29.2



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXst-000778-6i
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsZ-0006l8-M2; Wed, 30 Mar 2022 08:56:52 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsX-0004Y8-GF; Wed, 30 Mar 2022 08:56:51 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 09B3621C38;
 Wed, 30 Mar 2022 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CTHLxshGLn+LMFCmOT0tST5SI/piv8b6mpuMZAFlww0=;
 b=bMijghb3ZxySJFZ5hguLZ1NJj61rRhufZGQ0OOc662vJmtougXTMoULm4QbNncYwsTKjWj
 5TohKjSz6kck9gbHVue+ljKHpJBNGPk4pA2rrNs7mAqxIqU0M661O+3kDeFI6Pwu8EVmBU
 gNy56SQsG4mfwNpvyur3TEXUrkZclRQ=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC PATCH 00/18] user-creatable cpu clusters
Date: Wed, 30 Mar 2022 14:56:21 +0200
Message-Id: <20220330125639.201937-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 30 Mar 2022 12:56:53 -0000

Hi,

This series add devices to be able to user-create (coldplug) cpu
clusters. The existing cpu cluster dictates how cpus are exposed
in gdb, but it does not handle the cpu objects creation. This series
adds a new device to handle both issues and adds support for two
architectures: arm and riscv.

Please look at patches 2 and 3 for more details about the new device.

Last part concerning the riscv is rfc as I do non-backward compatible
updates. I'm not sure what migration (or other) constraints we have
on these machines and I probably need to make some changes to cope
with them.

This series almost deprecates the cpu-cluster type as all uses
but one are replaced.

It is organized as follows:

+ Patches 1 to 7 adds a new base device to replace cpu-cluster

+ Patches 8 and 9 adds an arm specific version and replace existing
  clusters in the xlnx-zynqmp machine.

+ patches 10 to 17 updates the riscv_array. It was already used to
  create cpus but was not a cpu cluster.

Thanks for any comments,
--
Damien

Damien Hedde (18):
  define MAX_CLUSTERS in cpu.h instead of cluster.h
  hw/cpu/cpus: introduce _cpus_ device
  hw/cpu/cpus: prepare to handle cpu clusters
  hw/cpu/cluster: make _cpu-cluster_ a subclass of _cpus_
  gdbstub: deal with _cpus_ object instead of _cpu-cluster_
  hw/cpu/cluster: remove cluster_id now that gdbstub is updated
  hw/cpu/cpus: add a common start-powered-off property
  hw/arm/arm_cpus: add arm_cpus device
  hw/arm/xlnx-zynqmp: convert cpu clusters to arm_cpus
  hw/riscv/riscv_hart: prepare transition to cpus
  hw/riscv: prepare riscv_hart transition to cpus
  hw/riscv/virt: prepare riscv_hart transition to cpus
  hw/riscv/spike: prepare riscv_hart transition to cpus
  hw/riscv/riscv_hart: use cpus as base class
  hw/riscv/sifive_u&microchip_pfsoc: apply riscv_hart_array update
  hw/riscv: update remaining machines due to riscv_hart_array update
  hw/riscv/riscv_hart: remove temporary features
  add myself as reviewer of the newly added _cpus_

 include/hw/arm/arm_cpus.h          |  45 +++++++
 include/hw/arm/xlnx-zynqmp.h       |   8 +-
 include/hw/core/cpu.h              |   6 +
 include/hw/cpu/cluster.h           |  26 ++--
 include/hw/cpu/cpus.h              |  93 ++++++++++++++
 include/hw/riscv/microchip_pfsoc.h |   2 -
 include/hw/riscv/riscv_hart.h      |  25 +++-
 include/hw/riscv/sifive_u.h        |   2 -
 gdbstub.c                          |  12 +-
 hw/arm/arm_cpus.c                  |  63 ++++++++++
 hw/arm/xlnx-zynqmp.c               | 121 +++++++-----------
 hw/cpu/cluster.c                   |  53 ++++----
 hw/cpu/cpus.c                      | 195 +++++++++++++++++++++++++++++
 hw/riscv/boot.c                    |   2 +-
 hw/riscv/microchip_pfsoc.c         |  28 +----
 hw/riscv/opentitan.c               |   4 +-
 hw/riscv/riscv_hart.c              |  44 ++-----
 hw/riscv/shakti_c.c                |   4 +-
 hw/riscv/sifive_e.c                |   4 +-
 hw/riscv/sifive_u.c                |  31 ++---
 hw/riscv/spike.c                   |  18 +--
 hw/riscv/virt.c                    |  79 +++++++-----
 MAINTAINERS                        |   3 +
 hw/arm/meson.build                 |   1 +
 hw/cpu/meson.build                 |   2 +-
 25 files changed, 612 insertions(+), 259 deletions(-)
 create mode 100644 include/hw/arm/arm_cpus.h
 create mode 100644 include/hw/cpu/cpus.h
 create mode 100644 hw/arm/arm_cpus.c
 create mode 100644 hw/cpu/cpus.c

-- 
2.35.1



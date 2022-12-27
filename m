Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pA3lX-0006GM-6U
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 01:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pA3lV-0006Er-6O; Tue, 27 Dec 2022 01:48:45 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pA3lR-0006gB-A3; Tue, 27 Dec 2022 01:48:44 -0500
X-QQ-mid: bizesmtp64t1672123694tsrio6za
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 27 Dec 2022 14:48:12 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: l8776ORugP0c8y/3w1DvLoKjlvpW1zxch/jk4+szLPYurflyHggbdntaZ9RVX
 mzETxUrbmMTh+sO/+1xgpKn9Wea5KSf6396f3e9z74bx2Sbo67Ab9QiX/CNeRj0GS5Dd9M2
 MIsVkPQjrXN7yJo4Ud4ODbl5a05AP+rOd6dB/ZHC+YHX2+64C1LM4Vc695G+k5yGmv8Suh5
 GPwIEbfXEjnKkb21mvMOgnl3i4XJjRD8kxbmwz0qFyoHJsjlJhIkZ8yv6y+JVPR9ZmgTjEa
 TrOYMSh0jTG5C8zXHI4GKIkKE2lZWp0UTRcvfNaWHpQkDfzKM7h11ziGJo28yADvIRLXP+X
 5gndEU+nkeX7Jl6DiM=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 00/12] hw/riscv: Improve Spike HTIF emulation fidelity
Date: Tue, 27 Dec 2022 14:48:00 +0800
Message-Id: <20221227064812.1903326-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 27 Dec 2022 06:48:45 -0000

At present the 32-bit OpenSBI generic firmware image does not boot on
Spike, only 64-bit image can. This is due to the HTIF emulation does
not implement the proxy syscall interface which is required for the
32-bit HTIF console output.

An OpenSBI bug fix [1] is also needed when booting the plain binary image.

With this series plus the above OpenSBI fix, both 32-bit OpenSBI BIN & ELF
images can boot on QEMU 'spike' machine.

[1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/


Bin Meng (10):
  hw/char: riscv_htif: Avoid using magic numbers
  hw/char: riscv_htif: Drop {to,from}host_size in HTIFState
  hw/char: riscv_htif: Drop useless assignment of memory region
  hw/char: riscv_htif: Use conventional 's' for HTIFState
  hw/char: riscv_htif: Move registers from CPUArchState to HTIFState
  hw/char: riscv_htif: Remove forward declarations for non-existent
    variables
  hw/char: riscv_htif: Support console output via proxy syscall
  hw/riscv: spike: Remove the out-of-date comments
  hw/riscv/boot.c: Introduce riscv_find_firmware()
  hw/riscv: spike: Decouple create_fdt() dependency to ELF loading

Daniel Henrique Barboza (2):
  hw/riscv/boot.c: make riscv_find_firmware() static
  hw/riscv/boot.c: introduce riscv_default_firmware_name()

 include/hw/char/riscv_htif.h |  19 +---
 include/hw/riscv/boot.h      |   4 +-
 target/riscv/cpu.h           |   4 -
 hw/char/riscv_htif.c         | 172 +++++++++++++++++++++--------------
 hw/riscv/boot.c              |  76 ++++++++++------
 hw/riscv/sifive_u.c          |  11 +--
 hw/riscv/spike.c             |  59 ++++++++----
 hw/riscv/virt.c              |  10 +-
 target/riscv/machine.c       |   6 +-
 9 files changed, 212 insertions(+), 149 deletions(-)

-- 
2.34.1



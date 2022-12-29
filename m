Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAp4P-0008Gm-21
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 04:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAp41-0008BS-Mi; Thu, 29 Dec 2022 04:19:02 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAp3y-0006vw-QW; Thu, 29 Dec 2022 04:19:01 -0500
X-QQ-mid: bizesmtp73t1672305510tyg69441
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 29 Dec 2022 17:18:28 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: PsQCk6chbj4XbdEaS9QsOkESbQPB814qm/cJ1b7qWZuvunjbw3FC9nN4E28CA
 /IKZg0HlWcsfiDu0Ssm5Sdz9ZQY2NwDj4kSvLbSzZtoYLPUWoxoVVWCgOmJgS6K2H1mWYLr
 1YJC/HQbpgHjiq9AO/R+xx85GpVQ7Yurj5QICjAjPirLBLw3YpQr5dbd/6v2U9cDJ4f+0g1
 tMINHlkS3ipldBdmNt1YQVaA9ZwRF9rPn3nux262c0RbPXsd9tCLL/IpMwz5g+AbP9TH4rS
 ZOdW5ZTOoKj/t3u278worAOM0d3EC2LDyZMMITWT2P78Q94FTNONOjV7sPdK7AvLZSTvh66
 hv14EzjLPYo35gUusA=
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
Subject: [PATCH v2 00/12] hw/riscv: Improve Spike HTIF emulation fidelity
Date: Thu, 29 Dec 2022 17:18:16 +0800
Message-Id: <20221229091828.1945072-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
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
X-List-Received-Date: Thu, 29 Dec 2022 09:19:03 -0000

At present the 32-bit OpenSBI generic firmware image does not boot on
Spike, only 64-bit image can. This is due to the HTIF emulation does
not implement the proxy syscall interface which is required for the
32-bit HTIF console output.

An OpenSBI bug fix [1] is also needed when booting the plain binary image.

With this series plus the above OpenSBI fix, both 32-bit OpenSBI BIN & ELF
images can boot on QEMU 'spike' machine.

[1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/

Changes in v2:
- fix 2 typos in the commit message
- initialize firmware_end_addr to memmap[SPIKE_DRAM].base
- rework the htif_custom_base detection logic

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
 hw/riscv/spike.c             |  64 +++++++++----
 hw/riscv/virt.c              |  10 +-
 target/riscv/machine.c       |   6 +-
 9 files changed, 217 insertions(+), 149 deletions(-)

-- 
2.34.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUltl-0002Xj-Lr
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 03:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUltg-0002KJ-NK; Fri, 09 Apr 2021 03:49:44 -0400
Received: from mail142-31.mail.alibaba.com ([198.11.142.31]:9580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlta-0003hI-Rk; Fri, 09 Apr 2021 03:49:44 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1747246|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.025318-0.000175567-0.974506;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JxL3BOG_1617954563; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JxL3BOG_1617954563) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 09 Apr 2021 15:49:23 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 00/11] RISC-V: support clic v0.9 specification
Date: Fri,  9 Apr 2021 15:48:46 +0800
Message-Id: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.31; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-31.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Apr 2021 07:49:45 -0000

This patch set gives an implementation of "RISC-V Core-Local Interrupt
Controller(CLIC) Version 0.9-draft-20210217". It comes from [1], where
you can find the pdf format or the source code.

I take over the job from Michael Clark, who gave the first implementation
of clic-v0.7 specification. If there is any copyright question, please
let me know.

Features:
1. support four kinds of trigger types.
2. Preserve the CSR WARL/WPRI semantics. 
3. Option to select different modes, such as M/S/U or M/U.
4. At most 4096 interrupts.
5. At most 1024 apertures.

Todo:
1. Encode the interrupt trigger information to exccode.
2. Support complete CSR mclicbase when its number is fixed. 
3. Gave each aperture an independend address.

It have passed my qtest case and freertos test. Welcome to have a try
for your hardware.

Any advice is welcomed. Thanks very much.

Zhiwei

[1] specification website: https://github.com/riscv/riscv-fast-interrupt.
[2] Michael Clark origin work: https://github.com/sifive/riscv-qemu/tree/sifive-clic.


LIU Zhiwei (11):
  target/riscv: Add CLIC CSR mintstatus
  target/riscv: Update CSR xintthresh in CLIC mode
  hw/intc: Add CLIC device
  target/riscv: Update CSR xie in CLIC mode
  target/riscv: Update CSR xip in CLIC mode
  target/riscv: Update CSR xtvec in CLIC mode
  target/riscv: Update CSR xtvt in CLIC mode
  target/riscv: Update CSR xnxti in CLIC mode
  target/riscv: Update CSR mclicbase in CLIC mode
  target/riscv: Update interrupt handling in CLIC mode
  target/riscv: Update interrupt return in CLIC mode

 default-configs/devices/riscv32-softmmu.mak |   1 +
 default-configs/devices/riscv64-softmmu.mak |   1 +
 hw/intc/Kconfig                             |   3 +
 hw/intc/meson.build                         |   1 +
 hw/intc/riscv_clic.c                        | 836 ++++++++++++++++++++
 include/hw/intc/riscv_clic.h                | 103 +++
 target/riscv/cpu.h                          |   9 +
 target/riscv/cpu_bits.h                     |  32 +
 target/riscv/cpu_helper.c                   | 117 ++-
 target/riscv/csr.c                          | 247 +++++-
 target/riscv/op_helper.c                    |  25 +
 11 files changed, 1363 insertions(+), 12 deletions(-)
 create mode 100644 hw/intc/riscv_clic.c
 create mode 100644 include/hw/intc/riscv_clic.h

-- 
2.25.1



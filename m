Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lf0Sy-0007yU-1o
	for mharc-qemu-riscv@gnu.org; Fri, 07 May 2021 09:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgW-0004Zo-3T; Fri, 07 May 2021 04:18:08 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:50024 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgS-0005jk-C9; Fri, 07 May 2021 04:18:07 -0400
Received: from localhost.localdomain (unknown [121.232.13.213])
 by APP-05 (Coremail) with SMTP id zQCowAB3fSnh9pRgTQ5HAQ--.1834S2;
 Fri, 07 May 2021 16:14:26 +0800 (CST)
From: wangjunqiang <wangjunqiang@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 alapha23@gmail.com, liweiwei@iscas.ac.cn,
 wangjunqiang <wangjunqiang@iscas.ac.cn>
Subject: [RFC PATCH 0/5] RISC-V:support Nuclei FPGA Evaluation Kit
Date: Fri,  7 May 2021 16:16:49 +0800
Message-Id: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAB3fSnh9pRgTQ5HAQ--.1834S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1kZr47Zw13Gw15ZF4DCFg_yoW5Jw1kpa
 n5G3WY9r1rtry7Grsava48W3yrJan5Wr1Ykw17J34jqrW3KayUKrZFk3W5JFWxJ3WUtrnF
 gr9YkF1rGr1UXa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl
 42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF
 1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY
 6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
 73UjIFyTuYvjfUOnmRUUUUU
X-Originating-IP: [121.232.13.213]
X-CM-SenderInfo: pzdqwy5xqtxt1qj6x2xfdvhtffof0/1tbiCwoOAFz4kC9qyQAAs3
Received-SPF: none client-ip=159.226.251.25;
 envelope-from=wangjunqiang@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 May 2021 09:24:22 -0400
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
X-List-Received-Date: Fri, 07 May 2021 08:18:08 -0000

This patch series provides an implementation of Nuclei FPGA Machine[1].
At present, only MCU mode support is included. In mcu mode, We will
use eclic[2] as interrupt controller. It is compatible with clic
in Machine mode. But It contains some customized csr[3] that will
take up part of the csr code. If there is any question, please
let me know.

Features:
1.Add Nuclei CSR support in eclic mode
2.Add ECLIC Device
3.Add Systimer Device
4.Add Uart Device
5.Add Nuclei FPGA Machine

It have passed Nuclei SDK[4](not include dsp) and RTThread[5] HBird BSP
Test.

Any comments are welcome.Thanks

wangjunqiang

[1] https://doc.nucleisys.com/nuclei_sdk/design/board/nuclei_fpga_eval.html
[2] https://doc.nucleisys.com/nuclei_spec/isa/eclic.html
[3] https://doc.nucleisys.com/nuclei_spec/isa/core_csr.html
[4] https://github.com/Nuclei-Software/nuclei-sdk.git
[5] https://github.com/RT-Thread/rt-thread

wangjunqiang (5):
  target/riscv: Add Nuclei CSR and Update interrupt handling
  hw/intc: Add Nuclei ECLIC device
  hw/intc: Add Nuclei Systimer
  hw/char: Add Nuclei Uart
  Nuclei FPGA Evaluation Kit MCU Machine

 default-configs/devices/riscv32-softmmu.mak |   1 +
 default-configs/devices/riscv64-softmmu.mak |   1 +
 hw/char/Kconfig                             |   3 +
 hw/char/meson.build                         |   1 +
 hw/char/nuclei_uart.c                       | 208 ++++++++++
 hw/intc/Kconfig                             |   6 +
 hw/intc/meson.build                         |   2 +
 hw/intc/nuclei_eclic.c                      | 437 ++++++++++++++++++++
 hw/intc/nuclei_systimer.c                   | 254 ++++++++++++
 hw/riscv/Kconfig                            |   9 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/nuclei_n.c                         | 276 +++++++++++++
 include/hw/char/nuclei_uart.h               |  73 ++++
 include/hw/intc/nuclei_eclic.h              | 115 ++++++
 include/hw/intc/nuclei_systimer.h           |  70 ++++
 include/hw/riscv/nuclei_n.h                 | 136 ++++++
 target/riscv/cpu.c                          |  25 +-
 target/riscv/cpu.h                          |  42 +-
 target/riscv/cpu_bits.h                     |  37 ++
 target/riscv/cpu_helper.c                   |  80 +++-
 target/riscv/csr.c                          | 347 +++++++++++++++-
 target/riscv/insn_trans/trans_rvi.c.inc     |  16 +-
 target/riscv/op_helper.c                    |  14 +
 23 files changed, 2145 insertions(+), 9 deletions(-)
 create mode 100644 hw/char/nuclei_uart.c
 create mode 100644 hw/intc/nuclei_eclic.c
 create mode 100644 hw/intc/nuclei_systimer.c
 create mode 100644 hw/riscv/nuclei_n.c
 create mode 100644 include/hw/char/nuclei_uart.h
 create mode 100644 include/hw/intc/nuclei_eclic.h
 create mode 100644 include/hw/intc/nuclei_systimer.h
 create mode 100644 include/hw/riscv/nuclei_n.h

-- 
2.17.1



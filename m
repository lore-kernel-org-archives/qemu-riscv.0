Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8Bau-0006oX-Be
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 20:41:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8Ban-0006l9-CX; Thu, 13 Jan 2022 20:41:25 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:36962 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8Bak-00076d-MI; Thu, 13 Jan 2022 20:41:25 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADX3y+41OBheoyDBQ--.37348S2;
 Fri, 14 Jan 2022 09:41:13 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: anup@brainfault.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 0/3] support subsets of virtual memory extension
Date: Fri, 14 Jan 2022 09:40:55 +0800
Message-Id: <20220114014059.23300-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowADX3y+41OBheoyDBQ--.37348S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr13XF43tF4DurW5uFW3KFg_yoWkZrb_Cr
 1vgF97C34q9a15KFZ8Ar1DWry3Kr4fGFyUtay7tw4YkFy3WryUJws2qa4kWr15Zrs5X3Za
 krn3JFyfKr1UWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbzkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 14 Jan 2022 01:41:25 -0000

This patchset implements virtual memory related RISC-V extensions: Svnapot version 1.0, Svinval vesion 1.0, Svpbmt version 1.0. 

Specification:
https://github.com/riscv/virtual-memory/tree/main/specs

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-virtmem-upstream-v3

To test this implementation, specify cpu argument with 'svinval=true,svnapot=true,svpbmt=true'.

This implementation can pass the riscv-tests for rv64ssvnapot.

v3:
* drop "x-" in exposed properties

v2:
* add extension check for svnapot and svpbmt

Weiwei Li (3):
  target/riscv: add support for svnapot extension
  target/riscv: add support for svinval extension
  target/riscv: add support for svpbmt extension

 target/riscv/cpu.c                          |  4 ++
 target/riscv/cpu.h                          |  3 +
 target/riscv/cpu_bits.h                     |  4 ++
 target/riscv/cpu_helper.c                   | 27 ++++++--
 target/riscv/insn32.decode                  |  7 ++
 target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 7 files changed, 117 insertions(+), 4 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc

-- 
2.17.1



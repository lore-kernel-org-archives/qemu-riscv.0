Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbXlr-00087h-Hq
	for mharc-qemu-riscv@gnu.org; Sun, 12 Mar 2023 22:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuhang@eswincomputing.com>)
 id 1pbXlq-00087L-0T; Sun, 12 Mar 2023 22:18:42 -0400
Received: from azure-sdnproxy.icoremail.net ([52.175.55.52])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xuhang@eswincomputing.com>)
 id 1pbXln-0003WQ-3m; Sun, 12 Mar 2023 22:18:41 -0400
Received: from localhost.localdomain (unknown [10.12.130.32])
 by app1 (Coremail) with SMTP id EwgMCgD3YZX3hw5kDZYFAA--.16518S4;
 Mon, 13 Mar 2023 10:18:31 +0800 (CST)
From: Hang Xu <xuhang@eswincomputing.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, palmer@rivosinc.com, dbarboza@ventanamicro.com,
 alistair.francis@wdc.com, Hang Xu <xuhang@eswincomputing.com>
Subject: [PATCH v3 0/1] Fix max initrd size limit when put initrd to RAM
Date: Mon, 13 Mar 2023 02:18:25 +0000
Message-Id: <20230313021826.6898-1-xuhang@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EwgMCgD3YZX3hw5kDZYFAA--.16518S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtF18WF1DKw1rWw1UuryxuFg_yoWxCwbE93
 WxC343K3y7Wa47CFy8Cr45Jry2kay0vr98Jr12qr1DWrWY9r1DCF17Kws8WF1j9w4Yyr97
 Zws7JryfA34agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb28FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE-syl42xK
 82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
 C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
 IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
 87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUUUU=
X-CM-SenderInfo: p0xkt03j6h245lqf0zpsxwx03jof0z/
Received-SPF: pass client-ip=52.175.55.52;
 envelope-from=xuhang@eswincomputing.com; helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 13 Mar 2023 02:18:42 -0000

Because the starting address of ram is not necessarily 0,
the remaining free space in ram is
ram_size - (start - ram_base) instead of ram_size-start.

v3:
* Declare 'max_initrd' at the start of the function
* Fix title typo

v2:
* Rebase
* Considering that the ram block may be discontinuous

Hang Xu (1):
  hw/riscv: Fix max size limit when put initrd to RAM

 hw/riscv/boot.c            | 19 +++++++++++++------
 hw/riscv/microchip_pfsoc.c |  5 ++++-
 hw/riscv/opentitan.c       |  2 +-
 hw/riscv/sifive_e.c        |  2 +-
 hw/riscv/sifive_u.c        |  5 ++++-
 hw/riscv/spike.c           |  5 ++++-
 hw/riscv/virt.c            |  5 ++++-
 include/hw/riscv/boot.h    |  2 ++
 8 files changed, 33 insertions(+), 12 deletions(-)

-- 
2.17.1



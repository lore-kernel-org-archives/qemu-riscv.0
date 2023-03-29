Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phMPz-00058b-6Y
	for mharc-qemu-riscv@gnu.org; Tue, 28 Mar 2023 23:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phMPw-00056C-Fe; Tue, 28 Mar 2023 23:24:08 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phMPt-0001Jh-6x; Tue, 28 Mar 2023 23:24:08 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowACnrWVIryNkKBSiCw--.18591S2;
 Wed, 29 Mar 2023 11:23:53 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 0/5] target/riscv: Fix pointer mask related support
Date: Wed, 29 Mar 2023 11:23:41 +0800
Message-Id: <20230329032346.55185-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrWVIryNkKBSiCw--.18591S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF1xCw1kCFWrGr4UAF1rCrg_yoWDKFX_WF
 WIgFWjg3yUuay5JFyjkw4fJryUCFWfur10ya1UtrWUKr9rW3s8Ja1vqFn7ur4UZF4rJFn7
 ArnrJFWSkr17WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
 GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 XdbUUUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 29 Mar 2023 03:24:08 -0000

This patchset tries to fix some problem in current implementation for pointer mask, and add support for pointer mask of instruction fetch.

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-pm-fix-v2

v2:
* drop some error patchs
* Add patch 2 and 3 to fix the new problems
* Add patch 4 and 5 to use PC-relative translation for pointer mask for instruction fetch

Weiwei Li (5):
  target/riscv: Fix pointer mask transformation for vector address
  target/riscv: Update cur_pmmask/base when xl changes
  target/riscv: Sync cpu_pc before update badaddr
  target/riscv: Add support for PC-relative translation
  target/riscv: Add pointer mask support for instruction fetch

 target/riscv/cpu.c                      | 33 +++++++++----
 target/riscv/cpu.h                      |  1 +
 target/riscv/cpu_helper.c               | 20 +++++++-
 target/riscv/csr.c                      | 11 +++--
 target/riscv/insn_trans/trans_rvi.c.inc | 42 +++++++++++++---
 target/riscv/translate.c                | 66 ++++++++++++++++++-------
 target/riscv/vector_helper.c            |  2 +-
 7 files changed, 134 insertions(+), 41 deletions(-)

-- 
2.25.1



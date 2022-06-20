Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3BFZ-0001m1-NG
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 02:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFU-0001gX-1h; Mon, 20 Jun 2022 02:51:00 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:49160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFQ-0004Gu-Pp; Mon, 20 Jun 2022 02:50:59 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id B68A411EF31;
 Mon, 20 Jun 2022 06:50:41 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 20 Jun 2022 06:50:41 +0000
Subject: [PATCH qemu v6 00/10] Add mask agnostic behavior for rvv instructions
MIME-Version: 1.0
Message-ID: <165570784143.17634.35095816584573691-0@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 20 Jun 2022 06:51:03 -0000

According to v-spec, mask agnostic behavior can be either kept as
undisturbed or set elements' bits to all 1s. To distinguish the
difference of mask policies, QEMU should be able to simulate the mask
agnostic behavior as "set mask elements' bits to all 1s".

There are multiple possibility for agnostic elements according to
v-spec. The main intent of this patch-set tries to add option that
can distinguish between mask policies. Setting agnostic elements to
all 1s allows QEMU to express this.

The following instructions that are always unmasked and not affected:

- Vector add-with-carry and subtract-with-borrow instructions
- Vector merge and move instructions
- Vector reduction instructions
- Vector mask-register logical instructions
- `vcompress`

v2 updates:
- Rebase upon changes of the tail agnostic patch-set
- Minor change for vector load/store instructions

v3 updates:
- Rebase upon changes of the tail agnostic patch-set
- Fix coding style, add missing space
- Trigger `vma` when encountering vector load instructions and not in
  vector stores

v4 updates:
- Rebase upon changes of the tail agnostic patch-set

v5 updates:
- Tag WeiWei as Reviewed-by for this patch-set

v6 updates:
- Now that the tail agnostic patch-set has been merged, this
  patch-set no longer depends on it. Rebased to latest master.

Yueh-Ting (eop) Chen (9):
  target/riscv: rvv: Add mask agnostic for vv instructions
  target/riscv: rvv: Add mask agnostic for vector load / store
    instructions
  target/riscv: rvv: Add mask agnostic for vx instructions
  target/riscv: rvv: Add mask agnostic for vector integer shift
    instructions
  target/riscv: rvv: Add mask agnostic for vector integer comparison
    instructions
  target/riscv: rvv: Add mask agnostic for vector fix-point arithmetic
    instructions
  target/riscv: rvv: Add mask agnostic for vector floating-point
    instructions
  target/riscv: rvv: Add mask agnostic for vector mask instructions
  target/riscv: rvv: Add mask agnostic for vector permutation
    instructions

eopXD (1):
  target/riscv: rvv: Add option 'rvv_ma_all_1s' to enable optional mask
    agnostic behavior

 target/riscv/cpu.c                      |   1 +
 target/riscv/cpu.h                      |   2 +
 target/riscv/cpu_helper.c               |   2 +
 target/riscv/insn_trans/trans_rvv.c.inc |  28 +++++
 target/riscv/internals.h                |   5 +-
 target/riscv/translate.c                |   2 +
 target/riscv/vector_helper.c            | 152 ++++++++++++++++++++----
 7 files changed, 167 insertions(+), 25 deletions(-)

-- 
2.34.2


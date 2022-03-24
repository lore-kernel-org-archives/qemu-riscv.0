Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXSk5-0005iW-Uy
	for mharc-qemu-riscv@gnu.org; Thu, 24 Mar 2022 15:03:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nXSk4-0005eE-B3; Thu, 24 Mar 2022 15:03:28 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:36602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nXSk1-0003m1-6I; Thu, 24 Mar 2022 15:03:28 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 6D3C111EF33;
 Thu, 24 Mar 2022 19:03:22 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Thu, 24 Mar 2022 19:03:22 +0000
MIME-Version: 1.0
Subject: [PATCH qemu v4 00/14] Add tail agnostic behavior for rvv instructions
Message-ID: <164814860220.28290.11643334198417094464-0@git.sr.ht>
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
X-List-Received-Date: Thu, 24 Mar 2022 19:03:28 -0000

According to v-spec, tail agnostic behavior can be either kept as
undisturbed or set elements' bits to all 1s. To distinguish the
difference of tail policies, QEMU should be able to simulate the tail
agnostic behavior as "set tail elements' bits to all 1s". An option
'rvv_ta_all_1s' is added to enable the behavior, it is default as
disabled.

There are multiple possibility for agnostic elements according to
v-spec. The main intent of this patch-set tries to add option that
can distinguish between tail policies. Setting agnostic elements to
all 1s makes things simple and allow QEMU to express this.

We may explore other possibility of agnostic behavior by adding
other options in the future. Please understand that this patch-set
is limited.

v2 updates:
- Addressed comments from Weiwei Li
- Added commit tail agnostic on load / store instructions (which
   I forgot to include into the patch-set)

v3 updates:
- Missed the very 1st commit, adding it back

v4 updates:
- Renamed vlmax to total_elems
- Deal with tail element when vl_eq_vlmax == true

eopXD (14):
  target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
  target/riscv: rvv: Rename ambiguous esz
  target/riscv: rvv: Early exit when vstart >= vl
  target/riscv: rvv: Add tail agnostic for vv instructions
  target/riscv: rvv: Add tail agnostic for vector load / store
    instructions
  target/riscv: rvv: Add tail agnostic for vx, vvm, vxm instructions
  target/riscv: rvv: Add tail agnostic for vector integer shift
    instructions
  target/riscv: rvv: Add tail agnostic for vector integer comparison
    instructions
  target/riscv: rvv: Add tail agnostic for vector integer merge and move
    instructions
  target/riscv: rvv: Add tail agnostic for vector fix-point arithmetic
    instructions
  target/riscv: rvv: Add tail agnostic for vector floating-point
    instructions
  target/riscv: rvv: Add tail agnostic for vector reduction instructions
  target/riscv: rvv: Add tail agnostic for vector mask instructions
  target/riscv: rvv: Add tail agnostic for vector permutation
    instructions

 target/riscv/cpu.c                      |    1 +
 target/riscv/cpu.h                      |    2 +
 target/riscv/cpu_helper.c               |    2 +
 target/riscv/insn_trans/trans_rvv.c.inc |  154 +++
 target/riscv/internals.h                |    5 +-
 target/riscv/translate.c                |    2 +
 target/riscv/vector_helper.c            | 1597 ++++++++++++++---------
 7 files changed, 1140 insertions(+), 623 deletions(-)

-- 
2.34.1


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkTzg-0004Zf-Gk
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jan 2019 08:15:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gkTze-0004XW-14
	for qemu-riscv@nongnu.org; Fri, 18 Jan 2019 08:15:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gkTzQ-0006Wk-Us
	for qemu-riscv@nongnu.org; Fri, 18 Jan 2019 08:15:21 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:50022)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gkTzQ-0006KL-FI; Fri, 18 Jan 2019 08:15:16 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 zuban)
	id 1gkTzB-0005v6-MG; Fri, 18 Jan 2019 14:15:01 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 3093572-5;
	Fri, 18 Jan 2019 13:15:00 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com,
	kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
Date: Fri, 18 Jan 2019 14:14:21 +0100
Message-Id: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.18.130316, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v4 00/35] target/riscv: Convert to decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2019 13:15:31 -0000

Hi,

this patchset converts the RISC-V decoder to decodetree in four major steps:

1) Convert 32-bit instructions to decodetree [Patch 1-16]:
    Many of the gen_* functions are called by the decode functions for 16-bit
    and 32-bit functions. If we move translation code from the gen_*
    functions to the generated trans_* functions of decode-tree, we get a lot of
    duplication. Therefore, we mostly generate calls to the old gen_* function
    which are properly replaced after step 2).

    Each of the trans_ functions are grouped into files corresponding to their
    ISA extension, e.g. addi which is in RV32I is translated in the file
    'trans_rvi.inc.c'.

2) Convert 16-bit instructions to decodetree [Patch 17-19]:
    All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
    we convert the arguments in the 16 bit trans_ function to the arguments of
    the corresponding 32 bit instruction and call the 32 bit trans_ function.

3) Remove old manual decoding in gen_* function [Patch 20-30]:
    this move all manual translation code into the trans_* instructions of
    decode tree, such that we can remove the old decode_* functions.

4) Simply RVC by reusing as much as possible from the RVG decoder as suggested
   by Richard. [Patch 31-35]

full tree available at
https://github.com/bkoppelmann/qemu/tree/riscv-dt-v4

Cheers,
Bastian

v3 -> v4:
    - moved uint32_t insn removal from patch 0004 here
    - removed accidental argument removal
    - insn64.decode -> insn32-64.decode
    - shamt of shift insn is now 10 bit
    - @sh6 -> @sh
    - %sh6 -> %sh10
    - current_cpu->env_ptr -> ctx-env
    - int memop -> TCGMemop memop
    - gen_addiw -> gen_addw
    - add TARGET_LONG_BITS check for sari and shri
    - trans_addw now uses gen_addw
    - trans_subw now uses gen_subw
    - refactor tcg_gen_set_cond_tl(TCG_COND_LT,..) into gen_slt function
      and reuse gen_arith(..., &gen_slt) for all trans_slt functions.
    - Add missing sign extension to trans_srlw/sllw
    - Made rs2 == 0 a special case of srlw/sllw
    - trans_sltu/slt added to conversion

Bastian Koppelmann (35):
  target/riscv: Move CPURISCVState pointer to DisasContext
  target/riscv: Activate decodetree and implemnt LUI & AUIPC
  target/riscv: Convert RVXI branch insns to decodetree
  target/riscv: Convert RV32I load/store insns to decodetree
  target/riscv: Convert RV64I load/store insns to decodetree
  target/riscv: Convert RVXI arithmetic insns to decodetree
  target/riscv: Convert RVXI fence insns to decodetree
  target/riscv: Convert RVXI csr insns to decodetree
  target/riscv: Convert RVXM insns to decodetree
  target/riscv: Convert RV32A insns to decodetree
  target/riscv: Convert RV64A insns to decodetree
  target/riscv: Convert RV32F insns to decodetree
  target/riscv: Convert RV64F insns to decodetree
  target/riscv: Convert RV32D insns to decodetree
  target/riscv: Convert RV64D insns to decodetree
  target/riscv: Convert RV priv insns to decodetree
  target/riscv: Convert quadrant 0 of RVXC insns to decodetree
  target/riscv: Convert quadrant 1 of RVXC insns to decodetree
  target/riscv: Convert quadrant 2 of RVXC insns to decodetree
  target/riscv: Remove gen_jalr()
  target/riscv: Remove manual decoding from gen_branch()
  target/riscv: Remove manual decoding from gen_load()
  target/riscv: Remove manual decoding from gen_store()
  target/riscv: Move gen_arith_imm() decoding into trans_* functions
  target/riscv: make ADD/SUB/OR/XOR/AND insn use arg lists
  target/riscv: Remove shift and slt insn manual decoding
  target/riscv: Remove manual decoding of RV32/64M insn
  target/riscv: Rename trans_arith to gen_arith
  target/riscv: Remove gen_system()
  target/riscv: Remove decode_RV32_64G()
  target/riscv: Convert @cs_2 insns to share translation
    functions<Paste>
  target/riscv: Convert @cl_d, @cl_w, @cs_d, @cs_w insns
  target/riscv: Splice fsw_sd and flw_ld for riscv32 vs riscv64
  target/riscv: Splice remaining compressed insn pairs for riscv32 vs
    riscv64
  target/riscv: Remaining rvc insn reuse 32 bit translators

 target/riscv/Makefile.objs                    |   22 +
 target/riscv/insn16-32.decode                 |   31 +
 target/riscv/insn16-64.decode                 |   33 +
 target/riscv/insn16.decode                    |  114 ++
 target/riscv/insn32-64.decode                 |   72 +
 target/riscv/insn32.decode                    |  203 ++
 .../riscv/insn_trans/trans_privileged.inc.c   |  110 +
 target/riscv/insn_trans/trans_rva.inc.c       |  207 ++
 target/riscv/insn_trans/trans_rvc.inc.c       |  149 ++
 target/riscv/insn_trans/trans_rvd.inc.c       |  388 ++++
 target/riscv/insn_trans/trans_rvf.inc.c       |  388 ++++
 target/riscv/insn_trans/trans_rvi.inc.c       |  576 ++++++
 target/riscv/insn_trans/trans_rvm.inc.c       |  107 +
 target/riscv/translate.c                      | 1781 ++---------------
 14 files changed, 2619 insertions(+), 1562 deletions(-)
 create mode 100644 target/riscv/insn16-32.decode
 create mode 100644 target/riscv/insn16-64.decode
 create mode 100644 target/riscv/insn16.decode
 create mode 100644 target/riscv/insn32-64.decode
 create mode 100644 target/riscv/insn32.decode
 create mode 100644 target/riscv/insn_trans/trans_privileged.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rva.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvc.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvd.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvf.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvi.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvm.inc.c

-- 
2.20.1



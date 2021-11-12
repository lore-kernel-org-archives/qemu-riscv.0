Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlY2q-0004Sv-TX
	for mharc-qemu-riscv@gnu.org; Fri, 12 Nov 2021 10:00:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mlY2F-0003od-W4; Fri, 12 Nov 2021 10:00:14 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:40862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mlY26-0005so-LH; Fri, 12 Nov 2021 10:00:11 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 23E8E40F92;
 Fri, 12 Nov 2021 15:59:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1636729199;
 bh=rS1dUjiEiYoQpcyH+YEPnxShmfGad3FyORdwDzuvQ8M=;
 h=From:To:Cc:Subject:Date:From;
 b=Y6diQIJC3jtRLrz9Ugy3LKOLykLvORsk1K+PJQ6l4qiQ22gyr4kn5XjV5TDPGL9LV
 BraZDRVi35DsKX24gKVWkJ+A4N0iqN1gLKqSoXm9cYbvde/uDm9Kfk8UutK43tLSwh
 L4s93LvzeRcGDMU6Vc8cDS/WqhL5884e00JzzJjGjV+HCQ1AbNeTREhGj/A6ORsMmf
 ScLx9Zq6mp853ZyPpE9cD6ebCQCTe+ZB+dcueq6T/3QPQgrOOjD6JHbI5VatjPR79n
 3j4ECadmnT05KnFu77QPY1Z6z8GdRH+HPwPm+FY1dR2KmI/xjtJAOawkIA/6Of7EQa
 SBQqN4f5T86EA==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 0AC2260067;
 Fri, 12 Nov 2021 15:59:59 +0100 (CET)
Received: from palmier.tima.u-ga.fr (unknown [217.114.201.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 4DD3014005C;
 Fri, 12 Nov 2021 15:59:58 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v5 00/18]  Adding partial support for 128-bit riscv target
Date: Fri, 12 Nov 2021 15:58:44 +0100
Message-Id: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 12 Nov 2021 15:00:22 -0000

This series of patches provides partial 128-bit support for the riscv
target architecture, namely RVI and RVM, with minimal csr support.

First of all thanks for the feedback on v4 and guidance for v5.

This v5 mainly corrects flaws in the implementation pointed out by Richard
and Philippe:
- split the memop define renaming and addition in two patches
- 128-bit div/rem operations using the new version host-utils functions
  of Luis. The divrem algorithm is the one proposed by Stefan Kanthak and
  the implementation in QEMU appears to be a bit faster than gcc uint128_t
  support
- removed useless rv128 tests at various places
- refactoring the slt/bxx part so as to share the comparison part
- refactoring the 128-bit csr handling to share code more largely
  Also forwarding writes to the 64-bit version when not 128-bit version
  exists, as a vast majority of the csrs does not use the upper 64-bits

Frédéric Pétrot (18):
  exec/memop: Adding signedness to quad definitions
  exec/memop: Adding signed quad and octo defines
  qemu/int128: addition of div/rem 128-bit operations
  target/riscv: additional macros to check instruction support
  target/riscv: separation of bitwise logic and arithmetic helpers
  target/riscv: array for the 64 upper bits of 128-bit registers
  target/riscv: setup everything so that riscv128-softmmu compiles
  target/riscv: moving some insns close to similar insns
  target/riscv: accessors to registers upper part and 128-bit load/store
  target/riscv: support for 128-bit bitwise instructions
  target/riscv: support for 128-bit U-type instructions
  target/riscv: support for 128-bit shift instructions
  target/riscv: support for 128-bit arithmetic instructions
  target/riscv: support for 128-bit M extension
  target/riscv: adding high part of some csrs
  target/riscv: helper functions to wrap calls to 128-bit csr insns
  target/riscv: modification of the trans_csrxx for 128-bit support
  target/riscv: actual functions to realize crs 128-bit insns

 configs/devices/riscv128-softmmu/default.mak |  17 +
 configs/targets/riscv128-softmmu.mak         |   6 +
 include/disas/dis-asm.h                      |   1 +
 include/exec/memop.h                         |  15 +-
 include/hw/riscv/sifive_cpu.h                |   3 +
 include/qemu/int128.h                        |   6 +
 include/tcg/tcg-op.h                         |   4 +-
 target/arm/translate-a32.h                   |   4 +-
 target/riscv/cpu-param.h                     |   5 +
 target/riscv/cpu.h                           |  23 +
 target/riscv/cpu_bits.h                      |   3 +
 target/riscv/helper.h                        |   9 +
 target/riscv/insn16.decode                   |  27 +-
 target/riscv/insn32.decode                   |  25 +
 accel/tcg/cputlb.c                           |  30 +-
 accel/tcg/user-exec.c                        |   8 +-
 disas/riscv.c                                |   5 +
 target/alpha/translate.c                     |  32 +-
 target/arm/helper-a64.c                      |   8 +-
 target/arm/translate-a64.c                   |   8 +-
 target/arm/translate-neon.c                  |   6 +-
 target/arm/translate-sve.c                   |  10 +-
 target/arm/translate-vfp.c                   |   8 +-
 target/arm/translate.c                       |   2 +-
 target/cris/translate.c                      |   2 +-
 target/hppa/translate.c                      |   4 +-
 target/i386/tcg/mem_helper.c                 |   2 +-
 target/i386/tcg/translate.c                  |  36 +-
 target/m68k/op_helper.c                      |   2 +-
 target/mips/tcg/translate.c                  |  58 +-
 target/mips/tcg/tx79_translate.c             |   8 +-
 target/ppc/translate.c                       |  32 +-
 target/riscv/cpu.c                           |  31 +-
 target/riscv/csr.c                           | 198 ++++-
 target/riscv/gdbstub.c                       |   8 +
 target/riscv/m128_helper.c                   | 109 +++
 target/riscv/machine.c                       |  22 +
 target/riscv/op_helper.c                     |  44 ++
 target/riscv/translate.c                     | 252 ++++++-
 target/s390x/tcg/mem_helper.c                |   8 +-
 target/s390x/tcg/translate.c                 |   8 +-
 target/sh4/translate.c                       |  12 +-
 target/sparc/translate.c                     |  36 +-
 target/tricore/translate.c                   |   4 +-
 target/xtensa/translate.c                    |   4 +-
 tcg/tcg.c                                    |   4 +-
 tcg/tci.c                                    |  16 +-
 util/int128.c                                | 145 ++++
 accel/tcg/ldst_common.c.inc                  |   8 +-
 target/mips/tcg/micromips_translate.c.inc    |  10 +-
 target/ppc/translate/fixedpoint-impl.c.inc   |  22 +-
 target/ppc/translate/fp-impl.c.inc           |   4 +-
 target/ppc/translate/vsx-impl.c.inc          |  42 +-
 target/riscv/insn_trans/trans_rva.c.inc      |  22 +-
 target/riscv/insn_trans/trans_rvb.c.inc      |  48 +-
 target/riscv/insn_trans/trans_rvd.c.inc      |  16 +-
 target/riscv/insn_trans/trans_rvf.c.inc      |   6 +-
 target/riscv/insn_trans/trans_rvh.c.inc      |   4 +-
 target/riscv/insn_trans/trans_rvi.c.inc      | 732 ++++++++++++++++---
 target/riscv/insn_trans/trans_rvm.c.inc      | 193 ++++-
 target/s390x/tcg/translate_vx.c.inc          |  18 +-
 tcg/aarch64/tcg-target.c.inc                 |   2 +-
 tcg/arm/tcg-target.c.inc                     |  10 +-
 tcg/i386/tcg-target.c.inc                    |  12 +-
 tcg/mips/tcg-target.c.inc                    |  12 +-
 tcg/ppc/tcg-target.c.inc                     |  16 +-
 tcg/riscv/tcg-target.c.inc                   |   6 +-
 tcg/s390x/tcg-target.c.inc                   |  18 +-
 tcg/sparc/tcg-target.c.inc                   |  16 +-
 meson                                        |   2 +-
 target/riscv/Kconfig                         |   3 +
 target/riscv/meson.build                     |   1 +
 target/s390x/tcg/insn-data.def               |  28 +-
 util/meson.build                             |   1 +
 74 files changed, 2038 insertions(+), 524 deletions(-)
 create mode 100644 configs/devices/riscv128-softmmu/default.mak
 create mode 100644 configs/targets/riscv128-softmmu.mak
 create mode 100644 target/riscv/m128_helper.c
 create mode 100644 util/int128.c

-- 
2.33.1



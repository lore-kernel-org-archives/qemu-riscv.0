Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5Zt1-0001q9-Ry
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 16:01:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5Zt0-0001pT-9p; Thu, 06 Jan 2022 16:01:26 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:56118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5Zsy-0002e0-2v; Thu, 06 Jan 2022 16:01:25 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id E97FA4039A;
 Thu,  6 Jan 2022 22:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1641502880;
 bh=YXW/wCoNFNr2Fbr4a4HOS8omqz2TUxlWpUb/DNZLFts=;
 h=From:To:Cc:Subject:Date:From;
 b=sC3vr9taeSFy9pASBowDRUVGv8bzTGZxAecxLSBylbgYtjweLhILke93mQLDWrYUG
 AeDh0smG14kWvn8oq5s1I0/Xwj7huIMXw750BsPX/DErqEvmTUlu2iDx56aqRLIRbJ
 m6lwnvhdWNUyt95rBMAhKPxhOwscMkGujOKP52WaAVoIAbOeF129ebblJOLWJZZaep
 HKQTppfqZ47XaoS7o+WOA4qdaEEf8hGE9XzbkYDs9PjmrbiK2VJhMH1vYbUrR2wC3V
 V1+T4jeb1An4Vk9YAdh1cmHL24zRD7F98S0WYbQvwWdbHTtqB1846i6yrLxod53nyz
 J6lVWN1gYjfMg==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id CF1826005B;
 Thu,  6 Jan 2022 22:01:20 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 1C9F414007F;
 Thu,  6 Jan 2022 22:01:19 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, f4bug@amsat.org, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v8 00/18]   Adding partial support for 128-bit riscv target
Date: Thu,  6 Jan 2022 22:00:50 +0100
Message-Id: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 06 Jan 2022 21:01:26 -0000

This series of patches provides partial 128-bit support for the riscv
target architecture, namely RVI and RVM, with minimal csr support.

Thanks for the reviews and advices.

v8:
- rebase on riscv-to-apply.next

v7:
- code motion following reviews
- correction of a bug preventing riscv{32,64}-linux-user to compile
- sync with master
- Note that 'make check' fails for 5 qemu-iotests cases, namely
  040, 041, 127, 256, and 267, but they also fail with
  qemu-system-riscv{32,64} from current master

v6:
- support for '-cpu rv128' in qemu-system-riscv64 to handle 128-bit
  executables (no more qemu-system-riscv128)
- remove useless (and buggy) big-endian support in lq/sq

v5:
- split the memop define renaming and addition in two patches
- 128-bit div/rem operations using host-utils functions
- removed useless rv128 tests at various places
- refactoring the slt/bxx part so as to share the comparison part
- refactoring the 128-bit csr handling to share code more largely
  Also forwarding writes to the 64-bit version when not 128-bit version
  exists, as a vast majority of the csrs does not use the upper 64-bits

v4: 
- safer and cleaner access to the gpr upper part
- locals for load/store/div/rem helpers
- cleans out the 128-bit div/rem code
- corrects numerous bugs and performs optimizations on shifts and mults
- withdraws the change in page size and the vm schemes we introduced

v3:
- v2 refactored following Richard's xl patch changes

v2:
- load and store making use of new memop.h sizes
- use of the existing Int128 computations in helpers, and addition of
  a few more operations there, in particular division and remainder
- refactoring of the calls to the code generation helpers
- split of the patch in smaller pieces

v1:
- introducing support for rv128 for basic integer and M extension insns


Frédéric Pétrot (18):
  exec/memop: Adding signedness to quad definitions
  exec/memop: Adding signed quad and octo defines
  qemu/int128: addition of div/rem 128-bit operations
  target/riscv: additional macros to check instruction support
  target/riscv: separation of bitwise logic and arithmetic helpers
  target/riscv: array for the 64 upper bits of 128-bit registers
  target/riscv: setup everything for rv64 to support rv128 execution
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

 include/disas/dis-asm.h                    |   1 +
 include/exec/memop.h                       |  15 +-
 include/qemu/int128.h                      |  27 +
 include/tcg/tcg-op.h                       |   4 +-
 target/arm/translate-a32.h                 |   4 +-
 target/riscv/cpu.h                         |  22 +
 target/riscv/cpu_bits.h                    |   3 +
 target/riscv/helper.h                      |   9 +
 target/riscv/insn16.decode                 |  27 +-
 target/riscv/insn32.decode                 |  25 +
 accel/tcg/cputlb.c                         |  30 +-
 accel/tcg/user-exec.c                      |   8 +-
 disas/riscv.c                              |   5 +
 target/alpha/translate.c                   |  32 +-
 target/arm/helper-a64.c                    |   8 +-
 target/arm/translate-a64.c                 |   8 +-
 target/arm/translate-neon.c                |   6 +-
 target/arm/translate-sve.c                 |  10 +-
 target/arm/translate-vfp.c                 |   8 +-
 target/arm/translate.c                     |   2 +-
 target/cris/translate.c                    |   2 +-
 target/hppa/translate.c                    |   4 +-
 target/i386/tcg/mem_helper.c               |   2 +-
 target/i386/tcg/translate.c                |  36 +-
 target/m68k/op_helper.c                    |   2 +-
 target/mips/tcg/translate.c                |  58 +-
 target/mips/tcg/tx79_translate.c           |   8 +-
 target/ppc/translate.c                     |  32 +-
 target/riscv/cpu.c                         |  29 +
 target/riscv/csr.c                         | 194 +++++-
 target/riscv/gdbstub.c                     |   5 +
 target/riscv/m128_helper.c                 | 109 +++
 target/riscv/machine.c                     |  22 +
 target/riscv/op_helper.c                   |  44 ++
 target/riscv/translate.c                   | 252 ++++++-
 target/s390x/tcg/mem_helper.c              |   8 +-
 target/s390x/tcg/translate.c               |   8 +-
 target/sh4/translate.c                     |  12 +-
 target/sparc/translate.c                   |  36 +-
 target/tricore/translate.c                 |   4 +-
 target/xtensa/translate.c                  |   4 +-
 tcg/tcg.c                                  |   4 +-
 tcg/tci.c                                  |  16 +-
 util/int128.c                              | 147 +++++
 accel/tcg/ldst_common.c.inc                |   8 +-
 target/mips/tcg/micromips_translate.c.inc  |  10 +-
 target/ppc/translate/fixedpoint-impl.c.inc |  22 +-
 target/ppc/translate/fp-impl.c.inc         |   4 +-
 target/ppc/translate/vsx-impl.c.inc        |  42 +-
 target/riscv/insn_trans/trans_rva.c.inc    |  22 +-
 target/riscv/insn_trans/trans_rvb.c.inc    |  48 +-
 target/riscv/insn_trans/trans_rvd.c.inc    |   4 +-
 target/riscv/insn_trans/trans_rvh.c.inc    |   4 +-
 target/riscv/insn_trans/trans_rvi.c.inc    | 730 ++++++++++++++++++---
 target/riscv/insn_trans/trans_rvm.c.inc    | 192 +++++-
 target/s390x/tcg/translate_vx.c.inc        |  18 +-
 tcg/aarch64/tcg-target.c.inc               |   2 +-
 tcg/arm/tcg-target.c.inc                   |  10 +-
 tcg/i386/tcg-target.c.inc                  |  12 +-
 tcg/mips/tcg-target.c.inc                  |  12 +-
 tcg/ppc/tcg-target.c.inc                   |  16 +-
 tcg/riscv/tcg-target.c.inc                 |   6 +-
 tcg/s390x/tcg-target.c.inc                 |  18 +-
 tcg/sparc/tcg-target.c.inc                 |  16 +-
 target/riscv/meson.build                   |   1 +
 target/s390x/tcg/insn-data.def             |  28 +-
 util/meson.build                           |   1 +
 67 files changed, 2006 insertions(+), 512 deletions(-)
 create mode 100644 target/riscv/m128_helper.c
 create mode 100644 util/int128.c

-- 
2.34.1



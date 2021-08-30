Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKmvI-0007h4-EE
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 15:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKktq-00053G-8H; Mon, 30 Aug 2021 13:16:46 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:50012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKktn-00071s-V8; Mon, 30 Aug 2021 13:16:46 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 4268B418F6;
 Mon, 30 Aug 2021 19:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630343798;
 bh=5oP298Xzro+R4gmYUDsaul8dlZmp3Xk+e6e7UGQfvHs=;
 h=From:To:Cc:Subject:Date:From;
 b=PNwa56+wrI/EWI8zmNeXC0fkY3ppp0IOqwidA7Q1mzSl9GWvUxY7kagAkiSapWRP+
 AN9jGcneRCKcgGOMEqG9p559MpTwcAzz75RgH7O4vHV95CBuDy8iwQJzjm5eLwQJM1
 VM27CTX9PsfsLV9BqbB2hae8MTTn+mR+QhlG8Lltj01MK1g1XzODbzwCjBOc63v0bP
 ZvUpOWoqT5HZDZW+mt09S+swdJPDV4nCKUzzRaYDglFEDfGCRX7stc/lSDJvL0EnH3
 Lso/HWeZBaZFcku0D49QVVN0FWHJsJW+fRfQZ8Asm8H1hbQqXccNHVAitiCIcF4d2i
 rkUV6Uu5l4SqQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 3C5E980137;
 Mon, 30 Aug 2021 19:16:38 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 1881E40069;
 Mon, 30 Aug 2021 19:16:38 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 alex.bennee@linaro.org, philmd@redhat.com, richard.henderson@linaro.org,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH 0/8] RISC V partial support for 128-bit architecture
Date: Mon, 30 Aug 2021 19:16:20 +0200
Message-Id: <20210830171620.126296-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (40)
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
X-Mailman-Approved-At: Mon, 30 Aug 2021 15:26:22 -0400
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
X-List-Received-Date: Mon, 30 Aug 2021 17:16:47 -0000

This series of patches aims at adding partial 128-bit support to the riscv
target, following the (unratified) RV128I specification, Chapter 7 of
riscv-spec document dated 20191214.
It provides support for all user integer (I) instructions and for an M
extension which follows the definition of the 32 and 64-bit specifications.
We also included minimal support for 128-bit csrs.
Among the csrs, we selected misa, to know the mxlen in which the processor
is, mtvec, mepc, mscratch and mstatus for minimal kernel development, and
satp to point to the page table.
We fallback on the 64-bit csrs for the others.

In the last patch, we propose a "natural" extension of the sv39 and sv48
virtual address modes using 16KB pages, that we believe suitable for
128-bit CPU workloads.

There are two strong assumptions in this implementation:
- the 64 upper bits of the addresses are irrelevant, be they virtual or
  physical, in order to use the existing address translation mechanism,
- the mxlen field stays hardwired, so there is no dynamic change in
  register size.

As no toolchain exists yet for this target, we wrote all our tests in asm
using macros expanding .insn directives.
We unit tested the behavior of the instructions, and wrote some simple
user level performance tests: on our examples the execution speed of the
128-bit version is between 1.2 to 5 time slower than its 32 and 64-bit
counterparts.

Thanks to Luc Michel for his advice in building the patches (although
all errors are ours.)

Frédéric Pétrot (8):
  target/riscv: Settings for 128-bit extension support
  target/riscv: 128-bit registers creation and access
  target/riscv: Addition of 128-bit ldu, lq and sq instructions
  target/riscv: 128-bit arithmetic and logic instructions
  target/riscv: 128-bit multiply and divide
  target/riscv: Support of compiler's 128-bit integer types
  target/riscv: 128-bit support for some csrs
  target/riscv: Support for 128-bit satp

 configs/devices/riscv128-softmmu/default.mak |   16 +
 configs/targets/riscv128-softmmu.mak         |    5 +
 gdb-xml/riscv-128bit-cpu.xml                 |   48 +
 gdb-xml/riscv-128bit-virtual.xml             |   12 +
 include/hw/riscv/sifive_cpu.h                |    4 +
 include/tcg/tcg-op.h                         |    1 +
 slirp                                        |    2 +-
 target/riscv/Kconfig                         |    3 +
 target/riscv/arch_dump.c                     |    3 +-
 target/riscv/cpu-param.h                     |   12 +-
 target/riscv/cpu.c                           |   51 +-
 target/riscv/cpu.h                           |   61 +
 target/riscv/cpu_bits.h                      |   12 +
 target/riscv/cpu_helper.c                    |   56 +-
 target/riscv/csr.c                           |  343 ++++-
 target/riscv/gdbstub.c                       |    3 +
 target/riscv/helper.h                        |   15 +
 target/riscv/insn16.decode                   |   33 +-
 target/riscv/insn32.decode                   |   25 +
 target/riscv/insn_trans/trans_rvd.c.inc      |   10 +-
 target/riscv/insn_trans/trans_rvf.c.inc      |    2 +-
 target/riscv/insn_trans/trans_rvi.c.inc      | 1209 +++++++++++++++++-
 target/riscv/insn_trans/trans_rvm.c.inc      |  456 ++++++-
 target/riscv/m128_helper.c                   |  349 +++++
 target/riscv/meson.build                     |    1 +
 target/riscv/op_helper.c                     |   60 +
 target/riscv/translate.c                     |  104 +-
 target/riscv/utils_128.h                     |  173 +++
 tcg/tcg-op.c                                 |    6 +
 29 files changed, 2990 insertions(+), 85 deletions(-)
 create mode 100644 configs/devices/riscv128-softmmu/default.mak
 create mode 100644 configs/targets/riscv128-softmmu.mak
 create mode 100644 gdb-xml/riscv-128bit-cpu.xml
 create mode 100644 gdb-xml/riscv-128bit-virtual.xml
 create mode 100644 target/riscv/m128_helper.c
 create mode 100644 target/riscv/utils_128.h

-- 
2.33.0



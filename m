Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mez5u-0005wV-Aj
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 08:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez5n-0005rd-Dx; Mon, 25 Oct 2021 08:28:43 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:42676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez5g-0007vU-Dq; Mon, 25 Oct 2021 08:28:43 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 9FABD4155A;
 Mon, 25 Oct 2021 14:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1635164911;
 bh=X6ues7rS+wXaXLKD/QjtH1xkvKtBSRo+n/L1qQY71EI=;
 h=From:To:Cc:Subject:Date:From;
 b=mzlsMR3HwZetEYEcodHUEEKd9pFq48d+HJ+fGYTwaJIWBa6NVHbFylxMWAlw7uWKV
 0MWxTND8zMZkS1om5WxIdAs28Wrzy8sA7k6a/RWH1IQD86QrOQOyHtouRnTgF0rBPV
 c8QBL8fqABetVcJ77OAmDNOaaDTjM16acKVbmyvPvQ2xwa/7eoHFg6/Ym0bfP98OYl
 aFbmHSq58NM1f9RKN9ozzjKF1WD4SUi78lKtKrmre8hTOv5/Lp8qYLjLK/q6q03p+o
 VGSGjhSkTmvIJoCWVhEayG1vcAXstV+qnfT9FauniZLXcZrV1jyCXmZ+8PxZD6RdY9
 5GIPJQDGxoSVQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 85A7660066;
 Mon, 25 Oct 2021 14:28:31 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id BEC2A14005A;
 Mon, 25 Oct 2021 14:28:30 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v4 00/17] Adding partial support for 128-bit riscv target
Date: Mon, 25 Oct 2021 14:28:01 +0200
Message-Id: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
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
X-List-Received-Date: Mon, 25 Oct 2021 12:28:45 -0000

This series of patches provides partial 128-bit support for the riscv
target architecture, namely RVI and RVM, with very minimal csr support.

Per Richard suggestions, this v4 makes the accesses to the gprs
safer and cleaner, which paves the way to a more integrated 64/128
version.
It also uses locals for load/store/div/rem helpers, cleans out the 128-bit
div/rem code, corrects numerous bugs and performs optimizations on shifts
and mults, all pointed out by Richard.
It finally withdraws the change in page size and the vm schemes we
previously introduced.

However, there is still some work:
- 128-bit atomic align accesses: for now, mttcg is disabled, my
  understanding there is, to say the least, low
- full 64/128 bit integration to remove the need for a 128-bit
  executable. There are places in which I do not yet see clearly
  how to handle this.

Frédéric Pétrot (17):
  exec/memop: Rename MO_Q definition as MO_UQ and add MO_UO
  qemu/int128: addition of a few 128-bit operations
  target/riscv: additional macros to check instruction support
  target/riscv: separation of bitwise logic and aritmetic helpers
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
 include/exec/memop.h                         |  13 +-
 include/hw/riscv/sifive_cpu.h                |   3 +
 include/qemu/int128.h                        |  26 +
 target/arm/translate-a32.h                   |   4 +-
 target/riscv/cpu-param.h                     |   5 +
 target/riscv/cpu.h                           |  28 +
 target/riscv/cpu_bits.h                      |   1 +
 target/riscv/helper.h                        |   9 +
 target/riscv/insn16.decode                   |  27 +-
 target/riscv/insn32.decode                   |  25 +
 disas/riscv.c                                |   5 +
 target/arm/translate-a64.c                   |   8 +-
 target/arm/translate-neon.c                  |   6 +-
 target/arm/translate-sve.c                   |   2 +-
 target/arm/translate-vfp.c                   |   8 +-
 target/arm/translate.c                       |   2 +-
 target/ppc/translate.c                       |  24 +-
 target/riscv/cpu.c                           |  31 +-
 target/riscv/csr.c                           | 191 ++++-
 target/riscv/gdbstub.c                       |   8 +
 target/riscv/m128_helper.c                   | 109 +++
 target/riscv/machine.c                       |  22 +
 target/riscv/op_helper.c                     |  44 ++
 target/riscv/translate.c                     | 252 +++++-
 target/sparc/translate.c                     |   4 +-
 util/int128.c                                | 218 ++++++
 target/ppc/translate/fixedpoint-impl.c.inc   |  20 +-
 target/ppc/translate/fp-impl.c.inc           |   4 +-
 target/ppc/translate/vsx-impl.c.inc          |   4 +-
 target/riscv/insn_trans/trans_rvb.c.inc      |  48 +-
 target/riscv/insn_trans/trans_rvd.c.inc      |  12 +-
 target/riscv/insn_trans/trans_rvf.c.inc      |   6 +-
 target/riscv/insn_trans/trans_rvi.c.inc      | 770 ++++++++++++++++---
 target/riscv/insn_trans/trans_rvm.c.inc      | 197 ++++-
 tcg/aarch64/tcg-target.c.inc                 |   2 +-
 tcg/arm/tcg-target.c.inc                     |  10 +-
 tcg/i386/tcg-target.c.inc                    |   4 +-
 tcg/mips/tcg-target.c.inc                    |   4 +-
 tcg/ppc/tcg-target.c.inc                     |   8 +-
 tcg/riscv/tcg-target.c.inc                   |   6 +-
 tcg/s390x/tcg-target.c.inc                   |  10 +-
 target/riscv/Kconfig                         |   3 +
 target/riscv/meson.build                     |   1 +
 util/meson.build                             |   1 +
 47 files changed, 1925 insertions(+), 284 deletions(-)
 create mode 100644 configs/devices/riscv128-softmmu/default.mak
 create mode 100644 configs/targets/riscv128-softmmu.mak
 create mode 100644 target/riscv/m128_helper.c
 create mode 100644 util/int128.c

-- 
2.33.0



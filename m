Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5ODZ-0002zr-R2
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 03:33:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5ODV-0002z1-Cc; Thu, 06 Jan 2022 03:33:50 -0500
Received: from [2607:f8b0:4864:20::12d] (port=34725
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5ODT-0005Oe-Kq; Thu, 06 Jan 2022 03:33:49 -0500
Received: by mail-il1-x12d.google.com with SMTP id d14so1563939ila.1;
 Thu, 06 Jan 2022 00:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+20Jk4BIpCSccG46Mua2Pahpidr/Wmod4eO3mnfxAP0=;
 b=kYiwkeg3uns6BVOFNrj7PRyBTQryfsQBKpjQ+IWTT7l9SlrltTH8/IwzRpGJzm6zTy
 amCNGbii/N52d5oKPpfWFML72sbX6ZksClUTLbLZKZlHBF/H+37WmlZH7NtFGu6rufk+
 3+H86RPGt/GPRCtwhbGuBidakwO/eP/Lt7I/3LbX0qvD4rdfSNYTaLlbPWhH3j9OP9/8
 Gv5okyysD7HifF+B2RVml0q/oLj83l/g1odiz1XAmTBIzPN4lnIXna10OaTzBgrpGubv
 vyzz9jgG+jn1/O30d6ouyGm2WLBycliwyiDs+teliXXWWi4sHL2uDyqlW71d+st3ArnH
 HDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+20Jk4BIpCSccG46Mua2Pahpidr/Wmod4eO3mnfxAP0=;
 b=r5MBCybkK5zngHIF2he84WkVGj8zc476Dsnb5mTZSYBwDQPhBxGKBUiO9oWxsLqfPg
 TsaBc5E+WaCv9oviDzkJjMYp1/rJj+kSU/V1Z9YfXTbZ7kbBKbLGAK2doM/CFhuPGstU
 BMgQF9+88uB8f+vfQjVU9CgsuxIWd4XQ3n8OdH5+wtHVfQyBuBGpROTG2Xde7zD0Xf24
 upx+cJE31HGjZrZb5132ttlt1TjYwVUif1L9M8SQlnjE096ZgKNa1QtuLYC3i40raxUC
 HMxswIk8iWafhYbHq244eWjFla98hNTHaKi2w/0WfaeDwueh24Tjk05eli1drLbQda7X
 +7QQ==
X-Gm-Message-State: AOAM532bzLp/oQdZhwOH9ndGDnEzu6DtNhoYOeqw7FnoQmB/jjpBmTPm
 o1OsN6gHAsSLbMuFLkXroZaOSi1D8t/kB9swcZk=
X-Google-Smtp-Source: ABdhPJyai4ISXF0lO9mEDc9Fv8DjJulvEWFS6gIN0uCgMMwPcFDQ2t4VxQmZCy7HxLezCXrYMmbJ+VKVsFQ1+sVaiRM=
X-Received: by 2002:a05:6e02:1806:: with SMTP id
 a6mr24581674ilv.221.1641458026117; 
 Thu, 06 Jan 2022 00:33:46 -0800 (PST)
MIME-Version: 1.0
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 18:33:19 +1000
Message-ID: <CAKmqyKPTa3sOJa403rgPhL=Us=+c-QhT1fRvj-arm9HkPhKZnA@mail.gmail.com>
Subject: Re: [PATCH v7 00/18] Adding partial support for 128-bit riscv target
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 06 Jan 2022 08:33:51 -0000

On Tue, Dec 14, 2021 at 2:39 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> This series of patches provides partial 128-bit support for the riscv
> target architecture, namely RVI and RVM, with minimal csr support.
>
> Thanks again for the reviews and advices.

I think this is all reviewed now. I was getting an error when trying
to apply it though, do you mind rebasing on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next ?

Alistair

>
> v7:
> - code motion following reviews
> - correction of a bug preventing riscv{32,64}-linux-user to compile
> - sync with master
> - Note that 'make check' fails for 5 qemu-iotests cases, namely
>   040, 041, 127, 256, and 267, but they also fail with
>   qemu-system-riscv{32,64} from current master
>
> v6:
> - support for '-cpu rv128' in qemu-system-riscv64 to handle 128-bit
>   executables (no more qemu-system-riscv128)
> - remove useless (and buggy) big-endian support in lq/sq
>
> v5:
> - split the memop define renaming and addition in two patches
> - 128-bit div/rem operations using host-utils functions
> - removed useless rv128 tests at various places
> - refactoring the slt/bxx part so as to share the comparison part
> - refactoring the 128-bit csr handling to share code more largely
>   Also forwarding writes to the 64-bit version when not 128-bit version
>   exists, as a vast majority of the csrs does not use the upper 64-bits
>
> v4:
> - safer and cleaner access to the gpr upper part
> - locals for load/store/div/rem helpers
> - cleans out the 128-bit div/rem code
> - corrects numerous bugs and performs optimizations on shifts and mults
> - withdraws the change in page size and the vm schemes we introduced
>
> v3:
> - v2 refactored following Richard's xl patch changes
>
> v2:
> - load and store making use of new memop.h sizes
> - use of the existing Int128 computations in helpers, and addition of
>   a few more operations there, in particular division and remainder
> - refactoring of the calls to the code generation helpers
> - split of the patch in smaller pieces
>
> v1:
> - introducing support for rv128 for basic integer and M extension insns
>
> Fr=C3=A9d=C3=A9ric P=C3=A9trot (18):
>   exec/memop: Adding signedness to quad definitions
>   exec/memop: Adding signed quad and octo defines
>   qemu/int128: addition of div/rem 128-bit operations
>   target/riscv: additional macros to check instruction support
>   target/riscv: separation of bitwise logic and arithmetic helpers
>   target/riscv: array for the 64 upper bits of 128-bit registers
>   target/riscv: setup everything for rv64 to support rv128 execution
>   target/riscv: moving some insns close to similar insns
>   target/riscv: accessors to registers upper part and 128-bit load/store
>   target/riscv: support for 128-bit bitwise instructions
>   target/riscv: support for 128-bit U-type instructions
>   target/riscv: support for 128-bit shift instructions
>   target/riscv: support for 128-bit arithmetic instructions
>   target/riscv: support for 128-bit M extension
>   target/riscv: adding high part of some csrs
>   target/riscv: helper functions to wrap calls to 128-bit csr insns
>   target/riscv: modification of the trans_csrxx for 128-bit support
>   target/riscv: actual functions to realize crs 128-bit insns
>
>  include/disas/dis-asm.h                    |   1 +
>  include/exec/memop.h                       |  15 +-
>  include/qemu/int128.h                      |  27 +
>  include/tcg/tcg-op.h                       |   4 +-
>  target/arm/translate-a32.h                 |   4 +-
>  target/riscv/cpu.h                         |  22 +
>  target/riscv/cpu_bits.h                    |   3 +
>  target/riscv/helper.h                      |   9 +
>  target/riscv/insn16.decode                 |  27 +-
>  target/riscv/insn32.decode                 |  25 +
>  accel/tcg/cputlb.c                         |  30 +-
>  accel/tcg/user-exec.c                      |   8 +-
>  disas/riscv.c                              |   5 +
>  target/alpha/translate.c                   |  32 +-
>  target/arm/helper-a64.c                    |   8 +-
>  target/arm/translate-a64.c                 |   8 +-
>  target/arm/translate-neon.c                |   6 +-
>  target/arm/translate-sve.c                 |  10 +-
>  target/arm/translate-vfp.c                 |   8 +-
>  target/arm/translate.c                     |   2 +-
>  target/cris/translate.c                    |   2 +-
>  target/hppa/translate.c                    |   4 +-
>  target/i386/tcg/mem_helper.c               |   2 +-
>  target/i386/tcg/translate.c                |  36 +-
>  target/m68k/op_helper.c                    |   2 +-
>  target/mips/tcg/translate.c                |  58 +-
>  target/mips/tcg/tx79_translate.c           |   8 +-
>  target/ppc/translate.c                     |  32 +-
>  target/riscv/cpu.c                         |  29 +
>  target/riscv/csr.c                         | 194 +++++-
>  target/riscv/gdbstub.c                     |   5 +
>  target/riscv/m128_helper.c                 | 109 +++
>  target/riscv/machine.c                     |  22 +
>  target/riscv/op_helper.c                   |  44 ++
>  target/riscv/translate.c                   | 252 ++++++-
>  target/s390x/tcg/mem_helper.c              |   8 +-
>  target/s390x/tcg/translate.c               |   8 +-
>  target/sh4/translate.c                     |  12 +-
>  target/sparc/translate.c                   |  36 +-
>  target/tricore/translate.c                 |   4 +-
>  target/xtensa/translate.c                  |   4 +-
>  tcg/tcg.c                                  |   4 +-
>  tcg/tci.c                                  |  16 +-
>  util/int128.c                              | 147 +++++
>  accel/tcg/ldst_common.c.inc                |   8 +-
>  target/mips/tcg/micromips_translate.c.inc  |  10 +-
>  target/ppc/translate/fixedpoint-impl.c.inc |  22 +-
>  target/ppc/translate/fp-impl.c.inc         |   4 +-
>  target/ppc/translate/vsx-impl.c.inc        |  42 +-
>  target/riscv/insn_trans/trans_rva.c.inc    |  22 +-
>  target/riscv/insn_trans/trans_rvb.c.inc    |  48 +-
>  target/riscv/insn_trans/trans_rvd.c.inc    |   4 +-
>  target/riscv/insn_trans/trans_rvh.c.inc    |   4 +-
>  target/riscv/insn_trans/trans_rvi.c.inc    | 730 ++++++++++++++++++---
>  target/riscv/insn_trans/trans_rvm.c.inc    | 192 +++++-
>  target/s390x/tcg/translate_vx.c.inc        |  18 +-
>  tcg/aarch64/tcg-target.c.inc               |   2 +-
>  tcg/arm/tcg-target.c.inc                   |  10 +-
>  tcg/i386/tcg-target.c.inc                  |  12 +-
>  tcg/mips/tcg-target.c.inc                  |  12 +-
>  tcg/ppc/tcg-target.c.inc                   |  16 +-
>  tcg/riscv/tcg-target.c.inc                 |   6 +-
>  tcg/s390x/tcg-target.c.inc                 |  18 +-
>  tcg/sparc/tcg-target.c.inc                 |  16 +-
>  target/riscv/meson.build                   |   1 +
>  target/s390x/tcg/insn-data.def             |  28 +-
>  util/meson.build                           |   1 +
>  67 files changed, 2006 insertions(+), 512 deletions(-)
>  create mode 100644 target/riscv/m128_helper.c
>  create mode 100644 util/int128.c
>
> --
> 2.34.1
>
>


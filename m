Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6gLA-0003QV-Jx
	for mharc-qemu-riscv@gnu.org; Sun, 09 Jan 2022 17:07:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6gL9-0003P8-NV; Sun, 09 Jan 2022 17:07:03 -0500
Received: from [2607:f8b0:4864:20::134] (port=38487
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6gL7-0005DE-TM; Sun, 09 Jan 2022 17:07:03 -0500
Received: by mail-il1-x134.google.com with SMTP id x15so9771329ilc.5;
 Sun, 09 Jan 2022 14:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9P/fuf2GjmnWdXJReah0d05JmnAIXdH1eknHxEZluCg=;
 b=PAg3xHKAEU7bBxZDJ6Y37jVCN1qX/1fFCfxKsi1brAO08H9oDnwA05a90iilo5g+Qh
 +n0SOlOCJgm349KrmEwnESSFbdAcXRE78HF5KRsq3lVt+thNy5a3wbA/zhnDeeUyqDMn
 KqfFEK4A030jDTRA091YS8E0CEuB6eMkGzkf/qY/jYPtIxdwZtL2H7q+M/2qz0bZ0uta
 37spXkPcfwCRx7OK8zsORsevwyGyeJoYfHzfeWz1K6Iyzfdhe42EpdoISnzU9n2Zj8xY
 zYrSIQPqeUd4k7m7ILM3v8yph+cw56QUhaj7fXgUONHSHt59ErZ53cqz37Hwixr69F4Z
 A86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9P/fuf2GjmnWdXJReah0d05JmnAIXdH1eknHxEZluCg=;
 b=aqal6+4BuZOqy6LoeSzVp3ZHv/dc23Y91xcoI3XcQWmtXynAkx38/C64rN5T+/RONd
 CcUEtxpcUKrEYMch3M4amelTZfBK4DcNd3OzV1aafN5w2ZE1ZRQCFasLTNY6rAyzNUfp
 657blDr9fMz3GMAoRj9Ux+B2mhkACvyFx/sI5yhoRTPOJJRkDzJSwA34Tzk/35cqLjjB
 PZd6lfLSsUO15EOb3Xsc9K9LL1/TSOumzPN9gyH+5VjHE/n7FzPSXL1LGj7l0DIiOUoK
 d9+ODfOBxz8Viwrm1IYgoW7cM8tbgQEDUODE8V4qndyX+J2Lno7aHUgB0obSY+NLccoS
 5jtQ==
X-Gm-Message-State: AOAM5302x05ORVBEIxbxqRdsFUYpdebgmGglQtjqW5CsoRb6Na+7SvZQ
 kRKp5pKLDKvpyVvGgAFf5+Nofno4/HhWIYG9lAM=
X-Google-Smtp-Source: ABdhPJy8xt6YrLePNTcH+8pqAK6S0VDxcidgUZpWjEDGVW4Rj3V1+NKGGtAOsOjbmkKXlxyApDF1BeSQWqx6SMu+7HM=
X-Received: by 2002:a05:6e02:1567:: with SMTP id
 k7mr34064713ilu.46.1641766019786; 
 Sun, 09 Jan 2022 14:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jan 2022 08:06:33 +1000
Message-ID: <CAKmqyKPPPb9qi9WcWiJefE42Q-vjy+z_+Qiy8GftjW3=qXLz=g@mail.gmail.com>
Subject: Re: [PATCH v8 00/18] Adding partial support for 128-bit riscv target
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Sun, 09 Jan 2022 22:07:04 -0000

On Fri, Jan 7, 2022 at 7:02 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> This series of patches provides partial 128-bit support for the riscv
> target architecture, namely RVI and RVM, with minimal csr support.
>
> Thanks for the reviews and advices.
>
> v8:
> - rebase on riscv-to-apply.next
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

Thanks!

Applied to riscv-to-apply.next

Alistair

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


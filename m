Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxK4a-0001K0-1l
	for mharc-qemu-riscv@gnu.org; Fri, 22 Feb 2019 18:17:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gxK4X-0001JE-4y
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 18:17:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gxK4V-0006NQ-Kw
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 18:17:36 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:37599)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gxK4V-0005r1-6K; Fri, 22 Feb 2019 18:17:35 -0500
Received: by mail-lj1-x242.google.com with SMTP id a17so2979258ljd.4;
	Fri, 22 Feb 2019 15:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZqsKhdEQrAJ9fmGVmwHLk7cXhRFNXtGR4qkcxUk6ZUs=;
	b=kWcMp8hUFMDmsIhRKGRAYonLuZTO9IHUJNyTHc15D4lbd7gD5Vdkq3xlsVz3r90S4Q
	dAo/BBuLjjkQh7vvPC3EurQrRb1/D6GMVGg7hIE21blAChNUsbxjBZjBbgNGm8Vo6C9/
	91MtvTaetunyusuqT+sf9xeVMzloF1wJwCsn36uP67B1T6Sux2Yj5D/uZEtliyj63XQn
	BJ1/keiZOq8tMtAjgXQIZCpMxWfMT5dQPjQLVnVyG7IyOdxPjpfJ81BbvMmgn5QJPxfy
	9pK6QpR7J4fAITuTVs6bTI5834f6jN1jce/PdK8Bqy6G1T70S8c4an6mTtW5TWPCKpgd
	9TMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZqsKhdEQrAJ9fmGVmwHLk7cXhRFNXtGR4qkcxUk6ZUs=;
	b=OzyxJMyqKJ/C/fSQ4T6gM3Qsgy9l3NO0Sv1Gj3yaBra+ui9KeW5xqChhVYnSm6Hjzz
	z7W6ScH53mCJQWg37+2C1oI8u9vUWVl8Oredb3uLITi42emPIgCtSo4CnHNL4/PesIow
	C71fedcDGY6A6wgbiWBazmd44fT+4qJ+lIoK7c+9D5+2QsaBsVBi8BsDTm+CbpScH8To
	t6zs2PnSy+IwMaN2Hcy+BTdFAQWFjc+rLxMXDyFQGAl75QqQ56RIsI4FOTURwj2tbn68
	17SCV1OiJ2cp+HgYBExuPJd+ygZwwthTTy151K5M2DGwA7VkYLqvwQFRm2c94S0bzCSi
	155w==
X-Gm-Message-State: AHQUAuYItItZyOc4kJLEHqqedMVY6uwPamcHTMH3wFit5VkduqIt0Qvu
	DMtDsfAWwYDu5WCqfCZ3ACOkMncu7Jzxoid+eQg=
X-Google-Smtp-Source: AHgI3IZ1RoT5DCeiUivr1Vcw172kprv5YoemUmkM8LxhqfxLYV/6JH/6P3wxj47UtccNGfcl3v3S3l4/Iaa485Q0Q5Q=
X-Received: by 2002:a2e:2419:: with SMTP id k25mr3575065ljk.38.1550877426352; 
	Fri, 22 Feb 2019 15:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20190222141024.22217-1-kbastian@mail.uni-paderborn.de>
In-Reply-To: <20190222141024.22217-1-kbastian@mail.uni-paderborn.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Feb 2019 15:16:13 -0800
Message-ID: <CAKmqyKODpLNxp93pketnjJH60iK3xJRnmoXVzjxsmGfvM_vzeQ@mail.gmail.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>,
	peer.adelt@hni.uni-paderborn.de, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v8 00/34] target/riscv:
 Convert to decodetree
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
X-List-Received-Date: Fri, 22 Feb 2019 23:17:38 -0000

On Fri, Feb 22, 2019 at 6:31 AM Bastian Koppelmann
<kbastian@mail.uni-paderborn.de> wrote:
>
> Hi,
>
> this patchset converts the RISC-V decoder to decodetree in four major steps:
>
> 1) Convert 32-bit instructions to decodetree [Patch 1-15]:
>     Many of the gen_* functions are called by the decode functions for 16-bit
>     and 32-bit functions. If we move translation code from the gen_*
>     functions to the generated trans_* functions of decode-tree, we get a lot of
>     duplication. Therefore, we mostly generate calls to the old gen_* function
>     which are properly replaced after step 2).
>
>     Each of the trans_ functions are grouped into files corresponding to their
>     ISA extension, e.g. addi which is in RV32I is translated in the file
>     'trans_rvi.inc.c'.
>
> 2) Convert 16-bit instructions to decodetree [Patch 16-18]:
>     All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
>     we convert the arguments in the 16 bit trans_ function to the arguments of
>     the corresponding 32 bit instruction and call the 32 bit trans_ function.
>
> 3) Remove old manual decoding in gen_* function [Patch 19-29]:
>     this move all manual translation code into the trans_* instructions of
>     decode tree, such that we can remove the old decode_* functions.
>
> 4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
>    by Richard. [Patch 30-34]
>
> full tree available at
> https://github.com/bkoppelmann/qemu/tree/riscv-dt-v8
>
> Cheers,
> Bastian

Tested-by: Alistair Francis <alistair.francis@wdc.com>

I haven't run any strenuous tests, but it boots 32 and 64-bit
Linux/openSBI with no issues.

Alistair

>
> v7 -> v8:
>     - add REQUIRE_EXT macro
>     - add missing RVM checks
>     - add missing RVA checks
>     - add missing RVF checks
>     - add missing RVF checks
>     - add missing RVD checks
>     - add missing RVD checks
>     - riscv_has_ext -> has_ext
>     - env->ctx->priv_version -> ctx->priv_version
>     - fixed wrongly inserted #ifdef TARGET_RISCV64 that lead to a compile error
>
>
> Bastian Koppelmann (34):
>   target/riscv: Activate decodetree and implemnt LUI & AUIPC
>   target/riscv: Convert RVXI branch insns to decodetree
>   target/riscv: Convert RV32I load/store insns to decodetree
>   target/riscv: Convert RV64I load/store insns to decodetree
>   target/riscv: Convert RVXI arithmetic insns to decodetree
>   target/riscv: Convert RVXI fence insns to decodetree
>   target/riscv: Convert RVXI csr insns to decodetree
>   target/riscv: Convert RVXM insns to decodetree
>   target/riscv: Convert RV32A insns to decodetree
>   target/riscv: Convert RV64A insns to decodetree
>   target/riscv: Convert RV32F insns to decodetree
>   target/riscv: Convert RV64F insns to decodetree
>   target/riscv: Convert RV32D insns to decodetree
>   target/riscv: Convert RV64D insns to decodetree
>   target/riscv: Convert RV priv insns to decodetree
>   target/riscv: Convert quadrant 0 of RVXC insns to decodetree
>   target/riscv: Convert quadrant 1 of RVXC insns to decodetree
>   target/riscv: Convert quadrant 2 of RVXC insns to decodetree
>   target/riscv: Remove gen_jalr()
>   target/riscv: Remove manual decoding from gen_branch()
>   target/riscv: Remove manual decoding from gen_load()
>   target/riscv: Remove manual decoding from gen_store()
>   target/riscv: Move gen_arith_imm() decoding into trans_* functions
>   target/riscv: make ADD/SUB/OR/XOR/AND insn use arg lists
>   target/riscv: Remove shift and slt insn manual decoding
>   target/riscv: Remove manual decoding of RV32/64M insn
>   target/riscv: Rename trans_arith to gen_arith
>   target/riscv: Remove gen_system()
>   target/riscv: Remove decode_RV32_64G()
>   target/riscv: Convert @cs_2 insns to share translation functions
>   target/riscv: Convert @cl_d, @cl_w, @cs_d, @cs_w insns
>   target/riscv: Splice fsw_sd and flw_ld for riscv32 vs riscv64
>   target/riscv: Splice remaining compressed insn pairs for riscv32 vs
>     riscv64
>   target/riscv: Remaining rvc insn reuse 32 bit translators
>
>  target/riscv/Makefile.objs                    |   22 +
>  target/riscv/insn16-32.decode                 |   31 +
>  target/riscv/insn16-64.decode                 |   33 +
>  target/riscv/insn16.decode                    |  114 +
>  target/riscv/insn32-64.decode                 |   72 +
>  target/riscv/insn32.decode                    |  203 ++
>  .../riscv/insn_trans/trans_privileged.inc.c   |  110 +
>  target/riscv/insn_trans/trans_rva.inc.c       |  218 ++
>  target/riscv/insn_trans/trans_rvc.inc.c       |  149 ++
>  target/riscv/insn_trans/trans_rvd.inc.c       |  442 ++++
>  target/riscv/insn_trans/trans_rvf.inc.c       |  439 ++++
>  target/riscv/insn_trans/trans_rvi.inc.c       |  568 +++++
>  target/riscv/insn_trans/trans_rvm.inc.c       |  120 +
>  target/riscv/translate.c                      | 1948 ++---------------
>  14 files changed, 2740 insertions(+), 1729 deletions(-)
>  create mode 100644 target/riscv/insn16-32.decode
>  create mode 100644 target/riscv/insn16-64.decode
>  create mode 100644 target/riscv/insn16.decode
>  create mode 100644 target/riscv/insn32-64.decode
>  create mode 100644 target/riscv/insn32.decode
>  create mode 100644 target/riscv/insn_trans/trans_privileged.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rva.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rvc.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rvd.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rvf.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rvi.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rvm.inc.c
>
> --
> 2.20.1
>
>


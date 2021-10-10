Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mZaZm-0005XA-Ui
	for mharc-qemu-riscv@gnu.org; Sun, 10 Oct 2021 11:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mZaZj-0005Wj-6F; Sun, 10 Oct 2021 11:17:19 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:58336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mZaZg-0001eB-SA; Sun, 10 Oct 2021 11:17:18 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 4DE384194D;
 Sun, 10 Oct 2021 17:17:09 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 43D0660067;
 Sun, 10 Oct 2021 17:17:09 +0200 (CEST)
Received: from [192.168.1.36] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id CA5A514005C;
 Sun, 10 Oct 2021 17:17:08 +0200 (CEST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 fabien.portas@grenoble-inp.org
References: <20211007174722.929993-1-richard.henderson@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [RFC PATCH 00/13] target/riscv: Rationalize XLEN and operand
 length
Message-ID: <20311b4d-b2a8-82e9-f6cf-4e3595e9a847@univ-grenoble-alpes.fr>
Date: Sun, 10 Oct 2021 17:17:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 10 Oct 2021 15:17:21 -0000

Le 07/10/2021 à 19:47, Richard Henderson a écrit :
> This is a partial patch set attempting to set things in the
> right direction for both the UXL and RV128 patch sets.
> 
> One of the things that struck me while reading the RV128 patches
> is the proliferation of riscv_cpu_is_<size>bits functions.  These
> should be all combined into a single function returning an enum.
> 
> Further, that the current set of tests for misa.mxl is frought
> with peril, because the location of the field within misa varies,
> and that the RV128 patch set gets some of it wrong.  It is much
> easier to split out that field for use within QEMU, and only
> reassemble the full MISA csr upon read.

  Couldn't more agree.
  The convoluted process of determining misa length seems to be here to ensure
  that there is no way for a 32-bit arch to "announce" that it is a 64-bit one.

> There are a few changes at the end for pointing the correct
> direction for how it might be best to extend expanders for
> different operand lengths.  I believe the form used in RV128,
> 
> static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
>                              void (*fn32)(TCGv, TCGv, target_long),
>                              void (*fn64)(TCGv, TCGv, target_long),
>                              void (*fn128)(TCGv, TCGv, TCGv, TCGv, target_long))
> 
> is incorrect, because it assumes that is easy to select the
> fn32 and fn64 functions.  But so long as TARGET_RISCV32 is
> still around, and target_long may be 32, that is not the case.
> Instead, pass f_tl and f_32, where f_32 will only ever be used
> when sizeof(target_ulong) > 4.

  I got the point.
  Frédéric
> 
> r~
> 
> 
> Richard Henderson (13):
>   target/riscv: Move cpu_get_tb_cpu_state out of line
>   target/riscv: Create RISCVMXL enumeration
>   target/riscv: Split misa.mxl and misa.ext
>   target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl
>   target/riscv: Add MXL/SXL/UXL to TB_FLAGS
>   target/riscv: Use REQUIRE_64BIT in amo_check64
>   target/riscv: Properly check SEW in amo_op
>   target/riscv: Replace is_32bit with get_xl/get_xlen
>   target/riscv: Replace DisasContext.w with DisasContext.ol
>   target/riscv: Use gen_arith_per_ol for RVM
>   target/riscv: Adjust trans_rev8_32 for riscv64
>   target/riscv: Use gen_unary_per_ol for RVB
>   target/riscv: Use gen_shift*_per_ol for RVB, RVI
> 
>  target/riscv/cpu.h                      |  73 +++-------
>  target/riscv/cpu_bits.h                 |   8 +-
>  hw/riscv/boot.c                         |   2 +-
>  linux-user/elfload.c                    |   2 +-
>  linux-user/riscv/cpu_loop.c             |   2 +-
>  semihosting/arm-compat-semi.c           |   2 +-
>  target/riscv/cpu.c                      |  99 ++++++++------
>  target/riscv/cpu_helper.c               |  91 ++++++++++++-
>  target/riscv/csr.c                      |  68 ++++++----
>  target/riscv/gdbstub.c                  |  10 +-
>  target/riscv/machine.c                  |  10 +-
>  target/riscv/monitor.c                  |   4 +-
>  target/riscv/translate.c                | 170 ++++++++++++++++++------
>  target/riscv/insn_trans/trans_rvb.c.inc | 140 ++++++++++---------
>  target/riscv/insn_trans/trans_rvi.c.inc |  44 +++---
>  target/riscv/insn_trans/trans_rvm.c.inc |  36 +++--
>  target/riscv/insn_trans/trans_rvv.c.inc |  29 ++--
>  17 files changed, 498 insertions(+), 292 deletions(-)
> 

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+


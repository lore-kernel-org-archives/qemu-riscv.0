Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmOC2-0007bL-2K
	for mharc-qemu-riscv@gnu.org; Thu, 27 May 2021 18:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lmOBz-0007Yl-7p; Thu, 27 May 2021 18:09:27 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:39797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lmOBx-0006OW-4x; Thu, 27 May 2021 18:09:26 -0400
Received: by mail-il1-x136.google.com with SMTP id o9so1651403ilh.6;
 Thu, 27 May 2021 15:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sSCfRQlKWQeEFJsRNm2FjjYnkNpNk0fMjKa+nhv6dn8=;
 b=h2QH52vOwhHnOvKzYTkBH1TNS2hkEB9sPs/XaTEIrGMakP/ZH3SEOntVN0iJ9WYp1V
 w6ZC1Mc7F/if7OU4kqlC8fYP2zvjtarFTJjIJsdXWCj0J2nZ7TxTbaRJs73JZWYrpdpW
 v8MolNUcvec+due4liVOtBDPhLPKPiXRa7jEd3zXO+qOKJzW9zz2kfE9Mti/pfwLpMx4
 9ZHTpx6p8/iUoJJyWZuUmskKpzvwroO8P6P/GRx3QHeT3pKA76S9W9IZNw6bdH2imbHU
 niiBMExnNxqX4l4o3TKb0ScRPSgbQdb+bYzML2mdcD6x6Axw479HObIwtmZI/6/l1rzX
 rLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sSCfRQlKWQeEFJsRNm2FjjYnkNpNk0fMjKa+nhv6dn8=;
 b=WOEuCN1KZ9G4J77q6IYdVI+hNIXzegI6nJQ7PFslhAUFoJ6ieUKqSGo6F8dmdhPsua
 CsvxPsoEd7DlqH/XkCbINsjDQmYNBH2xI0xXslX+/FVsmabVkv4Jz82BlfBqjZsgR5tI
 pI01fESKKKM/akpZB5DUi8RJSU5EDwZykrbHNs5YDyeNoG0XuaWRzpN5IkL+lW1ou6C8
 Qf/uNok05SSO7c7xTiPR0yZWz6f7NBUnDJUWeiEnHj2MZu6R/N2dosEtH7qKEoFrRo6g
 R6WnpYkyJGkbuIt6jiWeJZ8+MCakMuZKbMCPmg8wrkKXxCjKatG0ANZI8e2FS8egDs65
 ++TQ==
X-Gm-Message-State: AOAM53379Z8IVVpJWXeOADKS1TARdeVMneLtdgVLUZ7kGkivBY1up/jC
 B9SC+rd1eieKS8qoOOgL7eU8EXJfBo660T4c+PU=
X-Google-Smtp-Source: ABdhPJzMANhSRH2QMRCfaLJmi2BShkTuG82kwVVnH5FDi8lEPo6JhTKZb/+Bg2ZppW8IK6mzZZ+QKcdt7zK4qRhHopg=
X-Received: by 2002:a05:6e02:974:: with SMTP id
 q20mr4619924ilt.227.1622153363738; 
 Thu, 27 May 2021 15:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210505160620.15723-1-frank.chang@sifive.com>
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 May 2021 08:08:56 +1000
Message-ID: <CAKmqyKOFBvxxNhVhVNN+tNnS-_ed97S91UsjxriPEZi58sWHzQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/17] support subsets of bitmanip extension
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 27 May 2021 22:09:28 -0000

On Thu, May 6, 2021 at 2:11 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> This patchset implements RISC-V B-extension v0.93 version Zba, Zbb and
> Zbs subset instructions. Some Zbp instructions are also implemented as
> they have similar behavior with their Zba-, Zbb- and Zbs-family
> instructions or for Zbb pseudo instructions (e.g. rev8, orc.b).
>
> Specification:
> https://github.com/riscv/riscv-bitmanip/blob/master/bitmanip-0.93.pdf
>
> The port is available here:
> https://github.com/sifive/qemu/tree/rvb-upstream-v6
>
> To test rvb implementation, specify cpu argument with 'x-b=true' or
> 'x-b=true,bext_spec=v0.93'to enable B-extension support.
>
> Changelog:
>
> v6:
>  * rebase riscv-to-apply.next branch.
>  * remove all #ifdef TARGET_RISCV64 macros.
>
> v5:
>  * add bext_spec cpu option, default set to v0.93.
>  * rebase master branch.
>
> v4:
>  * Remove 'rd != 0' checks from immediate shift instructions.
>
> v3:
>  * Convert existing immediate shift instructions to use gen_shifti()
>    and gen_shiftiw() interfaces.
>  * Rename *u.w instructions to *.uw.
>  * Rename sb* instructions to b*.
>  * Rename pcnt* instructions to cpop*.
>
> v2:
>  * Add gen_shifti(), gen_shiftw(), gen_shiftiw() helper functions.
>  * Remove addwu, subwu and addiwu instructions as they are not longer
>    exist in latest draft.
>  * Optimize implementation with cleaner tcg ops.
>
> Frank Chang (6):
>   target/riscv: rvb: count bits set
>   target/riscv: add gen_shifti() and gen_shiftiw() helper functions
>   target/riscv: rvb: single-bit instructions
>   target/riscv: rvb: generalized reverse
>   target/riscv: rvb: generalized or-combine
>   target/riscv: rvb: add b-ext version cpu option
>
> Kito Cheng (11):
>   target/riscv: reformat @sh format encoding for B-extension
>   target/riscv: rvb: count leading/trailing zeros
>   target/riscv: rvb: logic-with-negate
>   target/riscv: rvb: pack two words into one register
>   target/riscv: rvb: min/max instructions
>   target/riscv: rvb: sign-extend instructions
>   target/riscv: rvb: shift ones
>   target/riscv: rvb: rotate (left/right)
>   target/riscv: rvb: address calculation
>   target/riscv: rvb: add/shift with prefix zero-extend
>   target/riscv: rvb: support and turn on B-extension from command line

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/bitmanip_helper.c          |  90 +++++
>  target/riscv/cpu.c                      |  27 ++
>  target/riscv/cpu.h                      |   5 +
>  target/riscv/helper.h                   |   6 +
>  target/riscv/insn32.decode              |  87 ++++-
>  target/riscv/insn_trans/trans_rvb.c.inc | 438 ++++++++++++++++++++++++
>  target/riscv/insn_trans/trans_rvi.c.inc |  54 +--
>  target/riscv/meson.build                |   1 +
>  target/riscv/translate.c                | 306 +++++++++++++++++
>  9 files changed, 958 insertions(+), 56 deletions(-)
>  create mode 100644 target/riscv/bitmanip_helper.c
>  create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc
>
> --
> 2.17.1
>
>


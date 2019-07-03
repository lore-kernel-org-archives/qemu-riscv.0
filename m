Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hinnA-0006ty-TR
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 18:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52939)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hinn7-0006qz-1X
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 18:31:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hinn5-0006Zr-1I
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 18:31:52 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:32990)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hinmo-0006Gz-Vc; Wed, 03 Jul 2019 18:31:35 -0400
Received: by mail-lf1-x144.google.com with SMTP id y17so2888956lfe.0;
 Wed, 03 Jul 2019 15:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H3YlCU/NHXEmFzhWxkb+3ZDtqrD+MnnjrDMSNBzFpMM=;
 b=jmkhNe0RHvXyV99VukYGsOnPxe7Cw7fwZwX3QOLfXhV4+vzudTYex4SKGD77SeexRd
 uNd/PqPERI6udd8RnD9qSOwLuSx+tSKr641f0v90fqcCgTZj//Pk8XI8pu8+4JTdNnDF
 jYRpvx/VUrvNuh5wr5Dfa+IyiEZVWOrElzRNc9DcSDX8siMZA4AJ9Q4GqYShehtz5ieE
 lxPkhP9zXF92PtZq/6i9wAfVrvxvTh09zY9mnxE+q/wQLJIUs6if2PvdHxSJlSQ1MuB9
 qDMfPZY9BPeHBryJPbmhTmXApaPYWzqpj0909QykF4TTIfjX+I9tVBQKd5tV2zwyiRzF
 QmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H3YlCU/NHXEmFzhWxkb+3ZDtqrD+MnnjrDMSNBzFpMM=;
 b=XfQ90Gl1GjhJbbploZ5WT1EwfKr7i8HxQppRNnp1CNAquDvJiJg8bXw61VbNngdj4t
 LRCGdmbzs0oG3MCoXtc/D2LgAtShuCxKlyYHlC/M1EKJ1NZE6vKMJx+D12eZ7UMo9xU1
 rbruQcBCTxlgxOeYB4/t3MepBAi8suLm822GpyUMP4/XqtGcsQbPv7CdHYMLypt7jyKC
 9TCUzntuEYhUDkTwAhICQ2Ngre8I0/f9XWpeJ7mwktBNND0RjWqzHg8cRvjfQKDKBXXa
 TBmbY1lPU8cEq1fc3VfQ4qVkINNbY33O01YA6MyOwM+buk1/ompxnKNqoO0QkvBbKcyL
 6RWg==
X-Gm-Message-State: APjAAAWB3yBjfaCVZJtAn7xcEDmVgPolRM4U5H5x25O1WODOJCO4HtWT
 M1FUsu7uiysuENhons+0WEOGDpmBKYIur/eEp0k=
X-Google-Smtp-Source: APXvYqxRrrXSDpS2KfQqftlIiyrwoPl+oGr7qNnVmskVkCshLFR0K4RuBREM0B87fAvI/G61GmzBEyPZpJNp9u12d94=
X-Received: by 2002:ac2:4990:: with SMTP id f16mr18646996lfl.93.1562193092432; 
 Wed, 03 Jul 2019 15:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190703190715.5328-1-jonathan@fintelia.io>
In-Reply-To: <20190703190715.5328-1-jonathan@fintelia.io>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jul 2019 15:28:27 -0700
Message-ID: <CAKmqyKOmF_bpDuXRh2euT29QouTv=7i-b=6RXvU7LerznqMCgg@mail.gmail.com>
To: Jonathan Behrens <jonathan@fintelia.io>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Disallow WFI
 instruction from U-mode
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
X-List-Received-Date: Wed, 03 Jul 2019 22:31:55 -0000

On Wed, Jul 3, 2019 at 12:07 PM Jonathan Behrens <jonathan@fintelia.io> wrote:
>
> Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>

From the text in the spec it sounds like it should be an illegal
instruction exception, at least for now (see below). Maybe it's worth
mentioning in the commit that WFI in U-Mode is allowed if it completes
within some time limit?

"
When S-mode is implemented, then executing WFI in U-mode causes an
illegal instruction excep-
tion, unless it completes within an implementation-specific, bounded
time limit. A future revision
of this specification might add a feature that allows S-mode to
selectively permit WFI in U-mode.
Such a feature would only be active when TW=0.
"

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/op_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 331cc36232..2e5a980192 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -129,10 +129,10 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>  void helper_wfi(CPURISCVState *env)
>  {
>      CPUState *cs = env_cpu(env);
> -
> -    if (env->priv == PRV_S &&
> -        env->priv_ver >= PRIV_VERSION_1_10_0 &&
> -        get_field(env->mstatus, MSTATUS_TW)) {
> +    if (!(env->priv >= PRV_S) ||
> +        (env->priv == PRV_S &&
> +         env->priv_ver >= PRIV_VERSION_1_10_0 &&
> +         get_field(env->mstatus, MSTATUS_TW))) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>      } else {
>          cs->halted = 1;
> --
> 2.22.0
>


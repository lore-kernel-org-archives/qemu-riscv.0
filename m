Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRcol-0007tX-0n
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRcoj-0007sx-1N; Wed, 31 Mar 2021 11:31:37 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:38485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRcog-0001YV-U8; Wed, 31 Mar 2021 11:31:36 -0400
Received: by mail-il1-x12b.google.com with SMTP id d10so17508575ils.5;
 Wed, 31 Mar 2021 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w+lxTM0ZRiDjg4jtqPXfgvflCapZawTFqS2rNm8U0G4=;
 b=Owir4RrECecezOrf5aTF6toA5TmxEPg/kw2xigD0IbEsQdpShGGej1ACy2tKgb8wvI
 Tzo4fP8/1saNJcWLPU9LK9Z/ZW5mZAzUksunC0qm3kBrTJYLULbZeoabNKPdst4O1F2Y
 xuTAhdfN9TWIvxpRjgxcDLhE1Vu1Yb6Do13FJmodQIBQCqKo1Qi1gUgS5x8oJKjZZybn
 8E1UakM9h/Pn3yH4uB6Aqfcr//tNctNMFmtsm7/VRbURbxKMY+Dl6qOLo+ZlafsePUWe
 725tJdDPoBaBDqIxA+AvCDo+ntGJW6xd9gVjmNDa2F55u/6jLEX70bejcT+WrSY3uejv
 s26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+lxTM0ZRiDjg4jtqPXfgvflCapZawTFqS2rNm8U0G4=;
 b=m8EZKQtugqnR2ct4zb+NAicPEa2fYw/ePqCtMY18tFiVSV9ZI31Ry2pdPqvNLuHcZg
 0xk2g0BXs0wW52qcSZTlFcn/vlDHl1bnZ6JkJXf52RQ0m+XEhDf9lGw3PO+Akj5qYF+e
 2CPd7Bk+oxbblZG4CHOOuLqFvUNRSJDuYmfFEq2/xm7ZsEalL5qmZSwz2NA4xoiqmJh7
 PNSVeeKyw1JbAvuMHSX7rE3ES4zJJA7HgmAt0NwVQP8whKdUvUzrGxo0JBqXowlEDDAG
 pcozuOAoSU19it0P5BGwbQfgb6vVfbycxrGAU/FBuWjUHKlUP1exFnpPzGA4nweu+Nxl
 UGfA==
X-Gm-Message-State: AOAM532duV5H4ZsH+lCi+4SH1nn38qDFM8ss7Su88qIv3w1svDJzjIjk
 xp1p+DCSR52HbvvnN0kSEdVl8uExduzldRuot0luhplN1ug=
X-Google-Smtp-Source: ABdhPJw0mPxLFIz8tqPpGsKY+D9nQwpr4JZ3djcc1jwJreKT+A4QGxU0VYpbNL/9pwEJXfNJTaxxj+qIE2UlhWZkMBw=
X-Received: by 2002:a92:cbc8:: with SMTP id s8mr2938113ilq.227.1617204693306; 
 Wed, 31 Mar 2021 08:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210319194534.2082397-1-atish.patra@wdc.com>
 <20210319194534.2082397-3-atish.patra@wdc.com>
In-Reply-To: <20210319194534.2082397-3-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:29:21 -0400
Message-ID: <CAKmqyKMAowLxf3my9t+YfZsExir-vtktTrV6Gs0MU8pvZrfkQg@mail.gmail.com>
Subject: Re: [ RFC 2/6] target/riscv: Implement mcountinhibit CSR
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 15:31:37 -0000

On Fri, Mar 19, 2021 at 3:46 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> As per the privilege specification v1.11, mcountinhibit allows to start/stop
> a pmu counter selectively.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  target/riscv/cpu.h      |  2 ++
>  target/riscv/cpu_bits.h |  4 ++++
>  target/riscv/csr.c      | 23 +++++++++++++++++++++++
>  target/riscv/machine.c  |  1 +
>  4 files changed, 30 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7bee351f3c99..ef2a7fdc3980 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -214,6 +214,8 @@ struct CPURISCVState {
>      target_ulong scounteren;
>      target_ulong mcounteren;
>
> +    target_ulong mcountinhibit;
> +
>      target_ulong sscratch;
>      target_ulong mscratch;
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index b42dd4f8d8b1..7514d611cd0b 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -283,6 +283,10 @@
>  #define CSR_MHPMCOUNTER29   0xb1d
>  #define CSR_MHPMCOUNTER30   0xb1e
>  #define CSR_MHPMCOUNTER31   0xb1f
> +
> +/* Machine counter-inhibit register */
> +#define CSR_MCOUNTINHIBIT   0x320
> +
>  #define CSR_MHPMEVENT3      0x323
>  #define CSR_MHPMEVENT4      0x324
>  #define CSR_MHPMEVENT5      0x325
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 7166f8d710a8..b9d795389532 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -631,6 +631,26 @@ static int write_mtvec(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> +static int read_mcountinhibit(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> +        return -RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    *val = env->mcountinhibit;
> +    return 0;
> +}
> +
> +static int write_mcountinhibit(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> +        return -RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    env->mcountinhibit = val;
> +    return 0;
> +}

This will probably need a rebase as a large change to CSR access
functions is in the works.

> +
>  static int read_mcounteren(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      *val = env->mcounteren;
> @@ -1533,6 +1553,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  any,    read_zero },
>      [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  any,    read_zero },
>
> +    [CSR_MCOUNTINHIBIT]  = { "mcountinhibi",   any,    read_mcountinhibit,
> +                                                       write_mcountinhibit },
> +
>      [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
>      [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
>      [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 27fcc770aa4b..cb7ec8a4c656 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -177,6 +177,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.mtval, RISCVCPU),
>          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
> +        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>          VMSTATE_UINT64(env.mfromhost, RISCVCPU),

A bump will be required here.

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> --
> 2.25.1
>
>


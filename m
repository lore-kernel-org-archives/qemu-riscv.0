Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhRBl-0002ye-36
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 02:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mhRBi-0002yP-QG; Mon, 01 Nov 2021 02:52:58 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:34553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mhRBf-0006Rm-MD; Mon, 01 Nov 2021 02:52:58 -0400
Received: by mail-il1-x12c.google.com with SMTP id j28so11045571ila.1;
 Sun, 31 Oct 2021 23:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VQH/THpJDcMUNqxUgMLhlp1mvyPHmHwIXU71tf1IL9I=;
 b=D1uPGjOnAGt1xlkoZ0CjBX05lPrBeGlEPdT3X3CnTeZVWl35YR1qWNla7QGFRTGJHl
 v/++1IcReDx0GEUH1gUYpTkqwiPFczHC8F58dGViWTiOG/NrWVOVxLrHKFH+LtGF5YGk
 dxTt75ZPdyAmPOtwOzxJhCUtTjO9FsGHaXpn91rF1MK7AuuhROtN+N+Sx4oK7nfEfP9e
 upT5ClwPPPeGSqpKmWErX7TFI6I1GwNjUFhVZpRLyZTL0jbMW+5RNi6/lI8pPdYt5k+4
 bIABznMiqWF2NI7/s08TFIdWlKCOEhxgnMJF450sWiPmTYkH8jbiJ/NygSIlJxid8vBH
 KMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VQH/THpJDcMUNqxUgMLhlp1mvyPHmHwIXU71tf1IL9I=;
 b=cLT0rZr4WyAgF3MWTB1CUuZvLrxwt0ZwSFrYtpcf0eHD7zZuEuDgZ+Aoo0aTxQy5+W
 f5cCFYRBU0SdKbBIvoErlVUg/3MD5prYs571yVSlx2nTSTI6/1bO1Aq0LdXySwIzwfBq
 qvK0ASMMfD7jqElq4j9JXTFvJbmL8Lnr2FQ94gf8XOGjZSigKVZAZjx5YhPCPFsZoIJe
 kx5+enuCAKy7JnVvMWfblOZm5IlU9GdLs7fEdMKGlJaXo+kaVD+Ii62j4rsDD268jgYR
 D8wkC0VyZGSAATtwHCY0Wz2KCQW5Gc3rw6ddNFnkmfe4b5lsEiXfJ/4Fi3J1gi2Ke+0a
 UNKQ==
X-Gm-Message-State: AOAM531JDUdkQB/uEczYeYPxQ+P8dDolxcdJi4Rir29VHhv7pFVu8DUv
 uA5r/Ax2d4+1jiy2tIAUvsfeDKXEg5WFFJkF8uE=
X-Google-Smtp-Source: ABdhPJzEa03Qs85lvqaBNXWjPFs09OTlW3TMQuLztr+B1ly8znt272TEmGRFR/mr2oq0FZMjV5Cg6Oj0PQR8r4/Hrno=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr18923825ilo.208.1635749573604; 
 Sun, 31 Oct 2021 23:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211030030606.32297-1-bmeng.cn@gmail.com>
In-Reply-To: <20211030030606.32297-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Nov 2021 16:52:27 +1000
Message-ID: <CAKmqyKMHzqfyTN4AzACe_-j+1+FrcrvaPmcYTrAOubFuQJoaUQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: machine: Sort the .subsections
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Mon, 01 Nov 2021 06:52:59 -0000

On Sat, Oct 30, 2021 at 1:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Move the codes around so that the order of .subsections matches
> the one they are referenced in vmstate_riscv_cpu.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/machine.c | 92 +++++++++++++++++++++---------------------
>  1 file changed, 46 insertions(+), 46 deletions(-)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 7b4c739564..ad8248ebfd 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -76,20 +76,50 @@ static bool hyper_needed(void *opaque)
>      return riscv_has_ext(env, RVH);
>  }
>
> -static bool vector_needed(void *opaque)
> -{
> -    RISCVCPU *cpu = opaque;
> -    CPURISCVState *env = &cpu->env;
> +static const VMStateDescription vmstate_hyper = {
> +    .name = "cpu/hyper",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = hyper_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINTTL(env.hstatus, RISCVCPU),
> +        VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
> +        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
> +        VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
> +        VMSTATE_UINTTL(env.htval, RISCVCPU),
> +        VMSTATE_UINTTL(env.htinst, RISCVCPU),
> +        VMSTATE_UINTTL(env.hgatp, RISCVCPU),
> +        VMSTATE_UINT64(env.htimedelta, RISCVCPU),
>
> -    return riscv_has_ext(env, RVV);
> -}
> +        VMSTATE_UINT64(env.vsstatus, RISCVCPU),
> +        VMSTATE_UINTTL(env.vstvec, RISCVCPU),
> +        VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
> +        VMSTATE_UINTTL(env.vsepc, RISCVCPU),
> +        VMSTATE_UINTTL(env.vscause, RISCVCPU),
> +        VMSTATE_UINTTL(env.vstval, RISCVCPU),
> +        VMSTATE_UINTTL(env.vsatp, RISCVCPU),
>
> -static bool pointermasking_needed(void *opaque)
> +        VMSTATE_UINTTL(env.mtval2, RISCVCPU),
> +        VMSTATE_UINTTL(env.mtinst, RISCVCPU),
> +
> +        VMSTATE_UINTTL(env.stvec_hs, RISCVCPU),
> +        VMSTATE_UINTTL(env.sscratch_hs, RISCVCPU),
> +        VMSTATE_UINTTL(env.sepc_hs, RISCVCPU),
> +        VMSTATE_UINTTL(env.scause_hs, RISCVCPU),
> +        VMSTATE_UINTTL(env.stval_hs, RISCVCPU),
> +        VMSTATE_UINTTL(env.satp_hs, RISCVCPU),
> +        VMSTATE_UINT64(env.mstatus_hs, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static bool vector_needed(void *opaque)
>  {
>      RISCVCPU *cpu = opaque;
>      CPURISCVState *env = &cpu->env;
>
> -    return riscv_has_ext(env, RVJ);
> +    return riscv_has_ext(env, RVV);
>  }
>
>  static const VMStateDescription vmstate_vector = {
> @@ -108,6 +138,14 @@ static const VMStateDescription vmstate_vector = {
>          }
>  };
>
> +static bool pointermasking_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    return riscv_has_ext(env, RVJ);
> +}
> +
>  static const VMStateDescription vmstate_pointermasking = {
>      .name = "cpu/pointer_masking",
>      .version_id = 1,
> @@ -126,44 +164,6 @@ static const VMStateDescription vmstate_pointermasking = {
>      }
>  };
>
> -static const VMStateDescription vmstate_hyper = {
> -    .name = "cpu/hyper",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> -    .needed = hyper_needed,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_UINTTL(env.hstatus, RISCVCPU),
> -        VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
> -        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
> -        VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
> -        VMSTATE_UINTTL(env.htval, RISCVCPU),
> -        VMSTATE_UINTTL(env.htinst, RISCVCPU),
> -        VMSTATE_UINTTL(env.hgatp, RISCVCPU),
> -        VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> -
> -        VMSTATE_UINT64(env.vsstatus, RISCVCPU),
> -        VMSTATE_UINTTL(env.vstvec, RISCVCPU),
> -        VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
> -        VMSTATE_UINTTL(env.vsepc, RISCVCPU),
> -        VMSTATE_UINTTL(env.vscause, RISCVCPU),
> -        VMSTATE_UINTTL(env.vstval, RISCVCPU),
> -        VMSTATE_UINTTL(env.vsatp, RISCVCPU),
> -
> -        VMSTATE_UINTTL(env.mtval2, RISCVCPU),
> -        VMSTATE_UINTTL(env.mtinst, RISCVCPU),
> -
> -        VMSTATE_UINTTL(env.stvec_hs, RISCVCPU),
> -        VMSTATE_UINTTL(env.sscratch_hs, RISCVCPU),
> -        VMSTATE_UINTTL(env.sepc_hs, RISCVCPU),
> -        VMSTATE_UINTTL(env.scause_hs, RISCVCPU),
> -        VMSTATE_UINTTL(env.stval_hs, RISCVCPU),
> -        VMSTATE_UINTTL(env.satp_hs, RISCVCPU),
> -        VMSTATE_UINT64(env.mstatus_hs, RISCVCPU),
> -
> -        VMSTATE_END_OF_LIST()
> -    }
> -};
> -
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
>      .version_id = 3,
> --
> 2.25.1
>
>


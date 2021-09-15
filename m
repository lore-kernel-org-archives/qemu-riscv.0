Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQWEh-0002jW-UA
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 10:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQWEe-0002iC-6x; Wed, 15 Sep 2021 10:50:04 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:33472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQWEb-0000ME-Gi; Wed, 15 Sep 2021 10:50:03 -0400
Received: by mail-yb1-xb35.google.com with SMTP id s16so6408069ybe.0;
 Wed, 15 Sep 2021 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qStJ1ooB4bGc5JpNas5FqwAy4eCj5XhqaxmIBZugod4=;
 b=Y0GMDzPpwT58xAv2t8TEtXyrJ1ES8ITGJAONUZssRqDtm0l/DPBXai2WS61vdhEdso
 16MBzLsv3cfSaqIToDqGHz2ZNkgH5/pUE0fSGW21nfPrgxoNq3ViojvC85ZJLRf+Tiok
 lJG5GBcCtUiApltLKelWokrgwbkg4jNrWVR0jHmpscPjfFk2x/XV4L9ioxeDuwr0v+qH
 EXc7+JvJENbGuQz2YgZTareQpUswbhptWxDTQkcY5hGKx7q5iuRAudvo6DO4unR0NaMi
 VJi/2wbnHXo8lLyDQdILC74KAkEkWFQUv9CjYsRix27M1U/mn7/bSZl5O4r5QpsI/zwX
 dsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qStJ1ooB4bGc5JpNas5FqwAy4eCj5XhqaxmIBZugod4=;
 b=VcGGYS3CHZpMwSx7jZSYrci66vejn6ikkJNmovVemBw+bIB/T4qIZTWaepuuUgqmEB
 +typLj8jnpakDSzmmrPoXepuqupctukTqgvhBRA80+HoZsb9UFJSx6s3ZNYoMt4AhRyZ
 nxSoc19a5VrU9u7jXJuKW4ZCXK/hGEQ31VAP4LGSIIY07sschRnfytEYDOxFJos8FVTr
 2RVgQOS0ND5KptfAkjSl9h8v4rIXpB51NsvZBEX3PigsMu0KEfzpflAbRmx5d2iO437x
 0C+t+as5W+Ey+6F8kt65fvUA7diWcTee03b8i7e8fbp+6ldE1cBQHEGJGOJKUYZThZYq
 gMEA==
X-Gm-Message-State: AOAM532NEs/JXJC6NaejbD23wuh5f5zosqGEUe7vWhbncUq8r8aWgkLg
 fq23QaX3y+9mGXC40b5ujlWCeUL5rmvbup/BI+A=
X-Google-Smtp-Source: ABdhPJychSQV6tz0mjLW3B3yLHHJ5MVsPhxr4SvMW4CMVjlObfYwHtQ1vPl5N6XHJTk3mBI8uCNxnXoZ1+ROZL8OEjI=
X-Received: by 2002:a25:ad52:: with SMTP id l18mr416240ybe.453.1631717400231; 
 Wed, 15 Sep 2021 07:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210909202639.1230170-1-atish.patra@wdc.com>
 <20210909202639.1230170-2-atish.patra@wdc.com>
In-Reply-To: <20210909202639.1230170-2-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Sep 2021 22:49:48 +0800
Message-ID: <CAEUhbmXEiLiskioH=ZZa7W=naZHWC8288GAkbeakTfC21MEAUg@mail.gmail.com>
Subject: Re: [ RFC v2 1/9] target/riscv: Fix PMU CSR predicate function
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 15 Sep 2021 14:50:06 -0000

On Fri, Sep 10, 2021 at 4:27 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, the predicate function for PMU related CSRs only works if
> virtualization is enabled. Ideally, they should check the mcountern
> bits before cycle/minstret/hpmcounterx access. The predicate function
> also calculates the counter index incorrectly for hpmcounterx.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  target/riscv/csr.c | 62 +++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 58 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9a4ed18ac597..0515d851b948 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -62,12 +62,64 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>  #if !defined(CONFIG_USER_ONLY)
>      CPUState *cs = env_cpu(env);
>      RISCVCPU *cpu = RISCV_CPU(cs);
> +    int ctr_index;
>
>      if (!cpu->cfg.ext_counters) {
>          /* The Counters extensions is not enabled */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +    if (env->priv == PRV_S) {
> +        switch (csrno) {
> +        case CSR_CYCLE:
> +            if (!get_field(env->mcounteren, HCOUNTEREN_CY)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +            break;
> +        case CSR_TIME:
> +            if (!get_field(env->mcounteren, HCOUNTEREN_TM)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +            break;
> +        case CSR_INSTRET:
> +            if (!get_field(env->mcounteren, HCOUNTEREN_IR)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +            break;
> +        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> +            ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
> +            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +            break;
> +        }
> +        if (riscv_cpu_is_32bit(env)) {
> +            switch (csrno) {
> +            case CSR_CYCLEH:
> +                if (!get_field(env->mcounteren, HCOUNTEREN_CY)) {
> +                    return RISCV_EXCP_ILLEGAL_INST;
> +                }
> +                break;
> +            case CSR_TIMEH:
> +                if (!get_field(env->mcounteren, HCOUNTEREN_TM)) {
> +                    return RISCV_EXCP_ILLEGAL_INST;
> +                }
> +                break;
> +            case CSR_INSTRETH:
> +                if (!get_field(env->mcounteren, HCOUNTEREN_IR)) {
> +                    return RISCV_EXCP_ILLEGAL_INST;
> +                }
> +                break;
> +            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> +                ctr_index = csrno - CSR_HPMCOUNTER3H + 3;
> +                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> +                    return RISCV_EXCP_ILLEGAL_INST;
> +                }
> +                break;
> +            }
> +        }
> +    }
> +
>      if (riscv_cpu_virt_enabled(env)) {
>          switch (csrno) {
>          case CSR_CYCLE:
> @@ -89,8 +141,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>              }
>              break;
>          case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
> -                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
> +            ctr_index = csrno - CSR_HPMCOUNTER3 + 3;

ctr_index = csrno - CSR_CYCLE;

> +            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> +                get_field(env->mcounteren, 1 << ctr_index)) {

This fix (along with the H part below) should be put in a separate patch.

>                  return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>              }
>              break;
> @@ -116,8 +169,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>                  }
>                  break;
>              case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
> -                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
> +                ctr_index = csrno - CSR_HPMCOUNTER3H + 3;

ctr_index = csrno - CSR_CYCLEH;

> +                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> +                    get_field(env->mcounteren, 1 << ctr_index)) {
>                      return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>                  }
>                  break;
> --

You may need to rebase the patch on:
http://patchwork.ozlabs.org/project/qemu-devel/patch/20210915084601.24304-1-bmeng.cn@gmail.com/

Regards,
Bin


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGU4F-0006Hy-Tl
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jul 2022 19:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oGU4E-0006GL-F3
 for qemu-riscv@nongnu.org; Tue, 26 Jul 2022 19:34:22 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:41632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oGU4C-0000ms-L7
 for qemu-riscv@nongnu.org; Tue, 26 Jul 2022 19:34:22 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id y127so671027yby.8
 for <qemu-riscv@nongnu.org>; Tue, 26 Jul 2022 16:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rcv3BerRzS8DVpOuhoIas8P0MgVMpBkfWmBlnwFf+74=;
 b=GryJORAi3eCWU6SwjTigrM6r/SQPQrFsyklQHBkI2kUbR6gMHS2HALlgH2hWZnRGCB
 +/R/CoGHM5KIwFtQINiy9BCrNDVqutOOBrbxVW49OuYJ1QGzyoxPKj7T0sZoyPYJ4SJJ
 5XdcNXIcxUdZ38mbq2ssHLAbb7YIh9OQQv4Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rcv3BerRzS8DVpOuhoIas8P0MgVMpBkfWmBlnwFf+74=;
 b=EjPu77YijeRSvRXe8cA21DjGWY3mk2coS+U2yig+rnjaC4BOEClXhsnUOaKQR6bSOh
 pAi2xpnYjVryfabAe/1PSQ+28pmZLEeraxWt7vtDL0EL/mXBnSEMI2xSz2GNz/PuuvaP
 n4OQx46CI8JXsvGG/3X8Zd67K42BN4zH3PH3/c/+e6BsPMc9I6mSMsQ3gbFqT7xZS7Yq
 SZ5FAJeTFgSwMEuJy7zYdzVjB6LAYMM0kofozKWo8axguDK0l9ruMus6xMIMveFZBM0p
 01BVQalhnUmKC8d/KuFX3tKFEEgpkSbHje/lZB/PHdy4IE5Cwpu2nPnK4LxFTHArdx03
 wRog==
X-Gm-Message-State: AJIora94b9a7fYuIjBFZQGPnOofYPw6bagxPaoWzeIAN5NaDlGoLxguq
 iom6tzJdKLb1ZLEL47XYXVqJaxOi7wiLaXxUH54J
X-Google-Smtp-Source: AGRyM1uzhTuNY9aWPp59X9u3/Y95iBOoLJQmYnDQC8yhDQkppOdo6FSdeymYwaFcvsLUdT/+915/b96NzSG40VZOLzw=
X-Received: by 2002:a25:e687:0:b0:671:7972:45a7 with SMTP id
 d129-20020a25e687000000b00671797245a7mr3516308ybh.301.1658878459321; Tue, 26
 Jul 2022 16:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220702134149.14384-1-liweiwei@iscas.ac.cn>
 <CAKmqyKNoijHZENxw4dtAK9BfA_-kT8vShrKaC6oero8K4BUCjQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNoijHZENxw4dtAK9BfA_-kT8vShrKaC6oero8K4BUCjQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 26 Jul 2022 16:34:07 -0700
Message-ID: <CAOnJCUJzVwAC7YNQipLV=e+R8D6VYTOOKqoM74Edf3wO3_=MSg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix csr check for cycle{h}, instret{h},
 time{h}, hpmcounter3~31{h}
To: Alistair Francis <alistair23@gmail.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, Atish Patra <atishp@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 26 Jul 2022 23:34:22 -0000

On Wed, Jul 20, 2022 at 9:32 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jul 2, 2022 at 11:42 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> >
> > - improve the field extract progress

This part is already improved with the PMU series.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg895143.html

> > - add stand-alone check for mcuonteren when in less-privileged mode
> > - add check for scounteren when 'S' is enabled and current priv is PRV_U
> >

These two parts are fine. I am resending the remaining patches for the
PMU series.
Can you please rebase your top and resend it ?

> > Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> > Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>
> + Atish
>
> Alistair
>
> > ---
> >  target/riscv/csr.c | 76 ++++++++++++++--------------------------------
> >  1 file changed, 22 insertions(+), 54 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 6dbe9b541f..a4719cbf35 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -72,66 +72,34 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> >  #if !defined(CONFIG_USER_ONLY)
> >      CPUState *cs = env_cpu(env);
> >      RISCVCPU *cpu = RISCV_CPU(cs);
> > +    uint32_t field = 0;
> >
> >      if (!cpu->cfg.ext_counters) {
> >          /* The Counters extensions is not enabled */
> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> > -    if (riscv_cpu_virt_enabled(env)) {
> > -        switch (csrno) {
> > -        case CSR_CYCLE:
> > -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> > -                get_field(env->mcounteren, COUNTEREN_CY)) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        case CSR_TIME:
> > -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> > -                get_field(env->mcounteren, COUNTEREN_TM)) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        case CSR_INSTRET:
> > -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> > -                get_field(env->mcounteren, COUNTEREN_IR)) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > -            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
> > -                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        }
> > -        if (riscv_cpu_mxl(env) == MXL_RV32) {
> > -            switch (csrno) {
> > -            case CSR_CYCLEH:
> > -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> > -                    get_field(env->mcounteren, COUNTEREN_CY)) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            case CSR_TIMEH:
> > -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> > -                    get_field(env->mcounteren, COUNTEREN_TM)) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            case CSR_INSTRETH:
> > -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> > -                    get_field(env->mcounteren, COUNTEREN_IR)) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > -                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
> > -                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            }
> > +    if (csrno <= CSR_HPMCOUNTER31 && csrno >= CSR_CYCLE) {
> > +        field = 1 << (csrno - CSR_CYCLE);
> > +    } else if (riscv_cpu_mxl(env) == MXL_RV32 && csrno <= CSR_HPMCOUNTER31H &&
> > +               csrno >= CSR_CYCLEH) {
> > +        field = 1 << (csrno - CSR_CYCLEH);
> > +    }
> > +
> > +    if (env->priv < PRV_M && !get_field(env->mcounteren, field)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    if (riscv_cpu_virt_enabled(env) && !get_field(env->hcounteren, field)) {
> > +        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +    }
> > +
> > +    if (riscv_has_ext(env, RVS) && env->priv == PRV_U &&
> > +        !get_field(env->scounteren, field)) {
> > +        if (riscv_cpu_virt_enabled(env)) {
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        } else {
> > +            return RISCV_EXCP_ILLEGAL_INST;
> >          }
> >      }
> >  #endif
> > --
> > 2.17.1
> >
> >



-- 
Regards,
Atish


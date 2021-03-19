Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNF4M-0006Ee-Ff
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 09:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNF4L-0006DI-Bn; Fri, 19 Mar 2021 09:21:37 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:40690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNF4J-00018o-Jp; Fri, 19 Mar 2021 09:21:37 -0400
Received: by mail-io1-xd2e.google.com with SMTP id n21so6052677ioa.7;
 Fri, 19 Mar 2021 06:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++Z38bUDmjdlkNq/p1hoVrT/IkJ4Xazd/E5q+kr8MgQ=;
 b=uHSVTD1Gtw2WgAxOd3oM3MQYyCiso0k4GIvaaPNu/ySRB8AKsXoI2ViV1u5aD+VtbU
 CZAomVl9JhyUsO9QKN50lEr4eQUTIzoy1qTIwNvSNBn4GAaRck1fNXu7hW2JwNvTrNC8
 hYkj/b8/mmGLQDlMZ27JM+9Fpcap+XFNsggwpPDmrDLF1WgGzBFTlRlbXM9HIIOrzMeI
 512DwL4v7Y99nI/UDWRwzYN7Q3/R3zSLEoZWmdiJFzavVLE9e+wXWedujoSvkNvQAg5e
 Z6wwXKt+2HySwtxxmGcmL2jB1DQdD0kuzndmPokVRpBk/lTWy82Nox9tB/m/5qfLelG8
 FVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++Z38bUDmjdlkNq/p1hoVrT/IkJ4Xazd/E5q+kr8MgQ=;
 b=ZAMRbDIDY7m2uHFmj/JgFcq7QpF78yCeaqcqOIsFkUKK4lH0hah05SE4xGfnlX9k5Z
 7H5cSFoT9vqGdzMDYeUTtXMmhWdO01DTtHMAF5hs7+jjf02gjnRE9FLpn/eDxXWBQEyC
 VECimwSl62mMswjZfg5KD3VvOegis/VD9NnVNdwxRrzy1FoFIVqme3FoL7simwvZorsN
 pL5fcuQWvEXCRXbLDgf8Vb4kwO33P5BIOfU2BCoP+aV2YKyFRdkC0vra5K4YMg6Jc+tJ
 ss3QgLWARs6uDVgMfovLKcpT0HnDfBc6QYciTShxLlv1nj1AcIOFWTHyHQViDeQ5qeRJ
 xrXQ==
X-Gm-Message-State: AOAM533rm+Ri5MpBaOebx4wykx1Z33y7Wk62eZX/jf0GYBLqX3bXc+hF
 FZVhBLnDe83thgalLajP9Ax6IJuORtIPBAaas1s=
X-Google-Smtp-Source: ABdhPJxqLx3NWR8P/xSVhfVy92IYLdxCX2TD9zKwgNodMV2bR3TrTHddOz3JSHhwr8a1PyZaLiBQ5D89fSa3oNv+v8g=
X-Received: by 2002:a5d:878e:: with SMTP id f14mr2773777ion.176.1616160094086; 
 Fri, 19 Mar 2021 06:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616002766.git.alistair.francis@wdc.com>
 <685a79eb7992d8b780570501cdb784b607144f02.1616002766.git.alistair.francis@wdc.com>
 <CAEUhbmVCmjFWs1SMh6ZLggC-i6wqXxwt9E6L_aXNuQvX8tPnuA@mail.gmail.com>
In-Reply-To: <CAEUhbmVCmjFWs1SMh6ZLggC-i6wqXxwt9E6L_aXNuQvX8tPnuA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Mar 2021 09:19:45 -0400
Message-ID: <CAKmqyKOuSb3TQ6_8KG9bpg6+E3huYeNSmrGJ656_-duQ9phM2A@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] target/riscv: Convert the RISC-V exceptions to an
 enum
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Fri, 19 Mar 2021 13:21:37 -0000

On Wed, Mar 17, 2021 at 9:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Mar 18, 2021 at 1:41 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu_bits.h   | 44 ++++++++++++++++++++-------------------
> >  target/riscv/cpu.c        |  2 +-
> >  target/riscv/cpu_helper.c |  4 ++--
> >  3 files changed, 26 insertions(+), 24 deletions(-)
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index caf4599207..8ae404c32a 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -527,27 +527,29 @@
> >  #define DEFAULT_RSTVEC      0x1000
> >
> >  /* Exception causes */
> > -#define EXCP_NONE                                -1 /* sentinel value */
> > -#define RISCV_EXCP_INST_ADDR_MIS                 0x0
> > -#define RISCV_EXCP_INST_ACCESS_FAULT             0x1
> > -#define RISCV_EXCP_ILLEGAL_INST                  0x2
> > -#define RISCV_EXCP_BREAKPOINT                    0x3
> > -#define RISCV_EXCP_LOAD_ADDR_MIS                 0x4
> > -#define RISCV_EXCP_LOAD_ACCESS_FAULT             0x5
> > -#define RISCV_EXCP_STORE_AMO_ADDR_MIS            0x6
> > -#define RISCV_EXCP_STORE_AMO_ACCESS_FAULT        0x7
> > -#define RISCV_EXCP_U_ECALL                       0x8
> > -#define RISCV_EXCP_S_ECALL                      0x9
> > -#define RISCV_EXCP_VS_ECALL                      0xa
> > -#define RISCV_EXCP_M_ECALL                       0xb
> > -#define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
> > -#define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
> > -#define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
> > -#define RISCV_EXCP_SEMIHOST                      0x10
> > -#define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
> > -#define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
> > -#define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
> > -#define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT  0x17
> > +typedef enum RiscVException {
>
> nits: looking at other places in the RISC-V codes, I believe it's
> better to name it "RISCVException"

I agree, I have fixed the name.

>
> > +    RISCV_EXCP_NONE = -1, /* sentinel value */
> > +    RISCV_EXCP_INST_ADDR_MIS = 0x0,
> > +    RISCV_EXCP_INST_ACCESS_FAULT = 0x1,
> > +    RISCV_EXCP_ILLEGAL_INST = 0x2,
> > +    RISCV_EXCP_BREAKPOINT = 0x3,
> > +    RISCV_EXCP_LOAD_ADDR_MIS = 0x4,
> > +    RISCV_EXCP_LOAD_ACCESS_FAULT = 0x5,
> > +    RISCV_EXCP_STORE_AMO_ADDR_MIS = 0x6,
> > +    RISCV_EXCP_STORE_AMO_ACCESS_FAULT = 0x7,
> > +    RISCV_EXCP_U_ECALL = 0x8,
> > +    RISCV_EXCP_S_ECALL = 0x9,
> > +    RISCV_EXCP_VS_ECALL = 0xa,
> > +    RISCV_EXCP_M_ECALL = 0xb,
> > +    RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
> > +    RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
> > +    RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
> > +    RISCV_EXCP_SEMIHOST = 0x10,
> > +    RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
> > +    RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT = 0x15,
> > +    RISCV_EXCP_VIRT_INSTRUCTION_FAULT = 0x16,
> > +    RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT = 0x17,
> > +} RiscVException;
> >
> >  #define RISCV_EXCP_INT_FLAG                0x80000000
> >  #define RISCV_EXCP_INT_MASK                0x7fffffff
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 2a990f6253..63584b4a20 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -357,7 +357,7 @@ static void riscv_cpu_reset(DeviceState *dev)
> >      env->mcause = 0;
> >      env->pc = env->resetvec;
> >  #endif
> > -    cs->exception_index = EXCP_NONE;
> > +    cs->exception_index = RISCV_EXCP_NONE;
> >      env->load_res = -1;
> >      set_default_nan_mode(1, &env->fp_status);
> >  }
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 83a6bcfad0..af702f65b1 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -72,7 +72,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> >      if (irqs) {
> >          return ctz64(irqs); /* since non-zero */
> >      } else {
> > -        return EXCP_NONE; /* indicates no pending interrupt */
> > +        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
> >      }
> >  }
> >  #endif
> > @@ -1017,5 +1017,5 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >       */
> >
> >  #endif
> > -    cs->exception_index = EXCP_NONE; /* mark handled to qemu */
> > +    cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
> >  }
> > --
>
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Alistair


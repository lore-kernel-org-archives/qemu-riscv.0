Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNrBd-0003js-Ht
	for mharc-qemu-riscv@gnu.org; Tue, 16 Aug 2022 03:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oNrBY-0003ho-Pi
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 03:40:25 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oNrBV-0005U0-E4
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 03:40:24 -0400
Received: by mail-pg1-x536.google.com with SMTP id d71so8551058pgc.13
 for <qemu-riscv@nongnu.org>; Tue, 16 Aug 2022 00:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ymPL6R/7hhQxMF8ZNEadR4cmLBuGjEyRhfwfsCxxdlQ=;
 b=VUMhh0LgprH/jQjM4T6LIRHFBmXIenpoWzJDNTsD46u+Z619IAzwKfqxBD/T62XwKX
 wwOa0SgocgnMQILd7CGutuv653tQKgBLk/J7b5+bI1OCJixKvW6H9UVH3IkVsGMCrPnV
 EO4RmJYnE1TJbD1/cFHrpmyO9a29JeDqj1m3bNmbDiTThOe+e2CWwu3uVWCfHtqazB8z
 8iwema2ldMMeSOO2xwSaQay03/ZllqIiSXB63XKBuI6SDZxDPb98WnqsVaPdYALMK+aO
 +amIR3/bGHxH2uWarw488DvU6p7b6VjdZpODNjtBF+2Ow1GryjD0u83PW6axy5V4eLPh
 XqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ymPL6R/7hhQxMF8ZNEadR4cmLBuGjEyRhfwfsCxxdlQ=;
 b=L0P524bFTxwjK3G7Mu63rPtr5igUdopGRbpkr0WZLTtFvSqBLKutFOsq7ntFB4ERZw
 h3iGsArzYAeZ7GVcwrO7zwEE+vSrhSW2hsessfUIDaEediEKYyQJHh3SQLRQ/IaGBZc0
 +0geMYAVmLovCYpQ+LJJB4hC2dLcXM3/KriktAg+vMMFvA9TV9WJjoQ7ou4iGBCEbh1X
 zjEkGIogOKkRlPHyhEHdSjp8fE0R9LrPqdjQXSNL0FIP0jAkwvcZPUGQqSTntSmKDXWY
 5ReIGi87uhYoQHRmvmYTheQzobyJ7g8kiEGdY7XPEsXoN6OGO41hoXdKHpwMUlq14auT
 3rww==
X-Gm-Message-State: ACgBeo2qO0HdTvf4RnxdE7dq6s8/jbcOasHLgbsd6QLb90S+TV96mcVs
 t+/44hBaANka3udJbXMl81RUtKLdvsrakNPgAT91XQ==
X-Google-Smtp-Source: AA6agR5ZTaDV6LZCNJuDMj5JxWCNLXdzSYzlqbJSppfVeW2oVIuq3Eso0Dlh2NUxPm6UzmRrQ4jEIMMk29x/qky8YgQ=
X-Received: by 2002:a62:38d8:0:b0:52d:1496:6775 with SMTP id
 f207-20020a6238d8000000b0052d14966775mr20199063pfa.15.1660635616700; Tue, 16
 Aug 2022 00:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220802233307.2106839-1-atishp@rivosinc.com>
 <20220802233307.2106839-3-atishp@rivosinc.com>
 <20220815075417.nhfdzw3b5ysygct3@kamzik>
In-Reply-To: <20220815075417.nhfdzw3b5ysygct3@kamzik>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 16 Aug 2022 00:39:55 -0700
Message-ID: <CAHBxVyHpdK1cKRfP6VDmDg72OCHwZwfmw6XtxR35rDkND0rX-w@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] target/riscv: Simplify counter predicate function
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000904df05e656dc57"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 16 Aug 2022 07:40:26 -0000

--0000000000000904df05e656dc57
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 12:54 AM Andrew Jones <ajones@ventanamicro.com>
wrote:

> On Tue, Aug 02, 2022 at 04:33:03PM -0700, Atish Patra wrote:
> > All the hpmcounters and the fixed counters (CY, IR, TM) can be
> represented
> > as a unified counter. Thus, the predicate function doesn't need handle
> each
> > case separately.
> >
> > Simplify the predicate function so that we just handle things differently
> > between RV32/RV64 and S/HS mode.
> >
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  target/riscv/csr.c | 110 ++++-----------------------------------------
> >  1 file changed, 9 insertions(+), 101 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 9b45c49ab45f..6690b72ea0e7 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
> >      CPUState *cs = env_cpu(env);
> >      RISCVCPU *cpu = RISCV_CPU(cs);
> >      int ctr_index;
> > +    target_ulong ctr_mask;
> >      int base_csrno = CSR_CYCLE;
> >      bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
> >
> > @@ -82,122 +83,29 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
> >          base_csrno += 0x80;
> >      }
> >      ctr_index = csrno - base_csrno;
> > +    ctr_mask = BIT(ctr_index);
> >
> >      if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
> >          (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
> >          goto skip_ext_pmu_check;
> >      }
> >
> > -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index))))
> {
> > +    if (!(cpu->pmu_avail_ctrs & ctr_mask)) {
> >          /* No counter is enabled in PMU or the counter is out of range
> */
> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> >  skip_ext_pmu_check:
> >
> > -    if (env->priv == PRV_S) {
> > -        switch (csrno) {
> > -        case CSR_CYCLE:
> > -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> > -                return RISCV_EXCP_ILLEGAL_INST;
> > -            }
> > -            break;
> > -        case CSR_TIME:
> > -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> > -                return RISCV_EXCP_ILLEGAL_INST;
> > -            }
> > -            break;
> > -        case CSR_INSTRET:
> > -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> > -                return RISCV_EXCP_ILLEGAL_INST;
> > -            }
> > -            break;
> > -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > -                return RISCV_EXCP_ILLEGAL_INST;
> > -            }
> > -            break;
> > -        }
> > -        if (rv32) {
> > -            switch (csrno) {
> > -            case CSR_CYCLEH:
> > -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> > -                    return RISCV_EXCP_ILLEGAL_INST;
> > -                }
> > -                break;
> > -            case CSR_TIMEH:
> > -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> > -                    return RISCV_EXCP_ILLEGAL_INST;
> > -                }
> > -                break;
> > -            case CSR_INSTRETH:
> > -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> > -                    return RISCV_EXCP_ILLEGAL_INST;
> > -                }
> > -                break;
> > -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > -                    return RISCV_EXCP_ILLEGAL_INST;
> > -                }
> > -                break;
> > -            }
> > -        }
> > +    if (((env->priv == PRV_S) && (!get_field(env->mcounteren,
> ctr_mask))) ||
> > +       ((env->priv == PRV_U) && (!get_field(env->scounteren,
> ctr_mask)))) {
>     ^ there should be another space here
>
> > +        return RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> >      if (riscv_cpu_virt_enabled(env)) {
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
> > -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> > -                 get_field(env->mcounteren, 1 << ctr_index)) {
> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -            }
> > -            break;
> > -        }
> > -        if (rv32) {
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
> > -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> > -                     get_field(env->mcounteren, 1 << ctr_index)) {
> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > -                }
> > -                break;
> > -            }
> > +        if (!get_field(env->hcounteren, ctr_mask) &&
> > +           get_field(env->mcounteren, ctr_mask)) {
>      ^ and here
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> >          }
> >      }
> >  #endif
> > --
> > 2.25.1
> >
> >
>
>
Fixed.Thanks.


> Thanks,
> drew
>

--0000000000000904df05e656dc57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 15, 2022 at 12:54 AM Andr=
ew Jones &lt;<a href=3D"mailto:ajones@ventanamicro.com">ajones@ventanamicro=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Tue, Aug 02, 2022 at 04:33:03PM -0700, Atish Patra wrote:<br>
&gt; All the hpmcounters and the fixed counters (CY, IR, TM) can be represe=
nted<br>
&gt; as a unified counter. Thus, the predicate function doesn&#39;t need ha=
ndle each<br>
&gt; case separately.<br>
&gt; <br>
&gt; Simplify the predicate function so that we just handle things differen=
tly<br>
&gt; between RV32/RV64 and S/HS mode.<br>
&gt; <br>
&gt; Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=
=3D"_blank">bmeng.cn@gmail.com</a>&gt;<br>
&gt; Acked-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/csr.c | 110 ++++-----------------------------------=
------<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 101 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index 9b45c49ab45f..6690b72ea0e7 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int cs=
rno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ctr_index;<br>
&gt; +=C2=A0 =C2=A0 target_ulong ctr_mask;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int base_csrno =3D CSR_CYCLE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ?=
 true : false;<br>
&gt;=C2=A0 <br>
&gt; @@ -82,122 +83,29 @@ static RISCVException ctr(CPURISCVState *env, int=
 csrno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base_csrno +=3D 0x80;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - base_csrno;<br>
&gt; +=C2=A0 =C2=A0 ctr_mask =3D BIT(ctr_index);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ((csrno &gt;=3D CSR_CYCLE &amp;&amp; csrno &lt;=
=3D CSR_INSTRET) ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (csrno &gt;=3D CSR_CYCLEH &amp;&amp;=
 csrno &lt;=3D CSR_INSTRETH)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto skip_ext_pmu_check;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if ((!cpu-&gt;cfg.pmu_num || !(cpu-&gt;pmu_avail_ctrs &=
amp; BIT(ctr_index)))) {<br>
&gt; +=C2=A0 =C2=A0 if (!(cpu-&gt;pmu_avail_ctrs &amp; ctr_mask)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No counter is enabled in PMU or t=
he counter is out of range */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 skip_ext_pmu_check:<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (csrno) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_CYCLE:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;mcou=
nteren, COUNTEREN_CY)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_=
EXCP_ILLEGAL_INST;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_TIME:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;mcou=
nteren, COUNTEREN_TM)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_=
EXCP_ILLEGAL_INST;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_INSTRET:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;mcou=
nteren, COUNTEREN_IR)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_=
EXCP_ILLEGAL_INST;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;mcou=
nteren, 1 &lt;&lt; ctr_index)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_=
EXCP_ILLEGAL_INST;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rv32) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (csrno) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_CYCLEH:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_fiel=
d(env-&gt;mcounteren, COUNTEREN_CY)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_TIMEH:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_fiel=
d(env-&gt;mcounteren, COUNTEREN_TM)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_INSTRETH:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_fiel=
d(env-&gt;mcounteren, COUNTEREN_IR)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_HPMCOUNTER3H...CSR=
_HPMCOUNTER31H:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_fiel=
d(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (((env-&gt;priv =3D=3D PRV_S) &amp;&amp; (!get_field=
(env-&gt;mcounteren, ctr_mask))) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0((env-&gt;priv =3D=3D PRV_U) &amp;&amp; (!=
get_field(env-&gt;scounteren, ctr_mask)))) {<br>
=C2=A0 =C2=A0 ^ there should be another space here<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (csrno) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_CYCLE:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;hcou=
nteren, COUNTEREN_CY) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env=
-&gt;mcounteren, COUNTEREN_CY)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_=
EXCP_VIRT_INSTRUCTION_FAULT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_TIME:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;hcou=
nteren, COUNTEREN_TM) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env=
-&gt;mcounteren, COUNTEREN_TM)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_=
EXCP_VIRT_INSTRUCTION_FAULT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_INSTRET:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;hcou=
nteren, COUNTEREN_IR) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env=
-&gt;mcounteren, COUNTEREN_IR)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_=
EXCP_VIRT_INSTRUCTION_FAULT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;hcou=
nteren, 1 &lt;&lt; ctr_index) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_fie=
ld(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_=
EXCP_VIRT_INSTRUCTION_FAULT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rv32) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (csrno) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_CYCLEH:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_fiel=
d(env-&gt;hcounteren, COUNTEREN_CY) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 get_field(env-&gt;mcounteren, COUNTEREN_CY)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_TIMEH:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_fiel=
d(env-&gt;hcounteren, COUNTEREN_TM) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 get_field(env-&gt;mcounteren, COUNTEREN_TM)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_INSTRETH:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_fiel=
d(env-&gt;hcounteren, COUNTEREN_IR) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 get_field(env-&gt;mcounteren, COUNTEREN_IR)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_HPMCOUNTER3H...CSR=
_HPMCOUNTER31H:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_fiel=
d(env-&gt;hcounteren, 1 &lt;&lt; ctr_index) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0get_field(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;hcounteren, ctr_ma=
sk) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_field(env-&gt;mcounteren=
, ctr_mask)) {<br>
=C2=A0 =C2=A0 =C2=A0^ and here<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_VIRT_INST=
RUCTION_FAULT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt;<br>
<br></blockquote><div><br></div><div>Fixed.Thanks.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
drew<br>
</blockquote></div></div>

--0000000000000904df05e656dc57--


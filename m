Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGolV-0001Xg-JG
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 17:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGolS-0001X9-IA
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 17:40:24 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGolQ-0003LJ-7Q
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 17:40:22 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 72so8361pge.0
 for <qemu-riscv@nongnu.org>; Wed, 27 Jul 2022 14:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Txo/H7McpMfbn2dZjypc9la/s6gu9ivH7BbuqU8uLjk=;
 b=5EIS77PwwlMnAw10UgHLCZ5ABiFr7BRNs4r6WLFFgwltCnFg/BOnfXBqDWmvneGCvl
 AourKrjKr/RlEZ4KfS448+GYhAR34L+HmheDbpRMd3bbJC+8qTb1u103eBugetOrSB0h
 yeV76AVNr2wBSOzXTIccoNG3TLCmDWEaO05iATB8Sjkmp6Xk2aq4Aino6bkUqia82ncb
 qmLoU2yOxnOGF7UxoGNSyJsQkdQqSQEZ69lYpvU/vCVmseVD5u/MbChmQGvPVswfGmfj
 fS5kjRBvfa1a6f5K/AxUvTP7iO0q14g2W7jrn/eaYojGnPbhe3pfIERyDAYPkV8S9MMf
 gEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Txo/H7McpMfbn2dZjypc9la/s6gu9ivH7BbuqU8uLjk=;
 b=QPivZsEIdgPyvXGK7XbziLQ/FM1/v3ikyzsJswqEeVqoDBJk9Et+DwXAafiI1HPjRa
 CavU58TMw7Vkb91n5m1INQ6jJtE/hjmd7grSWvveBOrwjDiY3tIytjttF5maKmVHJmD+
 2d7ZEB2wamAjKc4I9EPVqOpCvAzte69v8G3uKxH4Ia935yIu/eb/WkanJV/Ie/6ZTfZa
 g38ftXUUuHM1CivfONZQ9ctCBzXS7qxCUjWOHOYZ8Whd50VM8xDrrAaF5itKKOfMaX+P
 p9/1EMBqhbE3gSsZPoLTCxzZquyEqE/2MCpYGbrVG5K6nnK8YW4WqcXJwmbJwg5r4a7g
 ga4Q==
X-Gm-Message-State: AJIora/aa7IfA7oftJ4a2rLUmzhHj2YsyNSHGvVzntI/Nz6oyod8s90N
 6k3QGfTTIS1yM+OP4+NEOfFHoRI5gzj0mFPtEBoJOg==
X-Google-Smtp-Source: AGRyM1uBr+ka9Z9jM07D8dCG/GIUhRed1r/ujrVUTYWtBUGP3BVkVzhNZLWOvE+NyFIbO7D2gbn1QSrb7WNWjr8yLYI=
X-Received: by 2002:a63:294:0:b0:41a:6837:4392 with SMTP id
 142-20020a630294000000b0041a68374392mr19840981pgc.185.1658958017558; Wed, 27
 Jul 2022 14:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220727064913.1041427-1-atishp@rivosinc.com>
 <20220727064913.1041427-3-atishp@rivosinc.com>
 <4fe4fca9-71ea-de77-1db1-b02302599881@iscas.ac.cn>
In-Reply-To: <4fe4fca9-71ea-de77-1db1-b02302599881@iscas.ac.cn>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 27 Jul 2022 14:40:06 -0700
Message-ID: <CAHBxVyG3rqFRrTk0FavPm7M6bdOjkeoyb6OkN4JOVNVg25t6yQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/6] target/riscv: Simplify counter predicate function
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000055962905e4d043e6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Wed, 27 Jul 2022 21:40:24 -0000

--00000000000055962905e4d043e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2022 at 1:35 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

>
> =E5=9C=A8 2022/7/27 =E4=B8=8B=E5=8D=882:49, Atish Patra =E5=86=99=E9=81=
=93:
> > All the hpmcounters and the fixed counters (CY, IR, TM) can be
> represented
> > as a unified counter. Thus, the predicate function doesn't need handle
> each
> > case separately.
> >
> > Simplify the predicate function so that we just handle things different=
ly
> > between RV32/RV64 and S/HS mode.
> >
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   target/riscv/csr.c | 112 +++++---------------------------------------=
-
> >   1 file changed, 11 insertions(+), 101 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 1233bfa0a726..57dbbf9b09a0 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
> >       CPUState *cs =3D env_cpu(env);
> >       RISCVCPU *cpu =3D RISCV_CPU(cs);
> >       int ctr_index;
> > +    target_ulong ctr_mask;
> >       int base_csrno =3D CSR_CYCLE;
> >       bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? true : false;
> >
> > @@ -82,122 +83,31 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
> >           base_csrno +=3D 0x80;
> >       }
> >       ctr_index =3D csrno - base_csrno;
> > +    ctr_mask =3D BIT(ctr_index);
> >
> >       if ((csrno >=3D CSR_CYCLE && csrno <=3D CSR_INSTRET) ||
> >           (csrno >=3D CSR_CYCLEH && csrno <=3D CSR_INSTRETH)) {
> >           goto skip_ext_pmu_check;
> >       }
> >
> > -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))=
)
> {
> > +    if (!(cpu->pmu_avail_ctrs & ctr_mask)) {
> >           /* No counter is enabled in PMU or the counter is out of rang=
e
> */
> >           return RISCV_EXCP_ILLEGAL_INST;
> >       }
> >
> >   skip_ext_pmu_check:
> >
> > -    if (env->priv =3D=3D PRV_S) {
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
> > +    if (((env->priv =3D=3D PRV_S) && (!get_field(env->mcounteren,
> ctr_mask))) ||
> > +       ((env->priv =3D=3D PRV_U) && (!get_field(env->scounteren,
> ctr_mask)))) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> >       }
> >
> >       if (riscv_cpu_virt_enabled(env)) {
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
> > +        if (!get_field(env->mcounteren, ctr_mask)) {
> > +            /* The bit must be set in mcountern for HS mode access */
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        } else if (!get_field(env->hcounteren, ctr_mask)) {
> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> >           }
>
> The logic is changed here. In original logic,
> RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered when
>
> !get_field(env->hcounteren, 1 << ctr_index) && get_field(env->mcounteren,
> 1 << ctr_index)
>
> The new logic is RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered when
> !get_field(env->mcounteren, ctr_mask)
>
> or !get_field(env->hcounteren, 1 << ctr_index) &&
> get_field(env->mcounteren, 1 << ctr_index)
>
>
Yes. It's just an optimization where we can break early just by checking
mcountern. Do you see any issue with it ?


> Regards,
>
> Weiwei Li
>
> >       }
> >   #endif
>
>

--00000000000055962905e4d043e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 1:35 AM Weiwe=
i Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn">liweiwei@iscas.ac.cn</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2022/7/27 =E4=B8=8B=E5=8D=882:49, Atish Patra =E5=86=99=E9=81=93:=
<br>
&gt; All the hpmcounters and the fixed counters (CY, IR, TM) can be represe=
nted<br>
&gt; as a unified counter. Thus, the predicate function doesn&#39;t need ha=
ndle each<br>
&gt; case separately.<br>
&gt;<br>
&gt; Simplify the predicate function so that we just handle things differen=
tly<br>
&gt; between RV32/RV64 and S/HS mode.<br>
&gt;<br>
&gt; Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=
=3D"_blank">bmeng.cn@gmail.com</a>&gt;<br>
&gt; Acked-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/csr.c | 112 +++++----------------------------=
------------<br>
&gt;=C2=A0 =C2=A01 file changed, 11 insertions(+), 101 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index 1233bfa0a726..57dbbf9b09a0 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int cs=
rno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ctr_index;<br>
&gt; +=C2=A0 =C2=A0 target_ulong ctr_mask;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int base_csrno =3D CSR_CYCLE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_=
RV32 ? true : false;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -82,122 +83,31 @@ static RISCVException ctr(CPURISCVState *env, int=
 csrno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_csrno +=3D 0x80;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctr_index =3D csrno - base_csrno;<br>
&gt; +=C2=A0 =C2=A0 ctr_mask =3D BIT(ctr_index);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((csrno &gt;=3D CSR_CYCLE &amp;&amp; csrn=
o &lt;=3D CSR_INSTRET) ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(csrno &gt;=3D CSR_CYCLEH &amp=
;&amp; csrno &lt;=3D CSR_INSTRETH)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto skip_ext_pmu_check;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if ((!cpu-&gt;cfg.pmu_num || !(cpu-&gt;pmu_avail_ctrs &=
amp; BIT(ctr_index)))) {<br>
&gt; +=C2=A0 =C2=A0 if (!(cpu-&gt;pmu_avail_ctrs &amp; ctr_mask)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* No counter is enabled in PM=
U or the counter is out of range */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0skip_ext_pmu_check:<br>
&gt;=C2=A0 =C2=A0<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env)) {<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;mcounteren, ctr_ma=
sk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The bit must be set in m=
countern for HS mode access */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_VIRT_INST=
RUCTION_FAULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!get_field(env-&gt;hcounteren,=
 ctr_mask)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_VIRT_INST=
RUCTION_FAULT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
The logic is changed here. In original logic, <br>
RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered when<br>
<br>
!get_field(env-&gt;hcounteren, 1 &lt;&lt; ctr_index) &amp;&amp; get_field(e=
nv-&gt;mcounteren, 1 &lt;&lt; ctr_index)<br>
<br>
The new logic is RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered when !get_f=
ield(env-&gt;mcounteren, ctr_mask)<br>
<br>
or !get_field(env-&gt;hcounteren, 1 &lt;&lt; ctr_index) &amp;&amp; get_fiel=
d(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)<br>
<br></blockquote><div><br>Yes. It&#39;s just an optimization where we can b=
reak early just by checking mcountern. Do you see any issue with it ?</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
<br>
Weiwei Li<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0#endif<br>
<br>
</blockquote></div></div>

--00000000000055962905e4d043e6--


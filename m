Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDcYD-0008Dd-Oz
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jan 2022 20:29:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nDcYB-0008DK-Tp
 for qemu-riscv@nongnu.org; Fri, 28 Jan 2022 20:29:12 -0500
Received: from [2607:f8b0:4864:20::b34] (port=37672
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nDcY9-0008Hq-8d
 for qemu-riscv@nongnu.org; Fri, 28 Jan 2022 20:29:11 -0500
Received: by mail-yb1-xb34.google.com with SMTP id k31so23635054ybj.4
 for <qemu-riscv@nongnu.org>; Fri, 28 Jan 2022 17:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IL5pbln/bek8VJCd0wjFySOKXrPORR7jhmY7pl3GdRI=;
 b=oG2O3uRUykU14n31LkSbos/tEYkL0jqLHH9bELocTHhUe42XtBRtE5nzfTcN7W/4nY
 tvliSPL/n82DMzhW4SKMao4UcXJErqFcQ8JQbsqAc46PUW+94o84LfypMuW0K8/0Wy+e
 InAAGgPM05ylZoaRmL+5Yilii1GmjMZYuC+4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IL5pbln/bek8VJCd0wjFySOKXrPORR7jhmY7pl3GdRI=;
 b=vVXZuNUzrsHb70Zw67y8d2SLlBMCyYSKDqN7TFMqqeBEBgg2IsWX/faesgfDLA0NaC
 u7334FitGDTZyw66h/ynhDOFxhxOemY6KJBohGXfsuJTfCsLxCm5xa+5wxdiYQDKachx
 fbZQBLTDYk5QazImBPHoZqI9vIsuP9Kim+jZ+7TKFbmcpbqUilW036FIGiGyym04I/Z1
 6hjQpm6M4Sldw/PPqeT036TSarcBpCLJXXMx/RYdTbbbT8JjZFmR/eOq4BTQwGctAdEo
 Oj7emEM1/2Af0VeyhonU4MvIo2YgIg5FfzJbOlDEjlwCnTuIVWKzr663tPVL+hea45iG
 tilw==
X-Gm-Message-State: AOAM531u+RR19Xh8yjA14oeOcmEZUPJj5w1jFgYf6cyaKiuHcz3dBEYt
 1UgYRb6hzBJgqTvvQHVYawqsXly7H8xSByXkf9tF
X-Google-Smtp-Source: ABdhPJzVhnXnjqELzLuM3cAv4lfLBxskTDNnwSNCJPSvMZGS/nowCPpkO49dbmcYrD0mhMvIAfMA+9Q266F3goflnHk=
X-Received: by 2002:a25:c344:: with SMTP id t65mr15609219ybf.10.1643419746880; 
 Fri, 28 Jan 2022 17:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20220120200735.2739543-1-atishp@rivosinc.com>
 <20220120200735.2739543-5-atishp@rivosinc.com>
 <91dbc7a1-f23f-709b-82e8-10e4c96e4482@iscas.ac.cn>
In-Reply-To: <91dbc7a1-f23f-709b-82e8-10e4c96e4482@iscas.ac.cn>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 28 Jan 2022 17:28:56 -0800
Message-ID: <CAOnJCULp6LDNcJ6eh04Yz3rpgj-e5_Z-bV6OVGB9gK0maBdiUg@mail.gmail.com>
Subject: Re: [RFC 4/5] target/riscv: Add *envcfg* CSRs support
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Atish Patra <atishp@rivosinc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="0000000000003ae62705d6ae7aec"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 29 Jan 2022 01:29:12 -0000

--0000000000003ae62705d6ae7aec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 12:37 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

>
> =E5=9C=A8 2022/1/21 =E4=B8=8A=E5=8D=884:07, Atish Patra =E5=86=99=E9=81=
=93:
> > The RISC-V privileged specification v1.12 defines few execution
> > environment configuration CSRs that can be used enable/disable
> > extensions per privilege levels.
> >
> > Add the basic support for these CSRs.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   target/riscv/cpu.h      |  8 ++++
> >   target/riscv/cpu_bits.h | 31 +++++++++++++++
> >   target/riscv/csr.c      | 84 ++++++++++++++++++++++++++++++++++++++++=
+
> >   target/riscv/machine.c  | 26 +++++++++++++
> >   4 files changed, 149 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 7f87917204c5..b9462300a472 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -264,6 +264,14 @@ struct CPURISCVState {
> >       target_ulong spmbase;
> >       target_ulong upmmask;
> >       target_ulong upmbase;
> > +
> > +    /* CSRs for execution enviornment configuration */
> > +
> > +    target_ulong menvcfg;
> > +    target_ulong menvcfgh;
>
> I think we needn't maintain seperate menvcfg and menvcfgh, just use
> "uint64_t menvcfg" as the way of mstatus.
>
>
unlike mstatush, menvcfgh/henvcfgh will be accessed directly to do runtime
predicate for stimecmp/vstimecmp.

We have to do the 32 bit shifting during every check which makes the code
hard to read
at the cost of 2 ulongs.

IMO, having separate variables is much simpler.

Similar to  henvcfg and henvcfg.
>
> > +    target_ulong senvcfg;
> > +    target_ulong henvcfg;
> > +    target_ulong henvcfgh;
> >   #endif
> >
> >       float_status fp_status;
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index f6f90b5cbd52..afb237c2313b 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -177,6 +177,9 @@
> >   #define CSR_STVEC           0x105
> >   #define CSR_SCOUNTEREN      0x106
> >
> > +/* Supervisor Configuration CSRs */
> > +#define CSR_SENVCFG         0x10A
> > +
> >   /* Supervisor Trap Handling */
> >   #define CSR_SSCRATCH        0x140
> >   #define CSR_SEPC            0x141
> > @@ -204,6 +207,10 @@
> >   #define CSR_HTIMEDELTA      0x605
> >   #define CSR_HTIMEDELTAH     0x615
> >
> > +/* Hypervisor Configuration CSRs */
> > +#define CSR_HENVCFG         0x60A
> > +#define CSR_HENVCFGH        0x61A
> > +
> >   /* Virtual CSRs */
> >   #define CSR_VSSTATUS        0x200
> >   #define CSR_VSIE            0x204
> > @@ -218,6 +225,10 @@
> >   #define CSR_MTINST          0x34a
> >   #define CSR_MTVAL2          0x34b
> >
> > +/* Machine Configuration CSRs */
> > +#define CSR_MENVCFG         0x30A
> > +#define CSR_MENVCFGH        0x31A
> > +
> >   /* Enhanced Physical Memory Protection (ePMP) */
> >   #define CSR_MSECCFG         0x747
> >   #define CSR_MSECCFGH        0x757
> > @@ -578,6 +589,26 @@ typedef enum RISCVException {
> >   #define PM_EXT_CLEAN    0x00000002ULL
> >   #define PM_EXT_DIRTY    0x00000003ULL
> >
> > +/* Execution enviornment configuration bits */
> > +#define MENVCFG_FIOM                       (1 << 0)
> > +#define MENVCFG_CBE                        0x30000ULL
> > +#define MENVCFG_CBCFE                      (1 << 6)
> > +#define MENVCFG_CBZE                       (1 << 7)
> > +#define MENVCFG_PBMTE                      (1 << 62)
> > +#define MENVCFG_STCE                       (1 << 63)
> > +
> > +#define SENVCFG_FIOM                       MENVCFG_FIOM
> > +#define SENVCFG_CBE                        MENVCFG_CBE
> > +#define SENVCFG_CBCFE                      MENVCFG_CBCFE
> > +#define SENVCFG_CBZE                       MENVCFG_CBZE
> > +
> > +#define HENVCFG_FIOM                       MENVCFG_FIOM
> > +#define HENVCFG_CBE                        MENVCFG_CBE
> > +#define HENVCFG_CBCFE                      MENVCFG_CBCFE
> > +#define HENVCFG_CBZE                       MENVCFG_CBZE
> > +#define HENVCFG_PBMTE                      MENVCFG_PBMTE
> > +#define HENVCFG_STCE                       MENVCFG_STCE
> > +
> >   /* Offsets for every pair of control bits per each priv level */
> >   #define XS_OFFSET    0ULL
> >   #define U_OFFSET     2ULL
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index e66bf2201857..a4bbae7a1bbd 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -853,6 +853,77 @@ static RISCVException write_mtval(CPURISCVState
> *env, int csrno,
> >       return RISCV_EXCP_NONE;
> >   }
> >
> > +/* Execution environment configuration setup */
> > +static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val =3D env->menvcfg;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
> > +                                  target_ulong val)
> > +{
> > +    env->menvcfg =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val =3D env->menvcfgh;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
> > +                                  target_ulong val)
> > +{
> > +    env->menvcfgh =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val =3D env->senvcfg;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
> > +                                  target_ulong val)
> > +{
> > +    env->senvcfg =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val =3D env->henvcfg;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
> > +                                  target_ulong val)
> > +{
> > +    env->henvcfg =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val =3D env->henvcfgh;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
> > +                                  target_ulong val)
> > +{
> > +    env->henvcfgh =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >   static RISCVException rmw_mip(CPURISCVState *env, int csrno,
> >                                 target_ulong *ret_value,
> >                                 target_ulong new_value, target_ulong
> write_mask)
> > @@ -2054,6 +2125,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >       [CSR_MTVAL]    =3D { "mtval",    any,  read_mtval,    write_mtval
> },
> >       [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip
> },
> >
> > +    /* Execution environment configuration */
> > +    [CSR_MENVCFG]  =3D { "menvcfg",  any,     read_menvcfg,
> write_menvcfg, NULL,
> > +                                            NULL, NULL,
> PRIV_VERSION_1_12_0},
> > +    [CSR_MENVCFGH] =3D { "menvcfgh", any32,   read_menvcfgh,
> write_menvcfgh, NULL,
> > +                                            NULL, NULL,
> PRIV_VERSION_1_12_0},
> > +    [CSR_SENVCFG]  =3D { "senvcfg",  smode,   read_senvcfg,
> write_senvcfg, NULL,
> > +                                            NULL, NULL,
> PRIV_VERSION_1_12_0},
> > +    [CSR_HENVCFG]  =3D { "henvcfg",  hmode,   read_henvcfg,
> write_henvcfg, NULL,
> > +                                            NULL, NULL,
> PRIV_VERSION_1_12_0},
> > +    [CSR_HENVCFGH] =3D { "henvcfgh", hmode32, read_henvcfgh,
> write_henvcfgh, NULL,
> > +                                            NULL, NULL,
> PRIV_VERSION_1_12_0},
> > +
> > +
> Two new lines here.
>

Fixed it. Thanks.


> >       /* Supervisor Trap Setup */
> >       [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,
> write_sstatus, NULL,
> >                                                 read_sstatus_i128
>          },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index 13b9ab375b95..59479a999b87 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -185,6 +185,31 @@ static const VMStateDescription vmstate_rv128 =3D =
{
> >       }
> >   };
> >
> > +/* TODO: henvcfg need both hyper_needed & envcfg_needed */
> > +static bool envcfg_needed(void *opaque)
> > +{
> > +    RISCVCPU *cpu =3D opaque;
> > +    CPURISCVState *env =3D &cpu->env;
> > +
> > +    return (env->priv_ver >=3D PRIV_VERSION_1_12_0 ? 1 : 0);
> > +}
> > +
> > +static const VMStateDescription vmstate_envcfg =3D {
> > +    .name =3D "cpu/envcfg",
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +    .needed =3D envcfg_needed,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINTTL(env.menvcfg, RISCVCPU),
> > +        VMSTATE_UINTTL(env.menvcfgh, RISCVCPU),
> > +        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
> > +        VMSTATE_UINTTL(env.henvcfg, RISCVCPU),
> > +        VMSTATE_UINTTL(env.henvcfgh, RISCVCPU),
> > +
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> >   const VMStateDescription vmstate_riscv_cpu =3D {
> >       .name =3D "cpu",
> >       .version_id =3D 3,
> > @@ -240,6 +265,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
> >           &vmstate_vector,
> >           &vmstate_pointermasking,
> >           &vmstate_rv128,
> > +        &vmstate_envcfg,
> >           NULL
> >       }
> >   };
>
> Regards,
>
> Weiwei Li
>
>
>

--=20
Regards,
Atish

--0000000000003ae62705d6ae7aec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 26, 2022 at 12:37 AM Weiw=
ei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn">liweiwei@iscas.ac.cn</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2022/1/21 =E4=B8=8A=E5=8D=884:07, Atish Patra =E5=86=99=E9=81=93:=
<br>
&gt; The RISC-V privileged specification v1.12 defines few execution<br>
&gt; environment configuration CSRs that can be used enable/disable<br>
&gt; extensions per privilege levels.<br>
&gt;<br>
&gt; Add the basic support for these CSRs.<br>
&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu_bits.h | 31 +++++++++++++++<br>
&gt;=C2=A0 =C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 84 ++++++++++++++=
+++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0target/riscv/machine.c=C2=A0 | 26 +++++++++++++<br>
&gt;=C2=A0 =C2=A04 files changed, 149 insertions(+)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 7f87917204c5..b9462300a472 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -264,6 +264,14 @@ struct CPURISCVState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong spmbase;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong upmmask;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong upmbase;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* CSRs for execution enviornment configuration */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 target_ulong menvcfg;<br>
&gt; +=C2=A0 =C2=A0 target_ulong menvcfgh;<br>
<br>
I think we needn&#39;t maintain seperate menvcfg and menvcfgh, just use <br=
>
&quot;uint64_t menvcfg&quot; as the way of mstatus.<br>
<br></blockquote><div><br></div><div>unlike mstatush, menvcfgh/henvcfgh=C2=
=A0will be accessed directly to do runtime</div><div>predicate for stimecmp=
/vstimecmp.</div><div>=C2=A0<br>We have to do the 32 bit shifting during ev=
ery check which makes the code hard to read</div><div>at the cost of 2 ulon=
gs.</div><div><br>IMO, having separate=C2=A0variables is much simpler.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Similar to=C2=A0 henvcfg and henvcfg.<br>
<br>
&gt; +=C2=A0 =C2=A0 target_ulong senvcfg;<br>
&gt; +=C2=A0 =C2=A0 target_ulong henvcfg;<br>
&gt; +=C2=A0 =C2=A0 target_ulong henvcfgh;<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0float_status fp_status;<br>
&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt; index f6f90b5cbd52..afb237c2313b 100644<br>
&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt; @@ -177,6 +177,9 @@<br>
&gt;=C2=A0 =C2=A0#define CSR_STVEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x105<br>
&gt;=C2=A0 =C2=A0#define CSR_SCOUNTEREN=C2=A0 =C2=A0 =C2=A0 0x106<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Supervisor Configuration CSRs */<br>
&gt; +#define CSR_SENVCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x10A<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* Supervisor Trap Handling */<br>
&gt;=C2=A0 =C2=A0#define CSR_SSCRATCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x140<br>
&gt;=C2=A0 =C2=A0#define CSR_SEPC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x141<br>
&gt; @@ -204,6 +207,10 @@<br>
&gt;=C2=A0 =C2=A0#define CSR_HTIMEDELTA=C2=A0 =C2=A0 =C2=A0 0x605<br>
&gt;=C2=A0 =C2=A0#define CSR_HTIMEDELTAH=C2=A0 =C2=A0 =C2=A00x615<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Hypervisor Configuration CSRs */<br>
&gt; +#define CSR_HENVCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x60A<br>
&gt; +#define CSR_HENVCFGH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x61A<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* Virtual CSRs */<br>
&gt;=C2=A0 =C2=A0#define CSR_VSSTATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x200<br>
&gt;=C2=A0 =C2=A0#define CSR_VSIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x204<br>
&gt; @@ -218,6 +225,10 @@<br>
&gt;=C2=A0 =C2=A0#define CSR_MTINST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x34a=
<br>
&gt;=C2=A0 =C2=A0#define CSR_MTVAL2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x34b=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Machine Configuration CSRs */<br>
&gt; +#define CSR_MENVCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x30A<br>
&gt; +#define CSR_MENVCFGH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x31A<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* Enhanced Physical Memory Protection (ePMP) */<br>
&gt;=C2=A0 =C2=A0#define CSR_MSECCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x747=
<br>
&gt;=C2=A0 =C2=A0#define CSR_MSECCFGH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x757<br>
&gt; @@ -578,6 +589,26 @@ typedef enum RISCVException {<br>
&gt;=C2=A0 =C2=A0#define PM_EXT_CLEAN=C2=A0 =C2=A0 0x00000002ULL<br>
&gt;=C2=A0 =C2=A0#define PM_EXT_DIRTY=C2=A0 =C2=A0 0x00000003ULL<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Execution enviornment configuration bits */<br>
&gt; +#define MENVCFG_FIOM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
&gt; +#define MENVCFG_CBE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x30000ULL<br>
&gt; +#define MENVCFG_CBCFE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 6)<br>
&gt; +#define MENVCFG_CBZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 7)<br>
&gt; +#define MENVCFG_PBMTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 62)<br>
&gt; +#define MENVCFG_STCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 63)<br>
&gt; +<br>
&gt; +#define SENVCFG_FIOM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MENVCFG_FIOM<br>
&gt; +#define SENVCFG_CBE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MENVCFG_CBE<br>
&gt; +#define SENVCFG_CBCFE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MENVCFG_CBCFE<br>
&gt; +#define SENVCFG_CBZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MENVCFG_CBZE<br>
&gt; +<br>
&gt; +#define HENVCFG_FIOM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MENVCFG_FIOM<br>
&gt; +#define HENVCFG_CBE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MENVCFG_CBE<br>
&gt; +#define HENVCFG_CBCFE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MENVCFG_CBCFE<br>
&gt; +#define HENVCFG_CBZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MENVCFG_CBZE<br>
&gt; +#define HENVCFG_PBMTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MENVCFG_PBMTE<br>
&gt; +#define HENVCFG_STCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MENVCFG_STCE<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* Offsets for every pair of control bits per each priv le=
vel */<br>
&gt;=C2=A0 =C2=A0#define XS_OFFSET=C2=A0 =C2=A0 0ULL<br>
&gt;=C2=A0 =C2=A0#define U_OFFSET=C2=A0 =C2=A0 =C2=A02ULL<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index e66bf2201857..a4bbae7a1bbd 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -853,6 +853,77 @@ static RISCVException write_mtval(CPURISCVState *=
env, int csrno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Execution environment configuration setup */<br>
&gt; +static RISCVException read_menvcfg(CPURISCVState *env, int csrno,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;menvcfg;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException write_menvcfg(CPURISCVState *env, int csrno,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 env-&gt;menvcfg =3D val;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;menvcfgh;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 env-&gt;menvcfgh =3D val;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException read_senvcfg(CPURISCVState *env, int csrno,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;senvcfg;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException write_senvcfg(CPURISCVState *env, int csrno,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 env-&gt;senvcfg =3D val;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException read_henvcfg(CPURISCVState *env, int csrno,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;henvcfg;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException write_henvcfg(CPURISCVState *env, int csrno,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 env-&gt;henvcfg =3D val;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;henvcfgh;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 env-&gt;henvcfgh =3D val;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static RISCVException rmw_mip(CPURISCVState *env, int csrn=
o,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *ret_value,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_value, tar=
get_ulong write_mask)<br>
&gt; @@ -2054,6 +2125,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_MTVAL]=C2=A0 =C2=A0 =3D { &quot;mtval&q=
uot;,=C2=A0 =C2=A0 any,=C2=A0 read_mtval,=C2=A0 =C2=A0 write_mtval=C2=A0 =
=C2=A0 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_MIP]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;mi=
p&quot;,=C2=A0 =C2=A0 =C2=A0 any,=C2=A0 NULL,=C2=A0 =C2=A0 NULL, rmw_mip=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /* Execution environment configuration */<br>
&gt; +=C2=A0 =C2=A0 [CSR_MENVCFG]=C2=A0 =3D { &quot;menvcfg&quot;,=C2=A0 an=
y,=C2=A0 =C2=A0 =C2=A0read_menvcfg,=C2=A0 write_menvcfg, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL, NULL, PRIV_VERSION_1_12_0},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MENVCFGH] =3D { &quot;menvcfgh&quot;, any32,=C2=A0=
 =C2=A0read_menvcfgh, write_menvcfgh, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL, NULL, PRIV_VERSION_1_12_0},<br>
&gt; +=C2=A0 =C2=A0 [CSR_SENVCFG]=C2=A0 =3D { &quot;senvcfg&quot;,=C2=A0 sm=
ode,=C2=A0 =C2=A0read_senvcfg,=C2=A0 write_senvcfg, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL, NULL, PRIV_VERSION_1_12_0},<br>
&gt; +=C2=A0 =C2=A0 [CSR_HENVCFG]=C2=A0 =3D { &quot;henvcfg&quot;,=C2=A0 hm=
ode,=C2=A0 =C2=A0read_henvcfg, write_henvcfg, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL, NULL, PRIV_VERSION_1_12_0},<br>
&gt; +=C2=A0 =C2=A0 [CSR_HENVCFGH] =3D { &quot;henvcfgh&quot;, hmode32, rea=
d_henvcfgh, write_henvcfgh, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL, NULL, PRIV_VERSION_1_12_0},<br>
&gt; +<br>
&gt; +<br>
Two new lines here.<br></blockquote><div><br></div><div>Fixed it. Thanks.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Supervisor Trap Setup */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_SSTATUS]=C2=A0 =C2=A0 =3D { &quot;sstat=
us&quot;,=C2=A0 =C2=A0 smode, read_sstatus,=C2=A0 =C2=A0 write_sstatus, NUL=
L,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read_sstatus_i128=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
&gt; index 13b9ab375b95..59479a999b87 100644<br>
&gt; --- a/target/riscv/machine.c<br>
&gt; +++ b/target/riscv/machine.c<br>
&gt; @@ -185,6 +185,31 @@ static const VMStateDescription vmstate_rv128 =3D=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* TODO: henvcfg need both hyper_needed &amp; envcfg_needed */<br>
&gt; +static bool envcfg_needed(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return (env-&gt;priv_ver &gt;=3D PRIV_VERSION_1_12_0 ? =
1 : 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const VMStateDescription vmstate_envcfg =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;cpu/envcfg&quot;,<br>
&gt; +=C2=A0 =C2=A0 .version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .needed =3D envcfg_needed,<br>
&gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.menvcfg, RISCVCPU),<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.menvcfgh, RISCVCPU),<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.senvcfg, RISCVCPU),<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.henvcfg, RISCVCPU),<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.henvcfgh, RISCVCPU),<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0const VMStateDescription vmstate_riscv_cpu =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;cpu&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.version_id =3D 3,<br>
&gt; @@ -240,6 +265,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;vmstate_vector,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;vmstate_pointermasking,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;vmstate_rv128,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;vmstate_envcfg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0};<br>
<br>
Regards,<br>
<br>
Weiwei Li<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Atish</div></div><=
/div></div>

--0000000000003ae62705d6ae7aec--


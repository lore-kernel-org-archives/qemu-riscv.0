Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oIz1s-0005cQ-Rm
	for mharc-qemu-riscv@gnu.org; Tue, 02 Aug 2022 17:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oIz1s-0005cH-8F
 for qemu-riscv@nongnu.org; Tue, 02 Aug 2022 17:02:16 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oIz1p-0000vI-Nb
 for qemu-riscv@nongnu.org; Tue, 02 Aug 2022 17:02:16 -0400
Received: by mail-pj1-x102f.google.com with SMTP id pm17so9141334pjb.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Aug 2022 14:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=vAYFJTPm1oRqFsV5ohkHDQqBtUPvHe3Eya4TeG7r43Q=;
 b=WmQWFx/gDymyCDSJXm1EEYaIZXBl06uEy/fwpJ2FrYHmDYdYHWLm2zz/TzVPmBQnR0
 TWddm3izJgjgqHm2ULbATse570JxWOkCu3csZbAWvXR+WC9VhZs+PInvtWONQz2wWNNz
 UX78Fq4heI4CB3XEdYi2ItcQPocFgXrgpjiRTchd2lEpIehhQReyNk+ElH2G/TqDHoSq
 wdBXf1ykN4mqlqHQiHWEnJwl5wI0WGZuBxL9yPaDodsjbFkSTHJRWH2AeaPKSN7O4J1d
 m55UMAtnYFA5APBm0ebkL6f2CDhWaCnD/NBxcVEgJQf7zskVCs7b2ea33ml5Q1GPsjBP
 7VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=vAYFJTPm1oRqFsV5ohkHDQqBtUPvHe3Eya4TeG7r43Q=;
 b=Q/vVnyg4x+zH9qdWsvlGJbrlZT+1u2Yr3oX/jU5HAi8gbviaGlYYO8w8NjoP9r8TxH
 fErCQEZ5iOXIBitEeXlwHxENTObvXUtUTxptTFS3wWmSd/OlM3fGkRUZfJematoSFvyK
 8Ukgx4fmcZ77lBgdqf6KZgarYBCT++ziLezwcGD6fKFWzTBxWwNmKZMnLQE6QcACoA3I
 +DdYyTBKEozKf1CP5xDgmzHiiMUfNCss4UVZ8bahRLO0QQzSPC2Hw7Q/ruBUAa7v5oz9
 SZUUIQFr78iNXeh9B8036RbobOIpv6/jIlMXAYs/x7CKgtK7Kwy904yTcsbG9s6pd4ez
 bQuA==
X-Gm-Message-State: ACgBeo1OawlnAGEpOLq2hBFgXRpCsVHEMg7vn0INXvuQ+UC8N3+LwoYq
 MTyPvN4GhX12xCBLe1bpUd5tA5hCdA9+L2olOIgg3g==
X-Google-Smtp-Source: AA6agR6XD0G8L4R9M77YBMNz0U3OQNnyhn5gDjMbMme1mOK5Tiy9WxXbosZajPDuWn0iYVv7oyD/wdekD9aaeOfaXi0=
X-Received: by 2002:a17:902:b58e:b0:16c:489e:7a0b with SMTP id
 a14-20020a170902b58e00b0016c489e7a0bmr22834108pls.145.1659474131567; Tue, 02
 Aug 2022 14:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220727064913.1041427-1-atishp@rivosinc.com>
 <20220727064913.1041427-3-atishp@rivosinc.com>
 <4fe4fca9-71ea-de77-1db1-b02302599881@iscas.ac.cn>
 <CAHBxVyG3rqFRrTk0FavPm7M6bdOjkeoyb6OkN4JOVNVg25t6yQ@mail.gmail.com>
 <aaada990-4c26-3352-2eae-6168d45bb87d@iscas.ac.cn>
In-Reply-To: <aaada990-4c26-3352-2eae-6168d45bb87d@iscas.ac.cn>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 2 Aug 2022 14:02:00 -0700
Message-ID: <CAHBxVyG9TcsAWhLc6+pQK3xzdq5OVy_LMRWLhvXaGkQSZATsig@mail.gmail.com>
Subject: Re: [PATCH v11 2/6] target/riscv: Simplify counter predicate function
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000020651505e5486ec7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Tue, 02 Aug 2022 21:02:16 -0000

--00000000000020651505e5486ec7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2022 at 5:56 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

>
> =E5=9C=A8 2022/7/28 =E4=B8=8A=E5=8D=885:40, Atish Kumar Patra =E5=86=99=
=E9=81=93:
>
>
>
> On Wed, Jul 27, 2022 at 1:35 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>>
>> =E5=9C=A8 2022/7/27 =E4=B8=8B=E5=8D=882:49, Atish Patra =E5=86=99=E9=81=
=93:
>> > All the hpmcounters and the fixed counters (CY, IR, TM) can be
>> represented
>> > as a unified counter. Thus, the predicate function doesn't need handle
>> each
>> > case separately.
>> >
>> > Simplify the predicate function so that we just handle things
>> differently
>> > between RV32/RV64 and S/HS mode.
>> >
>> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> > ---
>> >   target/riscv/csr.c | 112 +++++--------------------------------------=
--
>> >   1 file changed, 11 insertions(+), 101 deletions(-)
>> >
>> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> > index 1233bfa0a726..57dbbf9b09a0 100644
>> > --- a/target/riscv/csr.c
>> > +++ b/target/riscv/csr.c
>> > @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int
>> csrno)
>> >       CPUState *cs =3D env_cpu(env);
>> >       RISCVCPU *cpu =3D RISCV_CPU(cs);
>> >       int ctr_index;
>> > +    target_ulong ctr_mask;
>> >       int base_csrno =3D CSR_CYCLE;
>> >       bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? true : false;
>> >
>> > @@ -82,122 +83,31 @@ static RISCVException ctr(CPURISCVState *env, int
>> csrno)
>> >           base_csrno +=3D 0x80;
>> >       }
>> >       ctr_index =3D csrno - base_csrno;
>> > +    ctr_mask =3D BIT(ctr_index);
>> >
>> >       if ((csrno >=3D CSR_CYCLE && csrno <=3D CSR_INSTRET) ||
>> >           (csrno >=3D CSR_CYCLEH && csrno <=3D CSR_INSTRETH)) {
>> >           goto skip_ext_pmu_check;
>> >       }
>> >
>> > -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs &
>> BIT(ctr_index)))) {
>> > +    if (!(cpu->pmu_avail_ctrs & ctr_mask)) {
>> >           /* No counter is enabled in PMU or the counter is out of
>> range */
>> >           return RISCV_EXCP_ILLEGAL_INST;
>> >       }
>> >
>> >   skip_ext_pmu_check:
>> >
>> > -    if (env->priv =3D=3D PRV_S) {
>> > -        switch (csrno) {
>> > -        case CSR_CYCLE:
>> > -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
>> > -                return RISCV_EXCP_ILLEGAL_INST;
>> > -            }
>> > -            break;
>> > -        case CSR_TIME:
>> > -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
>> > -                return RISCV_EXCP_ILLEGAL_INST;
>> > -            }
>> > -            break;
>> > -        case CSR_INSTRET:
>> > -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
>> > -                return RISCV_EXCP_ILLEGAL_INST;
>> > -            }
>> > -            break;
>> > -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
>> > -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
>> > -                return RISCV_EXCP_ILLEGAL_INST;
>> > -            }
>> > -            break;
>> > -        }
>> > -        if (rv32) {
>> > -            switch (csrno) {
>> > -            case CSR_CYCLEH:
>> > -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
>> > -                    return RISCV_EXCP_ILLEGAL_INST;
>> > -                }
>> > -                break;
>> > -            case CSR_TIMEH:
>> > -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
>> > -                    return RISCV_EXCP_ILLEGAL_INST;
>> > -                }
>> > -                break;
>> > -            case CSR_INSTRETH:
>> > -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
>> > -                    return RISCV_EXCP_ILLEGAL_INST;
>> > -                }
>> > -                break;
>> > -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
>> > -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
>> > -                    return RISCV_EXCP_ILLEGAL_INST;
>> > -                }
>> > -                break;
>> > -            }
>> > -        }
>> > +    if (((env->priv =3D=3D PRV_S) && (!get_field(env->mcounteren,
>> ctr_mask))) ||
>> > +       ((env->priv =3D=3D PRV_U) && (!get_field(env->scounteren,
>> ctr_mask)))) {
>> > +        return RISCV_EXCP_ILLEGAL_INST;
>> >       }
>> >
>> >       if (riscv_cpu_virt_enabled(env)) {
>> > -        switch (csrno) {
>> > -        case CSR_CYCLE:
>> > -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>> > -                get_field(env->mcounteren, COUNTEREN_CY)) {
>> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > -            }
>> > -            break;
>> > -        case CSR_TIME:
>> > -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>> > -                get_field(env->mcounteren, COUNTEREN_TM)) {
>> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > -            }
>> > -            break;
>> > -        case CSR_INSTRET:
>> > -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>> > -                get_field(env->mcounteren, COUNTEREN_IR)) {
>> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > -            }
>> > -            break;
>> > -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
>> > -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
>> > -                 get_field(env->mcounteren, 1 << ctr_index)) {
>> > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > -            }
>> > -            break;
>> > -        }
>> > -        if (rv32) {
>> > -            switch (csrno) {
>> > -            case CSR_CYCLEH:
>> > -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>> > -                    get_field(env->mcounteren, COUNTEREN_CY)) {
>> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > -                }
>> > -                break;
>> > -            case CSR_TIMEH:
>> > -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>> > -                    get_field(env->mcounteren, COUNTEREN_TM)) {
>> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > -                }
>> > -                break;
>> > -            case CSR_INSTRETH:
>> > -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>> > -                    get_field(env->mcounteren, COUNTEREN_IR)) {
>> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > -                }
>> > -                break;
>> > -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
>> > -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
>> > -                     get_field(env->mcounteren, 1 << ctr_index)) {
>> > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > -                }
>> > -                break;
>> > -            }
>> > +        if (!get_field(env->mcounteren, ctr_mask)) {
>> > +            /* The bit must be set in mcountern for HS mode access */
>> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > +        } else if (!get_field(env->hcounteren, ctr_mask)) {
>> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> >           }
>>
>> The logic is changed here. In original logic,
>> RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered when
>>
>> !get_field(env->hcounteren, 1 << ctr_index) && get_field(env->mcounteren=
,
>> 1 << ctr_index)
>>
>> The new logic is RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered when
>> !get_field(env->mcounteren, ctr_mask)
>>
>> or !get_field(env->hcounteren, 1 << ctr_index) &&
>> get_field(env->mcounteren, 1 << ctr_index)
>>
>>
> Yes. It's just an optimization where we can break early just by checking
> mcountern. Do you see any issue with it ?
>
> The section 8.6.1 of  riscv- privileged spec lists the cases (including
> the Xcounten ralated cases) which will raise a
>
> virtual instruction exception. However all the the Xcounten ralated cases
> have a common condition
>
>         "the same bit in mcounteren is 1".
>

Ahh yes. Got it. I will revert it to the original logic in the next version=
.


> So  this  optimization seems not correct.
>
> Regards,
>
> Weiwei Li
>
>
>
>> Regards,
>>
>> Weiwei Li
>>
>> >       }
>> >   #endif
>>
>>

--00000000000020651505e5486ec7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 5:56 PM Weiwe=
i Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn">liweiwei@iscas.ac.cn</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p><br>
    </p>
    <div>=E5=9C=A8 2022/7/28 =E4=B8=8A=E5=8D=885:40, Atish Kumar Patra
      =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 1:3=
5
            AM Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn" target=
=3D"_blank">liweiwei@iscas.ac.cn</a>&gt; wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote"><br>
            =E5=9C=A8 2022/7/27 =E4=B8=8B=E5=8D=882:49, Atish Patra =E5=86=
=99=E9=81=93:<br>
            &gt; All the hpmcounters and the fixed counters (CY, IR, TM)
            can be represented<br>
            &gt; as a unified counter. Thus, the predicate function
            doesn&#39;t need handle each<br>
            &gt; case separately.<br>
            &gt;<br>
            &gt; Simplify the predicate function so that we just handle
            things differently<br>
            &gt; between RV32/RV64 and S/HS mode.<br>
            &gt;<br>
            &gt; Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail=
.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt;<br>
            &gt; Acked-by: Alistair Francis &lt;<a href=3D"mailto:alistair.=
francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
            &gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@ri=
vosinc.com" target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
            &gt; ---<br>
            &gt;=C2=A0 =C2=A0target/riscv/csr.c | 112
            +++++----------------------------------------<br>
            &gt;=C2=A0 =C2=A01 file changed, 11 insertions(+), 101 deletion=
s(-)<br>
            &gt;<br>
            &gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
            &gt; index 1233bfa0a726..57dbbf9b09a0 100644<br>
            &gt; --- a/target/riscv/csr.c<br>
            &gt; +++ b/target/riscv/csr.c<br>
            &gt; @@ -74,6 +74,7 @@ static RISCVException
            ctr(CPURISCVState *env, int csrno)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<b=
r>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(cs);=
<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ctr_index;<br>
            &gt; +=C2=A0 =C2=A0 target_ulong ctr_mask;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int base_csrno =3D CSR_CYCLE;<br=
>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool rv32 =3D riscv_cpu_mxl(env)=
 =3D=3D MXL_RV32 ? true
            : false;<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; @@ -82,122 +83,31 @@ static RISCVException
            ctr(CPURISCVState *env, int csrno)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_csrno +=3D 0x=
80;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctr_index =3D csrno - base_csrno=
;<br>
            &gt; +=C2=A0 =C2=A0 ctr_mask =3D BIT(ctr_index);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((csrno &gt;=3D CSR_CYCLE &am=
p;&amp; csrno &lt;=3D
            CSR_INSTRET) ||<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(csrno &gt;=3D CSR=
_CYCLEH &amp;&amp; csrno
            &lt;=3D CSR_INSTRETH)) {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto skip_ext_pmu_=
check;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; -=C2=A0 =C2=A0 if ((!cpu-&gt;cfg.pmu_num ||
            !(cpu-&gt;pmu_avail_ctrs &amp; BIT(ctr_index)))) {<br>
            &gt; +=C2=A0 =C2=A0 if (!(cpu-&gt;pmu_avail_ctrs &amp; ctr_mask=
)) {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* No counter is e=
nabled in PMU or the
            counter is out of range */<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_=
ILLEGAL_INST;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0skip_ext_pmu_check:<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; -=C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (csrno) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_CYCLE:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(=
env-&gt;mcounteren,
            COUNTEREN_CY)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_TIME:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(=
env-&gt;mcounteren,
            COUNTEREN_TM)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_INSTRET:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(=
env-&gt;mcounteren,
            COUNTEREN_IR)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_HPMCOUNTER3...CSR_HP=
MCOUNTER31:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(=
env-&gt;mcounteren, 1
            &lt;&lt; ctr_index)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rv32) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (csrno) =
{<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_CYCLEH=
:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (!get_field(env-&gt;mcounteren,
            COUNTEREN_CY)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
reak;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_TIMEH:=
<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (!get_field(env-&gt;mcounteren,
            COUNTEREN_TM)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
reak;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_INSTRE=
TH:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (!get_field(env-&gt;mcounteren,
            COUNTEREN_IR)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
reak;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_HPMCOU=
NTER3H...CSR_HPMCOUNTER31H:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (!get_field(env-&gt;mcounteren, 1
            &lt;&lt; ctr_index)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
reak;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; +=C2=A0 =C2=A0 if (((env-&gt;priv =3D=3D PRV_S) &amp;&amp;
            (!get_field(env-&gt;mcounteren, ctr_mask))) ||<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0((env-&gt;priv =3D=3D PRV_U) &=
amp;&amp;
            (!get_field(env-&gt;scounteren, ctr_mask)))) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INS=
T;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env))=
 {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (csrno) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_CYCLE:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(=
env-&gt;hcounteren,
            COUNTEREN_CY) &amp;&amp;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
et_field(env-&gt;mcounteren,
            COUNTEREN_CY)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_TIME:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(=
env-&gt;hcounteren,
            COUNTEREN_TM) &amp;&amp;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
et_field(env-&gt;mcounteren,
            COUNTEREN_TM)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_INSTRET:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(=
env-&gt;hcounteren,
            COUNTEREN_IR) &amp;&amp;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
et_field(env-&gt;mcounteren,
            COUNTEREN_IR)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_HPMCOUNTER3...CSR_HP=
MCOUNTER31:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(=
env-&gt;hcounteren, 1
            &lt;&lt; ctr_index) &amp;&amp;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0get_field(env-&gt;mcounteren, 1
            &lt;&lt; ctr_index)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rv32) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (csrno) =
{<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_CYCLEH=
:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (!get_field(env-&gt;hcounteren,
            COUNTEREN_CY) &amp;&amp;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 get_field(env-&gt;mcounteren,
            COUNTEREN_CY)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
reak;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_TIMEH:=
<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (!get_field(env-&gt;hcounteren,
            COUNTEREN_TM) &amp;&amp;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 get_field(env-&gt;mcounteren,
            COUNTEREN_TM)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
reak;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_INSTRE=
TH:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (!get_field(env-&gt;hcounteren,
            COUNTEREN_IR) &amp;&amp;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 get_field(env-&gt;mcounteren,
            COUNTEREN_IR)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
reak;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CSR_HPMCOU=
NTER3H...CSR_HPMCOUNTER31H:<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (!get_field(env-&gt;hcounteren, 1
            &lt;&lt; ctr_index) &amp;&amp;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0get_field(env-&gt;mcounteren, 1
            &lt;&lt; ctr_index)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
reak;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;mcount=
eren, ctr_mask))
            {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The bit must=
 be set in mcountern for HS
            mode access */<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EX=
CP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!get_field(env-&gt=
;hcounteren,
            ctr_mask)) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EX=
CP_VIRT_INSTRUCTION_FAULT;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            <br>
            The logic is changed here. In original logic, <br>
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered when<br>
            <br>
            !get_field(env-&gt;hcounteren, 1 &lt;&lt; ctr_index)
            &amp;&amp; get_field(env-&gt;mcounteren, 1 &lt;&lt;
            ctr_index)<br>
            <br>
            The new logic is RISCV_EXCP_VIRT_INSTRUCTION_FAULT is
            triggered when !get_field(env-&gt;mcounteren, ctr_mask)<br>
            <br>
            or !get_field(env-&gt;hcounteren, 1 &lt;&lt; ctr_index)
            &amp;&amp; get_field(env-&gt;mcounteren, 1 &lt;&lt;
            ctr_index)<br>
            <br>
          </blockquote>
          <div><br>
            Yes. It&#39;s just an optimization where we can break early jus=
t
            by checking mcountern. Do you see any issue with it ?</div>
        </div>
      </div>
    </blockquote>
    <p>The section 8.6.1 of=C2=A0 riscv- privileged spec lists the cases
      (including the Xcounten ralated cases) which will raise a<br>
    </p>
    <p>virtual instruction exception. However all the the Xcounten
      ralated cases have a common condition <br>
    </p>
    <p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;the same bit in mco=
unteren is 1&quot;.</p></div></blockquote><div><br></div><div>Ahh yes. Got =
it. I will revert it to the original logic in the next version.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <p> So=C2=A0 this=C2=A0 optimization seems not correct.<br>
    </p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote">
            Regards,<br>
            <br>
            Weiwei Li<br>
            <br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0#endif<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div></div>

--00000000000020651505e5486ec7--


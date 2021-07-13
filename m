Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3CeD-00047d-7g
	for mharc-qemu-riscv@gnu.org; Tue, 13 Jul 2021 03:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1m3CeA-000451-Vl
 for qemu-riscv@nongnu.org; Tue, 13 Jul 2021 03:16:03 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:40654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1m3Ce8-0005d3-5G
 for qemu-riscv@nongnu.org; Tue, 13 Jul 2021 03:16:02 -0400
Received: by mail-pl1-x632.google.com with SMTP id j3so8701235plx.7
 for <qemu-riscv@nongnu.org>; Tue, 13 Jul 2021 00:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZIxC97vo3D/9ttg5bUmdmcZs3xyDx1jpdRBLzqRnrn4=;
 b=L/qp8DgRV3vXBa7RXmsw8KdAM7mX6XIj2Bdirec//LXfwez+T/sRnL+utnaBW/StI3
 wZ8TFgZhZryx0fq2seaiBOivAbOPremRbzkzpY0Gsf3Aml9cRb2zJOpCnCPp5TEtyzTS
 YF2m7hwB5kCdCwByjnp/o5pKyAp80Z8DT2MT6gPFifkB38I4OsrkseJhD71BVJjrtYG8
 svYY4I4zRc/dbu/1oNSce/VcS+Qh6xUFixOXtr1iQyh5pUedSjh8nzGZTG2pDU5hArSf
 0w3EqAnVSm18Si6t4HGIflPHovFLEJ0zRds6KfLipyZPmO31XCD/LeYOolhsrFLvehJy
 Um9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZIxC97vo3D/9ttg5bUmdmcZs3xyDx1jpdRBLzqRnrn4=;
 b=qOvnJE4OhxzOWDy7vqK681zQbWsjbaKH9pT0oMJKtD+6IFwMiEnC8FYJh84zYGs4Ob
 BMwS3GFclSenVdW1kEJ8KCRROkmoRxxxSgMFbBMdtV9thjQzt9h2G9L0O+sGZr0GyDkj
 B4aA3TSlYchjosN8px40uRnWedy4iGp3w29dOmF6kFjB7gJnZEJnLLURZjVQ9XlusiRa
 kQLoh08g/Ktkk+sM2ujzQI56FAnxPjzRqC5BJ1MrU3uXsydiCgrO+N9Yn2dE3C0HDl4M
 ItPUsDOiVSdgYcP0nX1maT6FpckvAkK/WoVH9fngqrTRS66yXXdcNgYlplNuNjlfvj4t
 DzhA==
X-Gm-Message-State: AOAM532dYyV0esPkZXHA8kXwcNqFj4w7zY8aH/dkdilVyDQpWBvYOwwk
 wxND0gVCzOCGQNT0fzO4cNKnRg==
X-Google-Smtp-Source: ABdhPJykeWLaas46TZ9by8/73KbjyoSaUJYQ3ZYi35yKlGlMNQs04jpMzxjKcwg7gjQDooVrAH/dcg==
X-Received: by 2002:a17:902:bd96:b029:129:24e:43b5 with SMTP id
 q22-20020a170902bd96b0290129024e43b5mr2507112pls.66.1626160558340; 
 Tue, 13 Jul 2021 00:15:58 -0700 (PDT)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com.
 [209.85.210.169])
 by smtp.gmail.com with ESMTPSA id d13sm17865411pfn.136.2021.07.13.00.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 00:15:57 -0700 (PDT)
Received: by mail-pf1-f169.google.com with SMTP id q10so18688468pfj.12;
 Tue, 13 Jul 2021 00:15:57 -0700 (PDT)
X-Received: by 2002:aa7:938c:0:b029:32a:1725:a3d7 with SMTP id
 t12-20020aa7938c0000b029032a1725a3d7mr3073973pfe.64.1626160557533; Tue, 13
 Jul 2021 00:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-12-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-12-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 13 Jul 2021 15:15:46 +0800
X-Gmail-Original-Message-ID: <CANzO1D17WurLgK2+s1d-U8z4tRFGDKcLBjgOenExuLFA9Po2nQ@mail.gmail.com>
Message-ID: <CANzO1D17WurLgK2+s1d-U8z4tRFGDKcLBjgOenExuLFA9Po2nQ@mail.gmail.com>
Subject: Re: [RFC PATCH 11/11] target/riscv: Update interrupt return in CLIC
 mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000612c9f05c6fc0211"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Tue, 13 Jul 2021 07:16:03 -0000

--000000000000612c9f05c6fc0211
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:55=E5=AF=AB=E9=81=93=EF=BC=9A

> When a vectored interrupt is selected and serviced, the hardware will
> automatically clear the corresponding pending bit in edge-triggered mode.
> This may lead to a lower priviledge interrupt pending forever.
>
> Therefore when interrupts return, pull a pending interrupt to service.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/op_helper.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 1eddcb94de..42563b22ba 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -24,6 +24,10 @@
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
>
> +#if !defined(CONFIG_USER_ONLY)
> +#include "hw/intc/riscv_clic.h"
> +#endif
> +
>  /* Exceptions processing helpers */
>  void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
>                                            uint32_t exception, uintptr_t
> pc)
> @@ -130,6 +134,17 @@ target_ulong helper_sret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
>          mstatus =3D set_field(mstatus, MSTATUS_SPIE, 1);
>          mstatus =3D set_field(mstatus, MSTATUS_SPP, PRV_U);
>          env->mstatus =3D mstatus;
> +
> +        if (riscv_clic_is_clic_mode(env)) {
> +            CPUState *cs =3D env_cpu(env);
> +            target_ulong spil =3D get_field(env->scause, SCAUSE_SPIL);
> +            env->mintstatus =3D set_field(env->mintstatus, MINTSTATUS_SI=
L,
> spil);
> +            env->scause =3D set_field(env->scause, SCAUSE_SPIE, 0);
> +            env->scause =3D set_field(env->scause, SCAUSE_SPP, PRV_U);
> +            qemu_mutex_lock_iothread();
> +            riscv_clic_get_next_interrupt(env->clic, cs->cpu_index);
> +            qemu_mutex_unlock_iothread();
> +        }
>      }
>
>      riscv_cpu_set_mode(env, prev_priv);
> @@ -172,6 +187,16 @@ target_ulong helper_mret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
>          riscv_cpu_set_virt_enabled(env, prev_virt);
>      }
>
> +    if (riscv_clic_is_clic_mode(env)) {
> +        CPUState *cs =3D env_cpu(env);
> +        target_ulong mpil =3D get_field(env->mcause, MCAUSE_MPIL);
> +        env->mintstatus =3D set_field(env->mintstatus, MINTSTATUS_MIL,
> mpil);
> +        env->mcause =3D set_field(env->mcause, MCAUSE_MPIE, 0);
> +        env->mcause =3D set_field(env->mcause, MCAUSE_MPP, PRV_U);
> +        qemu_mutex_lock_iothread();
> +        riscv_clic_get_next_interrupt(env->clic, cs->cpu_index);
> +        qemu_mutex_unlock_iothread();
> +    }
>      return retpc;
>  }
>
> --
> 2.25.1
>
>
>
A little note here.

According to spec, for nesting interrupts:
  To take advantage of hardware preemption in the new CLIC,
  inline handlers must save and restore xepc and xcause before enabling
interrupts.
  (Section 9.2)

However, xstatus.xpp will be set to U-mode when xret instruction is
executed.
Which will incorrectly switch to U-mode when executing xret instruction
second time in first ISR.
E.g.

ISR 1 --------------------------------------------------------- xret =3D>
Current privilege is incorrectly set to U-mode.
                ISR 2 --------------- xret =3D> xstatus.xpp is set to U-mod=
e.

Therefore, in our SiFive CLIC hardware implementation.
xstatus.xpp is set to the privilege mode when xret instruction is executed
(i.e. current privilege mode) under CLIC mode.
But this behavior is not documented in CLIC spec explicitly.

Regards,
Frank Chang

--000000000000612c9f05c6fc0211
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:55=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">When a vectored interrupt is selected and serviced, th=
e hardware will<br>
automatically clear the corresponding pending bit in edge-triggered mode.<b=
r>
This may lead to a lower priviledge interrupt pending forever.<br>
<br>
Therefore when interrupts return, pull a pending interrupt to service.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/op_helper.c | 25 +++++++++++++++++++++++++<br>
=C2=A01 file changed, 25 insertions(+)<br>
<br>
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c<br>
index 1eddcb94de..42563b22ba 100644<br>
--- a/target/riscv/op_helper.c<br>
+++ b/target/riscv/op_helper.c<br>
@@ -24,6 +24,10 @@<br>
=C2=A0#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;exec/helper-proto.h&quot;<br>
<br>
+#if !defined(CONFIG_USER_ONLY)<br>
+#include &quot;hw/intc/riscv_clic.h&quot;<br>
+#endif<br>
+<br>
=C2=A0/* Exceptions processing helpers */<br>
=C2=A0void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t exception, uintptr_t pc)<br>
@@ -130,6 +134,17 @@ target_ulong helper_sret(CPURISCVState *env, target_ul=
ong cpu_pc_deb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mstatus =3D set_field(mstatus, MSTATUS_SP=
IE, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mstatus =3D set_field(mstatus, MSTATUS_SP=
P, PRV_U);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mstatus =3D mstatus;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_clic_is_clic_mode(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong spil =3D get_field(=
env-&gt;scause, SCAUSE_SPIL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mintstatus =3D set_field=
(env-&gt;mintstatus, MINTSTATUS_SIL, spil);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;scause =3D set_field(env=
-&gt;scause, SCAUSE_SPIE, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;scause =3D set_field(env=
-&gt;scause, SCAUSE_SPP, PRV_U);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_get_next_interrupt(en=
v-&gt;clic, cs-&gt;cpu_index);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0riscv_cpu_set_mode(env, prev_priv);<br>
@@ -172,6 +187,16 @@ target_ulong helper_mret(CPURISCVState *env, target_ul=
ong cpu_pc_deb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_cpu_set_virt_enabled(env, prev_virt=
);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (riscv_clic_is_clic_mode(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong mpil =3D get_field(env-&gt;mcause=
, MCAUSE_MPIL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mintstatus =3D set_field(env-&gt;mints=
tatus, MINTSTATUS_MIL, mpil);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mcause =3D set_field(env-&gt;mcause, M=
CAUSE_MPIE, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mcause =3D set_field(env-&gt;mcause, M=
CAUSE_MPP, PRV_U);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_get_next_interrupt(env-&gt;clic, cs=
-&gt;cpu_index);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0return retpc;<br>
=C2=A0}<br>
<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>A little note here.</div><div><br></di=
v><div>According to spec, for nesting interrupts:</div><div>=C2=A0 To take =
advantage of hardware preemption in the new CLIC,</div><div>=C2=A0 inline h=
andlers must save and restore xepc and xcause before enabling interrupts.<b=
r></div><div>=C2=A0 (Section 9.2)</div><div><br></div><div>However, xstatus=
.xpp will be set to U-mode when xret instruction is executed.</div><div>Whi=
ch will incorrectly switch to U-mode when executing xret instruction second=
 time in first ISR.</div><div>E.g.</div><div><br></div><div>ISR 1 ---------=
------------------------------------------------ xret =3D&gt; Current privi=
lege is incorrectly set to U-mode.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ISR 2 --------------- xret =3D&gt; xstatus.xpp is set =
to U-mode.</div><div><br></div><div>Therefore, in our SiFive CLIC hardware =
implementation.</div><div>xstatus.xpp is set to the privilege mode when xre=
t instruction is executed</div><div>(i.e. current privilege mode) under CLI=
C mode.</div><div>But this behavior is not documented in CLIC spec explicit=
ly.</div><div><br></div><div>Regards,</div><div>Frank Chang</div></div></di=
v>

--000000000000612c9f05c6fc0211--


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtDs-0006Xs-0J
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtDm-0006Sg-GP
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:22:06 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:45968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtDk-00031d-8D
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:22:02 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id a21so2613840vsp.12
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GvLlNSJNAm2e5y1mGaVxHQf2vDe+JRh2+vxn7dLS6Q8=;
 b=KAI/+L5+S0kJ/VSh7jQq/ZhSQOo/Y911GmvRNUU0fxJLWxJ85cojCKbjQ/burj/sJs
 8jP0Mo+OkcAvfbZzxpxBfDoRQC3QMiy/GlaErHVylvIFEh3cpJlZbzjH5m2PRAwwerXV
 OXAqL887scrUTKwuoqrxNRgf2qIFBo/2ffPsPUduOYRERtdSJym34juUVwc8TR3bRDvY
 klN5CfYjeiyg7f9cTI+cwpM37PtvTiERyyOqqxVE7mKRrDnVhqo/WeCbBy6mNObuFRnt
 VKxSJzfthNnRH4iiNWFG4xr7tyicASA2ptsRcd14hkGkZKYOO8DEyDSEYCjGq7TGeECS
 BVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GvLlNSJNAm2e5y1mGaVxHQf2vDe+JRh2+vxn7dLS6Q8=;
 b=q2ItO+h6QWkK41UnwozLayTkfUtm3bIjTtt0t4QQk7472h4Z6NTBAieUcWGASMQTxS
 OJsDwqV7Z/yX9xJw3sFNtaVY/QpKCCJF2IBZTQkUjZp3Q01nToZPEVCXNbCvsGVh+b2V
 kniy+L4eQ3ofsZ26wsz7BD9iB8vRqMt9YfNkln8VyGiUeRicYi7PP5iwx0qvUtsbFiuH
 G2tICKuZmfUUO1xOOFYBffNexibZg3pBqmEV6YU4oclatdhj9pZQO+atAF46sszrWBL+
 9DSaS5o+UyD0O9LnG55ls0MnqEPWtx594QiWvcdEZzMXNe4RiEhE4wBdY6hum6h0yFec
 TB5A==
X-Gm-Message-State: AOAM530NGiJ7xhGz15c2zP4u9QL/5DYqkFzulzFkgNSOvrmfInU7jC7n
 iJ9oyp8WGrCnbdIcob7hbg5DLjBDxd9hjaZ6pG8xmA==
X-Google-Smtp-Source: ABdhPJz9Xxg/0BFD23MkWO/hkVB0ETcN3oIwNV7EFJeOjoMt7UNEv24P3fYdG5CVmWkysLviz0WQ8pxpCb8jcWjUvqY=
X-Received: by 2002:a05:6102:5a:: with SMTP id
 k26mr4339725vsp.26.1630614119364; 
 Thu, 02 Sep 2021 13:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-15-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-15-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:21:48 -0600
Message-ID: <CANCZdfoD3zvOSRUMxEyGM_7PDEHfS_j2eDSU9drAvdtDmuOxdA@mail.gmail.com>
Subject: Re: [PATCH 14/24] target/mips: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, Chris Wulff <crwulff@gmail.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc <qemu-ppc@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: multipart/alternative; boundary="00000000000059d41505cb08ef67"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 20:22:06 -0000

--00000000000059d41505cb08ef67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/mips/tcg/tcg-internal.h      |  5 +++--
>  target/mips/cpu.c                   |  2 +-
>  target/mips/tcg/exception.c         | 18 ------------------
>  target/mips/tcg/sysemu/tlb_helper.c | 18 ++++++++++++++++++
>  target/mips/tcg/user/tlb_helper.c   |  5 -----
>  5 files changed, 22 insertions(+), 26 deletions(-)
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/mips/tcg/tcg-internal.h
> b/target/mips/tcg/tcg-internal.h
> index 81b14eb219e..c7a77ddccdd 100644
> --- a/target/mips/tcg/tcg-internal.h
> +++ b/target/mips/tcg/tcg-internal.h
> @@ -18,8 +18,6 @@
>  void mips_tcg_init(void);
>
>  void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock
> *tb);
> -void mips_cpu_do_interrupt(CPUState *cpu);
> -bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool probe, uintptr_t retaddr);
> @@ -41,6 +39,9 @@ static inline void QEMU_NORETURN
> do_raise_exception(CPUMIPSState *env,
>
>  #if !defined(CONFIG_USER_ONLY)
>
> +void mips_cpu_do_interrupt(CPUState *cpu);
> +bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +
>  void mmu_init(CPUMIPSState *env, const mips_def_t *def);
>
>  void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t
> *pagemask);
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index d426918291a..00e0c55d0e4 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -539,10 +539,10 @@ static const struct SysemuCPUOps mips_sysemu_ops =
=3D {
>  static const struct TCGCPUOps mips_tcg_ops =3D {
>      .initialize =3D mips_tcg_init,
>      .synchronize_from_tb =3D mips_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D mips_cpu_exec_interrupt,
>      .tlb_fill =3D mips_cpu_tlb_fill,
>
>  #if !defined(CONFIG_USER_ONLY)
> +    .cpu_exec_interrupt =3D mips_cpu_exec_interrupt,
>      .do_interrupt =3D mips_cpu_do_interrupt,
>      .do_transaction_failed =3D mips_cpu_do_transaction_failed,
>      .do_unaligned_access =3D mips_cpu_do_unaligned_access,
> diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
> index 4fb8b00711d..7b3026b105b 100644
> --- a/target/mips/tcg/exception.c
> +++ b/target/mips/tcg/exception.c
> @@ -86,24 +86,6 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const
> TranslationBlock *tb)
>      env->hflags |=3D tb->flags & MIPS_HFLAG_BMASK;
>  }
>
> -bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> -{
> -    if (interrupt_request & CPU_INTERRUPT_HARD) {
> -        MIPSCPU *cpu =3D MIPS_CPU(cs);
> -        CPUMIPSState *env =3D &cpu->env;
> -
> -        if (cpu_mips_hw_interrupts_enabled(env) &&
> -            cpu_mips_hw_interrupts_pending(env)) {
> -            /* Raise it */
> -            cs->exception_index =3D EXCP_EXT_INTERRUPT;
> -            env->error_code =3D 0;
> -            mips_cpu_do_interrupt(cs);
> -            return true;
> -        }
> -    }
> -    return false;
> -}
> -
>  static const char * const excp_names[EXCP_LAST + 1] =3D {
>      [EXCP_RESET] =3D "reset",
>      [EXCP_SRESET] =3D "soft reset",
> diff --git a/target/mips/tcg/sysemu/tlb_helper.c
> b/target/mips/tcg/sysemu/tlb_helper.c
> index a150a014ec1..73254d19298 100644
> --- a/target/mips/tcg/sysemu/tlb_helper.c
> +++ b/target/mips/tcg/sysemu/tlb_helper.c
> @@ -1339,6 +1339,24 @@ void mips_cpu_do_interrupt(CPUState *cs)
>      cs->exception_index =3D EXCP_NONE;
>  }
>
> +bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> +{
> +    if (interrupt_request & CPU_INTERRUPT_HARD) {
> +        MIPSCPU *cpu =3D MIPS_CPU(cs);
> +        CPUMIPSState *env =3D &cpu->env;
> +
> +        if (cpu_mips_hw_interrupts_enabled(env) &&
> +            cpu_mips_hw_interrupts_pending(env)) {
> +            /* Raise it */
> +            cs->exception_index =3D EXCP_EXT_INTERRUPT;
> +            env->error_code =3D 0;
> +            mips_cpu_do_interrupt(cs);
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
>  void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
>  {
>      CPUState *cs =3D env_cpu(env);
> diff --git a/target/mips/tcg/user/tlb_helper.c
> b/target/mips/tcg/user/tlb_helper.c
> index b835144b820..210c6d529ef 100644
> --- a/target/mips/tcg/user/tlb_helper.c
> +++ b/target/mips/tcg/user/tlb_helper.c
> @@ -57,8 +57,3 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int
> size,
>      raise_mmu_exception(env, address, access_type);
>      do_raise_exception_err(env, cs->exception_index, env->error_code,
> retaddr);
>  }
> -
> -void mips_cpu_do_interrupt(CPUState *cs)
> -{
> -    cs->exception_index =3D EXCP_NONE;
> -}
> --
> 2.31.1
>
>

--00000000000059d41505cb08ef67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:18 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Restrict cpu_exec_interrupt() and its callees to sysemu.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/mips/tcg/tcg-internal.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++--<br=
>
=C2=A0target/mips/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0target/mips/tcg/exception.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ---=
---------------<br>
=C2=A0target/mips/tcg/sysemu/tlb_helper.c | 18 ++++++++++++++++++<br>
=C2=A0target/mips/tcg/user/tlb_helper.c=C2=A0 =C2=A0|=C2=A0 5 -----<br>
=C2=A05 files changed, 22 insertions(+), 26 deletions(-)<br>
<br></blockquote><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail=
-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:=
2px 0px 0px">=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.=
h<br>
index 81b14eb219e..c7a77ddccdd 100644<br>
--- a/target/mips/tcg/tcg-internal.h<br>
+++ b/target/mips/tcg/tcg-internal.h<br>
@@ -18,8 +18,6 @@<br>
=C2=A0void mips_tcg_init(void);<br>
<br>
=C2=A0void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBloc=
k *tb);<br>
-void mips_cpu_do_interrupt(CPUState *cpu);<br>
-bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
=C2=A0bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bool probe, uintptr_t retaddr);<br>
@@ -41,6 +39,9 @@ static inline void QEMU_NORETURN do_raise_exception(CPUMI=
PSState *env,<br>
<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
<br>
+void mips_cpu_do_interrupt(CPUState *cpu);<br>
+bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
+<br>
=C2=A0void mmu_init(CPUMIPSState *env, const mips_def_t *def);<br>
<br>
=C2=A0void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *p=
agemask);<br>
diff --git a/target/mips/cpu.c b/target/mips/cpu.c<br>
index d426918291a..00e0c55d0e4 100644<br>
--- a/target/mips/cpu.c<br>
+++ b/target/mips/cpu.c<br>
@@ -539,10 +539,10 @@ static const struct SysemuCPUOps mips_sysemu_ops =3D =
{<br>
=C2=A0static const struct TCGCPUOps mips_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D mips_tcg_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D mips_cpu_synchronize_from_tb,<=
br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D mips_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D mips_cpu_tlb_fill,<br>
<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D mips_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D mips_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D mips_cpu_do_transaction_fail=
ed,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D mips_cpu_do_unaligned_access,<=
br>
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c<br>
index 4fb8b00711d..7b3026b105b 100644<br>
--- a/target/mips/tcg/exception.c<br>
+++ b/target/mips/tcg/exception.c<br>
@@ -86,24 +86,6 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const Tr=
anslationBlock *tb)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;hflags |=3D tb-&gt;flags &amp; MIPS_HFLAG_BMASK=
;<br>
=C2=A0}<br>
<br>
-bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
-{<br>
-=C2=A0 =C2=A0 if (interrupt_request &amp; CPU_INTERRUPT_HARD) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 MIPSCPU *cpu =3D MIPS_CPU(cs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUMIPSState *env =3D &amp;cpu-&gt;env;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_mips_hw_interrupts_enabled(env) &amp;&=
amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_mips_hw_interrupts_pending(e=
nv)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Raise it */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;exception_index =3D EXCP_=
EXT_INTERRUPT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;error_code =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mips_cpu_do_interrupt(cs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return false;<br>
-}<br>
-<br>
=C2=A0static const char * const excp_names[EXCP_LAST + 1] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[EXCP_RESET] =3D &quot;reset&quot;,<br>
=C2=A0 =C2=A0 =C2=A0[EXCP_SRESET] =3D &quot;soft reset&quot;,<br>
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/t=
lb_helper.c<br>
index a150a014ec1..73254d19298 100644<br>
--- a/target/mips/tcg/sysemu/tlb_helper.c<br>
+++ b/target/mips/tcg/sysemu/tlb_helper.c<br>
@@ -1339,6 +1339,24 @@ void mips_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D EXCP_NONE;<br>
=C2=A0}<br>
<br>
+bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
+{<br>
+=C2=A0 =C2=A0 if (interrupt_request &amp; CPU_INTERRUPT_HARD) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MIPSCPU *cpu =3D MIPS_CPU(cs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUMIPSState *env =3D &amp;cpu-&gt;env;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_mips_hw_interrupts_enabled(env) &amp;&=
amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_mips_hw_interrupts_pending(e=
nv)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Raise it */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;exception_index =3D EXCP_=
EXT_INTERRUPT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;error_code =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mips_cpu_do_interrupt(cs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
=C2=A0void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
diff --git a/target/mips/tcg/user/tlb_helper.c b/target/mips/tcg/user/tlb_h=
elper.c<br>
index b835144b820..210c6d529ef 100644<br>
--- a/target/mips/tcg/user/tlb_helper.c<br>
+++ b/target/mips/tcg/user/tlb_helper.c<br>
@@ -57,8 +57,3 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int s=
ize,<br>
=C2=A0 =C2=A0 =C2=A0raise_mmu_exception(env, address, access_type);<br>
=C2=A0 =C2=A0 =C2=A0do_raise_exception_err(env, cs-&gt;exception_index, env=
-&gt;error_code, retaddr);<br>
=C2=A0}<br>
-<br>
-void mips_cpu_do_interrupt(CPUState *cs)<br>
-{<br>
-=C2=A0 =C2=A0 cs-&gt;exception_index =3D EXCP_NONE;<br>
-}<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000059d41505cb08ef67--


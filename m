Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtAz-000195-Pv
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt9Z-0005R0-UC
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:17:41 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:38834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt9W-0007tR-2e
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:17:41 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id a25so2609628vso.5
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0kZY4/on1W113cAqIpbz7/EvRBMjEx9P7xoTiic8ahg=;
 b=o+pBS4nP03FRDT+8PmZdwxcsdoCmS6b0lbH/SzleoC4uYpANEf+7xkzgW123g+/C+L
 vsFmghrywAZ/W/kVLHkLh7dsPzvgLQdKU3Jysgx4lundQinYdti06802cEYlk44l2MVG
 JcCdc+Hq1qTP4PtszqzqnzQ+IMdL2cWwZ/O4egvjoFRVwdUBOZU0tiCDDaez3ztuoAPu
 ZyBjPikWZB4x023a2/sqbhhS7xyqfO2Y2dA8eA5ois/Q53ksSl2bRtAeYcyu7kctB9vW
 WK5DjvcuqRfaq+OIAZsmN1/kY4+IjLtn1nXzGw+5I1Vsn8Uluwn+UFp6JeD3/0p3LDjt
 U9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0kZY4/on1W113cAqIpbz7/EvRBMjEx9P7xoTiic8ahg=;
 b=o+Ea9Yuybc/O6tdkgYUzg+556t8s+d4o9F1Z1aA6oq18NlpeNAoYSFF34ugfGsKg/j
 ZLUMATtT9OxE+u1V2Ng/ERGG/6m2RD2Fe36jvYTDJP0gMOXOpYkEekdM2G2SU5sEXyWG
 bIeHQ4q5ehkvpYITQNzbrZ4E0TYc13FpvrzD8qYcxx+W/J6f0reTtlzwuP587S6BuoF/
 +LEUOVpGkXz0I2AOskIn2A4YKuoiCopEi6T38/9v23hce/ILoV/5eQthpUI9ZEHy1okF
 hLiyX5Ozd+MrNqhzt+HQhF52iheLokGehM9LqJlX7SLSxv59N7RbbAG3e2Xhox66VGIq
 HkZg==
X-Gm-Message-State: AOAM532wQ0wrqUKTN442Mo2V8fQUIVkMvQazMupXUn5CDb7DA2LYExSu
 3mooa/FALCkiaJF6v02A3uSdO1H7dJTuyz6+kxd6BQ==
X-Google-Smtp-Source: ABdhPJzhBvTybWhfcxdX2zeNy0rC9D2kNuDY9EINApibPW5SK6B3EvmH7Bf25tLTtTBAwjqQSbmfmr5fpHzzbynVDKM=
X-Received: by 2002:a67:2dc6:: with SMTP id t189mr3892333vst.49.1630613856925; 
 Thu, 02 Sep 2021 13:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-10-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-10-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:17:26 -0600
Message-ID: <CANCZdfq1tWapUj9DNrQ4T0VYf3xR=4te64+W3Bnppa=PHJhcEQ@mail.gmail.com>
Subject: Re: [PATCH 09/24] target/cris: Restrict cpu_exec_interrupt() handler
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
Content-Type: multipart/alternative; boundary="000000000000b54e9c05cb08df4b"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Sep 2021 16:19:05 -0400
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
X-List-Received-Date: Thu, 02 Sep 2021 20:17:42 -0000

--000000000000b54e9c05cb08df4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/cris/cpu.h    |  2 +-
>  target/cris/cpu.c    |  4 ++--
>  target/cris/helper.c | 17 ++---------------
>  3 files changed, 5 insertions(+), 18 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/cris/cpu.h b/target/cris/cpu.h
> index d3b64929096..be021899ae8 100644
> --- a/target/cris/cpu.h
> +++ b/target/cris/cpu.h
> @@ -185,11 +185,11 @@ struct CRISCPU {
>
>  #ifndef CONFIG_USER_ONLY
>  extern const VMStateDescription vmstate_cris_cpu;
> -#endif
>
>  void cris_cpu_do_interrupt(CPUState *cpu);
>  void crisv10_cpu_do_interrupt(CPUState *cpu);
>  bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +#endif
>
>  void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
>
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index 70932b1f8c7..c2e7483f5bd 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -205,20 +205,20 @@ static const struct SysemuCPUOps cris_sysemu_ops =
=3D {
>
>  static const struct TCGCPUOps crisv10_tcg_ops =3D {
>      .initialize =3D cris_initialize_crisv10_tcg,
> -    .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,
>      .tlb_fill =3D cris_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,
>      .do_interrupt =3D crisv10_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
>  };
>
>  static const struct TCGCPUOps crisv32_tcg_ops =3D {
>      .initialize =3D cris_initialize_tcg,
> -    .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,
>      .tlb_fill =3D cris_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,
>      .do_interrupt =3D cris_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/cris/helper.c b/target/cris/helper.c
> index 911867f3b48..36926faf323 100644
> --- a/target/cris/helper.c
> +++ b/target/cris/helper.c
> @@ -41,20 +41,6 @@
>
>  #if defined(CONFIG_USER_ONLY)
>
> -void cris_cpu_do_interrupt(CPUState *cs)
> -{
> -    CRISCPU *cpu =3D CRIS_CPU(cs);
> -    CPUCRISState *env =3D &cpu->env;
> -
> -    cs->exception_index =3D -1;
> -    env->pregs[PR_ERP] =3D env->pc;
> -}
> -
> -void crisv10_cpu_do_interrupt(CPUState *cs)
> -{
> -    cris_cpu_do_interrupt(cs);
> -}
> -
>  bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool probe, uintptr_t retaddr)
> @@ -287,7 +273,6 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs,
> vaddr addr)
>      D(fprintf(stderr, "%s %x -> %x\n", __func__, addr, phy));
>      return phy;
>  }
> -#endif
>
>  bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
> @@ -319,3 +304,5 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>
>      return ret;
>  }
> +
> +#endif /* !CONFIG_USER_ONLY */
> --
> 2.31.1
>
>

--000000000000b54e9c05cb08df4b
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
=C2=A0target/cris/cpu.h=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0target/cris/cpu.c=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0target/cris/helper.c | 17 ++---------------<br>
=C2=A03 files changed, 5 insertions(+), 18 deletions(-)<br></blockquote><di=
v><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/cris/cpu.h b/target/cris/cpu.h<br>
index d3b64929096..be021899ae8 100644<br>
--- a/target/cris/cpu.h<br>
+++ b/target/cris/cpu.h<br>
@@ -185,11 +185,11 @@ struct CRISCPU {<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
=C2=A0extern const VMStateDescription vmstate_cris_cpu;<br>
-#endif<br>
<br>
=C2=A0void cris_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0void crisv10_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
+#endif<br>
<br>
=C2=A0void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);<br>
<br>
diff --git a/target/cris/cpu.c b/target/cris/cpu.c<br>
index 70932b1f8c7..c2e7483f5bd 100644<br>
--- a/target/cris/cpu.c<br>
+++ b/target/cris/cpu.c<br>
@@ -205,20 +205,20 @@ static const struct SysemuCPUOps cris_sysemu_ops =3D =
{<br>
<br>
=C2=A0static const struct TCGCPUOps crisv10_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D cris_initialize_crisv10_tcg,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D cris_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D crisv10_cpu_do_interrupt,<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
<br>
=C2=A0static const struct TCGCPUOps crisv32_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D cris_initialize_tcg,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D cris_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D cris_cpu_do_interrupt,<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
diff --git a/target/cris/helper.c b/target/cris/helper.c<br>
index 911867f3b48..36926faf323 100644<br>
--- a/target/cris/helper.c<br>
+++ b/target/cris/helper.c<br>
@@ -41,20 +41,6 @@<br>
<br>
=C2=A0#if defined(CONFIG_USER_ONLY)<br>
<br>
-void cris_cpu_do_interrupt(CPUState *cs)<br>
-{<br>
-=C2=A0 =C2=A0 CRISCPU *cpu =3D CRIS_CPU(cs);<br>
-=C2=A0 =C2=A0 CPUCRISState *env =3D &amp;cpu-&gt;env;<br>
-<br>
-=C2=A0 =C2=A0 cs-&gt;exception_index =3D -1;<br>
-=C2=A0 =C2=A0 env-&gt;pregs[PR_ERP] =3D env-&gt;pc;<br>
-}<br>
-<br>
-void crisv10_cpu_do_interrupt(CPUState *cs)<br>
-{<br>
-=C2=A0 =C2=A0 cris_cpu_do_interrupt(cs);<br>
-}<br>
-<br>
=C2=A0bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bool probe, uintptr_t retaddr)<br>
@@ -287,7 +273,6 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs, vaddr=
 addr)<br>
=C2=A0 =C2=A0 =C2=A0D(fprintf(stderr, &quot;%s %x -&gt; %x\n&quot;, __func_=
_, addr, phy));<br>
=C2=A0 =C2=A0 =C2=A0return phy;<br>
=C2=A0}<br>
-#endif<br>
<br>
=C2=A0bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
=C2=A0{<br>
@@ -319,3 +304,5 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int interrup=
t_request)<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
+<br>
+#endif /* !CONFIG_USER_ONLY */<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000b54e9c05cb08df4b--


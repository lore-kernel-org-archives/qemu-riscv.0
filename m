Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtB5-0001Fd-NV
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtAg-0000eK-Tj
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:18:50 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:41545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtAc-0000Jf-KS
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:18:50 -0400
Received: by mail-vs1-xe32.google.com with SMTP id l9so2600339vsb.8
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1CW5CoF1GCVAN6grWsJbuTIx9X7F4dCckizxepLv9c0=;
 b=T8aEmDr/n743PTU9io6Me1pW+KwoMG/w0eurV90C8ngmmayHhJVUNv3kXigIvcmAp2
 xJsnW6k9gx2isIUuDkMId2o2EJtUYXJCjwK1HEcL+cBHSrYxUD/FX3Zp/zLs1YHDlfXz
 P8puRwDCn3oo753wuyiB7WTu0OOvD/Cy9PEcXdYd/LgkFyvmZ6jgngo0sNp5N1y8DIP2
 vuHi80S/3V+bCI8+4LGzjRF3b6DFJy98CMCP4jpVOGERt0G6uPeCbwooogDvhsSV4frL
 8ShpWoWd+y8yBMo2NJD05+pUxkPbawhdhOxWghq08M/xxpSgLsSg7IX5nTALPFxreGlK
 wgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1CW5CoF1GCVAN6grWsJbuTIx9X7F4dCckizxepLv9c0=;
 b=SlpH/1AIuXXSw02+sKTEDrsUokaDWpV1UyrCt4eUSs+i8uBhTCKCr8T3MQtoa4sBJ+
 PShDwayJztYkoJFmm3WV2qv0m0Zlg1+D+SM2Ox8krnun9XRQI91OLs9gUc/l4ZV9sNbB
 pYv7nzFmgChM5LggSb10fvXHDbS/7qtrGOFWgEAVPjMjadzhuieaawfJkz9inbDE9EeX
 MF7GWJ64FKLE/eRRRgHkJ6DQNmUR2243XtRudyCcVg/j4cs3DouPv7Y+Ye30uzfDy6YA
 lbdRhzuQYTzrpp36uvCCpV8uBXDT2cE8v59H/KHbMJ76VYmYWW+83rNC/QtVt5Af+Zx0
 CM3w==
X-Gm-Message-State: AOAM532DfVajj2slCuQ63bBsmFBbK7+UgIbJi5mhz5FalnSKJSX3uOUT
 Y8CsTWnx+n6MAtW/vnupBHdOVOZ2fFXGLyd2Gmp+6Q==
X-Google-Smtp-Source: ABdhPJxfmZYfSKR1QLQkdJgHSEWV4cuWRebtXveUUPYKSjmUgjiGT1esKjb5KEz3tdOaSP2ONbdjMyn6fb8a88EAeDE=
X-Received: by 2002:a05:6102:482:: with SMTP id
 n2mr4008484vsa.53.1630613925491; 
 Thu, 02 Sep 2021 13:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-12-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-12-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:18:34 -0600
Message-ID: <CANCZdfoM82TXdpRzqZ46coTuy441MQ2n7xJoBNk4gZF-6HObuQ@mail.gmail.com>
Subject: Re: [PATCH 11/24] target/i386: Restrict cpu_exec_interrupt() handler
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
Content-Type: multipart/alternative; boundary="000000000000cb87a205cb08e3c6"
Received-SPF: none client-ip=2607:f8b0:4864:20::e32;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 20:18:51 -0000

--000000000000cb87a205cb08e3c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/i386/tcg/helper-tcg.h |  2 ++
>  target/i386/tcg/seg_helper.c | 10 ++--------
>  target/i386/tcg/tcg-cpu.c    |  2 +-
>  3 files changed, 5 insertions(+), 9 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
> index 2510cc244e9..60ca09e95eb 100644
> --- a/target/i386/tcg/helper-tcg.h
> +++ b/target/i386/tcg/helper-tcg.h
> @@ -38,7 +38,9 @@ QEMU_BUILD_BUG_ON(TCG_PHYS_ADDR_BITS >
> TARGET_PHYS_ADDR_SPACE_BITS);
>   * @cpu: vCPU the interrupt is to be handled by.
>   */
>  void x86_cpu_do_interrupt(CPUState *cpu);
> +#ifndef CONFIG_USER_ONLY
>  bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +#endif
>
>  /* helper.c */
>  bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
> index dee7bef68c6..13c6e6ee62e 100644
> --- a/target/i386/tcg/seg_helper.c
> +++ b/target/i386/tcg/seg_helper.c
> @@ -1110,6 +1110,7 @@ void do_interrupt_x86_hardirq(CPUX86State *env, int
> intno, int is_hw)
>      do_interrupt_all(env_archcpu(env), intno, 0, 0, 0, is_hw);
>  }
>
> +#ifndef CONFIG_USER_ONLY
>  bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      X86CPU *cpu =3D X86_CPU(cs);
> @@ -1125,23 +1126,17 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>       * This is required to make icount-driven execution deterministic.
>       */
>      switch (interrupt_request) {
> -#if !defined(CONFIG_USER_ONLY)
>      case CPU_INTERRUPT_POLL:
>          cs->interrupt_request &=3D ~CPU_INTERRUPT_POLL;
>          apic_poll_irq(cpu->apic_state);
>          break;
> -#endif
>      case CPU_INTERRUPT_SIPI:
>          do_cpu_sipi(cpu);
>          break;
>      case CPU_INTERRUPT_SMI:
>          cpu_svm_check_intercept_param(env, SVM_EXIT_SMI, 0, 0);
>          cs->interrupt_request &=3D ~CPU_INTERRUPT_SMI;
> -#ifdef CONFIG_USER_ONLY
> -        cpu_abort(CPU(cpu), "SMI interrupt: cannot enter SMM in
> user-mode");
> -#else
>          do_smm_enter(cpu);
> -#endif /* CONFIG_USER_ONLY */
>          break;
>      case CPU_INTERRUPT_NMI:
>          cpu_svm_check_intercept_param(env, SVM_EXIT_NMI, 0, 0);
> @@ -1162,7 +1157,6 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>                        "Servicing hardware INT=3D0x%02x\n", intno);
>          do_interrupt_x86_hardirq(env, intno, 1);
>          break;
> -#if !defined(CONFIG_USER_ONLY)
>      case CPU_INTERRUPT_VIRQ:
>          /* FIXME: this should respect TPR */
>          cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
> @@ -1173,12 +1167,12 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>          do_interrupt_x86_hardirq(env, intno, 1);
>          cs->interrupt_request &=3D ~CPU_INTERRUPT_VIRQ;
>          break;
> -#endif
>      }
>
>      /* Ensure that no TB jump will be modified as the program flow was
> changed.  */
>      return true;
>  }
> +#endif /* CONFIG_USER_ONLY */
>
>  void helper_lldt(CPUX86State *env, int selector)
>  {
> diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
> index dce800a8953..fd86daf93d2 100644
> --- a/target/i386/tcg/tcg-cpu.c
> +++ b/target/i386/tcg/tcg-cpu.c
> @@ -72,12 +72,12 @@ static const struct TCGCPUOps x86_tcg_ops =3D {
>      .synchronize_from_tb =3D x86_cpu_synchronize_from_tb,
>      .cpu_exec_enter =3D x86_cpu_exec_enter,
>      .cpu_exec_exit =3D x86_cpu_exec_exit,
> -    .cpu_exec_interrupt =3D x86_cpu_exec_interrupt,
>      .tlb_fill =3D x86_cpu_tlb_fill,
>  #ifdef CONFIG_USER_ONLY
>      .fake_user_exception =3D x86_cpu_do_interrupt,
>  #else
>      .do_interrupt =3D x86_cpu_do_interrupt,
> +    .cpu_exec_interrupt =3D x86_cpu_exec_interrupt,
>      .debug_excp_handler =3D breakpoint_handler,
>      .debug_check_breakpoint =3D x86_debug_check_breakpoint,
>  #endif /* !CONFIG_USER_ONLY */
> --
> 2.31.1
>
>

--000000000000cb87a205cb08e3c6
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
=C2=A0target/i386/tcg/helper-tcg.h |=C2=A0 2 ++<br>
=C2=A0target/i386/tcg/seg_helper.c | 10 ++--------<br>
=C2=A0target/i386/tcg/tcg-cpu.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A03 files changed, 5 insertions(+), 9 deletions(-)<br></blockquote><div=
><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-yj6qo=
 gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0p=
x 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h<br=
>
index 2510cc244e9..60ca09e95eb 100644<br>
--- a/target/i386/tcg/helper-tcg.h<br>
+++ b/target/i386/tcg/helper-tcg.h<br>
@@ -38,7 +38,9 @@ QEMU_BUILD_BUG_ON(TCG_PHYS_ADDR_BITS &gt; TARGET_PHYS_ADD=
R_SPACE_BITS);<br>
=C2=A0 * @cpu: vCPU the interrupt is to be handled by.<br>
=C2=A0 */<br>
=C2=A0void x86_cpu_do_interrupt(CPUState *cpu);<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
+#endif<br>
<br>
=C2=A0/* helper.c */<br>
=C2=A0bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c<br=
>
index dee7bef68c6..13c6e6ee62e 100644<br>
--- a/target/i386/tcg/seg_helper.c<br>
+++ b/target/i386/tcg/seg_helper.c<br>
@@ -1110,6 +1110,7 @@ void do_interrupt_x86_hardirq(CPUX86State *env, int i=
ntno, int is_hw)<br>
=C2=A0 =C2=A0 =C2=A0do_interrupt_all(env_archcpu(env), intno, 0, 0, 0, is_h=
w);<br>
=C2=A0}<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0X86CPU *cpu =3D X86_CPU(cs);<br>
@@ -1125,23 +1126,17 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int inter=
rupt_request)<br>
=C2=A0 =C2=A0 =C2=A0 * This is required to make icount-driven execution det=
erministic.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0switch (interrupt_request) {<br>
-#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0case CPU_INTERRUPT_POLL:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;interrupt_request &amp;=3D ~CPU_IN=
TERRUPT_POLL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0apic_poll_irq(cpu-&gt;apic_state);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-#endif<br>
=C2=A0 =C2=A0 =C2=A0case CPU_INTERRUPT_SIPI:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_cpu_sipi(cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case CPU_INTERRUPT_SMI:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_svm_check_intercept_param(env, SVM_EX=
IT_SMI, 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;interrupt_request &amp;=3D ~CPU_IN=
TERRUPT_SMI;<br>
-#ifdef CONFIG_USER_ONLY<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_abort(CPU(cpu), &quot;SMI interrupt: canno=
t enter SMM in user-mode&quot;);<br>
-#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_smm_enter(cpu);<br>
-#endif /* CONFIG_USER_ONLY */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case CPU_INTERRUPT_NMI:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_svm_check_intercept_param(env, SVM_EX=
IT_NMI, 0, 0);<br>
@@ -1162,7 +1157,6 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interru=
pt_request)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Servicing hardware INT=3D0x%02x\n&quot;, intno);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_interrupt_x86_hardirq(env, intno, 1);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0case CPU_INTERRUPT_VIRQ:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: this should respect TPR */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_svm_check_intercept_param(env, SVM_EX=
IT_VINTR, 0, 0);<br>
@@ -1173,12 +1167,12 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int inter=
rupt_request)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_interrupt_x86_hardirq(env, intno, 1);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;interrupt_request &amp;=3D ~CPU_IN=
TERRUPT_VIRQ;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-#endif<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Ensure that no TB jump will be modified as the progr=
am flow was changed.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
+#endif /* CONFIG_USER_ONLY */<br>
<br>
=C2=A0void helper_lldt(CPUX86State *env, int selector)<br>
=C2=A0{<br>
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c<br>
index dce800a8953..fd86daf93d2 100644<br>
--- a/target/i386/tcg/tcg-cpu.c<br>
+++ b/target/i386/tcg/tcg-cpu.c<br>
@@ -72,12 +72,12 @@ static const struct TCGCPUOps x86_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D x86_cpu_synchronize_from_tb,<b=
r>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_enter =3D x86_cpu_exec_enter,<br>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_exit =3D x86_cpu_exec_exit,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D x86_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D x86_cpu_tlb_fill,<br>
=C2=A0#ifdef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0.fake_user_exception =3D x86_cpu_do_interrupt,<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D x86_cpu_do_interrupt,<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D x86_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.debug_excp_handler =3D breakpoint_handler,<br>
=C2=A0 =C2=A0 =C2=A0.debug_check_breakpoint =3D x86_debug_check_breakpoint,=
<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000cb87a205cb08e3c6--


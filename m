Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtBt-0002f4-NT
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtBo-0002bU-7C
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:20:00 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:35753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtBl-0001FL-7s
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:19:59 -0400
Received: by mail-ua1-x930.google.com with SMTP id r20so1578869uat.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vTK0MmD+/MHkLwWYphLIayzbOAO+je6/yf1mMIn0yWU=;
 b=sS7edowe5e36nnmyYEvvEnTcK/u80gHu4wKxap9O7yF8HXiNHhz1B8o0gV3MnTjF9F
 knVndn/383Kf88r2JUTJNYGrHrMmN4eXH0cVxVxhTh1ceT1hHseUrVPdiUgaj2vSQ8S7
 00yjmOEx8vRzEoi92uFBx9PRRb83+oGvMLk5v8iFTp/LRSIO+ySodG3BY8mSb3GsHl5e
 Ndy191FlRRisBqTJmh7WHkNKDt6LzlhgsMCD68Gfesqt/wvWMKrZ2q0zZtDHBA5DgkSb
 dSUHYJmKTm77BAbNy5/zVH/HNkQYmGEOrUIpKk/kHk0gHtqq8HL9sbNu1AcjVXTS8Jg7
 OZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vTK0MmD+/MHkLwWYphLIayzbOAO+je6/yf1mMIn0yWU=;
 b=mvyko8QDbzaabwhN3Y2wEjBj1i6WVFuUeBh4SwdO7yBUXVVSVdJa/Cym8WwV136cSX
 Ak5IpAd8ELbsXRoIBRNuPcpHlli495r0+LQTN0HrCrenlNtLM0/Nwe0xmpBNYBUeNz8j
 Dh47dXVEMVR/QzRw5uA6inoIP7Zno+OaSTDs3wNOiPe3YUOqMjKCYapL+LHjti71ewoC
 NXRGKa67d/i5H7sKptWukq0WKsPtBLzUnyhewnLiSE9t49cWYALFS4EJR01oKOatqBy9
 kHGzhFdLW5mXcxxLJINDrktWaBFCexd5cOEbdCowGJggYoBLQsIil9MP7/uiCxFXHOna
 EzMw==
X-Gm-Message-State: AOAM533+ogQOp5hOH5yOdw7FE2YFTzTm6tGp3L2sUAC93XQ529WE8TtA
 DgNKg39hH0Ep+T3iqZ4GI/5HpYd7DeJ6NcHt0hXdBA==
X-Google-Smtp-Source: ABdhPJwhzVktbGaGlSGMutP7RozEYEpT6JuYwKAHBHjquyRUifcT+EdVafubSRApbrSplIRQDh4oAt5OCOvSeWw0pAA=
X-Received: by 2002:a9f:31c8:: with SMTP id w8mr57561uad.77.1630613996246;
 Thu, 02 Sep 2021 13:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-13-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-13-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:19:45 -0600
Message-ID: <CANCZdfoJbramtU4tc-KpPKGHp3yer0Y_D=9zzzwDraRVP8Ka6Q@mail.gmail.com>
Subject: Re: [PATCH 12/24] target/m68k: Restrict cpu_exec_interrupt() handler
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
Content-Type: multipart/alternative; boundary="0000000000000330a405cb08e8a7"
Received-SPF: none client-ip=2607:f8b0:4864:20::930;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 20:20:01 -0000

--0000000000000330a405cb08e8a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/m68k/cpu.h       |  2 ++
>  target/m68k/cpu.c       |  2 +-
>  target/m68k/op_helper.c | 16 +++-------------
>  3 files changed, 6 insertions(+), 14 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 997d588911c..550eb028b6e 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -166,8 +166,10 @@ struct M68kCPU {
>  };
>
>
> +#ifndef CONFIG_USER_ONLY
>  void m68k_cpu_do_interrupt(CPUState *cpu);
>  bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +#endif /* !CONFIG_USER_ONLY */
>  void m68k_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 72de6e97262..66d22d11895 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -515,10 +515,10 @@ static const struct SysemuCPUOps m68k_sysemu_ops =
=3D {
>
>  static const struct TCGCPUOps m68k_tcg_ops =3D {
>      .initialize =3D m68k_tcg_init,
> -    .cpu_exec_interrupt =3D m68k_cpu_exec_interrupt,
>      .tlb_fill =3D m68k_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D m68k_cpu_exec_interrupt,
>      .do_interrupt =3D m68k_cpu_do_interrupt,
>      .do_transaction_failed =3D m68k_cpu_transaction_failed,
>  #endif /* !CONFIG_USER_ONLY */
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index d006d1cb3ea..5d624838ae6 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -24,18 +24,7 @@
>  #include "semihosting/semihost.h"
>  #include "tcg/tcg.h"
>
> -#if defined(CONFIG_USER_ONLY)
> -
> -void m68k_cpu_do_interrupt(CPUState *cs)
> -{
> -    cs->exception_index =3D -1;
> -}
> -
> -static inline void do_interrupt_m68k_hardirq(CPUM68KState *env)
> -{
> -}
> -
> -#else
> +#if !defined(CONFIG_USER_ONLY)
>
>  static void cf_rte(CPUM68KState *env)
>  {
> @@ -516,7 +505,6 @@ void m68k_cpu_transaction_failed(CPUState *cs, hwaddr
> physaddr, vaddr addr,
>          cpu_loop_exit(cs);
>      }
>  }
> -#endif
>
>  bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
> @@ -538,6 +526,8 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      return false;
>  }
>
> +#endif /* !CONFIG_USER_ONLY */
> +
>  static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t radd=
r)
>  {
>      CPUState *cs =3D env_cpu(env);
> --
> 2.31.1
>
>

--0000000000000330a405cb08e8a7
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
=C2=A0target/m68k/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0target/m68k/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0target/m68k/op_helper.c | 16 +++-------------<br>
=C2=A03 files changed, 6 insertions(+), 14 deletions(-)<br></blockquote><di=
v><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail=
-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:=
2px 0px 0px"><br class=3D"gmail-Apple-interchange-newline"></div></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h<br>
index 997d588911c..550eb028b6e 100644<br>
--- a/target/m68k/cpu.h<br>
+++ b/target/m68k/cpu.h<br>
@@ -166,8 +166,10 @@ struct M68kCPU {<br>
=C2=A0};<br>
<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0void m68k_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
+#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0void m68k_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int re=
g);<br>
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c<br>
index 72de6e97262..66d22d11895 100644<br>
--- a/target/m68k/cpu.c<br>
+++ b/target/m68k/cpu.c<br>
@@ -515,10 +515,10 @@ static const struct SysemuCPUOps m68k_sysemu_ops =3D =
{<br>
<br>
=C2=A0static const struct TCGCPUOps m68k_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D m68k_tcg_init,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D m68k_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D m68k_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D m68k_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D m68k_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D m68k_cpu_transaction_failed,=
<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c<br>
index d006d1cb3ea..5d624838ae6 100644<br>
--- a/target/m68k/op_helper.c<br>
+++ b/target/m68k/op_helper.c<br>
@@ -24,18 +24,7 @@<br>
=C2=A0#include &quot;semihosting/semihost.h&quot;<br>
=C2=A0#include &quot;tcg/tcg.h&quot;<br>
<br>
-#if defined(CONFIG_USER_ONLY)<br>
-<br>
-void m68k_cpu_do_interrupt(CPUState *cs)<br>
-{<br>
-=C2=A0 =C2=A0 cs-&gt;exception_index =3D -1;<br>
-}<br>
-<br>
-static inline void do_interrupt_m68k_hardirq(CPUM68KState *env)<br>
-{<br>
-}<br>
-<br>
-#else<br>
+#if !defined(CONFIG_USER_ONLY)<br>
<br>
=C2=A0static void cf_rte(CPUM68KState *env)<br>
=C2=A0{<br>
@@ -516,7 +505,6 @@ void m68k_cpu_transaction_failed(CPUState *cs, hwaddr p=
hysaddr, vaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_loop_exit(cs);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
-#endif<br>
<br>
=C2=A0bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
=C2=A0{<br>
@@ -538,6 +526,8 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrup=
t_request)<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
+#endif /* !CONFIG_USER_ONLY */<br>
+<br>
=C2=A0static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t r=
addr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000000330a405cb08e8a7--


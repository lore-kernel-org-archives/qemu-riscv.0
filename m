Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtJn-0002R5-Oa
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtJk-0002MU-O5
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:28:12 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:40649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtJh-00088z-J0
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:28:12 -0400
Received: by mail-ua1-x933.google.com with SMTP id g16so1582273uam.7
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IXs4nJs4COlMewLGKj8MReIetgZVSeTYTHEcqZse/qQ=;
 b=XHeayma8ok14I3d4JnNJOfDsI490aC4PaNrShe7GKHdZuFwssrOQf3hjRFGgUJL93L
 yUwk+eZoeU0geczbPsOYLCdJmo1NKVJbrmav7DnQEKNr0QCQu3pbckAiRHXVNf9NNERd
 ZLOwxm+FxUQPJNLdJR09PzEIMAtysE/DMBK25fvW3T6YiS53X14H8NNEQZr3nfEHs7nM
 jydS6yr3a6yUFS4YhF5aVeca80NF30RtsfHiTshdIE31cRpcxRyd8Lm3xm8UehqRqVSA
 z51r3Kv1c+lgW8ofeDN/zOXi2ueAEfOrb2elu/6DEim4+ZOOwTFe5DrXx2WYaHDQtKTQ
 fsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXs4nJs4COlMewLGKj8MReIetgZVSeTYTHEcqZse/qQ=;
 b=VcVwY+q4XngqZOGRxuOTsjdpXZKLyTV96fFnvFVtTjr1X32QNCuzTgdXif7de/kcsC
 Ng2tJiYFUQkQbIkJGLbfPn//XmKNCzWmlxq5gTYlyLo6vpYgQTMRruv4XVkLAEYISrMM
 5YdtBpQ7L7FqX4THhGqrB3PIAE9726Y1s2UiQ3VJ6ni8BPtZPYgxWDbroEWGgejSD/Gb
 ITyolDINnjPjLJIInTHw+XptD6utAYXU7QiTPluWZLm0/u1pvWccXjkkB33f+zKaf0yi
 gO2kr7Weiklwb02/2K8udIJHSVpcOFUi085FywEQ8DjYZTtwt7z6h2TdwGEE/va9eQcs
 eYWA==
X-Gm-Message-State: AOAM532o8pexWSSAzFx9VfZPwb/Nnwa9B54M6/Y+ZDX421b5gcvKVODo
 99gnc7mZACESwx2CZby5Y0cLLG7YTKVxH1bbdhUNbw==
X-Google-Smtp-Source: ABdhPJzwgC+RxKewBIDM1E4RXSapxrezGAqu4jfoRGSQudgckUFwJH24LFIGMwKib/Nzbl39duxWYzE6rh7sB0ZgIaI=
X-Received: by 2002:a9f:2a87:: with SMTP id z7mr95147uai.11.1630614488604;
 Thu, 02 Sep 2021 13:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-25-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-25-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:27:57 -0600
Message-ID: <CANCZdfrF3j+J2L_3KfbRNMF3r9+Fz3BUGYnbuRuvLyjF1HEJbw@mail.gmail.com>
Subject: Re: [PATCH 24/24] user: Remove cpu_get_pic_interrupt() stubs
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
Content-Type: multipart/alternative; boundary="0000000000005bf1b905cb0905f7"
Received-SPF: none client-ip=2607:f8b0:4864:20::933;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x933.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 20:28:13 -0000

--0000000000005bf1b905cb0905f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:19 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> cpu_get_pic_interrupt() is now unreachable from user-mode,
> delete the unnecessary stubs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/i386/cpu.h | 2 +-
>  bsd-user/main.c   | 7 -------
>  linux-user/main.c | 7 -------
>  3 files changed, 1 insertion(+), 15 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index c241bc183d2..c7cc65e92d5 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1832,9 +1832,9 @@ int x86_cpu_gdb_write_register(CPUState *cpu,
> uint8_t *buf, int reg);
>  void x86_cpu_list(void);
>  int cpu_x86_support_mca_broadcast(CPUX86State *env);
>
> +#ifndef CONFIG_USER_ONLY
>  int cpu_get_pic_interrupt(CPUX86State *s);
>
> -#ifndef CONFIG_USER_ONLY
>  /* MSDOS compatibility mode FPU exception support */
>  void x86_register_ferr_irq(qemu_irq irq);
>  void fpu_check_raise_ferr_irq(CPUX86State *s);
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index fe66204b6b7..e358c38c353 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -66,13 +66,6 @@ void gemu_log(const char *fmt, ...)
>      va_end(ap);
>  }
>
> -#if defined(TARGET_I386)
> -int cpu_get_pic_interrupt(CPUX86State *env)
> -{
> -    return -1;
> -}
> -#endif
> -
>  void fork_start(void)
>  {
>  }
>

Love it, but either you or I will have to rebase based on which of us lands
in the tree first :).
For me, the rebase will be easy though.


> diff --git a/linux-user/main.c b/linux-user/main.c
> index 37ed50d98e2..f5c0a82427b 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -120,13 +120,6 @@ const char *qemu_uname_release;
>     by remapping the process stack directly at the right place */
>  unsigned long guest_stack_size =3D 8 * 1024 * 1024UL;
>
> -#if defined(TARGET_I386)
> -int cpu_get_pic_interrupt(CPUX86State *env)
> -{
> -    return -1;
> -}
> -#endif
> -
>  /***********************************************************/
>  /* Helper routines for implementing atomic operations.  */
>
> --
> 2.31.1
>
>

--0000000000005bf1b905cb0905f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:19 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>cpu_get_pic_interrupt() is now unreachable from user-mode,<br>
delete the unnecessary stubs.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/i386/cpu.h | 2 +-<br>
=C2=A0bsd-user/main.c=C2=A0 =C2=A0| 7 -------<br>
=C2=A0linux-user/main.c | 7 -------<br>
=C2=A03 files changed, 1 insertion(+), 15 deletions(-)<br></blockquote><div=
><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsd=
imp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/i386/cpu.h b/target/i386/cpu.h<br>
index c241bc183d2..c7cc65e92d5 100644<br>
--- a/target/i386/cpu.h<br>
+++ b/target/i386/cpu.h<br>
@@ -1832,9 +1832,9 @@ int x86_cpu_gdb_write_register(CPUState *cpu, uint8_t=
 *buf, int reg);<br>
=C2=A0void x86_cpu_list(void);<br>
=C2=A0int cpu_x86_support_mca_broadcast(CPUX86State *env);<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0int cpu_get_pic_interrupt(CPUX86State *s);<br>
<br>
-#ifndef CONFIG_USER_ONLY<br>
=C2=A0/* MSDOS compatibility mode FPU exception support */<br>
=C2=A0void x86_register_ferr_irq(qemu_irq irq);<br>
=C2=A0void fpu_check_raise_ferr_irq(CPUX86State *s);<br>
diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
index fe66204b6b7..e358c38c353 100644<br>
--- a/bsd-user/main.c<br>
+++ b/bsd-user/main.c<br>
@@ -66,13 +66,6 @@ void gemu_log(const char *fmt, ...)<br>
=C2=A0 =C2=A0 =C2=A0va_end(ap);<br>
=C2=A0}<br>
<br>
-#if defined(TARGET_I386)<br>
-int cpu_get_pic_interrupt(CPUX86State *env)<br>
-{<br>
-=C2=A0 =C2=A0 return -1;<br>
-}<br>
-#endif<br>
-<br>
=C2=A0void fork_start(void)<br>
=C2=A0{<br>
=C2=A0}<br></blockquote><div><br></div><div>Love it, but either you or I wi=
ll have to rebase based on which of us lands in the tree first :).</div><di=
v>For me, the rebase will be easy though.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
diff --git a/linux-user/main.c b/linux-user/main.c<br>
index 37ed50d98e2..f5c0a82427b 100644<br>
--- a/linux-user/main.c<br>
+++ b/linux-user/main.c<br>
@@ -120,13 +120,6 @@ const char *qemu_uname_release;<br>
=C2=A0 =C2=A0 by remapping the process stack directly at the right place */=
<br>
=C2=A0unsigned long guest_stack_size =3D 8 * 1024 * 1024UL;<br>
<br>
-#if defined(TARGET_I386)<br>
-int cpu_get_pic_interrupt(CPUX86State *env)<br>
-{<br>
-=C2=A0 =C2=A0 return -1;<br>
-}<br>
-#endif<br>
-<br>
=C2=A0/***********************************************************/<br>
=C2=A0/* Helper routines for implementing atomic operations.=C2=A0 */<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000005bf1b905cb0905f7--


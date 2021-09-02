Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtB0-0001Am-6i
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt7e-0001up-V9
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:15:42 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:42756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt7b-000690-2y
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:15:41 -0400
Received: by mail-ua1-x934.google.com with SMTP id m39so1568450uad.9
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HUTdYryH4g0QwdfTQrQx8E5mk3Ak5PJvxWL0FfqOQE8=;
 b=gT3m451EfStt/xnRBMF3RTRho0JYutgQYFADKXh1SYDddMdaTyEY6NkjLBf+06Hrix
 Fl7nQIEgd+791t/TITB7kE+M7L5y7+keLXwlC75d9+D2uDtCbkkABi/zPwKrblp4hm2W
 b/dEN2xjpuBXrPEOm5JuyvRKq6BpZC9zbNxqCzoU+iXmAol24OCwiy7Tym62pWdwx0Fa
 Bbzz33j2sX1s4PiL6adUK9a4BOCJoYji/WqYNrdkDUHDOZwlw5dARHPv6Ig0RmydN/Tm
 0PmYLoOLihR6Z2+gt0zWoA+RBYt1eVpGC6ebLYJN36RIIOlMOnvDCkQKP5hyhzw4H2w8
 qGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HUTdYryH4g0QwdfTQrQx8E5mk3Ak5PJvxWL0FfqOQE8=;
 b=H37GaelFYMlVcigVb3xtE5HQzxftRqCgIRp6GIsVuU4wqkUUr7uZ8crinT5F/nuWhO
 GkPMAybmE1eA4zL0JLn+hxeLeJxTzM7qvL7LMiC9QLvoHa34BczjbvNKznriJx8oOJel
 DKcy1PIymNQjExm+ubwi55rBz1b8vKcYyPkXMJxmoXoiOhSVfv5PQKafnoR0fMPPBXOn
 1RxFIjyZ6ZoC1BnBRgG9GNybg7ZTx6F+TvtgSBPoJcamkY/lsC9LahQxDh2c57/zBkhN
 qVdFLgOxByF/W03A8P6URvmZXcSeunoI3zvitP/8aK0NI9HAe+oay8IdMBJtOUXjvCCf
 y3Bg==
X-Gm-Message-State: AOAM532Fh22OwURt6/9PqvoqqDE1qaKLy9F2cGStHZtm+Xau0/UScUk7
 qlmlt+pLZH2ekZjIU7FOcrZYYeoKMgmM/29Armdshg==
X-Google-Smtp-Source: ABdhPJz5EIXzhOpDdVKWmu9EObSjnCbGAuXMfATGE79XUEXGmy92hZcyR1XQ/fIl/e5yFn0K8dfQaObYmdG6mCQgSCY=
X-Received: by 2002:a9f:31c8:: with SMTP id w8mr41290uad.77.1630613737842;
 Thu, 02 Sep 2021 13:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-7-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-7-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:15:27 -0600
Message-ID: <CANCZdfqxmiLnND0srRphqg7yU=C_cCLo1S9=kqTCjvych96ufQ@mail.gmail.com>
Subject: Re: [PATCH 06/24] target/alpha: Restrict cpu_exec_interrupt() handler
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
Content-Type: multipart/alternative; boundary="0000000000009c418505cb08d8b0"
Received-SPF: none client-ip=2607:f8b0:4864:20::934;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Sep 2021 16:19:04 -0400
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
X-List-Received-Date: Thu, 02 Sep 2021 20:15:43 -0000

--0000000000009c418505cb08d8b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/alpha/cpu.h    | 2 +-
>  target/alpha/cpu.c    | 2 +-
>  target/alpha/helper.c | 5 ++---
>  3 files changed, 4 insertions(+), 5 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 82df108967b..4e993bd15bd 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -274,10 +274,10 @@ struct AlphaCPU {
>
>  #ifndef CONFIG_USER_ONLY
>  extern const VMStateDescription vmstate_alpha_cpu;
> -#endif
>
>  void alpha_cpu_do_interrupt(CPUState *cpu);
>  bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +#endif /* !CONFIG_USER_ONLY */
>  void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
>  hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 4871ad0c0a6..93e16a2ffb4 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -218,10 +218,10 @@ static const struct SysemuCPUOps alpha_sysemu_ops =
=3D {
>
>  static const struct TCGCPUOps alpha_tcg_ops =3D {
>      .initialize =3D alpha_translate_init,
> -    .cpu_exec_interrupt =3D alpha_cpu_exec_interrupt,
>      .tlb_fill =3D alpha_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D alpha_cpu_exec_interrupt,
>      .do_interrupt =3D alpha_cpu_do_interrupt,
>      .do_transaction_failed =3D alpha_cpu_do_transaction_failed,
>      .do_unaligned_access =3D alpha_cpu_do_unaligned_access,
> diff --git a/target/alpha/helper.c b/target/alpha/helper.c
> index 4f56fe4d231..81550d9e2ff 100644
> --- a/target/alpha/helper.c
> +++ b/target/alpha/helper.c
> @@ -293,7 +293,6 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int
> size,
>                   prot, mmu_idx, TARGET_PAGE_SIZE);
>      return true;
>  }
> -#endif /* USER_ONLY */
>
>  void alpha_cpu_do_interrupt(CPUState *cs)
>  {
> @@ -348,7 +347,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)
>
>      cs->exception_index =3D -1;
>
> -#if !defined(CONFIG_USER_ONLY)
>      switch (i) {
>      case EXCP_RESET:
>          i =3D 0x0000;
> @@ -404,7 +402,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)
>
>      /* Switch to PALmode.  */
>      env->flags |=3D ENV_FLAG_PAL_MODE;
> -#endif /* !USER_ONLY */
>  }
>
>  bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> @@ -451,6 +448,8 @@ bool alpha_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      return false;
>  }
>
> +#endif /* !CONFIG_USER_ONLY */
> +
>  void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  {
>      static const char linux_reg_names[31][4] =3D {
> --
> 2.31.1
>
>

--0000000000009c418505cb08d8b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:17 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Restrict cpu_exec_interrupt() and its callees to sysemu.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/alpha/cpu.h=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/alpha/cpu.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/alpha/helper.c | 5 ++---<br>
=C2=A03 files changed, 4 insertions(+), 5 deletions(-)<br></blockquote><div=
><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsd=
imp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-=
yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2=
px 0px 0px">=C2=A0<br></div></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h<br>
index 82df108967b..4e993bd15bd 100644<br>
--- a/target/alpha/cpu.h<br>
+++ b/target/alpha/cpu.h<br>
@@ -274,10 +274,10 @@ struct AlphaCPU {<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
=C2=A0extern const VMStateDescription vmstate_alpha_cpu;<br>
-#endif<br>
<br>
=C2=A0void alpha_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
+#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);<br>
=C2=A0hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int r=
eg);<br>
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c<br>
index 4871ad0c0a6..93e16a2ffb4 100644<br>
--- a/target/alpha/cpu.c<br>
+++ b/target/alpha/cpu.c<br>
@@ -218,10 +218,10 @@ static const struct SysemuCPUOps alpha_sysemu_ops =3D=
 {<br>
<br>
=C2=A0static const struct TCGCPUOps alpha_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D alpha_translate_init,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D alpha_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D alpha_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D alpha_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D alpha_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D alpha_cpu_do_transaction_fai=
led,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D alpha_cpu_do_unaligned_access,=
<br>
diff --git a/target/alpha/helper.c b/target/alpha/helper.c<br>
index 4f56fe4d231..81550d9e2ff 100644<br>
--- a/target/alpha/helper.c<br>
+++ b/target/alpha/helper.c<br>
@@ -293,7 +293,6 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int s=
ize,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prot, mmu_id=
x, TARGET_PAGE_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
-#endif /* USER_ONLY */<br>
<br>
=C2=A0void alpha_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0{<br>
@@ -348,7 +347,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)<br>
<br>
=C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D -1;<br>
<br>
-#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0switch (i) {<br>
=C2=A0 =C2=A0 =C2=A0case EXCP_RESET:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D 0x0000;<br>
@@ -404,7 +402,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Switch to PALmode.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;flags |=3D ENV_FLAG_PAL_MODE;<br>
-#endif /* !USER_ONLY */<br>
=C2=A0}<br>
<br>
=C2=A0bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br=
>
@@ -451,6 +448,8 @@ bool alpha_cpu_exec_interrupt(CPUState *cs, int interru=
pt_request)<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
+#endif /* !CONFIG_USER_ONLY */<br>
+<br>
=C2=A0void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0static const char linux_reg_names[31][4] =3D {<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000009c418505cb08d8b0--


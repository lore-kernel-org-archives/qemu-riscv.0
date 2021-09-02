Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtI6-00063p-LG
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtI1-0005yh-Oj
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:26:26 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:37503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtHx-0006jU-6E
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:26:23 -0400
Received: by mail-vk1-xa31.google.com with SMTP id t13so1056443vkm.4
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=751TEEkaP5uNR4ViwAskIKR6oYmccFDD9SSpFku46JY=;
 b=LL/xHBPpOMYAlslk/XJHzZPbFrTpYJmk5+3oYZaSKmJ/axYdcouvMsB7jBo8wPntwX
 wCp4xZrXXjziaYJDTyZqp8efSJd9LeXmyPxMigTmG8NA+swNiCMFq07LpkD21cubyb0S
 xxR4gMNhsa8vdmLag9u4ZA9caD4jIrFPkhS93nZFkEZXWVykttfvsE0nNHx7PjItmwCy
 UJm0bXM+lf0KSmbL7KqlqbHtsQF34yqk0orEGvd28TaDl7kr85lytuYGHM216dEXgFeI
 HmoD6qC4z++Wtw7J8hCzq/ZAoL8yDGopimRaQr3SF7UxQGhVV4KLIl6TROMj5JmJfiqE
 ImsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=751TEEkaP5uNR4ViwAskIKR6oYmccFDD9SSpFku46JY=;
 b=VlAudeNOIDEhMqqWDzE9XoDSAc05wBrj0Q6tO9mfjyGxS879uaw1zo2egvDHYTuJZa
 NH5NvNIlmzT++vmZh3iNWQZZr9YRyNJaWh/xoSeT3jFkxjIGjXwr9+Nb9Se4LKOUb46y
 /PBzavn8EYC7+imVbjFiUANjBg5DL+1kvwAX2OhrNujXqg2ceJQMQt08mdkIiSmD3Sp6
 MSydeULIrYdi7ATUAb1siMt1Uvgp90iSr+Uh9fx5G+GR2X++BkGLQ0u4EMc+aAmP1j9K
 Y5Q8t0UeijknEqmYZj8n5PyPysiZJeAFQ2t1+UO89dK3FGsQzW0Serc2Wj7eWFnnLeJ7
 2tyg==
X-Gm-Message-State: AOAM531EPw4lJulu9O/ZWUDvfi71nqNrVSEdslL69BcbnxhNYVF0PKYP
 2W70ygIUOoJIYxafRolj9c49XoOteY8bkTW5YCuUFw==
X-Google-Smtp-Source: ABdhPJyk25+SRbkYekQDQJ+bvDq7iKExibiCGmG8lotCUoVOP1baVwgB8TmVGfmMZoT9mVGrkpJukeB9nO4/82DQEpg=
X-Received: by 2002:a1f:46c4:: with SMTP id t187mr4410vka.10.1630614380291;
 Thu, 02 Sep 2021 13:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-21-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-21-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:26:09 -0600
Message-ID: <CANCZdfpVhT2XmrRiqe+UJN7CG1R-6tt=r-wu4PFtkojgLEZWbQ@mail.gmail.com>
Subject: Re: [PATCH 20/24] target/sparc: Restrict cpu_exec_interrupt() handler
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
Content-Type: multipart/alternative; boundary="000000000000e73e7f05cb08fe46"
Received-SPF: none client-ip=2607:f8b0:4864:20::a31;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa31.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 20:26:27 -0000

--000000000000e73e7f05cb08fe46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:19 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/sparc/cpu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index da6b30ec747..5a8a4ce7506 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -77,6 +77,7 @@ static void sparc_cpu_reset(DeviceState *dev)
>      env->cache_control =3D 0;
>  }
>
> +#ifndef CONFIG_USER_ONLY
>  static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request=
)
>  {
>      if (interrupt_request & CPU_INTERRUPT_HARD) {
> @@ -96,6 +97,7 @@ static bool sparc_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      }
>      return false;
>  }
> +#endif /* !CONFIG_USER_ONLY */
>
>  static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info
> *info)
>  {
> @@ -863,10 +865,10 @@ static const struct SysemuCPUOps sparc_sysemu_ops =
=3D {
>  static const struct TCGCPUOps sparc_tcg_ops =3D {
>      .initialize =3D sparc_tcg_init,
>      .synchronize_from_tb =3D sparc_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D sparc_cpu_exec_interrupt,
>      .tlb_fill =3D sparc_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D sparc_cpu_exec_interrupt,
>      .do_interrupt =3D sparc_cpu_do_interrupt,
>      .do_transaction_failed =3D sparc_cpu_do_transaction_failed,
>      .do_unaligned_access =3D sparc_cpu_do_unaligned_access,
> --
> 2.31.1
>
>

--000000000000e73e7f05cb08fe46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:19 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Restrict cpu_exec_interrupt() and its callees to sysemu.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/sparc/cpu.c | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br></blockquote><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail=
-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:=
2px 0px 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c<br>
index da6b30ec747..5a8a4ce7506 100644<br>
--- a/target/sparc/cpu.c<br>
+++ b/target/sparc/cpu.c<br>
@@ -77,6 +77,7 @@ static void sparc_cpu_reset(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;cache_control =3D 0;<br>
=C2=A0}<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_requ=
est)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (interrupt_request &amp; CPU_INTERRUPT_HARD) {<br>
@@ -96,6 +97,7 @@ static bool sparc_cpu_exec_interrupt(CPUState *cs, int in=
terrupt_request)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
+#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info =
*info)<br>
=C2=A0{<br>
@@ -863,10 +865,10 @@ static const struct SysemuCPUOps sparc_sysemu_ops =3D=
 {<br>
=C2=A0static const struct TCGCPUOps sparc_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D sparc_tcg_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D sparc_cpu_synchronize_from_tb,=
<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D sparc_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D sparc_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D sparc_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D sparc_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D sparc_cpu_do_transaction_fai=
led,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D sparc_cpu_do_unaligned_access,=
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000e73e7f05cb08fe46--


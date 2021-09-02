Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtES-0007qO-6r
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtEP-0007jh-KY
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:22:41 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:37820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtEM-0003ai-Ek
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:22:41 -0400
Received: by mail-ua1-x929.google.com with SMTP id g2so1579480uad.4
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cCBveFy44EvN8Y+suw+PSl0yG/3v9JpIzr+j/jfrU2M=;
 b=arvYgetv+GMbeeP+zczZjyDFEJU9iDLbMV+apowXv1huVUkgC5nOjCyvwmy8xIDP2k
 wwd/BPlBGYhn7j/ppiVy6hQ9jyKWuB1H2SwoDN4n1X0ticpGnMFi8HHYrjtYkMz7tu8C
 hSs7L3Bb4kj12/sXLD/+DC6aJFxo/UtvJg3PARsyUchRQQYNnWIcga7RNgAjJO+DLDgo
 0jW/IMR2EdEsjlKMCW50LB5NzmRNGqnJeHU3X0scHf02oM7o0Lold269hpEvImqMGUVC
 UX1aMjWY6Q3MAbjR05nqkR7glyTtRvVvJ6Ig3z3FliImRqfun1L8VqIbzGVX9LGmWQ6f
 /iZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cCBveFy44EvN8Y+suw+PSl0yG/3v9JpIzr+j/jfrU2M=;
 b=ipEmq5gAQAUaiL2PXHtVxZlQWYr46dK5AaZGGq3mR3pXKzrMxLT9hACvCfQNpMJ9Xz
 DXA5A01dJGvdskUQrdZp270u2hLhHsHSVfsdzzxsOZ0Q0Sp5prINJ4aT0OOXjSYSn20g
 jhXHJhuq99HN+QQ++Xb3R5e4Qxue5g3Y1lbedVi4khMDck8FqpHemYxXL6xUAnWfjvdM
 nhvHIOawhcuhm5Z1MEt/XwIItp/OCmK42/4ZoVZlN/0DHq9E07qrdKdHcluEYMsptDna
 SFegdja9K+IEkV1N760CxCbaixnKMrW56J45EkDIJDwrZbwzJqO1w/nLNsQSqV2VIWR0
 gEQg==
X-Gm-Message-State: AOAM533bLPaFbEuxCW2ExUQ7k7VM/BcLTgRUHC9Mf0lFpL79pTdcV4Cp
 VRjRNAT08buTY0A7J3zRRlUejv0il1Gt13NtkQywNg==
X-Google-Smtp-Source: ABdhPJxlno4l2zRm/Lveb2WBazdzgo125vITSkx0Wmp6aRCbSHImb6OoJODzdDcPAgH4D2qq3zZnM9H4fpvPPYM6wXc=
X-Received: by 2002:a9f:23d0:: with SMTP id 74mr64957uao.69.1630614155186;
 Thu, 02 Sep 2021 13:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-16-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-16-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:22:24 -0600
Message-ID: <CANCZdfq0LLoC3Tr66bmjXOgB381hrHC751AbwKAZG2vUN3YeQw@mail.gmail.com>
Subject: Re: [PATCH 15/24] target/nios2: Restrict cpu_exec_interrupt() handler
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
Content-Type: multipart/alternative; boundary="0000000000007c672e05cb08f1b4"
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x929.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 20:22:42 -0000

--0000000000007c672e05cb08f1b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/nios2/cpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 5e37defef80..947bb09bc1e 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -127,6 +127,7 @@ static void nios2_cpu_realizefn(DeviceState *dev,
> Error **errp)
>      ncc->parent_realize(dev, errp);
>  }
>
> +#ifndef CONFIG_USER_ONLY
>  static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request=
)
>  {
>      Nios2CPU *cpu =3D NIOS2_CPU(cs);
> @@ -140,7 +141,7 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, in=
t
> interrupt_request)
>      }
>      return false;
>  }
> -
> +#endif /* !CONFIG_USER_ONLY */
>
>  static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info
> *info)
>  {
> @@ -219,10 +220,10 @@ static const struct SysemuCPUOps nios2_sysemu_ops =
=3D {
>
>  static const struct TCGCPUOps nios2_tcg_ops =3D {
>      .initialize =3D nios2_tcg_init,
> -    .cpu_exec_interrupt =3D nios2_cpu_exec_interrupt,
>      .tlb_fill =3D nios2_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D nios2_cpu_exec_interrupt,
>      .do_interrupt =3D nios2_cpu_do_interrupt,
>      .do_unaligned_access =3D nios2_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> --
> 2.31.1
>
>

--0000000000007c672e05cb08f1b4
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
=C2=A0target/nios2/cpu.c | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br></blockquote><div>=
<br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.co=
m" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-yj6qo =
gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0px=
 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c<br>
index 5e37defef80..947bb09bc1e 100644<br>
--- a/target/nios2/cpu.c<br>
+++ b/target/nios2/cpu.c<br>
@@ -127,6 +127,7 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0ncc-&gt;parent_realize(dev, errp);<br>
=C2=A0}<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_requ=
est)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Nios2CPU *cpu =3D NIOS2_CPU(cs);<br>
@@ -140,7 +141,7 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, int =
interrupt_request)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
-<br>
+#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info =
*info)<br>
=C2=A0{<br>
@@ -219,10 +220,10 @@ static const struct SysemuCPUOps nios2_sysemu_ops =3D=
 {<br>
<br>
=C2=A0static const struct TCGCPUOps nios2_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D nios2_tcg_init,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D nios2_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D nios2_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D nios2_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D nios2_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D nios2_cpu_do_unaligned_access,=
<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000007c672e05cb08f1b4--


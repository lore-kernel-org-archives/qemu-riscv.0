Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtIH-0006Xx-Sd
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtIG-0006Ui-7H
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:26:40 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:45997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtIE-000705-19
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:26:39 -0400
Received: by mail-vs1-xe31.google.com with SMTP id a21so2623560vsp.12
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cATzV+cgXA9fNf6+6osb5t9LIw0lqjY+rzeij2NRDf0=;
 b=DRVhSzZsPNOUVAwAQdU3ZfJkRqxYT5ooUQ0xzAZbyEd5BK+RK8v4wCu1oazuQetzeR
 xCsnZ3/Tn/Q1qs6Y6RjEN2j+Inu7kXf5lvv3ecHK3eluC3dclp8eTrdoWZUD1ZZ5HY3q
 mgLX0DoKZIp6IaFpDB2MuNMeVpUBIYPQseC7MZpACC/GQO7xt/SyPOAkBlcD5Y1dkfDS
 sMLRJes9UD7G88UbrMPPUp+h2GNHDHARzwGxHboygmkVk34LRMsZhM33VWYmiKT9rJgB
 Fe0R3FCb71AJcJZyu90zwFG+cCNzsRKj9/dMNgORreiL6Ske6HZOfYtqG/K0kFnvkzq/
 bp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cATzV+cgXA9fNf6+6osb5t9LIw0lqjY+rzeij2NRDf0=;
 b=NOZw/TlC54OiIRLxytzWMZBl+ovo+Ni90OO4+ENRc5Ymde3WE8zB2KWnTL9P0JMHhx
 +Eo48fj9rYPjAlAB60zCZEhMgrVpzezsrixpePOl9ACUti2EJJhiAITGto7IOLFIBi6d
 eg1FGfcojdFvoeFpbaKkMKyu3VgUi37ryz85bbvZCvnKLqJyLHZZ/AJ8C9i2RtOzgTpN
 AwpEr4sE8uXA5rjrltD1ZLvj2Q8a88RHjb6+rUILL99lbAWbd0uT/pY7K+F9JUzo7Kdu
 Nro+3eAe1rQdX11hy65nNb92p3jKum7so5vRPiHeUXyLyoBS4p2Hrc4FlbqS6qRsGDHB
 beMw==
X-Gm-Message-State: AOAM530/2FR+hoNFjjsxoLUSHgmAowGrzkDVWXEKaUzLeCcP5inNDGut
 UN1rWxa+EDyXS4yq8Fl8xdomIq/c0erfF1+ZBIAmfw==
X-Google-Smtp-Source: ABdhPJzCQnrZJVyyLjW6ViZm56nxlRoiIb9JOyCCs4FBdQe8rdlDPfVruz1UYu6Sr4ILLM1CDWpjyMkVVqOuUH+hdpo=
X-Received: by 2002:a67:2dc6:: with SMTP id t189mr3914121vst.49.1630614396994; 
 Thu, 02 Sep 2021 13:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-22-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-22-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:26:26 -0600
Message-ID: <CANCZdfqpxrTgYz5Ff5TshQ9ro6486XX4M0EL=RSHrUQyHpGd1A@mail.gmail.com>
Subject: Re: [PATCH 21/24] target/rx: Restrict cpu_exec_interrupt() handler to
 sysemu
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
Content-Type: multipart/alternative; boundary="000000000000e61b4605cb08ff52"
Received-SPF: none client-ip=2607:f8b0:4864:20::e31;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 20:26:40 -0000

--000000000000e61b4605cb08ff52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:19 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/rx/cpu.h    | 2 ++
>  target/rx/cpu.c    | 2 +-
>  target/rx/helper.c | 4 ++++
>  3 files changed, 7 insertions(+), 1 deletion(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/rx/cpu.h b/target/rx/cpu.h
> index 0b4b998c7be..faa3606f52f 100644
> --- a/target/rx/cpu.h
> +++ b/target/rx/cpu.h
> @@ -124,8 +124,10 @@ typedef RXCPU ArchCPU;
>  #define CPU_RESOLVING_TYPE TYPE_RX_CPU
>
>  const char *rx_crname(uint8_t cr);
> +#ifndef CONFIG_USER_ONLY
>  void rx_cpu_do_interrupt(CPUState *cpu);
>  bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +#endif /* !CONFIG_USER_ONLY */
>  void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 96cc96e514f..25a4aa2976d 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -186,10 +186,10 @@ static const struct SysemuCPUOps rx_sysemu_ops =3D =
{
>  static const struct TCGCPUOps rx_tcg_ops =3D {
>      .initialize =3D rx_translate_init,
>      .synchronize_from_tb =3D rx_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D rx_cpu_exec_interrupt,
>      .tlb_fill =3D rx_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D rx_cpu_exec_interrupt,
>      .do_interrupt =3D rx_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/rx/helper.c b/target/rx/helper.c
> index db6b07e3890..f34945e7e2c 100644
> --- a/target/rx/helper.c
> +++ b/target/rx/helper.c
> @@ -40,6 +40,8 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw,
> int rte)
>      env->psw_c =3D FIELD_EX32(psw, PSW, C);
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +
>  #define INT_FLAGS (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR)
>  void rx_cpu_do_interrupt(CPUState *cs)
>  {
> @@ -142,6 +144,8 @@ bool rx_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      return false;
>  }
>
> +#endif /* !CONFIG_USER_ONLY */
> +
>  hwaddr rx_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>  {
>      return addr;
> --
> 2.31.1
>
>

--000000000000e61b4605cb08ff52
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
=C2=A0target/rx/cpu.h=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0target/rx/cpu.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/rx/helper.c | 4 ++++<br>
=C2=A03 files changed, 7 insertions(+), 1 deletion(-)<br></blockquote><div>=
<br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.co=
m" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-yj6qo =
gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0px=
 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/rx/cpu.h b/target/rx/cpu.h<br>
index 0b4b998c7be..faa3606f52f 100644<br>
--- a/target/rx/cpu.h<br>
+++ b/target/rx/cpu.h<br>
@@ -124,8 +124,10 @@ typedef RXCPU ArchCPU;<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_RX_CPU<br>
<br>
=C2=A0const char *rx_crname(uint8_t cr);<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0void rx_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
+#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;<br>
=C2=A0int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);<=
br>
diff --git a/target/rx/cpu.c b/target/rx/cpu.c<br>
index 96cc96e514f..25a4aa2976d 100644<br>
--- a/target/rx/cpu.c<br>
+++ b/target/rx/cpu.c<br>
@@ -186,10 +186,10 @@ static const struct SysemuCPUOps rx_sysemu_ops =3D {<=
br>
=C2=A0static const struct TCGCPUOps rx_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D rx_translate_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D rx_cpu_synchronize_from_tb,<br=
>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D rx_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D rx_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D rx_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D rx_cpu_do_interrupt,<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
diff --git a/target/rx/helper.c b/target/rx/helper.c<br>
index db6b07e3890..f34945e7e2c 100644<br>
--- a/target/rx/helper.c<br>
+++ b/target/rx/helper.c<br>
@@ -40,6 +40,8 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int=
 rte)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;psw_c =3D FIELD_EX32(psw, PSW, C);<br>
=C2=A0}<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
+<br>
=C2=A0#define INT_FLAGS (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR)<br>
=C2=A0void rx_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0{<br>
@@ -142,6 +144,8 @@ bool rx_cpu_exec_interrupt(CPUState *cs, int interrupt_=
request)<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
+#endif /* !CONFIG_USER_ONLY */<br>
+<br>
=C2=A0hwaddr rx_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return addr;<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000e61b4605cb08ff52--


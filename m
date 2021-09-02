Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtB0-00019l-0h
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt26-00036M-Hu
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:09:58 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:44703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt23-0000xR-G0
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:09:58 -0400
Received: by mail-ua1-x934.google.com with SMTP id x6so1554301uai.11
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yy/dcYFGhKpu0ptaayrsqN44d0c/Beh6cldZRRjkueo=;
 b=LAWjq4VjLaMEZLOYnO/2vAI5sTFiOgEwDOOMTHHjQ+i3iFx5K3nBw4Xj1zaSbq80Ka
 hZOq595bqGDGMLAfW+/TREThUJs/cOJhxnuctnCQ1wZfIjIPIawR3tijX5SiPmbO247g
 kkCXFxG49IBOa9HDRksTrqPK8rDI3xkLjbzrRO3cqgXdcqsLd2GFapRJ6ABb49atdxeZ
 CKM6JX1ObcTOuY0B9yscIQW0p13uVlRqzY/FfGV8XtexDzWEGHqTinmH2Q63M9M9SKhw
 9VaSZvtO4tdYN0HEa2Nci2y/2n3PcIaRlCsHjlukt6FPai9xWH6odrwTPe4BaWu0pwWt
 nY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yy/dcYFGhKpu0ptaayrsqN44d0c/Beh6cldZRRjkueo=;
 b=Cea/jl/J6BGFcdfUynamq4zaA529KQBGQVVx1yhxqq3c5j504ui1KDbpsaLNprIOok
 2RDHlPgk8s5nukKHvah7CPnjSxxV6LyGhENBcDogHkWZJFarMMicL5TFALzVHgzl2nY6
 8VLw9k+CGt4XVul3zKvWRO1na61H2a+fhN57R1fcYpUzyKMjXwmM1FdRYQ6cc0nnvAa6
 /MiHe+OeJyp+v437t4p0M2FhC5RMMLg5carAwWqsP1gWyIPiJxtghw4I+wdv7Rx36NVK
 JGC0fGhs0aOYzGfnkt/4yREls1EbCLIUWrybGdPIS3xXJcKmAfbmf7xGqbhAeP1uFZdP
 9kQg==
X-Gm-Message-State: AOAM530TiHJ2nVsMTVeHQGQqkjRvaoiEjGgH84wf0qlQXbAeTLuFGagZ
 QQ9E9cUQRlSEPDX5bqb3JjoTYPZF19lWIP9NQ/1Vsg==
X-Google-Smtp-Source: ABdhPJwusm2ibjguQg+1Na4VfwKxEG65kNOFcGOyaci9y44319h7E8Zd9ICQKkQ7ZDu8Q30CaprVyzSWCLlhwkTlXr4=
X-Received: by 2002:ab0:3413:: with SMTP id z19mr24593uap.39.1630613393374;
 Thu, 02 Sep 2021 13:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-2-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-2-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:09:42 -0600
Message-ID: <CANCZdfrHrQQkiXmBc62X0b36n726iDCwvLfYXQrker7knhhD0g@mail.gmail.com>
Subject: Re: [PATCH 01/24] target/xtensa: Restrict do_transaction_failed() to
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
Content-Type: multipart/alternative; boundary="000000000000140ed505cb08c417"
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
X-List-Received-Date: Thu, 02 Sep 2021 20:09:58 -0000

--000000000000140ed505cb08c417
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> The do_transaction_failed() is restricted to system emulation since
> commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> ---
>  target/xtensa/cpu.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index 2345cb59c79..1e0cb1535ca 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -568,10 +568,12 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr
> address, int size,
>                           bool probe, uintptr_t retaddr);
>  void xtensa_cpu_do_interrupt(CPUState *cpu);
>  bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
> +#ifndef CONFIG_USER_ONLY
>  void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> vaddr addr,
>                                        unsigned size, MMUAccessType
> access_type,
>                                        int mmu_idx, MemTxAttrs attrs,
>                                        MemTxResult response, uintptr_t
> retaddr);
> +#endif /* !CONFIG_USER_ONLY */
>  void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void xtensa_count_regs(const XtensaConfig *config,
> --
> 2.31.1
>
>

--000000000000140ed505cb08c417
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:17 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>The do_transaction_failed() is restricted to system emulation since<br>
commit cbc183d2d9f (&quot;cpu: move cc-&gt;transaction_failed to tcg_ops&qu=
ot;).<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">im=
p@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
---<br>
=C2=A0target/xtensa/cpu.h | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h<br>
index 2345cb59c79..1e0cb1535ca 100644<br>
--- a/target/xtensa/cpu.h<br>
+++ b/target/xtensa/cpu.h<br>
@@ -568,10 +568,12 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address,=
 int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bool probe, uintptr_t retaddr);<br>
=C2=A0void xtensa_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);=
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, =
vaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
size, MMUAccessType access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_i=
dx, MemTxAttrs attrs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemTxResu=
lt response, uintptr_t retaddr);<br>
+#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0void xtensa_count_regs(const XtensaConfig *config,<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000140ed505cb08c417--


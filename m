Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtHl-0005il-4n
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtHi-0005a1-HT
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:26:06 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:34476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtHe-0006RR-HB
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:26:06 -0400
Received: by mail-ua1-x92d.google.com with SMTP id l24so1585125uai.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QyZobYMQHcUZ56oMxYtgIAHx7uOBirlOqQnRrRYCGUI=;
 b=1yyYZIkkhfoO+E3vnuqxjEE4D+RA6JVkccMhh/o/OvH6EFAInyzYHomT+vcegJIOSP
 IpTXEzMRPIYt1Nruwf5TqFEqOOuxe+ZuZm2NHbWNy3iqnu42NFzuO0/H5t7b08L3kokg
 OJjkkIqLP7Ao5LU/49vtHNzUS0ym0Cv+3ZYi4EAne/xRvPhnhlfHf3IelVJF0xwYAP8a
 DQExSN2gzWQ5/a+TDRraX1SgLRINskjkMSdXSRQoT6CGj9LoZgcvjpkR9mr+VXGePht4
 Pn8Kle+XZpEDqvcUzR4gRegMuFK65n4Lsv2XEL80AiAZf0WvR1wv5DrxQcsPW7qDnvFW
 LgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QyZobYMQHcUZ56oMxYtgIAHx7uOBirlOqQnRrRYCGUI=;
 b=etq5WyPHOeqYRtx9HpXk3hvcQvDD/KGOINazgBTMDOQLZMPKp8eC4zQNWiYy46L9CT
 6Oj5ZsQfbZPGiTiFKtaR3CgVLO/na48KN93P3Xf2nmp5Kmen3JbK6T/2A3VtsVzNoM+0
 61YxP6j4rsl/x04wndUNKLRDgXQ5eZIOqvQiYDmRwhcNX4Yc5MsLuyeY9RaqlDmrRqFx
 YmsJ2G5odV7nBc/LEIFAaWXOV2D4uuYgozsLWqEOgg2O4ay0VH2Hv9Xkcpfwy8R/5s2y
 X5xxMtxdYw6CdRjfWwQpc7TwRQR4wy5DROjym2ooAd5HcTYpHWwtTkwslu9BDV5I+rQb
 OoRQ==
X-Gm-Message-State: AOAM532uPPo1PU6+ItV/QV30Alr85JRkgFHj+m15hoB+HGGfHrv0Fb7y
 U12TUXMhuo+zxPmw+ZJ+emy4ejeXhiVW1XhKeDXVQg==
X-Google-Smtp-Source: ABdhPJyBsa9urB/ZU8Ov4Vb8TkJIjluTvkNljpjCo2mVXlLHF5wiz/w/etFYm3157hrO47lfQnq+MA4ya510DnjmG9Q=
X-Received: by 2002:a9f:23d0:: with SMTP id 74mr70802uao.69.1630614360980;
 Thu, 02 Sep 2021 13:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-20-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-20-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:25:50 -0600
Message-ID: <CANCZdfoCQ8-gAj67vHwCSVZ1QYoirMJw=vu4_=2Q=6gMA8BBtQ@mail.gmail.com>
Subject: Re: [PATCH 19/24] target/sh4: Restrict cpu_exec_interrupt() handler
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
Content-Type: multipart/alternative; boundary="000000000000c08c8005cb08fdc7"
Received-SPF: none client-ip=2607:f8b0:4864:20::92d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92d.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 20:26:06 -0000

--000000000000c08c8005cb08fdc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:19 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/sh4/cpu.h    | 4 ++--
>  target/sh4/cpu.c    | 2 +-
>  target/sh4/helper.c | 9 ++-------
>  3 files changed, 5 insertions(+), 10 deletions(-)
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index 01c43440822..017a7702140 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -204,8 +204,6 @@ struct SuperHCPU {
>  };
>
>
> -void superh_cpu_do_interrupt(CPUState *cpu);
> -bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg=
);
> @@ -223,6 +221,8 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
>
>  void sh4_cpu_list(void);
>  #if !defined(CONFIG_USER_ONLY)
> +void superh_cpu_do_interrupt(CPUState *cpu);
> +bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void cpu_sh4_invalidate_tlb(CPUSH4State *s);
>  uint32_t cpu_sh4_read_mmaped_itlb_addr(CPUSH4State *s,
>                                         hwaddr addr);
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 83269229421..2047742d03c 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -236,10 +236,10 @@ static const struct SysemuCPUOps sh4_sysemu_ops =3D=
 {
>  static const struct TCGCPUOps superh_tcg_ops =3D {
>      .initialize =3D sh4_translate_init,
>      .synchronize_from_tb =3D superh_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D superh_cpu_exec_interrupt,
>      .tlb_fill =3D superh_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D superh_cpu_exec_interrupt,
>      .do_interrupt =3D superh_cpu_do_interrupt,
>      .do_unaligned_access =3D superh_cpu_do_unaligned_access,
>      .io_recompile_replay_branch =3D superh_io_recompile_replay_branch,
> diff --git a/target/sh4/helper.c b/target/sh4/helper.c
> index 2d622081e85..53cb9c3b631 100644
> --- a/target/sh4/helper.c
> +++ b/target/sh4/helper.c
> @@ -45,11 +45,6 @@
>
>  #if defined(CONFIG_USER_ONLY)
>
> -void superh_cpu_do_interrupt(CPUState *cs)
> -{
> -    cs->exception_index =3D -1;
> -}
> -
>  int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)
>  {
>      /* For user mode, only U0 area is cacheable. */
> @@ -784,8 +779,6 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong
> addr)
>      return 0;
>  }
>
> -#endif
> -
>  bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      if (interrupt_request & CPU_INTERRUPT_HARD) {
> @@ -803,6 +796,8 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      return false;
>  }
>
> +#endif /* !CONFIG_USER_ONLY */
> +
>  bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           MMUAccessType access_type, int mmu_idx,
>                           bool probe, uintptr_t retaddr)
> --
> 2.31.1
>
>

--000000000000c08c8005cb08fdc7
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
=C2=A0target/sh4/cpu.h=C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0target/sh4/cpu.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/sh4/helper.c | 9 ++-------<br>
=C2=A03 files changed, 5 insertions(+), 10 deletions(-)<br>
<br></blockquote><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail=
-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:=
2px 0px 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h<br>
index 01c43440822..017a7702140 100644<br>
--- a/target/sh4/cpu.h<br>
+++ b/target/sh4/cpu.h<br>
@@ -204,8 +204,6 @@ struct SuperHCPU {<br>
=C2=A0};<br>
<br>
<br>
-void superh_cpu_do_interrupt(CPUState *cpu);<br>
-bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
=C2=A0void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int =
reg);<br>
@@ -223,6 +221,8 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, i=
nt size,<br>
<br>
=C2=A0void sh4_cpu_list(void);<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
+void superh_cpu_do_interrupt(CPUState *cpu);<br>
+bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
=C2=A0void cpu_sh4_invalidate_tlb(CPUSH4State *s);<br>
=C2=A0uint32_t cpu_sh4_read_mmaped_itlb_addr(CPUSH4State *s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hwaddr a=
ddr);<br>
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c<br>
index 83269229421..2047742d03c 100644<br>
--- a/target/sh4/cpu.c<br>
+++ b/target/sh4/cpu.c<br>
@@ -236,10 +236,10 @@ static const struct SysemuCPUOps sh4_sysemu_ops =3D {=
<br>
=C2=A0static const struct TCGCPUOps superh_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D sh4_translate_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D superh_cpu_synchronize_from_tb=
,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D superh_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D superh_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D superh_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D superh_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D superh_cpu_do_unaligned_access=
,<br>
=C2=A0 =C2=A0 =C2=A0.io_recompile_replay_branch =3D superh_io_recompile_rep=
lay_branch,<br>
diff --git a/target/sh4/helper.c b/target/sh4/helper.c<br>
index 2d622081e85..53cb9c3b631 100644<br>
--- a/target/sh4/helper.c<br>
+++ b/target/sh4/helper.c<br>
@@ -45,11 +45,6 @@<br>
<br>
=C2=A0#if defined(CONFIG_USER_ONLY)<br>
<br>
-void superh_cpu_do_interrupt(CPUState *cs)<br>
-{<br>
-=C2=A0 =C2=A0 cs-&gt;exception_index =3D -1;<br>
-}<br>
-<br>
=C2=A0int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* For user mode, only U0 area is cacheable. */<br>
@@ -784,8 +779,6 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong a=
ddr)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
-#endif<br>
-<br>
=C2=A0bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (interrupt_request &amp; CPU_INTERRUPT_HARD) {<br>
@@ -803,6 +796,8 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interr=
upt_request)<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
+#endif /* !CONFIG_USER_ONLY */<br>
+<br>
=C2=A0bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bool probe, uintptr_t retaddr)<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000c08c8005cb08fdc7--


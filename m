Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLtB0-0001Bg-Eu
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 16:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt8r-00046X-Sh
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:16:58 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:36492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt8p-0007Ix-W4
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 16:16:57 -0400
Received: by mail-ua1-x92d.google.com with SMTP id x23so1585623uav.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Sep 2021 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PPnlERc7u6MmKGlf0skuXfDJNggzkZn3z7puXsTnSGI=;
 b=gXFelTolWhXcGwOUQ8qd4G5wX34KjIcx/HGCdyzFHXafkuzeX148ceKMgpiDczKY9s
 a2ki2Z2b5yKfxZWrnBEFsNOk2tMNCIGTuxgJz2E2FouW/iYHTMiyuIlj1CcivGs8AjO5
 vz9b23EbkqCDfvEjOdaLATg2kumJADmlW2Xzqvtd5tkh5slougPyKrUneZfrJM1bW6Ge
 1K8jLiu7C9HVGbV46SnMby8C7TI+KI5kbBkOx9RG3IZ1xDdiU3T/Txid4m4D18WhMQ00
 2dTQ3ZIge8CS3eNu4ZeZQ3jrSSQ7sFdO/vmHLTaeTMxDSUShpkUeFZocZ3KuoqcNJVtY
 aGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PPnlERc7u6MmKGlf0skuXfDJNggzkZn3z7puXsTnSGI=;
 b=MnzcdbP9aP2AqNavS3RgquE1hUC3FpFxtQObsgDG7C8kwhrOao2KK24FRri0TKSjT/
 bntb6XyUwjAqgswqcry9MJJLPd68B9x5dNyWYVpmGMLClAOfntsSlJJj17fRQ4wg4Zzn
 WATtI1bArd4lBDhjHMbiWXhJsu973ccQZ13oyppgQmJ6VRaUORO1ZtTrk1VZ1+n6yRIi
 PaNFMwppA4lm1Txmz6WrWBW6phczw8op8dLLxApd0XSig5owaM1WAiz52QpUejIhKRBh
 luCa7Vy4wpoh8ZuKKRBJUzkjv2m+QbdeNcrnamQahd+rnt0DFpkfU4HquWm0LKzCeL0B
 zhYg==
X-Gm-Message-State: AOAM530rgi4QwebDhjcMP/MbEutF7GZ50qE77lvIAFpIDXyXJhlM6DwE
 jWmoXVxEYrD4z2bhzmd6X2tYMxBRW5pH9rFDoU2lfQ==
X-Google-Smtp-Source: ABdhPJynXdHCd8eJG54f42eLbPaOcq95rPiXaffj04QawshNpG98LF9S9cKxHtovEsQOEpoM4iSJy+rjGXJyjS4Cvh4=
X-Received: by 2002:ab0:3413:: with SMTP id z19mr59626uap.39.1630613814846;
 Thu, 02 Sep 2021 13:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-9-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-9-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:16:44 -0600
Message-ID: <CANCZdfqc+Y6=SwM850qbTKfBxJMFm8ca5NvyVimSbceVTZ2nkw@mail.gmail.com>
Subject: Re: [PATCH 08/24] target/avr: Restrict cpu_exec_interrupt() handler
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
Content-Type: multipart/alternative; boundary="00000000000033378f05cb08dd96"
Received-SPF: none client-ip=2607:f8b0:4864:20::92d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 20:16:59 -0000

--00000000000033378f05cb08dd96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/avr/cpu.h    | 2 ++
>  target/avr/cpu.c    | 2 +-
>  target/avr/helper.c | 2 ++
>  3 files changed, 5 insertions(+), 1 deletion(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> index 93e3faa0a98..6f8c0ffd770 100644
> --- a/target/avr/cpu.h
> +++ b/target/avr/cpu.h
> @@ -156,8 +156,10 @@ typedef struct AVRCPU {
>
>  extern const struct VMStateDescription vms_avr_cpu;
>
> +#ifndef CONFIG_USER_ONLY
>  void avr_cpu_do_interrupt(CPUState *cpu);
>  bool avr_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +#endif /* !CONFIG_USER_ONLY */
>  hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int avr_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index ea14175ca55..e9fa54c9777 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -195,10 +195,10 @@ static const struct SysemuCPUOps avr_sysemu_ops =3D=
 {
>  static const struct TCGCPUOps avr_tcg_ops =3D {
>      .initialize =3D avr_cpu_tcg_init,
>      .synchronize_from_tb =3D avr_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D avr_cpu_exec_interrupt,
>      .tlb_fill =3D avr_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D avr_cpu_exec_interrupt,
>      .do_interrupt =3D avr_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/avr/helper.c b/target/avr/helper.c
> index 981c29da453..84e366d94a3 100644
> --- a/target/avr/helper.c
> +++ b/target/avr/helper.c
> @@ -25,6 +25,7 @@
>  #include "exec/address-spaces.h"
>  #include "exec/helper-proto.h"
>
> +#ifndef CONFIG_USER_ONLY
>  bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      bool ret =3D false;
> @@ -91,6 +92,7 @@ void avr_cpu_do_interrupt(CPUState *cs)
>
>      cs->exception_index =3D -1;
>  }
> +#endif /* !CONFIG_USER_ONLY */
>
>  int avr_cpu_memory_rw_debug(CPUState *cs, vaddr addr, uint8_t *buf,
>                              int len, bool is_write)
> --
> 2.31.1
>
>

--00000000000033378f05cb08dd96
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
=C2=A0target/avr/cpu.h=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0target/avr/cpu.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/avr/helper.c | 2 ++<br>
=C2=A03 files changed, 5 insertions(+), 1 deletion(-)<br></blockquote><div>=
<br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.co=
m" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-yj6qo =
gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0px=
 0px">=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/avr/cpu.h b/target/avr/cpu.h<br>
index 93e3faa0a98..6f8c0ffd770 100644<br>
--- a/target/avr/cpu.h<br>
+++ b/target/avr/cpu.h<br>
@@ -156,8 +156,10 @@ typedef struct AVRCPU {<br>
<br>
=C2=A0extern const struct VMStateDescription vms_avr_cpu;<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0void avr_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0bool avr_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
+#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0int avr_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg=
);<br>
=C2=A0int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);=
<br>
diff --git a/target/avr/cpu.c b/target/avr/cpu.c<br>
index ea14175ca55..e9fa54c9777 100644<br>
--- a/target/avr/cpu.c<br>
+++ b/target/avr/cpu.c<br>
@@ -195,10 +195,10 @@ static const struct SysemuCPUOps avr_sysemu_ops =3D {=
<br>
=C2=A0static const struct TCGCPUOps avr_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D avr_cpu_tcg_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D avr_cpu_synchronize_from_tb,<b=
r>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D avr_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D avr_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D avr_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D avr_cpu_do_interrupt,<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
diff --git a/target/avr/helper.c b/target/avr/helper.c<br>
index 981c29da453..84e366d94a3 100644<br>
--- a/target/avr/helper.c<br>
+++ b/target/avr/helper.c<br>
@@ -25,6 +25,7 @@<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
=C2=A0#include &quot;exec/helper-proto.h&quot;<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0bool ret =3D false;<br>
@@ -91,6 +92,7 @@ void avr_cpu_do_interrupt(CPUState *cs)<br>
<br>
=C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D -1;<br>
=C2=A0}<br>
+#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0int avr_cpu_memory_rw_debug(CPUState *cs, vaddr addr, uint8_t *buf,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int len, bool is_write)<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000033378f05cb08dd96--


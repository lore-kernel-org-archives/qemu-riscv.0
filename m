Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAoZp-00022t-KQ
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 04:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1oAoZc-0001z1-Te
 for qemu-riscv@nongnu.org; Mon, 11 Jul 2022 04:15:26 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1oAoZZ-0002HC-VF
 for qemu-riscv@nongnu.org; Mon, 11 Jul 2022 04:15:19 -0400
Received: by mail-pl1-x636.google.com with SMTP id r1so3802914plo.10
 for <qemu-riscv@nongnu.org>; Mon, 11 Jul 2022 01:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gALJA9XQQHnnvw6djZ88dk8W/j/i4rQwf653bx741zQ=;
 b=W+xwxs4a9iEeKCqUhQKXSukc5OHN/tISoi+N9/mQgItjPiBOJ3Or0dbcenhdg0yj2z
 qtWDllJEgK0XmJvD8MTuw01t954kOVa8gPhGj1PwFuDFxrG/xgH8kWn1zP4e/g8KFJCz
 RvUpcvaxG3OFYs7Rp3kz876ACnCTpOss4q2evh9XJiqReOhohPh9Zok5Ri4vBp1/MAAv
 6KZoFkExnRWtRMX44Pt0GXifxYYBHz/1PFbFtIBqfIHMejCtltdXUyv1dked5kwhwGp5
 rlLrh+jQFRf3RgJ1WWw3R2vSWYWDVDTa37RGS66BoWHpgLtpjyLxgTXlwgsg96l/Ruog
 xaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gALJA9XQQHnnvw6djZ88dk8W/j/i4rQwf653bx741zQ=;
 b=ech+lPbO+hTvmZeXw9LtgJF5jW+tMkBjCGQiHi/j6qKEE3QZ0Rwzx9TpFSfqpT+gOw
 xQBGztfKolH9KZn7Z19+rBTPXwBKyJZs9gUdlJHU1ptUIVVnSbibq1xjWNxafdkbeFQE
 OlIKMu5446UIuk7cZHhW/Bc7OC9VO2qjvfje8RfmS0ED0bCZ89dUJCXR9zDVXnV62Kr9
 /erENVXIflx/l7R3d34oH8FvyiF5a71WmVIdM9lMSHP69Jtp25TxsfGl5RYL2EE5Ukwr
 Ca1MPFH6r+7CnDznrHdlYzgMYVz9py/V/HA+F4MGD8TO13psf+4va2njxWA8DaxaN6rX
 9XMw==
X-Gm-Message-State: AJIora9IGBg2sb9b3Ew34C+o0lDHAQUcwfnp6ujEaGI7Wtedplfq5luH
 hubqdxf2dnbUpwAYosqU3c4wFsFToqSojLXYv5bMlX2CGUrA9MwK
X-Google-Smtp-Source: AGRyM1vWEXhi80hXyrZkhXXPdVU7Qf+M5cDU+ng2sKKjX1D4AeO/6uiD46vC4u1GAG1udyQEN4+Fyl3wHElW8R+UPl8=
X-Received: by 2002:a17:902:f606:b0:168:ecca:44e with SMTP id
 n6-20020a170902f60600b00168ecca044emr16977922plg.144.1657527316489; Mon, 11
 Jul 2022 01:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220708085736.94546-1-kito.cheng@sifive.com>
In-Reply-To: <20220708085736.94546-1-kito.cheng@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 11 Jul 2022 16:15:05 +0800
Message-ID: <CAE_xrPhF2egOghgQ_rdUznJ1W=PCqmzaLrF27GeNOWbbg8Yo3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] util/log: Add vu to dump content of vector unit
To: Kito Cheng <kito.cheng@sifive.com>
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn, richard.henderson@linaro.org
Content-Type: multipart/alternative; boundary="000000000000e7c05905e38326ab"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2022 08:15:27 -0000

--000000000000e7c05905e38326ab
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 4:57 PM Kito Cheng <kito.cheng@sifive.com> wrote:

> Add new option for -d vu to dump the content of vector unit, many target
> has vector register, but there is no easy way to dump the content, we
> use this on downstream for a while to help debug, and I feel that's
> really useful, so I think it would be great to upstream that to save debug
> time
> for other people :)
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  accel/tcg/cpu-exec.c  | 3 +++
>  include/hw/core/cpu.h | 2 ++
>  include/qemu/log.h    | 1 +
>  util/log.c            | 2 ++
>  4 files changed, 8 insertions(+)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index a565a3f8ec..2cbec0a6ed 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -221,6 +221,9 @@ static inline void log_cpu_exec(target_ulong pc,
> CPUState *cpu,
>                  if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
>                      flags |= CPU_DUMP_FPU;
>                  }
> +                if (qemu_loglevel_mask(CPU_LOG_TB_VU)) {
> +                    flags |= CPU_DUMP_VU;
> +                }
>  #if defined(TARGET_I386)
>                  flags |= CPU_DUMP_CCOP;
>  #endif
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 996f94059f..7a767e17cd 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -535,11 +535,13 @@ GuestPanicInformation *cpu_get_crash_info(CPUState
> *cpu);
>   * @CPU_DUMP_CODE:
>   * @CPU_DUMP_FPU: dump FPU register state, not just integer
>   * @CPU_DUMP_CCOP: dump info about TCG QEMU's condition code optimization
> state
> + * @CPU_DUMP_VU: dump vector register state
>   */
>  enum CPUDumpFlags {
>      CPU_DUMP_CODE = 0x00010000,
>      CPU_DUMP_FPU  = 0x00020000,
>      CPU_DUMP_CCOP = 0x00040000,
> +    CPU_DUMP_VU   = 0x00080000,
>  };
>
>  /**
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index c5643d8dd5..49bd0b0fbc 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -35,6 +35,7 @@ bool qemu_log_separate(void);
>  /* LOG_STRACE is used for user-mode strace logging. */
>  #define LOG_STRACE         (1 << 19)
>  #define LOG_PER_THREAD     (1 << 20)
> +#define CPU_LOG_TB_VU      (1 << 21)
>
>  /* Lock/unlock output. */
>
> diff --git a/util/log.c b/util/log.c
> index d6eb0378c3..775d122c2e 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -441,6 +441,8 @@ const QEMULogItem qemu_log_items[] = {
>  #ifdef CONFIG_PLUGIN
>      { CPU_LOG_PLUGIN, "plugin", "output from TCG plugins\n"},
>  #endif
> +    { CPU_LOG_TB_VU, "vu",
> +      "include vector unit registers in the 'cpu' logging" },
>      { LOG_STRACE, "strace",
>        "log every user-mode syscall, its input, and its result" },
>      { LOG_PER_THREAD, "tid",
> --
> 2.34.0
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000e7c05905e38326ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>On Fri, Jul 8, 2022 at 4:57 PM Kito =
Cheng &lt;<a href=3D"mailto:kito.cheng@sifive.com">kito.cheng@sifive.com</a=
>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Add new option for -d vu to dump the content =
of vector unit, many target<br>
has vector register, but there is no easy way to dump the content, we<br>
use this on downstream for a while to help debug, and I feel that&#39;s<br>
really useful, so I think it would be great to upstream that to save debug =
time<br>
for other people :)<br>
<br>
Signed-off-by: Kito Cheng &lt;<a href=3D"mailto:kito.cheng@sifive.com" targ=
et=3D"_blank">kito.cheng@sifive.com</a>&gt;<br>
---<br>
=C2=A0accel/tcg/cpu-exec.c=C2=A0 | 3 +++<br>
=C2=A0include/hw/core/cpu.h | 2 ++<br>
=C2=A0include/qemu/log.h=C2=A0 =C2=A0 | 1 +<br>
=C2=A0util/log.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A04 files changed, 8 insertions(+)<br>
<br>
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c<br>
index a565a3f8ec..2cbec0a6ed 100644<br>
--- a/accel/tcg/cpu-exec.c<br>
+++ b/accel/tcg/cpu-exec.c<br>
@@ -221,6 +221,9 @@ static inline void log_cpu_exec(target_ulong pc, CPUSta=
te *cpu,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (qemu_logl=
evel_mask(CPU_LOG_TB_FPU)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0flags |=3D CPU_DUMP_FPU;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_loglevel_=
mask(CPU_LOG_TB_VU)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flag=
s |=3D CPU_DUMP_VU;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0#if defined(TARGET_I386)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D CP=
U_DUMP_CCOP;<br>
=C2=A0#endif<br>
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h<br>
index 996f94059f..7a767e17cd 100644<br>
--- a/include/hw/core/cpu.h<br>
+++ b/include/hw/core/cpu.h<br>
@@ -535,11 +535,13 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *c=
pu);<br>
=C2=A0 * @CPU_DUMP_CODE:<br>
=C2=A0 * @CPU_DUMP_FPU: dump FPU register state, not just integer<br>
=C2=A0 * @CPU_DUMP_CCOP: dump info about TCG QEMU&#39;s condition code opti=
mization state<br>
+ * @CPU_DUMP_VU: dump vector register state<br>
=C2=A0 */<br>
=C2=A0enum CPUDumpFlags {<br>
=C2=A0 =C2=A0 =C2=A0CPU_DUMP_CODE =3D 0x00010000,<br>
=C2=A0 =C2=A0 =C2=A0CPU_DUMP_FPU=C2=A0 =3D 0x00020000,<br>
=C2=A0 =C2=A0 =C2=A0CPU_DUMP_CCOP =3D 0x00040000,<br>
+=C2=A0 =C2=A0 CPU_DUMP_VU=C2=A0 =C2=A0=3D 0x00080000,<br>
=C2=A0};<br>
<br>
=C2=A0/**<br>
diff --git a/include/qemu/log.h b/include/qemu/log.h<br>
index c5643d8dd5..49bd0b0fbc 100644<br>
--- a/include/qemu/log.h<br>
+++ b/include/qemu/log.h<br>
@@ -35,6 +35,7 @@ bool qemu_log_separate(void);<br>
=C2=A0/* LOG_STRACE is used for user-mode strace logging. */<br>
=C2=A0#define LOG_STRACE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 19)<b=
r>
=C2=A0#define LOG_PER_THREAD=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 20)<br>
+#define CPU_LOG_TB_VU=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 21)<br>
<br>
=C2=A0/* Lock/unlock output. */<br>
<br>
diff --git a/util/log.c b/util/log.c<br>
index d6eb0378c3..775d122c2e 100644<br>
--- a/util/log.c<br>
+++ b/util/log.c<br>
@@ -441,6 +441,8 @@ const QEMULogItem qemu_log_items[] =3D {<br>
=C2=A0#ifdef CONFIG_PLUGIN<br>
=C2=A0 =C2=A0 =C2=A0{ CPU_LOG_PLUGIN, &quot;plugin&quot;, &quot;output from=
 TCG plugins\n&quot;},<br>
=C2=A0#endif<br>
+=C2=A0 =C2=A0 { CPU_LOG_TB_VU, &quot;vu&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;include vector unit registers in the &#39;cpu&#=
39; logging&quot; },<br>
=C2=A0 =C2=A0 =C2=A0{ LOG_STRACE, &quot;strace&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;log every user-mode syscall, its input, an=
d its result&quot; },<br>
=C2=A0 =C2=A0 =C2=A0{ LOG_PER_THREAD, &quot;tid&quot;,<br>
-- <br>
2.34.0<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt;=C2=A0</di=
v></div></div>

--000000000000e7c05905e38326ab--


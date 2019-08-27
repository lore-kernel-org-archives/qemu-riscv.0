Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2dg8-00010c-KV
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 11:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chihmin.chao@sifive.com>) id 1i2dg3-0000xc-1X
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:46:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1i2dg1-0003sX-8k
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:46:34 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:46081)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1i2dg1-0003s7-39
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:46:33 -0400
Received: by mail-io1-xd34.google.com with SMTP id x4so47250920iog.13
 for <qemu-riscv@nongnu.org>; Tue, 27 Aug 2019 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q2R1DiCbYnDpdIdAhfvngz7BvHBfQBnxrwDisd5sO3A=;
 b=nZYmXg1gMP0+b5uOCX1X9VHHHHS+DVjHQ1+zEw0j9cC25ixT4bbdc8R20Gv0XurJkS
 t7pyA1zw+9vsDUSfvOprGcZmrQAlXuUX+sv7dBG7ds7hBf6QCMV51729x/v3n91lxD35
 zPjUz0V6RGbQMLeHi92qTeoN2X/LjyYtlmOZJSIgjGOzIHO6jBZvdxm8vwYvSelxjnMP
 FFU9YAH7smnvTyR3ccRSJ9jPrdOVvc/ruhHplswsZEDWhR1pPP5JyL/jaGfK9LUrRRn6
 i/Vs5cWMIOYlff9FZne4kwNhVlCImF83IjcOruRgtp7cCPGuCISV4x286Dzb1PDGmEQ5
 7ZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q2R1DiCbYnDpdIdAhfvngz7BvHBfQBnxrwDisd5sO3A=;
 b=pHAOOuBAuwAoIh8i3IdNmJpIbez0UY2hnbwRu8MCCjjYGKwSDdwtv6ZFGFatDhlMPB
 NxPY0KQdNT5ZGsJX+UJDGdK24fXQU2QtSJizoFnF7BN/Ty0W+SWtzmgmxm//dElqnNi1
 ZufvU4+jykYXwE/fL2dzigxwKHNk+GAhEeqnyfXY6sNWr9GHEuNSSByapagMpUiYoSaC
 KMEYQp/xgvAsarD0Yn7TWiATG0jJlpolcyrhxUHcFrnvuOaWSiAAweHj8hnkWl52qDIc
 8aFQ9oaLxNSx8hDRea2lJnL7dCUEzZJqOu4zoxz8DEjrzJor/zKIPpPxpRO5eAS43gR5
 LyYQ==
X-Gm-Message-State: APjAAAU3q6KLpMYbYPmDNFzNslr67FOU8UqiU5oxTUWiwsesBDNpLBEM
 FpgKIIEO9KykVZqfMWUzsVXonHrZGPIPxZDfU6077w==
X-Google-Smtp-Source: APXvYqzKfwf4LiMpAoC/x2IJlpdXgrSW6gZfn23cN1hSSkXmjIk3NH9wZDRlUUhQTpfxgLob1tQjpKTz5qCWD1RteHg=
X-Received: by 2002:a02:cb51:: with SMTP id k17mr22947498jap.4.1566920792106; 
 Tue, 27 Aug 2019 08:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566603412.git.alistair.francis@wdc.com>
 <9db2403d223b3e6d2d20086176a975dffabb175b.1566603412.git.alistair.francis@wdc.com>
In-Reply-To: <9db2403d223b3e6d2d20086176a975dffabb175b.1566603412.git.alistair.francis@wdc.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Tue, 27 Aug 2019 23:46:21 +0800
Message-ID: <CAEiOBXWOFV6jv0HffF4QEtYRhBuNBt9qfTPN6kiN3Pm5uvH__Q@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Anup.Patel@wdc.com, 
 Palmer Dabbelt <palmer@sifive.com>, Atish.Patra@wdc.com
Content-Type: multipart/alternative; boundary="00000000000034816f05911b2d55"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d34
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 03/28] target/riscv: Add
 the force HS exception mode
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
X-List-Received-Date: Tue, 27 Aug 2019 15:46:36 -0000

--00000000000034816f05911b2d55
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 24, 2019 at 7:50 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  2 ++
>  target/riscv/cpu_bits.h   |  6 ++++++
>  target/riscv/cpu_helper.c | 23 +++++++++++++++++++++++
>  3 files changed, 31 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0ef1ecb0e0..3a95c41428 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -261,6 +261,8 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
>  bool riscv_cpu_virt_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
> +bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
> +void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 1fbde516be..204d9d9a79 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -428,6 +428,12 @@
>  #define VIRT_MODE_SHIFT     0
>  #define VIRT_MODE_MASK      (1 << VIRT_MODE_SHIFT)
>
> +/* HS-level exception modes */
> +#define CLEAR_HS_EXCEP        0
> +#define FORCE_HS_EXCEP        1
> +#define FORCE_HS_EXCEP_SHIFT  1
> +#define FORCE_HS_EXCEP_MASK   (1 << FORCE_HS_EXCEP_SHIFT)
> +
>  /* RV32 satp CSR field masks */
>  #define SATP32_MODE         0x80000000
>  #define SATP32_ASID         0x7fc00000
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 7b0bb14c01..5bcfc2e090 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -104,6 +104,29 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env,
> bool enable)
>      env->virt |= enable << VIRT_MODE_SHIFT;
>  }
>
> +bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
> +{
> +    bool tmp;
> +
> +    if (!riscv_has_ext(env, RVH)) {
> +        return false;
> +    }
> +
> +    tmp = (env->virt & FORCE_HS_EXCEP_MASK) >> FORCE_HS_EXCEP_SHIFT;
> +
> +    return tmp == FORCE_HS_EXCEP;
> +}
> +
> +void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable)
> +{
> +    if (!riscv_has_ext(env, RVH)) {
> +        return;
> +    }
> +
> +    env->virt &= ~FORCE_HS_EXCEP_MASK;
> +    env->virt |= enable << FORCE_HS_EXCEP_SHIFT;
> +}
> +
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
>  {
>      CPURISCVState *env = &cpu->env;
> --
> 2.22.0
>
>
> I have the same option as [PATCH 2/28].  Why not to use get_field and
set_field ?

chihmin

--00000000000034816f05911b2d55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 24, 2019 at 7:50 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">alistair.francis@wd=
c.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis=
@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
=C2=A0target/riscv/cpu_helper.c | 23 +++++++++++++++++++++++<br>
=C2=A03 files changed, 31 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 0ef1ecb0e0..3a95c41428 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -261,6 +261,8 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interru=
pt_request);<br>
=C2=A0bool riscv_cpu_fp_enabled(CPURISCVState *env);<br>
=C2=A0bool riscv_cpu_virt_enabled(CPURISCVState *env);<br>
=C2=A0void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);<br>
+bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);<br>
+void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);<br>
=C2=A0int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);<br>
=C2=A0hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0void=C2=A0 riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br=
>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index 1fbde516be..204d9d9a79 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -428,6 +428,12 @@<br>
=C2=A0#define VIRT_MODE_SHIFT=C2=A0 =C2=A0 =C2=A00<br>
=C2=A0#define VIRT_MODE_MASK=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; VIRT_MODE_SHIF=
T)<br>
<br>
+/* HS-level exception modes */<br>
+#define CLEAR_HS_EXCEP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
+#define FORCE_HS_EXCEP=C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
+#define FORCE_HS_EXCEP_SHIFT=C2=A0 1<br>
+#define FORCE_HS_EXCEP_MASK=C2=A0 =C2=A0(1 &lt;&lt; FORCE_HS_EXCEP_SHIFT)<=
br>
+<br>
=C2=A0/* RV32 satp CSR field masks */<br>
=C2=A0#define SATP32_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x80000000<br>
=C2=A0#define SATP32_ASID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x7fc00000<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 7b0bb14c01..5bcfc2e090 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -104,6 +104,29 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bo=
ol enable)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;virt |=3D enable &lt;&lt; VIRT_MODE_SHIFT;<br>
=C2=A0}<br>
<br>
+bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 bool tmp;<br>
+<br>
+=C2=A0 =C2=A0 if (!riscv_has_ext(env, RVH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 tmp =3D (env-&gt;virt &amp; FORCE_HS_EXCEP_MASK) &gt;&gt; FO=
RCE_HS_EXCEP_SHIFT;<br>
+<br>
+=C2=A0 =C2=A0 return tmp =3D=3D FORCE_HS_EXCEP;<br>
+}<br>
+<br>
+void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable)<br>
+{<br>
+=C2=A0 =C2=A0 if (!riscv_has_ext(env, RVH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 env-&gt;virt &amp;=3D ~FORCE_HS_EXCEP_MASK;<br>
+=C2=A0 =C2=A0 env-&gt;virt |=3D enable &lt;&lt; FORCE_HS_EXCEP_SHIFT;<br>
+}<br>
+<br>
=C2=A0int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
-- <br>
2.22.0<br>
<br>
<br></blockquote><div>I have the same option as [PATCH 2/28].=C2=A0 Why not=
 to use get_field and set_field ?</div><div><br></div><div>chihmin=C2=A0</d=
iv></div></div>

--00000000000034816f05911b2d55--


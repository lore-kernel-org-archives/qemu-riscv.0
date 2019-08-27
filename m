Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2deP-0007wS-5q
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 11:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54847)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chihmin.chao@sifive.com>) id 1i2deL-0007sD-Bc
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:44:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1i2deJ-0002hD-L0
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:44:49 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:44334)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1i2deJ-0002gx-Ei
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:44:47 -0400
Received: by mail-io1-xd43.google.com with SMTP id j4so39028403iog.11
 for <qemu-riscv@nongnu.org>; Tue, 27 Aug 2019 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UarSeKdjXeP1aEn4NbIhtQ+AJ2Bkzel/hw44s/Uvjb8=;
 b=Pbw28nsf1wDO2DEFCpbvd/AE6rM+HdspTqOrFKRGbaeui28q3al6z+W+1/dCRR8Aup
 4H2+i946vNFAmh0YmKzkVVAUXAliFkON67gdac7IjFrZotuFIcJOFBEqeNzAneJWgRej
 7tzp/3YwUNwlH3aEQEsTBbh9wKvMoOhJwhKGRjdjW+stbguAJqYXoGT4Mh6zkOZQ9TMz
 Q46NLkMnCAc/XJQwDKdVtiH4q2twitYb6O1Gom4KjqtkU9773z7/fQ2ZlVPEbBGgdKvh
 C0BjeiHlsifb537WoB9ziNCYoD1dKXBBFLY2yGBZ6UAO0boMwAE92vHDAMm6lmF4dt8z
 d3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UarSeKdjXeP1aEn4NbIhtQ+AJ2Bkzel/hw44s/Uvjb8=;
 b=TZHvG0WA+fCoJ2pQPWjIKkjjBlXGz5H6dCdOpq79muuEl6wKoH8T1hmhc0+WOroqy0
 pibCVWNYUVui7HdCrVDzUK8m8nlWGMFSrCnemBDrDZKFqIL/SjxxH2XUS1W7oY70rgDP
 5hepVkhQASt0uWgjZtYrpqZ1T+bLNQz1689RlJ181WoyodhVZbvJvw4q8krJ2+JIdX2p
 U+0Og+rOGXL4p9c0wesI0FRW3IHK1UhGcYdnoFsFz13lY5fjfP6sKZY6DIrhRez9xIAy
 7CE9yCbLf55YEUzB4aorOJY0lvd1BEJLry12vZpnXbpoKau75TKp/FtIA4+tP93HqlzB
 NEbQ==
X-Gm-Message-State: APjAAAVfSu07d3jEy2TE/hJrOSvK4sO5mJloyxid5EJdxpiwpN86QURp
 lcEApmzgtVf4rvj4fX9/RUqKiyfJWuOrYlqlY/myHQ==
X-Google-Smtp-Source: APXvYqxPZ3feSA3jyOqNui6ns2lLucOERcjLwPVojkTQUNRMPtAIpyvJwlEs+TNXNot2LToimQG+1mxq32yLnTBZi68=
X-Received: by 2002:a5e:a70b:: with SMTP id b11mr1302609iod.286.1566920686428; 
 Tue, 27 Aug 2019 08:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566603412.git.alistair.francis@wdc.com>
 <1c1d359caa6633349158debc38e07156a10b63e8.1566603412.git.alistair.francis@wdc.com>
In-Reply-To: <1c1d359caa6633349158debc38e07156a10b63e8.1566603412.git.alistair.francis@wdc.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Tue, 27 Aug 2019 23:44:35 +0800
Message-ID: <CAEiOBXUeKnPyZd7i5Aqw5+G2G9M-OeWxsBqTsF0MTV_abkDe5A@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Anup.Patel@wdc.com, 
 Palmer Dabbelt <palmer@sifive.com>, Atish.Patra@wdc.com
Content-Type: multipart/alternative; boundary="000000000000e7fb4a05911b26f2"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
Subject: Re: [Qemu-riscv] [PATCH v1 02/28] target/riscv: Add the
 virtulisation mode
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
X-List-Received-Date: Tue, 27 Aug 2019 15:44:52 -0000

--000000000000e7fb4a05911b26f2
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 24, 2019 at 7:41 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  4 ++++
>  target/riscv/cpu_bits.h   |  6 ++++++
>  target/riscv/cpu_helper.c | 23 +++++++++++++++++++++++
>  3 files changed, 33 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7f54fb8c87..0ef1ecb0e0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -117,6 +117,8 @@ struct CPURISCVState {
>
>  #ifndef CONFIG_USER_ONLY
>      target_ulong priv;
> +    /* This contains QEMU specific information about the virt state. */
> +    target_ulong virt;
>      target_ulong resetvec;
>
>      target_ulong mhartid;
> @@ -257,6 +259,8 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, uint8_t
> *buf, int reg);
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
> +bool riscv_cpu_virt_enabled(CPURISCVState *env);
> +void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index e99834856c..1fbde516be 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -422,6 +422,12 @@
>  #define PRV_H 2 /* Reserved */
>  #define PRV_M 3
>
> +/* Virtulisation modes */
> +#define VIRT_OFF            0
> +#define VIRT_ON             1
> +#define VIRT_MODE_SHIFT     0
> +#define VIRT_MODE_MASK      (1 << VIRT_MODE_SHIFT)
> +
>
 /* RV32 satp CSR field masks */
>  #define SATP32_MODE         0x80000000
>  #define SATP32_ASID         0x7fc00000
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 225e407cff..7b0bb14c01 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -81,6 +81,29 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
>      return false;
>  }
>
> +bool riscv_cpu_virt_enabled(CPURISCVState *env)
> +{
> +    bool tmp;
> +
> +    if (!riscv_has_ext(env, RVH)) {
> +        return false;
> +    }
> +
> +    tmp = (env->virt & VIRT_MODE_MASK) >> VIRT_MODE_SHIFT;
> +
> +    return tmp == VIRT_ON;
> +}
> +
> +void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
> +{
> +    if (!riscv_has_ext(env, RVH)) {
> +        return;
> +    }
> +
> +    env->virt &= ~VIRT_MODE_MASK;
> +    env->virt |= enable << VIRT_MODE_SHIFT;
> +}
> +
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
>  {
>      CPURISCVState *env = &cpu->env;
> --
> 2.22.0
>
> Why not to use get_field and set_field though it is not a real register
but an internal state

#define VIRT_ONOFF            0x01
#define VIRT_OFF             0
#define VIRT_ON             1

access
       get_field(env->virt, VIRT_ONOFF);
       set_field(env->virt, VIRT_ONOFF, enable);


chihmin

--000000000000e7fb4a05911b26f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 24, 2019 at 7:41 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">alistair.franci=
s@wdc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.f=
rancis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
=C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
=C2=A0target/riscv/cpu_helper.c | 23 +++++++++++++++++++++++<br>
=C2=A03 files changed, 33 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 7f54fb8c87..0ef1ecb0e0 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -117,6 +117,8 @@ struct CPURISCVState {<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0target_ulong priv;<br>
+=C2=A0 =C2=A0 /* This contains QEMU specific information about the virt st=
ate. */<br>
+=C2=A0 =C2=A0 target_ulong virt;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong resetvec;<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mhartid;<br>
@@ -257,6 +259,8 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, uint8_t =
*buf, int reg);<br>
=C2=A0int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg=
);<br>
=C2=A0bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);<b=
r>
=C2=A0bool riscv_cpu_fp_enabled(CPURISCVState *env);<br>
+bool riscv_cpu_virt_enabled(CPURISCVState *env);<br>
+void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);<br>
=C2=A0int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);<br>
=C2=A0hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0void=C2=A0 riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br=
>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index e99834856c..1fbde516be 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -422,6 +422,12 @@<br>
=C2=A0#define PRV_H 2 /* Reserved */<br>
=C2=A0#define PRV_M 3<br>
<br>
+/* Virtulisation modes */<br>
+#define VIRT_OFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
+#define VIRT_ON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
+#define VIRT_MODE_SHIFT=C2=A0 =C2=A0 =C2=A00<br>
+#define VIRT_MODE_MASK=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; VIRT_MODE_SHIFT)<br=
>
+<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0/=
* RV32 satp CSR field masks */<br>
=C2=A0#define SATP32_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x80000000<br>
=C2=A0#define SATP32_ASID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x7fc00000<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 225e407cff..7b0bb14c01 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -81,6 +81,29 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
+bool riscv_cpu_virt_enabled(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 bool tmp;<br>
+<br>
+=C2=A0 =C2=A0 if (!riscv_has_ext(env, RVH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 tmp =3D (env-&gt;virt &amp; VIRT_MODE_MASK) &gt;&gt; VIRT_MO=
DE_SHIFT;<br>
+<br>
+=C2=A0 =C2=A0 return tmp =3D=3D VIRT_ON;<br>
+}<br>
+<br>
+void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)<br>
+{<br>
+=C2=A0 =C2=A0 if (!riscv_has_ext(env, RVH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 env-&gt;virt &amp;=3D ~VIRT_MODE_MASK;<br>
+=C2=A0 =C2=A0 env-&gt;virt |=3D enable &lt;&lt; VIRT_MODE_SHIFT;<br>
+}<br>
+<br>
=C2=A0int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
-- <br>
2.22.0<br>
<br></blockquote><div>Why not to use get_field and set_field though it is n=
ot a real register but an internal state</div><div><br></div><div>#define V=
IRT_ONOFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01</div><div>#define V=
IRT_OFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>#define VIRT_ON=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br></div><div><br></div><=
div>access</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0get_field(env-&gt;virt, VIR=
T_ONOFF);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0set_field(env-&gt;virt, VIRT=
_ONOFF, enable);</div><div><br></div><div><br></div><div>chihmin</div></div=
></div>

--000000000000e7fb4a05911b26f2--


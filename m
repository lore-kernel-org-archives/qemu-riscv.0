Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1od5yW-0004H1-DO
	for mharc-qemu-riscv@gnu.org; Tue, 27 Sep 2022 04:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1od5yQ-0004AB-T6
 for qemu-riscv@nongnu.org; Tue, 27 Sep 2022 04:29:50 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:35769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1od5yL-0001pd-W2
 for qemu-riscv@nongnu.org; Tue, 27 Sep 2022 04:29:47 -0400
Received: by mail-lj1-x22f.google.com with SMTP id x29so10132949ljq.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Sep 2022 01:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Rmad2rYfZ5IW7fBzajyAFegdmVvGYsEWjisBPHInPuU=;
 b=Mi/5Xn2HhI3ATwYOIrlIiqYNTvc0r9p+v2mxeIIjX8L+tMaAwGdH5HBkAtUOk3uX/V
 ED+2QZrIgdq01mDim8ddssWjDNFkS5VDGP02usHuQZxQ2O9mfyYdW+E0tsifLvrHvAfC
 xu8kF0SDDW1U5PyWxO5F9gcduB6XK3QqgFJKLuM/riac83VS/couJgG2HZFP5ykCk6MO
 /J7uxLxh8/n4acCER8e4/NqGoiVvNhjw+GlJnTiK/LHq/SImC46doQsM5JQkRxc8ra3V
 S5hZhmjePyyL83TzZU5mPYU27WgK/QecZdwgyh3IrEwuX/7nSwrYFm6sH0xaLGB9qcof
 jEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Rmad2rYfZ5IW7fBzajyAFegdmVvGYsEWjisBPHInPuU=;
 b=yGye8Hb/b9qkTFwwKVksLe3gzT7ur3GSPlNue2TguNRf2dt4KnbuwMNlPvl635mVFW
 cMYiF9SfjsCcYOjS2RLrCXbUJfPr7Mqs5IvEAv9q8UIvg+im7IsNeCUZF4zrM8Ia7YIq
 4y+P2e+i55LDc1F4wXzUCBTlKdqrXxQf1mGmT6KBfxGip5FX0IZBVARa2ykJfax3IbZW
 3blCl4dkCYUPwVztB7pqMkO0YfMscloWXuvhChAzX1BhcVWWSaNHTxMwWmUru70YF0cz
 2kWCce3HTPGNNa2F+XGCZKQznsITN147auSYjUwjPtPWasqOaDmo69Xt5wPhVKJISi5m
 4xsA==
X-Gm-Message-State: ACrzQf1IP9MVXHulakjBWqUsKtBxzqnarMQzr992VyBp5/uNCvKUwj9S
 H1y6RgTCypUmwPKnnZXmU2b+jtXxT3BbQC6hx4iwHajnNIwlk9i6q4NQXvyCgAzZI2CQghAaMwG
 Y+w4EEIcfdJRfGwuEZT/2Z8KKp6l1AmVqwLUjVE86xP3yAAbeLbeMwFIN3xxUg5amrQaopBtox6
 U=
X-Google-Smtp-Source: AMsMyM6QuPNn7p0WQmtvLVXq4pvEeDPjjfGEg+5I+YHez3qvBrp2vvjxeYBxxo+HXMTlTBXaTYvXYA==
X-Received: by 2002:a2e:b61c:0:b0:26c:c17:feeb with SMTP id
 r28-20020a2eb61c000000b0026c0c17feebmr9548739ljn.199.1664267383139; 
 Tue, 27 Sep 2022 01:29:43 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 u28-20020a2eb81c000000b0026bf27c7056sm90960ljo.67.2022.09.27.01.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 01:29:42 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id o2so14557063lfc.10;
 Tue, 27 Sep 2022 01:29:42 -0700 (PDT)
X-Received: by 2002:a05:6512:3d94:b0:49d:144c:9667 with SMTP id
 k20-20020a0565123d9400b0049d144c9667mr10787427lfv.50.1664267381646; Tue, 27
 Sep 2022 01:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220914101108.82571-1-alistair.francis@wdc.com>
 <20220914101108.82571-2-alistair.francis@wdc.com>
In-Reply-To: <20220914101108.82571-2-alistair.francis@wdc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 27 Sep 2022 16:29:30 +0800
X-Gmail-Original-Message-ID: <CANzO1D2Hh9ipmReXrbssWeg=mgZbMnXOu+2GNTWy+cEDQKEJRg@mail.gmail.com>
Message-ID: <CANzO1D2Hh9ipmReXrbssWeg=mgZbMnXOu+2GNTWy+cEDQKEJRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Set the CPU resetvec directly
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 bmeng.cn@gmail.com, alistair23@gmail.com
Content-Type: multipart/alternative; boundary="000000000000182c5805e9a4722d"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=frank.chang@sifive.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 27 Sep 2022 08:29:51 -0000

--000000000000182c5805e9a4722d
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Wed, Sep 14, 2022 at 6:12 PM Alistair Francis via <qemu-riscv@nongnu.org>
wrote:

> Instead of using our properties to set a config value which then might
> be used to set the resetvec (depending on your timing), let's instead
> just set the resetvec directly in the env struct.
>
> This allows us to set the reset vec from the command line with:
>     -global driver=riscv.hart_array,property=resetvec,value=0x20000400
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h     |  3 +--
>  target/riscv/cpu.c     | 13 +++----------
>  target/riscv/machine.c |  6 +++---
>  3 files changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 06751e1e3e..22344a620b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -190,7 +190,7 @@ struct CPUArchState {
>      /* This contains QEMU specific information about the virt state. */
>      target_ulong virt;
>      target_ulong geilen;
> -    target_ulong resetvec;
> +    uint64_t resetvec;
>
>      target_ulong mhartid;
>      /*
> @@ -474,7 +474,6 @@ struct RISCVCPUConfig {
>      bool pmp;
>      bool epmp;
>      bool debug;
> -    uint64_t resetvec;
>
>      bool short_isa_string;
>  };
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index aee14a239a..b29c88b9f0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -228,13 +228,6 @@ static void set_vext_version(CPURISCVState *env, int
> vext_ver)
>      env->vext_ver = vext_ver;
>  }
>
> -static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
> -{
> -#ifndef CONFIG_USER_ONLY
> -    env->resetvec = resetvec;
> -#endif
> -}
> -
>  static void riscv_any_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -336,7 +329,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> -    set_resetvec(env, DEFAULT_RSTVEC);
>      cpu->cfg.mmu = false;
>  }
>  #endif
> @@ -676,7 +668,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error
> **errp)
>          riscv_set_feature(env, RISCV_FEATURE_DEBUG);
>      }
>
> -    set_resetvec(env, cpu->cfg.resetvec);
>
>  #ifndef CONFIG_USER_ONLY
>      if (cpu->cfg.ext_sstc) {
> @@ -1079,7 +1070,9 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid,
> RISCV_CPU_MARCHID),
>      DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
>
> -    DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec,
> DEFAULT_RSTVEC),
> +#ifndef CONFIG_USER_ONLY
> +    DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec,
> DEFAULT_RSTVEC),
> +#endif
>
>      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string,
> false),
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 41098f6ad0..c4e6b3bba4 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -308,8 +308,8 @@ static const VMStateDescription vmstate_pmu_ctr_state
> = {
>
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
> -    .version_id = 4,
> -    .minimum_version_id = 4,
> +    .version_id = 5,
> +    .minimum_version_id = 5,
>      .post_load = riscv_cpu_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> @@ -331,7 +331,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINT32(env.features, RISCVCPU),
>          VMSTATE_UINTTL(env.priv, RISCVCPU),
>          VMSTATE_UINTTL(env.virt, RISCVCPU),
> -        VMSTATE_UINTTL(env.resetvec, RISCVCPU),
> +        VMSTATE_UINT64(env.resetvec, RISCVCPU),
>          VMSTATE_UINTTL(env.mhartid, RISCVCPU),
>          VMSTATE_UINT64(env.mstatus, RISCVCPU),
>          VMSTATE_UINT64(env.mip, RISCVCPU),
> --
> 2.37.2
>
>
>

--000000000000182c5805e9a4722d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 14, 2022 at 6:12 PM =
Alistair Francis via &lt;<a href=3D"mailto:qemu-riscv@nongnu.org">qemu-risc=
v@nongnu.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Instead of using our properties to set a config value which the=
n might<br>
be used to set the resetvec (depending on your timing), let&#39;s instead<b=
r>
just set the resetvec directly in the env struct.<br>
<br>
This allows us to set the reset vec from the command line with:<br>
=C2=A0 =C2=A0 -global driver=3Driscv.hart_array,property=3Dresetvec,value=
=3D0x20000400<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +--<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0| 13 +++----------<br>
=C2=A0target/riscv/machine.c |=C2=A0 6 +++---<br>
=C2=A03 files changed, 7 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 06751e1e3e..22344a620b 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -190,7 +190,7 @@ struct CPUArchState {<br>
=C2=A0 =C2=A0 =C2=A0/* This contains QEMU specific information about the vi=
rt state. */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong virt;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong geilen;<br>
-=C2=A0 =C2=A0 target_ulong resetvec;<br>
+=C2=A0 =C2=A0 uint64_t resetvec;<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mhartid;<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
@@ -474,7 +474,6 @@ struct RISCVCPUConfig {<br>
=C2=A0 =C2=A0 =C2=A0bool pmp;<br>
=C2=A0 =C2=A0 =C2=A0bool epmp;<br>
=C2=A0 =C2=A0 =C2=A0bool debug;<br>
-=C2=A0 =C2=A0 uint64_t resetvec;<br>
<br>
=C2=A0 =C2=A0 =C2=A0bool short_isa_string;<br>
=C2=A0};<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index aee14a239a..b29c88b9f0 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -228,13 +228,6 @@ static void set_vext_version(CPURISCVState *env, int v=
ext_ver)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;vext_ver =3D vext_ver;<br>
=C2=A0}<br>
<br>
-static void set_resetvec(CPURISCVState *env, target_ulong resetvec)<br>
-{<br>
-#ifndef CONFIG_USER_ONLY<br>
-=C2=A0 =C2=A0 env-&gt;resetvec =3D resetvec;<br>
-#endif<br>
-}<br>
-<br>
=C2=A0static void riscv_any_cpu_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
@@ -336,7 +329,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)<br>
<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | R=
VU);<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_10_0);<br>
-=C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.mmu =3D false;<br>
=C2=A0}<br>
=C2=A0#endif<br>
@@ -676,7 +668,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_set_feature(env, RISCV_FEATURE_DEBU=
G);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 set_resetvec(env, cpu-&gt;cfg.resetvec);<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.ext_sstc) {<br>
@@ -1079,7 +1070,9 @@ static Property riscv_cpu_properties[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT64(&quot;marchid&quot;, RISCVCPU, cfg.m=
archid, RISCV_CPU_MARCHID),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT64(&quot;mimpid&quot;, RISCVCPU, cfg.mi=
mpid, RISCV_CPU_MIMPID),<br>
<br>
-=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;resetvec&quot;, RISCVCPU, cfg.reset=
vec, DEFAULT_RSTVEC),<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;resetvec&quot;, RISCVCPU, env.reset=
vec, DEFAULT_RSTVEC),<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;short-isa-string&quot;, RISCVCPU=
, cfg.short_isa_string, false),<br>
<br>
diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
index 41098f6ad0..c4e6b3bba4 100644<br>
--- a/target/riscv/machine.c<br>
+++ b/target/riscv/machine.c<br>
@@ -308,8 +308,8 @@ static const VMStateDescription vmstate_pmu_ctr_state =
=3D {<br>
<br>
=C2=A0const VMStateDescription vmstate_riscv_cpu =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;cpu&quot;,<br>
-=C2=A0 =C2=A0 .version_id =3D 4,<br>
-=C2=A0 =C2=A0 .minimum_version_id =3D 4,<br>
+=C2=A0 =C2=A0 .version_id =3D 5,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 5,<br>
=C2=A0 =C2=A0 =C2=A0.post_load =3D riscv_cpu_post_load,<br>
=C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 3=
2),<br>
@@ -331,7 +331,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT32(env.features, RISCVCPU),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.priv, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.virt, RISCVCPU),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.resetvec, RISCVCPU),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.resetvec, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mhartid, RISCVCPU),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.mstatus, RISCVCPU),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.mip, RISCVCPU),<br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div>

--000000000000182c5805e9a4722d--


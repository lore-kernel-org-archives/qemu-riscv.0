Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pV8Nd-0005pR-77
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 04:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pV8Nc-0005p1-2p
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 04:59:12 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pV8NZ-0000wQ-JX
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 04:59:11 -0500
Received: by mail-lf1-x12d.google.com with SMTP id i9so12947138lfc.6
 for <qemu-riscv@nongnu.org>; Thu, 23 Feb 2023 01:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S6hkfktMN3YJ4JwzsOfKiZhjOI0Us65ewusf5lHD5+8=;
 b=K5fmr62zCs9t3Nt2Y9CwF8Iu4vPp+oDfj/tg/CUpJycZrrrfYJfx3URjY1xEgU5FKv
 UEthnnTQJJ9Ajh4T+g8xkk/rA6ztTR7mJqqO9qjBWPu2nFUc/3KpAieimS19MGedq7s9
 WLZX/t+D8h56lk+Nh479+pspRo+UbUKQekhumUy7MBCtXAT6jb+qUiN1Z62u5/fYSD2A
 0SY/yZQ7VWd5rq6yzlYf8e0UNQf/yOJwNCvp8BUrLrmJH01Atznbw/MyoaxK0Sc+/Mz+
 4R7l0mKqKvomMqB45rjygdsBlrYbnq3xDE+ukPu0Jsa/eD2lkaIhORinj9fao5GLkOZk
 oYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S6hkfktMN3YJ4JwzsOfKiZhjOI0Us65ewusf5lHD5+8=;
 b=P8vhWqroBBVmCJpDI/X43PbC7tYrTkM9PfmEiwI4Itmu8XPkUNPMhOhArMpP/cwfKO
 nt9zVzlLZ9KdUdzGp3Zvcd3eEBbBQIRkfrG1l72utHW1sgkB1nVfRMbMH+pZbrroas8V
 Kd/xr4t1z6tsvTbFx3YU4bMKjK78mZWSUg65kU7jQIhdunxoajK8erq0VtQuH4wQn8UP
 9rzRF9FU9EPPztNZNea5i0QhYzQ3JLtzvk89nKhKyDAl0ZlNPlzALegSj7KkX5xyl5l7
 oE4Dp15SwozadIqOXlsZQtq97o069Nk1d8VOgZnDAWs57ft4sRxzyxmsIiOyl+nTuYSn
 Tdrg==
X-Gm-Message-State: AO0yUKVB+IeP4iC/MNuWXILozppiXLp0TBQ3Pm7HtagpOgZKzIlfKzv+
 ZPJt2u0KzGvHcf+WQNebxo3VLQ4QPVMuT1K+
X-Google-Smtp-Source: AK7set+6iCfJNfiuaPg+ydYiGgY/VOlBrU5pDZCjRWJUmTrOyNEa4uF3ltl/5xNlWMIo73/2WKnflQ==
X-Received: by 2002:a05:6512:102c:b0:4dd:9ddc:4465 with SMTP id
 r12-20020a056512102c00b004dd9ddc4465mr1879492lfr.55.1677146347135; 
 Thu, 23 Feb 2023 01:59:07 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54]) by smtp.gmail.com with ESMTPSA id
 m6-20020ac24ac6000000b004db0a7ce483sm283907lfp.162.2023.02.23.01.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 01:59:06 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id g17so388761lfv.4;
 Thu, 23 Feb 2023 01:59:06 -0800 (PST)
X-Received: by 2002:ac2:46fb:0:b0:4dd:a4c5:2b43 with SMTP id
 q27-20020ac246fb000000b004dda4c52b43mr217355lfo.9.1677146346055; Thu, 23 Feb
 2023 01:59:06 -0800 (PST)
MIME-Version: 1.0
References: <20230221184525.140704-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230221184525.140704-1-dbarboza@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 23 Feb 2023 17:58:54 +0800
X-Gmail-Original-Message-ID: <CANzO1D1yDBETrKf_9ap-r7=fEgVLs+dB9asnxtUhToxBY6Wf1Q@mail.gmail.com>
Message-ID: <CANzO1D1yDBETrKf_9ap-r7=fEgVLs+dB9asnxtUhToxBY6Wf1Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/vector_helper.c: create
 vext_set_tail_elems_1s()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: multipart/alternative; boundary="000000000000316d6d05f55b10c3"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x12d.google.com
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
X-List-Received-Date: Thu, 23 Feb 2023 09:59:12 -0000

--000000000000316d6d05f55b10c3
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Wed, Feb 22, 2023 at 2:46 AM Daniel Henrique Barboza <
dbarboza@ventanamicro.com> wrote:

> Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
> load / store instructions") added code to set the tail elements to 1 in
> the end of vext_ldst_stride(), vext_ldst_us(), vext_ldst_index() and
> vext_ldff(). Aside from a env->vl versus an evl value being used in the
> first loop, the code is being repeated 4 times.
>
> Create a helper to avoid code repetition in all those functions.
> Arguments that are used in the callers (nf, esz and max_elems) are
> passed as arguments. All other values are being derived inside the
> helper.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/vector_helper.c | 86 +++++++++++++-----------------------
>  1 file changed, 30 insertions(+), 56 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 00de879787..7d2e3978f1 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -267,6 +267,28 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
>  GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
>  GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
>
> +static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
> +                                   void *vd, uint32_t desc, uint32_t nf,
> +                                   uint32_t esz, uint32_t max_elems)
> +{
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +    uint32_t vta = vext_vta(desc);
> +    uint32_t registers_used;
> +    int k;
> +
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +
> +    if (nf * max_elems % total_elems != 0) {
> +        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }
> +}
> +
>  /*
>   *** stride: access vector element from strided memory
>   */
> @@ -281,8 +303,6 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>      uint32_t nf = vext_nf(desc);
>      uint32_t max_elems = vext_max_elems(desc, log2_esz);
>      uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>      uint32_t vma = vext_vma(desc);
>
>      for (i = env->vstart; i < env->vl; i++, env->vstart++) {
> @@ -301,18 +321,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong
> base,
>          }
>      }
>      env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
>  }
>
>  #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
> @@ -359,8 +369,6 @@ vext_ldst_us(void *vd, target_ulong base,
> CPURISCVState *env, uint32_t desc,
>      uint32_t nf = vext_nf(desc);
>      uint32_t max_elems = vext_max_elems(desc, log2_esz);
>      uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>
>      /* load bytes from guest memory */
>      for (i = env->vstart; i < evl; i++, env->vstart++) {
> @@ -372,18 +380,8 @@ vext_ldst_us(void *vd, target_ulong base,
> CPURISCVState *env, uint32_t desc,
>          }
>      }
>      env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + evl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
>  }
>
>  /*
> @@ -484,8 +482,6 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>      uint32_t vm = vext_vm(desc);
>      uint32_t max_elems = vext_max_elems(desc, log2_esz);
>      uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>      uint32_t vma = vext_vma(desc);
>
>      /* load bytes from guest memory */
> @@ -505,18 +501,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>          }
>      }
>      env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
>  }
>
>  #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)
>   \
> @@ -585,8 +571,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>      uint32_t vm = vext_vm(desc);
>      uint32_t max_elems = vext_max_elems(desc, log2_esz);
>      uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>      uint32_t vma = vext_vma(desc);
>      target_ulong addr, offset, remain;
>
> @@ -647,18 +631,8 @@ ProbeSuccess:
>          }
>      }
>      env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
>  }
>
>  #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
> --
> 2.39.2
>
>
>

--000000000000316d6d05f55b10c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 22, 2023 at 2:46 AM =
Daniel Henrique Barboza &lt;<a href=3D"mailto:dbarboza@ventanamicro.com">db=
arboza@ventanamicro.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Commit 752614cab8e6 (&quot;target/riscv: rvv: Add ta=
il agnostic for vector<br>
load / store instructions&quot;) added code to set the tail elements to 1 i=
n<br>
the end of vext_ldst_stride(), vext_ldst_us(), vext_ldst_index() and<br>
vext_ldff(). Aside from a env-&gt;vl versus an evl value being used in the<=
br>
first loop, the code is being repeated 4 times.<br>
<br>
Create a helper to avoid code repetition in all those functions.<br>
Arguments that are used in the callers (nf, esz and max_elems) are<br>
passed as arguments. All other values are being derived inside the<br>
helper.<br>
<br>
Signed-off-by: Daniel Henrique Barboza &lt;<a href=3D"mailto:dbarboza@venta=
namicro.com" target=3D"_blank">dbarboza@ventanamicro.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/vector_helper.c | 86 +++++++++++++----------------------=
-<br>
=C2=A01 file changed, 30 insertions(+), 56 deletions(-)<br>
<br>
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c<br=
>
index 00de879787..7d2e3978f1 100644<br>
--- a/target/riscv/vector_helper.c<br>
+++ b/target/riscv/vector_helper.c<br>
@@ -267,6 +267,28 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)<br>
=C2=A0GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)<br>
=C2=A0GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)<br>
<br>
+static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *vd, uint32_t desc=
, uint32_t nf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t esz, uint32_t =
max_elems)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t total_elems =3D vext_get_total_elems(env, desc, esz=
);<br>
+=C2=A0 =C2=A0 uint32_t vlenb =3D env_archcpu(env)-&gt;cfg.vlen &gt;&gt; 3;=
<br>
+=C2=A0 =C2=A0 uint32_t vta =3D vext_vta(desc);<br>
+=C2=A0 =C2=A0 uint32_t registers_used;<br>
+=C2=A0 =C2=A0 int k;<br>
+<br>
+=C2=A0 =C2=A0 for (k =3D 0; k &lt; nf; ++k) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, (k * max_elems + vl=
) * esz,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (k * max_elems + max_elems) * esz);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (nf * max_elems % total_elems !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 registers_used =3D ((nf * max_elems) * esz + (=
vlenb - 1)) / vlenb;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, (nf * max_elems) * =
esz,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 registers_used * vlenb);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0/*<br>
=C2=A0 *** stride: access vector element from strided memory<br>
=C2=A0 */<br>
@@ -281,8 +303,6 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,=
<br>
=C2=A0 =C2=A0 =C2=A0uint32_t nf =3D vext_nf(desc);<br>
=C2=A0 =C2=A0 =C2=A0uint32_t max_elems =3D vext_max_elems(desc, log2_esz);<=
br>
=C2=A0 =C2=A0 =C2=A0uint32_t esz =3D 1 &lt;&lt; log2_esz;<br>
-=C2=A0 =C2=A0 uint32_t total_elems =3D vext_get_total_elems(env, desc, esz=
);<br>
-=C2=A0 =C2=A0 uint32_t vta =3D vext_vta(desc);<br>
=C2=A0 =C2=A0 =C2=A0uint32_t vma =3D vext_vma(desc);<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D env-&gt;vstart; i &lt; env-&gt;vl; i++, env-=
&gt;vstart++) {<br>
@@ -301,18 +321,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;vstart =3D 0;<br>
-=C2=A0 =C2=A0 /* set tail elements to 1s */<br>
-=C2=A0 =C2=A0 for (k =3D 0; k &lt; nf; ++k) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, (k * max_elems + en=
v-&gt;vl) * esz,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (k * max_elems + max_elems) * esz);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (nf * max_elems % total_elems !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t vlenb =3D env_archcpu(env)-&gt;cfg.vl=
en &gt;&gt; 3;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t registers_used =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((nf * max_elems) * esz + (vlenb=
 - 1)) / vlenb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, (nf * max_elems) * =
esz,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 registers_used * vlenb);<br>
-=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 vext_set_tail_elems_1s(env, env-&gt;vl, vd, desc, nf, esz, m=
ax_elems);<br>
=C2=A0}<br>
<br>
=C2=A0#define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
@@ -359,8 +369,6 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState=
 *env, uint32_t desc,<br>
=C2=A0 =C2=A0 =C2=A0uint32_t nf =3D vext_nf(desc);<br>
=C2=A0 =C2=A0 =C2=A0uint32_t max_elems =3D vext_max_elems(desc, log2_esz);<=
br>
=C2=A0 =C2=A0 =C2=A0uint32_t esz =3D 1 &lt;&lt; log2_esz;<br>
-=C2=A0 =C2=A0 uint32_t total_elems =3D vext_get_total_elems(env, desc, esz=
);<br>
-=C2=A0 =C2=A0 uint32_t vta =3D vext_vta(desc);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* load bytes from guest memory */<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D env-&gt;vstart; i &lt; evl; i++, env-&gt;vst=
art++) {<br>
@@ -372,18 +380,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVStat=
e *env, uint32_t desc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;vstart =3D 0;<br>
-=C2=A0 =C2=A0 /* set tail elements to 1s */<br>
-=C2=A0 =C2=A0 for (k =3D 0; k &lt; nf; ++k) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, (k * max_elems + ev=
l) * esz,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (k * max_elems + max_elems) * esz);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (nf * max_elems % total_elems !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t vlenb =3D env_archcpu(env)-&gt;cfg.vl=
en &gt;&gt; 3;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t registers_used =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((nf * max_elems) * esz + (vlenb=
 - 1)) / vlenb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, (nf * max_elems) * =
esz,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 registers_used * vlenb);<br>
-=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elem=
s);<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
@@ -484,8 +482,6 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,<=
br>
=C2=A0 =C2=A0 =C2=A0uint32_t vm =3D vext_vm(desc);<br>
=C2=A0 =C2=A0 =C2=A0uint32_t max_elems =3D vext_max_elems(desc, log2_esz);<=
br>
=C2=A0 =C2=A0 =C2=A0uint32_t esz =3D 1 &lt;&lt; log2_esz;<br>
-=C2=A0 =C2=A0 uint32_t total_elems =3D vext_get_total_elems(env, desc, esz=
);<br>
-=C2=A0 =C2=A0 uint32_t vta =3D vext_vta(desc);<br>
=C2=A0 =C2=A0 =C2=A0uint32_t vma =3D vext_vma(desc);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* load bytes from guest memory */<br>
@@ -505,18 +501,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;vstart =3D 0;<br>
-=C2=A0 =C2=A0 /* set tail elements to 1s */<br>
-=C2=A0 =C2=A0 for (k =3D 0; k &lt; nf; ++k) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, (k * max_elems + en=
v-&gt;vl) * esz,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (k * max_elems + max_elems) * esz);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (nf * max_elems % total_elems !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t vlenb =3D env_archcpu(env)-&gt;cfg.vl=
en &gt;&gt; 3;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t registers_used =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((nf * max_elems) * esz + (vlenb=
 - 1)) / vlenb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, (nf * max_elems) * =
esz,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 registers_used * vlenb);<br>
-=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 vext_set_tail_elems_1s(env, env-&gt;vl, vd, desc, nf, esz, m=
ax_elems);<br>
=C2=A0}<br>
<br>
=C2=A0#define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
@@ -585,8 +571,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,<br>
=C2=A0 =C2=A0 =C2=A0uint32_t vm =3D vext_vm(desc);<br>
=C2=A0 =C2=A0 =C2=A0uint32_t max_elems =3D vext_max_elems(desc, log2_esz);<=
br>
=C2=A0 =C2=A0 =C2=A0uint32_t esz =3D 1 &lt;&lt; log2_esz;<br>
-=C2=A0 =C2=A0 uint32_t total_elems =3D vext_get_total_elems(env, desc, esz=
);<br>
-=C2=A0 =C2=A0 uint32_t vta =3D vext_vta(desc);<br>
=C2=A0 =C2=A0 =C2=A0uint32_t vma =3D vext_vma(desc);<br>
=C2=A0 =C2=A0 =C2=A0target_ulong addr, offset, remain;<br>
<br>
@@ -647,18 +631,8 @@ ProbeSuccess:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;vstart =3D 0;<br>
-=C2=A0 =C2=A0 /* set tail elements to 1s */<br>
-=C2=A0 =C2=A0 for (k =3D 0; k &lt; nf; ++k) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, (k * max_elems + en=
v-&gt;vl) * esz,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (k * max_elems + max_elems) * esz);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (nf * max_elems % total_elems !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t vlenb =3D env_archcpu(env)-&gt;cfg.vl=
en &gt;&gt; 3;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t registers_used =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((nf * max_elems) * esz + (vlenb=
 - 1)) / vlenb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_set_elems_1s(vd, vta, (nf * max_elems) * =
esz,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 registers_used * vlenb);<br>
-=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 vext_set_tail_elems_1s(env, env-&gt;vl, vd, desc, nf, esz, m=
ax_elems);<br>
=C2=A0}<br>
<br>
=C2=A0#define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-- <br>
2.39.2<br>
<br>
<br>
</blockquote></div>

--000000000000316d6d05f55b10c3--


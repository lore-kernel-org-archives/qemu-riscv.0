Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHQHz-0004is-FN
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 09:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pHQHx-0004hL-2z
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 09:16:41 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pHQHu-00039C-U0
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 09:16:40 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 j16-20020a056830271000b0067202045ee9so16158514otu.7
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 06:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DV6K6KLAZAipc9UYlBVoUJDFDYAL2NRXErbsZgagRuQ=;
 b=LqcCuY2JVdUGxa4Vgn43PYC6lDFV/ZfJe9W9fT8CNRZ+Vot75kTft1dv2MKG9ry6+d
 DnuYgH0mL3H3yVaBOPal/FapOFGF0Ee1Hao+G3X0BYyQiGv78l0fTJ8xxnNEqCIxUmDd
 9yvI29xPx9b8lSZq94gkXBFuOWFJPcH5LnMBcmTUBUKNRp3Yvi/8sagvzyhssDnxORYd
 L99MHcAvutB9Tg3d4sA7rh4qAFJX5jOQH1WcHQBgO4PEKSsbB7rDjsiqgQzMUFjaomPz
 hA1B8efFxZYFQ4U1BnNCcNHttONr2zxrVr09kGU2FeqGm3v2oXU4migwM3UNXX3vyHRk
 8+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DV6K6KLAZAipc9UYlBVoUJDFDYAL2NRXErbsZgagRuQ=;
 b=XVhKUkOZyIyZrPIUjFKH1RFubXNU+6jgum7QKXdtBsWemSLzH0G+NNlwyjpWnfRXVw
 oLzmG5YACzcT6iPFqZRuOyD1aoCAAPrEHhP81qLVWA1bnM1qWRkDvE+xnRjPgeWn9/45
 xULwHdbMX1UL1YCNu/ytAyx7ZyPL0aiefyQ104gowH/lOU/jaGwVP/VnbflNvjkykZUY
 xBXYdkck5FKUtXq3WeMSrMDVBwjws6A3kkgN3YcheXTa+bOKNwbwb/W5utP/MBHowVJk
 EhG/iTh0bMUrN/Ye/0TdxN//kP84dtiBV0TBNRSg8oFyXlYV9b2uYV3xZernhnEvp9xP
 cRfw==
X-Gm-Message-State: AFqh2kpwfeJAXi+qMa6vuTLuX87A7tJvV/jE6NzbGrhA0jn5BXJvXx+K
 Iios+nPQnrCerd5fpVZ4u4cjwBmW/FHQATnsG+NtkA==
X-Google-Smtp-Source: AMrXdXsKO7LQ4/vi8u8TjSDuXjSdNoNLsULjwFvijI2hSXBuWs++pzRkU8yA9U7I46zKKIViAYPi7CZd5RskRKpQOnE=
X-Received: by 2002:a9d:6e0c:0:b0:677:b13d:ec4b with SMTP id
 e12-20020a9d6e0c000000b00677b13dec4bmr5648557otr.181.1673878597055; Mon, 16
 Jan 2023 06:16:37 -0800 (PST)
MIME-Version: 1.0
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-2-alexghiti@rivosinc.com>
In-Reply-To: <20230113103453.42776-2-alexghiti@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 16 Jan 2023 22:16:25 +0800
Message-ID: <CAE_xrPhCqn0gp+eMaPoSBhLEGcyX7pewF6BWZzsaspwjPPuJcw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] riscv: Pass Object to register_cpu_props instead
 of DeviceState
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002cd55b05f2623b98"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 16 Jan 2023 14:16:42 -0000

--0000000000002cd55b05f2623b98
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Fri, Jan 13, 2023 at 6:35 PM Alexandre Ghiti <alexghiti@rivosinc.com>
wrote:

> One can extract the DeviceState pointer from the Object pointer, so pass
> the Object for future commits to access other fields of Object.
>
> No functional changes intended.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  target/riscv/cpu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cc75ca7667..7181b34f86 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -200,7 +200,7 @@ static const char * const riscv_intr_names[] = {
>      "reserved"
>  };
>
> -static void register_cpu_props(DeviceState *dev);
> +static void register_cpu_props(Object *obj);
>
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>  {
> @@ -238,7 +238,7 @@ static void riscv_any_cpu_init(Object *obj)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>  #endif
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>  }
>
>  #if defined(TARGET_RISCV64)
> @@ -247,7 +247,7 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
> @@ -280,7 +280,7 @@ static void rv128_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV128, 0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
> @@ -290,7 +290,7 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
> @@ -343,7 +343,7 @@ static void riscv_host_cpu_init(Object *obj)
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, 0);
>  #endif
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>  }
>  #endif
>
> @@ -1083,9 +1083,10 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> -static void register_cpu_props(DeviceState *dev)
> +static void register_cpu_props(Object *obj)
>  {
>      Property *prop;
> +    DeviceState *dev = DEVICE(obj);
>
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>          qdev_property_add_static(dev, prop);
> --
> 2.37.2
>
>

--0000000000002cd55b05f2623b98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 13, 2023 at 6:35 PM =
Alexandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com">alexghiti@riv=
osinc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">One can extract the DeviceState pointer from the Object pointer,=
 so pass<br>
the Object for future commits to access other fields of Object.<br>
<br>
No functional changes intended.<br>
<br>
Signed-off-by: Alexandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com=
" target=3D"_blank">alexghiti@rivosinc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 15 ++++++++-------<br>
=C2=A01 file changed, 8 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index cc75ca7667..7181b34f86 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -200,7 +200,7 @@ static const char * const riscv_intr_names[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0&quot;reserved&quot;<br>
=C2=A0};<br>
<br>
-static void register_cpu_props(DeviceState *dev);<br>
+static void register_cpu_props(Object *obj);<br>
<br>
=C2=A0const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)<b=
r>
=C2=A0{<br>
@@ -238,7 +238,7 @@ static void riscv_any_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | R=
VC | RVU);<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
-=C2=A0 =C2=A0 register_cpu_props(DEVICE(obj));<br>
+=C2=A0 =C2=A0 register_cpu_props(obj);<br>
=C2=A0}<br>
<br>
=C2=A0#if defined(TARGET_RISCV64)<br>
@@ -247,7 +247,7 @@ static void rv64_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0/* We set this in the realise function */<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, 0);<br>
-=C2=A0 =C2=A0 register_cpu_props(DEVICE(obj));<br>
+=C2=A0 =C2=A0 register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
=C2=A0}<br>
@@ -280,7 +280,7 @@ static void rv128_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0/* We set this in the realise function */<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV128, 0);<br>
-=C2=A0 =C2=A0 register_cpu_props(DEVICE(obj));<br>
+=C2=A0 =C2=A0 register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
=C2=A0}<br>
@@ -290,7 +290,7 @@ static void rv32_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0/* We set this in the realise function */<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, 0);<br>
-=C2=A0 =C2=A0 register_cpu_props(DEVICE(obj));<br>
+=C2=A0 =C2=A0 register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
=C2=A0}<br>
@@ -343,7 +343,7 @@ static void riscv_host_cpu_init(Object *obj)<br>
=C2=A0#elif defined(TARGET_RISCV64)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, 0);<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 register_cpu_props(DEVICE(obj));<br>
+=C2=A0 =C2=A0 register_cpu_props(obj);<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
@@ -1083,9 +1083,10 @@ static Property riscv_cpu_extensions[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
=C2=A0};<br>
<br>
-static void register_cpu_props(DeviceState *dev)<br>
+static void register_cpu_props(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Property *prop;<br>
+=C2=A0 =C2=A0 DeviceState *dev =3D DEVICE(obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (prop =3D riscv_cpu_extensions; prop &amp;&amp; pro=
p-&gt;name; prop++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_property_add_static(dev, prop);<br>
-- <br>
2.37.2<br>
<br>
</blockquote></div>

--0000000000002cd55b05f2623b98--


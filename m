Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB8D606A320
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 03:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ITCNwIhJ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLuG8-0001W3-5n; Tue, 27 Oct 2026 23:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLuG4-0001Vg-Mk
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 23:23:26 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLuG2-000475-VW
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 23:23:24 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6ae14eecc64so840674a12.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 20:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793157801; x=1793762601; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mk3I4P3qvt9cpCXVVANHB7X1V9r2M3jD6i2IEfgksoA=;
 b=ITCNwIhJ9Uq78p4DLFGrQOWurl0QJx1fFuJQIZJq5qfRsWDD3/AZp1lTaSHMcSVX+w
 7HWD6ooegJAHIT9ex62673Rs2T9CWwhvmCg5kUsF75DMiJy98QTISyq+khuTmZIbp4Yu
 XupB4DDCM+mbQsXENESERnP8r+54HczGpHteHmrAre4Zv572eSY5vjLuN2tPqkhNHzJ0
 CT4YxZmY/SJQr/2Epw8418fTIWotCGIeSk8+MFEZ8Oc4CkleWYiJL5+Y+AgW9pMYUX1w
 X/B0UIK85JKkKvnenX3sJtwH6wZsWexS3ZgaRbwj21IClJKqbJebE5IWHImQKXlsBtTS
 7zbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793157801; x=1793762601;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mk3I4P3qvt9cpCXVVANHB7X1V9r2M3jD6i2IEfgksoA=;
 b=v70Gz2D9Sl474QhaehH6Ad5KezPf1/RMXl1O2BERg9Z4juBFiOWotbH6ZDk8klKPNA
 7yD9vN705fqciddiBlU4YaN1qptHrUUIhOUWTK1Fre3b8RChgVCFeVrI/EevlbN6efUE
 Bj3LHl9Z/F50v6tEnMAvj0yKfAs525rgW6uA51boO1v8LElMLXCPqC2OFHHZtFLxMsQw
 oPKwMoPkokkuQUfTjZtcxFyc8EoiRPyEFCDqo/9YWKNuiDVjK0dGO2yzPXajY2bqfpOV
 3Qae9rPegpXFTMG1ufk/EvULBoVrjZVom3WHx3Vjxl3cMMBCNInHfo5/6KcaObepbcc/
 B4uQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw5ZwzAGk0PTx31HBzOAgKxHYvBWqke0/yUmhYo+V3C5vmUx0MtlPdfQowivsiTRUPYQrVss+0FBIwC@nongnu.org
X-Gm-Message-State: AFq9FYKpDxO/uzVJkM8iNbrud2UoLkEWUrATa8qyQeHpmZJYjTHtRQEE
 6NRvO4iQrph+BhDno8w0eXs4evSJwBseS26Mn+jyWYk8nNhcLeHoE+fC72FgeY8A5zYDax5pE4J
 Hm6PHs1YE8FW7NkEWolmJRiQWdKgUwGegz1z9fgP0Bo7S9uvtABVcxalvHTmJpzWTS/gJcvzyv7
 e6wYT2WV9Un68S/fU2604xnCCQZZuxHas4dHd4da5M/vY=
X-Gm-Gg: AYBFou1LAow60RfJZrs40FdfT3uYsRJE2Spdz4fU7wWlONJq6KCIYZO1KPlt/jNZddk
 OnXWwLX573oG9+zIz19F0EEDW9uBywJjedtvnCWIZ5Y0VrmFMUYQ7AuOGk+W58yStJ6V5tm3LHc
 HpmeLi9vEWwFw9Nwk39CcOoyGt4nVXfv/8PZZjOh0wFh+emY51E28cypdi5IyoyFf9e1HD7kgd6
 ElBBdi19Y69wO9LWo+DMbKappTVGrnriw3+z/5kHkGsLToiP+8iV1Sx+N+OOUHHbe95uXUc+66T
 JOLFFsGpTWBNE0B5DdxDoPS/ZRBhvA/sudU/GOufe2T4mho/MDX7EUnTQv05eo9RXajUsO3y+F6
 JSL+SahQohXnHUccS6GiI4XtKBOp0umQa9d/xeS8b7QceX9j365Zi3bTFZx4EtaDDIJtBITFxqP
 zmL6yvnp4yzi+e61TweB0owe7uUG9fwF9uYl57ekfhXpL4rGGRFY0UMuDYTxmahODLCvel0Utbo
 9E3ASM5cdrrcQ+/PQ8ZVjKpKvdqLzc30fBrLHowbGSTEkEFKlnv8DVRFrDciri4Nu7B3Fz1KQsz
 sV5j/fJRYU4pN8xZeKitjLYmQW9wazJ1g44rdF7lxRcLeKdhYeM67OymWYAyWVG6G7E=
X-Received: by 2002:a17:907:7294:b0:c26:19e3:e98d with SMTP id
 a640c23a62f3a-c49bdf7483bmr80784366b.45.1793157801122; 
 Tue, 27 Oct 2026 20:23:21 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c49a4e2401bsm227987066b.84.2026.10.27.20.23.06
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 20:23:07 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6b3dc272dcfso783152a12.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 20:23:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxBp9SiTik01YxXw7AkyXQCUGbYxtyvnY+S2SgNupjJVfCCRThmmUI7s1/Z5RdbBCvqVUwTDrSr1qgi@nongnu.org
X-Received: by 2002:aa7:c6d5:0:b0:6b4:16be:4fa with SMTP id
 4fb4d7f45d1cf-6b49cbd6cd0mr385557a12.15.1793157785664; Tue, 27 Oct 2026
 20:23:05 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-13-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-13-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Wed, 28 Oct 2026 11:22:54 +0800
X-Gmail-Original-Message-ID: <CAMXXpfZB8w_pJso4M4_ufOm99VbV6gfbUSKDNz4twFwfcTPgpw@mail.gmail.com>
X-Gm-Features: AclHuK9QdqaG-U3lqaLxdAeYzqbWYte2s4CGaiaJf8-nn3ySE5RrbwA2I8B6HtE
Message-ID: <CAMXXpfZB8w_pJso4M4_ufOm99VbV6gfbUSKDNz4twFwfcTPgpw@mail.gmail.com>
Subject: Re: [PATCH v4 12/18] target/riscv, hw/riscv: send trace ppccd packets
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="000000000000d741b4065ede1435"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jay.chang@sifive.com; helo=mail-ed1-x533.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000d741b4065ede1435
Content-Type: text/plain; charset="UTF-8"

>
> -- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -943,11 +943,22 @@ void riscv_cpu_set_mode(CPURISCVState *env,
> privilege_mode_t newpriv,
>  {
>      g_assert(newpriv <= PRV_M && newpriv != PRV_RESERVED);
>
> +    CPUState *cs = env_cpu(env);
> +
>      if (newpriv != env->priv || env->virt_enabled != virt_en) {
>          if (icount_enabled()) {
>              riscv_itrigger_update_priv(env);
>          }
>
> +        if (newpriv != env->priv) {
> +            RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +            if (cpu->trencoder &&
> +                TRACE_ENCODER(cpu->trencoder)->trace_running) {
> +                trencoder_trace_ppccd(cpu->trencoder, env->pc);
> +            }
> +        }
>
On the trap-entry path, env->pc has already been updated to the handler
address, but env->priv still holds the previous privilege level.
Emitting a PPCCD sync packet here therefore pairs the handler PC with
the old privilege level.

--000000000000d741b4065ede1435
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">-- a/target/riscv/tcg/cpu_helper.c=
<br>
+++ b/target/riscv/tcg/cpu_helper.c<br>
@@ -943,11 +943,22 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege=
_mode_t newpriv,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_assert(newpriv &lt;=3D PRV_M &amp;&amp; newpriv !=3D =
PRV_RESERVED);<br>
<br>
+=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (newpriv !=3D env-&gt;priv || env-&gt;virt_enabled !=
=3D virt_en) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (icount_enabled()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_itrigger_update_priv(=
env);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (newpriv !=3D env-&gt;priv) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;trencoder &amp;&amp;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TRACE_ENCODER(cpu-=
&gt;trencoder)-&gt;trace_running) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trencoder_trace_pp=
ccd(cpu-&gt;trencoder, env-&gt;pc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div>On the trap-entry path,=
 env-&gt;pc has already been updated to the handler<br>address, but env-&gt=
;priv still holds the previous privilege level.<br>Emitting a PPCCD sync pa=
cket here therefore pairs the handler PC with<br>the old privilege level.</=
div><div>=C2=A0</div></div></div>

--000000000000d741b4065ede1435--


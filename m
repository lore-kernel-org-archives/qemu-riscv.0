Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE82CD4F2C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 08:22:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXx9y-0000IE-Hz; Fri, 12 Jun 2026 04:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1wXx9u-0000Hc-QM
 for qemu-riscv@nongnu.org; Fri, 12 Jun 2026 04:22:34 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1wXx9s-0005fz-9R
 for qemu-riscv@nongnu.org; Fri, 12 Jun 2026 04:22:34 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-68bac6e24fdso1014177a12.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Jun 2026 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1781252550; x=1781857350; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1JOSGinv+7tUEI5gb4kXt7A3fvxesQBbn1jYZ30EgYc=;
 b=fKSZtwjP0hxVWDRdH84JYCAX5ugysjF5hlUdyBvmZzu8MzN17BFQ3j5GkcfBdiFZrG
 BZXKKsbgkZCyjSEijVfmDVIo5d7GlD5nznTJX6QC90OegrThn3U7jChoYvq2E8/6hnTd
 umS5XudKKPjJ3VSEFFQt1QFSvs8u2jMdqd+Ywaf7j8l4DJ1pb4uYNsyOr7FYDIAVoQLd
 7EqYdziCDl4JbBTij4RllD6J/s7JV6JsvDVjuWZ1mLkD+fl79NHPxv5YCFOOSuoHPd/D
 IBuDzgdstHarNihoGWpScUVtXsDYybCpwX1TXxWwDiEM/4zKcjCKc/2lTYFSVpY5ZYGq
 TF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781252550; x=1781857350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1JOSGinv+7tUEI5gb4kXt7A3fvxesQBbn1jYZ30EgYc=;
 b=O4yQTTSXS/l8ukCvi3cx2ttpjKfpiNGaE6fBAlyMP+l+VaBnRQr7/yGlc2D3mMRuDE
 vJQrOtssurxS/2ea8dthCvRrN7fUN+tXjLNwqWqoA1g/OpsecO+2mseEzg4nhTtoLykm
 UQM3NyJrVBRSDri6Dz8H3gUewB6w99kMRSq5B3OiXNTHvM5DqurP2uhbNiX2SCa2OV0J
 yJVMNzncTyb5H/U6h2Yjzc0+iB1PJ48NtMvY/2lu47wgd/7AApptEYTcErw5lScVAZZ3
 jk5zPI4uKv6Okn/KVITBv87xdF7nzRfVyFXsCDD1805kwz+kTCsrltQPQ+cbMdGRGGYA
 2yHQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XEq+yryAjQGjHDCgs/Ju9oQ3M1JONllV1PP7IXqBzCwj8/ZUCEqa6AVGL+cPUnE1LetbjuYvnhAen@nongnu.org
X-Gm-Message-State: AOJu0YxqhiTk32+ZIdxe5P1beKfGcZNrCTg0KOk9WENjDhHxRPdxoBtM
 b0lCZ7He171GsTSq8TqdUAtcBfl6rsCw+xdJ1cWNKmxhKPzcP+4qyyEJ6bjdVwI/MDvVIqiwbIe
 QiWA0HCOIEviRhig2U/4VraukZ/oBQXHf+9Gwj0FSvuw8K3mliMCs2QuX6Psk3dEe/Op6C96y6L
 mv8Dx7KObQagtr515ibvnTJv6lrRHdIIWukv47cT/Eu2A=
X-Gm-Gg: Acq92OHQ7bTjZw7TGtUI28kP2USIvcOHHrnwU5aOpTCjJsUdmxXCPQ1xEfgwXEOe9Ub
 uKg5b+l0MlMEUv0Msnt89XSRICZoUSUg244rg7J+UiI76vEDYDP8JwTeJPdzejlP5OaBnxjFHfH
 JMixhgNrVK88dMi3XyoxONLyiTlHvGgv2c4ZQ15iiUemVpfn2opBPM0QSoPsWoOrxdwnKPBr3X/
 kEguPddX5XuxcCixLh+0voA4dvQyBLPjvDbjy6katUGEseQCEbbdeLdbHoj0eZAg4OofLRrQ1bO
 WRIb68dlVery7z5yKr4I4hRVDXPenHrBcTwuFbdUvEO8AQmvbgWqKSDMRxFX+cS1ic+sUBD3c7U
 +75wjvLpyorOPsDfZHP0VnNW8LVIH/06vDN/zJfibDFSlxjHZw2yM/Jtx3CJzghP9fvXkwIDcvu
 jWAeoZycZjUsJDhjtvpjBkmrGXevajEjQQSAOOyy5/cJB9UbTQvwBmVqcj08aO
X-Received: by 2002:a17:906:d54d:b0:bee:c13f:7ec0 with SMTP id
 a640c23a62f3a-bfe27931577mr75865566b.8.1781252550287; 
 Fri, 12 Jun 2026 01:22:30 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb531896dsm73825566b.27.2026.06.12.01.22.29
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 01:22:29 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-68bac6e24fdso1014145a12.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Jun 2026 01:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+xdR66zXtLOKaM+Q0oKkogQfyDcybTXUXMNY/QcqcYXYSB6b3b9hDaCYgvcEEOPWWBreQFHSIaBXuG@nongnu.org
X-Received: by 2002:a05:6402:e02:b0:68c:3994:45f1 with SMTP id
 4fb4d7f45d1cf-6937860404emr676301a12.6.1781252548784; Fri, 12 Jun 2026
 01:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260318185238.99143-1-luisccunha8@gmail.com>
 <20260318185238.99143-7-luisccunha8@gmail.com>
In-Reply-To: <20260318185238.99143-7-luisccunha8@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Fri, 12 Jun 2026 16:22:17 +0800
X-Gmail-Original-Message-ID: <CAMXXpfZTOA2KyL+ab9C=ut6a9VUtOL7WawzL0rokZLpaKw3__w@mail.gmail.com>
X-Gm-Features: AVVi8Cd8mz00-7dTryuYE5-Lu26EU77p5kuOf2zN3ZBisuQINgaxe3Suxd2G_1Y
Message-ID: <CAMXXpfZTOA2KyL+ab9C=ut6a9VUtOL7WawzL0rokZLpaKw3__w@mail.gmail.com>
Subject: Re: [RFC PATCH 6/6] target/riscv: Add CPU properties for SPMP and
 sspmpen
To: luisccc <luisccunha8@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="0000000000006d273406540a2df3"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=jay.chang@sifive.com; helo=mail-ed1-x532.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--0000000000006d273406540a2df3
Content-Type: text/plain; charset="UTF-8"

>
> +static void prop_sspmpen_set(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    bool value;
> +
> +    visit_type_bool(v, name, &value, errp);
> +
> +    if (cpu->cfg.spmp != value && riscv_cpu_is_vendor(obj)) {
> +        cpu_set_prop_err(cpu, name, errp);
> +        return;
> +    }
> +
> +    cpu_option_add_user_setting(name, value);
> +    cpu->cfg.ext_sspmpen = value;
> +
> +    /* Enable necessary extensions */
> +    if (value) {
> +        cpu->cfg.spmp = true;
> +        cpu->cfg.ext_sscsrind = true;
> +        cpu->cfg.ext_smcsrind = true;
> +    }
> +}

 Why do we need to set it again ? So if we enable sspmpen means enable spmp
at the same time?

--0000000000006d273406540a2df3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">+static void prop_sspmpen_set(Obje=
ct *obj, Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0void *opaque, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
+=C2=A0 =C2=A0 bool value;<br>
+<br>
+=C2=A0 =C2=A0 visit_type_bool(v, name, &amp;value, errp);<br>
+<br>
+=C2=A0 =C2=A0 if (cpu-&gt;cfg.spmp !=3D value &amp;&amp; riscv_cpu_is_vend=
or(obj)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_set_prop_err(cpu, name, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 cpu_option_add_user_setting(name, value);<br>
+=C2=A0 =C2=A0 cpu-&gt;cfg.ext_sspmpen =3D value;<br>
+<br>
+=C2=A0 =C2=A0 /* Enable necessary extensions */<br>
+=C2=A0 =C2=A0 if (value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.spmp =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.ext_sscsrind =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.ext_smcsrind =3D true;<br>
+=C2=A0 =C2=A0 }<br>
+}</blockquote><div>=C2=A0Why do we need to set it again ? So if we enable =
sspmpen=C2=A0means enable spmp at the same time?</div></div></div>

--0000000000006d273406540a2df3--


Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83BD606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ksANx7Rj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLyAR-0007CK-1o; Wed, 28 Oct 2026 03:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLyAO-0007Bg-3E
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 03:33:49 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLyAM-0002ti-EF
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 03:33:47 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c4550d8ab15so78155466b.2
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 00:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793172824; x=1793777624; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=LnjmH2S/AjR4RFfS6rITEgbZa+dsK7wz1YppDAeLdro=;
 b=ksANx7Rjngof/hEQw+mDVD0EWOsQIzw8um+OUctRJ80yJZMkQR0uCWMpNrIY4zLSO2
 7Yj6+SHoLysPxBX4ommhYt+my2PLhLEUmu38MFStbl5MYZtrrEx6BnomcgZYwLCrgoix
 O0w974D8M5RhDSjfV3OrbOxaE0XyeKT3xkxegNCEJmT0bblLcEsG4s8CEGiZaRA3qkAE
 U/V7Z4zh1/UNbDDs6gC4En3VcKjxyOG7lal5859Tgb/Xdzpis2P+BOkcX5HR107N5XjB
 rRmiVjAvdPWgLsHdmJHrrgN/5NlNtez2EGg8pakAFufNkQFD+6VjRI41ETPrmc+9gQJ3
 ODrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793172824; x=1793777624;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=LnjmH2S/AjR4RFfS6rITEgbZa+dsK7wz1YppDAeLdro=;
 b=RWxn3z3MpaXmUTuFsdNmKFwDjcRk8ZOnEl1pkEYeFJ2TtE3vmS6PVw6OThAGOe3Uxy
 7yh1NiXPi3msb5G9KamaL6u/wcWYuL7JWyXzapPg+Z/MQhDbKwIXwwnMYeTTnbqTsTUx
 /I/L3ykwh0ZUDp020b5wa0LGcS/iPQtrXJ9hxSZMZQ+rvdVI6pfXXI5a8SkvKoRoJdVN
 TG595g7E4uc7wRl9yd2nzzBhixGgWJrqRx4VAodHU1OJvKrY145Zqybu6lM0T4VIlh2r
 f1d7VEFCHshPh6gpfh/qQ5+89nVfq40YXNepvPpV4czHDU+HBtkNqRcyGxONn09rn/qs
 TAcg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwCkaDcSO57sC5G+Vj5mBpaZsfg5qh2NLoKgdoRPY2mTIAa9ir0oeS8ZprtVgAJKDCWnkt5R2BAD485@nongnu.org
X-Gm-Message-State: AFq9FYJAF4CGYhelUIKp72HP/8shsdgeBFG0XrwdwJN+yNyER7poylRf
 +51mdosn2IYXPc5KDP6oWZfgRMtr66AjF45Qcu9zbiCtiEe8NveHKLCRcomPlVDJUU/VbD6szT2
 X9H6WJw6tfRbcQhnZU3MWqMMP0TaJ/C4L3gB16xR8Ujw3k7NzimqYqyqncn04nJveaBbmCV4zUj
 NHkl8UNXTAVT+lAPnOIXC/1XGfoF08YajmKsx4VZQ3dpM=
X-Gm-Gg: AYBFou3l/9QFXqHQv7F7kKRETeoT4bDkDX1nt4k6tAmtOn54dcb1wT54izvxn++x8Jy
 Y5F/GP0XCK7dv/uNVKpH/VDNFnr7eJzDwcDun+afix3dulRI6RhiN9DJcwqRU1BywEJsPHRh1y8
 e4olKlFg6NCAYUCyQFl8yTH7Fcd4PIe6zNxeaPYxEHfRlSY/TIxOOOMk9X5AaqsuzszNNmlvcq/
 ktKwF/i90qzpZISqNclD1ArHHIn42ij0ArvqbZEO9wsC070ZiVUZl7wY/EaBtDJL+Cm8chMkHkd
 NDZR+k+rypyXH+PyUQ11JdcaGNDEHYMEBbRV60j5D6MQZpEhsCJUsga1VXrlyzS0gj82P/upt1v
 IVyUAC17eXWsB0/qbLx8vDtnHX1nk21UF03+3er+DG248G5f8xZXTKnCZVOWXks9OxQUCU77ptx
 WOQNRmT0heKhK9GQYeOtnBlHFDP4AZY2zAJE4sUGhiBnQNXg1NbIoVPUtUHBVOqDy0YvFIpg+0X
 jx1cwI8EUpUmhNb+F7r5XHlMn81EgloFDW/wMbP7OTIxTZ7ntqh1z0qyxq3pnCj51nTDaU8Psja
 XflxR4DBB+IjIRPKMoBqG0UUFu86oGowssVd2O4eyBrxNnWUg7v+LU2zdJjEJXh3pnZ7
X-Received: by 2002:a17:907:3e06:b0:c42:73df:933b with SMTP id
 a640c23a62f3a-c49bdeaacd0mr120318366b.12.1793172824467; 
 Wed, 28 Oct 2026 00:33:44 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66bd3asm563999366b.56.2026.10.28.00.33.43
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 00:33:43 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c418e215671so74443466b.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 00:33:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBx8JG+jb8/bS8hg8+yYHm4+dV2St/Y1u6D+KSFpiQRZSnI7AkG/ecmREbD2TTdJd9Cu2x/3zBcESV/c@nongnu.org
X-Received: by 2002:a17:906:9fc7:b0:c3f:55e6:83e6 with SMTP id
 a640c23a62f3a-c49bdeab6a7mr115586266b.15.1793172823267; Wed, 28 Oct 2026
 00:33:43 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-18-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-18-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Wed, 28 Oct 2026 15:33:30 +0800
X-Gmail-Original-Message-ID: <CAMXXpfakWUOw4r3vaSw7y6wkpojHuanXFeL9DD4PwnAqgnhmvA@mail.gmail.com>
X-Gm-Features: AclHuK89muR4AACpl_RTB3BtYsN-Uqlkl6W-kcFwmiJ0B0IhlIkRJhWmLMsz5fU
Message-ID: <CAMXXpfakWUOw4r3vaSw7y6wkpojHuanXFeL9DD4PwnAqgnhmvA@mail.gmail.com>
Subject: Re: [PATCH v4 17/18] hw/riscv/trace: update branch bit in sync
 messages
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="00000000000026e211065ee1952a"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x632.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--00000000000026e211065ee1952a
Content-Type: text/plain; charset="UTF-8"

>
> +static bool trencoder_addr_is_branch_taken(TraceEncoder *te, uint64_t
> addr)
> +{
> +    uint8_t last_branch;
> +
> +    if (te->branches == 0) {
> +        return false;
> +    }
> +
> +    if (te->last_branch_pc == addr) {
> +        last_branch = extract32(te->branches, te->branches - 1, 1);
>

 last_branch = extract32(te->branch_map, te->branches - 1, 1);

Thanks
Jay Chang

--00000000000026e211065ee1952a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">+static bool trencoder_addr_is_bra=
nch_taken(TraceEncoder *te, uint64_t addr)<br>
+{<br>
+=C2=A0 =C2=A0 uint8_t last_branch;<br>
+<br>
+=C2=A0 =C2=A0 if (te-&gt;branches =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (te-&gt;last_branch_pc =3D=3D addr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 last_branch =3D extract32(te-&gt;branches, te-=
&gt;branches - 1, 1);<br></blockquote><div><br></div><div>=C2=A0last_branch=
 =3D extract32(te-&gt;branch_map, te-&gt;branches - 1, 1);<br><br>Thanks<br=
>Jay Chang</div></div></div>

--00000000000026e211065ee1952a--


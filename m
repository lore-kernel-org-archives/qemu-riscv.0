Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDbyx-0002Jg-U1
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jan 2022 19:52:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nDbyw-0002H7-Di
 for qemu-riscv@nongnu.org; Fri, 28 Jan 2022 19:52:46 -0500
Received: from [2a00:1450:4864:20::52c] (port=47093
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nDbyu-0003vR-Kg
 for qemu-riscv@nongnu.org; Fri, 28 Jan 2022 19:52:45 -0500
Received: by mail-ed1-x52c.google.com with SMTP id m11so13216486edi.13
 for <qemu-riscv@nongnu.org>; Fri, 28 Jan 2022 16:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jacKjelwuptgZAZiU6SqOEH1L6PuokFoaXD3wLX6DXc=;
 b=xred+5df2gInUB+P0nc4kefYtMbluDh3xT67BuZkRVcTv4EeissUK3LEXGDvRYKNrw
 Ep2BFBZe2wBAfjcdz2QpGjQavZsUVGUpM7sTARkjB93jYuJFq7fhSlpC0b01kfttqsUa
 1ztjQMasl2qAUowJEpV+sWgyqB3UVa6r1TRQxhRJCfD1ffx5l5qlQVloWd4iYTRL+u8j
 6OK7wXWYqvaHCkuKerHddBoeE+kd7EnDeCc2dil/OTQU3vfgRNEP+jwI4tDLSk7xhG4/
 /lI2ivVzUP0PcXbqGGZS/1UOHG5wgnnEzJNOBZNJSKrE9UR60/hWcEanrI4ioNbMTwhG
 QA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jacKjelwuptgZAZiU6SqOEH1L6PuokFoaXD3wLX6DXc=;
 b=TWYSHNDQ8ryv96QCEbrvBPzQhzqYsekP0ZtWLLSCA32bwenyJS/0jFRniYyVf/5b+9
 uyoI1fxa+s7djIUK0FPsR6D0EGwwlY1zmq8GqcebMeoZ/j/bySedBNqlk8OifW9qZy7+
 TQmmQC7Br7FCk2wdctfx8LI8lEfttstnUBhK67pKhlKSvrFbfTlbf228HDkG1t/sT6WR
 qhlN+LxSjYizu5tlGTkecqy2NkjccuduFGqNqTWFADSTBGLohrLF+BzQ0IZ3NJlMEpMm
 eGhahqb8LYn7l144Yb3s1gJ8/LAeVHW8pi5A+qzG43GvTVDboS/gGopgNVPWRE2Flbq5
 j+TA==
X-Gm-Message-State: AOAM531H16RAgZrAfjw0c7HcsuEuC/JvniQ71FtgDIik5OZYYlYs6Uii
 Ta5tEEW3ZA/Z9GPRQ6ZFRN6KETAsg0ICkTNLOcP8mQ==
X-Google-Smtp-Source: ABdhPJy6rE7wU6gxBMyf5hB14ITEO09l6rzMMjcAEY8rwEYQAwnJBT6Ug9qP0M0h/I/kuxOT3MiNbT9rsJMBIRt85Ls=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr10647363edd.408.1643417563105; 
 Fri, 28 Jan 2022 16:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20220120200735.2739543-1-atishp@rivosinc.com>
 <20220120200735.2739543-3-atishp@rivosinc.com>
 <936ade43-0fc9-56a5-f7a3-17180128a985@linaro.org>
In-Reply-To: <936ade43-0fc9-56a5-f7a3-17180128a985@linaro.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 28 Jan 2022 16:52:32 -0800
Message-ID: <CAHBxVyGsHd=XqSN42Bem6_jwxw7BJDCLhurc4HvtNK+zeZyKcA@mail.gmail.com>
Subject: Re: [RFC 2/5] target/riscv: Introduce privilege version field in the
 CSR ops.
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000111c0a05d6adf897"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=atishp@rivosinc.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 29 Jan 2022 00:52:46 -0000

--000000000000111c0a05d6adf897
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 23, 2022 at 11:56 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/21/22 7:07 AM, Atish Patra wrote:
> > +    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart,
> NULL,
> > +                                           NULL, NULL,
> PRIV_VERSION_1_12_0 },
>
> I think adding all of these NULLs are hard to read.
> Better to just add
>
>      .min_priv_ver = PRIV_VERSION_1_12_0
>
> to the existing entry.
>
>
Yeah. That's better. Fixed it.


>
> r~
>

--000000000000111c0a05d6adf897
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 23, 2022 at 11:56 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 1/21/22 7:07 AM, Atish Patra wrote:<br>
&gt; +=C2=A0 =C2=A0 [CSR_VSTART]=C2=A0 =C2=A0=3D { &quot;vstart&quot;,=C2=
=A0 =C2=A0vs,=C2=A0 =C2=A0 =C2=A0read_vstart,=C2=A0 write_vstart, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NULL, NULL, PRIV_VERSION_1_12_0 },<br>
<br>
I think adding all of these NULLs are hard to read.<br>
Better to just add<br>
<br>
=C2=A0 =C2=A0 =C2=A0.min_priv_ver =3D PRIV_VERSION_1_12_0<br>
<br>
to the existing entry.<br>
<br></blockquote><div><br></div><div>Yeah. That&#39;s better. Fixed it.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--000000000000111c0a05d6adf897--


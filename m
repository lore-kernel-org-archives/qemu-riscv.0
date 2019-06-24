Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfIgv-0002Dl-7X
	for mharc-qemu-riscv@gnu.org; Mon, 24 Jun 2019 02:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44646)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@sifive.com>) id 1hfIgs-0002CD-4Y
 for qemu-riscv@nongnu.org; Mon, 24 Jun 2019 02:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1hfIgr-0000G0-5W
 for qemu-riscv@nongnu.org; Mon, 24 Jun 2019 02:42:58 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:33305)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hfIgq-00009C-VR
 for qemu-riscv@nongnu.org; Mon, 24 Jun 2019 02:42:57 -0400
Received: by mail-qt1-x842.google.com with SMTP id w40so2800067qtk.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Jun 2019 23:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CqJAb8NCY3pBtooXJ5LpA6nwJFMUSpk5b91OzY36qU8=;
 b=ayarTMUk92G34GB1A3PKZAOBYEz7RwWkeLGZ3z/ebPIsyPG8a0GXpf5MfBKCHf8ZPa
 VH4vP1smDYY0tdpWK4Qjt2Neh2fSO0+X4mRPEhMxN+DfVEtlBNevEhINMC3DjZavMX4H
 c4p0Fus/bsiaLfYQrQspKnQ2GgZLD6M/6jn7UlgX8PTqrwkLwRpWz8xXSm7uLe7hC0ks
 sCiZHafrO3Y58dXgqmKdqp6sbOBwRnINN40UbXNkzh58RQvjc/YpRV18Q2x44dxOYNYB
 LK5KGYYK8mg75x/GleYyv32WKIdUdaWB74CSdfi7TbvKgjX3lk+AMEgQnzXhDV2LlEG/
 mqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CqJAb8NCY3pBtooXJ5LpA6nwJFMUSpk5b91OzY36qU8=;
 b=YgYZrzoGDh4RK29SaWvw5TbRxmaybZ49hEemy29stvJfhqLyYAl87NU+uLIYJXTzEy
 +6IsQyonppqtfz8gFbICVlunuot2b5FYrNeFaR7XxiQeM+9YIGsBFFclLTazeCVST9cj
 rb4XuVCa+kf7TVTgRSfrk2FW22UpeJZ+JJHfPKZA4MGxazhNzoeu00GzjB+IRhz/Z3l3
 let84U8Y3mrMNZKVx+jgfezR17AN4nsoT9E8H+IyNqonxowdGmS7u+vHvuS2dWaGdXAh
 0PRmbvTLlX6axourglL0yzhBbZszBflaVbV94qSAntJd1XuI3931ozp46/9ALq+EfJ9y
 CKvw==
X-Gm-Message-State: APjAAAUIlGXI13KTBDnqSlldn2JE4A4AwR7yG+PBQcV8eIodp3eHQi6V
 bjDRLViVU95jd6iI4Glal2PpuuCtA0g=
X-Google-Smtp-Source: APXvYqy7lEI35RgefKUpL0idi5a6e5qStjm3qTQ0O66BiV3fbatIxiHLzqhKN2zOB+2FxdZa/XntRg==
X-Received: by 2002:a0c:d01b:: with SMTP id u27mr56783560qvg.88.1561358574946; 
 Sun, 23 Jun 2019 23:42:54 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com.
 [209.85.222.170])
 by smtp.gmail.com with ESMTPSA id w16sm7392813qtc.41.2019.06.23.23.42.53
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Jun 2019 23:42:54 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id r6so8961465qkc.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Jun 2019 23:42:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1106:: with SMTP id
 o6mr101869223qkk.272.1561358573519; 
 Sun, 23 Jun 2019 23:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190616191900.GH61734@hippo.sing.id.au>
 <41ef5fbf-f438-e60a-2fba-a72e3ad422f9@linaro.org>
In-Reply-To: <41ef5fbf-f438-e60a-2fba-a72e3ad422f9@linaro.org>
From: Palmer Dabbelt <palmer@sifive.com>
Date: Sun, 23 Jun 2019 23:42:42 -0700
X-Gmail-Original-Message-ID: <CANs6eM=ir68d9KEn1_uOGVAxFp61OT2bCCJNFa+JrWnHWeMJFA@mail.gmail.com>
Message-ID: <CANs6eM=ir68d9KEn1_uOGVAxFp61OT2bCCJNFa+JrWnHWeMJFA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Joel Sing <joel@sing.id.au>, qemu-devel@nongnu.org, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Carlos Eduardo de Paula <me@carlosedp.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Marco Peereboom <marco@decred.org>
Content-Type: multipart/alternative; boundary="000000000000245a62058c0c1f23"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] atomic failures on
 qemu-system-riscv64
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
X-List-Received-Date: Mon, 24 Jun 2019 06:42:59 -0000

--000000000000245a62058c0c1f23
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 17, 2019 at 4:53 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/16/19 12:19 PM, Joel Sing wrote:
> > +    /*
> > +     * Clear the load reservation, since an SC must fail if there is
> > +     * an SC to any address, in between an LR and SC pair.
> > +     */
> > +    tcg_gen_movi_tl(load_res, 0);
> > +
> >      gen_set_label(l2);
>
> This clear needs to be moved down below label l2.
> Otherwise, with lr / sc / sc, the second sc could succeed in error.
>
> FWIW, other targets have used -1 as the "invalid" load reservation, since
> the
> architecture does not require address 0 to be unmapped.  This should be
> quite
> visible in M-mode with paging disabled and ram at offset 0.  Often, other
> targets require alignment for the lr/sc address, though I don't see that
> for riscv.
>
>
> r~
>

Joel: can you submit this with a "Signed-off-by" line?  There's only a week
until the soft freeze, and I'd really like this in if possible.  It'd be
great if you could fix up the other issues, but I can't even do that myself
without a SOB.

--000000000000245a62058c0c1f23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jun 17, 2019 at 4:53 PM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 6/16/19 12:19 PM, Joel Sing wro=
te:<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Clear the load reservation, since an SC must fa=
il if there is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* an SC to any address, in between an LR and SC p=
air.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_movi_tl(load_res, 0);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen_set_label(l2);<br>
<br>
This clear needs to be moved down below label l2.<br>
Otherwise, with lr / sc / sc, the second sc could succeed in error.<br>
<br>
FWIW, other targets have used -1 as the &quot;invalid&quot; load reservatio=
n, since the<br>
architecture does not require address 0 to be unmapped.=C2=A0 This should b=
e quite<br>
visible in M-mode with paging disabled and ram at offset 0.=C2=A0 Often, ot=
her<br>
targets require alignment for the lr/sc address, though I don&#39;t see tha=
t for riscv.<br>
<br>
<br>
r~<br></blockquote><div><br></div><div>Joel: can you submit this with a &qu=
ot;Signed-off-by&quot; line?=C2=A0 There&#39;s only a week until the soft f=
reeze, and I&#39;d really like this in if possible.=C2=A0 It&#39;d be great=
 if you could fix up the other issues, but I can&#39;t even do that myself =
without a SOB.=C2=A0</div></div></div>

--000000000000245a62058c0c1f23--


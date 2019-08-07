Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvSyJ-0007WW-IE
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 16:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37197)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@sifive.com>) id 1hvSyE-0007Up-TG
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 16:55:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1hvSyC-0005lF-UA
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 16:55:42 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:39487)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hvSyA-0005g1-Uj
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 16:55:39 -0400
Received: by mail-qk1-x741.google.com with SMTP id w190so66978115qkc.6
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 13:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DsTVPJ/DCS/XHwwomqEBWk2jvUt0gA/a5hzs5Z9Hmp8=;
 b=LR6H+qLJzHnPdPMgX0legLNFr5sOzSAWo6nEiwXDRRwgGTg/JWZBpXujvLqWs1Jxhv
 oQRqJALTf7ifR99SyiL9QoTH/d/lElrXqLam2E6Za0qYq9XDzWn8MfZnn3TQkZSNC2dS
 4Yk986RK0LImxzevrLS3V3gaDf76M11XWke3bKJENuk+iP19cOyEK7XzlbwUapB6RG4A
 8r8+NcYKwCIT6CpLtdEhzQrY5wpc55gp8ZPYgH8HTKskPLedyDkWvARXmL+qQu70QxL/
 e2NFIU1g3dLlR3346VY96mO6aLKbCv71f66hSwPP0wt8GaOvtSqggFE1SGjbxtwPVLPi
 9rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DsTVPJ/DCS/XHwwomqEBWk2jvUt0gA/a5hzs5Z9Hmp8=;
 b=NzEE7EWwf+pBtFK8O0ItrXPJmf6XQkAp9bjVrXwPjD+M62lx4YcPK5M1hh6nUa4Dss
 zZv9JfAqaDqXlsAleumcla5p3cEx9tDwX+HX920zlmtRqT++8Z6qzK0ioo7WAfdALMlk
 dXWrmRL3EDujmftKRJjSULsn2UaJ5uzRBPdWOMovAyk3jZ6tl4ywxjr3N8IhVQKlf5Vq
 BQrnT1omBYpj4hYpY/hefHXZ8f52U/lE0K7x/8Djjx7IbG17IrM2DCg4E+d+F7UKSNG6
 2MePDRUsMpz4aarXNbBfvOOyPBPgUPIBtPktvf7yDk9ow++ukNMYxXU623iy07Fu1SqH
 fJiw==
X-Gm-Message-State: APjAAAUdAmZhl0B9OJna3g+rFbagUCEWAJjaHa69eQxlTsByy/A0NDaA
 U6+NIZ60Yy783c+oVFgx0UEDK16N2hk=
X-Google-Smtp-Source: APXvYqy5RrenBv8pwCbEsQlEFePXB8W/3dkmujsl0w0YT/g0mQCGPmyCI9NKJoRjL7/Ik9IEQ19QWw==
X-Received: by 2002:a37:6844:: with SMTP id d65mr10024956qkc.398.1565211336261; 
 Wed, 07 Aug 2019 13:55:36 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175])
 by smtp.gmail.com with ESMTPSA id r17sm41669538qtf.26.2019.08.07.13.55.34
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 13:55:35 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id z4so89915627qtc.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 13:55:34 -0700 (PDT)
X-Received: by 2002:ac8:23b3:: with SMTP id q48mr37884qtq.110.1565211334655;
 Wed, 07 Aug 2019 13:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <1564577101-29020-1-git-send-email-bmeng.cn@gmail.com>
 <581a0284-c658-265f-1b0f-6f4be5406cee@linaro.org>
 <CAEUhbmVXC6GeHYFST514cLRJHQOo5ki=ZPG=OsLzV2YA0ChQgA@mail.gmail.com>
 <ac4453de-81cd-c32a-17f8-283fa3569ed0@linaro.org>
 <CAEUhbmX2C_FbW_m=Mri19hpz0c74SQTt3ogsatGgveH09t3_4g@mail.gmail.com>
In-Reply-To: <CAEUhbmX2C_FbW_m=Mri19hpz0c74SQTt3ogsatGgveH09t3_4g@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
Date: Wed, 7 Aug 2019 13:55:23 -0700
X-Gmail-Original-Message-ID: <CANs6eMkRQ1-Gb42DhHGz++4Q79JbH4S3MnccwmwKKEB-sdozag@mail.gmail.com>
Message-ID: <CANs6eMkRQ1-Gb42DhHGz++4Q79JbH4S3MnccwmwKKEB-sdozag@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, QEMU devel <qemu-devel@nongnu.org>,
 QEMU riscv <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000099d456058f8d29c9"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: rv32: Root page table
 address can be larger than 32-bit
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
X-List-Received-Date: Wed, 07 Aug 2019 20:55:46 -0000

--00000000000099d456058f8d29c9
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 1, 2019 at 7:58 AM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Thu, Aug 1, 2019 at 10:16 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 7/31/19 6:53 PM, Bin Meng wrote:
> > > I am not sure how (idx * ptesize) could overflow. It represents the
> > > offset by a page table which is [0, 4096).
> >
> > You're right, I mis-read what was going on there.
> >
> > However, lower down, "target_ulong ppn" needs to be promoted to hwaddr,
> so that
> >
> >     ppn = pte >> PTE_PPN_SHIFT;
> >     ...
> >     base = ppn << PGSHIFT;
> >
> > does not overflow.  (Which is the part of the page table walk that I
> thought I
> > had gleaned from the patch without actually reading the entire function.)
>
> Ah, yes. ppn should be promoted. Thanks for the review!
>

Did I miss a v2?

--00000000000099d456058f8d29c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Aug 1, 2019 at 7:58 AM Bin Meng &=
lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Aug 1, 2019 at 10:16 PM Richard Henderson<br>
&lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richa=
rd.henderson@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 7/31/19 6:53 PM, Bin Meng wrote:<br>
&gt; &gt; I am not sure how (idx * ptesize) could overflow. It represents t=
he<br>
&gt; &gt; offset by a page table which is [0, 4096).<br>
&gt;<br>
&gt; You&#39;re right, I mis-read what was going on there.<br>
&gt;<br>
&gt; However, lower down, &quot;target_ulong ppn&quot; needs to be promoted=
 to hwaddr, so that<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ppn =3D pte &gt;&gt; PTE_PPN_SHIFT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0base =3D ppn &lt;&lt; PGSHIFT;<br>
&gt;<br>
&gt; does not overflow.=C2=A0 (Which is the part of the page table walk tha=
t I thought I<br>
&gt; had gleaned from the patch without actually reading the entire functio=
n.)<br>
<br>
Ah, yes. ppn should be promoted. Thanks for the review!<br></blockquote><di=
v><br></div><div>Did I miss a v2?=C2=A0</div></div></div>

--00000000000099d456058f8d29c9--


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7wcx-0002rj-M9
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 03:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42689)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i7wct-0002lf-BP
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 03:01:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i7wcr-0002fO-MB
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 03:01:15 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34542)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i7wch-0002Uw-IW; Wed, 11 Sep 2019 03:01:07 -0400
Received: by mail-ot1-x344.google.com with SMTP id z26so12292367oto.1;
 Wed, 11 Sep 2019 00:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8rd9zmbXeVAMF2vcVt6DDMzJAtl/1bzUM0kjoWQ/HL4=;
 b=adQiIvN2ERCwZok0Q6AziXp1Ef3YcAD5J2HBWcTDUp/Iecq0/j88AodEPkfb85xmfN
 eMvyY+ZiDhwM42ccq1u1KhzWGUGNnod2047CO+Hf7KDs8QbVCkIqo5fzxo8Ql5gLGf1Q
 rHYvaituIbMpJxTV/EGKfxBIRTye3QujsayfqSd51oY5DbB7RKVpGjaBH/4GwWkLT6js
 h3qcn4J7+0P0T/j0WlFxhGDE2iui6NrUAb5xycNqx9IDjNsSmffdfwGEkmoDWI9dTPwM
 /qRAsUsgRBcV3Gw0mXsRVZeCDnynKoouS7cX9nQ6DjpUmXI3pQToPSfhhMseR5Dapu3R
 NJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8rd9zmbXeVAMF2vcVt6DDMzJAtl/1bzUM0kjoWQ/HL4=;
 b=D2N/LWoOI7ae+aROPZ2vdYKwYcUZwz1/U19ywQraKtPhxJTc1SE9jUOtGNYNkuZrlM
 FOJiTgA4OqX7RdgcQa0Kyfpg3DH3ewWofnFfd2+MSwJQH9OiK8ZbFx4KyHEHDK4TBemt
 Q6W3RBEvWsLPXACjIiDlvupFnLDKJkJlBSdRq1WvBgnnSVpHVU3nGKIp1vjJ8/xvECyg
 82onaAAUImNSdpUQRwDpxGgjNKL1Uo1kQn7tZ2Z56KcLGnaB7+x0b4aMiZ4nayerHo+x
 ijdTbkBbWiTATLc3r3aCMD8TCccj711P8sYa8asJiZja+zoDa0bzzHLfWPlyCePK2cSe
 XKlw==
X-Gm-Message-State: APjAAAWZYpDzkdQayoY4VHoRleZynce1lia17QWdwAyoOWvdE2SShcLH
 iEQaxaHtTDDXSYyW7l0ys+eQtg3G+VKDFbzyJ10=
X-Google-Smtp-Source: APXvYqz3Qan2m2/3cHeBMJ141T5YQuR8UMcMghRrKCJ57RtNB1lww9QIzncpA/IqKnqlk9XByAuVt/JSXk0+MkqyUX0=
X-Received: by 2002:a9d:5f09:: with SMTP id f9mr3598367oti.341.1568185257064; 
 Wed, 11 Sep 2019 00:00:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Wed, 11 Sep 2019 00:00:56
 -0700 (PDT)
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Wed, 11 Sep 2019 00:00:56
 -0700 (PDT)
In-Reply-To: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 11 Sep 2019 09:00:56 +0200
Message-ID: <CAL1e-=iyBP+k6MH+uCd7EAUAqp=hSG7SQOMemuJwdhJVGusYcg@mail.gmail.com>
To: liuzhiwei <zhiwei_liu@c-sky.com>
Cc: Alistair.Francis@wdc.com, qemu-devel@nongnu.org, wenmeng_zhang@c-sky.com, 
 kbastian@mail.uni-paderborn.de, wxy194768@alibaba-inc.com,
 palmer@sifive.com, 
 laurent@vivier.eu, sagark@eecs.berkeley.edu, qemu-riscv@nongnu.org, 
 riku.voipio@iki.fi
Content-Type: multipart/alternative; boundary="000000000000307e820592419546"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 00/17] RISC-V: support
 vector extension
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
X-List-Received-Date: Wed, 11 Sep 2019 07:01:18 -0000

--000000000000307e820592419546
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

11.09.2019. 08.35, "liuzhiwei" <zhiwei_liu@c-sky.com> =D1=98=D0=B5 =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> Features:
>   * support specification riscv-v-spec-0.7.1(
https://content.riscv.org/wp-content/uploads/2019/06/17.40-Vector_RISCV-201=
90611-Vectors.pdf
).

Hi, Zhivei.

The linked document is a presentation, outlining general concepts of the
instruction set in question, which is certainly useful and nice to have,
but, for review process, we need *specifications* (especially given that
they are in draft phase, and therefore "moving target"). Please provide
such link.

I also noticed lack of commit messages, and was really disappointed by
that. It looks to me you did not honor in entirety our guidlines for
submitting patches.

Yours,
Aleksandar

>   * support basic vector extension.

>   * support Zvlsseg.

>   * support Zvamo.

>   * not support Zvediv as it is changing.
>   * fixed VLEN 128bit.
>   * fixed SLEN 128bit.
>   * ELEN support 8bit, 16bit, 32bit, 64bit.
>
> Todo:
>   * support VLEN configure from qemu command line.
>   * move check code from execution-time to translation-time
>
> Changelog:
> V2
>   * use float16_compare{_quiet}
>   * only use GETPC() in outer most helper
>   * add ctx.ext_v Property
>
>
> LIU Zhiwei (17):
>   RISC-V: add vfp field in CPURISCVState
>   RISC-V: turn on vector extension from command line by cfg.ext_v
>     Property
>   RISC-V: support vector extension csr
>   RISC-V: add vector extension configure instruction
>   RISC-V: add vector extension load and store instructions
>   RISC-V: add vector extension fault-only-first implementation
>   RISC-V: add vector extension atomic instructions
>   RISC-V: add vector extension integer instructions part1,
>     add/sub/adc/sbc
>   RISC-V: add vector extension integer instructions part2, bit/shift
>   RISC-V: add vector extension integer instructions part3, cmp/min/max
>   RISC-V: add vector extension integer instructions part4, mul/div/merge
>   RISC-V: add vector extension fixed point instructions
>   RISC-V: add vector extension float instruction part1, add/sub/mul/div
>   RISC-V: add vector extension float instructions part2,
>     sqrt/cmp/cvt/others
>   RISC-V: add vector extension reduction instructions
>   RISC-V: add vector extension mask instructions
>   RISC-V: add vector extension premutation instructions
>
>  linux-user/riscv/cpu_loop.c             |     7 +
>  target/riscv/Makefile.objs              |     2 +-
>  target/riscv/cpu.c                      |     6 +-
>  target/riscv/cpu.h                      |    30 +
>  target/riscv/cpu_bits.h                 |    15 +
>  target/riscv/cpu_helper.c               |     7 +
>  target/riscv/csr.c                      |    65 +-
>  target/riscv/helper.h                   |   358 +
>  target/riscv/insn32.decode              |   373 +
>  target/riscv/insn_trans/trans_rvv.inc.c |   490 +
>  target/riscv/translate.c                |     1 +
>  target/riscv/vector_helper.c            | 25701
++++++++++++++++++++++++++++++
>  12 files changed, 27049 insertions(+), 6 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvv.inc.c
>  create mode 100644 target/riscv/vector_helper.c
>
> --
> 2.7.4
>
>

--000000000000307e820592419546
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
11.09.2019. 08.35, &quot;liuzhiwei&quot; &lt;<a href=3D"mailto:zhiwei_liu@c=
-sky.com">zhiwei_liu@c-sky.com</a>&gt; =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; Features:<br>
&gt; =C2=A0 * support specification riscv-v-spec-0.7.1(<a href=3D"https://c=
ontent.riscv.org/wp-content/uploads/2019/06/17.40-Vector_RISCV-20190611-Vec=
tors.pdf">https://content.riscv.org/wp-content/uploads/2019/06/17.40-Vector=
_RISCV-20190611-Vectors.pdf</a>).</p>
<p dir=3D"ltr">Hi, Zhivei.</p>
<p dir=3D"ltr">The linked document is a presentation, outlining general con=
cepts of the instruction set in question, which is certainly useful and nic=
e to have, but, for review process, we need *specifications* (especially gi=
ven that they are in draft phase, and therefore &quot;moving target&quot;).=
 Please provide such link.</p>
<p dir=3D"ltr">I also noticed lack of commit messages, and was really disap=
pointed by that. It looks to me you did not honor in entirety our guidlines=
 for submitting patches.</p>
<p dir=3D"ltr">Yours,<br>
Aleksandar</p>
<p dir=3D"ltr">&gt; =C2=A0 * support basic vector extension.=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <br>
&gt; =C2=A0 * support Zvlsseg.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; =C2=A0 * support Zvamo.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; =C2=A0 * not support Zvediv as it is changing.<br>
&gt; =C2=A0 * fixed VLEN 128bit.<br>
&gt; =C2=A0 * fixed SLEN 128bit.<br>
&gt; =C2=A0 * ELEN support 8bit, 16bit, 32bit, 64bit.<br>
&gt;<br>
&gt; Todo:<br>
&gt; =C2=A0 * support VLEN configure from qemu command line.<br>
&gt; =C2=A0 * move check code from execution-time to translation-time<br>
&gt;<br>
&gt; Changelog:<br>
&gt; V2<br>
&gt; =C2=A0 * use float16_compare{_quiet}<br>
&gt; =C2=A0 * only use GETPC() in outer most helper<br>
&gt; =C2=A0 * add ctx.ext_v Property<br>
&gt;<br>
&gt;<br>
&gt; LIU Zhiwei (17):<br>
&gt; =C2=A0 RISC-V: add vfp field in CPURISCVState<br>
&gt; =C2=A0 RISC-V: turn on vector extension from command line by cfg.ext_v=
<br>
&gt; =C2=A0 =C2=A0 Property<br>
&gt; =C2=A0 RISC-V: support vector extension csr<br>
&gt; =C2=A0 RISC-V: add vector extension configure instruction<br>
&gt; =C2=A0 RISC-V: add vector extension load and store instructions<br>
&gt; =C2=A0 RISC-V: add vector extension fault-only-first implementation<br=
>
&gt; =C2=A0 RISC-V: add vector extension atomic instructions<br>
&gt; =C2=A0 RISC-V: add vector extension integer instructions part1,<br>
&gt; =C2=A0 =C2=A0 add/sub/adc/sbc<br>
&gt; =C2=A0 RISC-V: add vector extension integer instructions part2, bit/sh=
ift<br>
&gt; =C2=A0 RISC-V: add vector extension integer instructions part3, cmp/mi=
n/max<br>
&gt; =C2=A0 RISC-V: add vector extension integer instructions part4, mul/di=
v/merge<br>
&gt; =C2=A0 RISC-V: add vector extension fixed point instructions<br>
&gt; =C2=A0 RISC-V: add vector extension float instruction part1, add/sub/m=
ul/div<br>
&gt; =C2=A0 RISC-V: add vector extension float instructions part2,<br>
&gt; =C2=A0 =C2=A0 sqrt/cmp/cvt/others<br>
&gt; =C2=A0 RISC-V: add vector extension reduction instructions<br>
&gt; =C2=A0 RISC-V: add vector extension mask instructions<br>
&gt; =C2=A0 RISC-V: add vector extension premutation instructions<br>
&gt;<br>
&gt; =C2=A0linux-user/riscv/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A07 +<br>
&gt; =C2=A0target/riscv/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A02 +-<br>
&gt; =C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A06 +-<br>
&gt; =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 30 +<br>
&gt; =C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 15 +<br>
&gt; =C2=A0target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A07 +<br>
&gt; =C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 65 +-<br>
&gt; =C2=A0target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0358 +<br>
&gt; =C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0373 +<br>
&gt; =C2=A0target/riscv/insn_trans/trans_rvv.inc.c |=C2=A0 =C2=A0490 +<br>
&gt; =C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A01 +<br>
&gt; =C2=A0target/riscv/vector_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 25701 ++++++++++++++++++++++++++++++<br>
&gt; =C2=A012 files changed, 27049 insertions(+), 6 deletions(-)<br>
&gt; =C2=A0create mode 100644 target/riscv/insn_trans/trans_rvv.inc.c<br>
&gt; =C2=A0create mode 100644 target/riscv/vector_helper.c<br>
&gt;<br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt;<br>
&gt;<br>
</p>

--000000000000307e820592419546--


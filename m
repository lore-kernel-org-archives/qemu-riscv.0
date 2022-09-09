Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWhhR-0003hj-K7
	for mharc-qemu-riscv@gnu.org; Fri, 09 Sep 2022 13:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oWhhP-0003e0-Gd
 for qemu-riscv@nongnu.org; Fri, 09 Sep 2022 13:21:51 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:42577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oWhhM-00062U-Sm
 for qemu-riscv@nongnu.org; Fri, 09 Sep 2022 13:21:51 -0400
Received: by mail-qt1-x82c.google.com with SMTP id x7so1615165qtv.9
 for <qemu-riscv@nongnu.org>; Fri, 09 Sep 2022 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Su3ISGG4372smQeXT3zgsSTyn3vhNFTlc1zBpjntIbs=;
 b=oP9JeDx85I1GEhxgraM5xGt9BsN+QA6bdBVwE0/W9HU9kkGTRAnu9KGjlw0tfPEspF
 /RBYBnEswsj9jiBFJEPJObf+dwGROsg1yOLAg5An9pnsi4yfjGiP58azdPK+X4d+poZL
 rVgAynXb5quj+ZT7qEcx3MnvnL8Nof4z83QSR6M5B8EcorZPhLtIpIJ63P61HTwRU+2S
 6E1g2s7ftB6UntdrtHfkDGcyNBOjfygL2uz1VkrGSyFQ2+jZuhRjRVUFnGWsvGsfrWZQ
 ytS+zhjJauVso6RMAbIhMhZ4gO6YZLg3WxZXpirysGCckCFIYgwIHFFpaT7+cUjH7qc3
 OkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Su3ISGG4372smQeXT3zgsSTyn3vhNFTlc1zBpjntIbs=;
 b=HesyUgD3+YLwonI5zHdjdtmttymi/Yq5StdNs77xvE/aIv+akECUtu9ySTvCbbo466
 fNJ0EoBKbOKEo2KeX1nnOdr3S7kqayi2qUthOrR73TCuHMFf56LEWgdu8x0c7AqCndW9
 2i6XqUKyc6+LGNborqSVQuyZoeIMNF5RKbKF1XfBQvmb49pQgRc0G0hzPb8hH4YWY6Oy
 Kk1EoXK4VybXmig21eXqFi6B0Jti5swcG7fBq1yRAv7BLDUubFeZ0IhMwwzi9HW50dUU
 Dj48D5ql1wB30oA2wiFycjL5EVeLaywEudjGsFNi1wBGaux6zSWoZ1LoYCih9zIuBNe7
 dp+Q==
X-Gm-Message-State: ACgBeo1bR41iSGWaxyN0hX2Rh2Cca7Xv1wwnsYiXrZTlTar2kmVOiQuf
 g/ArFagSY5otcKOsyg0N+aVKhN/IV1L/xTsfUhJCEg==
X-Google-Smtp-Source: AA6agR4As4QIg2NP915OkanWoOWMVHVy7AGXITv9XidJCXcNh0Jp02OFoNaSCMyeFQERC9SAxvGACVCO60vEdu4Zf2o=
X-Received: by 2002:ac8:5e4c:0:b0:343:423:e736 with SMTP id
 i12-20020ac85e4c000000b003430423e736mr13537482qtx.490.1662744106888; Fri, 09
 Sep 2022 10:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-11-christoph.muellner@vrull.eu>
 <13c9f7be-d8b8-37aa-ee99-79056e11e30c@linaro.org>
In-Reply-To: <13c9f7be-d8b8-37aa-ee99-79056e11e30c@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 9 Sep 2022 19:21:36 +0200
Message-ID: <CAEg0e7hVJx8EJDSNswuCVt=Z3CnrwcLxpocPrV8k=rG2JVgjnw@mail.gmail.com>
Subject: Re: [PATCH 10/11] RISC-V: Adding T-Head FMemIdx extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Nelson Chu <nelson@rivosinc.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Cooper Qu <cooper.qu@linux.alibaba.com>, 
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>, 
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="000000000000d8056f05e841c736"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 09 Sep 2022 17:21:51 -0000

--000000000000d8056f05e841c736
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 9:45 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/6/22 13:22, Christoph Muellner wrote:
> > @@ -732,6 +733,7 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
> >   #include "decode-xtheadbs.c.inc"
> >   #include "decode-xtheadcmo.c.inc"
> >   #include "decode-xtheadcondmov.c.inc"
> > +#include "decode-xtheadfmemidx.c.inc"
> >   #include "decode-xtheadmac.c.inc"
> >   #include "decode-xtheadmemidx.c.inc"
> >   #include "decode-xtheadmempair.c.inc"
> > @@ -1061,6 +1063,7 @@ static void decode_opc(CPURISCVState *env,
> DisasContext *ctx, uint16_t opcode)
> >           { has_xtheadbs_p, decode_xtheadbs },
> >           { has_xtheadcmo_p, decode_xtheadcmo },
> >           { has_xtheadcondmov_p, decode_xtheadcondmov },
> > +        { has_xtheadfmemidx_p, decode_xtheadfmemidx },
> >           { has_xtheadmac_p, decode_xtheadmac },
> >           { has_xtheadmemidx_p, decode_xtheadmemidx },
> >           { has_xtheadmempair_p, decode_xtheadmempair },
>
> I think you should have a single decoder for all of the xthread
> extensions, and each
> translate function should test for the individual extension.  You know
> up-front that these
> extensions do not conflict.
>
>
Ok, I will restructure the series and use a single decoder.

Thanks!


>
> r~
>

--000000000000d8056f05e841c736
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 8, 2022 at 9:45 AM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 9/6/22 13:22, Christoph Muellner wrote:<br>
&gt; @@ -732,6 +733,7 @@ static int ex_rvc_shifti(DisasContext *ctx, int im=
m)<br>
&gt;=C2=A0 =C2=A0#include &quot;decode-xtheadbs.c.inc&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;decode-xtheadcmo.c.inc&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;decode-xtheadcondmov.c.inc&quot;<br>
&gt; +#include &quot;decode-xtheadfmemidx.c.inc&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;decode-xtheadmac.c.inc&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;decode-xtheadmemidx.c.inc&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;decode-xtheadmempair.c.inc&quot;<br>
&gt; @@ -1061,6 +1063,7 @@ static void decode_opc(CPURISCVState *env, Disas=
Context *ctx, uint16_t opcode)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ has_xtheadbs_p, decode_xthea=
dbs },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ has_xtheadcmo_p, decode_xthe=
adcmo },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ has_xtheadcondmov_p, decode_=
xtheadcondmov },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { has_xtheadfmemidx_p, decode_xtheadfmemi=
dx },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ has_xtheadmac_p, decode_xthe=
admac },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ has_xtheadmemidx_p, decode_x=
theadmemidx },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ has_xtheadmempair_p, decode_=
xtheadmempair },<br>
<br>
I think you should have a single decoder for all of the xthread extensions,=
 and each <br>
translate function should test for the individual extension.=C2=A0 You know=
 up-front that these <br>
extensions do not conflict.<br>
<br></blockquote><div><br></div><div>Ok, I will restructure the series and =
use a single decoder.</div><div><br></div><div>Thanks!</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--000000000000d8056f05e841c736--


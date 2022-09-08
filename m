Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWCp8-0001PC-Eo
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 04:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oWCp5-0001Mc-BF
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 04:23:43 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:33578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oWCp2-0000CK-Nt
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 04:23:42 -0400
Received: by mail-qt1-x82e.google.com with SMTP id cb8so12349735qtb.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Sep 2022 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ehIwG4j3oYHIzz+fz6uRjAklhgZMvH58r/GiAT7C+s0=;
 b=P/sBjwA7azj1IWcTS7iI+WjYEHjefZyAfbYBoi5qT5rPkHE3SR5wJLAWG21DEf/Abc
 SK0mT5OUdUTvPt4obOt6x4WSXDcOwbUPq43phJ+V382kO4HzeAPTIp9toRGC60nyAS+U
 90d5LDVYy47w7k597SkN7R3mS+fjg0YvOp9V7n19n0JOZW5uscbBR8BuJNxuysY9lelw
 7TmITJSlRUkZDq2YQ0yVKQsa2Sx7T8wHC18WYSQ3ZCJLinDYH22TMYqU3XaXRHYSSIA8
 6TEIzmNdouoaMzhHzJP2dSt6rU3dBOTyF7MonNl1Qtq7k9UT3uTGqfcch0Jm0ziwPhR0
 1y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ehIwG4j3oYHIzz+fz6uRjAklhgZMvH58r/GiAT7C+s0=;
 b=EksaIW+kuEPJjtQIsFhe+sn7GbuDI9sHo4uN5QbMOyJdK18NRlmWopge7k23qqa2qe
 BNK3/LNNM8GlIIYIN8qUG4jUuOYSQYiZVvCkr7g5+Bis9LsDes6400nscFQVDE9xTQ8C
 GjFctiakbJN3/2DOKVjE5dmIvXxxMS3APhK1W9Zpn7V3wa1TX2suhtuq8CIBOIADNDLi
 LmN/tI5R9wyK53ASHabDpUyO8QJb9KvyyAyBDlGWVKCHvgt+xNUTifdWpOTnDbKlTV5O
 1XmhermVbO1jSFyYT/ChDggnfDPyF3v9e5nUdRzuBXfpuLcfTIDKTmcgC6atOFQ7Rmsi
 fhVg==
X-Gm-Message-State: ACgBeo38ZYMyXPzBwY0q9d0XLRyzUjpU966T2Xwy7wtgh07iibQuR6zP
 fCiwuSMXrhRSm+NelPsnFnHDV4JxC64g+tie2fan/A==
X-Google-Smtp-Source: AA6agR73kClQYPXjaiARNkd/nsIkbBh6EKjjzYM5aAShm1xFSd54gYcZHOURSfPettsE5P+tYgepnUPC9/gd2h2y94w=
X-Received: by 2002:ac8:570d:0:b0:343:63be:e072 with SMTP id
 13-20020ac8570d000000b0034363bee072mr6815895qtw.267.1662625418765; Thu, 08
 Sep 2022 01:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-12-christoph.muellner@vrull.eu>
 <9eba2b9e-ebe0-bf2d-2dc7-75ae81b0592e@linaro.org>
In-Reply-To: <9eba2b9e-ebe0-bf2d-2dc7-75ae81b0592e@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 8 Sep 2022 10:23:27 +0200
Message-ID: <CAEg0e7jEh+ix32xGs+BdpCZOCT9YAFC_Lb5Ti-FQcFJiDtHmnQ@mail.gmail.com>
Subject: Re: [PATCH 11/11] RISC-V: Add initial support for T-Head C906 and
 C910 CPUs
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
Content-Type: multipart/alternative; boundary="0000000000007b04fc05e8262537"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-qt1-x82e.google.com
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
X-List-Received-Date: Thu, 08 Sep 2022 08:23:43 -0000

--0000000000007b04fc05e8262537
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 9:46 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/6/22 13:22, Christoph Muellner wrote:
> > +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,
>  rv64_thead_c906_cpu_init),
> > +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C910,
>  rv64_thead_c906_cpu_init),
>
> Why model both if they're identical?
>

I figured that users might expect that (existence of "thead-c906" and
"thead-c910").
And using "thead-c9xx" feels like it would be regretted in the future.

Should I drop "thead-c910"?



>
>
> r~
>

--0000000000007b04fc05e8262537
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 8, 2022 at 9:46 AM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 9/6/22 13:22, Christoph Muellner wrote:<br>
&gt; +=C2=A0 =C2=A0 DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0rv64_thead_c906_cpu_init),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C910,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0rv64_thead_c906_cpu_init),<br>
<br>
Why model both if they&#39;re identical?<br></blockquote><div><br></div><di=
v>I figured that users might expect that (existence of &quot;thead-c906&quo=
t; and &quot;thead-c910&quot;).</div><div>And using &quot;thead-c9xx&quot; =
feels like it would be regretted in the future.</div><div><br></div><div>Sh=
ould I drop &quot;thead-c910&quot;?</div><div><br></div><div>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
r~<br>
</blockquote></div></div>

--0000000000007b04fc05e8262537--


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbtxp-0004It-39
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 20:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbtxm-0004Ic-K5
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 20:23:42 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:38760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbtxk-0000ni-Ng
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 20:23:42 -0400
Received: by mail-il1-x136.google.com with SMTP id h27so5390240ila.5
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 17:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y7fQ/fjm1fP3lo1s39k3qR7q4hjzXTxkw+M3G7OV1eU=;
 b=HeeUskgMbRo6woquRw8//8S59k4hEBHT8IO9D9WsIWd19sJIultvp+Mw1w5ZNPD4On
 lH5UPzlOFrRgBd6y1xrwPwFtRxfwKjjGWh+ba5+RpXcQRlAVQz3fJI7vlVaNF/4OQWVG
 ikHIxE+c3u2I0WKBzrPLZRyAqjA6Ny3fRfO4WslxlKNUQP0NWLPN4+mf6TWD4/2T1jmX
 ccc72FOTjgSI4dTO36RQwCLGAWpXj9/UNZnMQoS/ejDMXZ4jUSjqqInwgOfNht0bp75i
 uULHT3s0C7hicogmMA5xJl+7PffHqbCcDJlstoqFZULI4vA2/XsEjX/wmABQxQC42ura
 MVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y7fQ/fjm1fP3lo1s39k3qR7q4hjzXTxkw+M3G7OV1eU=;
 b=zhG2RrC95azPxsp1Zdqok5Jllmb1Y3vLVQxwWOBZC971oYZzGkbB3eK2SBu8n0UMzC
 4IxBV51Xgvv6my6tPEPoY+Bqxnfy5MYgtD+ca9My6gOI4pIHyyAB3jA0daIbf+X5/xZj
 L2rPNLtmK+Qm7ipRrY/N7eGC0VzjPGlTRuFd+XIiBvlo7tHpbiWqbUBWzjeauCVvhJlV
 Y5krOvawuypIp4w/7/WvalbOmmJEbSVaoZ4eT08lXKzbaJhyYAPTu0KOP+k1dDuDv4S/
 72yJkn1dU5RWxV54J5zrnkqkPR4QBBUXt48GkSOtMYLJ8TdQe1fPIH5A/80O8+/rsQfS
 3a1A==
X-Gm-Message-State: AOAM532Rdh3mnChEF7R3hyK4sxewhf8pZsmAhLvsnQKK8HDCjUf5HRaF
 f77hV1Y03R9FnFg1pMAC4bZ+l2Xy2G9dw7Pvs4bZdA==
X-Google-Smtp-Source: ABdhPJxQrGA1qLItmgva/vCT2ieK66jVHFw/FLG9yETCHlI6C443ZLrEYkCQAgjhzhqIrXEiXUNIW8GyESjHBBI3i5Y=
X-Received: by 2002:a05:6e02:1b88:: with SMTP id
 h8mr9091301ili.200.1634430218731; 
 Sat, 16 Oct 2021 17:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211016090742.3034669-1-frank.chang@sifive.com>
 <e05ac0c9-3be7-7270-e46b-4da82466ad0e@linaro.org>
In-Reply-To: <e05ac0c9-3be7-7270-e46b-4da82466ad0e@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 17 Oct 2021 08:23:27 +0800
Message-ID: <CAE_xrPj3DG3aQ_E0pnrUxW6znWJAbq5D=sxxhcPnbXtBH012ow@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] target/riscv: support Zfh, Zfhmin extension v0.1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009918b305ce8170ef"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=frank.chang@sifive.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sun, 17 Oct 2021 00:23:42 -0000

--0000000000009918b305ce8170ef
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 17, 2021 at 2:03 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/16/21 2:07 AM, frank.chang@sifive.com wrote:
> > Changelog:
> >
> > v3:
> >    * Use the renamed softfloat min/max APIs: *_minimum_number()
> >      and *_maximum_number().
> >    * Pick softfloat min/max APIs based on CPU privilege spec version.
>
> So... Given that Zfh 0.1 post-dates F 2.2, does that mean that Zfh should
> always use the
> 2019 functions?
>

Hi Richard,

That's what I thought, but Zfh spec says:

"This chapter describes the Zfh standard extension for 16-bit
half-precision binary floating-point
instructions compliant with the IEEE 754-2008 arithmetic standard. The Zfh
extension depends on
the single-precision floating-point extension, F."

The spec doesn't illustrate too much about how fmin.h/fmax.h should behave,
so that's why I took the same approach just like fmin and fmax for RVF in
my other patchset.

If that's not acceptable, I can change back to use IEEE 754-2019 for Zfh
extension.

Thanks,
Frank Chang


>
> r~
>

--0000000000009918b305ce8170ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Oct 17, 2021 at 2:03 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 10/16/21 2:07 AM, <a href=3D"ma=
ilto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> w=
rote:<br>
&gt; Changelog:<br>
&gt; <br>
&gt; v3:<br>
&gt;=C2=A0 =C2=A0 * Use the renamed softfloat min/max APIs: *_minimum_numbe=
r()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 and *_maximum_number().<br>
&gt;=C2=A0 =C2=A0 * Pick softfloat min/max APIs based on CPU privilege spec=
 version.<br>
<br>
So... Given that Zfh 0.1 post-dates F 2.2, does that mean that Zfh should a=
lways use the <br>
2019 functions?<br></blockquote><div><br></div><div>Hi Richard,</div><div><=
br></div><div>That&#39;s what I thought, but Zfh spec says:</div><div><br><=
/div><div>&quot;This chapter describes the Zfh standard extension for 16-bi=
t half-precision binary floating-point</div>instructions compliant with the=
 IEEE 754-2008 arithmetic standard. The Zfh extension depends on<br>the sin=
gle-precision floating-point extension, F.&quot;</div><div class=3D"gmail_q=
uote"><br></div><div class=3D"gmail_quote">The spec doesn&#39;t illustrate =
too much about how fmin.h/fmax.h should behave,</div><div class=3D"gmail_qu=
ote">so=C2=A0that&#39;s why I took the same approach just like fmin and fma=
x for RVF in my other patchset.<br><div>=C2=A0<br></div><div>If that&#39;s =
not acceptable, I can change back to use IEEE 754-2019 for Zfh extension.</=
div><div><br></div><div>Thanks,</div><div>Frank Chang</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
r~<br>
</blockquote></div></div>

--0000000000009918b305ce8170ef--


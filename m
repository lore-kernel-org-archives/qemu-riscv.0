Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2pK8-0003PI-NN
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 01:54:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2pK6-0003OS-Nv
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 01:54:02 -0500
Received: from [2a00:1450:4864:20::52d] (port=36494
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2pK4-0005Lk-GG
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 01:54:01 -0500
Received: by mail-ed1-x52d.google.com with SMTP id q14so86828437edi.3
 for <qemu-riscv@nongnu.org>; Wed, 29 Dec 2021 22:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oNSKoCvNhbRAFj52JLhst065tlCyAb3FicuwrhQvoNg=;
 b=MV9wZci/MGy74e6HmVKMyQuJwgWpHLwAZXFcxqWRprkTaV9ouw2ASyw3YcDEtDM9xy
 +uUnB6/S/QqddVfDUGw06T6EjwWuM78sG8p1+pojZdIRpkCIR16SLM3XeeTJdP0izpAk
 Xn39MaICH+FdPjx3Gf4WJVs2AKWdZG6+fdHUmYi23NKuMSt6QClato6mguI1bxNP14yg
 iITfM9HK05ogZKQfIzoVJqCX1CkRvuNqGywCeamiy9KCnZ1tj+fZMFLFo6l4I42uAAqy
 3Az9HkzYaLs0Xx6bnU0Esf3mlz/vWivYzL49R0XeHn/TkwWa5A+ljgILK0z+2PXgfTLJ
 jNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oNSKoCvNhbRAFj52JLhst065tlCyAb3FicuwrhQvoNg=;
 b=p+S/X7k0WwJ7KFsCy3hc4UroJvscGIYWJ2w7R386txVvwmpaoFwo3pOuhm4FxO9A7r
 /ohNIhtPoC0ZpT0QW/x0vze6MekwNSffaYIqCNirAiC/KSU3iWQMQC2DTqWxO9SUVWfg
 y0QTBgdMtwX0t91N1IdulKwY+8vHF1II6zfud1aGFlAH9e6JvMlairFVDng+eXjx53Hw
 PTPeEseI96xl8x+229/OdTG8vhNi0S9UWKyHCI5nks1HAPF+eVTF23QGOaWxqY5J4eAo
 1pzJicqyXpACy4LTX3Zg9fkg+fwu8g/dkEg8V3c4OPBYXJURd4PaxxGARzNzVxmHDS19
 t/yg==
X-Gm-Message-State: AOAM533N1/dizZrT64Qj44uQeof9DQemEXAs1Gv5vfKsy/OSUEWbPlsY
 hsVRQiom82Bxkdixw6SLx5RdBS313cvpwScbfCrGlQ==
X-Google-Smtp-Source: ABdhPJyieaOngA4gGUsH82bQ+6TiqafcqcUs563Q/IlQyg5CSV5wckp24daEkce/1DU9MdvYcgnDTZ5wZJlRldBR8JQ=
X-Received: by 2002:a17:907:1c17:: with SMTP id
 nc23mr23262748ejc.549.1640847238376; 
 Wed, 29 Dec 2021 22:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20211229021250.29804-1-frank.chang@sifive.com>
 <CANzO1D2aLFo-H_R9GL67HMF-3UUDFQW4osZuC1O7m4BpHDh4JQ@mail.gmail.com>
In-Reply-To: <CANzO1D2aLFo-H_R9GL67HMF-3UUDFQW4osZuC1O7m4BpHDh4JQ@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 30 Dec 2021 14:53:47 +0800
Message-ID: <CAE_xrPihv+j07vCXyfy4nExBckhE=JszhJE=gYfF8S=cSr=_4A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix RVV calling incorrect RFV/RVD check functions bug
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c6441005d45784eb"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 06:54:03 -0000

--000000000000c6441005d45784eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 29, 2021 at 10:43 AM Frank Chang <frank.chang@sifive.com> wrote=
:

> <frank.chang@sifive.com> =E6=96=BC 2021=E5=B9=B412=E6=9C=8829=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8810:13=E5=AF=AB=E9=81=93=EF=BC=9A
>
>> From: Frank Chang <frank.chang@sifive.com>
>>
>> For vector widening and narrowing floating-point instructions, we should
>> use require_scale_rvf() instead of require_rvf() to check whether the
>> correspond RVF/RVD is enabled if either source or destination
>> floating-point operand is double-width of SEW. Otherwise, illegal
>> instruction exception should be raised.
>>
>> e.g. For SEW=3D16, if the source/destination floating-point operand is
>> double-width of SEW, RVF needs to be enabled. Otherwise, an illegal
>> instruction exception will be raised. Similarly, for SEW=3D32, RVD
>> needs to be enabled.
>>
>> Frank Chang (3):
>>   target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
>>     widening fp insns
>>   target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
>>     widening fp/int type-convert insns
>>   target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
>>     narrowing fp/int type-convert insns
>
>
> Oops, I misspell the word "function" in the patch titles.
> I will correct it in my next patchset.
>
> Regards,
> Frank Chang
>

I also missed the 'Signed-off-by' in this patch series.
Will also fix it in my next-version patchset.

Regards,
Frank Chang


>
>
>>
>
>
>>  target/riscv/insn_trans/trans_rvv.c.inc | 78 ++++++++++++++++++-------
>>  1 file changed, 57 insertions(+), 21 deletions(-)
>>
>> --
>> 2.31.1
>>
>>
>>

--000000000000c6441005d45784eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Dec 29, 2021 at 10:43 AM Frank Ch=
ang &lt;<a href=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">&lt;<a href=3D"ma=
ilto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&g=
t; =E6=96=BC 2021=E5=B9=B412=E6=9C=8829=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=
=8A=E5=8D=8810:13=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Frank Chang &=
lt;<a href=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@=
sifive.com</a>&gt;<br>
<br>
For vector widening and narrowing floating-point instructions, we should<br=
>
use require_scale_rvf() instead of require_rvf() to check whether the<br>
correspond RVF/RVD is enabled if either source or destination<br>
floating-point operand is double-width of SEW. Otherwise, illegal<br>
instruction exception should be raised.<br>
<br>
e.g. For SEW=3D16, if the source/destination floating-point operand is<br>
double-width of SEW, RVF needs to be enabled. Otherwise, an illegal<br>
instruction exception will be raised. Similarly, for SEW=3D32, RVD<br>
needs to be enabled.<br>
<br>
Frank Chang (3):<br>
=C2=A0 target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for<br=
>
=C2=A0 =C2=A0 widening fp insns<br>
=C2=A0 target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for<br=
>
=C2=A0 =C2=A0 widening fp/int type-convert insns<br>
=C2=A0 target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for<br=
>
=C2=A0 =C2=A0 narrowing fp/int type-convert insns</blockquote><div><br></di=
v><div>Oops, I misspell the word &quot;function&quot; in the patch titles.<=
/div><div>I will correct it in my next patchset.</div><div><br></div><div>R=
egards,</div><div>Frank Chang</div></div></div></blockquote><div><br></div>=
<div>I also missed the &#39;Signed-off-by&#39; in this patch series.</div><=
div>Will also fix it in my next-version patchset.</div><div><br></div><div>=
Regards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0target/riscv/insn_trans/trans_rvv.c.inc | 78 ++++++++++++++++++------=
-<br>
=C2=A01 file changed, 57 insertions(+), 21 deletions(-)<br>
<br>
--<br>
2.31.1<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000c6441005d45784eb--


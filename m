Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jv1Zb-0007Ue-NL
	for mharc-qemu-riscv@gnu.org; Mon, 13 Jul 2020 12:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jv1Za-0007SQ-0i
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2020 12:44:58 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:43965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jv1ZV-0005sD-OY
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2020 12:44:57 -0400
Received: by mail-ot1-x329.google.com with SMTP id 95so9998258otw.10
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2020 09:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jOtSgHvTH7s0OuQ8fbSDZ9rzu8A+YXh1qYNF+PxSMMA=;
 b=M2J+OQLclqqSKITm6iD0W5TdKXGnMlZFShvNrS2Jj0ulCdQaIvsVby23XGEhoETSBR
 VyAC6nfLh1FQjVGJj4Y7Rzi3kUD1PF2EZ9QWR0LHyG9i92PgNbbA5hnrm8ccm/oeXjV7
 mia3tPpW+4j4scRnWGqZDADVCNySDffbGiLI5f/Sou61pRCVKewGBkp7ALa53u1AYEtw
 9Joknfs424MaiAArIooexW9JAph28wuP+nLfCDFk9F4K5gclKVZhnWGvEZ7tvrn7HduR
 u7DWLfcl69nO72CsDDsDfCzhBp1LA32sLpuntZTMGGFJuyUKLh7kxbCs5r40llttYDCv
 b7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jOtSgHvTH7s0OuQ8fbSDZ9rzu8A+YXh1qYNF+PxSMMA=;
 b=kDp/k9URp31D0zYNqazNQ+Ns09/KzWrpfzQ602x0wG7nC8n9XbzvxXtYmLTFv5rDrK
 sd4fw4x/idnyRlk8afkz/HxExbIZEcd4AR+QSy41nZB5fnALTnn4/gQPKDjF4A1jWbPa
 4Kt2lBuy3A5SbfbqmGYHRpH3vasStAyNgOmgwSwTD1YW8DuxrSWsrWF4746Nb8m9NriV
 Veh3bpMboWf3lkx1Q2Xa1sE30k53c21o7R8dVTZxbjC5wcddM1bF7KaGCUnNhlZIvGLo
 bq9OJ9cZb7raTvNn1lNj8vLPiYO1csjkGBIa/94hKgWj/ap1LpbKookC/upqDSKjo8iz
 xOaA==
X-Gm-Message-State: AOAM532eu8MsgtCK/A0zwddB8pOCIFfHusWGybEscANsX/cEobyh6l3V
 mC9dTSeX/hpYaAE1YyPrirnTcRSJSXn9+lldeCNdUg==
X-Google-Smtp-Source: ABdhPJyYbENVOPEIXO6NG/1avsukhYQosPNL8BkEJLAYI0vvsDIfkYRhBoZdM/ZOT4lW1fwdDd9HrEIKHFm09NEm/9A=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr428531oti.139.1594658692270; 
 Mon, 13 Jul 2020 09:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <CAKmqyKPtKtD=G+tXcd2Y-TM2go1TWbETHK2e3vdN-ehHyHU9-w@mail.gmail.com>
 <CAE_xrPhEW_VSRQVkthwu0NmBQYBZ11phLRgSbFqqFc9wZZ38Xg@mail.gmail.com>
 <4a5140da-eda6-a40a-c803-5094a0d5abea@linaro.org>
In-Reply-To: <4a5140da-eda6-a40a-c803-5094a0d5abea@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 14 Jul 2020 00:44:41 +0800
Message-ID: <CAE_xrPgaMK-vYMDMGHAKq-S9WkjX2d6A34cOWoFLEkmiCb+Ctg@mail.gmail.com>
Subject: Re: [RFC 00/65] target/riscv: support vector extension v0.9
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e4217205aa556878"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x329.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 13 Jul 2020 16:44:58 -0000

--000000000000e4217205aa556878
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 14, 2020 at 12:41 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 7/12/20 7:02 PM, Frank Chang wrote:
> > Does decodetree support any feature for multi-version opcodes?
> > Or if it can use something like C macros to compile with the opcodes by
> the vspec
> > user assigned? If there's any good way to keep both versions, then I can
> try to
> > rearrange
> > my codes to support both vspecs.
>
> There is a way, using { } to indicate where overlap is allowed.  The
> trans_*
> functions checks the ISA version, and return false.  Which causes the next
> matching overlapping pattern to be used, etc.  Have a look at some of the
> ARM
> decodetree files.
>
> But since Alisair is happy dropping 0.7.1 support, we should do that.  It
> will
> be cleaner not to have to retain the backward compatibility.
>
>
> r~
>

That makes sense to me.
Thanks to Alisair and Richard's feedback.

Frank Chang

--000000000000e4217205aa556878
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jul 14, 2020 at 12:41 AM Richard =
Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hende=
rson@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 7/12/20 7:02 PM, Frank Chang w=
rote:<br>
&gt; Does decodetree support any feature for multi-version opcodes?<br>
&gt; Or if it can use something like C macros to compile with the opcodes b=
y the vspec<br>
&gt; user assigned? If there&#39;s any good way to keep both versions, then=
 I can try to<br>
&gt; rearrange<br>
&gt; my codes to support both vspecs.<br>
<br>
There is a way, using { } to indicate where overlap is allowed.=C2=A0 The t=
rans_*<br>
functions checks the ISA version, and return false.=C2=A0 Which causes the =
next<br>
matching overlapping pattern to be used, etc.=C2=A0 Have a look at some of =
the ARM<br>
decodetree files.<br>
<br>
But since Alisair is happy dropping 0.7.1 support, we should do that.=C2=A0=
 It will<br>
be cleaner not to have to retain the backward compatibility.<br>
<br>
<br>
r~<br></blockquote><div><br></div><div>That makes sense to=C2=A0me.</div><d=
iv>Thanks to=C2=A0Alisair and Richard&#39;s feedback.</div><div><br></div><=
div>Frank Chang</div></div></div>

--000000000000e4217205aa556878--


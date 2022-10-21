Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oljfO-0001oM-OJ
	for mharc-qemu-riscv@gnu.org; Fri, 21 Oct 2022 00:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oljfL-0001nT-Nm
 for qemu-riscv@nongnu.org; Fri, 21 Oct 2022 00:29:52 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oljfK-0007Fy-0I
 for qemu-riscv@nongnu.org; Fri, 21 Oct 2022 00:29:51 -0400
Received: by mail-ej1-x631.google.com with SMTP id d26so4267971ejc.8
 for <qemu-riscv@nongnu.org>; Thu, 20 Oct 2022 21:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BTzgjLT/a7PzG3pt6gQTC3yOECKGKKrj4lCfSiSELTk=;
 b=IlCuREVgBBMCqxkD04RySMggheElYsH8MuwhGTM6iV6YLVadX1+n4enkOetSIGBCd1
 MFmLIDNFMMHyRmCsuNEvUQN4f3Y3dj8JFXAu+Me5RMtRwXFxN8oZO3BnfVGgLALvW9ZD
 uyEDfIvxVdBE0JvQQWvYjTxJ8iZIWThttAcB4U7QhStJFYe4DYa89YoRrjGJwFsQ1AJe
 pxVm58eQ7BcAO6H11hALY4uIQMpum5krcx/iG2bb4xb78Nnh/ekbemT+5GZrC8IIdLcV
 7KWcemHtTXZMcveJqgU/6Z7OY3WASozH1A7mjn8yqtE8+KTWfd1TfetoKKkP1gfzMtah
 9cGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BTzgjLT/a7PzG3pt6gQTC3yOECKGKKrj4lCfSiSELTk=;
 b=KbYIQca70GZV/qVBJZ6kBJdmrXVnyH1JA2uhdWs4LgMoXibjZLyl1/yqkqWS8Cp72Y
 jX29YnhoUXPMg/9S6b/kjNSbAkQvwYMOpPppQNH1xpN4EM1wR7egecWhutXg3R40J8zV
 UmHZIvnDDYH1rk3Z33ISHme2ifbR5SA89kRePb3lKmE44d4AnS1TNRCH5Ws/ST/4QrEQ
 AaEhrdbtsbddiLWJMQwc/hCBr5eif2JHu5MWOo8obLowzR/tp6V6D0sjIAGZMk1HH7/X
 TzusimVXKbq1h1OPaCusgpMT6GNejliFBVSMbaEnKihAYMKVayi4alWnKYazlKgLUyrA
 0jFA==
X-Gm-Message-State: ACrzQf3JE8eUffzRW0uyI/uHZIRSpOxKvSjZUQf8HyKkG0SlpHB0B6kz
 ozcBCjL2K/bDgP9eKlbwzAqXh4gzYAIEIS0XThayvQ==
X-Google-Smtp-Source: AMsMyM5YXDucnxxXnoekqOpmTdqWYmfHxhOKaSjYwvpBh21wiNRycMhxz0AAZRlr9jk+6u4vl1HqFkyHiD4aGwf4+kU=
X-Received: by 2002:a17:906:ef8f:b0:78e:28e7:6c64 with SMTP id
 ze15-20020a170906ef8f00b0078e28e76c64mr14234827ejb.165.1666326587477; Thu, 20
 Oct 2022 21:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
 <20221020104154.4276-3-zhiwei_liu@linux.alibaba.com>
 <49246207-2202-0239-65f5-1f0b44d8bd64@linaro.org>
 <0cd94ce7-eeb8-c175-cfb1-c584f494bc57@linux.alibaba.com>
In-Reply-To: <0cd94ce7-eeb8-c175-cfb1-c584f494bc57@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Fri, 21 Oct 2022 14:29:36 +1000
Message-ID: <CAFXwXrkDhKO_wE3m7KWzJ9-WaDH-XK14_0QEaw_usEyfueFFbg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] tcg/riscv: Fix tcg_out_opc_imm when imm exceeds
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, lzw194868@alibaba-inc.com
Content-Type: multipart/alternative; boundary="00000000000053a7cb05eb83e475"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x631.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2022 04:29:53 -0000

--00000000000053a7cb05eb83e475
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Oct 2022, 12:57 LIU Zhiwei, <zhiwei_liu@linux.alibaba.com> wrote:

>
> On 2022/10/20 19:22, Richard Henderson wrote:
> > On 10/20/22 20:41, LIU Zhiwei wrote:
> >> TYPE-I immediate can only represent a signed 12-bit value. If immediate
> >> exceed, mov it to an register.
> >>
> >> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> >> ---
> >>   tcg/riscv/tcg-target.c.inc | 28 +++++++++++++++++++++++-----
> >>   1 file changed, 23 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> >> index 32f4bc7bfc..bfdf2bea69 100644
> >> --- a/tcg/riscv/tcg-target.c.inc
> >> +++ b/tcg/riscv/tcg-target.c.inc
> >> @@ -668,7 +668,12 @@ static void tcg_out_addsub2(TCGContext *s,
> >>       if (!cbh) {
> >>           tcg_out_opc_reg(s, (is_sub ? opc_sub : opc_add), th, ah, bh);
> >>       } else if (bh != 0 || ah == rl) {
> >> -        tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));
> >> +        if (bh == sextract(bh, 0, 12)) {
> >> +            tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));
> >> +        } else {
> >> +            tcg_out_movi(s, TCG_TYPE_TL, th, (is_sub ? -bh : bh));
> >> +            tcg_out_opc_reg(s, opc_add, th, ah, th);
> >> +        }
> >
> > This value is currently constrained by 'M': +/- 0xfff.
>
> I don't know why we need 'M'. Can I just use the constraint
>
> C_O2_I4(r, r, rZ, rZ, rS, rS);
>

I see the problem now. Look at the top of tcg_out_addsub2, where we
(conditionally) negate the constant.

We want to constrain the constant to be representable either positive or
negative, i.e not -4096..4095 but -4095..4095.  But we got the endpoints
wrong in tcg_target_const_match: 0xfff instead of 0x7ff.


r~

--00000000000053a7cb05eb83e475
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div data-smartmail=3D"gmail_signature">On Fri, 21 O=
ct 2022, 12:57 LIU Zhiwei, &lt;<a href=3D"mailto:zhiwei_liu@linux.alibaba.c=
om">zhiwei_liu@linux.alibaba.com</a>&gt; wrote:</div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><br>
On 2022/10/20 19:22, Richard Henderson wrote:<br>
&gt; On 10/20/22 20:41, LIU Zhiwei wrote:<br>
&gt;&gt; TYPE-I immediate can only represent a signed 12-bit value. If imme=
diate<br>
&gt;&gt; exceed, mov it to an register.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@linux.a=
libaba.com" target=3D"_blank" rel=3D"noreferrer">zhiwei_liu@linux.alibaba.c=
om</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 tcg/riscv/tcg-target.c.inc | 28 +++++++++++++++++++++++----=
-<br>
&gt;&gt; =C2=A0 1 file changed, 23 insertions(+), 5 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.i=
nc<br>
&gt;&gt; index 32f4bc7bfc..bfdf2bea69 100644<br>
&gt;&gt; --- a/tcg/riscv/tcg-target.c.inc<br>
&gt;&gt; +++ b/tcg/riscv/tcg-target.c.inc<br>
&gt;&gt; @@ -668,7 +668,12 @@ static void tcg_out_addsub2(TCGContext *s,<br=
>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!cbh) {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_out_opc=
_reg(s, (is_sub ? opc_sub : opc_add), th, ah, bh);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (bh !=3D 0 || ah =3D=3D r=
l) {<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_out_opc_imm(s, opc=
_addi, th, ah, (is_sub ? -bh : bh));<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bh =3D=3D sextract=
(bh, 0, 12)) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 tcg_out_movi(s, TCG_TYPE_TL, th, (is_sub ? -bh : bh));<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 tcg_out_opc_reg(s, opc_add, th, ah, th);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;<br>
&gt; This value is currently constrained by &#39;M&#39;: +/- 0xfff.<br>
<br>
I don&#39;t know why we need &#39;M&#39;. Can I just use the constraint<br>
<br>
C_O2_I4(r, r, rZ, rZ, rS, rS);<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">I see the problem now. Look at the top of tcg=
_out_addsub2, where we (conditionally) negate the constant.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">We want to constrain the constant to =
be representable either positive or negative, i.e not -4096..4095 but -4095=
..4095.=C2=A0 But we got the endpoints wrong in tcg_target_const_match: 0xf=
ff instead of 0x7ff.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">r~</div></div>

--00000000000053a7cb05eb83e475--


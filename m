Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRSaT-00071B-A2
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 01:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mRSaQ-00070v-Cv; Sat, 18 Sep 2021 01:08:27 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:42684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mRSaL-0001uw-6i; Sat, 18 Sep 2021 01:08:25 -0400
Received: by mail-lf1-x12c.google.com with SMTP id bq5so41751872lfb.9;
 Fri, 17 Sep 2021 22:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4TxNL+cbAlm69v5QIBh94W8NtjcdtACqoM/td41qnGM=;
 b=VNQD6nlYgDHB3Bajql+/yp3xROPrl4dtJ3VlZ1lThbM+rqQchbY+Yrx/oY5s+kKQbH
 /YknOh6gzauU7nMPzxmD6Dl4Q3opuhpdpGtDgKjmWZq8GPyF1AF+Ig9LgZHfBdLReABx
 bX0iAa3V2AdhdkzkOJXYQiiY0kqcFIWZ1yyQk3Nxz7DyVqDOQ82h2cASNMrCoQBcvjoP
 jTf5KtpAUgGGfxgGNnTHLBx9hOARQ7WxSdNo0TCI0dvHS6a0lNCLp8PtBN1sIe8jz0tt
 uxvZzRKKd7rohqysvCzIsVweEvHm2OIICHxg4ntM7hKG4iROJy7+5UuRt9gwGVJhPaqD
 qpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4TxNL+cbAlm69v5QIBh94W8NtjcdtACqoM/td41qnGM=;
 b=TrQGfII2p6eKxbw2elcSZc+KnjOilMmCPPCJn7X8d2qI3e6T4iud6S00GWwbfKQI0b
 Bzl8TvFIKq1XdMkrwElQvQkX8ZYuOGRFOBRoiUzhTFuOquMXuHx49PnnPDLfQBLgB0TS
 Vw0HAqisUPC+51MTiKbPb5hwf+BWZLQcZUcFEvezWn8FkweRTrqIQhj4LKBvilyFS5tn
 GtmDRB8iwBVD/fzjt5nzu6ok1U3svd4GbcE9qpGdQCn3Mao1pMduK3ttDb94T+I1RhCk
 P59sLu4jyHN2tcuhSkYR0UK5ecljhSitmmdu8DmDj7BVwYlCbRtczgq/3VwKRIR4jHSN
 FbrQ==
X-Gm-Message-State: AOAM530J2O9ojWegIFjjyyaYjDzWO348SQgTI2D015nRIojI8Fsgwaip
 NsSHGkoucwoFGkHqewtzER0cKWnVu6VkfCM+RBk=
X-Google-Smtp-Source: ABdhPJw37mq5rXDVf/XJBk8971Or/RUlNLispXXuzYUDHbQEsF8mP5P1Hag1WniyfugDz/u5GwCBlW13eKVQH9N7SEk=
X-Received: by 2002:a05:6512:15a4:: with SMTP id
 bp36mr10572227lfb.509.1631941698298; 
 Fri, 17 Sep 2021 22:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
 <20210909190033.1339448-6-space.monkey.delivers@gmail.com>
 <4098b753-76fb-2dad-4922-837061184fc1@linaro.org>
In-Reply-To: <4098b753-76fb-2dad-4922-837061184fc1@linaro.org>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Sat, 18 Sep 2021 07:08:05 +0200
Message-ID: <CAFukJ-BJ6HQmrz6gGtxazYRo-q20tBMhtkk81SamCoRuRuEhew@mail.gmail.com>
Subject: Re: [PATCH v11 5/7] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: space.monkey.delivers@gmail.com, palmer@dabbelt.com, 
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000038ac2205cc3e094d"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, GAPPY_SUBJECT=0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 18 Sep 2021 05:08:28 -0000

--00000000000038ac2205cc3e094d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for noticing that.
Do you think it would be an ok solution to pass dst as a pointer
into gen_pm_adjust_address, so in case pm is enabled, it'd allocate the
temp and update the dst afterwards?
Thanks

=D0=BF=D1=82, 10 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 00:00, Richa=
rd Henderson <
richard.henderson@linaro.org>:

> On 9/9/21 9:00 PM, Alexey Baturo wrote:
> > +++ b/target/riscv/insn_trans/trans_rva.c.inc
> > @@ -25,6 +25,7 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a,
> MemOp mop)
> >       if (a->rl) {
> >           tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> >       }
> > +    gen_pm_adjust_address(ctx, src1, src1);
>
> This will not work anymore, since src1 may not be a temporary.  See the
> use of temp_new()
> e.g. in gen_load().  We're currently only conditionally allocating a
> temporary; with this
> extension, we'll always need one.  So it is probably worth cleaning that
> up at this time.
>
>
> r~
>

--00000000000038ac2205cc3e094d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<div><br></div><div>Thanks for noticing that.</=
div><div>Do you think it would be an ok solution to pass dst as a pointer i=
nto=C2=A0gen_pm_adjust_address, so in case pm is enabled, it&#39;d allocate=
 the temp and update the dst afterwards?</div><div>Thanks</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D1=82=
, 10 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 00:00, Richard Henderson=
 &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.henderson@lina=
ro.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 9/9/21 9:00 PM, Alexey Baturo wrote:<br>
&gt; +++ b/target/riscv/insn_trans/trans_rva.c.inc<br>
&gt; @@ -25,6 +25,7 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a,=
 MemOp mop)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (a-&gt;rl) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mb(TCG_MO_ALL | TCG_BA=
R_STRL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 gen_pm_adjust_address(ctx, src1, src1);<br>
<br>
This will not work anymore, since src1 may not be a temporary.=C2=A0 See th=
e use of temp_new() <br>
e.g. in gen_load().=C2=A0 We&#39;re currently only conditionally allocating=
 a temporary; with this <br>
extension, we&#39;ll always need one.=C2=A0 So it is probably worth cleanin=
g that up at this time.<br>
<br>
<br>
r~<br>
</blockquote></div>

--00000000000038ac2205cc3e094d--


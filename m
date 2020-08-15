Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k74D0-0003Vf-1Q
	for mharc-qemu-riscv@gnu.org; Sat, 15 Aug 2020 17:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k74Cy-0003VT-KX
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2020 17:59:24 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k74Cw-0001Az-TS
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2020 17:59:24 -0400
Received: by mail-ot1-x342.google.com with SMTP id v6so10475729ota.13
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2020 14:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bCin6TmgTSZWrgtfO6/BybfYU3ZQRUite8vCDBRZoh0=;
 b=eJecjkNW4Wcw/UhB9GuLXR4D3b7PrzJHOLR7tuXHWmnpq/yMJQ86cFq4eZG1lOEcpa
 yz7wjE6DkXg0FWB2lKdPsvjfw5OLnvKdZXEjLsurIiszZAExWw0ycSIdB4Nh5BOzwQrG
 HFBMlFwfikjJ2g1ngZWi4N6FNMoZ3uZr0f+SFknHUSbFrt+tAYCT8Vv8O10A09pG4Jbi
 +BgVPZgLYr2Fwczx80tLk8omfH7jRG0jeDlxzuUlp64gVejo1VWo/HGhdW12r5H5KujF
 4lIFBWywg4p/cJ3bfAZBSt61S9iB/qoGobhsFCZE+u7Fd+vZhImZfIuAxt1NHfyr5dmK
 SD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bCin6TmgTSZWrgtfO6/BybfYU3ZQRUite8vCDBRZoh0=;
 b=Knx2quYTWhMD98L2gtgN71BtkShIFO5k3EwXbDmjvmVXvFWgRzE5CU/+yZ7np2i2+Y
 YBbmm9pFUZtD6pUhI9+/BfwaJq9IoXQuqUWfKJ9e6yQUP4b1EL1Jg/MZkB5LcITdnsNQ
 ymDdT+SdxvX/M6A5EaoHH7/X9AKRxbH7uyGDlyso2dF6zk8ZfN986i2ZWKaCP3KOEtiC
 YCrQrXvVqBz2tsvHHPLNa0n1j/WReNmt+LUW7C+VHgiYkkkKLD94MFcH3Ldw1J5RudS6
 IPdm988XfYpYUHfkJpWZtd8gugiuWg5IfDN7jJcxcl+DyJDt0tYoiNpNnUEj3DJRYOc4
 fV4w==
X-Gm-Message-State: AOAM53379asupamh01szVc2UAnyK9JUTRg7OS5qTOeyNMkhh0wjoMo6g
 8v1B7IvxmG/P5dKsoUuCz5C8zKiAB0yz9Bh2yHJ8CQ==
X-Google-Smtp-Source: ABdhPJwPblhMNoruxqo35v5uX6B3U+67Y5PP4TdGgzqC+ww6k1Wmg3iRQ4SmixoygJCeKis4Dana91XL9Ngohyc8IX4=
X-Received: by 2002:a9d:3443:: with SMTP id v61mr6693131otb.139.1597528761661; 
 Sat, 15 Aug 2020 14:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-27-frank.chang@sifive.com>
 <90f01984-54a4-2a56-c52f-d1f4332b39d4@linaro.org>
 <CAE_xrPiJRRV3FYtfve6LMOF6LNEYGfhmi9CiabxqUBEew9igLg@mail.gmail.com>
 <5706a1ca-1dd9-22cd-08ce-c70780111bfc@linaro.org>
 <CAE_xrPgSbzzJqHYTeSND4wQDJUMoMYPmmcH97VE6hRcxh2S54A@mail.gmail.com>
 <de85d715-924a-8156-7424-5c35fd585fb3@linaro.org>
In-Reply-To: <de85d715-924a-8156-7424-5c35fd585fb3@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 16 Aug 2020 05:59:12 +0800
Message-ID: <CAE_xrPiwcFCNaj0cBhWRo_uqPA7DgTOoxB5V6BgYQOXrMR6VTg@mail.gmail.com>
Subject: Re: [RFC v3 26/71] target/riscv: rvv-1.0: update vext_max_elems() for
 load/store insns
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: multipart/alternative; boundary="0000000000005b929805acf1a63e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 15 Aug 2020 21:59:24 -0000

--0000000000005b929805acf1a63e
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2020 at 1:29 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/14/20 7:52 PM, Frank Chang wrote:
> >     probe_pages(env, base + stride * i, nf * esz, ra, access_type);
> > and
> >     target_ulong addr = base + stride * i + k * esz;
> >
> > If we pass ctzl(sizeof(type)) in GEN_VEXT_LD_STRIDE(),
> > I would still have to do: (1 << esz) to get the correct element size in
> the
> > above calculations.
> > Would it eliminate the performance gain we have in vext_max_elems()
> instead?
>
> Well, no, it will improve performance, because you'll write
>
>   addr = base + stride * i + (k << esz)
>
> I.e. strength-reduce the multiply to a shift.
>
>
This works like a charm.
Thanks for the advice.

Frank Chang



> r~
>
>

--0000000000005b929805acf1a63e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Aug 15, 2020 at 1:29 PM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 8/14/20 7:52 PM, Frank Chang wr=
ote:<br>
&gt; =C2=A0 =C2=A0 probe_pages(env, base + stride * i, nf * esz, ra, access=
_type);<br>
&gt; and<br>
&gt; =C2=A0 =C2=A0 target_ulong addr =3D base + stride * i + k * esz;<br>
&gt; <br>
&gt; If we pass ctzl(sizeof(type)) in=C2=A0GEN_VEXT_LD_STRIDE(),<br>
&gt; I would still have to do: (1 &lt;&lt; esz) to get the correct element =
size in the<br>
&gt; above calculations.<br>
&gt; Would it eliminate the performance gain we have in=C2=A0vext_max_elems=
() instead?<br>
<br>
Well, no, it will improve performance, because you&#39;ll write<br>
<br>
=C2=A0 addr =3D base + stride * i + (k &lt;&lt; esz)<br>
<br>
I.e. strength-reduce the multiply to a shift.<br><br></blockquote><div><br>=
</div><div>This works like a charm.</div><div>Thanks for the advice.</div><=
div><br></div><div>Frank Chang=C2=A0</div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
r~<br>
<br>
</blockquote></div></div>

--0000000000005b929805acf1a63e--


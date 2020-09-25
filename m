Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kLiz7-0006xV-4i
	for mharc-qemu-riscv@gnu.org; Fri, 25 Sep 2020 04:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kLiz5-0006vv-OV
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2020 04:21:39 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:46334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kLiz2-0001aV-Or
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2020 04:21:39 -0400
Received: by mail-ot1-x334.google.com with SMTP id 95so1505293ota.13
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2020 01:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TJeNo5RmevwgDoUGpwaeKOy7BJU1dN3YuFAGutV0TNY=;
 b=JgYbxgTB95S5AGCvhnPXG+clD9JIz9GX/8VtD7bBVrwwUGGLRoWooUfN0Egqr17XAe
 c6oOBmzIHzWR9DTfmTz3pAtS/tBv9FJznmJGyD5V6ehRIELXAhUAH+qmCsYeribMzYSA
 h02xbmUls4BGIJwJCoDeXLvxqT1pxWuvqPWU6NWV/zeeEkPXjcIhr8S0im559VgP7VyT
 zLeGebviiQL+djqMKoCo/HYRvPOmYDseAjaBsxutjHAOR1iEzNEwPjCCg21SY0jspGn7
 Wdwuj6CHMEDGS9Y+P59vtquoMU5v72bov1jcsxXr4JTO8pAaxkz00XKmmfJ8bMd+qB/o
 GymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TJeNo5RmevwgDoUGpwaeKOy7BJU1dN3YuFAGutV0TNY=;
 b=p2BPKURryX4msxSETcyLjC1duc9PD0dsl4ZE6Q4wWAgEor3+KbRKfjNqmuZtetpGZP
 w4PXp4sawBPDbHBpRI/l4V3JdOY7L84ZawU8Ykq+d3lk8xoMKQgu6LylxPxH2N0N7YKa
 +IqQTZzBrQJ00qX7v7POouUaqpstAM74E+248B27dIi9NI/KbPxwhO+KZfDX9EjFTZfs
 Yrk2/+rmGMOYCggn8TN++4AQwrCW4V9mTl5whtKDsECt2cp66Ix77bhIolELzEAoXBfE
 Nk7YFWOjMQyVaMEN8MJXRvb5xW3JgeuslI4LXJSZXx+lFqZdrWhyEDL8ocd5LB3oRfiW
 ta0w==
X-Gm-Message-State: AOAM532EM5HcwJSx9kAaMvjtrWmwrenH+xJQANW8Mr7V3X9L4Rghh8/d
 G1qfWIttxmsXuqUlI9maFg8FslOEYrHTng7Ffg301w==
X-Google-Smtp-Source: ABdhPJwFadq4GiVeZJiqpQFAn6xktsDSt06+/TlcWgfDf7datSKyYg2JZIWEdBe1RsJKZSxgg3E+iVxieMMJso1W244=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr2221256otq.188.1601022095384; 
 Fri, 25 Sep 2020 01:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-54-frank.chang@sifive.com>
 <96b9fa44-5a1b-2ac0-04ae-fa4d2857096e@linaro.org>
In-Reply-To: <96b9fa44-5a1b-2ac0-04ae-fa4d2857096e@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 25 Sep 2020 16:21:24 +0800
Message-ID: <CAE_xrPhUXcMrBmRDwVBwmwA0m3QgaSAm56pYCs5QCJHOeK+S2Q@mail.gmail.com>
Subject: Re: [RFC v4 53/70] target/riscv: rvv-1.0: floating-point slide
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: multipart/alternative; boundary="00000000000045fbc005b01f0130"
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x334.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 25 Sep 2020 08:21:40 -0000

--00000000000045fbc005b01f0130
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 30, 2020 at 4:33 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> > +DEF_HELPER_6(vfslide1up_vf_h, void, ptr, ptr, i64, ptr, env, i32)
> > +DEF_HELPER_6(vfslide1up_vf_w, void, ptr, ptr, i64, ptr, env, i32)
> > +DEF_HELPER_6(vfslide1up_vf_d, void, ptr, ptr, i64, ptr, env, i32)
> > +DEF_HELPER_6(vfslide1down_vf_h, void, ptr, ptr, i64, ptr, env, i32)
> > +DEF_HELPER_6(vfslide1down_vf_w, void, ptr, ptr, i64, ptr, env, i32)
> > +DEF_HELPER_6(vfslide1down_vf_d, void, ptr, ptr, i64, ptr, env, i32)
>
> You shouldn't need any new helpers.
>
> The fp scalar argument can be passed to the existing helpers.
>

I'm happy to reuse vslide1up_vx helper functions.

However, opfvf_trans() takes helper prototype of:

*typedef void gen_helper_opfvf(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv_ptr,
                        TCGv_env, TCGv_i32);*
but vslide1up_vx helper function's prototype is:

*typedef void gen_helper_opivx(TCGv_ptr, TCGv_ptr, TCGv, TCGv_ptr,
                    TCGv_env, TCGv_i32);*

The third argument has different types, not sure if it's worth it to sync
them
all to TCGv_i64.
But I'm afraid it would require more effort than keeping them in different
helper functions.

Frank Chang


>
> The manual doesn't explicitly say, but I assume the fp scalar needs to be
> nan-boxed (for sew > flen), or checked (for sew < flen), just like the
> scalar
> move instructions.
>
>
> r~

--00000000000045fbc005b01f0130
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Aug 30, 2020 at 4:33 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 8/17/20 1:49 AM, <a href=3D"mai=
lto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> wr=
ote:<br>
&gt; +DEF_HELPER_6(vfslide1up_vf_h, void, ptr, ptr, i64, ptr, env, i32)<br>
&gt; +DEF_HELPER_6(vfslide1up_vf_w, void, ptr, ptr, i64, ptr, env, i32)<br>
&gt; +DEF_HELPER_6(vfslide1up_vf_d, void, ptr, ptr, i64, ptr, env, i32)<br>
&gt; +DEF_HELPER_6(vfslide1down_vf_h, void, ptr, ptr, i64, ptr, env, i32)<b=
r>
&gt; +DEF_HELPER_6(vfslide1down_vf_w, void, ptr, ptr, i64, ptr, env, i32)<b=
r>
&gt; +DEF_HELPER_6(vfslide1down_vf_d, void, ptr, ptr, i64, ptr, env, i32)<b=
r>
<br>
You shouldn&#39;t need any new helpers.<br>
<br>
The fp scalar argument can be passed to the existing helpers.<br></blockquo=
te><div><br></div><div>I&#39;m happy=C2=A0to reuse vslide1up_vx helper func=
tions.<br></div><div><br></div><div>However,=C2=A0opfvf_trans() takes helpe=
r prototype of:<br><i>typedef void gen_helper_opfvf(TCGv_ptr, TCGv_ptr, TCG=
v_i64, TCGv_ptr,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_env, TCGv_i32);</i><=
/div><div>but vslide1up_vx helper function&#39;s=C2=A0prototype is:</div><d=
iv><i>typedef void gen_helper_opivx(TCGv_ptr, TCGv_ptr, TCGv, TCGv_ptr,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_env, TCGv_i32);</i><br></div><div><br>=
</div><div>The third argument has=C2=A0different=C2=A0types, not sure if it=
&#39;s worth it to sync them</div><div>all to=C2=A0TCGv_i64.</div><div>But =
I&#39;m afraid it would require more effort than keeping them in different<=
/div><div>helper functions.</div><div><br></div><div>Frank Chang</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The manual doesn&#39;t explicitly say, but I assume the fp scalar needs to =
be<br>
nan-boxed (for sew &gt; flen), or checked (for sew &lt; flen), just like th=
e scalar<br>
move instructions.<br>
<br>
<br>
r~</blockquote><div></div></div></div>

--00000000000045fbc005b01f0130--


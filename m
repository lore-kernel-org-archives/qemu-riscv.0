Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbfPV-0000nU-TG
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 04:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfPU-0000n7-GY
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 04:51:20 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:40884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfPR-0002aX-Rm
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 04:51:20 -0400
Received: by mail-il1-x12f.google.com with SMTP id f15so9631537ilu.7
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 01:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FDUdCAzU5Pi8JHCFt9eUslg759NqzhrDK3Uot5MrEl0=;
 b=cRzVWsYPgIYC7PpinuiTM4H4Ai9TGu/9k8UJw+/j8Ce+h7KVgEuVinqGRn78HK+npb
 kIf71JGEARZZfHHpMsp7iiwRhF4Gr9z9nH0cI+iZeaZV2R90yofqpzfIcDhSd9UQUEwS
 HLIZUsJ442Tfv4VLQ11WJhicTbev/XUaLGreurO4EZdHC17z7kIdnxDjyEpNdGAEzrjW
 x0Wfbru2CTVAMNGBuKox2nkygqOxMLsyoKPoDsTePc39eoPgcgPzlzn5PQebyYrdfAn2
 YrNJKhq8kjjBwWisAlaKRf9JrAnJFrH3Fk3GUomlK9H/HuByvukErdGCH1fLV/WT9q7B
 SbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FDUdCAzU5Pi8JHCFt9eUslg759NqzhrDK3Uot5MrEl0=;
 b=S5I0MoMLI6cuxOk86R48c3LvNaNWDd9W8K72nCztpz6dj/o/7HLLoy0Gyn2a/JND7I
 mZ7wNXntYw3PRn3QyyV+hfA6u4cvvDGgIVH/guDF4LM7cb4BC2ALsqjbZ3/uSlkw6yim
 8rH351Pj0MTYpCAvPXcO53LJ8YDM1rp9UOtx7FiBGy+F09WnluSfOE0SyqGrrLUDToz+
 hKkaa2fXgRmKv69prtwIkDjmnsE+OPhvHNx/PgCw2XL1B8NNIjsZQWFqXx+i1OaaDMRC
 IRp+mv1PFAT+stp/00mSJCuPHM5EalqHEUE0NG4nFuuVHON/IA8bSOV/SxJKDUU/9qGu
 9r6g==
X-Gm-Message-State: AOAM531t4JdP0j5tBVmX3Zylfg9+lFCN02fWR7AMdSE6fm8ouqwU0FVK
 jZRWn3D/qlzCAhDjNbSG7EI+/DTkgQAfY/+sTxe8dA==
X-Google-Smtp-Source: ABdhPJy2qxTar62GLRV0oZsm7PrdDMwxO+R2oFRvQrZKv8dU2OGhyHreeqQq3ANpPPdQn48/blbLIDk+Vnue3LerDt8=
X-Received: by 2002:a05:6e02:893:: with SMTP id
 z19mr6981703ils.224.1634374274979; 
 Sat, 16 Oct 2021 01:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211015065500.3850513-1-frank.chang@sifive.com>
 <20211015065500.3850513-2-frank.chang@sifive.com>
 <5fdfaf38-da5b-ff32-9c9c-700ccaf3dadb@linaro.org>
In-Reply-To: <5fdfaf38-da5b-ff32-9c9c-700ccaf3dadb@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 16 Oct 2021 16:51:04 +0800
Message-ID: <CAE_xrPhxmat=7bFBdgenTCdjb1HAp34jAfjx2c11zOHJ_B=9Ew@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] softfloat: add APIs to handle alternative sNaN
 propagation for fmax/fmin
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001732f805ce746a30"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=frank.chang@sifive.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Sat, 16 Oct 2021 08:51:20 -0000

--0000000000001732f805ce746a30
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 16, 2021 at 1:00 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/14/21 11:54 PM, frank.chang@sifive.com wrote:
> > +        /*
> > +         * In IEEE 754-2019, minNum, maxNum, minNumMag and maxNumMag
> > +         * are removed and replaced with minimum, minimumNumber, maximum
> > +         * and maximumNumber.
> > +         * minimumNumber/maximumNumber behavior for SNaN is changed to:
> > +         *   If both operands are NaNs, a QNaN is returned.
> > +         *   If either operand is a SNaN,
> > +         *   an invalid operation exception is signaled,
> > +         *   but unless both operands are NaNs,
> > +         *   the SNaN is otherwise ignored and not converted to a QNaN.
> > +         */
> > +        if (!(~flags & (minmax_isnum | minmax_snan_noprop))
> > +            && (ab_mask & float_cmask_snan)
> > +            && (ab_mask & ~float_cmask_anynan)) {
> > +            float_raise(float_flag_invalid, s);
> > +            return is_nan(a->cls) ? b : a;
> > +        }
>
> This part looks ok.
>
> > +    MINMAX_1(type, maxnum_noprop, minmax_isnum | minmax_snan_noprop) \
> > +    MINMAX_1(type, minnum_noprop, minmax_ismin | minmax_isnum |      \
> > +                                  minmax_snan_noprop)                \
>
> But here, you have been given names by 754-2019: minimumNumber,
> maximumNumber, so I think
> you should use them.
>
>
Agree, that's better than *_noprop().
Will update in my next patchset.

Thanks,
Frank Chang


>
> r~
>

--0000000000001732f805ce746a30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Oct 16, 2021 at 1:00 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 10/14/21 11:54 PM, <a href=3D"m=
ailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> =
wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* In IEEE 754-2019, minNum, maxNum,=
 minNumMag and maxNumMag<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* are removed and replaced with min=
imum, minimumNumber, maximum<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and maximumNumber.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* minimumNumber/maximumNumber behav=
ior for SNaN is changed to:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0If both operands are =
NaNs, a QNaN is returned.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0If either operand is =
a SNaN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0an invalid operation =
exception is signaled,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0but unless both opera=
nds are NaNs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0the SNaN is otherwise=
 ignored and not converted to a QNaN.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(~flags &amp; (minmax_isnum | minmax=
_snan_noprop))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (ab_mask &amp; f=
loat_cmask_snan)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (ab_mask &amp; ~=
float_cmask_anynan)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float_raise(float_flag_inva=
lid, s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return is_nan(a-&gt;cls) ? =
b : a;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
This part looks ok.<br>
<br>
&gt; +=C2=A0 =C2=A0 MINMAX_1(type, maxnum_noprop, minmax_isnum | minmax_sna=
n_noprop) \<br>
&gt; +=C2=A0 =C2=A0 MINMAX_1(type, minnum_noprop, minmax_ismin | minmax_isn=
um |=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 minmax_snan_noprop)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
<br>
But here, you have been given names by 754-2019: minimumNumber, maximumNumb=
er, so I think <br>
you should use them.<br>
<br></blockquote><div><br></div><div>Agree, that&#39;s better than *_noprop=
().</div><div>Will update in my next patchset.</div><div><br></div><div>Tha=
nks,</div><div>Frank Chang<br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--0000000000001732f805ce746a30--


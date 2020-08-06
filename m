Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3Z5n-0003PN-Fa
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 02:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3Z5l-0003NZ-Cv
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:09:29 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:43113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3Z5i-0000PA-K5
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:09:29 -0400
Received: by mail-io1-xd41.google.com with SMTP id k23so48374189iom.10
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2020 23:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/IEkLSEhabr43s0zlznR/yjMZeS9Ccw5v0UmxfcwxcU=;
 b=T/CPlqfbsmNAvkR0kTblGYrc7HkUUnJVhCG2Fku1KlT9PziSjVXq6kBKvDiS5E7wyZ
 xSX+X7ThBH7E6CVGN1sovah44s+JTugmjGPhzi8HtBifWGhEFi1FW1lWpGfdG1hUBli6
 iJDaHvpKCdnUYPtSd8rxDLIhsI1K55l0Wph/1TxsVFLKAkSFLbuotJFkw9ag/y3kgyxo
 4GR8Ij8pAM89/JmQyGt9Fh91iQRHEJUJ8aQ3k2gxVGcGorYmlj7CRsu95OtVs6IR0ZSh
 6LPloLefxXFWqfLpdy/KqRAP890gOdDCog8zbBHeUyKM79i+7ySpqKe8jQ5UbihlkF+i
 fx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/IEkLSEhabr43s0zlznR/yjMZeS9Ccw5v0UmxfcwxcU=;
 b=tBUz/xtQ291ka7xSD/brA/t69qaztMocuguBYUXmWpkXM2wKftgBaRIvPj/b2h65CQ
 ToyeaDYSLmXwLb8lLG0Wp+B4vj/52tf7bSGY3hW2YKsnxfcp/Pi6IatpKfpZR4LCaPOB
 h+57OzHazXMRIvNquw/9V1tdYjkNVNdjfUu6bBicrwncFyfq1T6qT4zbCWWyvFbg8Kt5
 yxB4DF0FcBrALMhurwF4cTRlJJUDyWoKRD5TPb6zRCYNacyNZCE0QSFTal9XsNZjwYlL
 hZk9+t2UmHwgqGM8UBqkGzBDh4QNuWPJ6icdmCkKn/Bv8SoZIphSOkFczcsG8rsfwPaJ
 4+BQ==
X-Gm-Message-State: AOAM531XTmx3t9wZ71byS0Yq3fqkiItTObHc0oXfXEpcCUbWFoC7Hhno
 yeKhBOaUe8TnD9bEr5M3oRzdraHPdAsPggCi7Y6k7w==
X-Google-Smtp-Source: ABdhPJzseYkCy5C0XoXf9PPSL8j+6oQ2tV4JXXAlZHvM5ToxmvB4uB7HG5AVsDVyTTxAHeh3g3WGxxiWnhuuJNVOvgI=
X-Received: by 2002:a05:6638:248e:: with SMTP id
 x14mr9184108jat.135.1596694164161; 
 Wed, 05 Aug 2020 23:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200724002807.441147-1-richard.henderson@linaro.org>
 <20200724002807.441147-2-richard.henderson@linaro.org>
 <1aa6cb56-2f41-45c1-2d32-ec8b3b10780b@c-sky.com>
 <9e10c17c-7a9e-5f7f-b1e3-c195d4e30b32@linaro.org>
 <ccc72223-d98e-6dd4-6c44-ca30f4e687d5@c-sky.com>
In-Reply-To: <ccc72223-d98e-6dd4-6c44-ca30f4e687d5@c-sky.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 6 Aug 2020 14:09:13 +0800
Message-ID: <CAEiOBXXmz2APpmtwPrvikXUt5j_Q=k5ZqK9g2Fe4bdjeAbg_6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] target/riscv: Generate nanboxed results from fp
 helpers
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, 
 Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000786a5e05ac2f5464"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=chihmin.chao@sifive.com; helo=mail-io1-xd41.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 06:09:29 -0000

--000000000000786a5e05ac2f5464
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 24, 2020 at 2:06 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:

>
>
> On 2020/7/24 11:55, Richard Henderson wrote:
> > On 7/23/20 7:35 PM, LIU Zhiwei wrote:
> >>
> >> On 2020/7/24 8:28, Richard Henderson wrote:
> >>> Make sure that all results from single-precision scalar helpers
> >>> are properly nan-boxed to 64-bits.
> >>>
> >>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >>> ---
> >>>    target/riscv/internals.h  |  5 +++++
> >>>    target/riscv/fpu_helper.c | 42
> +++++++++++++++++++++------------------
> >>>    2 files changed, 28 insertions(+), 19 deletions(-)
> >>>
> >>> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> >>> index 37d33820ad..9f4ba7d617 100644
> >>> --- a/target/riscv/internals.h
> >>> +++ b/target/riscv/internals.h
> >>> @@ -38,4 +38,9 @@ target_ulong fclass_d(uint64_t frs1);
> >>>    #define SEW32 2
> >>>    #define SEW64 3
> >>>    +static inline uint64_t nanbox_s(float32 f)
> >>> +{
> >>> +    return f | MAKE_64BIT_MASK(32, 32);
> >>> +}
> >>> +
> >> If define it here,  we can also define a more general  function with
> flen.
> >>
> >> +static inline uint64_t nanbox_s(float32 f, uint32_t flen)
> >> +{
> >> +    return f | MAKE_64BIT_MASK(flen, 64 - flen);
> >> +}
> >> +
> >>
> >> So we can reuse it in fp16 or bf16 scalar instruction and in vector
> instructions.
> > While we could do that, we will not encounter all possible lengths.  In
> the
> > cover letter, I mentioned defining a second function,
> >
> > static inline uint64_t nanbox_h(float16 f)
> > {
> >     return f | MAKE_64BIT_MASK(16, 48);
> > }
> >
> > Having two separate functions will, I believe, be easier to use in
> practice.
> >
> Get  it. Thanks.
>
> Zhiwei
> >
> > r~
>
>
>
That is what has been implemented in spike.  It fills up the Nan-Box when
value is stored back internal structure and
unbox the value with difference floating type (half/single/double/quad).

By the way,  I prefer to keeping the suffix to tell different floating
type rather than pass arbitrary
since each floating type belong to each extension.

Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--000000000000786a5e05ac2f5464
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">On Fri, Jul 24, =
2020 at 2:06 PM LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com">zhiw=
ei_liu@c-sky.com</a>&gt; wrote:<br></div></div></div></div><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 2020/7/24 11:55, Richard Henderson wrote:<br>
&gt; On 7/23/20 7:35 PM, LIU Zhiwei wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 2020/7/24 8:28, Richard Henderson wrote:<br>
&gt;&gt;&gt; Make sure that all results from single-precision scalar helper=
s<br>
&gt;&gt;&gt; are properly nan-boxed to 64-bits.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard=
.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&g=
t;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 target/riscv/internals.h=C2=A0 |=C2=A0 5 +++++<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 target/riscv/fpu_helper.c | 42 ++++++++++++++++++=
+++------------------<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 28 insertions(+), 19 deletions(-=
)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/target/riscv/internals.h b/target/riscv/internals=
.h<br>
&gt;&gt;&gt; index 37d33820ad..9f4ba7d617 100644<br>
&gt;&gt;&gt; --- a/target/riscv/internals.h<br>
&gt;&gt;&gt; +++ b/target/riscv/internals.h<br>
&gt;&gt;&gt; @@ -38,4 +38,9 @@ target_ulong fclass_d(uint64_t frs1);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 #define SEW32 2<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 #define SEW64 3<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 +static inline uint64_t nanbox_s(float32 f)<br>
&gt;&gt;&gt; +{<br>
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 return f | MAKE_64BIT_MASK(32, 32);<br>
&gt;&gt;&gt; +}<br>
&gt;&gt;&gt; +<br>
&gt;&gt; If define it here,=C2=A0 we can also define a more general=C2=A0 f=
unction with flen.<br>
&gt;&gt;<br>
&gt;&gt; +static inline uint64_t nanbox_s(float32 f, uint32_t flen)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 return f | MAKE_64BIT_MASK(flen, 64 - flen);<b=
r>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;<br>
&gt;&gt; So we can reuse it in fp16 or bf16 scalar instruction and in vecto=
r instructions.<br>
&gt; While we could do that, we will not encounter all possible lengths.=C2=
=A0 In the<br>
&gt; cover letter, I mentioned defining a second function,<br>
&gt;<br>
&gt; static inline uint64_t nanbox_h(float16 f)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0return f | MAKE_64BIT_MASK(16, 48);<br>
&gt; }<br>
&gt;<br>
&gt; Having two separate functions will, I believe, be easier to use in pra=
ctice.<br>
&gt;<br>
Get=C2=A0 it. Thanks.<br>
<br>
Zhiwei<br>
&gt;<br>
&gt; r~<br>
<br>
<br></blockquote><div><br></div><div>That is what has been implemented in s=
pike.=C2=A0 It fills up the Nan-Box when value is stored back internal stru=
cture and=C2=A0</div><div>unbox the value with difference floating type (ha=
lf/single/double/quad).<br></div><div><br></div><div>By the way,=C2=A0 I pr=
efer to keeping the suffix to tell different=C2=A0floating type=C2=A0rather=
 than pass arbitrary=C2=A0</div><div>since each floating type belong to eac=
h extension.<br><br>Reviewed-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmi=
n.chao@sifive.com">chihmin.chao@sifive.com</a>&gt;<br></div></div></div>

--000000000000786a5e05ac2f5464--


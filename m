Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLyS-0007Rr-5Y
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 02:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcLyQ-0007Og-7h
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 02:18:14 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:43848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcLyK-0004vp-TM
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 02:18:13 -0400
Received: by mail-io1-xd35.google.com with SMTP id y67so14875567iof.10
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 23:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nQwb1s6X3ABnl3yyNbI9DcdHj/Sva1A75rK/M92FxT0=;
 b=KkpdvLENhFoSPdP3dY1ngTCBlvX6LeV1CIRYU/7qehim4yapbjloeqMbgYW4HLJ3Z9
 Iv7qN47M2DRjUpK0BOg5qZA57nuYGSpYDwGA4dB7H8RZAQoSxR7RLN/afJz224n3tiu/
 N6TlqYubdNv+eaKluhq4pUE3PW79txUcUsbzYy0WGqzdQxqRX4zOScaOLvwj5QTQ/2Kg
 ernerElAavufWTZAox4ia/WBZ8hJgiRXgvZBPgOi6eEGJLqjpX6M4r8Qcuefn4yz8C1l
 73eZGrFlkqO5ioXCxDqvUEPmh6aiPOlB16Z9qi6moiF1rp1sdIAZz2gPKGb2XHlRhll3
 9S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nQwb1s6X3ABnl3yyNbI9DcdHj/Sva1A75rK/M92FxT0=;
 b=j8DXNCVD9OWtw8K4zL8QxQzdjkKV0V+VtP+P6HMy3BhkS7oM3aZOHE2L2yguqwaSqJ
 kmJJ0U1bfdfgKwl7b/e31V/n8QmynKF8Dp8LZod4jhn/Dl4L7xknk160oSrrIE1bgc/y
 rQD+E2dKNYwwPuMk9ccwO0Jg758xSbRB6BArLbmHW9ZE1IZE13FCZPn1x58gkfIDY2+5
 ZZbUkxc5wQsXJ1m8NP2cM50bMT2nN7Z6IQUaSmFdDXyMjtO2YvoHoK2b/Q2lW0hGUNE2
 wFOdqGMO4Kl21dgJ1qvXKkZkbenFr9JSngSLmKUIu+3XcIytU0TowidkVbebod0KpWMf
 3bKA==
X-Gm-Message-State: AOAM531Uwq2Zou+N6JVHdZ5nVEnGV7FFHBXHmkv2dJdHPQqUCU7BFQ7B
 LgWBdl3wcvgtZZ+ti/Y62+H5WTp/Qa2x0rxCOZsLWA==
X-Google-Smtp-Source: ABdhPJxItrbpTMNNMXCM8CaKYsWiF2bK5+Q+AXpwsno3ZiYseXnCqt2gKJ2f42sQVXtk2VOeV5K2anpSNY0jHBBbl5s=
X-Received: by 2002:a05:6602:2ac8:: with SMTP id
 m8mr13508176iov.112.1634537887687; 
 Sun, 17 Oct 2021 23:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <CAKmqyKMf3QUi9HGK4rx6fJBh6_YvpPYDpf-u5pgrx6VE58ORWw@mail.gmail.com>
 <CAE_xrPgpgNT2nAsiOsV+z+VT4tRRGK6qs0mqRA13agU=TnJkHg@mail.gmail.com>
 <CAKmqyKNbqA_svmQHTpMaK8yHk6bpm1f+Bs9t2ktO4TvN4e6rUw@mail.gmail.com>
In-Reply-To: <CAKmqyKNbqA_svmQHTpMaK8yHk6bpm1f+Bs9t2ktO4TvN4e6rUw@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 18 Oct 2021 14:17:56 +0800
Message-ID: <CAE_xrPioJ0i_xzhv8jixMsPdv4q_r6T+dgonorVUaH2_68s_8w@mail.gmail.com>
Subject: Re: [PATCH v8 00/78] support vector extension v1.0
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002af74f05ce9a8226"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=frank.chang@sifive.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 18 Oct 2021 06:18:14 -0000

--0000000000002af74f05ce9a8226
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 2:12 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Oct 18, 2021 at 4:09 PM Frank Chang <frank.chang@sifive.com>
> wrote:
> >
> > On Mon, Oct 18, 2021 at 2:00 PM Alistair Francis <alistair23@gmail.com>
> wrote:
> >>
> >> On Fri, Oct 15, 2021 at 5:48 PM <frank.chang@sifive.com> wrote:
> >> >
> >> > From: Frank Chang <frank.chang@sifive.com>
> >> >
> >> > This patchset implements the vector extension v1.0 for RISC-V on QEMU.
> >> >
> >> > RVV v1.0 spec is now fronzen for public review:
> >> > https://github.com/riscv/riscv-v-spec/releases/tag/v1.0
> >> >
> >> > The port is available here:
> >> > https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v8
> >> >
> >> > RVV v1.0 can be enabled with -cpu option: v=true and specify vext_spec
> >> > option to v1.0 (i.e. vext_spec=v1.0)
> >>
> >> It doesn't seem like this series made it to the general QEMU list. You
> >> might want to check to see what happened there.
> >>
> >
> > Hi Alistair, what does "general QEMU list" mean here?
>
> To the qemu-devel mailing list.
>
> A good way to check is to have a look at something like patchew
> (https://patchew.org/QEMU/) and see if the patches are there.
>
> Alistair
>

I see...
That's probably because I used git send-email with '--to' option:
  'qemu-devel@nongnu.org,qemu-riscv@nongnu.org'?

Regards,
Frank Chang

--0000000000002af74f05ce9a8226
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 18, 2021 at 2:12 PM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Mon, Oct 18, 2021 at 4:09 PM Frank Chang &lt;<a =
href=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Oct 18, 2021 at 2:00 PM Alistair Francis &lt;<a href=3D"mailto=
:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>&gt; wrote=
:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Oct 15, 2021 at 5:48 PM &lt;<a href=3D"mailto:frank.chang@=
sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This patchset implements the vector extension v1.0 for RISC-V=
 on QEMU.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; RVV v1.0 spec is now fronzen for public review:<br>
&gt;&gt; &gt; <a href=3D"https://github.com/riscv/riscv-v-spec/releases/tag=
/v1.0" rel=3D"noreferrer" target=3D"_blank">https://github.com/riscv/riscv-=
v-spec/releases/tag/v1.0</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The port is available here:<br>
&gt;&gt; &gt; <a href=3D"https://github.com/sifive/qemu/tree/rvv-1.0-upstre=
am-v8" rel=3D"noreferrer" target=3D"_blank">https://github.com/sifive/qemu/=
tree/rvv-1.0-upstream-v8</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; RVV v1.0 can be enabled with -cpu option: v=3Dtrue and specif=
y vext_spec<br>
&gt;&gt; &gt; option to v1.0 (i.e. vext_spec=3Dv1.0)<br>
&gt;&gt;<br>
&gt;&gt; It doesn&#39;t seem like this series made it to the general QEMU l=
ist. You<br>
&gt;&gt; might want to check to see what happened there.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Hi Alistair, what does &quot;general QEMU list&quot; mean here?<br>
<br>
To the qemu-devel mailing list.<br>
<br>
A good way to check is to have a look at something like patchew<br>
(<a href=3D"https://patchew.org/QEMU/" rel=3D"noreferrer" target=3D"_blank"=
>https://patchew.org/QEMU/</a>) and see if the patches are there.<br>
<br>
Alistair<br></blockquote><div><br></div><div>I see...</div><div>That&#39;s =
probably because I used git send-email with &#39;--to&#39; option:</div><di=
v>=C2=A0 &#39;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.or=
g</a>,<a href=3D"mailto:qemu-riscv@nongnu.org">qemu-riscv@nongnu.org</a>&#3=
9;?</div><div><br></div><div>Regards,</div><div>Frank Chang=C2=A0</div></di=
v></div>

--0000000000002af74f05ce9a8226--


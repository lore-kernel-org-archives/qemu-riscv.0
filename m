Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhuS4-0000VF-2M
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 10:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mhuS0-0000Qq-Im
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 10:07:45 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:45049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mhuRv-0003Mm-P2
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 10:07:43 -0400
Received: by mail-io1-xd33.google.com with SMTP id f9so25510951ioo.11
 for <qemu-riscv@nongnu.org>; Tue, 02 Nov 2021 07:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=l6V0W2c76xs63O23tX3vhfV4kcHeEX1s9fXQ89bj7Q8=;
 b=AsPqOT17cPWwSTWFC/Qg8tYYEQ+6Ia5LxpVpmi2YKYqoGDc1+LHV92e6jIu4sgYkHJ
 Zp1gKg/VcJJ3MgESA3z38nYgUNEfESy07HV9QcJ30M5izdgRqqVFBV0RPZa/ZwbnwSIg
 80wuVxp84tVexhDL/9YhoD5i27hCGCYTsKV+9xZjgWemy0vzIsyes7WMy7aLFBbu+poX
 a0i9YIk5Noya0r/IrDxhWsiyrrDirFrb1PR8GhlGMsRPwoqcirBl0Q7uSiT8E9kJvnHk
 haEINo8L9k7f9MskkmTR66v02/LIxBt2/yOuGc9W17kT7/S2zykA9EWs3JZTpxLAjJiH
 2mJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=l6V0W2c76xs63O23tX3vhfV4kcHeEX1s9fXQ89bj7Q8=;
 b=6vVRp/9WzP1DxFYBSkf+nVQKfamgiqujqI/QoCHJfh+LCmgD59u5HrNxS3NKt59TFy
 m0974f3zfrxs2auNA9v6SyoPFVBMAVpw3CsoKjGbKC0yoYZQb7UZ10700Jui+iFeqzjv
 sFqHxz6b7/G9+dNfqEX/LWxE8ygOlT+xj//xzGn+xfB2661HRIa0e7K1gr3hWmgPlQvX
 E6Np13D+nF2MFAhnSS//ifyRp2+yzxuSnYOGwTwUmzXqDbh7CFfY/yqrlahGHubLDUTc
 hGyTeda7oTwtGhscX7BK9LBYzd1XV14zkfVPpZ09jDCxt413kfaOpzJOWGcoSY5wN5Ob
 VfQA==
X-Gm-Message-State: AOAM533Z66w3bSq7Ijg7gRMwQSUySaEKUCPht2Q05+YDwmW6uS3WHUv2
 A51hOVNfu+54cZOeiz1wr6T7dx3+PLkJBFg1PfaRgZrVOzVh5Q==
X-Google-Smtp-Source: ABdhPJyUSeBazosqGq6lPYydjcyhKPjTGnw691zdhysUWCzR5lk5L8gxC0u5z0fLoRz08pQxwyF4f8XX46ZzmgcjZz8=
X-Received: by 2002:a05:6602:1583:: with SMTP id
 e3mr2997433iow.112.1635862056538; 
 Tue, 02 Nov 2021 07:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211021162956.2772656-1-frank.chang@sifive.com>
In-Reply-To: <20211021162956.2772656-1-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 2 Nov 2021 22:07:25 +0800
Message-ID: <CAE_xrPi_20tt1w-ZaPU5cGRtQ6PQOeeqwaY7uL=ii86e9Z25SA@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] target/riscv: support Zfh, Zfhmin extension v0.1
To: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c82e2805cfced03a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=frank.chang@sifive.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 14:07:45 -0000

--000000000000c82e2805cfced03a
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 22, 2021 at 12:30 AM <frank.chang@sifive.com> wrote:

> From: Frank Chang <frank.chang@sifive.com>
>
> Zfh - Half width floating point
> Zfhmin - Subset of half width floating point
>
> Zfh, Zfhmin v0.1 is now in public review period and is required by
> RVV extension:
>
> https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/63gDCinXTwE/m/871Wm9XIBQAJ
>
> Zfh, Zfhmin can be enabled with -cpu option: Zfh=true and Zfhmin=true
> respectively.
>
> The port is available at:
> https://github.com/sifive/qemu/tree/zfh-upstream-v5
>
> Note: This patchset depends on another patchset listed in Based-on
>       section below so it is not able to be built unless the patchset
>       is applied.
>
> Changelog:
>
> v5:
>   * Rebase on riscv-to-apply.next.
>
> v4:
>   * Spilt Zfh, Zfhmin cpu properties related changes into individual
>     patches.
>
> v3:
>   * Use the renamed softfloat min/max APIs: *_minimum_number()
>     and *_maximum_number().
>   * Pick softfloat min/max APIs based on CPU privilege spec version.
>   * Add braces for if statements in REQUIRE_ZFH() and
>     REQUIRE_ZFH_OR_ZFHMIN().
>   * Rearrange the positions of Zfh and Zfhmin cpu properties.
>
> v2:
>   * Use {get,dest}_gpr APIs.
>   * Add Zfhmin extension.
>
> Based-on: <20211021160847.2748577-1-frank.chang@sifive.com>
>
> Frank Chang (3):
>   target/riscv: zfh: add Zfh cpu property
>   target/riscv: zfh: implement zfhmin extension
>   target/riscv: zfh: add Zfhmin cpu property
>
> Kito Cheng (5):
>   target/riscv: zfh: half-precision load and store
>   target/riscv: zfh: half-precision computational
>   target/riscv: zfh: half-precision convert and move
>   target/riscv: zfh: half-precision floating-point compare
>   target/riscv: zfh: half-precision floating-point classify
>
>  target/riscv/cpu.c                        |   2 +
>  target/riscv/cpu.h                        |   2 +
>  target/riscv/fpu_helper.c                 | 180 ++++++++
>  target/riscv/helper.h                     |  29 ++
>  target/riscv/insn32.decode                |  38 ++
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 537 ++++++++++++++++++++++
>  target/riscv/internals.h                  |  16 +
>  target/riscv/translate.c                  |  20 +
>  8 files changed, 824 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc
>
> --
> 2.25.1
>
>
Hi Alistair,

Is this one able to be merged to v6.2.0 as the soft feature freeze is due
today (2021-11-02).
I think this series has gotten all Reviewed-by.

Thanks,
Frank Chang

--000000000000c82e2805cfced03a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Oct 22, 2021 at 12:30 AM &lt;<a h=
ref=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">From: Frank Chang &lt;<a href=3D"mailto:frank=
.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
Zfh - Half width floating point<br>
Zfhmin - Subset of half width floating point<br>
<br>
Zfh, Zfhmin v0.1 is now in public review period and is required by<br>
RVV extension:<br>
<a href=3D"https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/63gDCin=
XTwE/m/871Wm9XIBQAJ" rel=3D"noreferrer" target=3D"_blank">https://groups.go=
ogle.com/a/groups.riscv.org/g/isa-dev/c/63gDCinXTwE/m/871Wm9XIBQAJ</a><br>
<br>
Zfh, Zfhmin can be enabled with -cpu option: Zfh=3Dtrue and Zfhmin=3Dtrue<b=
r>
respectively.<br>
<br>
The port is available at:<br>
<a href=3D"https://github.com/sifive/qemu/tree/zfh-upstream-v5" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/sifive/qemu/tree/zfh-upstream-=
v5</a><br>
<br>
Note: This patchset depends on another patchset listed in Based-on<br>
=C2=A0 =C2=A0 =C2=A0 section below so it is not able to be built unless the=
 patchset<br>
=C2=A0 =C2=A0 =C2=A0 is applied.<br>
<br>
Changelog:<br>
<br>
v5:<br>
=C2=A0 * Rebase on riscv-to-apply.next.<br>
<br>
v4:<br>
=C2=A0 * Spilt Zfh, Zfhmin cpu properties related changes into individual<b=
r>
=C2=A0 =C2=A0 patches.<br>
<br>
v3:<br>
=C2=A0 * Use the renamed softfloat min/max APIs: *_minimum_number()<br>
=C2=A0 =C2=A0 and *_maximum_number().<br>
=C2=A0 * Pick softfloat min/max APIs based on CPU privilege spec version.<b=
r>
=C2=A0 * Add braces for if statements in REQUIRE_ZFH() and<br>
=C2=A0 =C2=A0 REQUIRE_ZFH_OR_ZFHMIN().<br>
=C2=A0 * Rearrange the positions of Zfh and Zfhmin cpu properties.<br>
<br>
v2:<br>
=C2=A0 * Use {get,dest}_gpr APIs.<br>
=C2=A0 * Add Zfhmin extension.<br>
<br>
Based-on: &lt;<a href=3D"mailto:20211021160847.2748577-1-frank.chang@sifive=
.com" target=3D"_blank">20211021160847.2748577-1-frank.chang@sifive.com</a>=
&gt;<br>
<br>
Frank Chang (3):<br>
=C2=A0 target/riscv: zfh: add Zfh cpu property<br>
=C2=A0 target/riscv: zfh: implement zfhmin extension<br>
=C2=A0 target/riscv: zfh: add Zfhmin cpu property<br>
<br>
Kito Cheng (5):<br>
=C2=A0 target/riscv: zfh: half-precision load and store<br>
=C2=A0 target/riscv: zfh: half-precision computational<br>
=C2=A0 target/riscv: zfh: half-precision convert and move<br>
=C2=A0 target/riscv: zfh: half-precision floating-point compare<br>
=C2=A0 target/riscv: zfh: half-precision floating-point classify<br>
<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0target/riscv/fpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 180 ++++++++<br>
=C2=A0target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 29 ++<br>
=C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 38 ++<br>
=C2=A0target/riscv/insn_trans/trans_rvzfh.c.inc | 537 +++++++++++++++++++++=
+<br>
=C2=A0target/riscv/internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 16 +<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 20 +<br>
=C2=A08 files changed, 824 insertions(+)<br>
=C2=A0create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc<br>
<br>
--<br>
2.25.1<br>
<br></blockquote><div><br></div><div>Hi Alistair,</div><div><br></div><div>=
Is this one able to be merged to v6.2.0 as the soft feature freeze is due t=
oday (2021-11-02).</div><div>I think this series has gotten all Reviewed-by=
.</div><div><br></div><div>Thanks,</div><div>Frank Chang=C2=A0<br></div></d=
iv></div>

--000000000000c82e2805cfced03a--


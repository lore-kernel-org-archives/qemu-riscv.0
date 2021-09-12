Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPPAz-0001w0-1g
	for mharc-qemu-riscv@gnu.org; Sun, 12 Sep 2021 09:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPAw-0001qj-TO
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 09:05:38 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPAv-0005An-0E
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 09:05:38 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x7so6294938pfa.8
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AG2NQkaKnidbsmLjpxu2eNIlYv0knyLTM1sGncf/cCw=;
 b=BHfUMKBuG4kSIKZ0r5BdkR1rEiFwIw70rI6c2Q7Y6McTsZcCxyjdReBfScDAgkMMWs
 IHmtxSrQCZh0aRhsSFd7LpRW5rgMbrKIrl1mqorGG8esXDMAjm2DIOQevOWkto7vxtKd
 eGpyKyThO7LydZIKxOcsG5obTt7TQAcAqBEzWUxi1eXknaWTdA/AyTNdVcwMN/RGHu1w
 6Fg2821YGWMYF951m25jaFASmbpDZOIhdAFbZ/nb+PcZUlMsxu7mosvtkOrxFDc7xqAo
 7bB2wSxFjZbTJe3aZtdPx8JzusuEquRM1NmfTjdOwsktNwx6mQ3K5N9h8oHkghY7veQc
 Z9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AG2NQkaKnidbsmLjpxu2eNIlYv0knyLTM1sGncf/cCw=;
 b=ab0837e7BPqTqfZ+LeunRiG7NVQyS8/UQAKuEp5djMk0qK6rrOcv0waXiDZ1tpi3T8
 EfAnWXzt68VgCDRhssXNl/hoAO/6STxjMMFIHTdSlx5fxroUkLGr4cRSGqyQm6ECO0uF
 jqQESCd1Ajp+hPRw0e4Nxpac30V63PqQzNVYK3xGHpbRW4dH+eWoLrrsRbQMfzmQLOfI
 0l/OpqFaTJKUSsNuH/g6S72f+p5QPwYgaLNiKSMaWhepDmrSIDeOa+kPFBRJHqdJbdto
 Gpa0E99VwiYJNiPD9TyiwJ+N1Z2QxUtuJlu9YnCKtAcd/j4jjJgHT6Fi2lim6VEuNkVG
 WeZQ==
X-Gm-Message-State: AOAM531A6f5FHClvNrDBT6AVJsPv92P81O9RetXKhKaXM0Y9kHq/PRwe
 /Znw6sNFS/UxNT6WmIrWit0rWmBP86WGXAJB
X-Google-Smtp-Source: ABdhPJycCqPiEj4Fy91vm5f7Vop0w7AzrrAnm2WQbI7Ea97cKBAmzMyeTl2UWEQ0Fl5LaEu3RHnLYQ==
X-Received: by 2002:a05:6a00:2184:b0:3f4:cac4:cf41 with SMTP id
 h4-20020a056a00218400b003f4cac4cf41mr6458553pfi.6.1631451934930; 
 Sun, 12 Sep 2021 06:05:34 -0700 (PDT)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com.
 [209.85.214.179])
 by smtp.gmail.com with ESMTPSA id r23sm3970999pjo.3.2021.09.12.06.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 06:05:34 -0700 (PDT)
Received: by mail-pl1-f179.google.com with SMTP id d17so4085989plr.12;
 Sun, 12 Sep 2021 06:05:34 -0700 (PDT)
X-Received: by 2002:a17:90a:bd18:: with SMTP id
 y24mr7585142pjr.83.1631451934132; 
 Sun, 12 Sep 2021 06:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210912124346.165540-1-frank.chang@sifive.com>
In-Reply-To: <20210912124346.165540-1-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 12 Sep 2021 21:05:23 +0800
X-Gmail-Original-Message-ID: <CANzO1D3f7fKZretwwjKG3axj3UBF5EjGT25F2J_PRCWo+8XpLA@mail.gmail.com>
Message-ID: <CANzO1D3f7fKZretwwjKG3axj3UBF5EjGT25F2J_PRCWo+8XpLA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/dma: Align SiFive PDMA behavior with real
 hardware
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000008f8f05cbcc0190"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Sun, 12 Sep 2021 13:05:39 -0000

--000000000000008f8f05cbcc0190
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<frank.chang@sifive.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=8812=E6=97=A5 =E9=
=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=888:46=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Frank Chang <frank.chang@sifive.com>
>
> Current QEMU PDMA doesn't align with real PDMA's behavior. This would
> result in Linux dmatest failed. This patchest aligns with real PDMA's
> behavior we tested on the real board. The golden results are performed
> in U-Boot on the Unmatched board with PDMA supported.
>
> Changelog:
>
> v2:
>   * Add comment to describe document errors.
>
> Frank Chang (3):
>   hw/dma: sifive_pdma: reset Next* registers when Control.claim is set
>   hw/dma: sifive_pdma: claim bit must be set before DMA transactions
>   hw/dma: sifive_pdma: don't set Control.error if 0 bytes to transfer
>
> Green Wan (1):
>   hw/dma: sifive_pdma: allow non-multiple transaction size transactions
>
>  hw/dma/sifive_pdma.c | 54 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 43 insertions(+), 11 deletions(-)
>
> --
> 2.25.1
>
>
>
I made a mistake while sending the patchset.
Please ignore this series, I will resend it again.
Sorry for the confusion.

Regards,
Frank Chang

--000000000000008f8f05cbcc0190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&lt;<a href=3D"mailto:frank.chang@sifive.=
com">frank.chang@sifive.com</a>&gt; =E6=96=BC 2021=E5=B9=B49=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=888:46=E5=AF=AB=E9=81=93=EF=BC=9A=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com"=
 target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
Current QEMU PDMA doesn&#39;t align with real PDMA&#39;s behavior. This wou=
ld<br>
result in Linux dmatest failed. This patchest aligns with real PDMA&#39;s<b=
r>
behavior we tested on the real board. The golden results are performed<br>
in U-Boot on the Unmatched board with PDMA supported.<br>
<br>
Changelog:<br>
<br>
v2:<br>
=C2=A0 * Add comment to describe document errors.<br>
<br>
Frank Chang (3):<br>
=C2=A0 hw/dma: sifive_pdma: reset Next* registers when Control.claim is set=
<br>
=C2=A0 hw/dma: sifive_pdma: claim bit must be set before DMA transactions<b=
r>
=C2=A0 hw/dma: sifive_pdma: don&#39;t set Control.error if 0 bytes to trans=
fer<br>
<br>
Green Wan (1):<br>
=C2=A0 hw/dma: sifive_pdma: allow non-multiple transaction size transaction=
s<br>
<br>
=C2=A0hw/dma/sifive_pdma.c | 54 +++++++++++++++++++++++++++++++++++--------=
-<br>
=C2=A01 file changed, 43 insertions(+), 11 deletions(-)<br>
<br>
--<br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>I made a mistake while sending the pat=
chset.</div><div>Please ignore this series, I will resend it again.</div><d=
iv>Sorry for the confusion.<br></div><div><br></div><div>Regards,</div><div=
>Frank Chang=C2=A0</div></div></div>

--000000000000008f8f05cbcc0190--


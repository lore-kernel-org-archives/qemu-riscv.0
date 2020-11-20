Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfvUn-0001nt-2a
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 20:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfvUe-0001mQ-Mi
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 20:45:45 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:45096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfvUZ-0004Bf-Qz
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 20:45:43 -0500
Received: by mail-ot1-x331.google.com with SMTP id k3so7312602otp.12
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 17:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nlqVnXZPG/FTPuTFPlQO1avvnEmIO3xgVTTWpXjyC/Q=;
 b=HrmIQIz22JHDbr5hUu6zSQOQwhqZqH3U1GJXivFS72cw2mzsR5pAmRdAeTufRmeC6i
 ijPSVHnXMC+42s3msOihaengCndJuYtxHVq8cGPhCTFGkSzYn4QXvrnKpfvrgkJR2JxV
 ud3wwa2PxqDs0TAjQ8Z0ljRGnjdsEmQY1HM7hQ1RTbnEo8QxvWFaSrNxou5T8CGY5dqW
 Tjos6aFRqobumklpKzwrg3VLx5Nk+q5SiwK2aUcwCRKucse7K60LugNzUxmoqIBLQSah
 iKMSJAXpDRrN173gnZY3ANayBKh4K64g7WIeBzNKbbMKkaYjf+aUY6zCVeOAkdPkT65x
 PjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nlqVnXZPG/FTPuTFPlQO1avvnEmIO3xgVTTWpXjyC/Q=;
 b=YRvxSVPAR7sRDnNzVniVL/g2Jx2C2/LYFunQrHXJx08ziaeseRlcao1i4C0cYIqjIe
 mDz5r19ASZh/Vpcp+8wsfE9scOqe5flPqXvjN2m/EaX2XQGPVt/dY+mCm9sL5Pjp7Tqc
 TzLosAkinCxc/CPo4puVE3WbIYjif3r7SGTO+uuCJ3X5c+nLEVJQln5bIxmPQHh0iexZ
 F9sb/hyTbQJ/woYosfyCkV76MqHqyS2bnEit/zpJ1Uj7iWJUYBLmmpDho61NrNBxFu14
 TmA23/bKuWsh+HX0BowYViaiQDy6hnfhGn3PDHeL/dh2gJ2EZoG9Qzd/Fw5gZhz3eJv3
 LXfA==
X-Gm-Message-State: AOAM5336Rz7MPkFPXj3Ip6kL7x4RqtbfkqaQ8s74A98/4nsz0ozyOrSa
 9V2iEkQIVSrRDpG5ThKiU/goA4eufd77Ybqrfz1Tfg==
X-Google-Smtp-Source: ABdhPJzYBfTWqjBZPpmoBF2KO5pKwkkjatotGuyTBEakwmRYBlDJMgGVDHS62y2gymgU4vQUWtZc/VHXnnvu+chSX/8=
X-Received: by 2002:a9d:3b4:: with SMTP id f49mr12916837otf.188.1605836735618; 
 Thu, 19 Nov 2020 17:45:35 -0800 (PST)
MIME-Version: 1.0
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <2546c25f-e60d-7fa4-9106-2de1ab619daf@linaro.org>
In-Reply-To: <2546c25f-e60d-7fa4-9106-2de1ab619daf@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 20 Nov 2020 09:45:25 +0800
Message-ID: <CAE_xrPh1DxYosZ2PyGrf-Lkv1PGoWeCKkkcNyN9XUg+D=BPp7g@mail.gmail.com>
Subject: Re: [RFC 00/15] support subsets of bitmanip extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000031b3fa05b48000bf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x331.google.com
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
X-List-Received-Date: Fri, 20 Nov 2020 01:45:45 -0000

--00000000000031b3fa05b48000bf
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2020 at 6:26 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> > This patchset implements RISC-V B-extension latest draft version
> > (2020.10.26) Zbb, Zbs and Zba subset instructions.
>
> With some additional instructions from Zbp, it seems.  Although the
> document
> isn't completely coherent, with various instructions being present in
> multiple
> subsets, and some instructions w/ strike-out.
>
> The B extension requires more than these three, but I suppose turning it on
> with just these 3 subsets during development is ok.
>
>
> r~
>

Yes, some instructions are striked out and moved to another subset during
my implementation.
The B extension spec. is still changing occasionally.

I will send out the next patchset based on your comments.
Thanks for the reviews.

Frank Chang

--00000000000031b3fa05b48000bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Nov 20, 2020 at 6:26 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 11/18/20 12:29 AM, <a href=3D"m=
ailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> =
wrote:<br>
&gt; This patchset implements RISC-V B-extension latest draft version<br>
&gt; (2020.10.26) Zbb, Zbs and Zba subset instructions.<br>
<br>
With some additional instructions from Zbp, it seems.=C2=A0 Although the do=
cument<br>
isn&#39;t completely coherent, with various instructions being present in m=
ultiple<br>
subsets, and some instructions w/ strike-out.<br>
<br>
The B extension requires more than these three, but I suppose turning it on=
<br>
with just these 3 subsets during development is ok.<br>
<br>
<br>
r~<br></blockquote><div><br></div><div>Yes, some instructions are striked o=
ut and moved to another subset during my implementation.<br></div><div>The =
B extension spec. is still changing occasionally.</div><div><br></div><div>=
I will send out the next patchset based on your comments.</div><div>Thanks =
for the reviews.</div><div><br></div><div>Frank Chang</div></div></div>

--00000000000031b3fa05b48000bf--


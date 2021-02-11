Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lA133-0000W8-Tk
	for mharc-qemu-riscv@gnu.org; Wed, 10 Feb 2021 20:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <billa.iitmadras@gmail.com>)
 id 1lA131-0000Vf-V2
 for qemu-riscv@nongnu.org; Wed, 10 Feb 2021 20:45:35 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <billa.iitmadras@gmail.com>)
 id 1lA130-0006JP-94
 for qemu-riscv@nongnu.org; Wed, 10 Feb 2021 20:45:35 -0500
Received: by mail-ed1-x530.google.com with SMTP id df22so5316484edb.1
 for <qemu-riscv@nongnu.org>; Wed, 10 Feb 2021 17:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TH4ZAPPUAkekoGcif0gl1yrZhT93LD5EYheRiOawp9c=;
 b=fOPCk+UHl57xGJG+oicLFW8q2+meMDnCGroKm2hBZBQSf6iHaTQho3W8Iv0TCPqZrP
 yvT1I7N5AGhtJwpnrDEkaZjXEgnHDKA0dQRFG2dqTsgbC7v0VQG8neLBckBfVDRLX05D
 Gx2pKOVUUizlCE/EZKsjRC8wWJKCRz94hxu07LdSGjy8Pr+y9I2wfRNXjhHY21UyzXxf
 7RcEQMWlSORA49ts4RojvEJtXqWtQsP8Ng1Tf5/Mita+nnDktc9CTE3VaTJ2DwHLbdJ2
 rFgWbRaA9JMFyKad2xYNVx6YLFo4uhKQoFfgcooM4uXL0PSGvx45tTMdz++N0VPFDmzn
 79SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TH4ZAPPUAkekoGcif0gl1yrZhT93LD5EYheRiOawp9c=;
 b=WzUImUtBNSt0VTgjPS4/1H0U4tHFui1UcBGJU+E8jIbJASk4XnT12Ru3/KYGccXE1x
 PcZc9vWha7VYf16RsVWo9nSJRsGHJnmncnXLrjwO1Nn8SKVEZeS0WZBDhxiOg6L8SHPP
 KkZfOIYyya4T8l1e3ENozVbOhSfyvVcRP7iLzWRME/7YZzwhErUaONWVQU7izJsHqaNn
 7Dj7xEbUa5FP4733je6BMbY6JTHrvHIdFq22gMcLLWjof/MMLBGwI5+ff+gNIQeySqsu
 NITNsd518vNIopvCR6splfFdbcH9+S1R8tnXGctvSen1JTP5N59CI8DlWVHHdXxybzIO
 hahQ==
X-Gm-Message-State: AOAM533UAGoZX67ZeJDsgGLA4BCAKRM/xR9sYX0vkKykDFTN9P53rbNX
 F2+fJaoMNGy3lM1ENsmyEDnO+g4fayAr+6pHyjk=
X-Google-Smtp-Source: ABdhPJziOj5oH4JmA6jKcrp8M0o5PatxzleZFCJ+8du0mHhfm7GTbcpbb88jLCxZNg9JecSB5d1eujG2D6G+jSSNRBA=
X-Received: by 2002:a50:b742:: with SMTP id g60mr5776991ede.113.1613007931583; 
 Wed, 10 Feb 2021 17:45:31 -0800 (PST)
MIME-Version: 1.0
References: <CAKBF_5qGScpAzeaJKHs4102nqVCmjmNq05EXLHLbLPV9tXBd9g@mail.gmail.com>
 <mhng-1181297c-6676-455c-af50-9c947b9a470d@palmerdabbelt-glaptop>
In-Reply-To: <mhng-1181297c-6676-455c-af50-9c947b9a470d@palmerdabbelt-glaptop>
From: Billa Surendra <billa.iitmadras@gmail.com>
Date: Thu, 11 Feb 2021 07:15:19 +0530
Message-ID: <CAKBF_5q4ccvJrYJoZE1csUP0YCN_wVOCWLOtEHYL2oSxqaTs8Q@mail.gmail.com>
Subject: Re: qemu support for rv64imafd/rv64imafdc
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c8312605bb05ac16"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=billa.iitmadras@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 11 Feb 2021 01:45:36 -0000

--000000000000c8312605bb05ac16
Content-Type: text/plain; charset="UTF-8"

Thanks for the info.

On Thu, 11 Feb, 2021, 1:58 am Palmer Dabbelt, <palmer@dabbelt.com> wrote:

> On Wed, 10 Feb 2021 02:10:35 PST (-0800), billa.iitmadras@gmail.com wrote:
> > Does riscv qemu support  both kernel image generated with RV64IMAFD
> > extensions and Image generated with RV64IMAFDC ?. If the answer is yes,
> how
> > is it supporting both ?. Please reply to my question if anyone knows.
>
> You can use CPU properties to enable/disable various ISA subsets.
> Something like
>
>     qemu-system-riscv64 -cpu rv64,c=off
>
> would turn C off.  The other supported ISA subsets can be enabled/disabled
> in a
> similar fashion, including everything you listed.  There's no known reason
> RV64G (ie, non-C) kernels wouldn't work but they're not widely used so you
> may
> run into some long-tail issues.  You need C for EFI, but most people aren't
> using that on RISC-V yet.
>

--000000000000c8312605bb05ac16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the info.=C2=A0</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 11 Feb, 2021, 1:58 am P=
almer Dabbelt, &lt;<a href=3D"mailto:palmer@dabbelt.com">palmer@dabbelt.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 10 Feb 2021=
 02:10:35 PST (-0800), <a href=3D"mailto:billa.iitmadras@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">billa.iitmadras@gmail.com</a> wrote:<br>
&gt; Does riscv qemu support=C2=A0 both kernel image generated with RV64IMA=
FD<br>
&gt; extensions and Image generated with RV64IMAFDC ?. If the answer is yes=
, how<br>
&gt; is it supporting both ?. Please reply to my question if anyone knows.<=
br>
<br>
You can use CPU properties to enable/disable various ISA subsets.=C2=A0 Som=
ething like<br>
<br>
=C2=A0 =C2=A0 qemu-system-riscv64 -cpu rv64,c=3Doff<br>
<br>
would turn C off.=C2=A0 The other supported ISA subsets can be enabled/disa=
bled in a<br>
similar fashion, including everything you listed.=C2=A0 There&#39;s no know=
n reason<br>
RV64G (ie, non-C) kernels wouldn&#39;t work but they&#39;re not widely used=
 so you may<br>
run into some long-tail issues.=C2=A0 You need C for EFI, but most people a=
ren&#39;t<br>
using that on RISC-V yet.<br>
</blockquote></div>

--000000000000c8312605bb05ac16--


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jibAX-00078j-ND
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 06:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1jibAW-00077v-48
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 06:07:44 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:45842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1jibAU-0007ov-SV
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 06:07:43 -0400
Received: by mail-il1-x142.google.com with SMTP id 9so19688395ilg.12
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F2aG56k+a2G508zcUJ3HboIMxYkZy/lIq/5XCAOIFgw=;
 b=I29SJAF+OrTb5PYA5mKDYuynlVj2Ze19CQOMO0QXcgzQY6fKTbrF9tpT/cxxdcSaJA
 Im55D+ZDsBMX0u0+kS4dvG6OY9pplfw13Hmi/BIcChyI4iYB9A25SIyY8mBVznXYHLm0
 S6+CzYbtJlTYxP6DjYsj2aeNfWlOnqp8NhM8SR+5T1YQwDvYMCeroytSLvCMrSZGySQl
 EUIvAT9pOQyJVx8qJjk+Ut1H+TFFOOzOkB/VgzNJ3oOS6HM5ywg8s8YCfN3kpPAfmIh5
 mCMk/IcZbLIxgO/0lqEtwncg0fYcKZXqtIj6Ka8UZuZKYHs9NS62D8R0U/tCuNQDeZwm
 EE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F2aG56k+a2G508zcUJ3HboIMxYkZy/lIq/5XCAOIFgw=;
 b=eszaQMBS4KTEvrjjFjBhRWltCPH6H8JaSGA0m+VftOiqC+dR3o/8wTuMvOBshVdHG0
 yh6mjbCy4r6D+sPxDER+2OOol3Bhra0fSQNoj/N5zl2rpdpLH72bSqaplDNz/ayVX43M
 URx6RH5H2zEaJsyVGrB9EiOei+zMeYF+zefHF2Zm4IdFFzJcPwtodNSclKZXpvJxzppQ
 UzjuHs678700Evg9PNhQej/fA4VA8YTWuxSsKNAWKQ0C/QZPq+GOZ2rKGxm/A+5XYC0/
 Wbo6VMqWGtXFTs6MaBgGqqgyhxnos7J9NrHmqEeq6AGTku3TgvlRPcdCN5QL+kMcRz/b
 MuWg==
X-Gm-Message-State: AOAM5324YF8i/+Covopt6xFUcD9Sc6s7As9ajLyJt6p09rxNWrgCayFO
 3Y1P/tKYg7dJGobG81ZytS44bZ6y1ncaOMSUT++VUw==
X-Google-Smtp-Source: ABdhPJy9r6yPAS7hDo6N86BPIv51i0vM5vQbTFYwX7yguNC0ZOArA+MGg7ibTOpHZCldlpA8nf88bTcdI0LjYQyoZw0=
X-Received: by 2002:a92:c812:: with SMTP id v18mr26606776iln.178.1591697260799; 
 Tue, 09 Jun 2020 03:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200128003707.17028-1-ianjiang.ict@gmail.com>
 <b14a65dd-b565-77ca-d479-f88e53ca0721@linaro.org>
In-Reply-To: <b14a65dd-b565-77ca-d479-f88e53ca0721@linaro.org>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Tue, 9 Jun 2020 18:07:30 +0800
Message-ID: <CAEiOBXXOA40F5kdttMby6eAfMGYVT0twZOhkojFK9qRDX1Xchw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Add helper to make NaN-boxing for FP register
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Ian Jiang <ianjiang.ict@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, palmer@dabbelt.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d2089a05a7a3e549"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=chihmin.chao@sifive.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 09 Jun 2020 10:07:44 -0000

--000000000000d2089a05a7a3e549
Content-Type: text/plain; charset="UTF-8"

ping ?  Could this be merged ?


Chih-Min Chao



On Wed, Jan 29, 2020 at 3:43 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/27/20 4:37 PM, Ian Jiang wrote:
> > The function that makes NaN-boxing when a 32-bit value is assigned
> > to a 64-bit FP register is split out to a helper gen_nanbox_fpr().
> > Then it is applied in translating of the FLW instruction.
> >
> > Signed-off-by: Ian Jiang <ianjiang.ict@gmail.com>
> > ---
> >  target/riscv/insn_trans/trans_rvf.inc.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>
>

--000000000000d2089a05a7a3e549
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping ?=C2=A0 Could this be merged ?<div><br></div><div><br=
 clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr"><span style=3D"color:rgb(136,136,13=
6)">Chih-Min Chao</span><div style=3D"color:rgb(136,136,136)"><br></div></d=
iv></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Jan 29, 2020 at 3:43 AM Richard Henderson =
&lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 1/27/20 4:37 PM, Ian Jiang wrote:<br>
&gt; The function that makes NaN-boxing when a 32-bit value is assigned<br>
&gt; to a 64-bit FP register is split out to a helper gen_nanbox_fpr().<br>
&gt; Then it is applied in translating of the FLW instruction.<br>
&gt; <br>
&gt; Signed-off-by: Ian Jiang &lt;<a href=3D"mailto:ianjiang.ict@gmail.com"=
 target=3D"_blank">ianjiang.ict@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvf.inc.c | 17 +++++++++++++++--<b=
r>
&gt;=C2=A0 1 file changed, 15 insertions(+), 2 deletions(-)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
<br>
r~<br>
<br>
</blockquote></div>

--000000000000d2089a05a7a3e549--


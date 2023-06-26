Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7DBEB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 16:26:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDp2H-00077c-5X; Mon, 26 Jun 2023 12:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siva63@multicorewareinc.com>)
 id 1qDp2F-00074B-9P
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 12:25:51 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <siva63@multicorewareinc.com>)
 id 1qDp2B-0005mB-Qy
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 12:25:50 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-666ecf9a0ceso1766489b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 09:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=multicorewareinc-com.20221208.gappssmtp.com; s=20221208; t=1687796745;
 x=1690388745; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9j9r2Td0eXmY3DMj9t+LKfFGzmdz4SgEY/P67nzskqE=;
 b=uksYxYZX/6TjM6+tpqs1Zcc/YKTpKpRyuDB1Gyun4k72f3yrRDJyyabzA/cAA2xxRw
 beifFcU53x4wN76YQ6hjr86wjDrFNBNJRexVZGV7lsTIkbfwQbj6BfqyQ+JJNIljM0Np
 HB8Ah6mcXTZQX7jw/OwwunCi/4wTOrf+7bQLyU4+/1R/umcXSkMTZUha0TsT9wizIhoG
 ZpUx8psvxZHfgmb2sbvv/t3vObEBxHOCcaA5Q4CgJGbsym6lUlid8Ssgff7dyyGwUJhL
 4D9Yodvva3dUXYZGdrdwfGj6qQbsOVDz2+DgwRAokrORXnuhl3xPrEbrsRt0cThxY+8l
 /X7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687796745; x=1690388745;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9j9r2Td0eXmY3DMj9t+LKfFGzmdz4SgEY/P67nzskqE=;
 b=ZDep+6JKzC7ItmeFSU3Y2gpbsb1mBrXe/tznx6GfEPQHRYqVdxrpyNsxAtZOwqXwv4
 4kXN0v1J4cyOVqrWMS+WVoWIwkSHA/2FAgoiVV+rpqYzKN/iS9F+U9jG7WcWrFbeNm+3
 F63Zr/8Ad+uZu45VT9dRbe+cWFkjHbTKw6xqYfuuKuMLTr1d1Suc6p/ME8+bc9KEbYUu
 0ivzUqOQPSSIscqSm6Wq5QDibHALslGJMSgAmuyJobhaERMDB+8D1BvzJuGetEC8bCH0
 12WYD7o5u3v55KQqrl/gV7SUYtLC0TONDKskqrvBKOHuqJZ1GMnUFZNRpIJvx3x6rss5
 5ugQ==
X-Gm-Message-State: AC+VfDy8ZJnGYGRld8hPrY6Y8aPeGwQO6zR9zbAtWiK+U2BH7Hr4/5o2
 8lYR8UmxtdVBiGnAoyDm2dCSmVsgPihxWc7mMhQnRg==
X-Google-Smtp-Source: ACHHUZ41z+mv1Kmo1SM/Q97+EjUdlj7d6K5iM01wNFcZNIO0MLzdHA60I4WomDszD53GzfDxAxjra+wJs0mc0Pg9I7U=
X-Received: by 2002:a17:90a:284e:b0:262:d7db:2520 with SMTP id
 p14-20020a17090a284e00b00262d7db2520mr4241646pjf.26.1687796744821; Mon, 26
 Jun 2023 09:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAL==hzEn=YoaFgiTj9Fm8bBPP7Ea==R=gZFyEO6JN8nSYyefLg@mail.gmail.com>
 <7952aa6d-4657-4755-d65e-ac3800cae273@ventanamicro.com>
In-Reply-To: <7952aa6d-4657-4755-d65e-ac3800cae273@ventanamicro.com>
From: Sivachandran S <siva63@multicorewareinc.com>
Date: Mon, 26 Jun 2023 21:55:36 +0530
Message-ID: <CAL==hzE44Fdm4bVEWxecDAuMDkf=qwVsk44mis5xgYH+y_XM-A@mail.gmail.com>
Subject: Re: RISCV vector cryptography support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006db5e705ff0acd5a"
Received-SPF: permerror client-ip=2607:f8b0:4864:20::436;
 envelope-from=siva63@multicorewareinc.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--0000000000006db5e705ff0acd5a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thanks for the information.
In that case it means that QEMU only supports the scalar cryptographic
instructions alone. Please confirm.
Also please let me know how to test with QEMU, or point to any link or
material, where the crypto tests shall be run for RISCV in QEMU.

Thanks,
Siva.S


On Thu, Jun 22, 2023 at 7:01=E2=80=AFPM Daniel Henrique Barboza <
dbarboza@ventanamicro.com> wrote:

> Hi,
>
> On 6/21/23 22:24, Sivachandran S wrote:
> > Hi,
> >
> > We are working on the RISC-V virt platform for one of the projects. So =
I
> would like to know whether the QEMU supports RISCV vector cryptographic
> instructions. If so please let me know which QEMU version supports it.
>
> QEMU doesn't have vector crypto support at this moment. It's currently a
> work under review:
>
> https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg05580.html
>
> Depending on how the review goes, QEMU 8.1 (to be released in August) wil=
l
> implement this support.
>
>
> Thanks,
>
> Daniel
>
> >
> > Regards,
> > Siva.S
>

--0000000000006db5e705ff0acd5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Daniel,<div><br><div>Thanks for the=C2=A0information.</=
div><div>In that case it means that QEMU only supports the scalar cryptogra=
phic instructions alone. Please confirm.</div><div>Also please let me know =
how to test with QEMU, or point to any link or material, where the crypto t=
ests shall be run for RISCV in QEMU.</div><div><br></div><div>Thanks,</div>=
<div>Siva.S</div><div><br></div></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 22, 2023 at 7:01=E2=80=AF=
PM Daniel Henrique Barboza &lt;<a href=3D"mailto:dbarboza@ventanamicro.com"=
>dbarboza@ventanamicro.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi,<br>
<br>
On 6/21/23 22:24, Sivachandran S wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; We are working=C2=A0on the RISC-V virt platform for one of the project=
s. So I would like to know whether the QEMU supports RISCV vector cryptogra=
phic instructions. If so please let me know which QEMU version supports it.=
<br>
<br>
QEMU doesn&#39;t have vector crypto support at this moment. It&#39;s curren=
tly a<br>
work under review:<br>
<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg05580.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2023-04/msg05580.html</a><br>
<br>
Depending on how the review goes, QEMU 8.1 (to be released in August) will<=
br>
implement this support.<br>
<br>
<br>
Thanks,<br>
<br>
Daniel<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Siva.S<br>
</blockquote></div>

--0000000000006db5e705ff0acd5a--


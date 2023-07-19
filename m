Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB9DC001DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 10:10:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qM48Q-0003NU-ET; Wed, 19 Jul 2023 06:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siva63@multicorewareinc.com>)
 id 1qM48P-0003NJ-Nk
 for qemu-riscv@nongnu.org; Wed, 19 Jul 2023 06:10:17 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <siva63@multicorewareinc.com>)
 id 1qM48N-00082P-3h
 for qemu-riscv@nongnu.org; Wed, 19 Jul 2023 06:10:17 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-55b5a3915f5so4100785a12.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Jul 2023 03:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=multicorewareinc-com.20221208.gappssmtp.com; s=20221208; t=1689761412;
 x=1690366212; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kGEAUe8UzGta2QO8htb1oP/7lkheJsB40/IvRPnz+gM=;
 b=O0YG4p43KRIITNVj4yToLw7XD+R5CacqpGq8SMHfBfksy354Kq8RCNm+YIw1+FKKfm
 D0QjfGlFiBnYRy+xUL9WmeMgRiKxhhyrHrINfJXkqoidq6wfxEw3dMAvy9w3x5pBx0ec
 uVuGk/UvHQ7MZWNhUwggOzAeHJTcQz7QMfiDHstBwZ7KDfkdblXPiXW64dfqCrkem4vJ
 XXCcDd8VFf+DK5yNxzkUUGlJc0yuaKnFUOtoM+P+2MsPPW+24IWdj5ZQOfx+Wy2LJSaj
 xV70fR2JYQ98/bUj3s0xPn7rKMm8STcf+SulTuCBTwXcnvLjm+08+mWUJoZeFMYdY6YA
 tW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689761412; x=1690366212;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kGEAUe8UzGta2QO8htb1oP/7lkheJsB40/IvRPnz+gM=;
 b=dLR9TeaUWCu7oidS2dIm8KfpNPeghHYwSDDPIAEC6p+t//p+X8i0liC+V/3FQf6mGu
 /qmH++P+r6hirDO/ETK96lMw/AHAJnh+6o3BU9aTsPMZrCpF0u8s8y+9x+NXFjUHgiMX
 n632FoKq4YfTyKGOK086AkNgIK39KMjRybvmsEq+3KrfdyDJ06s2YNyOKjo321QqchUO
 rlGSvbmESqnu8zbQQbLE1zJFgaXe0Ifp0YLh/0ouGbK+g9RQMyqXs/ChqUS6oEHo/2qT
 WJmhEi+RFAkiEarL8RNlyf81w7ElFq5tgeIW25U2CAhQHvWdQgQzx0DIkDBsUK0hhCJp
 m8JA==
X-Gm-Message-State: ABy/qLb8jqgsjAij8zUG1LM50vdsz99/IJAmjkr0v2Xv3Bvpwdo1fEGy
 BC9WKPCkShEW0ZUInELGpc8j0pbtwz77gGob3kuBpg==
X-Google-Smtp-Source: APBJJlFM1t3UB2dhP8d74pt5fKMY1pR1ZKDEC2F5qko2RjkeUIvQLCMzEGtZ30ON/vBsm6/Crj9q6EesFO+sqsZSPdw=
X-Received: by 2002:a17:90a:db84:b0:262:f029:6946 with SMTP id
 h4-20020a17090adb8400b00262f0296946mr1308450pjv.9.1689761412515; Wed, 19 Jul
 2023 03:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAL==hzEn=YoaFgiTj9Fm8bBPP7Ea==R=gZFyEO6JN8nSYyefLg@mail.gmail.com>
 <7952aa6d-4657-4755-d65e-ac3800cae273@ventanamicro.com>
 <CAL==hzE44Fdm4bVEWxecDAuMDkf=qwVsk44mis5xgYH+y_XM-A@mail.gmail.com>
In-Reply-To: <CAL==hzE44Fdm4bVEWxecDAuMDkf=qwVsk44mis5xgYH+y_XM-A@mail.gmail.com>
From: Sivachandran S <siva63@multicorewareinc.com>
Date: Wed, 19 Jul 2023 15:40:00 +0530
Message-ID: <CAL==hzH0zihAjUTk+Yng+RN24kGcA6XLzOY4MZZ5o+Ptog9g2g@mail.gmail.com>
Subject: Re: RISCV vector cryptography support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000bfa3020600d43c03"
Received-SPF: softfail client-ip=2607:f8b0:4864:20::530;
 envelope-from=siva63@multicorewareinc.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--000000000000bfa3020600d43c03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

How to disable the scalar crypto instructions support in the QEMU?
Is there any specific command line option, please let me know.

Regards,
Siva.S

On Mon, Jun 26, 2023 at 9:55=E2=80=AFPM Sivachandran S <siva63@multicorewar=
einc.com>
wrote:

> Hi Daniel,
>
> Thanks for the information.
> In that case it means that QEMU only supports the scalar cryptographic
> instructions alone. Please confirm.
> Also please let me know how to test with QEMU, or point to any link or
> material, where the crypto tests shall be run for RISCV in QEMU.
>
> Thanks,
> Siva.S
>
>
> On Thu, Jun 22, 2023 at 7:01=E2=80=AFPM Daniel Henrique Barboza <
> dbarboza@ventanamicro.com> wrote:
>
>> Hi,
>>
>> On 6/21/23 22:24, Sivachandran S wrote:
>> > Hi,
>> >
>> > We are working on the RISC-V virt platform for one of the projects. So
>> I would like to know whether the QEMU supports RISCV vector cryptographi=
c
>> instructions. If so please let me know which QEMU version supports it.
>>
>> QEMU doesn't have vector crypto support at this moment. It's currently a
>> work under review:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg05580.html
>>
>> Depending on how the review goes, QEMU 8.1 (to be released in August) wi=
ll
>> implement this support.
>>
>>
>> Thanks,
>>
>> Daniel
>>
>> >
>> > Regards,
>> > Siva.S
>>
>

--000000000000bfa3020600d43c03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Daniel,<div><br></div><div>How to disable the scalar cr=
ypto instructions support in the QEMU?</div><div>Is there any specific comm=
and line option, please let me know.</div><div><br></div><div>Regards,</div=
><div>Siva.S</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Mon, Jun 26, 2023 at 9:55=E2=80=AFPM Sivachandran S &l=
t;<a href=3D"mailto:siva63@multicorewareinc.com">siva63@multicorewareinc.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr">Hi Daniel,<div><br><div>Thanks for the=C2=A0information.<=
/div><div>In that case it means that QEMU only supports the scalar cryptogr=
aphic instructions alone. Please confirm.</div><div>Also please let me know=
 how to test with QEMU, or point to any link or material, where the crypto =
tests shall be run for RISCV in QEMU.</div><div><br></div><div>Thanks,</div=
><div>Siva.S</div><div><br></div></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 22, 2023 at 7:01=E2=80=
=AFPM Daniel Henrique Barboza &lt;<a href=3D"mailto:dbarboza@ventanamicro.c=
om" target=3D"_blank">dbarboza@ventanamicro.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
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
</blockquote></div>

--000000000000bfa3020600d43c03--


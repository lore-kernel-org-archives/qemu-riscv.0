Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D56C25B78
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 May 2024 12:30:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sBvxw-0006SS-PJ; Tue, 28 May 2024 08:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1sBvxt-0006Ru-Oa
 for qemu-riscv@nongnu.org; Tue, 28 May 2024 08:30:05 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1sBvxX-000156-Rp
 for qemu-riscv@nongnu.org; Tue, 28 May 2024 08:30:05 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5789733769dso4343236a12.1
 for <qemu-riscv@nongnu.org>; Tue, 28 May 2024 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1716899378; x=1717504178; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pUfqv/KVYDO6h5D9hyOtJ8++6zArXvavYsCB8x+7lh0=;
 b=YXwPjJTIpBzraDMjfLcmoqD8mFy46H3lJ18zJe9WjjWz5/Z+pPu3HIH9FP6ng359Vh
 jV/y3ArGct1S41fgVcyboVSZn7YbEomRD3M4g5Jppj1R+8RWJGuP+HqaAgIIo/PqqOS3
 g7Tl1scoBVTCdFIScvFUDTnAQLiISsMKJqqWPXRP4n5PjxUU+4b0Y4dmesKP2ZpMaXO1
 kzOJSMv/Xvx7/q3w2YO/aKcYzLAzLS+iRgWH37U2BAMgdU57Dlh1sW2s6GjTWaXlngsm
 Bs8TALOKqOjaXzp1G7El4aL3jJKUksrcOdV1+KRJjRzgkrlHe3cJ+GGH+Mq4yCeE1S1m
 Vvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716899378; x=1717504178;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pUfqv/KVYDO6h5D9hyOtJ8++6zArXvavYsCB8x+7lh0=;
 b=QaFiRV/M0Iklhp0Mi5JR3RaCEuGSGZLF3++0o72Oh8R9fI9rSHqo5SM4y4iUjtx852
 yZhGDOfDbKi1PCyTYvbmo1hApo0LwxyVWXDuaoNC5lG4MAFVP6l8lUXM3ESrTxU+5U7w
 h/d89BJAQjbFD6y+8oxtJnsq6PkrTIfkoH1O+kuK7Az2VK2yxZ+pbZWHPpyORXPj5UGG
 wE+MuEYUePvbLn73soM79QrmeqMZIdZ+gW4s4B2cpz1+Zlv7tMMwLzJTs8nOdKUMJ7AX
 S2An6Ij7A4ZUIS7DC4WJCmeEgDzGqFknWfKmQb+O9sB8RCOAf38eOZBevsYL4MgCeIb7
 M2Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe5oU3bSWGQgj/c6w1O9ce8sAUzj6O61hZqC7jA6PM5CmGJoXh2i9IO79nf82yKvyJiBNpIVuS6t34mfqgMlxkfM0i+iM=
X-Gm-Message-State: AOJu0YySb8AuPYwJ3LRNHDZY+cFsWmDhL3Yk0bU/+KmMpZU3qa7AdkGg
 XiJ7R1wgsh9YEQZBUQeUHL1QBCNpJiY/vxG2FOOLV09+ihIkfmTLDM2c3nIp0fnymnrL9LdgbNc
 OIxcVzLl4F/DdAI7o3/WLWa0g6XHOJziyaVU0rX8hybLNL3CGvPVMVM6c
X-Google-Smtp-Source: AGHT+IHf7mxx0/aoXFOfwsSc1dq3q60vFLyaS+LMbf3BJi5x26Ya29sHJ5wH5opxPJ2kvAlh0Ur1Lp2Yo6KXMvOXWZE=
X-Received: by 2002:a50:871d:0:b0:578:62e7:e5a7 with SMTP id
 4fb4d7f45d1cf-57862e7e68dmr9599458a12.4.1716898900171; Tue, 28 May 2024
 05:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240516123336.63534-1-jerry.zhangjian@sifive.com>
 <CAKmqyKPOwY6Hi8m8C6yMd-jYMxY1RTGObqiZDymTJBVupi+AMQ@mail.gmail.com>
 <2e0570f8-16ad-452f-a41e-c60d9e796645@Canary>
In-Reply-To: <2e0570f8-16ad-452f-a41e-c60d9e796645@Canary>
From: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Date: Tue, 28 May 2024 20:21:03 +0800
Message-ID: <CAE5PzY+yBg59qe8rdCng-Q94shdpGvbMNFGDwX9yfT=KMfi0gg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: zvbb implies zvkb
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, frank.chang@sifive.com, qemu-riscv@nongnu.org, 
 max.chou@sifive.com
Content-Type: multipart/alternative; boundary="0000000000000f8721061982ad35"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jerry.zhangjian@sifive.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_REMOTE_IMAGE=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

--0000000000000f8721061982ad35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I had the bad mail client setting. Please ignore the previous email,
and I will resubmit the patch.

--
Jerry

Jerry ZJ <jerry.zhangjian@sifive.com> =E6=96=BC 2024=E5=B9=B45=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:12=E5=AF=AB=E9=81=93=EF=BC=
=9A

>
> *Canary Mail You've received a secure email*
> jerry.zhangjian@sifive.com has sent you a secure email via Canary Mail.
> Read Secure Email
> <https://secure.canarymail.io/read?obj_id=3D04c03de7-d745-472e-b026-7dd83=
9bc34a0&obj_key=3DeGJUOWtORkFXenBvWTJyMSt4VGpWdz09&thr_id=3D04c03de7-d745-4=
72e-b026-7dd839bc34a0>
> If you expect to correspond often with jerry.zhangjian@sifive.com, we
> recommend you download Canary Mail for free.
> Download Canary <https://canarymail.io>
> [image: Twitter] <http://www.twitter.com/CanaryMailApp>
> [image: Website] <https://canarymail.io>
> Privacy <https://canarymail.io/privacy.html> | Terms
> <https://canarymail.io/terms.html> | Docs <https://help.canarymail.io/> |
> Support <https://canarymail.zendesk.com/hc/en-us/requests/new>
>
> Copyright =C2=A9 2021 Canary Mail, All rights reserved.
>

--0000000000000f8721061982ad35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, I had the bad mail client setting. Please ignore th=
e previous email, and I will resubmit the patch.<div><br></div><div>--</div=
><div>Jerry</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Jerry ZJ &lt;<a href=3D"mailto:jerry.zhangjian@sifive.com"=
>jerry.zhangjian@sifive.com</a>&gt; =E6=96=BC 2024=E5=B9=B45=E6=9C=8828=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:12=E5=AF=AB=E9=81=93=EF=BC=9A=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,=
204,204);padding-left:1ex"><div class=3D"msg7448955360842048210"><u></u>

   =20
       =20
       =20
       =20
       =20
       =20
       =20

   =20
    <div id=3D"m_744895536084204821004c03de7-d745-472e-b026-7dd839bc34a0">
        <div name=3D"04c03de7-d745-472e-b026-7dd839bc34a0">
       =20
        <span class=3D"m_7448955360842048210mcnPreviewText" style=3D"displa=
y:none;font-size:0px;line-height:0px;max-height:0px;max-width:0px;opacity:0=
;overflow:hidden"></span>
       =20
        <center>
            <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspac=
ing=3D"0" height=3D"100%" width=3D"100%" id=3D"m_7448955360842048210bodyTab=
le">
                <tbody><tr>
                    <td align=3D"center" valign=3D"top" id=3D"m_74489553608=
42048210bodyCell">
                       =20
                        <table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" width=3D"100%">
                            <tbody><tr>
                                <td align=3D"center" valign=3D"top" id=3D"m=
_7448955360842048210templateHeader">
                                   =20
                                    <table align=3D"center" border=3D"0" ce=
llpadding=3D"0" cellspacing=3D"0" width=3D"100%" class=3D"m_744895536084204=
8210templateContainer">
                                        <tbody><tr>
                                            <td valign=3D"top" class=3D"m_7=
448955360842048210headerContainer"><table border=3D"0" cellpadding=3D"0" ce=
llspacing=3D"0" width=3D"100%" style=3D"min-width:100%">
    <tbody>
            <tr>
                <td valign=3D"top" style=3D"padding:9px">
                    <table align=3D"left" width=3D"100%" border=3D"0" cellp=
adding=3D"0" cellspacing=3D"0" style=3D"min-width:100%">
                        <tbody><tr>
                            <td valign=3D"top" style=3D"padding:0px 9px">


                                        <img align=3D"left" alt=3D"" src=3D=
"https://mcusercontent.com/0521b951afa69c15385b96eab/images/b8d4cfbb-eed4-5=
732-94ac-10fb3978f9b9.png" width=3D"43.52" style=3D"max-width: 256px; paddi=
ng-bottom: 0px; vertical-align: bottom; display: inline;" class=3D"m_744895=
5360842048210mcnImage">


                            </td>
                        </tr>
                    </tbody></table>
                </td>
            </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" style=3D"min-width:100%">
    <tbody>
        <tr>
            <td valign=3D"top" style=3D"padding-top:9px">
                 =20

               =20
                <table align=3D"left" border=3D"0" cellpadding=3D"0" cellsp=
acing=3D"0" style=3D"max-width:100%;min-width:100%" width=3D"100%" class=3D=
"m_7448955360842048210mcnTextContentContainer">
                    <tbody><tr>

                        <td valign=3D"top" class=3D"m_7448955360842048210mc=
nTextContent" style=3D"padding:0px 18px 9px;font-style:normal;font-weight:n=
ormal;line-height:200%;text-align:left">

                            <span style=3D"font-size:38px"><span style=3D"l=
ine-height:1.2em"><span style=3D"font-family:lato,&quot;helvetica neue&quot=
;,helvetica,arial,sans-serif"><strong><span style=3D"color:rgb(169,169,169)=
">Canary Mail</span><br>
<span style=3D"color:rgb(0,0,0)">You&#39;ve received a secure email</span><=
/strong></span></span></span>
                        </td>
                    </tr>
                </tbody></table>
               =20

               =20
            </td>
        </tr>
    </tbody>
</table></td>
                                        </tr>
                                    </tbody></table>
                                   =20
                                </td>
                            </tr>
                            <tr>
                                <td align=3D"center" valign=3D"top" id=3D"m=
_7448955360842048210templateBody">
                                   =20
                                    <table align=3D"center" border=3D"0" ce=
llpadding=3D"0" cellspacing=3D"0" width=3D"100%" class=3D"m_744895536084204=
8210templateContainer">
                                        <tbody><tr>
                                            <td valign=3D"top" class=3D"m_7=
448955360842048210bodyContainer"><table border=3D"0" cellpadding=3D"0" cell=
spacing=3D"0" width=3D"100%" style=3D"min-width:100%">
    <tbody>
        <tr>
            <td valign=3D"top" style=3D"padding-top:9px">
                 =20

               =20
                <table align=3D"left" border=3D"0" cellpadding=3D"0" cellsp=
acing=3D"0" style=3D"max-width:100%;min-width:100%" width=3D"100%" class=3D=
"m_7448955360842048210mcnTextContentContainer">
                    <tbody><tr>

                        <td valign=3D"top" class=3D"m_7448955360842048210mc=
nTextContent" style=3D"padding:0px 18px 9px;font-style:normal;font-weight:n=
ormal">

                            <span style=3D"color:rgb(169,169,169)"><span st=
yle=3D"font-size:18px"><a href=3D"mailto:jerry.zhangjian@sifive.com" target=
=3D"_blank">jerry.zhangjian@sifive.com</a> has sent you a secure email via =
Canary Mail.</span></span>
                        </td>
                    </tr>
                </tbody></table>
               =20

               =20
            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" class=3D"m_7448955360842048210mcnDividerBlock" style=3D"min-width:100%"=
>
    <tbody>
        <tr>
            <td style=3D"min-width:100%;padding:24px 18px">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wid=
th=3D"100%" style=3D"min-width:100%;border-top-width:2px;border-top-style:n=
one;border-top-color:rgb(234,234,234)">
                    <tbody><tr>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>

            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" style=3D"min-width:100%">
    <tbody>
        <tr>
            <td style=3D"padding:0px 18px 18px" valign=3D"top" align=3D"lef=
t">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wid=
th=3D"100%" style=3D"border-radius:50px;background-color:rgb(0,122,255);bor=
der-collapse:separate">
                    <tbody>
                        <tr>
                            <td align=3D"center" valign=3D"middle" style=3D=
"font-family:Lato,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;fon=
t-size:20px;padding:18px">
                                <a class=3D"m_7448955360842048210mcnButton"=
 title=3D"Read Secure Email" href=3D"https://secure.canarymail.io/read?obj_=
id=3D04c03de7-d745-472e-b026-7dd839bc34a0&amp;obj_key=3DeGJUOWtORkFXenBvWTJ=
yMSt4VGpWdz09&amp;thr_id=3D04c03de7-d745-472e-b026-7dd839bc34a0" style=3D"f=
ont-weight:bold;letter-spacing:normal;line-height:100%;text-align:center;te=
xt-decoration:none;color:rgb(255,255,255)" target=3D"_blank">Read Secure Em=
ail</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" class=3D"m_7448955360842048210mcnDividerBlock" style=3D"min-width:100%"=
>
    <tbody>
        <tr>
            <td style=3D"min-width:100%;padding:18px">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wid=
th=3D"100%" style=3D"min-width:100%;border-top-width:2px;border-top-style:n=
one;border-top-color:rgb(234,234,234)">
                    <tbody><tr>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>

            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" class=3D"m_7448955360842048210mcnDividerBlock" style=3D"min-width:100%"=
>
    <tbody>
        <tr>
            <td style=3D"min-width:100%;padding:18px">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wid=
th=3D"100%" style=3D"min-width:100%;border-top-width:2px;border-top-style:s=
olid;border-top-color:rgb(221,221,221)">
                    <tbody><tr>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>

            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" class=3D"m_7448955360842048210mcnDividerBlock" style=3D"min-width:100%"=
>
    <tbody>
        <tr>
            <td style=3D"min-width:100%;padding:18px">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wid=
th=3D"100%" style=3D"min-width:100%;border-top-width:2px;border-top-style:n=
one;border-top-color:rgb(234,234,234)">
                    <tbody><tr>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>

            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" style=3D"min-width:100%">
    <tbody>
        <tr>
            <td valign=3D"top" style=3D"padding-top:9px">
                 =20

               =20
                <table align=3D"left" border=3D"0" cellpadding=3D"0" cellsp=
acing=3D"0" style=3D"max-width:100%;min-width:100%" width=3D"100%" class=3D=
"m_7448955360842048210mcnTextContentContainer">
                    <tbody><tr>

                        <td valign=3D"top" class=3D"m_7448955360842048210mc=
nTextContent" style=3D"padding:0px 18px 9px;font-style:normal;font-weight:n=
ormal">

                            <span style=3D"color:rgb(169,169,169)"><span st=
yle=3D"font-size:18px">If you expect to correspond often with <a href=3D"ma=
ilto:jerry.zhangjian@sifive.com" target=3D"_blank">jerry.zhangjian@sifive.c=
om</a>, we recommend you download Canary Mail for free.</span></span>
                        </td>
                    </tr>
                </tbody></table>
               =20

               =20
            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" class=3D"m_7448955360842048210mcnDividerBlock" style=3D"min-width:100%"=
>
    <tbody>
        <tr>
            <td style=3D"min-width:100%;padding:24px 18px">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wid=
th=3D"100%" style=3D"min-width:100%;border-top-width:2px;border-top-style:n=
one;border-top-color:rgb(234,234,234)">
                    <tbody><tr>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>

            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" style=3D"min-width:100%">
    <tbody>
        <tr>
            <td style=3D"padding:0px 18px 18px" valign=3D"top" align=3D"lef=
t">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wid=
th=3D"100%" style=3D"border-radius:44px;background-color:rgb(0,0,0);border-=
collapse:separate">
                    <tbody>
                        <tr>
                            <td align=3D"center" valign=3D"middle" style=3D=
"font-family:Lato,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;fon=
t-size:20px;padding:18px">
                                <a class=3D"m_7448955360842048210mcnButton"=
 title=3D"Download Canary" href=3D"https://canarymail.io" style=3D"font-wei=
ght:bold;letter-spacing:normal;line-height:100%;text-align:center;text-deco=
ration:none;color:rgb(255,255,255)" target=3D"_blank">Download Canary</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" class=3D"m_7448955360842048210mcnDividerBlock" style=3D"min-width:100%"=
>
    <tbody>
        <tr>
            <td style=3D"min-width:100%;padding:18px">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wid=
th=3D"100%" style=3D"min-width:100%;border-top-width:2px;border-top-style:n=
one;border-top-color:rgb(234,234,234)">
                    <tbody><tr>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>

            </td>
        </tr>
    </tbody>
</table></td>
                                        </tr>
                                    </tbody></table>
                                   =20
                                </td>
                            </tr>
                            <tr>
                                <td align=3D"center" valign=3D"top" id=3D"m=
_7448955360842048210templateFooter">
                                   =20
                                    <table align=3D"center" border=3D"0" ce=
llpadding=3D"0" cellspacing=3D"0" width=3D"100%" class=3D"m_744895536084204=
8210templateContainer">
                                        <tbody><tr>
                                            <td valign=3D"top" class=3D"m_7=
448955360842048210footerContainer"><table border=3D"0" cellpadding=3D"0" ce=
llspacing=3D"0" width=3D"100%" class=3D"m_7448955360842048210mcnDividerBloc=
k" style=3D"min-width:100%">
    <tbody>
        <tr>
            <td style=3D"min-width:100%;padding:18px">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wid=
th=3D"100%" style=3D"min-width:100%;border-top-width:2px;border-top-style:s=
olid;border-top-color:rgb(221,221,221)">
                    <tbody><tr>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>

            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" style=3D"min-width:100%">
    <tbody>
        <tr>
            <td align=3D"center" valign=3D"top" style=3D"padding:9px">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wid=
th=3D"100%" style=3D"min-width:100%">
    <tbody><tr>
        <td align=3D"center" style=3D"padding-left:9px;padding-right:9px">
            <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=
=3D"100%" style=3D"min-width:100%">
                <tbody><tr>
                    <td align=3D"center" valign=3D"top" style=3D"padding-to=
p:9px;padding-right:9px;padding-left:9px">
                        <table align=3D"center" border=3D"0" cellpadding=3D=
"0" cellspacing=3D"0">
                            <tbody><tr>
                                <td align=3D"center" valign=3D"top">
                                   =20

                                       =20


                                            <table align=3D"left" border=3D=
"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"display:inline">
                                                <tbody><tr>
                                                    <td valign=3D"top" styl=
e=3D"padding-right:10px;padding-bottom:9px">
                                                        <table border=3D"0"=
 cellpadding=3D"0" cellspacing=3D"0" width=3D"100%">
                                                            <tbody><tr>
                                                                <td align=
=3D"left" valign=3D"middle" style=3D"padding:5px 10px 5px 9px">
                                                                    <table =
align=3D"left" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"">
                                                                        <tb=
ody><tr>

                                                                           =
     <td align=3D"center" valign=3D"middle" width=3D"24">
                                                                           =
         <a href=3D"http://www.twitter.com/CanaryMailApp" target=3D"_blank"=
><img src=3D"https://cdn-images.mailchimp.com/icons/social-block-v2/outline=
-gray-twitter-48.png" alt=3D"Twitter" style=3D"display: block;" height=3D"2=
4" width=3D"24"></a>
                                                                           =
     </td>


                                                                        </t=
r>
                                                                    </tbody=
></table>
                                                                </td>
                                                            </tr>
                                                        </tbody></table>
                                                    </td>
                                                </tr>
                                            </tbody></table>

                                       =20

                                       =20


                                            <table align=3D"left" border=3D=
"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"display:inline">
                                                <tbody><tr>
                                                    <td valign=3D"top" styl=
e=3D"padding-right:0px;padding-bottom:9px">
                                                        <table border=3D"0"=
 cellpadding=3D"0" cellspacing=3D"0" width=3D"100%">
                                                            <tbody><tr>
                                                                <td align=
=3D"left" valign=3D"middle" style=3D"padding:5px 10px 5px 9px">
                                                                    <table =
align=3D"left" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"">
                                                                        <tb=
ody><tr>

                                                                           =
     <td align=3D"center" valign=3D"middle" width=3D"24">
                                                                           =
         <a href=3D"https://canarymail.io" target=3D"_blank"><img src=3D"ht=
tps://cdn-images.mailchimp.com/icons/social-block-v2/outline-gray-link-48.p=
ng" alt=3D"Website" style=3D"display: block;" height=3D"24" width=3D"24"></=
a>
                                                                           =
     </td>


                                                                        </t=
r>
                                                                    </tbody=
></table>
                                                                </td>
                                                            </tr>
                                                        </tbody></table>
                                                    </td>
                                                </tr>
                                            </tbody></table>

                                       =20

                                   =20
                                </td>
                            </tr>
                        </tbody></table>
                    </td>
                </tr>
            </tbody></table>
        </td>
    </tr>
</tbody></table>

            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" style=3D"min-width:100%">
    <tbody>
        <tr>
            <td valign=3D"top" style=3D"padding-top:9px">
                 =20

               =20
                <table align=3D"left" border=3D"0" cellpadding=3D"0" cellsp=
acing=3D"0" style=3D"max-width:100%;min-width:100%" width=3D"100%" class=3D=
"m_7448955360842048210mcnTextContentContainer">
                    <tbody><tr>

                        <td valign=3D"top" class=3D"m_7448955360842048210mc=
nTextContent" style=3D"padding:0px 18px 9px">

                            <a href=3D"https://canarymail.io/privacy.html" =
target=3D"_blank"><span style=3D"color:rgb(169,169,169)">Privacy</span></a>=
<span style=3D"color:rgb(169,169,169)"> | </span><a href=3D"https://canarym=
ail.io/terms.html" target=3D"_blank"><span style=3D"color:rgb(169,169,169)"=
>Terms</span></a><span style=3D"color:rgb(169,169,169)"> | </span><a href=
=3D"https://help.canarymail.io/" target=3D"_blank"><span style=3D"color:rgb=
(169,169,169)">Docs</span></a><span style=3D"color:rgb(169,169,169)"> | </s=
pan><a href=3D"https://canarymail.zendesk.com/hc/en-us/requests/new" target=
=3D"_blank"><span style=3D"color:rgb(169,169,169)">Support</span></a><br>
<br>
<span style=3D"color:rgb(169,169,169)">Copyright =C2=A9 2021 Canary Mail, A=
ll rights reserved.</span>
                        </td>
                    </tr>
                </tbody></table>
               =20

               =20
            </td>
        </tr>
    </tbody>
</table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" class=3D"m_7448955360842048210mcnDividerBlock" style=3D"min-width:100%"=
>
    <tbody>
        <tr>
            <td style=3D"min-width:100%;padding:24px 18px">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wid=
th=3D"100%" style=3D"min-width:100%;border-top-width:2px;border-top-style:n=
one;border-top-color:rgb(234,234,234)">
                    <tbody><tr>
                        <td>
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>

            </td>
        </tr>
    </tbody>
</table></td>
                                        </tr>
                                    </tbody></table>
                                   =20
                                </td>
                            </tr>
                        </tbody></table>
                       =20
                    </td>
                </tr>
            </tbody></table>
        </center>
        </div>
        </div>

</div></blockquote></div>

--0000000000000f8721061982ad35--


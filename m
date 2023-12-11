Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7513CC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:56:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCoFl-0000gi-5M; Mon, 11 Dec 2023 16:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1rCoFb-0000UK-HY
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:55:43 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1rCoFY-0003TL-E1
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:55:42 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c32df9174so41677825e9.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1702331739; x=1702936539;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Iz3Q0l8K0vTD25XA9XVhmf7f45s/h8Yij03I5Oe4Os4=;
 b=CDUP/Ael9bxxwIIan/HILJlcVPkos3Ip+tGtvjYcpCnrL8tHvnS+Nnsm7+gItrNAGi
 eXbAv20lEsaiY22JcykX7tSsR708W4C1aRm2zRYULCu7SZ+eCT8IgIrk/jvyF7K7gn9N
 954orqpEn0n63sSJLsXktY29y5T77y8eeYgdMykSaOoN2pyniZDbP3ZNGwDPMSGmF3UE
 FFqKU4Xxy4kFAsQfVPfKbH8aJtiCh5i7tQtfalt8tKUcjMQ1JXIwx0rlBcf9lN/Y/pN6
 JMWjreOJxetD+oWnY41MyBLvpkp5ipwrZxfIAlkoJqfIAFKVMpY8t2zvDpWiDD0hs4cm
 DcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702331739; x=1702936539;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iz3Q0l8K0vTD25XA9XVhmf7f45s/h8Yij03I5Oe4Os4=;
 b=obNPeutaCpF2FBJ7GXzp6vAf9eZ0CXaMtyaT74BQ6D5PKcj6Nt98PMovTkCa4z9f/S
 VHc9m9QDafbNaDwBIUWjnl9T4rw41YbrxIQBsWCuiA43GTRwlht1mhVQ0ZdsA+3Q91cA
 C/1QesHpxYGdxTJ67c2AR8lorHZYVhKALkq2qljBprHPcqmkLIYM2IEuIi8ENSYGGioK
 S3vZoFr2DyZzbRKrfs94TUTZAm2jfQpi1kuoKuyt5Va3qtfOqoW2TNyZl967JE1NLuJA
 xE5ghE1nmrOtmjeM1L/O/BAHzaVYoNLPgToJJfKtvse43/DX6F0BGlk4ZtbXspJGjHyf
 O8ag==
X-Gm-Message-State: AOJu0YyQcfChgAiioAqa6Ib58dqRIOUJmCljlBDrfbnbRlSYwtXoEhRP
 vX/1mTmZaNtIp0Xe6eDeaJ0ak6HKf3n2v+gkKkIhew==
X-Google-Smtp-Source: AGHT+IH2J60t4jgWjWsmDAtxC/wWNmQPmde2ThAQ76FDH5GLoHt5faxYztbGpy6XtMX/EvcjBT9D2Wy+uQ8hAhEroZs=
X-Received: by 2002:a7b:ce13:0:b0:40c:2307:e133 with SMTP id
 m19-20020a7bce13000000b0040c2307e133mr1859225wmc.168.1702331739033; Mon, 11
 Dec 2023 13:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-2-philmd@linaro.org>
 <CANCZdfppY0D1HOBN-n1h9ZQUHSK23YVgewn-vcRAQTs6--TCzw@mail.gmail.com>
In-Reply-To: <CANCZdfppY0D1HOBN-n1h9ZQUHSK23YVgewn-vcRAQTs6--TCzw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Dec 2023 14:55:27 -0700
Message-ID: <CANCZdfrc1RYKotcYhJLKZamh95K=CcbYtwuuTrrvt9wuJSuG9w@mail.gmail.com>
Subject: Re: [PATCH 01/24] exec: Include 'cpu.h' before validating
 CPUArchState placement
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000986994060c42fe96"
Received-SPF: none client-ip=2a00:1450:4864:20::32c;
 envelope-from=wlosh@bsdimp.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--000000000000986994060c42fe96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 2:53=E2=80=AFPM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Mon, Dec 11, 2023 at 2:20=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <phil=
md@linaro.org>
> wrote:
>
>> CPUArchState 'env' field is defined within the ArchCPU structure,
>> so we need to include each target "cpu.h" header which defines it.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>>  include/exec/cpu-all.h | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
>

Brain f**** I meant:

Reviewed-by: Warner Losh <imp@bsdimp.com>

--000000000000986994060c42fe96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 11, 2023 at 2:53=E2=80=AF=
PM Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Dec 11, 2023 at 2:20=E2=80=AFPM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" target=3D"_=
blank">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">CPUArchState &#39;env&#39; field is defined within =
the ArchCPU structure,<br>
so we need to include each target &quot;cpu.h&quot; header which defines it=
.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/exec/cpu-all.h | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br></blockquote><div>=
<br></div><div>Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.=
com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div></div></div></blockquote=
><div><br></div><div>Brain f**** I meant:</div><div><br></div><div>Reviewed=
-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&g=
t;</div></div></div>

--000000000000986994060c42fe96--


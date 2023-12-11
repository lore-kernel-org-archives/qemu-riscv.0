Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CE7C4167D
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:56:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCoF4-0000Fv-Vu; Mon, 11 Dec 2023 16:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1rCoF3-0000Cs-4V
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:55:09 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1rCoF0-0003Fk-9i
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:55:08 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55114c073b8so2404232a12.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1702331704; x=1702936504;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aF396CQf/xahnK9tLf7Jbhp/lY8WpZ39PZ0s6eBIOPk=;
 b=RNQVhbdpaDaU/zU4FFfbhGdw+UdRiivpwo29ctCE4t2kRtJ19kQ/HnKsClAqKN7xne
 xMynDWQppl2n60QfD6pTVQiLdbdoxfNDQVUgMpZDLj5dE4VXb0mfnzoC/fjkStBLPTOS
 gYnRRRO9V+Myx34zKiUJWdPG/f3GfWCKvm3Ua51/tHxUNtyumMmM/SckgC/RN4SbtIFq
 y6KKPXYYiwYpiPRqFLj7LflH9aD/eXj6KmfrvjGu8KDeAWd8N2hqGnk35FRv/OBRfY8U
 9hEZ1D7Q/DTgWojmqTZff2T9s7KS8wSH4oYy3nIVejvjQQS8zNtoyYhN/pqzT9FHeDB+
 xaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702331704; x=1702936504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aF396CQf/xahnK9tLf7Jbhp/lY8WpZ39PZ0s6eBIOPk=;
 b=BLA2LsBRqfHFYyOFfMGEnhWOhfWPx/Yxl3fwaA+bX2EOzbLLZXOPLLHtukYYFDXJrh
 d89KAxrQKgFPyuhSmgRMigkT+IJ9m2iPRH8vPmeB7ppDIFFQkq5Jg3KCI66hsctfCdJn
 +p/Whm07cDVledt1ILIv6gyiE/vTtGtcZwROZQzp/KDgsP7e8Dza0BTz5DQafmI80TJf
 XtljrCl4lJyjuI33EQEgUf50yQtGsn4Dhe2oNBogFPYlWFd4K1ZLD6LOJ21oBfBbydU3
 2Q1XndP4PPKIgtCASjCp7v/w6W22oiOjHSMxgiihauR0j98hKMmlznSxbEUx7TSUVMzy
 NJYQ==
X-Gm-Message-State: AOJu0Yweqjfiz3tJMJJcZtIDmerocAuwEWHLc/cD8ASMwFe5AAIo4OoN
 EcNui9YYeb9zOSdznxykkx2Q3CB0JpVz9x9TQ/ZsUQ==
X-Google-Smtp-Source: AGHT+IEc9xhaxbK7OOlF/iWmgNAMI9Q4YDpb5eCvtBFgma50RLU3srp1cW+tlkxsxIlEOUuBOWnSRcRs4OPQPyEO3IQ=
X-Received: by 2002:a50:955d:0:b0:54f:64f4:b6b2 with SMTP id
 v29-20020a50955d000000b0054f64f4b6b2mr2198492eda.59.1702331704500; Mon, 11
 Dec 2023 13:55:04 -0800 (PST)
MIME-Version: 1.0
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-3-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-3-philmd@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Dec 2023 14:54:53 -0700
Message-ID: <CANCZdfqt-PBNgFb19pyzoMbTF2yYvgRNdsyQuKZDQWCR=hvYJw@mail.gmail.com>
Subject: Re: [PATCH 02/24] exec: Expose 'target_page.h' API to user emulation
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
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000897434060c42fcb1"
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52d.google.com
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

--000000000000897434060c42fcb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 2:20=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> User-only objects might benefit from the "exec/target_page.h"
> API, which allows to build some objects once for all targets.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  meson.build      |  2 +-
>  page-target.c    | 43 +++++++++++++++++++++++++++++++++++++++++++
>  system/physmem.c | 35 -----------------------------------
>  3 files changed, 44 insertions(+), 36 deletions(-)
>  create mode 100644 page-target.c
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

--000000000000897434060c42fcb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 11, 2023 at 2:20=E2=80=AF=
PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phi=
lmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">User-only objects might benefit from the &quot;exec/target_pa=
ge.h&quot;<br>
API, which allows to build some objects once for all targets.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0page-target.c=C2=A0 =C2=A0 | 43 +++++++++++++++++++++++++++++++++++++=
++++++<br>
=C2=A0system/physmem.c | 35 -----------------------------------<br>
=C2=A03 files changed, 44 insertions(+), 36 deletions(-)<br>
=C2=A0create mode 100644 page-target.c<br></blockquote><div><br></div><div>=
Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.c=
om</a>&gt;</div></div></div>

--000000000000897434060c42fcb1--


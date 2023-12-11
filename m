Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF4EC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:54:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCoE5-0007wG-Tk; Mon, 11 Dec 2023 16:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1rCoE5-0007vO-7r
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:54:09 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1rCoE2-00038f-8O
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:54:08 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54c64316a22so6677481a12.0
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1702331644; x=1702936444;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cxBNCytuKVpcMOMd1uTr/PXu7b7GfNOqYnE6uYYpyN4=;
 b=D5RhjY77K8unZAAJt/1x+uK1S1DNGuvStAvhzVCJID6ODDNp2BtQZL4ebwD/ayKm8w
 /JoIEZaP9cq8JBBr7PoLD5VMLjx6BnhQp7CnRvh4rnJrw4AxBJv32kEDNC5a6x3MBi9y
 FpDXxjYaddni/JR2pFCPZ4N8InAOeKf+udijWTdRbWUwLbLAbW4pA8aumV7YM1pTEJnX
 OEbxlG+OjQxU6Rk7S/qkrk7N3y/9NvXrxmA24/f2lyiuBX7JxdJILwZ7p5fLcynnizR4
 OoGYPdfUlKplSs2iLPNhn2M7y51fAiSscREkXOSh4hHtrFl8xbV8jju0votb13u/7pjZ
 JZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702331644; x=1702936444;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cxBNCytuKVpcMOMd1uTr/PXu7b7GfNOqYnE6uYYpyN4=;
 b=WOJnVu2KmLx/gz0DRi19lGeKewrXyhTEADNqJegi7BOihwayh7IZ95LsaC6OAq9s6w
 GB9863RvTp+16szSW1XnRd/Uv1wS4rQrnHJPSNl7OIP3L31RcK4iSRMgVg5EnNey6A46
 81kxpasVjGAPuNKk888inlzKxspTECF/LbakCLhqnLW8ldRxqR6ubS+hupf9bjR+5y/q
 ZF0O6AuZHw8DE+huZiHdoo+/ghwmSIKeHT63HPZ9Mxlb09/XbXE0ZhTZOCH+3//16RV5
 CURHQBW0xHbMEsYE6BNUmVFxXuryXVw1EPAtyUUkMe8FGOkyYgkeuCcRlcSRAKo8GnI+
 3qvg==
X-Gm-Message-State: AOJu0YyFV93A536GC3ZfSh/upI1Biy5nNoo6sUvBgYGrYahe2Cwt/BIm
 NmvcKKJjw1WobReNNU7Sgd2gu/3oj1dpbBrnmWEjFg==
X-Google-Smtp-Source: AGHT+IH/rFEPQKRev89Ru4IDb6qH9WoAKEry3fvz1dlxm0fD57lBoPZ4WauRolKVGm9zQT6JJAY8/X/Iy9si+eQTElE=
X-Received: by 2002:a50:f602:0:b0:54d:b2b8:171d with SMTP id
 c2-20020a50f602000000b0054db2b8171dmr3359635edn.35.1702331643743; Mon, 11 Dec
 2023 13:54:03 -0800 (PST)
MIME-Version: 1.0
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-2-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-2-philmd@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Dec 2023 14:53:52 -0700
Message-ID: <CANCZdfppY0D1HOBN-n1h9ZQUHSK23YVgewn-vcRAQTs6--TCzw@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000ea6152060c42f8c0"
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52c.google.com
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

--000000000000ea6152060c42f8c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 2:20=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> CPUArchState 'env' field is defined within the ArchCPU structure,
> so we need to include each target "cpu.h" header which defines it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/exec/cpu-all.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>

Signed-off-by: Warner Losh <imp@bsdimp.com>

--000000000000ea6152060c42f8c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 11, 2023 at 2:20=E2=80=AF=
PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phi=
lmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">CPUArchState &#39;env&#39; field is defined within the ArchCP=
U structure,<br>
so we need to include each target &quot;cpu.h&quot; header which defines it=
.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/exec/cpu-all.h | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br></blockquote><div>=
<br></div><div>Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.=
com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div></div></div>

--000000000000ea6152060c42f8c0--


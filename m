Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F25DC46CD4
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 08:07:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGaYJ-0003Q4-Kt; Fri, 22 Dec 2023 03:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rGaYG-0003OJ-Np; Fri, 22 Dec 2023 03:06:36 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rGaYD-0008Qa-F3; Fri, 22 Dec 2023 03:06:35 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d3f8af8297so9658045ad.2; 
 Fri, 22 Dec 2023 00:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703232389; x=1703837189; darn=nongnu.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dy7zv8H2NWsKZUX8wVrMymGZN33/m0uz3ciTz2vhuko=;
 b=VRJS4iA+oeEn+0WMj+ORW+pmRBy40Z2Y7NZDDgboMAhJ2fWkXso68oaYvGXeC35FV8
 AzljU9rCEnuNwgmY1t5P4MiC4zFL8JUjzK50iC4o5+kr2jnm5TwVqNb9W/omoQbkrA9J
 F772sVjNMVHeD4tk4w6Zp7qW04oVjyz1bFQD0lxzYsuRzULQWTO9mjXEkZU2wxmPg0bH
 jJ8msaADTvJKZV3qkb+iMP90RueN9Kprp/HW9MmYstcyxePSJMElH+hlDG7cRIW4O2cg
 XOyScncDOscEf9jY29mp2pwd4xiyWEPs5U7/8xhrz/0eD03dpNFBcwc1S1ifU7YxShN2
 RTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703232389; x=1703837189;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Dy7zv8H2NWsKZUX8wVrMymGZN33/m0uz3ciTz2vhuko=;
 b=nEKCBVSWd0POhQ1c5uBxvcPcBKOmN+VLbQuZRsp2Bf6K3IjaGc2ZvfWumaMO7LRD+6
 Nfk42duS7YqmcuUTdsL8QBrWplg3Jcw2IBUawAHJ81w+0cUI2Hb+K1TL9MOboCwdwjyR
 LWHjYYavt22zdbAvIBur7Tt99aUEtA859M0uoT64nBhcoZm8k/C1F2RptvHiWxUDaxSj
 bI+Uw1pFxAbVy1LGisQT8Ja4yYuIlfu/1CQNFAailAfQVK17sI05ZolPJavi3TxDXvG9
 iCBhS24Y493T6ksVm/25Pods1PYFOF9rOzfL9iqZT/HSqay6nzwx2PLPwZ3VU+pmCDl3
 s16g==
X-Gm-Message-State: AOJu0YyF50uaO3LzZtlzXqgCByr3d8GLrtA6WWFglOw1SwDa/fQHNcWQ
 BMDAfH5HSVUPtHuc1P3kYa8=
X-Google-Smtp-Source: AGHT+IGrOcGhiSZsNJ9IeSdzELFp2R9wZrFeuViIHy9jE38BlPHv5DYK+IDBq5Jj+QGCL5877wvnHw==
X-Received: by 2002:a17:903:22cc:b0:1d0:cf22:c6ca with SMTP id
 y12-20020a17090322cc00b001d0cf22c6camr723492plg.52.1703232388857; 
 Fri, 22 Dec 2023 00:06:28 -0800 (PST)
Received: from localhost ([203.220.145.68]) by smtp.gmail.com with ESMTPSA id
 m10-20020a170902db0a00b001d3867b6424sm2849139plx.113.2023.12.22.00.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 00:06:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 18:06:11 +1000
Message-Id: <CXUPHHNKAVYM.129IGW3MNKCSQ@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
Cc: "Ilya Leoshkevich" <iii@linux.ibm.com>, "Peter Xu" <peterx@redhat.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Peter Maydell"
 <peter.maydell@linaro.org>, "Mark Cave-Ayland"
 <mark.cave-ayland@ilande.co.uk>, "Eduardo Habkost" <eduardo@habkost.net>,
 <qemu-arm@nongnu.org>, "Paolo Bonzini" <pbonzini@redhat.com>,
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>,
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?b?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 <qemu-riscv@nongnu.org>, "David Hildenbrand" <david@redhat.com>, "Warner
 Losh" <imp@bsdimp.com>, "Claudio Fontana" <cfontana@suse.de>, "Brian Cain"
 <bcain@quicinc.com>, "Daniel Henrique Barboza" <danielhb413@gmail.com>,
 "Richard Henderson" <richard.henderson@linaro.org>, "Thomas Huth"
 <thuth@redhat.com>, "Riku Voipio" <riku.voipio@iki.fi>, "Kyle Evans"
 <kevans@freebsd.org>, "BALATON Zoltan" <balaton@eik.bme.hu>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, "Laurent Vivier" <laurent@vivier.eu>,
 "Michael Rolnik" <mrolnik@gmail.com>, "Song Gao" <gaosong@loongson.cn>,
 "Huacai Chen" <chenhuacai@kernel.org>, "Aurelien Jarno"
 <aurelien@aurel32.net>, "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Aleksandar Rikalo" <aleksandar.rikalo@syrmia.com>, "Chris Wulff"
 <crwulff@gmail.com>, "Marek Vasut" <marex@denx.de>, "Stafford Horne"
 <shorne@gmail.com>, =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Alistair Francis"
 <alistair.francis@wdc.com>, "Bin Meng" <bin.meng@windriver.com>, "Weiwei
 Li" <liwei1518@gmail.com>, "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Artyom Tarasenko" <atar4qemu@gmail.com>, "Bastian Koppelmann"
 <kbastian@mail.uni-paderborn.de>, "Max Filippov" <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 23/24] exec/cpu-all: Extract page-protection definitions
 to page-prot-common.h
X-Mailer: aerc 0.15.2
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-24-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-24-philmd@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue Dec 12, 2023 at 7:20 AM AEST, Philippe Mathieu-Daud=C3=A9 wrote:
> Extract page-protection definitions from "exec/cpu-all.h"
> to "exec/page-prot-common.h".
>
> The list of files requiring the new header was generated
> using:
>
> $ git grep -wE \
>   'PAGE_(READ|WRITE|EXEC|BITS|VALID|ANON|RESERVED|TARGET_.|PASSTHROUGH)'

Acked-by: Nicholas Piggin <npiggin@gmail.com> (ppc)

Looks trivial for ppc, so fine. But what's the difference between
-common.h and -all.h suffix?

Thanks,
Nick


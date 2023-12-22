Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE839C41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:38:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGXIA-00029x-Vs; Thu, 21 Dec 2023 23:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rGXI0-00026V-Mm; Thu, 21 Dec 2023 23:37:36 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rGXHz-0005iY-AS; Thu, 21 Dec 2023 23:37:36 -0500
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3bb6ed2b913so1131668b6e.2; 
 Thu, 21 Dec 2023 20:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703219853; x=1703824653; darn=nongnu.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6vCrTpKSPPE7AfY3YWMhSKqdsTSH0jQJ5wDqlM3mFIs=;
 b=MJYoP5wqGzXqRgVwqxrZ551gkDuGGF4WMv550+tHc8WGGdW64B9kdIzd01Yt7VWt4m
 NdAgVKy5qXeBKoArg/tq9vplE2KcYQwRlHDhCKwLd9AxAC0xYSEE7J1QZVW0cUhoZrWQ
 5F3h0R2pVzpp/G79IHJSBnlgff+WPAJBkRomx/24VWu+ASQQtEPFr8PBYY5Lg3EI9txx
 jbM3iZHXBKMIJABJ7VBA/HUCDDsaTBmoSMZk1iTOJMqQ+6eHjscujKfV/plIUDv2EqGQ
 Ioo4zqEstEMNoK1TbrJx9NYPaZeNEsPem52y39oP97P0nthGeXgUKLGMIgVgtGjW/Nvd
 yqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703219853; x=1703824653;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6vCrTpKSPPE7AfY3YWMhSKqdsTSH0jQJ5wDqlM3mFIs=;
 b=u0HCLWrnQKItgK5ms9tmUzZPnPLGKpieGYeCAobBWn7dEfrcgCbLWJIBI8DrQkm8m7
 PjtHtN/zZokGw+VDGFppebcF2swODQSFaHUr0M1/BvIAEPTeOzjLqXRo26OEY/mif90w
 KCaGgHDD9JCqbyoHSzx4gdeGkhcgeZ/IXEMYLSByNaK8V8KDmiFs+pQwlK38P2DvbgbG
 a0iPxIRb8NoZ0rZ9aDyZBDWyXulQ4Ht2AzrlUyam+wJpS/6tRZO2ZZhCMLOwOGzjSdMu
 WRSEvu6mOCEcEi1eTi4ZAjgifdHdfRqFxPnhOqQkO3YTrFpWMnY3jVSnY1H1V3Piq2xr
 z5gQ==
X-Gm-Message-State: AOJu0Yy9JkjOsopNhvRV7xlix0L41mNzuPvaZIjfWKkKl7v0r14R2mYN
 cbyhYHKKtrkzN5NHMnc4CRE=
X-Google-Smtp-Source: AGHT+IHyqKiLgDwap+e6Ff1oyWMkk2SvYahvVlCSei8SjPQGCsfhaHRHE2GxXfgIrKsVJYfS3tj9YA==
X-Received: by 2002:a05:6359:4c19:b0:170:ec2e:4367 with SMTP id
 kj25-20020a0563594c1900b00170ec2e4367mr1074635rwc.1.1703219852827; 
 Thu, 21 Dec 2023 20:37:32 -0800 (PST)
Received: from localhost ([1.146.126.39]) by smtp.gmail.com with ESMTPSA id
 d18-20020a17090b005200b0028b2ff2208esm6384674pjt.19.2023.12.21.20.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 20:37:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 14:37:19 +1000
Message-Id: <CXUL1KDTLCWC.3N2HSO3O5U9LM@wheely>
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
 <thuth@redhat.com>, =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "David Gibson" <david@gibson.dropbear.id.au>, "Harsh Prateek Bora"
 <harshpb@linux.ibm.com>
Subject: Re: [PATCH 09/24] hw/ppc/spapr_hcall: Remove unused
 'exec/exec-all.h' included header
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
X-Mailer: aerc 0.15.2
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-10-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-10-philmd@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=npiggin@gmail.com; helo=mail-oi1-x232.google.com
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

On Tue Dec 12, 2023 at 7:19 AM AEST, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  hw/ppc/spapr_hcall.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 522a2396c7..fcefd1d1c7 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -8,7 +8,6 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
>  #include "qemu/error-report.h"
> -#include "exec/exec-all.h"
>  #include "exec/tb-flush.h"
>  #include "helper_regs.h"
>  #include "hw/ppc/ppc.h"



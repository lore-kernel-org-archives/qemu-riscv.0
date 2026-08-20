Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFECC5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 05:39:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwvUI-00020h-Kj; Thu, 20 Aug 2026 01:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wwvU4-00020E-Kb
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 01:38:39 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wwvU0-0002UW-3W
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 01:38:35 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-66c9995ca60so1074888d50.1
 for <qemu-riscv@nongnu.org>; Wed, 19 Aug 2026 22:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787204310; cv=none;
 d=google.com; s=arc-20260327;
 b=fYf8ZOP6gKi2+Hd6hnfYwcFdsojz1SJXdD3B/82y98soJmCREmxOd3CpDzLOoElRQv
 GCkD1hA4E7NwrCI7qJ0aqwPH6sRzFCYbWNPlHMBW7xzuJ/5Ou5lt9kz6YD8LRZG0lcqM
 ogCjEB+lXzLTipvLxLRLkJqIfcpuSeD+jDtD8PlLz9bb8LHMozveUp7kQm2nCXFpeY33
 sb44MSS/WTod8vD6ALPGnNrHCzanbTDXfZTGnrGkfluvk1tbKkPbYUPQHXhEjVgxdJH9
 Vw4tG9wRvWiQXcjD7geakFVeHBS1wMz3MHVagFA2xszYbnT9prKZqB1GIXc5s/CQWFrs
 t+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8tAPdeXuFOSer+0GgMhti1jiYqc5de8tbD4UHaAkuUo=;
 fh=NieJglNghRCGdDYtBFv73Xtf+Ny/THm0L9d0Y4v76tg=;
 b=Dd85d0oAAhMzgdlN38VEJ7E3XOklSlFR+LScJa5h2YwwXj5DLrluQJouCzWDLzsxSU
 5iNjPITki+3G2OMcNI4X/IZv35ByMlQBfgYfWdIhL0j0f6YbBCRlYr7ZQUg3WlekxDpW
 XF8rKFIF41NL4EJabTvImDSsILajWMUFUJRh8JAmYTjwnxA9Y0wpHRyGeD/XRYSpZnoy
 MIdYYpHTwuFh+mDqsY81IMf3W9wsUcGmyBdUyedCMhyZ+BqPN2uRcZexLppq9M1cO+rS
 Khtm4UQBpPO2BkAZGnJ3881q5AfCKiPOLjYYRm9drtCGUvopwMFb90P88YFG8XbDcCu8
 5htA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1787204310; x=1787809110; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8tAPdeXuFOSer+0GgMhti1jiYqc5de8tbD4UHaAkuUo=;
 b=DmNqyP8LBSW3KZA7y+7jBLa6tXoLEcB1vUnm8ZDM1tIUTlUozKGgDSWDvAJbwuwDO8
 lH5ypelE4sgE/wxwvg1kTR7sc64iNYsv1ALMaoK5OR4/FrotrZgEVbVuyKc8DWDA3/SY
 wq3O2w6tEyk7NG1Zrwb7uICW7lUL2Sp7bfkik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787204310; x=1787809110;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8tAPdeXuFOSer+0GgMhti1jiYqc5de8tbD4UHaAkuUo=;
 b=WHl06WEogF2IM3tOuOcgncibE6a+4+/XgVgnnn7cqx8fs0OETyleE0/cz1rZ9oRLSk
 ddhn8kvkfpEQt1+TMjItSoS63K9uCE+yxgvloEJfL+9Dc2WVcm4bnJPC0D4FsQI9hEuy
 XQ1LQL3pn5rkAxvjwf1HbdvHDDXqsG5UJH0/ZWXACjZcE7tA13v/CROLVI+Tyxksm1O/
 AIVVddYOPchGfeqKqC4M8WFyuByd7EtBK+mg38HIQaOSPmFYJSUF9ZtHqRY17aEmUxVP
 WUkv+fZ1koPbtHgtw+PZUU7uMpvYwstKc8LyHM30NlKraW+15NW4ahqwmxOT9YmqUK4Q
 uIlQ==
X-Gm-Message-State: AFuF++l5TiVAsoOihrJCe/VYCQpxr1xf6JdEHFLqjxsjGxCRcm3Aiubh
 g3RrhYSVqI5KOqy7norxt/c+MPa/vTOW7VvZ5bAihhvvbyrrs8vwNutpgiP9d+3lrDjazMzbCWh
 Cz9x6dp6VKSrU2r6JbrcMnyRUj4febIY=
X-Gm-Gg: AR+sD11TKyGsD33fAe8Q2KotT34M5lnbFxfVB6Y3UfMbDB6DMqFA11ybhq20HkPoU50
 MNPgA5Hh5ZM31fsv8770luzFYyrAIxVfucyAaaojlDCFnw195zJZEgivVZFQkd8+7VcYC63Hg8U
 Xq2XzINLjnoxt0cnneicpAYi5ZtCFTkiU/mgJdOMlzQwri1Bftv6I0PQ+eD1vPB6hvqsXnfklqH
 qOIKqGK8HnJqxTHJTN91VPkl5o2UL/nF5k2+ULSPKkwJslxC/1VeChdoUvpaI8ZfYvk+xvPWosA
 Idk4pwUUEFioTTDX6Q3aaj4x2lCvmKnlfNcy4B1qou1Syxy753mzbxteG1pgUbnuvY6No660FAz
 gC77oS7/3A0gfVA1AHVEDZYg553LcUdlhLxHKdIxSruIfhb3ZJpgnOwS6WudHokYbdffSjcZiDP
 pYkfV/b94hWHuzz7IFCMZQUn49Tg==
X-Received: by 2002:a05:690e:4507:20b0:66b:28a9:5729 with SMTP id
 956f58d0204a3-66cd68909d4mr1079939d50.8.1787204310251; Wed, 19 Aug 2026
 22:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_4EEBFC805F3E59863BEDC38094EF5A109206@qq.com>
In-Reply-To: <tencent_4EEBFC805F3E59863BEDC38094EF5A109206@qq.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Aug 2026 15:08:19 +0930
X-Gm-Features: AcwNN1X7R3F2N1_8svoQgdgp7EIDnIe3SCNkCgp0YjzHIq1wWDKZ8dv6vARowkc
Message-ID: <CACPK8XefKWYjBqZrhbgf62QaSGqdgGMFwVbB4uwoWz+4ZfhmkQ@mail.gmail.com>
Subject: Re: [PATCH v3] riscv/virt: Add optional UART1
To: Yanfeng Liu <yfliu2008@qq.com>, alistair.francis@wdc.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 pierrick.bouvier@oss.qualcomm.com, sunilvl@ventanamicro.com, 
 palmer@dabbelt.com, liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sat, 18 Jul 2026 at 11:46, Yanfeng Liu <yfliu2008@qq.com> wrote:
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -16,7 +16,7 @@ The ``virt`` machine supports the following devices:
>  * Core Local Interruptor (CLINT)
>  * Platform-Level Interrupt Controller (PLIC)
>  * CFI parallel NOR flash memory
> -* 1 NS16550 compatible UART
> +* Either 1 or 2 NS16550 compatible UARTs
>  * 1 Google Goldfish RTC
>  * 1 SiFive Test device
>  * 8 virtio-mmio transport devices
> @@ -27,6 +27,9 @@ The hypervisor extension has been enabled for the default CPU, so virtual
>  machines with hypervisor extension can simply be used without explicitly
>  declaring.
>
> +The second UART only exists if a backend is configured explicitly (e.g.
> +with a second `-serial` command line option).

This breaks the docs build. I think you want ``-serial``.

Cheers,

Joel


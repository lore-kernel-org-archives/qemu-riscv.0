Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E8DC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 18:43:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLpAe-0004im-2m; Fri, 05 Jan 2024 13:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLpAc-0004ha-LW
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 13:43:50 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLpAU-0000pZ-2H
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 13:43:49 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-556c60c3f9aso2377163a12.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 10:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704480216; x=1705085016; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2XheI6gPr0kqfBkCeGZsoVngCMamKM2r3BSHHntDCuY=;
 b=rdBFuK43jHozU3ORH58motFiaaG2dzTobk9QZpFqCm06Wo1thbNAsguH6lJP46rDBE
 vpE1xfdieatbpnjqSlazWr+UIREnQNWkEfB7F5CLjyfAHHMG7WjW839ac1FR0NRK7/O/
 1WPr3hXxb9wEFwzsDuXpeDta91lt/6ZK+4IQJgr+7QrE6ggM7Cm4ui6PeeJFZvVJZhfd
 M5IRKNEFsevk8bNEXMmi8mwrqev4dQqYJK7ZYxTiaDOb7vw2i6TC6qPbE99cEQJEodJC
 fgCHy6JAB8J9giWizRn2jq71mMkPX1su3d8lUWk1cwCx25+TEwmREKvTvZ8xsvjqFP7U
 wt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704480216; x=1705085016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2XheI6gPr0kqfBkCeGZsoVngCMamKM2r3BSHHntDCuY=;
 b=Vxg1sLpRTxwb1Ja59GFuW9CJ/ik1v6XWyxuKptxw3pM5UsizZ4bWYUHNfeyTXoXdmu
 wgx6C8GpwsLygCdDj1uBUi4kf5lPIi21uKNrjGMAxTnvifvttigO+QDuROaeYMSvCa6w
 fg5t+65RdhK0t9RsGPqCE3l0oasutb7og8n8/pLklZJLzBCbXQlQvVJn53ndr16ibFbr
 nU6JGu4UzJhnJPA1cGzfSK+adT1IrMp/n2e2N4DXjj5nh+Q0JUAvRMgS06LFJpUDHRdM
 hDV2zP5tzeOZsY1lkmgyfqsS1awf7KQgvy19WGdLQuL8NKrnRO1CkFSSArivOufyPise
 Br1A==
X-Gm-Message-State: AOJu0Yzx5iz0CTtsOEhrmbLZ7YS/3fw7cgAH2jDEx75S5u/ybC3p281A
 BO946bBzTRcTiMPdibi55stycZfxm2TYYzAyaoBbQyM/HSYaqA==
X-Google-Smtp-Source: AGHT+IHUTgi1inhy4VcKtkYeOrjYf2lzsdWeefje5mdcMroIGLiizIM6JmzPJqISBeJSTSgGYwXxUJJ6ZFRZsz0og0s=
X-Received: by 2002:aa7:c1cc:0:b0:557:4227:e2bf with SMTP id
 d12-20020aa7c1cc000000b005574227e2bfmr414279edp.35.1704480216062; Fri, 05 Jan
 2024 10:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20240105154307.21385-1-philmd@linaro.org>
 <566d5a05-5cd3-40fe-b40e-8e82524d8ea6@linaro.org>
In-Reply-To: <566d5a05-5cd3-40fe-b40e-8e82524d8ea6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jan 2024 18:43:25 +0000
Message-ID: <CAFEAcA-1S7-eAU=_mLM0fsecKA8JTOx4LfHZZYOEfskTU=vjeA@mail.gmail.com>
Subject: Re: [PULL 00/71] HW core patches for 2024-01-05
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 5 Jan 2024 at 17:05, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 5/1/24 16:41, Philippe Mathieu-Daud=C3=A9 wrote:
> > The following changes since commit 05470c3979d5485003e129ff4b0c2ef98af9=
1d86:
> >
> >    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into sta=
ging (2024-01-04 19:55:20 +0000)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/philmd/qemu.git tags/hw-cpus-20240105
> >
> > for you to fetch changes up to a318da6b3f6a88e6cfd6953c519def9457e8962f=
:
> >
> >    target/sparc: Simplify qemu_irq_ack (2024-01-05 16:20:15 +0100)
> >
> > ----------------------------------------------------------------
> > HW core patch queue
> >
> > - Unify CPU QOM type checks (Gavin)
> > - Simplify uses of some CPU related property (Philippe)
> >    (start-powered-off, ARM reset-cbar and mp-affinity)
> > - Header and documentation cleanups (Zhao, Philippe)
> > - Have Memory API return boolean indicating possible error
> > - Fix frame filter mask in CAN sja1000 model (Pavel)
> > - QOM embed MCF5206 timer into SoC (Thomas)
> > - Simplify LEON3 qemu_irq_ack handler (Cl=C3=A9ment)
> >
> > ----------------------------------------------------------------
>
>
> > Philippe Mathieu-Daud=C3=A9 (37):
>
> >    backends: Simplify host_memory_backend_memory_complete()
>
> I neglected to run checkpatch.pl on this patch, so it lacks:
>
> -- >8 --
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 30f69b2cb5..987f6f591e 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -346,5 +346,7 @@ host_memory_backend_memory_complete(UserCreatable
> *uc, Error **errp)
>       unsigned long maxnode =3D (lastbit + 1) % (MAX_NODES + 1);
> -    /* ensure policy won't be ignored in case memory is preallocated
> +    /*
> +     * Ensure policy won't be ignored in case memory is preallocated
>        * before mbind(). note: MPOL_MF_STRICT is ignored on hugepages so
> -     * this doesn't catch hugepage case. */
> +     * this doesn't catch hugepage case.
> +     */
>       unsigned flags =3D MPOL_MF_STRICT | MPOL_MF_MOVE;
> @@ -365,3 +367,4 @@ host_memory_backend_memory_complete(UserCreatable
> *uc, Error **errp)
>
> -    /* We can have up to MAX_NODES nodes, but we need to pass maxnode+1
> +    /*
> +     * We can have up to MAX_NODES nodes, but we need to pass maxnode+1
>        * as argument to mbind() due to an old Linux bug (feature?) which
> @@ -393,3 +396,4 @@ host_memory_backend_memory_complete(UserCreatable
> *uc, Error **errp)
>   #endif
> -    /* Preallocate memory after the NUMA policy has been instantiated.
> +    /*
> +     * Preallocate memory after the NUMA policy has been instantiated.
>        * This is necessary to guarantee memory is allocated with
> ---
>
> Since the PR is already in the testing pipeline:
> - if it get merged, I'll send a cleanup patch
> - otherwise if it fails I'll fix it.

It just passed the last CI job on a retry, so please send a
followup patch.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM


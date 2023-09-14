Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EDCEEAA51
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 15:24:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qgoCU-0006Ay-Gh; Thu, 14 Sep 2023 11:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qgoCT-00069t-5H
 for qemu-riscv@nongnu.org; Thu, 14 Sep 2023 11:24:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qgoCR-0001eP-EL
 for qemu-riscv@nongnu.org; Thu, 14 Sep 2023 11:24:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso936029f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Sep 2023 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694705049; x=1695309849; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6sakCjyOjzqHhR3CcEqZlqRPiVTdIvwbyRiiVCqWrmU=;
 b=LwEqWrppcfSHMMlS36z9NmN9uWOe889T7KIG0Rzf3EZntaKAIPA6qnLg91TBH5FhFn
 Y8Fae1c7NYvI5i55KiVxwgY78IWdbC7cBYbjFBsNb4tkbq1OIa7sEuGK1q2cmeQA/R1v
 iaRTk1BVhQQbJ2cKU8NoHRWaB9BOlujIk/5q29cOxeIYY/yOpKNJ16agxcKeQaIvSIBL
 gQuJ2MUbFJU1/KSxjS0aqv8gBO0eTsa8jh36eeCg6Dt1Gz9q8BYG7abSURE4nQdcVDd0
 w5Nuwx/oqd46mxLkrNxER6Xbd7+0kHM0dAeVHx1wFNZorWiW4Of05Qp47lpDHGJwF8Hj
 pNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694705049; x=1695309849;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6sakCjyOjzqHhR3CcEqZlqRPiVTdIvwbyRiiVCqWrmU=;
 b=s1JYY0ZySBchEcnq/DRBa+yEHgCF2RQvCncuLyYhzk9h0M6HA0p0YxIblele4u7R3L
 btWPfZ5Rzf64ZTUY34b/RtksU6CDBK0h2nFMAEXegIgOuqZvrCXR0xFMxxP/NFV7GUpz
 PZafL1juliMhQUe2Eke2GMf7BH6em8GuDAu66jLPX5LPBMIZNF9rIfAacVP3bvup21pR
 hJ1DqfR6ZgTPWwInNXuGkW9ur4qwN+HCxmKgr//jMG80w90ppGvwQUqvHtuxXIfRxMRy
 oSVhQlciKXsTQ84cAWMhczZVvIAIboBap1QRu5bDsfKEvT41B3UqlBDRfcrmVl0DT0Uc
 oqrg==
X-Gm-Message-State: AOJu0YwcB0w4Jpw4LJGD7IxL8BjJ0QwKr1lXp8WA/f+NNu4KKtRLptsn
 8WGVwWzevf39yKIcTA1kMMXKxg==
X-Google-Smtp-Source: AGHT+IG233p9Vdz021pVsPgNKU6wr/f3oR4Eul7tUikEc6PZ2w8OqjnlHjmwn9W6/zsraTpVIy8DNQ==
X-Received: by 2002:a05:6000:1846:b0:31f:d95d:20a6 with SMTP id
 c6-20020a056000184600b0031fd95d20a6mr2571981wri.12.1694705048839; 
 Thu, 14 Sep 2023 08:24:08 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a056000004300b0031fba0a746bsm2056808wrx.9.2023.09.14.08.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 08:24:08 -0700 (PDT)
Date: Thu, 14 Sep 2023 17:24:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alvin Chang <alvinga@andestech.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH v2] target/riscv: update checks on writing pmpcfg for
 Smepmp version 1.0
Message-ID: <20230914-cb9bcd81a83afb82fa971d89@orel>
References: <20230908083834.628708-1-alvinga@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908083834.628708-1-alvinga@andestech.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Sep 08, 2023 at 04:38:34PM +0800, Alvin Chang wrote:
> Current checks on writing pmpcfg for Smepmp follows Smepmp version
> 0.9.1. However, Smepmp specification has already been ratified, and
> there are some differences between version 0.9.1 and 1.0. In this commit
> we update the checks of writing pmpcfg to follow Smepmp version 1.0.
> 
> When mseccfg.MML is set, the constraints to modify PMP rules are:
> 1. Locked rules connot be removed or modified until a PMP reset, unless
>    mseccfg.RLB is set.
> 2. From Smepmp specification version 1.0, chapter 2 section 4b:
>    Adding a rule with executable privileges that either is M-mode-only
>    or a locked Shared-Region is not possible and such pmpcfg writes are
>    ignored, leaving pmpcfg unchanged.
> 
> The commit transfers the value of pmpcfg into the index of the Smepmp
> truth table, and checks the rules by aforementioned specification
> changes.
> 
> Signed-off-by: Alvin Chang <alvinga@andestech.com>
> ---
> Changes from v1: Convert ePMP over to Smepmp.
> 
>  target/riscv/pmp.c | 51 ++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 42 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 9d8db493e6..d1c3fc1e4f 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -98,16 +98,49 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>                  locked = false;
>              }
>  
> -            /* mseccfg.MML is set */
> -            if (MSECCFG_MML_ISSET(env)) {
> -                /* not adding execute bit */
> -                if ((val & PMP_LOCK) != 0 && (val & PMP_EXEC) != PMP_EXEC) {
> -                    locked = false;
> -                }
> -                /* shared region and not adding X bit */
> -                if ((val & PMP_LOCK) != PMP_LOCK &&
> -                    (val & 0x7) != (PMP_WRITE | PMP_EXEC)) {
> +            /*
> +             * mseccfg.MML is set. Locked rules cannot be removed or modified
> +             * until a PMP reset. Besides, from Smepmp specification version 1.0
> +             * , chapter 2 section 4b says:
> +             * Adding a rule with executable privileges that either is
> +             * M-mode-only or a locked Shared-Region is not possible and such
> +             * pmpcfg writes are ignored, leaving pmpcfg unchanged.
> +             */
> +            if (MSECCFG_MML_ISSET(env) && !pmp_is_locked(env, pmp_index)) {
> +                /*
> +                 * Convert the PMP permissions to match the truth table in the
> +                 * ePMP spec.
> +                 */
> +                const uint8_t epmp_operation =
> +                    ((val & PMP_LOCK) >> 4) | ((val & PMP_READ) << 2) |
> +                    (val & PMP_WRITE) | ((val & PMP_EXEC) >> 2);
> +
> +                switch (epmp_operation) {
> +                /* pmpcfg.L = 0. Neither M-mode-only nor locked Shared-Region */
> +                case 0:
> +                case 1:
> +                case 2:
> +                case 3:
> +                case 4:
> +                case 5:
> +                case 6:
> +                case 7:
> +                /* pmpcfg.L = 1 and pmpcfg.X = 0 (but case 10 is not allowed) */
> +                case 8:

case 0 ... 8:

> +                case 12:
> +                case 14:
> +                /* pmpcfg.LRWX = 1111 */
> +                case 15:  /* Read-only locked Shared-Region on all modes */
>                      locked = false;
> +                    break;
> +                /* Other rules which add new code regions are not allowed */
> +                case 9:
> +                case 10:  /* Execute-only locked Shared-Region on all modes */
> +                case 11:

case 9 ... 11:

And why not put these cases in numerical order?

> +                case 13:
> +                    break;
> +                default:
> +                    g_assert_not_reached();
>                  }
>              }
>          } else {
> -- 
> 2.34.1
> 
>

It looks like this patch has overlap with 

https://lore.kernel.org/all/20230907062440.1174224-1-mchitale@ventanamicro.com/

Maybe you and Mayuresh can work together on a final patch.

Thanks,
drew


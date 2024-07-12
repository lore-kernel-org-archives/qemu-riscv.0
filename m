Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69D7C2BD09
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 12:54:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sSFnI-00041t-QA; Fri, 12 Jul 2024 08:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFmx-0002YL-PM
 for qemu-riscv@nongnu.org; Fri, 12 Jul 2024 08:54:15 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFmv-0002oy-5H
 for qemu-riscv@nongnu.org; Fri, 12 Jul 2024 08:54:15 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ee98947f70so21194841fa.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Jul 2024 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720788850; x=1721393650; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w3LFhu/HGc++2pHpMUYF9LvJeoWIcHgg9CKQjzdkSME=;
 b=wPshzpHmVZK6dZkeKHfmaHpCEtYpOUEHyGdWUPeThj0evv7Sq/AUrGkTQOa6/YdKse
 uXreh3GNKERMVzQqad+pdKGXAALyGI5/z77enngPKJDH4vV00cDa1L/6kabWMuvvVBYE
 n0iVKIvLSRqXAKPEFDax2qXnPhfDv4DeeKKWDPQZ37DoX1hJALKpFy2p65Htx7piGU6m
 D5BI5U9udOqDMyMNy1cbYRuTI7VgdWE2/9Rg66XtX1OGHPbFRFaZ0lj7vOfyptUogBrb
 Lqz/U1jC5VMcvDkLTS2hN9375agAQmTNiGIC2Ks92+LR71fK7H/oVtBF5J4NutPlLbyy
 XxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720788850; x=1721393650;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w3LFhu/HGc++2pHpMUYF9LvJeoWIcHgg9CKQjzdkSME=;
 b=fsuXBAWUip3gAAby8be1CZxZ7ikjYqIIFpfGrnuJmaq0EebxDCyZBQTySE081wPBE4
 0ipV0Hq379obdJbLlpo11Ou9wHTM8lPE7FvBYz7jKl39HnG7hOMsx1g3vTYB5QzqbLs/
 P3pc36v1HUGF6LYPa9igLsYRsnYi6bMSmVVrCXZKo/wLrbRZcWOPHmCF1zOvLug0Jmdx
 ZPzbjOtNT5eRgycanKDfyu/ocxiOHYtdB1rF7s3oDEmhUclCHLOrKaggC5xTPJvf8Pas
 X+CS5ABrUGF7hpfcl9PKJNU72GTmtj9sN37QVRw+6qIpOTJYBafcqYHoCBwr2RccXtMm
 REqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkFyOUOzT2eGyt3T8EmdH7s5j+j8oGK0fEa7mYL+O/P6tnC0bhnNlYsNEP2211AeRdyzgOoEoFLEaCe6Oi37jkNQyo5iM=
X-Gm-Message-State: AOJu0YyiiASno+qb/8tf9ztlJ0gQ12Fa/I/128ttsHh1H6/X3wg8Rju1
 dt1PRGyDJ0ajUWh9Sr+O3/dGsOEwaYllHcwit4Sp6njoEncJ0pOXEEbU8QxG+bachgAEePbBs2+
 XUp0j+oypge0Bg/D1ffaM4F5Fc5rKNZLqy5Xm0w==
X-Google-Smtp-Source: AGHT+IHvsiXbJZfiT+tDoGV6NEyE37LZBu7tNnmbeM60eFwO59ekAiVd6dFaXALTflTG2fnHlUosXMr9AVTHLGVcHIo=
X-Received: by 2002:a2e:9d88:0:b0:2ee:db2c:5754 with SMTP id
 38308e7fff4ca-2eedb2c5827mr139581fa.42.1720788850328; Fri, 12 Jul 2024
 05:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-4-richard.henderson@linaro.org>
In-Reply-To: <20240710032814.104643-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2024 13:53:58 +0100
Message-ID: <CAFEAcA-R7Bh9oLcxPPx+Nr6DmsqKkMKzc0NF5Q8jpw206YtyUA@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] target/arm: Use set/clear_helper_retaddr in
 helper-a64.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu, 
 max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x232.google.com
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

On Wed, 10 Jul 2024 at 04:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use these in helper_dc_dva and the FEAT_MOPS routines to
> avoid a race condition with munmap in another thread.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-a64.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
> index 0ea8668ab4..c60d2a7ec9 100644
> --- a/target/arm/tcg/helper-a64.c
> +++ b/target/arm/tcg/helper-a64.c
> @@ -928,6 +928,8 @@ uint32_t HELPER(sqrt_f16)(uint32_t a, void *fpstp)
>
>  void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
>  {
> +    uintptr_t ra = GETPC();
> +
>      /*
>       * Implement DC ZVA, which zeroes a fixed-length block of memory.
>       * Note that we do not implement the (architecturally mandated)
> @@ -948,8 +950,6 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
>
>  #ifndef CONFIG_USER_ONLY
>      if (unlikely(!mem)) {
> -        uintptr_t ra = GETPC();
> -
>          /*
>           * Trap if accessing an invalid page.  DC_ZVA requires that we supply
>           * the original pointer for an invalid page.  But watchpoints require
> @@ -971,7 +971,9 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
>      }
>  #endif
>
> +    set_helper_retaddr(ra);
>      memset(mem, 0, blocklen);
> +    clear_helper_retaddr();
>  }
>
>  void HELPER(unaligned_access)(CPUARMState *env, uint64_t addr,
> @@ -1120,7 +1122,9 @@ static uint64_t set_step(CPUARMState *env, uint64_t toaddr,
>      }
>  #endif
>      /* Easy case: just memset the host memory */
> +    set_helper_retaddr(ra);
>      memset(mem, data, setsize);
> +    clear_helper_retaddr();
>      return setsize;
>  }
>
> @@ -1163,7 +1167,9 @@ static uint64_t set_step_tags(CPUARMState *env, uint64_t toaddr,
>      }
>  #endif
>      /* Easy case: just memset the host memory */
> +    set_helper_retaddr(ra);
>      memset(mem, data, setsize);
> +    clear_helper_retaddr();
>      mte_mops_set_tags(env, toaddr, setsize, *mtedesc);
>      return setsize;
>  }

I was briefly uncertain about this, but since we restrict
the size of the amount of memory we're setting to not cross
a guest page, if the memset() does fault it should only
be for the case of "the whole block went away", so you never
get the situation of "successfully wrote a chunk and then
faulted partway through, and we should have written the
tags for the partial write and did not".

So

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


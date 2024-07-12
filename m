Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553B0C3DA4B
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 13:01:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sSFti-0005pJ-HZ; Fri, 12 Jul 2024 09:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFtY-0005K5-UV
 for qemu-riscv@nongnu.org; Fri, 12 Jul 2024 09:01:05 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFtM-00059u-Sy
 for qemu-riscv@nongnu.org; Fri, 12 Jul 2024 09:01:03 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38028so2678442a12.0
 for <qemu-riscv@nongnu.org>; Fri, 12 Jul 2024 06:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720789250; x=1721394050; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XTGrjiuBE8ZAPhvRWlQ8HaI2d2Kh/eTTboY51XDwLU0=;
 b=LEgBFNrB6GBqyRbTJ5Nb6atFXMTQgGAZl+c9YZFMcxFgijWD8CoyKJXS8W3DLr4fTE
 rzuWZ+CqOHNLNylku+wcvdWMV2LrWITEr+bCulo13ZIEjLo4Bbp3N2dvdfvy376mJm00
 nyEnIi/2k0HxtBgtmjFWxpa2v58z36ZNT1zgY6Ko6kz0TFcRXxBpbqYcfqriXmK6s28P
 CG5Qf6FW/AJN7hCHJb7hB1akrLHZKm0pwEaSOOii0Bzq7UfJFZuccDPYORpshDBfteUT
 apZdJvmin8mwQgsTVjx4vKPgZ/bFGaGXSzd2W8HhW+Nyq/CyRS+LgTZ9UvAtyRhAzZn6
 v9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720789250; x=1721394050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XTGrjiuBE8ZAPhvRWlQ8HaI2d2Kh/eTTboY51XDwLU0=;
 b=wnvi7RCopr7ybtPXkCAi0R1zknZekjfl2sR/jmvwU02rcM2E+hg6CslS+Jq9BwUPuJ
 0Ll+jVmPUiWg8RbvC6d3S2SuSKY1f0RKn5oljBfn4hez5mkW9ZQvNd93gI2twDm9AWVu
 xXSpZsWllZwDBxZqulMYdkbFeGCTf4GxOc5JutlW29hwrjpBFljnXK/fU92jxJduGcEQ
 VqD/R5FV5thK1zEcGsOZGUTLgL4AqcJ1dIxuu+JXnmiFki6amzWNEorasY3Jsr80PK7B
 zVmFOt+11LKZFU94qP/V413Mnh5iTXvI17ltcVzKSQbUBeqN/0XsRXPtxpBey+5jLNKi
 B2eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp8/VacKwkim6bqT5FKHBEw6cAnlaSAuLfT9WkZUuCsjIOonGXfrJUXCuEIgEB0DvWcwaLXk+eoPQFD9TB1hQzmW3NCH8=
X-Gm-Message-State: AOJu0Yw3lr4+KT09By4rlJW3Ih0iYyA0UWgcw/sn4DFsmaMvlTHMsPe1
 ZcLzBzCAW4TF7Einqux1sHKnm641/hC1DKxXIp79Zu0jRNHzvagFB+77uxvvtBqQr6oBnM0E2Jk
 2ABxoZ9BYRmEP2Cqj6bCtELQ4ZX6hWChnWMURsw==
X-Google-Smtp-Source: AGHT+IHpsBCnBfmbge0GGFPg/rF0By96DUTBCeUqH6Cz9jDdaK6UdgfCYwn4r+u6jsRbVUeBbugWYYHvmcUlIuPVtsw=
X-Received: by 2002:a05:6402:2689:b0:599:8471:be42 with SMTP id
 4fb4d7f45d1cf-5998471beb4mr1814061a12.29.1720789249840; Fri, 12 Jul 2024
 06:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-5-richard.henderson@linaro.org>
In-Reply-To: <20240710032814.104643-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2024 14:00:39 +0100
Message-ID: <CAFEAcA-GCKq_t24zOf_sCtQHE4svtvi67Zr0mrLpo+GV1uWeMA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] target/arm: Use set/clear_helper_retaddr in SVE
 and SME helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu, 
 max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Wed, 10 Jul 2024 at 04:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Avoid a race condition with munmap in another thread.
> Use around blocks that exclusively use "host_fn".
> Keep the blocks as small as possible, but without setting
> and clearing for every operation on one page.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sme_helper.c | 16 ++++++++++++++++
>  target/arm/tcg/sve_helper.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)


> @@ -6093,6 +6101,8 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
>      reg_last = info.reg_off_last[0];
>      host = info.page[0].host;
>
> +    set_helper_retaddr(retaddr);
> +
>      do {
>          uint64_t pg = *(uint64_t *)(vg + (reg_off >> 3));
>          do {
> @@ -6113,6 +6123,8 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
>          } while (reg_off <= reg_last && (reg_off & 63));
>      } while (reg_off <= reg_last);
>
> +    clear_helper_retaddr();
> +
>      /*
>       * MemSingleNF is allowed to fail for any reason.  We have special
>       * code above to handle the first element crossing a page boundary.

There's a "goto do_fault" inside the loop that we've bracketed here with
the set/clear_helper_retaddr() calls -- don't we need to call
clear_helper_retaddr() on that failure path too?

There's a TODO comment at the top of this file:

/*
 * Load contiguous data, first-fault and no-fault.
 *
 * For user-only, one could argue that we should hold the mmap_lock during
 * the operation so that there is no race between page_check_range and the
 * load operation.  However, unmapping pages out from under a running thread
 * is extraordinarily unlikely.  This theoretical race condition also affects
 * linux-user/ in its get_user/put_user macros.
 *
 * TODO: Construct some helpers, written in assembly, that interact with
 * host_signal_handler to produce memory ops which can properly report errors
 * without racing.
 */

Should we update it to note that we make at least some attempt to
handle the pages-unmapped-from-under-a-running-thread situation now?

thanks
-- PMM


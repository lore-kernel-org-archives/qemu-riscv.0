Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E35C30653
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 09:32:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sPIpa-0006Yb-O0; Thu, 04 Jul 2024 05:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPIpY-0006Vz-U6
 for qemu-riscv@nongnu.org; Thu, 04 Jul 2024 05:32:44 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPIpX-00023z-6b
 for qemu-riscv@nongnu.org; Thu, 04 Jul 2024 05:32:44 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111aeso592401a12.0
 for <qemu-riscv@nongnu.org>; Thu, 04 Jul 2024 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720085561; x=1720690361; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wg5r9sYSQsAvjhQ+CRVIQveWls8q4Cp7ZuTqAA6lFzA=;
 b=qDw9DZlPPlu8o0cFuH9Of8+aeCMdVYNsYNNsHUqpEBWmZKqfMLVKlSGT5qEEXjXsRB
 f1WEc6AU+wS8Vl41uZwJ+z2liX/aWtlhDsopuJ8tZupvvWEuaHFd5Pp4C8V3se2d124K
 tG/eSZITlAfPQjNWi5Kv1CjRz5p1Q7hUWSp+sf5cgKwtcUz08Eaz2OKDgPXgxOBIeupN
 3WQJf7HxiVfgerVer7diSHQfU2o0qYXUEJ8GfplnUhf3fHJUz4UOmM3v+VqpFNAh68gr
 jsVGm2EDw4ErGEt3/ZrxsswL+6FXppGNW6j2Sodp9rVJGer41Z3etAsiC+V+s5psR5nq
 29/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720085561; x=1720690361;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wg5r9sYSQsAvjhQ+CRVIQveWls8q4Cp7ZuTqAA6lFzA=;
 b=IsTDifI+CFT7FzB5HwluZ6pmXDx7XHZa0njQeFRfa5Bb1F5CiqKzvoB/AH7bAfDX7d
 EjlxrAqz0lkuL+8o1Fm4P0OEiOfO//I0D284sbnFOtJlp/hjkbp7ktlasx9WvwvndBoy
 XWsmX9+/VzFLHAnJYj7bX/UZM3ZqR02G9OvlGXCJK8R/EoVqwga6M/t1soFg9iutcZOa
 jPbOQ387HuIYXwP7TdK09W+P6jIIu60YPrCZOwVHdpSwJS1AqIQWvsJ4rB6o9EOOQfjl
 89kUJIoMubGry8y46nvAbJBPQHUyqcbS9uanXyI7Bm55zxA2ooWTk9ThKZS8CsXHDsRV
 oTJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyElWXOKYlaeDA6P5XJF1EUMFlPbCePx4XSauRq6caCp9GC/51TnZDa3E7m7E5FEVlN20z2B/4mZNZVr1FVzplqQbNiEE=
X-Gm-Message-State: AOJu0YxeA4ZX4JozuF9Gsu8LgX5H+KgWSUJlajwTnFXoXr1hdX733fdr
 BwBr0YxAxrBLQiC1z1a1ScXg0vlvqGqmxM6L6wlFOoksHvg6HdJBUDMXgjwldTd8Szwi6nfTtXG
 U0mYfJKx0gG6nF2hhrLBm2O4rcnq469dZnt9g8A==
X-Google-Smtp-Source: AGHT+IE7qXHKBYmBeRGY9jO1i6pr9B2inR+WbVBPpgVsf7Cvbh+WgpRKmtihOw20IuEFvTewixVo7sDHvFXPMqFBQk0=
X-Received: by 2002:a05:6402:34c1:b0:587:2fa6:496a with SMTP id
 4fb4d7f45d1cf-58e5abdc863mr784969a12.15.1720085560867; Thu, 04 Jul 2024
 02:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240703213102.254927-1-zheyuma97@gmail.com>
In-Reply-To: <20240703213102.254927-1-zheyuma97@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2024 10:32:29 +0100
Message-ID: <CAFEAcA_9_fymBmp4Ei+ZxP3PB6u3JckTxufLcJn6JKuf4Yjkaw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: Fix heap-buffer-overflow in SiFive
 PLIC read operation
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 3 Jul 2024 at 22:32, Zheyu Ma <zheyuma97@gmail.com> wrote:
>
> The sifive_plic_read function in hw/intc/sifive_plic.c had a potential
> heap-buffer-overflow issue when reading from the pending_base region.
> This occurred because the code did not check if the calculated word index
> was within valid bounds before accessing the pending array.
>
> This fix prevents out-of-bounds memory access, ensuring safer and more
> robust handling of PLIC reads.
>
> ASAN log:
> ==78800==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x602000038a14 at pc 0x5baf49d0d6cb bp 0x7ffc2ea4e180 sp 0x7ffc2ea4e178
> READ of size 4 at 0x602000038a14 thread T0
>     #0 0x5baf49d0d6ca in sifive_plic_read hw/intc/sifive_plic.c:151:16
>     #1 0x5baf49f7f3bb in memory_region_read_accessor system/memory.c:445:11
>
> Reproducer:
> cat << EOF | qemu-system-riscv64  -display \
> none -machine accel=qtest, -m 512M -machine shakti_c -m 2G -qtest stdio
> readl 0xc001004
> EOF
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>  hw/intc/sifive_plic.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index e559f11805..d2a90dfd3a 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -147,7 +147,14 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
>                              (plic->num_sources + 31) >> 3)) {
>          uint32_t word = (addr - plic->pending_base) >> 2;
>
> -        return plic->pending[word];
> +        if (word < plic->bitfield_words) {
> +            return plic->pending[word];
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "sifive_plic_read: Word out of bounds for pending_base read: word=%u\n",
> +                          word);
> +            return 0;
> +        }

This seems a bit odd. This part of the code is guarded by

    } else if (addr_between(addr, plic->pending_base,
                            (plic->num_sources + 31) >> 3)) {

and we calculate plic->bitfield_words in realize based on
plic->num_sources:
    s->bitfield_words = (s->num_sources + 31) >> 5;

so presumably the intention was that we put enough words
in the bitfield for the number of sources we have, so that
the array access wouldn't overrun. Maybe we got the
calculation wrong?

thanks
-- PMM


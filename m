Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE14C77B7A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 13:16:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5R75-0004HG-Kr; Sat, 03 Jun 2023 09:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5R70-0004GB-Gm; Sat, 03 Jun 2023 09:16:06 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5R6y-0005H5-6K; Sat, 03 Jun 2023 09:16:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EBD161552;
 Sat,  3 Jun 2023 13:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F2CC433D2;
 Sat,  3 Jun 2023 13:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685798161;
 bh=jdBfC8M/UeDJhRX4xZbo7Bz6TwknpgHfXur02EL5wy8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PSWbuluk/7bKmbdE8ZW48op+/Q+SglTb8ZL1YzMCTujibNIhIBFjpzDGClaUtznB6
 B3Y8FrLo1FfY+2zvxhsN1YFmT3OrQU5n7eiZ+dqcxSc4Mx/BLlqISOVUvC79G+do+0
 e8Y/WD81kHK34xY5UrHN1gIE/MlahtUesLUZWzwepYu8uBiSX+sDqeuiKiXqZnIIri
 6J2X/EnzsKKfKZRm+149NpiIWw4a7YFHVFXkiX2WSIZx49GvTZFk/KJhaLxb8NzcPx
 Rwe30n4Ec0qKOlgrOoj3vhnRyPnwyRPQNW4oCgKtvL7UdsganyCxg9eYy4CXFxE9yQ
 kgLcrVP1a7h5g==
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4f5021faa16so4101371e87.2; 
 Sat, 03 Jun 2023 06:16:00 -0700 (PDT)
X-Gm-Message-State: AC+VfDwCJHSePP8zFjvuoTw1Nfc6PWj+gta7DWs0Siogn53D6bniKy1w
 6tukAh1q2pJwKWOgRbrOPxM0v48FN1sj6VJn8pI=
X-Google-Smtp-Source: ACHHUZ5CABEEFTjCQf6iOQ2ahZPGOaie/wFH9UspeNPqvXBSKGVPQWfe7cgFf85xDfgqQFl2mc+rzLIxHFGy3Yw74j4=
X-Received: by 2002:a05:6512:4c6:b0:4f5:17c3:c23a with SMTP id
 w6-20020a05651204c600b004f517c3c23amr3217337lfq.60.1685798158973; Sat, 03 Jun
 2023 06:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
 <20230603023426.1064431-5-richard.henderson@linaro.org>
In-Reply-To: <20230603023426.1064431-5-richard.henderson@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 3 Jun 2023 15:15:47 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFuESELf9gjsBBKOtZKLxM2cyuzBecQm4+KHT4XtiRLhA@mail.gmail.com>
Message-ID: <CAMj1kXFuESELf9gjsBBKOtZKLxM2cyuzBecQm4+KHT4XtiRLhA@mail.gmail.com>
Subject: Re: [PATCH 04/35] crypto: Add aesenc_SB_SR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.157,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sat, 3 Jun 2023 at 04:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Start adding infrastructure for accelerating guest AES.
> Begin with a SubBytes + ShiftRows primitive.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  host/include/generic/host/aes-round.h | 15 +++++++++
>  include/crypto/aes-round.h            | 41 +++++++++++++++++++++++
>  crypto/aes.c                          | 47 +++++++++++++++++++++++++++
>  3 files changed, 103 insertions(+)
>  create mode 100644 host/include/generic/host/aes-round.h
>  create mode 100644 include/crypto/aes-round.h
>
> diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
> new file mode 100644
> index 0000000000..598242c603
> --- /dev/null
> +++ b/host/include/generic/host/aes-round.h
> @@ -0,0 +1,15 @@
> +/*
> + * No host specific aes acceleration.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HOST_AES_ROUND_H
> +#define HOST_AES_ROUND_H
> +
> +#define HAVE_AES_ACCEL  false
> +#define ATTR_AES_ACCEL
> +
> +void aesenc_SB_SR_accel(AESState *, const AESState *, bool)
> +    QEMU_ERROR("unsupported accel");
> +
> +#endif
> diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
> new file mode 100644
> index 0000000000..784e1daee6
> --- /dev/null
> +++ b/include/crypto/aes-round.h
> @@ -0,0 +1,41 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * AES round fragments, generic version
> + *
> + * Copyright (C) 2023 Linaro, Ltd.
> + */
> +
> +#ifndef CRYPTO_AES_ROUND_H
> +#define CRYPTO_AES_ROUND_H
> +
> +/* Hosts with acceleration will usually need a 16-byte vector type. */
> +typedef uint8_t AESStateVec __attribute__((vector_size(16)));
> +
> +typedef union {
> +    uint8_t b[16];
> +    uint32_t w[4];
> +    uint64_t d[4];
> +    AESStateVec v;
> +} AESState;
> +
> +#include "host/aes-round.h"
> +
> +/*
> + * Perform SubBytes + ShiftRows.
> + */
> +
> +void aesenc_SB_SR_gen(AESState *ret, const AESState *st);
> +void aesenc_SB_SR_genrev(AESState *ret, const AESState *st);
> +
> +static inline void aesenc_SB_SR(AESState *r, const AESState *st, bool be)
> +{
> +    if (HAVE_AES_ACCEL) {
> +        aesenc_SB_SR_accel(r, st, be);
> +    } else if (HOST_BIG_ENDIAN == be) {
> +        aesenc_SB_SR_gen(r, st);
> +    } else {
> +        aesenc_SB_SR_genrev(r, st);
> +    }
> +}
> +
> +#endif /* CRYPTO_AES_ROUND_H */
> diff --git a/crypto/aes.c b/crypto/aes.c
> index 1309a13e91..708838315a 100644
> --- a/crypto/aes.c
> +++ b/crypto/aes.c
> @@ -29,6 +29,7 @@
>   */
>  #include "qemu/osdep.h"
>  #include "crypto/aes.h"
> +#include "crypto/aes-round.h"
>
>  typedef uint32_t u32;
>  typedef uint8_t u8;
> @@ -1251,6 +1252,52 @@ static const u32 rcon[] = {
>          0x1B000000, 0x36000000, /* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
>  };
>
> +/* Perform SubBytes + ShiftRows. */
> +static inline void
> +aesenc_SB_SR_swap(AESState *r, const AESState *st, bool swap)
> +{
> +    const int swap_b = swap ? 15 : 0;
> +    uint8_t t;
> +
> +    /* These four indexes are not swizzled. */
> +    r->b[swap_b ^ 0x0] = AES_sbox[st->b[swap_b ^ AES_SH_0]];
> +    r->b[swap_b ^ 0x4] = AES_sbox[st->b[swap_b ^ AES_SH_4]];
> +    r->b[swap_b ^ 0x8] = AES_sbox[st->b[swap_b ^ AES_SH_8]];
> +    r->b[swap_b ^ 0xc] = AES_sbox[st->b[swap_b ^ AES_SH_C]];
> +
> +    /* Otherwise, break cycles. */
> +

This is only needed it r == st, right?

> +    t = AES_sbox[st->b[swap_b ^ AES_SH_D]];
> +    r->b[swap_b ^ 0x1] = AES_sbox[st->b[swap_b ^ AES_SH_1]];
> +    r->b[swap_b ^ 0x5] = AES_sbox[st->b[swap_b ^ AES_SH_5]];
> +    r->b[swap_b ^ 0x9] = AES_sbox[st->b[swap_b ^ AES_SH_9]];
> +    r->b[swap_b ^ 0xd] = t;
> +
> +    t = AES_sbox[st->b[swap_b ^ AES_SH_A]];
> +    r->b[swap_b ^ 0x2] = AES_sbox[st->b[swap_b ^ AES_SH_2]];
> +    r->b[swap_b ^ 0xa] = t;
> +
> +    t = AES_sbox[st->b[swap_b ^ AES_SH_E]];
> +    r->b[swap_b ^ 0x6] = AES_sbox[st->b[swap_b ^ AES_SH_6]];
> +    r->b[swap_b ^ 0xe] = t;
> +
> +    t = AES_sbox[st->b[swap_b ^ AES_SH_7]];
> +    r->b[swap_b ^ 0x3] = AES_sbox[st->b[swap_b ^ AES_SH_3]];
> +    r->b[swap_b ^ 0xf] = AES_sbox[st->b[swap_b ^ AES_SH_F]];
> +    r->b[swap_b ^ 0xb] = AES_sbox[st->b[swap_b ^ AES_SH_B]];
> +    r->b[swap_b ^ 0x7] = t;
> +}
> +
> +void aesenc_SB_SR_gen(AESState *r, const AESState *st)
> +{
> +    aesenc_SB_SR_swap(r, st, false);
> +}
> +
> +void aesenc_SB_SR_genrev(AESState *r, const AESState *st)
> +{
> +    aesenc_SB_SR_swap(r, st, true);
> +}
> +
>  /**
>   * Expand the cipher key into the encryption key schedule.
>   */
> --
> 2.34.1
>


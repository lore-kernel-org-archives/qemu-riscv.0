Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F9CEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 16:56:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBIB2-0003ut-MO; Mon, 19 Jun 2023 12:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qBIAx-0003rZ-60
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 12:56:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qBIAv-0005Px-59
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 12:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687193780;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9TaWdFIT78HQGbQBRiGxI8mzcYVoXQipdC27auca3p0=;
 b=dxD3aoWfGvN2Kr73BYzYFVyi9ph1laQtiXta5oulYwIp4VykQ7B5kVSRAZKP0hHTGMdTg6
 nnOOyLBQjY67eegZGRuQ7uJjZWtVqCdmxN7DRsw51vKra1YNOflqO/cS5ajaBfBzMi/m9U
 8FJC+JgDzQWplUq+8YWmzoCsz0dF5wc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-ETPvEJIMNyi6zyF7zvSUrw-1; Mon, 19 Jun 2023 12:56:15 -0400
X-MC-Unique: ETPvEJIMNyi6zyF7zvSUrw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 979053C11C94;
 Mon, 19 Jun 2023 16:56:14 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD665492C1B;
 Mon, 19 Jun 2023 16:56:12 +0000 (UTC)
Date: Mon, 19 Jun 2023 17:56:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, ardb@kernel.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: Re: [PATCH v2 06/38] crypto: Add aesenc_SB_SR_AK
Message-ID: <ZJCIqmERcjqY+UMu@redhat.com>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-7-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230609022401.684157-7-richard.henderson@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jun 08, 2023 at 07:23:29PM -0700, Richard Henderson wrote:
> Start adding infrastructure for accelerating guest AES.
> Begin with a SubBytes + ShiftRows + AddRoundKey primitive.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  host/include/generic/host/aes-round.h | 16 ++++++++++
>  include/crypto/aes-round.h            | 44 +++++++++++++++++++++++++++
>  crypto/aes.c                          | 44 +++++++++++++++++++++++++++
>  3 files changed, 104 insertions(+)
>  create mode 100644 host/include/generic/host/aes-round.h
>  create mode 100644 include/crypto/aes-round.h
> 
> diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
> new file mode 100644
> index 0000000000..19c8505e2b
> --- /dev/null
> +++ b/host/include/generic/host/aes-round.h

Could we put these files under a 'crypto/' subdirectory eg

  host/include/generic/host/crypto/aes-round.h

and then add

  host/include/*/host/crypto

to MAINTAINERS for 'crypto'.

> @@ -0,0 +1,16 @@
> +/*
> + * No host specific aes acceleration.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef GENERIC_HOST_AES_ROUND_H
> +#define GENERIC_HOST_AES_ROUND_H

To match the extra sub-dir GENERIC_HOST_CRYPTO_AES_ROUND_H

> +
> +#define HAVE_AES_ACCEL  false
> +#define ATTR_AES_ACCEL
> +
> +void aesenc_SB_SR_AK_accel(AESState *, const AESState *,
> +                           const AESState *, bool)
> +    QEMU_ERROR("unsupported accel");
> +
> +#endif
> diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
> new file mode 100644
> index 0000000000..15ea1f42bc
> --- /dev/null
> +++ b/include/crypto/aes-round.h
> @@ -0,0 +1,44 @@
> +/*
> + * AES round fragments, generic version
> + * SPDX-License-Identifier: GPL-2.0-or-later
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
> +void aesenc_SB_SR_AK_gen(AESState *ret, const AESState *st,
> +                         const AESState *rk);
> +void aesenc_SB_SR_AK_genrev(AESState *ret, const AESState *st,
> +                            const AESState *rk);
> +
> +static inline void aesenc_SB_SR_AK(AESState *r, const AESState *st,
> +                                   const AESState *rk, bool be)
> +{
> +    if (HAVE_AES_ACCEL) {
> +        aesenc_SB_SR_AK_accel(r, st, rk, be);
> +    } else if (HOST_BIG_ENDIAN == be) {
> +        aesenc_SB_SR_AK_gen(r, st, rk);
> +    } else {
> +        aesenc_SB_SR_AK_genrev(r, st, rk);
> +    }
> +}
> +
> +#endif /* CRYPTO_AES_ROUND_H */
> diff --git a/crypto/aes.c b/crypto/aes.c
> index cdf937883d..896f6f44f1 100644
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
> @@ -1249,6 +1250,49 @@ static const u32 rcon[] = {
>          0x1B000000, 0x36000000, /* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
>  };
>  
> +/* Perform SubBytes + ShiftRows + AddRoundKey. */
> +static inline void
> +aesenc_SB_SR_AK_swap(AESState *ret, const AESState *st,
> +                     const AESState *rk, bool swap)
> +{
> +    const int swap_b = swap ? 15 : 0;
> +    AESState t;
> +
> +    t.b[swap_b ^ 0x0] = AES_sbox[st->b[swap_b ^ AES_SH_0]];
> +    t.b[swap_b ^ 0x1] = AES_sbox[st->b[swap_b ^ AES_SH_1]];
> +    t.b[swap_b ^ 0x2] = AES_sbox[st->b[swap_b ^ AES_SH_2]];
> +    t.b[swap_b ^ 0x3] = AES_sbox[st->b[swap_b ^ AES_SH_3]];
> +    t.b[swap_b ^ 0x4] = AES_sbox[st->b[swap_b ^ AES_SH_4]];
> +    t.b[swap_b ^ 0x5] = AES_sbox[st->b[swap_b ^ AES_SH_5]];
> +    t.b[swap_b ^ 0x6] = AES_sbox[st->b[swap_b ^ AES_SH_6]];
> +    t.b[swap_b ^ 0x7] = AES_sbox[st->b[swap_b ^ AES_SH_7]];
> +    t.b[swap_b ^ 0x8] = AES_sbox[st->b[swap_b ^ AES_SH_8]];
> +    t.b[swap_b ^ 0x9] = AES_sbox[st->b[swap_b ^ AES_SH_9]];
> +    t.b[swap_b ^ 0xa] = AES_sbox[st->b[swap_b ^ AES_SH_A]];
> +    t.b[swap_b ^ 0xb] = AES_sbox[st->b[swap_b ^ AES_SH_B]];
> +    t.b[swap_b ^ 0xc] = AES_sbox[st->b[swap_b ^ AES_SH_C]];
> +    t.b[swap_b ^ 0xd] = AES_sbox[st->b[swap_b ^ AES_SH_D]];
> +    t.b[swap_b ^ 0xe] = AES_sbox[st->b[swap_b ^ AES_SH_E]];
> +    t.b[swap_b ^ 0xf] = AES_sbox[st->b[swap_b ^ AES_SH_F]];
> +
> +    /*
> +     * Perform the AddRoundKey with generic vectors.
> +     * This may be expanded to either host integer or host vector code.
> +     * The key and output endianness match, so no bswap required.
> +     */
> +    ret->v = t.v ^ rk->v;
> +}
> +
> +void aesenc_SB_SR_AK_gen(AESState *r, const AESState *s, const AESState *k)
> +{
> +    aesenc_SB_SR_AK_swap(r, s, k, false);
> +}
> +
> +void aesenc_SB_SR_AK_genrev(AESState *r, const AESState *s, const AESState *k)
> +{
> +    aesenc_SB_SR_AK_swap(r, s, k, true);
> +}
> +
>  /**
>   * Expand the cipher key into the encryption key schedule.
>   */
> -- 
> 2.34.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



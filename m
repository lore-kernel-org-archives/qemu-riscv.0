Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85D2CD6E5D
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 00:59:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUZx8-0004jW-UF; Tue, 02 Jun 2026 20:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUZx2-0004iq-2X
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 20:59:21 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUZx0-0007au-Iw
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 20:59:19 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-bdb3fd39045so1806042966b.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 17:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780448357; cv=none;
 d=google.com; s=arc-20240605;
 b=SiwLd9116rK/zZ9GydtrKt2mmee70/E4Jz8XdKlUcJOAQQTvO60aVTFpKc/oFJrS/L
 B3lzX/YPcQnEqeceKm8Q46irgLOjXDFF088HkoacInh7LGu6tXmb8P7b/62Ft5AExeDI
 X1siyjW2zdWpp8ItiEWbgBNX/LhJfu5Yp1TmV9rhGeY7Itd97xcjy6Ec2Bx9sGVzeswY
 ILXeDB312wFGmK/2QK2aF2k2dSr7Z2QsL8CUSBnoToA5Yx6E2M5EW8IDPyyMr2GjEIqJ
 HfgTLC12NmJ0C/58tfOKHSzx9/GigqSOqy5VjIxUM5abYmkNoadcqQY35TtqH4O7/Uql
 HsqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LUe+j5C8frOjbnZ0XLm3wUu16M4PlKL1OBlgCGFrUhk=;
 fh=U1nLsaogGWdP9gZ2emM0HAB5I7I88EKGBTft+mMJqBI=;
 b=crfJBrwXkokqzC3/qrbWdd/kVkV8FX2JTmG7ZRITonHGbmktX2NaqAToIdAWN3cK3L
 i8F1X8IE1ovqjQABh27in/Y5iWkuL263tIqSa8t0DXkX0saKvW9QYG4GgBE2AhbRwzqu
 qi/ADwC4lvqNGkAKPBKRTgr55Nuy7CEzafxTCwnSZMqIu8h5rP4YcDsvrchskavC+L2R
 l0Ju4gH/Bd6ceMxlBZVt1D86me6xNLLWqFCxN1qOPWHSulHU+DbYfGMGnMi/G5zTFW5H
 Kty6fY9YHbanmSYOqB87ncNJPABRcSxoDDiIEJIocR7KHa4C68w+mzyd3tO2eb+mQWy1
 zlhg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780448357; x=1781053157; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUe+j5C8frOjbnZ0XLm3wUu16M4PlKL1OBlgCGFrUhk=;
 b=JjoaMIawZse/j92c3X2Cy9mBPSiZErzsVaIfg/kJPuddKJNq5rWBrdkmDhr3mxaADQ
 d6LRdEA+oY9uSigfHUgGwyL9uXREehQ8AZDuJ+uMcEdeSbn4Vu9qJyBMPQcXZbi6GL8M
 IScSMy7bLcxtOsaQuauZlMvAhLskv4/+HxImp3prGn0pYtn9mhg/s0+k4V9i03+pFZeX
 8VEHzMme2Y8yqLqOkVH5Cy1eZCJ0fqOpgJQvVCtddyz6TnFMZ83TP2C0HqRqNoRyUwZp
 pYRp81Mlhcpqi8HfQRBZxXqroxSLU1pyXTvQuTgSH2FyXiBqeO9NqaevAdEB/t4iOymn
 fM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780448357; x=1781053157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LUe+j5C8frOjbnZ0XLm3wUu16M4PlKL1OBlgCGFrUhk=;
 b=DaeKk1DHcZNjeNepFV2ae/coNjMODsC47gB9zC+FLGK+cURNeaxYNrh+xjzsTUQSdL
 udnQbjj2pb6I4ryPIpOd6LRmeoRgRF/Bii3FdjjWCaErtPv+haZzuoSbWEYxPzzeQnlF
 txBw5ns5INIwyRnwuQc6vZMQPFIfjPEXxOfzU1PUaKDEHu5Hinn9bLjcauPWih/lk3w3
 Hsef3lZBHJyOwCaZ2cr/3wzfo2IA/ymbqX1CUcUnQfMlV+ygZV8cYFxKm0p7A4xC5d8K
 DcREwBkU4MFBGp6Hi6JV00XNfZjyo7TCIdQSkaUzGCG9BGDW7/IEKaZd9J3J/zUffY/H
 q9rA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+xENCjbztpELPYpd/WKKM+cVW7DPFKsXuR4q+P+mLEPU758RqhnOgcFGg3vQ25WpWv1TodFzm1SE0D@nongnu.org
X-Gm-Message-State: AOJu0Yy3IJVsfaLuojRLin57QbDlTQ4X+wdUBAWaXhm1qcD0kL+kSFLG
 Z6iGQqHP+iGQ/ocHKllzKYbuRwKGdcmokgrQRzglRqr3MQimkRKCe6vjxLdUg77hJBffvNVg4LC
 wObYHgU/aql02MxOgNd8n0u77RhcoZnw=
X-Gm-Gg: Acq92OGoEvjXIJkm8B/HeNVgJQCwAg/lC7AT6qHxYV7HxUE2ZeT+xoYqUPoPnSawlQM
 H1jzBHMLFSBvpunTO3T2Zq87wlf3NBN3OXbgYxrnENo4ohbzF8vkcYk5VmfWOYZv5F8CkmIz1Rq
 Gq02mYnGftV1IoOwMg4J0jgdOFsLvXwGZ5tpLS9qQFNByzWaZMOMchPaaqj5eDLCna8AfWUcV2L
 xuSJqBnXkYPib4aLBYJcfL8tA+ycYLyPawQwhMdfazh6nfIvlKwzaqI+cGhJKEe660RWSObP5wN
 86Gi11lrS2ne83a7wrD9Sy1FIT5lGlFvDcwl0WcW49hoJLrq
X-Received: by 2002:a17:907:6d1c:b0:bf0:1c43:bd2f with SMTP id
 a640c23a62f3a-bf0ac4044dfmr36966966b.2.1780448356579; Tue, 02 Jun 2026
 17:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260530102100.78150-1-314abh@gmail.com>
In-Reply-To: <20260530102100.78150-1-314abh@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jun 2026 10:58:50 +1000
X-Gm-Features: AVHnY4JFQsf-TaydXflYKL_pggqak1LzD_YtYvskbUK7FPXlVNZ61zF-0dWk888
Message-ID: <CAKmqyKM3BpEyGMLG4sA79L28zkKb5nO0ug1r_4j=gU4LxVFdvg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: mask vxrm csrw write to the low 2 bits
To: Abhigyan Kumar <314abh@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sat, May 30, 2026 at 8:22=E2=80=AFPM Abhigyan Kumar <314abh@gmail.com> w=
rote:
>
> Citing the RISC-V specification:
>
>     "The vector fixed-point rounding-mode register holds a two-bit
>     read-write rounding-mode field in the least-significant bits
>     (vxrm[1:0]). The upper bits, vxrm[XLEN-1:2], should be written as
>     zeros."
>
> QEMU wrote full value into env->vxrm causing read of upper bits too.
> Used existing macros for bit-masking. Previous had a hard-coded value.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3470
> Signed-off-by: Abhigyan Kumar <314abh@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5514e0f45..7b98d66db 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -977,7 +977,7 @@ static RISCVException write_vxrm(CPURISCVState *env, =
int csrno,
>  #if !defined(CONFIG_USER_ONLY)
>      env->mstatus |=3D MSTATUS_VS;
>  #endif
> -    env->vxrm =3D val;
> +    env->vxrm =3D val & (VCSR_VXRM >> VCSR_VXRM_SHIFT);
>      return RISCV_EXCP_NONE;
>  }
>
> --
> 2.54.0
>
>


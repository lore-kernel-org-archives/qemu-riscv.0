Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524F8C001DB
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 12:11:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUQyc-0006es-Dt; Fri, 11 Aug 2023 08:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQyZ-0006aw-Ri
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 08:10:43 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQyX-0003nd-5N
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 08:10:43 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52256241c50so2510661a12.3
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691755839; x=1692360639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R+YarypYTGCN4jmeBdUW732G4PzAZjpDFadIlIjD8OM=;
 b=jOI6++QGG/LU8u4G1T+IsW7+1rI3UAin/8X9x/hLyLHP5WqQ2A/usxeJDmKgivMNzR
 rZo4tFc4FcjRSyKPRQxyjcBuhLjkmO0HLzn1IiAU8k+5fo9MKWUpPj2uJ3BJ+Z/NL93I
 k4amU+c5z2fxyrr8YGlMZkjw0scGOXLSiJu9MbZTt1TGHDX6Mpj78uEjiVxjTLdrhl7b
 0YCByy7czyhD/wsHhtYT+v6IHZeI1j9PALvCXnXysYrBAQnwXzianGOtx7ig2kXFQ3Fq
 ahKAs6mm48rBajuFjEFlu+O1FJdBXWOcJo4TxcwaODxY1J+kpJaBqLBAk9+FL66xq3RC
 Hoeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691755839; x=1692360639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R+YarypYTGCN4jmeBdUW732G4PzAZjpDFadIlIjD8OM=;
 b=UcOt0+qadIODSGT0piwJ23w+ImRMRNS3vd1Jsvxrrt8nnoZl+1OxmAK3vqDANrWVT2
 pUa7YnyXLgmz3RTWtsw/X/oxDls8RHTNOIULkvs50BTTN0K008hnI/fUaWSAswx6vdC2
 Sld3PfEgHXisrWAAChBpNhI1igR8FPFkDZBQ34f9GGwEhDal912iy2zXEIXqMiztsku4
 9w6eVxgmyO+0QSiD7yt/BBgV1c9RYC3ptrte8KQ9SOPzWWpODTS/4hDA44MefeDKT5M4
 A96KXx+0Apy2w+W0x8t+636Kg6BCGg/iO6jz2J0GMayeenrTdHWtGec8z17Y2SPW0JeD
 XVoQ==
X-Gm-Message-State: AOJu0YwKnmdd8i0uZuQpZhJbYa4X5H3B1DGixRsQDJU9375JG4VH/5M1
 zmxkyqVWrquFEprvHfYLdoQXn8MxqyxJNd4vxLlcWg==
X-Google-Smtp-Source: AGHT+IHGWoicXdpRmtKOB+gbjVb2w3oE3j/o7ote0SMro6U27rm3uaEsGFx6zVgPWTopt+6rLT8e5aF3+WJBaRboebE=
X-Received: by 2002:aa7:d1d5:0:b0:523:102f:3ce0 with SMTP id
 g21-20020aa7d1d5000000b00523102f3ce0mr1569364edp.21.1691755839657; Fri, 11
 Aug 2023 05:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-24-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 13:10:28 +0100
Message-ID: <CAFEAcA8ox9sM-86a=U22fOnmV1wBROiaCyT6vaUrXA46Kk=X=g@mail.gmail.com>
Subject: Re: [PATCH 23/24] tcg/i386: Use shift in tcg_out_setcond
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On Tue, 8 Aug 2023 at 04:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For LT/GE vs zero, shift down the sign bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


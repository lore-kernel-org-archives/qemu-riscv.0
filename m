Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFF8C77B7C
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 May 2023 12:05:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwM5q-0004SD-RS; Tue, 09 May 2023 08:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwM5a-0004Nu-SZ
 for qemu-riscv@nongnu.org; Tue, 09 May 2023 08:05:09 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwM5X-0006rL-7X
 for qemu-riscv@nongnu.org; Tue, 09 May 2023 08:05:05 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso10921090a12.2
 for <qemu-riscv@nongnu.org>; Tue, 09 May 2023 05:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683633901; x=1686225901;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FtnmDLDOsU/IlqLkId45Pc72BUE73jMq14qxm6Cd1EE=;
 b=yR7/qZTB67ODJ0NoKg2I6B/z1+lFfNr2ne62xC3BLLw+ImFoNK+6mycBPsEpg8xdXR
 JW5v1GrL8+aSia4pjVa1HEMnqZviKq/OVB5zN6jwo62DPUyLed8mFGH6OytNbfYcG3Hv
 rW7yvvZ97xi4Ee73aF3adhehUq7vriyPCWXOn9+VD7C4s4/COFR1a05NHTw7Ib1MEJzR
 43tJm5vtuG0gXcTENhzSZS2+qU82MpW8f/4exoBVVRT6wakhzwF309YvyVZ7fXOME3st
 blV6IQW/b9v4oXpfsGqkQxycc38S8s8quy33b8+AK+q03V5JWkAx8Gl6JgErOo9qGXSC
 8aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683633901; x=1686225901;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FtnmDLDOsU/IlqLkId45Pc72BUE73jMq14qxm6Cd1EE=;
 b=cwwvMhguCLdXdKJNohPeYsIZE8PUaHWbkqMTe7r7cLybq0hT6fq6oncpmW9V3TL2FB
 KKBnO2wK9ODNFWmK/Lo3vd7AmXk/g3g3k0o8/ugNtyXf5T/YQk2D88pMhjqZaQgrOfd4
 cOi8Kd75DU8yDxU24PccN5MfkHOECLoNtqO85RLtZqkQFytDj9o3+93Y3urJiHK7iUo3
 RPxUcEwx7DP+vwDp1mmcAUA5L3dpBwnveZMuICrfxafThP2dAS5Zb0PPLGVGn8LAkPmf
 qctE9GQYYGXN5GoOa90FqrTXfmY1EfRBjyiNdTX3iAcWf99RTcvyAUp7crkwbx0qkRHH
 Ryhw==
X-Gm-Message-State: AC+VfDziCX85TmgJC+Q5l6nATy8VPwoksDzTyEiwFg3HaQwZQ6P/MKf/
 C2g8xwqDy7m+tNGQ468+f9XC1CJ8IkQX0H4Pfrxa0g==
X-Google-Smtp-Source: ACHHUZ4PXzzo1tBSSpSH16ChRsRSnhs7CS5tMXlene/zGGeZG0tYWK9Po8orbMwLsITROZStog4r5f0KdbWZH9Mn1GA=
X-Received: by 2002:aa7:d64d:0:b0:50c:3dc:2262 with SMTP id
 v13-20020aa7d64d000000b0050c03dc2262mr10014803edr.39.1683633901517; Tue, 09
 May 2023 05:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-7-richard.henderson@linaro.org>
 <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
 <8988fc6b-8f07-1ab7-663d-3392ca19f7f8@linaro.org>
In-Reply-To: <8988fc6b-8f07-1ab7-663d-3392ca19f7f8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 13:04:50 +0100
Message-ID: <CAFEAcA-79iL8=+143w1jxTG1WM-8NODqqgF4droY=avopm4a7g@mail.gmail.com>
Subject: Re: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Fri, 5 May 2023 at 21:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/4/23 18:17, Peter Maydell wrote:
> >> +    case MO_ATOM_WITHIN16:
> >> +        tmp = p & 15;
> >> +        if (tmp + (1 << size) <= 16) {
> >> +            atmax = size;
> >
> > OK, so this is "whole operation is within 16 bytes,
> > whole operation must be atomic"...
> >
> >> +        } else if (atmax == size) {
> >> +            return MO_8;
> >
> > ...but I don't understand the interaction of WITHIN16
> > and also specifying an ATMAX value that's not ATMAX_SIZE.
>
> I'm trying to describe e.g. LDP, which if not within16 has two 8-byte elements, one or
> both of which must be atomic.  We will have set MO_ATOM_WITHIN16 | MO_ATMAX_8.
>
> If atmax == size, there is only one element, and since it is not within16, there is no
> atomicity.
>
> >> +        } else if (tmp + (1 << atmax) != 16) {
> >
> > Why is this doing an exact inequality check?
> > What if you're asking for a load of 8 bytes at
> > MO_ATMAX_2 from a pointer that's at an offset of
> > 10 bytes from a 16-byte boundary? Then tmp is 10,
> > tmp + (1 << atmax) is 12, but we could still do the
> > loads at atomicity 2. This doesn't seem to me to be
> > any different from the case it does catch where
> > the first ATMAX_2-sized unit happens to be the only
> > thing in this 16-byte block.
>
> If the LDP is aligned mod 8, but not aligned mod 16, then both 8-byte operations must be
> (separately) atomic, and we return MO_64.

So there's an implicit "at most 2 atomic sub-operations
inside a WITHIN16 load" restriction? i.e. you can't
use WITHIN16 to say "do this 8 byte load atomically but
if it's not in a 16-byte region do it with 4 2-byte loads",
even though in theory MO_ATOM_WITHIN16 | MO_ATMAX_2 | MO_8
would describe that ?

thanks
-- PMM


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E227C3DA59
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 12:08:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sVrqF-00030S-BR; Mon, 22 Jul 2024 08:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrq0-00029u-LG
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 08:08:25 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrpz-0008A7-1h
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 08:08:20 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77cc44f8aaso218670166b.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jul 2024 05:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721650097; x=1722254897; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tNhx5XCbDz2ES+x3Bn09OzYyRx83+WywVAD5VUceAnw=;
 b=MolMc0VT2S7JFA2+oZPbDfLLQR0yhvNZ+jcQDuL/Gg6yWx7c1Z+Lw2m6ShvDhau5jy
 69wxWP97xr6vBBG834fImvg4BgSjQKX4VfVNXAJYgQeD9pxn/z+of0z+zVKob45JstKx
 3JYv1hemjwAWKtpU9AJJ83cba6KR0bRryolxJ3/MaqH0L8/iUHI+b5ZfwmPNZE9wSTxZ
 EzHsQopzFJLRxSAC3sK8OtVeLUwyjVIN8yxdDfKREYanTX+vo43aIluSnEby/Iotq0A4
 zyXK4fDeEVf29nynt+U7SVZCLtI2PCjCxxxAEAOt94K5FJrZPx/2CLa8qrc5WTr187Tv
 Wdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721650097; x=1722254897;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tNhx5XCbDz2ES+x3Bn09OzYyRx83+WywVAD5VUceAnw=;
 b=NMvYWmzqIk/ignXp3iHgmKFHAKmotNGI5MHyhLDXOTrrM/XUSMjTsocZ06gj8WwDos
 Ld+Uxh405lzLAMnOkOPAV5e/pTtdcKVzFFh+Ku2elN6WWeORDmoeCjgBh/Ve6OwaBswS
 +JSU/UW1s7HaQhNjrzLWPEx7L1Z6tPkWcbkKgQ1yhVyQouje1oTL6U3mdF0qj9Fls4bK
 Tx+c8f0D066Gfzwbd0Ikb5iQZF33Xl7nrNO54uwDxBrQF3s1t1H0UZmtZl/ROhIJHrZe
 NEOLFd+srHrzEUpZjhdhg32I9+mVJ3thhWpoMWEcd5sMT+MlQTUw6oNfqUXZBCP/ZMYe
 PHww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX05SpSkU4t2yXRYpaArAWnwIPmGBPYW3hppP9hLo2y+mCsgMCpt1VVbtD0zLXjIifb/Yd5kxYEQamVL1uQeytmbWqvEY=
X-Gm-Message-State: AOJu0YyCiq5dNmrRyVrs9XMcicUf4sqieut1/tiTO/dcvv33kSFG9YJz
 l2ZaOV7rc/i1F4RxUzZ7DJvJik0B4FfcRXqkcjVoaNFtgUsW7fCOOmfClFxj9nrAyt6Brd5/clP
 Z+iUZ7oW7vbMxTSXGB+AVraxErI8X0iXonUwubw==
X-Google-Smtp-Source: AGHT+IFk/sRPFT7ntlKIpcbEDYk92bIFDYiAB96cwYrkiSaj9/WugrTyEQAgEfWBGltNeNgze6A4uizf0uQfmAhbj7M=
X-Received: by 2002:a05:6402:50c8:b0:5a2:c1b1:4d3 with SMTP id
 4fb4d7f45d1cf-5a47b1dee89mr6199567a12.28.1721650097158; Mon, 22 Jul 2024
 05:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
 <20240719010707.1319675-9-richard.henderson@linaro.org>
In-Reply-To: <20240719010707.1319675-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2024 13:08:06 +0100
Message-ID: <CAFEAcA8HxomNgX2pALS7M0BMiqxcCtBV932WDDXE-KO+00HZkg@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] target/ppc: Improve helper_dcbz for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Fri, 19 Jul 2024 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark the reserve_addr check unlikely.  Use tlb_vaddr_to_host
> instead of probe_write, relying on the memset itself to test
> for page writability.  Use set/clear_helper_retaddr so that
> we can properly unwind on segfault.
>
> With this, a trivial loop around guest memset will spend
> nearly 50% of runtime within helper_dcbz and host memset.

I find this a bit difficult to interpret -- maybe add
what it was before (presumably spending too much time
somewhere else) ?

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


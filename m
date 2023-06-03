Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5FFC7EE24
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 13:24:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5REp-0006iX-By; Sat, 03 Jun 2023 09:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5RES-0006dO-LR; Sat, 03 Jun 2023 09:23:49 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5REQ-0007up-3T; Sat, 03 Jun 2023 09:23:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3444F612E3;
 Sat,  3 Jun 2023 13:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98687C433EF;
 Sat,  3 Jun 2023 13:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685798622;
 bh=BFVBGD7v6rh2/5Za+ZsV7xHljLaz5IJIwT+zG8uh4Kw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RYE6asm8CZ4DytSlyqmRWEcsLeBxcKqu9Ta8lvh6ZPeA4+bOLHfAHdBpSVO4nej+k
 JZ6b+3ia8xpfcyH6uNh/8MigDDU6VDhaZjEjjv8BrzrUz1MAaskRLr5IaK4/byJN9X
 zny0w612ddbecGqInVcJ0YfQGJsKO1ARz53+O262hu0iFERQhZALHMewh6S3FOqn/P
 jt9AA5zCbK+TWDPLAQ1xBO7H0x7hM9EfCOXKo6b57Ls/yPoxAeuaiDc0L+H+CCKVVe
 GxA39gqutg2E3OM/+tndACykAYRfuoe3M6jMv6yN8Jj1dZsVYKxikbPgCmYFcGGm0p
 3GXVa4v8a3tyw==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-4f4db9987f8so5372006e87.1; 
 Sat, 03 Jun 2023 06:23:42 -0700 (PDT)
X-Gm-Message-State: AC+VfDxk/mWP87XyT1xxdJRo743nhmEQj1bMWbhd9+byj5Y4UkgfzCxm
 voN3joCk1qfQWHnOo4sSab8XSfLiaD165h7mrIc=
X-Google-Smtp-Source: ACHHUZ5PkkhzaZ1AcD4SfEwrhI9OhT+Ey7jq5on7UGIyzfB5Ssqt+smjTw4DqKDGr5xBjLLRl8RAjW9Doq884f8yQEo=
X-Received: by 2002:a05:6512:b96:b0:4f6:19c3:da30 with SMTP id
 b22-20020a0565120b9600b004f619c3da30mr584745lfv.29.1685798620608; Sat, 03 Jun
 2023 06:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 3 Jun 2023 15:23:29 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHp7QHftNw6t3ww8wgL9rAUHEauS0S04d=Rfey7EO3bcg@mail.gmail.com>
Message-ID: <CAMj1kXHp7QHftNw6t3ww8wgL9rAUHEauS0S04d=Rfey7EO3bcg@mail.gmail.com>
Subject: Re: [PATCH 00/35] crypto: Provide aes-round.h and host accel
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
> Inspired by Ard Biesheuvel's RFC patches for accelerating AES
> under emulation, provide a set of primitives that maps between
> the guest and host fragments.
>
> There is a small guest correctness test case.
>
> I think the end result is quite a bit cleaner, since the logic
> is now centralized, rather than spread across 4 different guests.
>
> Further work could clean up crypto/aes.c itself to use these
> instead of the tables directly.  I'm sure that's just an ultimate
> fallback when an appropriate system library is not available, and
> so not terribly important, but it could still significantly reduce
> the amount of code we carry.
>
> I would imagine structuring a polynomial multiplication header
> in a similar way.  There are 4 or 5 versions of those spread across
> the different guests.
>
> Anyway, please review.
>
>
> r~
>
>
> Richard Henderson (35):
>   tests/multiarch: Add test-aes
>   target/arm: Move aesmc and aesimc tables to crypto/aes.c
>   crypto/aes: Add constants for ShiftRows, InvShiftRows
>   crypto: Add aesenc_SB_SR
>   target/i386: Use aesenc_SB_SR
>   target/arm: Demultiplex AESE and AESMC
>   target/arm: Use aesenc_SB_SR
>   target/ppc: Use aesenc_SB_SR
>   target/riscv: Use aesenc_SB_SR
>   crypto: Add aesdec_ISB_ISR
>   target/i386: Use aesdec_ISB_ISR
>   target/arm: Use aesdec_ISB_ISR
>   target/ppc: Use aesdec_ISB_ISR
>   target/riscv: Use aesdec_ISB_ISR
>   crypto: Add aesenc_MC
>   target/arm: Use aesenc_MC
>   crypto: Add aesdec_IMC
>   target/i386: Use aesdec_IMC
>   target/arm: Use aesdec_IMC
>   target/riscv: Use aesdec_IMC
>   crypto: Add aesenc_SB_SR_MC_AK
>   target/i386: Use aesenc_SB_SR_MC_AK
>   target/ppc: Use aesenc_SB_SR_MC_AK
>   target/riscv: Use aesenc_SB_SR_MC_AK
>   crypto: Add aesdec_ISB_ISR_IMC_AK
>   target/i386: Use aesdec_ISB_ISR_IMC_AK
>   target/riscv: Use aesdec_ISB_ISR_IMC_AK
>   crypto: Add aesdec_ISB_ISR_AK_IMC
>   target/ppc: Use aesdec_ISB_ISR_AK_IMC
>   host/include/i386: Implement aes-round.h
>   host/include/aarch64: Implement aes-round.h
>   crypto: Remove AES_shifts, AES_ishifts
>   crypto: Implement aesdec_IMC with AES_imc_rot
>   crypto: Remove AES_imc
>   crypto: Unexport AES_*_rot, AES_TeN, AES_TdN
>

This is looking very good - it is clearly a much better abstraction
than what I proposed, and I'd expect the performance boost to be the
same.


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4D1C77B73
	for <qemu-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 10:49:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5lHy-00074u-H0; Sun, 04 Jun 2023 06:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5lHn-000738-Ff; Sun, 04 Jun 2023 06:48:35 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5lHk-0001AF-7A; Sun, 04 Jun 2023 06:48:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C05360FE7;
 Sun,  4 Jun 2023 10:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB0DC433EF;
 Sun,  4 Jun 2023 10:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685875701;
 bh=a1e6BEUxyE1uoEC9a5NX1ZcyZMNXNjVMojKljRrdW6o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BX/2+5JmUycGVLsyJEf4SFILNMwrZqP2vqlayyf4byPj8wUU9/DlTyJz9BX4OU/0E
 zLUrkJ8lxWqh+/ThK22HVepJN/mlsFQj7YRhNLzTdqZkSERdR12JrhdNW1IZQBgsHb
 XSh0dlvmoMS0kLt7OnTOMfMy/HxOuzLxg8ZcJOSeVhOApiCiARaD3WRNMG2w8Tz+Si
 OPYRus4q1hIc+f00ZodqjPIaUk3nyzbOI4YNez0/nT1dHVdH1KbOupV3WFNeuuzDar
 NZzkB9zKen8j6+MKeWeijo0X3RjF/IeLyu1V2I/GeNoIZh38LtZVs0KYXS5LMLlYHr
 SMazVMFEdklEQ==
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so4706971e87.2; 
 Sun, 04 Jun 2023 03:48:21 -0700 (PDT)
X-Gm-Message-State: AC+VfDyKcWvAl8nBFI6ASdoDnxuIINxsaUb3NcD1YOXVBpYXZPpvu5rO
 RvdW6q/EMOF5FNAIPGjmZ/VthM0GIvLgQAvDxnE=
X-Google-Smtp-Source: ACHHUZ4m5b+yxYNWPqTr9a57tKNf4IH9oZrglX/Y1X3y1QHGEh3QlBMAcnc+mosPhftE7/u7YsOhRbIaLvCq4T0gKtg=
X-Received: by 2002:a2e:9b0a:0:b0:2af:160d:888a with SMTP id
 u10-20020a2e9b0a000000b002af160d888amr2893423lji.1.1685875699639; Sun, 04 Jun
 2023 03:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
 <CAMj1kXHp7QHftNw6t3ww8wgL9rAUHEauS0S04d=Rfey7EO3bcg@mail.gmail.com>
In-Reply-To: <CAMj1kXHp7QHftNw6t3ww8wgL9rAUHEauS0S04d=Rfey7EO3bcg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 4 Jun 2023 12:47:26 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEP97e57XBEuLZFQ4Ra31AQYcKWU+cfve0FeVPPX+zg=Q@mail.gmail.com>
Message-ID: <CAMj1kXEP97e57XBEuLZFQ4Ra31AQYcKWU+cfve0FeVPPX+zg=Q@mail.gmail.com>
Subject: Re: [PATCH 00/35] crypto: Provide aes-round.h and host accel
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ardb@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sat, 3 Jun 2023 at 15:23, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Sat, 3 Jun 2023 at 04:34, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Inspired by Ard Biesheuvel's RFC patches for accelerating AES
> > under emulation, provide a set of primitives that maps between
> > the guest and host fragments.
> >
> > There is a small guest correctness test case.
> >
> > I think the end result is quite a bit cleaner, since the logic
> > is now centralized, rather than spread across 4 different guests.
> >
> > Further work could clean up crypto/aes.c itself to use these
> > instead of the tables directly.  I'm sure that's just an ultimate
> > fallback when an appropriate system library is not available, and
> > so not terribly important, but it could still significantly reduce
> > the amount of code we carry.
> >
> > I would imagine structuring a polynomial multiplication header
> > in a similar way.  There are 4 or 5 versions of those spread across
> > the different guests.
> >
> > Anyway, please review.
> >
> >
> > r~
> >
> >
> > Richard Henderson (35):
> >   tests/multiarch: Add test-aes
> >   target/arm: Move aesmc and aesimc tables to crypto/aes.c
> >   crypto/aes: Add constants for ShiftRows, InvShiftRows
> >   crypto: Add aesenc_SB_SR
> >   target/i386: Use aesenc_SB_SR
> >   target/arm: Demultiplex AESE and AESMC
> >   target/arm: Use aesenc_SB_SR
> >   target/ppc: Use aesenc_SB_SR
> >   target/riscv: Use aesenc_SB_SR
> >   crypto: Add aesdec_ISB_ISR
> >   target/i386: Use aesdec_ISB_ISR
> >   target/arm: Use aesdec_ISB_ISR
> >   target/ppc: Use aesdec_ISB_ISR
> >   target/riscv: Use aesdec_ISB_ISR
> >   crypto: Add aesenc_MC
> >   target/arm: Use aesenc_MC
> >   crypto: Add aesdec_IMC
> >   target/i386: Use aesdec_IMC
> >   target/arm: Use aesdec_IMC
> >   target/riscv: Use aesdec_IMC
> >   crypto: Add aesenc_SB_SR_MC_AK
> >   target/i386: Use aesenc_SB_SR_MC_AK
> >   target/ppc: Use aesenc_SB_SR_MC_AK
> >   target/riscv: Use aesenc_SB_SR_MC_AK
> >   crypto: Add aesdec_ISB_ISR_IMC_AK
> >   target/i386: Use aesdec_ISB_ISR_IMC_AK
> >   target/riscv: Use aesdec_ISB_ISR_IMC_AK
> >   crypto: Add aesdec_ISB_ISR_AK_IMC
> >   target/ppc: Use aesdec_ISB_ISR_AK_IMC
> >   host/include/i386: Implement aes-round.h
> >   host/include/aarch64: Implement aes-round.h
> >   crypto: Remove AES_shifts, AES_ishifts
> >   crypto: Implement aesdec_IMC with AES_imc_rot
> >   crypto: Remove AES_imc
> >   crypto: Unexport AES_*_rot, AES_TeN, AES_TdN
> >
>
> This is looking very good - it is clearly a much better abstraction
> than what I proposed, and I'd expect the performance boost to be the
> same.

Benchmark results for OpenSSL running in emulation on TX2:

Without acceleration:

$ ../qemu/build/qemu-x86_64 apps/openssl speed -evp aes-128-ctr
version: 3.2.0-dev
built on: Thu Jun  1 17:06:09 2023 UTC
options: bn(64,64)
compiler: x86_64-linux-gnu-gcc -pthread -m64 -Wa,--noexecstack -Wall
-O3 -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_BUILDING_OPENSSL
-DNDEBUG
CPUINFO: OPENSSL_ia32cap=0xfed8320b0fcbfffd:0x8001020c01d843a9
The 'numbers' are in 1000s of bytes per second processed.
type             16 bytes     64 bytes    256 bytes   1024 bytes
8192 bytes  16384 bytes
AES-128-CTR      25146.07k    50482.19k    69373.44k    76236.80k
78391.98k    78381.06k


With acceleration:

$ ../qemu/build/qemu-x86_64 apps/openssl speed -evp aes-128-ctr
version: 3.2.0-dev
built on: Thu Jun  1 17:06:09 2023 UTC
options: bn(64,64)
compiler: x86_64-linux-gnu-gcc -pthread -m64 -Wa,--noexecstack -Wall
-O3 -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_BUILDING_OPENSSL
-DNDEBUG
CPUINFO: OPENSSL_ia32cap=0xfed8320b0fcbfffd:0x8001020c01d843a9
The 'numbers' are in 1000s of bytes per second processed.
type             16 bytes     64 bytes    256 bytes   1024 bytes
8192 bytes  16384 bytes
AES-128-CTR      28774.46k    81173.59k   162346.24k   206301.53k
224214.22k   225600.56k


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F38EEB64D9
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 17:31:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHpII-0007cT-4R; Fri, 07 Jul 2023 13:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1qHpIE-0007Zo-Ps; Fri, 07 Jul 2023 13:30:54 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1qHpIC-00028I-TQ; Fri, 07 Jul 2023 13:30:54 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-565f2567422so1537145eaf.2; 
 Fri, 07 Jul 2023 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688751051; x=1691343051;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ro2y0r/QNRLndcI33sQFq/jxZa1D5XfJ/O354DqgYN0=;
 b=eqE9Ul9HfgMuPLkMGV3g1L6TIrjqJblbaP4EuCpNj844Bayhxhe/HxEcu4fZmyLR/D
 vZP5BGH+afySQHzoCN6dsW+9eY6NsBtSLcCOgMdwRp9ViCzgJzwAkIDMBs16OawtC+no
 uAogmXkL0FKzUYpu6KDjez9qUCk1CTr7en6dz7MafK3KAoHbR3Dj+HinzqZpL3AwRCn8
 s/u7rr+qIvYO3JPFA97fx2/i/dom+GPHQhgmbMxOuL+dUKBzm+L3wtI11u+06BQbQMED
 0woRXrKaSIp/dNI8T6OTyyipR1I6Uog5tdcMNggBM/1MYj1EsyIFjA2I/zvLxDDP2TUY
 et8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688751051; x=1691343051;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ro2y0r/QNRLndcI33sQFq/jxZa1D5XfJ/O354DqgYN0=;
 b=BNUTVag5J6VDnc/Qdhm2cKWvO4BEP73fEupwHgi9O/s/oCb0Asua47zE4Qh/c/JjD+
 n+LmnwxVjHqnj+PTegL8/NRp8eEAKmKPNWA3USmKP5EqQvI/hyMI4QW/e+FbHzDs3m8e
 4Gz8LYhbX58YWVsmBld7V863uIafyzmtXZEJE8Ifi4d/dSh2EXNzYyaEZav3mCmKXWwl
 kBv0r8wAPxHBtccDMUMLNWgsf7CtoNqSd/SLYoEzyKP5E/lo6q4vHyv0xzF5mGIyrQOv
 gJXNfueCxr3baVXcF5wwxlIEk7aJ9XexaKLmDNfX+xMoJp2ehA9r0w3oXrZvTskW7SQD
 khrQ==
X-Gm-Message-State: ABy/qLbofDOUNKlzh97dVUx42/Ne7VFgEtf2zRwyiiWJdWkXa4+Im0oT
 xLvqwUxa0rvu9OcelxNngSk=
X-Google-Smtp-Source: APBJJlFrP8CpU7r5pAT0N2R+NJg7ji7fWc2vi+NkUdb4BilGnIueNYddzfTSxckI7WVZED1Lp/psCw==
X-Received: by 2002:a05:6808:c6:b0:398:2c02:20a2 with SMTP id
 t6-20020a05680800c600b003982c0220a2mr5251626oic.17.1688751050691; 
 Fri, 07 Jul 2023 10:30:50 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 y26-20020a544d9a000000b003a09db4a54bsm1942574oix.48.2023.07.07.10.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 10:30:50 -0700 (PDT)
Message-ID: <9877c1f7-a923-1457-071d-b08d0d816ca2@gmail.com>
Date: Fri, 7 Jul 2023 14:30:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 00/37] crypto: Provide aes-round.h and host accel
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.092,
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

Richard,

On 7/3/23 07:04, Richard Henderson wrote:
> Inspired by Ard Biesheuvel's RFC patches for accelerating AES
> under emulation, provide a set of primitives that maps between
> the guest and host fragments.
> 
> Changes for v4:
>    * Fix typo in AESState (Max Chou)
>    * Define AES_SH/ISH as macros (Ard Biesheuvel)
>    * Group patches by subsystem.
> 
> Patches lacking review:
>    12-host-include-i386-Implement-aes-round.h.patch
>    13-host-include-aarch64-Implement-aes-round.h.patch
>    21-target-i386-Use-aesdec_IMC.patch
>    22-target-i386-Use-aesenc_SB_SR_MC_AK.patch
>    23-target-i386-Use-aesdec_ISB_ISR_IMC_AK.patch
>    25-target-arm-Use-aesenc_SB_SR_AK.patch
>    26-target-arm-Use-aesdec_ISB_ISR_AK.patch
>    27-target-arm-Use-aesenc_MC.patch
>    28-target-arm-Use-aesdec_IMC.patch
>    29-target-riscv-Use-aesenc_SB_SR_AK.patch
>    30-target-riscv-Use-aesdec_ISB_ISR_AK.patch
>    31-target-riscv-Use-aesdec_IMC.patch
>    32-target-riscv-Use-aesenc_SB_SR_MC_AK.patch
>    33-target-riscv-Use-aesdec_ISB_ISR_IMC_AK.patch
> 
> Daniel(s), I could push the set that has been reviewed
> (crypto/, DPB; target/ppc/, DHB) through tcg-next if you like,
> just to reduce the outstanding set.  Perhaps smaller patch sets
> would help getting the other targets reviewed...
> 

Sorry for the delay reacting to my name drop.

You're more than welcome in posting the target/ppc bits via tcg-next. I was
kind of expecting you to do it but failed to mention explicitly back then.
Go ahead.

By the way I sent the PowerPC PR earlier today (you're probably already saw it).
So ... yeah, I'm counting on you into pushing this ppc code via the tcg queue,
in any format you find appropriate (smaller series, big series, single patch
per PR ... your call).


Thanks,


Daniel



> 
> r~
> 
> 
> Richard Henderson (37):
>    util: Add cpuinfo-ppc.c
>    tests/multiarch: Add test-aes
>    target/arm: Move aesmc and aesimc tables to crypto/aes.c
>    crypto/aes: Add AES_SH, AES_ISH macros
>    crypto: Add aesenc_SB_SR_AK
>    crypto: Add aesdec_ISB_ISR_AK
>    crypto: Add aesenc_MC
>    crypto: Add aesdec_IMC
>    crypto: Add aesenc_SB_SR_MC_AK
>    crypto: Add aesdec_ISB_ISR_IMC_AK
>    crypto: Add aesdec_ISB_ISR_AK_IMC
>    host/include/i386: Implement aes-round.h
>    host/include/aarch64: Implement aes-round.h
>    host/include/ppc: Implement aes-round.h
>    target/ppc: Use aesenc_SB_SR_AK
>    target/ppc: Use aesdec_ISB_ISR_AK
>    target/ppc: Use aesenc_SB_SR_MC_AK
>    target/ppc: Use aesdec_ISB_ISR_AK_IMC
>    target/i386: Use aesenc_SB_SR_AK
>    target/i386: Use aesdec_ISB_ISR_AK
>    target/i386: Use aesdec_IMC
>    target/i386: Use aesenc_SB_SR_MC_AK
>    target/i386: Use aesdec_ISB_ISR_IMC_AK
>    target/arm: Demultiplex AESE and AESMC
>    target/arm: Use aesenc_SB_SR_AK
>    target/arm: Use aesdec_ISB_ISR_AK
>    target/arm: Use aesenc_MC
>    target/arm: Use aesdec_IMC
>    target/riscv: Use aesenc_SB_SR_AK
>    target/riscv: Use aesdec_ISB_ISR_AK
>    target/riscv: Use aesdec_IMC
>    target/riscv: Use aesenc_SB_SR_MC_AK
>    target/riscv: Use aesdec_ISB_ISR_IMC_AK
>    crypto: Remove AES_shifts, AES_ishifts
>    crypto: Implement aesdec_IMC with AES_imc_rot
>    crypto: Remove AES_imc
>    crypto: Unexport AES_*_rot, AES_TeN, AES_TdN
> 
>   MAINTAINERS                                  |   1 +
>   meson.build                                  |   9 +
>   host/include/aarch64/host/cpuinfo.h          |   1 +
>   host/include/aarch64/host/crypto/aes-round.h | 205 +++++
>   host/include/generic/host/crypto/aes-round.h |  33 +
>   host/include/i386/host/cpuinfo.h             |   1 +
>   host/include/i386/host/crypto/aes-round.h    | 152 ++++
>   host/include/ppc/host/cpuinfo.h              |  30 +
>   host/include/ppc/host/crypto/aes-round.h     | 182 +++++
>   host/include/ppc64/host/cpuinfo.h            |   1 +
>   host/include/ppc64/host/crypto/aes-round.h   |   1 +
>   host/include/x86_64/host/crypto/aes-round.h  |   1 +
>   include/crypto/aes-round.h                   | 164 ++++
>   include/crypto/aes.h                         |  30 -
>   target/arm/helper.h                          |   2 +
>   target/i386/ops_sse.h                        |  60 +-
>   tcg/ppc/tcg-target.h                         |  16 +-
>   target/arm/tcg/sve.decode                    |   4 +-
>   crypto/aes.c                                 | 780 ++++++++++++-------
>   target/arm/tcg/crypto_helper.c               | 249 ++----
>   target/arm/tcg/translate-a64.c               |  13 +-
>   target/arm/tcg/translate-neon.c              |   4 +-
>   target/arm/tcg/translate-sve.c               |   8 +-
>   target/ppc/int_helper.c                      |  50 +-
>   target/riscv/crypto_helper.c                 | 138 +---
>   tests/tcg/aarch64/test-aes.c                 |  58 ++
>   tests/tcg/i386/test-aes.c                    |  68 ++
>   tests/tcg/ppc64/test-aes.c                   | 116 +++
>   tests/tcg/riscv64/test-aes.c                 |  76 ++
>   util/cpuinfo-aarch64.c                       |   2 +
>   util/cpuinfo-i386.c                          |   3 +
>   util/cpuinfo-ppc.c                           |  64 ++
>   tcg/ppc/tcg-target.c.inc                     |  44 +-
>   tests/tcg/multiarch/test-aes-main.c.inc      | 183 +++++
>   tests/tcg/aarch64/Makefile.target            |   4 +
>   tests/tcg/i386/Makefile.target               |   4 +
>   tests/tcg/ppc64/Makefile.target              |   1 +
>   tests/tcg/riscv64/Makefile.target            |  13 +
>   util/meson.build                             |   2 +
>   39 files changed, 2049 insertions(+), 724 deletions(-)
>   create mode 100644 host/include/aarch64/host/crypto/aes-round.h
>   create mode 100644 host/include/generic/host/crypto/aes-round.h
>   create mode 100644 host/include/i386/host/crypto/aes-round.h
>   create mode 100644 host/include/ppc/host/cpuinfo.h
>   create mode 100644 host/include/ppc/host/crypto/aes-round.h
>   create mode 100644 host/include/ppc64/host/cpuinfo.h
>   create mode 100644 host/include/ppc64/host/crypto/aes-round.h
>   create mode 100644 host/include/x86_64/host/crypto/aes-round.h
>   create mode 100644 include/crypto/aes-round.h
>   create mode 100644 tests/tcg/aarch64/test-aes.c
>   create mode 100644 tests/tcg/i386/test-aes.c
>   create mode 100644 tests/tcg/ppc64/test-aes.c
>   create mode 100644 tests/tcg/riscv64/test-aes.c
>   create mode 100644 util/cpuinfo-ppc.c
>   create mode 100644 tests/tcg/multiarch/test-aes-main.c.inc
> 


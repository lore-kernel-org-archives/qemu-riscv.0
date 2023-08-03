Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A71EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 04:17:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRPle-0006uU-NQ; Thu, 03 Aug 2023 00:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qRPld-0006uF-Tv
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 00:16:53 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qRPlb-00005D-1p
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 00:16:53 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a5a7ebdd9fso402012b6e.0
 for <qemu-riscv@nongnu.org>; Wed, 02 Aug 2023 21:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1691036207; x=1691641007;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IoxhNX4gbtgGPpGZZxwZsgwFIH4+/dp5oUN5r9FD1E0=;
 b=kdojOvCNhAsNc7r/WAsGsLCpVuhqsne+48zamG1n1ls+bjVR3GG7SqXdptoJpBpRTq
 bSTAZezlPpmBGEzih7IAL20pQHpArGo/WowpzavIO0+8abRxgLyJCycU0SEz0+fyPtoJ
 Q2uYU6TkuZA/dmLmMx36L1CxxfvyFHUsaK8Kz0Ar2dMNLzP9pE1qrip3wW4LMH1jVUN8
 M74wXL6DLh3SOZyba/Cy2I0dAvYpw2szQu2dB2h3zNnJZFkOuD9f/4Ym5eQi/USnB00r
 Noi3uUvpntIlGJw1uPlK536gc8Fkpg7EvkbEPnm4iJw7DJqW2pa3nNfydEzWiu1XY5Og
 AFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691036207; x=1691641007;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IoxhNX4gbtgGPpGZZxwZsgwFIH4+/dp5oUN5r9FD1E0=;
 b=ZbvtgkpPyPUuLqwE72hWp0duJ36MnRwA2rpgZuR/S0PjozerLYhyA3O00tilASYQAP
 C9kDGVjiOlYCKioPwJXZ6hha7vl5DxLGWrX0VKr22subg8S7Fu49X3SgU0prQxn9yfun
 maFuaMNo6zTcZFKdETEXsxtYQbdIw1R5TNSHTZucblaoiJRRrPN7QYFmiLJdKkgR2B4g
 t2fgvt4AUTlnafOJH4Ei6jXU2M+vzH78X4EEmDDcdCQ3oecOVmg3iZhNidfo5+LajZ0Y
 /SWZxnDb+vAgWMypMHCW2A/D3EuKqGgVBN4g5xn0+EgfIOu+m10XXoz4uwW5SRV7/VDm
 UK3g==
X-Gm-Message-State: ABy/qLYmkbZ8qpRpKHgDemgz8y6vOwH7ie0D2adkDyJZNb/iVlAB/IDq
 0YCyx1O7zA4gLALGOC2nVE3Nbw==
X-Google-Smtp-Source: APBJJlE3nu3QLl1uEGVoClu0lXpwx0nKsYqNUV80DWuKnaF6jQINmQ7Bhi0kbE9K3Ea2yPNT69Jecw==
X-Received: by 2002:a05:6358:9895:b0:134:de8b:17f0 with SMTP id
 q21-20020a056358989500b00134de8b17f0mr9110099rwa.19.1691036207608; 
 Wed, 02 Aug 2023 21:16:47 -0700 (PDT)
Received: from [10.11.0.74] (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 u10-20020aa7838a000000b006870814361bsm10448916pfm.114.2023.08.02.21.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 21:16:47 -0700 (PDT)
Message-ID: <ad20c2b0-9c1e-f1aa-1a5d-e5ea5df9b03e@sifive.com>
Date: Thu, 3 Aug 2023 12:16:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v8 00/15] Add RISC-V vector cryptographic instruction set
 support
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, dbarboza@ventanamicro.com
References: <20230711165917.2629866-1-max.chou@sifive.com>
 <CAKmqyKNpg=DMbidwRbR5La2GrETTfR--zKBGGgJ-eirRmCywBA@mail.gmail.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <CAKmqyKNpg=DMbidwRbR5La2GrETTfR--zKBGGgJ-eirRmCywBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=max.chou@sifive.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 2023/8/2 10:54 PM, Alistair Francis wrote:

> On Tue, Jul 11, 2023 at 12:59 PM Max Chou <max.chou@sifive.com> wrote:
>> This patchset provides an implementation for Zvbb, Zvbc, Zvkned, Zvknh,
>> Zvksh, Zvkg, and Zvksed of the draft RISC-V vector cryptography
>> extensions as per the v20230620 version of the specification(1)(168e7b4).
>> This is an update to the patchset submitted to qemu-devel on
>> Wed, 12 Jul 2023 00:31:21 +0800
>>
>> v2:
>>
>>      Squashed commits into one commit per extension with separate
>>      commits for each refactoring.
>>      Unified trans_rvzvk*.c.inc files into one trans_rvvk.c.inc.
>>      Style fixes in insn32.decode and other files.
>>      Added macros for EGS values in translation functions.
>>      Updated from v20230303 to v20230407 of the spec:
>>          Zvkb has been split into Zvbb and Zvbc.
>>          vbrev, vclz, vctz, vcpop and vwsll have been added to Zvbb.
>>
>> v3:
>>
>>      New patch 03/19 removes redundant “cpu_vl == 0” checks from
>>      trans_rvv.c.inc.
>>      Introduction of new tcg ops has been factored out of patch 11/19
>>      and into 09/19.
>>          These ops are now added to non riscv-specific files.
>>
>> v4:
>>
>>      New patch 08/17 fixes the tcg_gen_gvec_andcs temporary variable
>>      issue.
>>      Patch 09/17 fixes imm mode for vror.vi.
>>      Rebased to riscv-to-apply.next branch (de395bb):
>>          Replace vstart constraint checking by TCG op.
>>      Verified by code examples provided by vector crypto spec repository
>>      (riscv-crypto).
>>
>> v5:
>>
>>      Imported aes-round.h for Zvkned extension.
>>          Rebased to 20230620110758.787479-1-richard.henderson@linaro.org
>>      Exposed the properties of v4 patch 17/17 to the patches that the
>>      extension was added.
>>      Removed v4 patch 08/17 that is queued to tcg-next.
>>
>> v6:
>>
>>      Resent the same content becaue v5 was splitted by broken
>>      git-send-mail
>>
>> v7:
>>
>>      Fixed endian issues
>>      Replace the TCG ops of vstart & vl EGS checking by helper function
>>      Changed the SEW selection of vsha2c[hl].vv to TCG translation
>>
>> v8:
>>
>>      Rebased to the riscv-to-apply.next branch
>>      Fixed cross win32 build issue
>>      Removed redundent swap in AES key expanding (vaeskf1 & vaeskf2)
>>
>>
>> As v20230620 is a frozen version, we are not expecting any significant
>> changes to the specification or this patch series.
>>
>> Please note that the Zvkt data-independent execution latency extension
>> (and all extensions including it) has not been implemented, and we
>> would recommend not using these patches in an environment where timing
>> attacks are an issue.
>>
>> Work performed by Dickon, Lawrence, Nazar, Kiran, and William from
>> Codethink sponsored by SiFive, as well as Max Chou and Frank Chang
>> from SiFive.
>>
>>      https://github.com/riscv/riscv-crypto/releases
>>
>> Thanks to those who have already reviewed:
>>
>>      Daniel Henrique Barboza dbarboza@ventanamicro.com
>>          [PATCH v4 09/17] target/riscv: Add Zvbb ISA extension support
>>          [PATCH v4 10/17] target/riscv: Add Zvkned ISA extension support
>>          [PATCH v4 11/17] target/riscv: Add Zvknh ISA extension support
>>          [PATCH v4 12/17] target/riscv: Add Zvksh ISA extension support
>>          [PATCH v4 13/17] target/riscv: Add Zvkg ISA extension support
>>      Weiwei Li liweiwei@iscas.ac.cn
>>          [PATCH v3 01/19] target/riscv: Refactor some of the generic vector functionality
>>          [PATCH v3 02/19] target/riscv: Refactor vector-vector translation macro
>>          [PATCH v3 03/19] target/riscv: Remove redundant "cpu_vl == 0" checks
>>          [PATCH v3 05/19] target/riscv: Move vector translation checks
>>          [PATCH v3 06/19] target/riscv: Refactor translation of vector-widening instruction
>>          [PATCH v3 07/19] target/riscv: Refactor some of the generic vector functionality
>>          [PATCH v3 19/19] target/riscv: Expose Zvk* and Zvb[b, c] cpu properties
>>      Richard Henderson richard.henderson@linaro.org
>>          [PATCH v2 02/17] target/riscv: Refactor vector-vector translation macro
>>          [PATCH v2 04/17] target/riscv: Move vector translation checks
>>          [PATCH v2 05/17] target/riscv: Refactor translation of vector-widening instruction
>>          [PATCH v2 07/17] qemu/bitops.h: Limit rotate amounts
>>          [PATCH v2 08/17] qemu/host-utils.h: Add clz and ctz functions for lower-bit integers
>>          [PATCH v2 14/17] crypto: Create sm4_subword
>>      Alistair Francis alistair.francis@wdc.com
>>          [PATCH v2 02/17] target/riscv: Refactor vector-vector translation macro
>>      Philipp Tomsich philipp.tomsich@vrull.eu
>>          Various v1 reviews
>>      Christoph Müllner christoph.muellner@vrull.eu
>>          Various v1 reviews
>>
>> Dickon Hood (2):
>>    target/riscv: Refactor translation of vector-widening instruction
>>    target/riscv: Add Zvbb ISA extension support
>>
>> Kiran Ostrolenk (4):
>>    target/riscv: Refactor some of the generic vector functionality
>>    target/riscv: Refactor vector-vector translation macro
>>    target/riscv: Refactor some of the generic vector functionality
>>    target/riscv: Add Zvknh ISA extension support
>>
>> Lawrence Hunter (2):
>>    target/riscv: Add Zvbc ISA extension support
>>    target/riscv: Add Zvksh ISA extension support
>>
>> Max Chou (3):
>>    crypto: Create sm4_subword
>>    crypto: Add SM4 constant parameter CK
>>    target/riscv: Add Zvksed ISA extension support
>>
>> Nazar Kazakov (4):
>>    target/riscv: Remove redundant "cpu_vl == 0" checks
>>    target/riscv: Move vector translation checks
>>    target/riscv: Add Zvkned ISA extension support
>>    target/riscv: Add Zvkg ISA extension support
> Thanks!
>
> Applied to riscv-to-apply.next
>
> Alistair
Thanks!

We will send another patch set after the vector cryptographic spec is 
ratified for the corresponding update (e.g. remove the `x-` prefix from 
the cpu options, etc.).
And with the disassembler support and the `Zvkt` & other shorthand 
extensions support.

Max
>
>>   crypto/sm4.c                             |  10 +
>>   include/crypto/sm4.h                     |   9 +
>>   target/arm/tcg/crypto_helper.c           |  10 +-
>>   target/riscv/cpu.c                       |  37 +
>>   target/riscv/cpu_cfg.h                   |   8 +
>>   target/riscv/helper.h                    |  98 +++
>>   target/riscv/insn32.decode               |  58 ++
>>   target/riscv/insn_trans/trans_rvv.c.inc  | 171 ++--
>>   target/riscv/insn_trans/trans_rvvk.c.inc | 606 ++++++++++++++
>>   target/riscv/meson.build                 |   4 +-
>>   target/riscv/translate.c                 |   1 +
>>   target/riscv/vcrypto_helper.c            | 970 +++++++++++++++++++++++
>>   target/riscv/vector_helper.c             | 243 +-----
>>   target/riscv/vector_internals.c          |  81 ++
>>   target/riscv/vector_internals.h          | 228 ++++++
>>   15 files changed, 2179 insertions(+), 355 deletions(-)
>>   create mode 100644 target/riscv/insn_trans/trans_rvvk.c.inc
>>   create mode 100644 target/riscv/vcrypto_helper.c
>>   create mode 100644 target/riscv/vector_internals.c
>>   create mode 100644 target/riscv/vector_internals.h
>>
>> --
>> 2.34.1
>>


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B6DEB64D8
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 15:04:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qAAzO-00082G-5p; Fri, 16 Jun 2023 11:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qAAzL-00081b-QE
 for qemu-riscv@nongnu.org; Fri, 16 Jun 2023 11:03:47 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qAAzA-00075F-2e
 for qemu-riscv@nongnu.org; Fri, 16 Jun 2023 11:03:38 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-54fcef0204aso636897a12.2
 for <qemu-riscv@nongnu.org>; Fri, 16 Jun 2023 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1686927808; x=1689519808;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4fzBxoJrsqA72FLagFuZLlHo+kt6oB7EGHhB5rZfKO8=;
 b=MMD6/t7meD6X6L9VC02efaxefBKQJAo7FvOUR+aIrnZutOpv8tpfiddGAQkaI9jqXm
 a9mgLfIBM1OYb3VWEqPPbEUykAq5C29TXC9dDM3Pk9lfjNmPTbbsEeKOmtlUGk/Yz/gE
 qLPjCsYl3NKXRXIVIeR2ZP+jxsDUIMbSpxyX9aeoEay2hYon5u2lYErpXsXWn+CEZ7QP
 GBpldaCU+KdIkMUJgUsyM3yZtXhw/yO7tG51PLl/S0FDHdCKfs0HTpBWhLxKPZvxcG4s
 kwHuG9aTPLe5Lbfq1/stkoVrnEWeGDohCrOhqPAujJww17QPEqG/pT+o6df5Dmg2ey9N
 xXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686927808; x=1689519808;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4fzBxoJrsqA72FLagFuZLlHo+kt6oB7EGHhB5rZfKO8=;
 b=gkwaAWmC12RoKmsVWTKTlQ8i9NaTsnW+666D1K8QlIRayV7F2nladpHDnZqOlyk5+L
 5mOmLHZEou6v4MelXlGojk4eBODYIaMeLzIpASbIsvaJxu/pT7tTATmPWpccYtQw3F1J
 tCFEwLO2ZKLK6iDKHonPHWtuEKGcZooX0QSl/MsovrFGt/eixLjUZkDESUglu8hDiZ/+
 C+Mn0gFcgrv2mNS5PR2/+T+zo3I215k5bvjJ2xYvliX0l/yPqG7YISOriyqpxb5bpYMB
 3CNn4/jTllppBV5DHGcIK3E82vV8VIW4f1nICi6/7g1s1dQ1T0vJIUV1T05g5g7JoTHD
 R+sQ==
X-Gm-Message-State: AC+VfDwf6Rt3xXxovJtyrQVoj6rPt9T8txF0csHSL1EnL9ILE2ZlH2O9
 2FRwSWcKgnDimtP5XBvz1/VwSQ==
X-Google-Smtp-Source: ACHHUZ4aOnHVZ5iEXNcHInIHf3v62fXtxXlbjjKJ3pqNhg6vMzwrZqWv72dZtiMYgXbv5MDf16sRDA==
X-Received: by 2002:a17:90a:199d:b0:259:3e17:7e15 with SMTP id
 29-20020a17090a199d00b002593e177e15mr2081082pji.7.1686927807648; 
 Fri, 16 Jun 2023 08:03:27 -0700 (PDT)
Received: from [10.11.0.74] (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 h2-20020a17090a298200b002310ed024adsm1606329pjd.12.2023.06.16.08.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 08:03:27 -0700 (PDT)
Message-ID: <f1662612-ea0b-dd32-1c51-ebfa9c1cf950@sifive.com>
Date: Fri, 16 Jun 2023 23:03:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/19] Add RISC-V vector cryptographic instruction set
 support
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org,
 richard.henderson@linaro.org
References: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
 <7f2b7328-8c0b-0664-574f-fcf6fe442b74@ventanamicro.com>
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <7f2b7328-8c0b-0664-574f-fcf6fe442b74@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Daniel,

I'm Max Chou from SiFive, one of the authors of this patchset.

I'll take over to update this patchset to the v20230531 version of the 
RISC-V vector cryptography specification and take the comments from 
Weiwei Li into consideration.
Then I'll re-send, rebased on top of Alistair's riscv-to-apply.next in 
the next few days.

Thanks,

Max

On 2023/6/16 5:21 PM, Daniel Henrique Barboza wrote:
> Hi Lawrence,
>
> Can you please re-send, rebased on top of Alistair's 
> riscv-to-apply.next? There are
> some comments from Weiwei Li that are worth considering. Richard 
> Henderson also took
> patches 8-9-10 via his tcg queue so you don't have to worry about those.
>
> CC my email in the next version and I'll get some reviews going. QEMU 
> feature
> freeze for 8.1 is July 11th - perhaps we can squeeze this in for 8.1.
>
>
> Thanks,
>
> Daniel
>
> On 4/28/23 11:47, Lawrence Hunter wrote:
>> This patchset provides an implementation for Zvbb, Zvbc, Zvkned, 
>> Zvknh, Zvksh, Zvkg, and Zvksed of the draft RISC-V vector 
>> cryptography extensions as per the v20230425 version of the 
>> specification(1) (6a7ae7f2). This is an update to the patchset 
>> submitted to qemu-devel on Monday, 17 Apr 2023 14:58:36 +0100.
>>
>> v2:
>>
>>      squashed commits into one commit per extension with separate 
>> commits for
>>      each refactoring
>>      unified trans_rvzvk*.c.inc files into one trans_rvvk.c.inc
>>      style fixes in insn32.decode and other files
>>      added macros for EGS values in translation functions.
>>      updated from v20230303 to v20230407 of the spec:
>>          Zvkb has been split into Zvbb and Zvbc
>>          vbrev, vclz, vctz, vcpop and vwsll have been added to Zvbb.
>>
>> v3:
>>
>>      New patch 03/19 removes redundant “cpu_vl == 0” checks from 
>> trans_rvv.c.inc
>>      Introduction of new tcg ops has been factored out of patch 11/19 
>> and into 09/19
>>          These ops are now added to non riscv-specific files
>>
>> As v20230425 is a freeze candidate, we are not expecting any 
>> significant changes to the specification or this patch series.
>>
>> Please note that the Zvkt data-independent execution latency 
>> extension (and all extensions including it) has not been implemented, 
>> and we would recommend not using these patches in an environment 
>> where timing attacks are an issue.
>>
>> Work performed by Dickon, Lawrence, Nazar, Kiran, and William from 
>> Codethink sponsored by SiFive, as well as Max Chou and Frank Chang 
>> from SiFive.
>>
>> For convenience we have created a git repo with our patches on top of 
>> a recent master. https://github.com/CodethinkLabs/qemu-ct
>>
>>      https://github.com/riscv/riscv-crypto/releases
>>
>> Thanks to those who have already reviewed:
>>
>>      Richard Henderson richard.henderson@linaro.org
>>          [PATCH v2 02/17] target/riscv: Refactor vector-vector 
>> translation macro
>>          [PATCH v2 04/17] target/riscv: Move vector translation checks
>>          [PATCH v2 05/17] target/riscv: Refactor translation of 
>> vector-widening instruction
>>          [PATCH v2 07/17] qemu/bitops.h: Limit rotate amounts
>>          [PATCH v2 08/17] qemu/host-utils.h: Add clz and ctz 
>> functions for lower-bit integers
>>          [PATCH v2 14/17] crypto: Create sm4_subword
>>      Alistair Francis alistair.francis@wdc.com
>>          [PATCH v2 02/17] target/riscv: Refactor vector-vector 
>> translation macro
>>      Philipp Tomsich philipp.tomsich@vrull.eu
>>          Various v1 reviews
>>      Christoph Müllner christoph.muellner@vrull.eu
>>          Various v1 reviews
>>
>>
>> Dickon Hood (3):
>>    target/riscv: Refactor translation of vector-widening instruction
>>    qemu/bitops.h: Limit rotate amounts
>>    target/riscv: Add Zvbb ISA extension support
>>
>> Kiran Ostrolenk (5):
>>    target/riscv: Refactor some of the generic vector functionality
>>    target/riscv: Refactor vector-vector translation macro
>>    target/riscv: Refactor some of the generic vector functionality
>>    qemu/host-utils.h: Add clz and ctz functions for lower-bit integers
>>    target/riscv: Add Zvknh ISA extension support
>>
>> Lawrence Hunter (2):
>>    target/riscv: Add Zvbc ISA extension support
>>    target/riscv: Add Zvksh ISA extension support
>>
>> Max Chou (3):
>>    crypto: Create sm4_subword
>>    crypto: Add SM4 constant parameter CK
>>    target/riscv: Add Zvksed ISA extension support
>>
>> Nazar Kazakov (6):
>>    target/riscv: Remove redundant "cpu_vl == 0" checks
>>    target/riscv: Move vector translation checks
>>    tcg: Add andcs and rotrs tcg gvec ops
>>    target/riscv: Add Zvkned ISA extension support
>>    target/riscv: Add Zvkg ISA extension support
>>    target/riscv: Expose Zvk* and Zvb[b,c] cpu properties
>>
>>   accel/tcg/tcg-runtime-gvec.c             |   11 +
>>   accel/tcg/tcg-runtime.h                  |    1 +
>>   crypto/sm4.c                             |   10 +
>>   include/crypto/sm4.h                     |    9 +
>>   include/qemu/bitops.h                    |   24 +-
>>   include/qemu/host-utils.h                |   54 ++
>>   include/tcg/tcg-op-gvec.h                |    4 +
>>   target/arm/tcg/crypto_helper.c           |   10 +-
>>   target/riscv/cpu.c                       |   39 +
>>   target/riscv/cpu.h                       |    8 +
>>   target/riscv/helper.h                    |   95 ++
>>   target/riscv/insn32.decode               |   58 ++
>>   target/riscv/insn_trans/trans_rvv.c.inc  |  174 ++--
>>   target/riscv/insn_trans/trans_rvvk.c.inc |  593 ++++++++++++
>>   target/riscv/meson.build                 |    4 +-
>>   target/riscv/op_helper.c                 |    6 +
>>   target/riscv/translate.c                 |    1 +
>>   target/riscv/vcrypto_helper.c            | 1052 ++++++++++++++++++++++
>>   target/riscv/vector_helper.c             |  243 +----
>>   target/riscv/vector_internals.c          |   81 ++
>>   target/riscv/vector_internals.h          |  228 +++++
>>   tcg/tcg-op-gvec.c                        |   23 +
>>   22 files changed, 2365 insertions(+), 363 deletions(-)
>>   create mode 100644 target/riscv/insn_trans/trans_rvvk.c.inc
>>   create mode 100644 target/riscv/vcrypto_helper.c
>>   create mode 100644 target/riscv/vector_internals.c
>>   create mode 100644 target/riscv/vector_internals.h
>>
>


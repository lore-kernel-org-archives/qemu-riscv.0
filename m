Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFNn0-0008Ch-GG
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 18:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNmx-0008AT-AH; Tue, 10 Jan 2023 18:12:15 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNmv-0006wE-9A; Tue, 10 Jan 2023 18:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zg1B3EtJUY58dvVmW5cfiUMxfR7du+pWu6Ps0f0PkMI=; b=dSlU3O8sm3+y4vZbA8X1WtVeOm
 E88KbLRzmdR39sM/x6+3pKaXwmoMYN0OAoQafJhuugh5krmr/uz8T5Z6xAyITqsOQraOM4fsawuF6
 9A4Ke1PuCR0HxUrNNvYfF9tCswekYiGiEWYrX/C7SoLeEKBZ1kDXiNlCdCLakFqUmBQULvhhpT2kk
 hYeJT+DkLz0b/y2ZO1UpvtoMWml4+A9IKVOBiNbxKk6c9ERtuSL+03b24eg2UrBTQyhaLs3zM8nor
 H44l9CSL4PPKmkbSLb/509IlXMWr97GlJQwqX85rBAByKMpDFK5SfzNevB6f9rY8qFmeajniKrdzU
 +lfFj7sdJd/SYuE+Ygv2UB0ffrnb3eQFWyxdxE106PwXmUfPxRjBxonNf9nsG1mx8339z7/eSIoDt
 kdken6INCshpczEPIJIw8YsuOMUbkhg2+/ohxM3UE/+KUaZeFL7CQRKS/RVkl5Ez8942arka0zVom
 6XUe18+dc+sZhBZ66URiv9Y0T2XySPazZRVx12VogDyWqUx63kRdWZFqEdvJS7ydUbVfblj5I8hhp
 AYBcXXKnF0KxATW5lDGfbbqBSRHbvEMYh7JH6HCcNxcrQhl049figJ4radkyGy8HxY0ZGjQFmpend
 al+1HzAqZZAHXWX/ur+CaxaW90RL8dML3/i2D4nT0=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNmW-000959-ML; Tue, 10 Jan 2023 23:11:49 +0000
Message-ID: <73231653-7149-6376-633c-c4f61e576c5b@ilande.co.uk>
Date: Tue, 10 Jan 2023 23:12:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 00/36] tcg: Support for Int128 with helpers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 10 Jan 2023 23:12:16 -0000

On 08/01/2023 02:36, Richard Henderson wrote:

> Changes for v4:
>    * About half of the v3 series has been merged,
>    * AArch64 host requires even argument register.
>    * target/{arm,ppc,s390x,i386} uses included here.
> 
> Patches requiring review:
>    01-tcg-Define-TCG_TYPE_I128-and-related-helper-macro.patch
>    02-tcg-Handle-dh_typecode_i128-with-TCG_CALL_-RET-AR.patch
>    03-tcg-Allocate-objects-contiguously-in-temp_allocat.patch
>    05-tcg-Add-TCG_CALL_-RET-ARG-_BY_REF.patch
>    07-tcg-Add-TCG_CALL_RET_BY_VEC.patch
>    08-include-qemu-int128-Use-Int128-structure-for-TCI.patch
>    09-tcg-i386-Add-TCG_TARGET_CALL_-RET-ARG-_I128.patch
>    10-tcg-tci-Fix-big-endian-return-register-ordering.patch
>    11-tcg-tci-Add-TCG_TARGET_CALL_-RET-ARG-_I128.patch
>    13-tcg-Add-temp-allocation-for-TCGv_i128.patch
>    14-tcg-Add-basic-data-movement-for-TCGv_i128.patch
>    15-tcg-Add-guest-load-store-primitives-for-TCGv_i128.patch
>    16-tcg-Add-tcg_gen_-non-atomic_cmpxchg_i128.patch
>    17-tcg-Split-out-tcg_gen_nonatomic_cmpxchg_i-32-64.patch
>    24-target-s390x-Use-a-single-return-for-helper_divs3.patch
>    31-target-s390x-Use-Int128-for-passing-float128.patch
>    32-target-s390x-Use-tcg_gen_atomic_cmpxchg_i128-for-.patch
>    33-target-s390x-Implement-CC_OP_NZ-in-gen_op_calc_cc.patch
>    34-target-i386-Split-out-gen_cmpxchg8b-gen_cmpxchg16.patch
>    35-target-i386-Inline-cmpxchg8b.patch
>    36-target-i386-Inline-cmpxchg16b.patch
> 
> 
> r~
> 
> 
> Ilya Leoshkevich (2):
>    tests/tcg/s390x: Add div.c
>    tests/tcg/s390x: Add clst.c
> 
> Richard Henderson (34):
>    tcg: Define TCG_TYPE_I128 and related helper macros
>    tcg: Handle dh_typecode_i128 with TCG_CALL_{RET,ARG}_NORMAL
>    tcg: Allocate objects contiguously in temp_allocate_frame
>    tcg: Introduce tcg_out_addi_ptr
>    tcg: Add TCG_CALL_{RET,ARG}_BY_REF
>    tcg: Introduce tcg_target_call_oarg_reg
>    tcg: Add TCG_CALL_RET_BY_VEC
>    include/qemu/int128: Use Int128 structure for TCI
>    tcg/i386: Add TCG_TARGET_CALL_{RET,ARG}_I128
>    tcg/tci: Fix big-endian return register ordering
>    tcg/tci: Add TCG_TARGET_CALL_{RET,ARG}_I128
>    tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128
>    tcg: Add temp allocation for TCGv_i128
>    tcg: Add basic data movement for TCGv_i128
>    tcg: Add guest load/store primitives for TCGv_i128
>    tcg: Add tcg_gen_{non}atomic_cmpxchg_i128
>    tcg: Split out tcg_gen_nonatomic_cmpxchg_i{32,64}
>    target/arm: Use tcg_gen_atomic_cmpxchg_i128 for STXP
>    target/arm: Use tcg_gen_atomic_cmpxchg_i128 for CASP
>    target/ppc: Use tcg_gen_atomic_cmpxchg_i128 for STQCX
>    tests/tcg/s390x: Add long-double.c
>    target/s390x: Use a single return for helper_divs32/u32
>    target/s390x: Use a single return for helper_divs64/u64
>    target/s390x: Use Int128 for return from CLST
>    target/s390x: Use Int128 for return from CKSM
>    target/s390x: Use Int128 for return from TRE
>    target/s390x: Copy wout_x1 to wout_x1_P
>    target/s390x: Use Int128 for returning float128
>    target/s390x: Use Int128 for passing float128
>    target/s390x: Use tcg_gen_atomic_cmpxchg_i128 for CDSG
>    target/s390x: Implement CC_OP_NZ in gen_op_calc_cc
>    target/i386: Split out gen_cmpxchg8b, gen_cmpxchg16b
>    target/i386: Inline cmpxchg8b
>    target/i386: Inline cmpxchg16b
> 
>   accel/tcg/tcg-runtime.h          |  11 +
>   include/exec/cpu_ldst.h          |  10 +
>   include/exec/helper-head.h       |   7 +
>   include/qemu/atomic128.h         |  29 ++-
>   include/qemu/int128.h            |  25 +-
>   include/tcg/tcg-op.h             |  15 ++
>   include/tcg/tcg.h                |  49 +++-
>   target/arm/helper-a64.h          |   8 -
>   target/i386/helper.h             |   6 -
>   target/ppc/helper.h              |   2 -
>   target/s390x/helper.h            |  54 ++---
>   tcg/aarch64/tcg-target.h         |   2 +
>   tcg/arm/tcg-target.h             |   2 +
>   tcg/i386/tcg-target.h            |  10 +
>   tcg/loongarch64/tcg-target.h     |   2 +
>   tcg/mips/tcg-target.h            |   2 +
>   tcg/riscv/tcg-target.h           |   3 +
>   tcg/s390x/tcg-target.h           |   2 +
>   tcg/sparc64/tcg-target.h         |   2 +
>   tcg/tcg-internal.h               |  17 ++
>   tcg/tci/tcg-target.h             |   3 +
>   target/s390x/tcg/insn-data.h.inc |  60 ++---
>   accel/tcg/cputlb.c               | 112 +++++++++
>   accel/tcg/user-exec.c            |  66 ++++++
>   target/arm/helper-a64.c          | 147 ------------
>   target/arm/translate-a64.c       | 121 +++++-----
>   target/i386/tcg/mem_helper.c     | 126 ----------
>   target/i386/tcg/translate.c      | 126 ++++++++--
>   target/ppc/mem_helper.c          |  44 ----
>   target/ppc/translate.c           | 102 ++++----
>   target/s390x/tcg/fpu_helper.c    | 103 ++++----
>   target/s390x/tcg/int_helper.c    |  64 ++---
>   target/s390x/tcg/mem_helper.c    |  77 +-----
>   target/s390x/tcg/translate.c     | 217 +++++++++++------
>   tcg/tcg-op.c                     | 393 ++++++++++++++++++++++++++-----
>   tcg/tcg.c                        | 303 +++++++++++++++++++++---
>   tcg/tci.c                        |  65 ++---
>   tests/tcg/s390x/clst.c           |  82 +++++++
>   tests/tcg/s390x/div.c            |  75 ++++++
>   tests/tcg/s390x/long-double.c    |  24 ++
>   util/int128.c                    |  42 ++++
>   accel/tcg/atomic_common.c.inc    |  45 ++++
>   tcg/aarch64/tcg-target.c.inc     |  17 +-
>   tcg/arm/tcg-target.c.inc         |  30 ++-
>   tcg/i386/tcg-target.c.inc        |  52 +++-
>   tcg/loongarch64/tcg-target.c.inc |  17 +-
>   tcg/mips/tcg-target.c.inc        |  17 +-
>   tcg/ppc/tcg-target.c.inc         |  20 +-
>   tcg/riscv/tcg-target.c.inc       |  17 +-
>   tcg/s390x/tcg-target.c.inc       |  16 +-
>   tcg/sparc64/tcg-target.c.inc     |  19 +-
>   tcg/tci/tcg-target.c.inc         |  27 ++-
>   tests/tcg/s390x/Makefile.target  |   3 +
>   53 files changed, 1936 insertions(+), 954 deletions(-)
>   create mode 100644 tests/tcg/s390x/clst.c
>   create mode 100644 tests/tcg/s390x/div.c
>   create mode 100644 tests/tcg/s390x/long-double.c

Now that the TCG documentation is more visible, would it be possible to add a patch 
to update the relevant parts of docs/devel/tcg-ops.rst to reflect the new Int128 support?


ATB,

Mark.


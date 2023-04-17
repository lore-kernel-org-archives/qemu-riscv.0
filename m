Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poELv-0007Wa-Tm
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 22:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poELu-0007WM-4G; Sun, 16 Apr 2023 22:12:22 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poELs-0003bs-FF; Sun, 16 Apr 2023 22:12:21 -0400
Received: by mail-ua1-x92c.google.com with SMTP id r10so7402698uat.6;
 Sun, 16 Apr 2023 19:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681697538; x=1684289538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l5X3Xs2+c8vDLuYJQj0x/0n8FiZzbPngVtMoCgqYYhw=;
 b=fr5zubLJ03HCAOp4Y/bh/CEE/HDSKgHPsxyynD+n8Tl8zvbuir0VxHw6m8x+rV+ZJw
 0QBLA/jEaBtdSpcTf8FnSSGkSEaIMU5RFobamEc2IN99G5UL7b6LGUxXNRedSgmsd8FR
 RqmSSU38G9h1ES84RNcIOUARjEGbcv4dHR6cLRoE8M4xvSn+RzdS7phYbtbKWFNfCE/T
 V/Oem9hxIILTXRjxcWB9MP87Br7khiKaI7PnWMD0dPNaKgQV2NmSrAp77z1YD7KSzc88
 473z27JlnZbvJfQyEL7+OfcgYC7YgqUapSLxO1d6nz1jI/cUoxndXPuVmD4j9mRN5aYD
 ZYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681697538; x=1684289538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l5X3Xs2+c8vDLuYJQj0x/0n8FiZzbPngVtMoCgqYYhw=;
 b=H6YJjYmQGITuMF652ouDkBkmcWekGShy4InrgWZJ/+jPjFY/I1z2s50ClZRHMybvzV
 AypnE/C7GFXzuA4IrsKQ8WDg9VG+4i4AQ2RdNpnHW9VAIrV8iH3Qs7l8hp01KuiuwYv7
 rsEkFKF73YBJUQqrVXF4zH6oTumVM4H7J9Ces6Rj/kt1w3TOIk036wv358BE0CRRh+rj
 O4Pe9Rc7dKh6NThppFy2ttibokLyWSpegPtEmS/pDbCP5aEA05dbiA2mKESBTE5ZfOQ9
 cCarNsAkt1YaD7rQnCGBbUJMs2w47GxxnjDIXARxcZdJTNu5ZU4CPZ1LCfl6QB7vohCV
 NRqA==
X-Gm-Message-State: AAQBX9dJlxV0zfho58Hy3fOZsW3FI6feEqxSgId/fN32gXKORA81pVTX
 ULYDJjdIQcAWP7GhEVl+SyWYkeJVvBD7jo+A9OI=
X-Google-Smtp-Source: AKy350YuapnEU3UtmePcJkvbEYltoa76WVUE+dM4gAeLRxXZdft+O3LlyWTrxJJQ4fBmPOYWZkg1EwQqEAU5w/1vk4Y=
X-Received: by 2002:a1f:30c1:0:b0:43b:e059:987f with SMTP id
 w184-20020a1f30c1000000b0043be059987fmr6317968vkw.0.1681697538099; Sun, 16
 Apr 2023 19:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230412114333.118895-1-richard.henderson@linaro.org>
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 12:11:52 +1000
Message-ID: <CAKmqyKOCnhveGeEZ-T35_mVaJaaGs2d-VnY9QGV7uab1ThpkYw@mail.gmail.com>
Subject: Re: [PATCH v7 00/25] target/riscv: MSTATUS_SUM + cleanups
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 17 Apr 2023 02:12:22 -0000

On Wed, Apr 12, 2023 at 9:43=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> v6: 20230325105429.1142530-1-richard.henderson@linaro.org
>
> Changes for v7:
>   * Rebase on Alistair's riscv-to-apply.next.
>   * Replace priv_level() with ctx->priv in trans_xthead.c.inc (Zhiwei).
>
>
> r~
>
>
> Fei Wu (2):
>   target/riscv: Separate priv from mmu_idx
>   target/riscv: Reduce overhead of MSTATUS_SUM change
>
> LIU Zhiwei (4):
>   target/riscv: Extract virt enabled state from tb flags
>   target/riscv: Add a general status enum for extensions
>   target/riscv: Encode the FS and VS on a normal way for tb flags
>   target/riscv: Add a tb flags field for vstart
>
> Richard Henderson (19):
>   target/riscv: Remove mstatus_hs_{fs, vs} from tb_flags
>   accel/tcg: Add cpu_ld*_code_mmu
>   target/riscv: Use cpu_ld*_code_mmu for HLVX
>   target/riscv: Handle HLV, HSV via helpers
>   target/riscv: Rename MMU_HYP_ACCESS_BIT to MMU_2STAGE_BIT
>   target/riscv: Introduce mmuidx_sum
>   target/riscv: Introduce mmuidx_priv
>   target/riscv: Introduce mmuidx_2stage
>   target/riscv: Move hstatus.spvp check to check_access_hlsv
>   target/riscv: Set MMU_2STAGE_BIT in riscv_cpu_mmu_index
>   target/riscv: Check SUM in the correct register
>   target/riscv: Hoist second stage mode change to callers
>   target/riscv: Hoist pbmte and hade out of the level loop
>   target/riscv: Move leaf pte processing out of level loop
>   target/riscv: Suppress pte update with is_debug
>   target/riscv: Don't modify SUM with is_debug
>   target/riscv: Merge checks for reserved pte flags
>   target/riscv: Reorg access check in get_physical_address
>   target/riscv: Reorg sum check in get_physical_address

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  include/exec/cpu_ldst.h                       |   9 +
>  target/riscv/cpu.h                            |  47 +-
>  target/riscv/cpu_bits.h                       |  12 +-
>  target/riscv/helper.h                         |  12 +-
>  target/riscv/internals.h                      |  35 ++
>  accel/tcg/cputlb.c                            |  48 +++
>  accel/tcg/user-exec.c                         |  58 +++
>  target/riscv/cpu.c                            |   2 +-
>  target/riscv/cpu_helper.c                     | 403 +++++++++---------
>  target/riscv/csr.c                            |  21 +-
>  target/riscv/op_helper.c                      | 113 ++++-
>  target/riscv/translate.c                      |  70 +--
>  .../riscv/insn_trans/trans_privileged.c.inc   |   2 +-
>  target/riscv/insn_trans/trans_rvf.c.inc       |   2 +-
>  target/riscv/insn_trans/trans_rvh.c.inc       | 137 +++---
>  target/riscv/insn_trans/trans_rvv.c.inc       |  22 +-
>  target/riscv/insn_trans/trans_xthead.c.inc    |  14 +-
>  17 files changed, 591 insertions(+), 416 deletions(-)
>
> --
> 2.34.1
>


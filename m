Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md9Na-00051r-K1
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 07:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1md9NX-0004tM-W4; Wed, 20 Oct 2021 07:03:28 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1md9NW-000120-4z; Wed, 20 Oct 2021 07:03:27 -0400
Received: by mail-io1-xd2a.google.com with SMTP id b188so19142082iof.8;
 Wed, 20 Oct 2021 04:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n4NsRNcTNd9QBFN0dr19wdrKyZyK3JwHGajMjGiM41Y=;
 b=Q9pgz1I4H6dnCq/Naiz7k2jMP+ux5BPq6yBgM0K2IClrXcm12peGhFSRYFG2KFPJGj
 CaBq1QLkR3GRCu9lgdtOI2owvDQd3C1U9E7cjrr0ymZadQ1JO0YKZ37fgMKkL2RR8VmU
 admAM4B0REaSzqsXmPRmCXEoybYEwkf5KiPFB8LC4gcDTmwthBOEDjBn9WWjjCTAjQc0
 27Gt4dgB8IYer8lLsl+otGYUj+zGjFc2uwozMrEzgXVQ9FGiBXUoP0lsXJFrk5H1bRwE
 RizLcv2QLWN91Oh35jjIHXhy4tqyWg+LYkLNf1FfrVVJ+XrtwkCT+dBDu4py280vJFpO
 MqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n4NsRNcTNd9QBFN0dr19wdrKyZyK3JwHGajMjGiM41Y=;
 b=d4HwCaT8tFvgqHVONhALmzTjA0SJrlkUsQoiK8e/Cf14BE0CGzkSe+KLc3+yqSDXkk
 RlfZ6pGp65YtJ3ivTdO+vWoGIXye11sPDwbfffzZuQUjqCl8X0e5fbAW/d0lb1knrt5R
 oxBqhivNyJ9EwXNYPxboQ7WZrw3fglbAYBWhog7CEx02DVsRwp4CGHgq6ljCq4PyV53k
 +GZLNlXB7hr4Ws71KGhFkOAgEWdhBZJxd18buiBKb72+Dt7hRXnHzV5btSGNVD34ct2u
 e0M5NP4omB4w1icxSfp8brtrgg5egKZh5wj3aLxXlf2eOCm8Q8E0KmnsSkyGBvavqE/P
 dNLQ==
X-Gm-Message-State: AOAM532m8xyiWV9Dtj+cvS1b3TfWaBPpuAiHGz2K1eqQmgcXXxk+aqIw
 uJ1FVCbqfDlmf+gA30++vc8NyZVdUdCM+0wjUqY=
X-Google-Smtp-Source: ABdhPJztV50xaOh2eg6eKeChjMZ3c3wA8Tn4t9j71RqnBkhA3tsSLaGxBrbiPV0e3E7P3lAEZKEB674giCCjQJEWyQ4=
X-Received: by 2002:a05:6638:32a6:: with SMTP id
 f38mr7999679jav.63.1634727804702; 
 Wed, 20 Oct 2021 04:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211020031709.359469-1-richard.henderson@linaro.org>
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Oct 2021 21:02:58 +1000
Message-ID: <CAKmqyKN8TxxtaCg06q7jLvmO_22jNfaOZuWKFxMbpO4tnXfE0Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] target/riscv: Rationalize XLEN and operand length
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Oct 2021 11:03:28 -0000

On Wed, Oct 20, 2021 at 1:26 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a partial patch set attempting to set things in the
> right direction for both the UXL and RV128 patch sets.
>
>
> r~
>
>
> Changes for v6:
>   * Rebase on riscv-to-apply.next.
>
> Changes for v5:
>   * Fix cpu_dump, which asserted for -accel qtest.
>     Instead of filtering CSRs explicitly in cpu_dump,
>     let the riscv_csr_operations predicate do the job.
>     This means we won't dump S-mode registers when RVS
>     is not enabled, much like we currently filter on RVH.
>
> Changes for v4:
>   * Use riscv_csrrw_debug for cpu_dump.
>     This fixes the issue that Alistair pointed out wrt the
>     MSTATUS.SD bit not being correct in the dump; note that
>     gdbstub already uses riscv_csrrw_debug, and so did not
>     have a problem.
>   * Align the registers in cpu_dump.
>
> Changes for v3:
>   * Fix CONFIG_ typo.
>   * Fix ctzw typo.
>   * Mark get_xlen unused (clang werror)
>   * Compute MSTATUS_SD on demand.
>
> Changes for v2:
>   * Set mxl/sxl/uxl at reset.
>   * Set sxl/uxl in write_mstatus.
>
>
> Richard Henderson (15):
>   target/riscv: Move cpu_get_tb_cpu_state out of line
>   target/riscv: Create RISCVMXL enumeration
>   target/riscv: Split misa.mxl and misa.ext
>   target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl
>   target/riscv: Add MXL/SXL/UXL to TB_FLAGS
>   target/riscv: Use REQUIRE_64BIT in amo_check64
>   target/riscv: Properly check SEW in amo_op
>   target/riscv: Replace is_32bit with get_xl/get_xlen
>   target/riscv: Replace DisasContext.w with DisasContext.ol
>   target/riscv: Use gen_arith_per_ol for RVM
>   target/riscv: Adjust trans_rev8_32 for riscv64
>   target/riscv: Use gen_unary_per_ol for RVB
>   target/riscv: Use gen_shift*_per_ol for RVB, RVI
>   target/riscv: Use riscv_csrrw_debug for cpu_dump
>   target/riscv: Compute mstatus.sd on demand

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h                      |  73 +++------
>  target/riscv/cpu_bits.h                 |   8 +-
>  hw/riscv/boot.c                         |   2 +-
>  linux-user/elfload.c                    |   2 +-
>  linux-user/riscv/cpu_loop.c             |   2 +-
>  semihosting/arm-compat-semi.c           |   2 +-
>  target/riscv/cpu.c                      | 195 +++++++++++++-----------
>  target/riscv/cpu_helper.c               |  92 ++++++++++-
>  target/riscv/csr.c                      | 104 ++++++++-----
>  target/riscv/gdbstub.c                  |  10 +-
>  target/riscv/machine.c                  |  10 +-
>  target/riscv/monitor.c                  |   4 +-
>  target/riscv/translate.c                | 174 +++++++++++++++------
>  target/riscv/insn_trans/trans_rvb.c.inc | 140 +++++++++--------
>  target/riscv/insn_trans/trans_rvi.c.inc |  44 +++---
>  target/riscv/insn_trans/trans_rvm.c.inc |  36 ++++-
>  target/riscv/insn_trans/trans_rvv.c.inc |  29 ++--
>  17 files changed, 576 insertions(+), 351 deletions(-)
>
> --
> 2.25.1
>
>


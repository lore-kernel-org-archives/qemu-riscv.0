Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAhPT-0005fG-4M
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 19:04:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhPR-0005cV-5F; Thu, 20 Jan 2022 19:04:05 -0500
Received: from [2607:f8b0:4864:20::d30] (port=35331
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhPO-00012P-SO; Thu, 20 Jan 2022 19:04:04 -0500
Received: by mail-io1-xd30.google.com with SMTP id p7so8983641iod.2;
 Thu, 20 Jan 2022 16:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cybhzHD7y3vE4+KzdrnmjtyKsz8VQiCYwtF3PshR8j8=;
 b=n4KEudS/4WR+/w3oxda9/6VwSCmrl49S8jg2Qct5SNj0jGX6yTZkGYYaO8unAHV5ch
 K40kkBOC1V0+6NZGIvKZ4loMAWhBPykKXb2WFsRNMigYRZnFQZr/UbaKKuypwTsqxW4D
 oi1qHyV3qqeVBvHQwY6XL5iFJfrIAzczjs0HRtoMS8EkgMW/ZKZxt2l0qIlGmdgI3dKS
 xaYw/FR+0JHSz5hTEPR/DaLFEBwqePLHGY65gH3eyrEghHbs1LiH7F1RKRx6YEtOHOoX
 MF7lO5wR7co1oogNj+y5f03ly4jqW7L5e7hOHoZvMnRWaT7Igabtg7UV3CydscKhrc8f
 AHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cybhzHD7y3vE4+KzdrnmjtyKsz8VQiCYwtF3PshR8j8=;
 b=nL5vG2qd2fFZynOs/tEk/+PGiCGfpQOLDNbqfbJpG308JW7YUtdO5vORQR7rHFelnM
 SJagRdosMExM0pWNhhZAT/d67YV0OUaIvDMoagI/fXNgwusN+RTX8oiV9Zb5TUI/UHi5
 iwCBNczI0SMsRa1ywm90P5QXRgLcEdq9uYlfBPHmafjLzFw/1BzXjD4nUPVHgkVPDEdA
 tLu0pytwd/LqyjbgGArgFfYTzS/aj01lyhL4xKUmO0dY0vaoz5gGUL/Hc7ePqoQt/z7B
 w1hRF65K+AAYC1fxgW5oVuuDAuJUrdDMkEhBgV66AjwKa+yvXQP5gHv0X5Sk4Rp++iAx
 Z3vQ==
X-Gm-Message-State: AOAM533iL1IGf1KeflRARqN0uP/TY1TSNVBqnYT7//RsGBFTWnwSXbrJ
 Opo2QiSbEdMPtuGUcYvzR3xlwP0eX05mIUR4iUw=
X-Google-Smtp-Source: ABdhPJzfYBqmdjNJJTO0h1TTbMSwA7IMMV6o9nS2j9RqCZ5fuI4ji1HRRl0tzhDH9jpq4PRbG5LZbYhkjXFn31NE5VA=
X-Received: by 2002:a02:a403:: with SMTP id c3mr593991jal.318.1642723441187;
 Thu, 20 Jan 2022 16:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Jan 2022 10:03:34 +1000
Message-ID: <CAKmqyKN-QptM5sxdm6bDuBCEPKDh2OyS9x3pqqjYiM4deayh8Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/23] Support UXL filed in xstatus
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 guoren@linux.alibaba.com, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 21 Jan 2022 00:04:05 -0000

On Fri, Jan 21, 2022 at 1:51 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> In this patch set, we process the pc reigsters writes,
> gdb reads and writes, and address calculation under
> different UXLEN settings.
>
> The patch set v8 has been tested by running rv64 Linux with
> rv32 rootfs in compat mode. You can almost follow the test [1]
> given by GuoRen, except using the branch riscv-upstream-uxl-v8
> on my QEMU repo [2].
>
> [1] https://lore.kernel.org/linux-arm-kernel/20211228143958.3409187-17-guoren@kernel.org/t/
> [2] https://github.com/romanheros/qemu.git
>
> Except patch 22 is new, the other patches have been reviewed or acked.
>
> v8:
>   Set default XLEN for hypervisor vsstatus and mstatus_hs
>
> v7:
>   Rebase to Alistair riscv_to_apply.next branch
>   Add commit message for create xl field in CPURISCVState
>
> v6:
>   Pass boot 32bit rootfs on compat Linux
>   Pass test cases on compat OpenTee
>   Fix csr write mask
>   Fix WARL for uxl
>   Fix sstatus read for uxl
>   Relax UXL field for debugging
>   Don't bump machine state version for xl
>   Rename cpu_get_xl to cpu_recompute_xl
>   Rebase to vector v1.0
>   Rebase to 128 bit cpu
>
> v5:
>   Add xl field in env to clear up redundant riscv_cpu_xl
>   Adjust pmpcfg access with mxl
>   Select gdb core xml according to mxl
>
> v4:
>   Support SSTATUS64_UXL write
>   Bump vmstate version for vill split
>
> v3:
>   Merge gen_pm_adjust_address into a canonical address function
>   Adjust address for RVA with XLEN
>   Split pm_enabled into pm_mask_enabled and pm_base_enabled
>   Replace array of pm tcg globals with one scalar tcg global
>   Split and change patch sequence
>
> v2:
>   Split out vill from vtype
>   Remove context switch when xlen changes at exception
>   Use XL instead of OL in many places
>   Use pointer masking and XLEN for vector address
>   Define an common fuction to calculate address for ld
>
> LIU Zhiwei (23):
>   target/riscv: Adjust pmpcfg access with mxl
>   target/riscv: Don't save pc when exception return
>   target/riscv: Sign extend link reg for jal and jalr
>   target/riscv: Sign extend pc for different XLEN
>   target/riscv: Create xl field in env
>   target/riscv: Ignore the pc bits above XLEN
>   target/riscv: Extend pc for runtime pc write
>   target/riscv: Use gdb xml according to max mxlen
>   target/riscv: Relax debug check for pm write
>   target/riscv: Adjust csr write mask with XLEN
>   target/riscv: Create current pm fields in env
>   target/riscv: Alloc tcg global for cur_pm[mask|base]
>   target/riscv: Calculate address according to XLEN
>   target/riscv: Split pm_enabled into mask and base
>   target/riscv: Split out the vill from vtype
>   target/riscv: Adjust vsetvl according to XLEN
>   target/riscv: Remove VILL field in VTYPE
>   target/riscv: Fix check range for first fault only
>   target/riscv: Adjust vector address with mask
>   target/riscv: Adjust scalar reg in vector with XLEN
>   target/riscv: Set default XLEN for hypervisor
>   target/riscv: Enable uxl field write
>   target/riscv: Relax UXL field for debugging

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c                            | 42 +++++++--
>  target/riscv/cpu.h                            | 45 ++++++++-
>  target/riscv/cpu_bits.h                       |  3 +
>  target/riscv/cpu_helper.c                     | 94 +++++++++----------
>  target/riscv/csr.c                            | 84 +++++++++++++++--
>  target/riscv/gdbstub.c                        | 71 ++++++++++----
>  target/riscv/helper.h                         |  4 +-
>  .../riscv/insn_trans/trans_privileged.c.inc   |  9 +-
>  target/riscv/insn_trans/trans_rva.c.inc       |  9 +-
>  target/riscv/insn_trans/trans_rvd.c.inc       | 19 +---
>  target/riscv/insn_trans/trans_rvf.c.inc       | 19 +---
>  target/riscv/insn_trans/trans_rvi.c.inc       | 39 +++-----
>  target/riscv/insn_trans/trans_rvv.c.inc       |  6 +-
>  target/riscv/machine.c                        | 16 +++-
>  target/riscv/op_helper.c                      |  7 +-
>  target/riscv/pmp.c                            | 12 +--
>  target/riscv/translate.c                      | 90 +++++++++---------
>  target/riscv/vector_helper.c                  | 39 +++++---
>  18 files changed, 377 insertions(+), 231 deletions(-)
>
> --
> 2.25.1
>
>


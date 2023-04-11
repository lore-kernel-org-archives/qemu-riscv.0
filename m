Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm6j0-0001TL-Sk
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 01:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm6iy-0001T0-A3; Tue, 11 Apr 2023 01:39:24 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm6iw-0000EA-I0; Tue, 11 Apr 2023 01:39:23 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id y13so6565056vss.0;
 Mon, 10 Apr 2023 22:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681191561; x=1683783561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSUPXq3QnQiWhCYYAYAM5q3/c0Y8fZ0BfO1FXmWb5MQ=;
 b=oWPBFNPOQsZyG3KmCahtit79BfMWYxF/v3t62b0SJaQZwONCQstPPsYKAP5pY/Bg79
 lD9Nb0USVCD8MGpzomCOUhwfj6hkyFV+zh9H5qNI/nWY6NdzHuZ8LN98hbs+4UTJY/nU
 9w3TCRl5O4XycLfAfIjmXUCyUJqqm9W9bVbvPS/FXPI9F13Pb4oWAigPNvbj1a5io+B8
 aQ8mjx7fmwP65qnHRXT2qb1Lht0g5dKXaQIt0gUN6MLXZtIgo8sNHokD7x+DAWboyjJh
 gYo1+0/utE4S9uW9fSVetpFa9Kp2VST8kRdD2656OI48350D6rm4phI7blF6CThBvG6q
 n0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681191561; x=1683783561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSUPXq3QnQiWhCYYAYAM5q3/c0Y8fZ0BfO1FXmWb5MQ=;
 b=aaoXYD1le8D5cITI+rh+DWpXp1cPvfkPiuDLOhSrUJSgo801RJV4jg07QcL5dBypnw
 V9+7RjE/LEiZ6yQsjzSyokJ53AJ3ZMiocjITCVEkajFPERuRJAdJBHAV0GMSh/zbmEXm
 jZO6N/fVwwh3/l9bJT/yFWEU0bt3UnXMgb8kWrB8j9+Fp5nMOrmyjBhkgggBmoDfD7pX
 /uA2+Zi4f4R8otYYyUoDSTay7WmiogB00lSC4fgPX7HylWZAiSUf9x2HWGPFPM4BmKf0
 mKr/ArHN3UM0rLNKiIqgTnrAF2DW8czsjurJGIaZ2qjPSLgNsjfYVOZXWE/+IPUFZ5cX
 G1YA==
X-Gm-Message-State: AAQBX9fT/rIBeUkVUmhyIM66uhnNizYxfA6AeB6KXSorq78owBtVgWs0
 SMBfIOr+Z1yN52+zpejClRIUh2NA8EV8gIy+Ad8=
X-Google-Smtp-Source: AKy350Y/DZNy18IP96Z+CiSMV5K517bkrmACrr+ux50TY7w5x2daIleNuk3UONqVMTTMsmLJdsx/yNOUdOrCqcSrJa4=
X-Received: by 2002:a67:d39d:0:b0:42a:eb6:6c51 with SMTP id
 b29-20020a67d39d000000b0042a0eb66c51mr1110388vsj.3.1681191560946; Mon, 10 Apr
 2023 22:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 15:38:54 +1000
Message-ID: <CAKmqyKPHF_qKa-RSTjC3q8xmJfX2gbDER2dP69z5xBLOfpXa7Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/25] target/riscv: MSTATUS_SUM + cleanups
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 05:39:25 -0000

On Sat, Mar 25, 2023 at 9:58=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This builds on Fei and Zhiwei's SUM and TB_FLAGS changes.
>
>   * Reclaim 5 TB_FLAGS bits, since we nearly ran out.
>
>   * Using cpu_mmu_index(env, true) is insufficient to implement
>     HLVX properly.  While that chooses the correct mmu_idx, it
>     does not perform the read with execute permission.
>     I add a new tcg interface to perform a read-for-execute with
>     an arbitrary mmu_idx.  This is still not 100% compliant, but
>     it's closer.
>
>   * Handle mstatus.MPV in cpu_mmu_index.
>   * Use vsstatus.SUM when required for MMUIdx_S_SUM.
>   * Cleanups for get_physical_address.
>
> While this passes check-avocado, I'm sure that's insufficient.
> Please have a close look.
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
>   target/riscv: Remove mstatus_hs_{fs,vs} from tb_flags
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

Thanks for the patches!

This has been reviewed and tested. Do you mind sending a v7 rebased on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next?

Alistair

>
>  include/exec/cpu_ldst.h                       |   9 +
>  target/riscv/cpu.h                            |  47 ++-
>  target/riscv/cpu_bits.h                       |  12 +-
>  target/riscv/helper.h                         |  12 +-
>  target/riscv/internals.h                      |  35 ++
>  accel/tcg/cputlb.c                            |  48 +++
>  accel/tcg/user-exec.c                         |  58 +++
>  target/riscv/cpu.c                            |   2 +-
>  target/riscv/cpu_helper.c                     | 393 +++++++++---------
>  target/riscv/csr.c                            |  21 +-
>  target/riscv/op_helper.c                      | 113 ++++-
>  target/riscv/translate.c                      |  72 ++--
>  .../riscv/insn_trans/trans_privileged.c.inc   |   2 +-
>  target/riscv/insn_trans/trans_rvf.c.inc       |   2 +-
>  target/riscv/insn_trans/trans_rvh.c.inc       | 135 +++---
>  target/riscv/insn_trans/trans_rvv.c.inc       |  22 +-
>  target/riscv/insn_trans/trans_xthead.c.inc    |   7 +-
>  17 files changed, 595 insertions(+), 395 deletions(-)
>
> --
> 2.34.1
>
>


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvjj-00040I-VD
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvji-0003vx-Jy; Wed, 05 Apr 2023 01:31:10 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvjd-0006QU-7a; Wed, 05 Apr 2023 01:31:10 -0400
Received: by mail-ua1-x92f.google.com with SMTP id r7so24844277uaj.2;
 Tue, 04 Apr 2023 22:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680672663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yiJ/TGm51DVYlm0ESrmKrf5lNFJ64XBOiiRT8h1x1iI=;
 b=O9fwXw/98qr98QCd3bHKJI1qbHbwVBjkLQc4FAPtlfk4HRd5pD4mCJCTaDkkMGEj3n
 kpZu/jqJzhoT1HWgaZfisWYSMa1pOkcevC/azvUxcNaGe4WFfRmZj+u56bmzun8XIRSS
 /9N7/s4hzxRdoTOkTrRrBXlEb4zShfxUkU8vuZoAHyUaHPUSD5gXey3R8JLqbo5Gpq/h
 R/dhGgMufH6rj27JaqyUUihVmRP7zoS+Ml6Xab8WKIL6gRLc/qoNZeTP8AsHJ0Zkx+Yv
 d0L1+C2V5uhZHwLqpzGY/nmv/IfqUXSm95GT0oxkzhEa97qbbGAf4XkKSkP+1LkrHyAb
 YMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680672663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yiJ/TGm51DVYlm0ESrmKrf5lNFJ64XBOiiRT8h1x1iI=;
 b=jvj9d9wWwKRuPtM8Ilo5U0Dem8nGtacQDRxnkmlZq0Wnin2VbfA63+sUf90dLlmF3o
 NO7Hmb2jsvj4wyjqXe0MhsIpG2V5kDS/RbJZHI7xoNyr2LpwBSBM7DMdhRrEVhQpLL+/
 d+NVta1B1M0m+8T0hHH7yHKyP8zT2A723dziUqQBft/OXpNuEfdKF31ZujjvMze6I7rQ
 NX9ZUEMcdYjGMsOSgEM1ge3WNv8qgWWluecmn1w4GIyBAv/VI+cAwqL3A81RNicnZaAg
 9le6C64h8tIH6oR4XiE4AywKM/++ICneHgwwZEwp4Q3dse/qlU++EZ4OxodTTLKLViju
 qKog==
X-Gm-Message-State: AAQBX9dwUjRXv85hN7TabVfht6e8NT5fqMmsMBXEf6Dvo5qaoFmUcjfY
 g2KBv8eI+RTwFUr6ULbwqUnNmSFrk6APqm/pcfrI3BU56Ew=
X-Google-Smtp-Source: AKy350bAMkgl1s/vQ/Wi+/LyaCXgrjx2zBSFU59EJCt3yzer4BQG2zXLsY/In9jpQqOBUPh+xR2nSKthkklGQf2hz/4=
X-Received: by 2002:a1f:ad0b:0:b0:43c:6481:2b50 with SMTP id
 w11-20020a1fad0b000000b0043c64812b50mr3896722vke.0.1680672663708; Tue, 04 Apr
 2023 22:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:30:37 +1000
Message-ID: <CAKmqyKO_=DnwmU5szGASkQf_GdZLW+GDd=+qgpW_KsB3bjt0Aw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] target/riscv: Simplification for RVH related
 check and code style fix
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:31:11 -0000

On Mon, Mar 27, 2023 at 6:11=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> This patchset tries to simplify the RVH related check and fix some code s=
tyle problems, such as problems for indentation, multi-line comments and li=
nes with over 80 characters.
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-virtfix-upstream
>
> v2:
> * add comment to specify riscv_cpu_set_virt_enabled() can only be called =
when RVH is enabled in patch 4 (suggested by Richard Henderson)
> * merge patch from LIU Zhiwei(Message-ID: <20230325145348.1208-1-zhiwei_l=
iu@linux.alibaba.com>) to patch 5
> * use env->virt_enabled directly instead of riscv_cpu_virt_enabled() in p=
atch 6 (suggested by LIU Zhiwei)
> * remain the orginal identation for macro name in patch 8 (suggested by L=
IU Zhiwei)
>
> LIU Zhiwei (1):
>   target/riscv: Convert env->virt to a bool env->virt_enabled
>
> Weiwei Li (9):
>   target/riscv: Remove redundant call to riscv_cpu_virt_enabled
>   target/riscv: Remove redundant check on RVH
>   target/riscv: Remove check on RVH for riscv_cpu_virt_enabled
>   target/riscv: Remove check on RVH for riscv_cpu_set_virt_enabled
>   target/riscv: Remove riscv_cpu_virt_enabled()
>   target/riscv: Remove redundant parentheses
>   target/riscv: Fix format for indentation
>   target/riscv: Fix format for comments
>   target/riscv: Fix lines with over 80 characters

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/arch_dump.c                |   7 +-
>  target/riscv/cpu.c                      |   8 +-
>  target/riscv/cpu.h                      |  29 +--
>  target/riscv/cpu_bits.h                 |   5 +-
>  target/riscv/cpu_helper.c               | 142 ++++++------
>  target/riscv/csr.c                      |  52 ++---
>  target/riscv/debug.c                    |  10 +-
>  target/riscv/insn_trans/trans_rvv.c.inc |  36 +--
>  target/riscv/machine.c                  |   6 +-
>  target/riscv/op_helper.c                |  21 +-
>  target/riscv/pmp.c                      |  48 ++--
>  target/riscv/pmp.h                      |   9 +-
>  target/riscv/pmu.c                      |   7 +-
>  target/riscv/sbi_ecall_interface.h      |   8 +-
>  target/riscv/translate.c                |  14 +-
>  target/riscv/vector_helper.c            | 292 ++++++++++++++----------
>  16 files changed, 378 insertions(+), 316 deletions(-)
>
> --
> 2.25.1
>
>


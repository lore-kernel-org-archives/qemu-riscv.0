Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kWyIH-0001Xb-Nm
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 04:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIF-0001W4-Tt; Mon, 26 Oct 2020 04:55:55 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:33822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIE-0005XW-7t; Mon, 26 Oct 2020 04:55:55 -0400
Received: by mail-yb1-xb41.google.com with SMTP id o70so7011579ybc.1;
 Mon, 26 Oct 2020 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PqD5rL0+SXSsSU1Qx2tFHM/n3e5AcxAZZyLeFT/9anc=;
 b=IJlTb3+iGhFHmNJjrHCNW8jS516atKPMHKsaKOeyDSLqW3+VAGihx4TC7G+jG0X7Xf
 to+4y3beAl0CLbqoveBu2m13FtvZCOUDQZfks8zop8a+uL5QLOKOD+RiCF3b2EmMeQOn
 Nf03VubI0I1DSfC0ob8nFMqOUwjamEHl8kkN2y4jvYWnpp2gTEFcY14V2UyicsMxydHq
 Su7d3mSWDsIG2xN+TK45xwM8JyLGwyvg4Zu3B4EnWdYHsfrWhteDlJlCr2yrmTm7aYp8
 bQt5P7MNgFmkE5gwKoNRACHFt4WqAaN23ZyXdEwU4B+aC+pidvAwfHHVg2+ImJU21c5R
 /dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PqD5rL0+SXSsSU1Qx2tFHM/n3e5AcxAZZyLeFT/9anc=;
 b=sjeZCw5VRiO2z+RWHpnqGsdmgQHvpuXl1qB2Tfz86JjhN/lcxJl8TKrjw2Icvlabab
 LhbAlx0xhkNoOX/zu4DeJrH344CRCKSK5yoD5kZ8IjNtcmeGnpZnAuQrFLOgp5vUAWU1
 alPwNUyMN+Fzl08cFLHjxBOp73jNZ10Ypx3QJXpTVmUDskp4gHtEaiEwxeI0xLtZc3BK
 y+JXuPbGPdbGAI0McWdTYWsAOFfnhNAQ3FzDTWIpfflKDiLo1YklEAVPOwh/mIqyMcKY
 ZofLBhuBfwZ5L162oyFSLrZsS1nRVTW6RZPqJFbHLV5tZ6FjCWK/toZJHznIfwO+azyD
 O3+Q==
X-Gm-Message-State: AOAM532SUpQB5vSckGU/Z2T57lcq8BrOXx/Yv49BErNpPYsBT6w2XHa2
 wip/zkllDS7ZE2LTwfeOkl4wObauAdq4oaItl2s=
X-Google-Smtp-Source: ABdhPJz9pSu06JbU4/MQcRj1hNjeE9Ozn4j3Gnu/dhs5r1Yv8L1mbhlkPexvrjp4WJWy75fDXKxT2jVtN4H5XNqDM2Q=
X-Received: by 2002:a25:328a:: with SMTP id
 y132mr18121224yby.306.1603702552683; 
 Mon, 26 Oct 2020 01:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603467169.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1603467169.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 26 Oct 2020 16:55:41 +0800
Message-ID: <CAEUhbmUYkst2AL6cfiffJSr1T23VJyJsaqFBZe+UzDHreCqNpQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/16] RISC-V: Start to remove xlen preprocess
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 26 Oct 2020 08:55:56 -0000

Hi Alistair,

On Fri, Oct 23, 2020 at 11:44 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The RISC-V QEMU port currently has lot of preprocessor directives that
> check if we are targetting a 32-bit or 64-bit CPU. This means that the
> 64-bit RISC-V target can not run 32-bit CPUs. This is different to most
> other QEMU architectures and doesn't allow us to mix xlens (such as when
> running Hypervisors with different xlen guests).
>
> This series is a step toward removing some of those to allow us to use
> 32-bit CPUs on 64-bit RISC-V targets.
>
> Alistair Francis (16):
>   target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
>   riscv: spike: Remove target macro conditionals
>   riscv: virt: Remove target macro conditionals
>   hw/riscv: boot: Remove compile time XLEN checks
>   hw/riscv: virt: Remove compile time XLEN checks
>   hw/riscv: spike: Remove compile time XLEN checks
>   hw/riscv: sifive_u: Remove compile time XLEN checks
>   target/riscv: fpu_helper: Match function defs in HELPER macros
>   target/riscv: Add a riscv_cpu_is_32bit() helper function
>   target/riscv: Specify the XLEN for CPUs
>   target/riscv: cpu: Remove compile time XLEN checks
>   target/riscv: cpu_helper: Remove compile time XLEN checks
>   target/riscv: csr: Remove compile time XLEN checks
>   target/riscv: cpu: Set XLEN independently from target
>   target/riscv: Convert the get/set_field() to support 64-bit values
>   target/riscv: Consolidate *statush registers
>
>  include/hw/riscv/boot.h   |   8 +-
>  include/hw/riscv/spike.h  |   6 --
>  include/hw/riscv/virt.h   |   6 --
>  target/riscv/cpu.h        |  36 ++++---
>  target/riscv/cpu_bits.h   |  24 ++---
>  hw/riscv/boot.c           |  55 ++++++-----
>  hw/riscv/sifive_u.c       |  59 ++++++------
>  hw/riscv/spike.c          |  50 +++++-----
>  hw/riscv/virt.c           |  36 +++----
>  target/riscv/cpu.c        |  83 ++++++++++------
>  target/riscv/cpu_helper.c |  47 +++------
>  target/riscv/csr.c        | 197 ++++++++++++++++++++------------------
>  target/riscv/fpu_helper.c |  16 ++--
>  target/riscv/op_helper.c  |  11 +--
>  14 files changed, 328 insertions(+), 306 deletions(-)

Test result:

64-bit virt & sifive_u, boots OpenSBI and kernel.
32-bit virt boots OpenSBI and kernel. 32-bit sifive_u does not boot OpenSBI.

Regards,
Bin


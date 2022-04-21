Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhLto-0006Wo-Ta
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 21:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhLtn-0006TE-Au; Wed, 20 Apr 2022 21:46:23 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:39651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhLtl-0001Dd-MO; Wed, 20 Apr 2022 21:46:23 -0400
Received: by mail-il1-x12d.google.com with SMTP id d4so2166547iln.6;
 Wed, 20 Apr 2022 18:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XXvAEIye0dgruyGoqKPQ9T2F17D+P9AOpRLv+rmvaZg=;
 b=JJXiP6pQLSAwVoIpgqdZ+Eniy1v2LaBNT1Eqily4RGCbkf3WSr/0DAAXFme5NAWXJQ
 9XyYc/hvdZv1t7s6Y+9OKcIEYaUsJ8CYms7w4izLFCtmVS/wUWCYo4z6rZ8X6NWJTauz
 5x+3OWhvBGYkL0GooqLn4RPDXo/gR/rg1a4r5L/Mtv4A389Pe87t9LZm9VN+5L3pCQYf
 XD4ivyXRILXQsoLnpSn38DRBCRYsW5KJJDwMQFHZCmwm5pDbQNlf/BjxgA61JjNaLXhH
 KW8J/nmN+Px1EMrut4+1WdTVLVMdx0uIQg3sBhBgfyavNsAIrspuOgGiLxf1F2VgTwvv
 waaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XXvAEIye0dgruyGoqKPQ9T2F17D+P9AOpRLv+rmvaZg=;
 b=gzmMi33zfd/jAUziMwpi5m2mmH/4Rf5L9hAhYcnmv2z6wD0IDi3yFpJgCk+uadVZSh
 kiWUfRyRUUbONn9e0aOwh0N+9RsWwmhF+f5ocHmtAarEaM44ylKMMFttRMDhIOzaQrFc
 YVz3S7h7v+Vy6/RVW7E+j1SvGpNUk21rnWx1163qNC4czDLpNGHtpcs5LdH6zkE/itWL
 6pgqtly3Mco20jvli7GNiRyw8W2521BK2sdak55Z4X+FRPjt1wSH33EUmMKdZTnuJ1yW
 WD0PMjkrPu72b/pplGHNKAvaSCQsRPEDnofbliMFIzHQBCW2JR9vw/dogB8XijjTeYUp
 ZB3w==
X-Gm-Message-State: AOAM531qEpjhHDDXvZdE3jTLo94L5mxvfFgA02TUQxkMA5zJVTFfBpTh
 1SyCbSvCu90Wbgy5a78ZkJUUwEOYEOkmLvKhXPw=
X-Google-Smtp-Source: ABdhPJy0covv+Aglx4oFCgcAU5gTs1KA15bTTxh/eBC2K8mIsK2O0qp+CxYJ8yYrGmm5qvauaiO/f2dLHbfzH9DFNvc=
X-Received: by 2002:a05:6e02:19cc:b0:2ca:b72:1547 with SMTP id
 r12-20020a056e0219cc00b002ca0b721547mr10395924ill.113.1650505579662; Wed, 20
 Apr 2022 18:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220421003324.1134983-1-bmeng.cn@gmail.com>
In-Reply-To: <20220421003324.1134983-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Apr 2022 11:45:53 +1000
Message-ID: <CAKmqyKNMjRLkY+_GWfWhdOGqFeNPpfcMmm0vEP4EY6yBW4gV_g@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] target/riscv: Initial support for the Sdtrig
 extension via M-mode CSRs
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Thu, 21 Apr 2022 01:46:23 -0000

On Thu, Apr 21, 2022 at 10:35 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
>
> This adds initial support for the Sdtrig extension via the Trigger Module,
> as defined in the RISC-V Debug Specification [1].
>
> Only "Address / Data Match" trigger (type 2) is implemented as of now,
> which is mainly used for hardware breakpoint and watchpoint. The number
> of type 2 triggers implemented is 2, which is the number that we can
> find in the SiFive U54/U74 cores.
>
> [1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf
>
> Changes in v5:
> - rebase against riscv-to-apply.next
> - drop patch 1 in v4 which is already in riscv-to-apply.next
> - adjust patch order to let patch 2 in v4 come later
>
> Changes in v4:
> - move riscv_trigger_init() call to riscv_cpu_reset()
>
> Changes in v3:
> - add riscv_trigger_init(), moved from patch #1 to this patch
> - enable debug feature by default for all CPUs
>
> Changes in v2:
> - use 0 instead of GETPC()
> - change the config option to 'disabled' by default
> - new patch: add debug state description
>
> Bin Meng (6):
>   target/riscv: debug: Implement debug related TCGCPUOps
>   target/riscv: cpu: Add a config option for native debug
>   target/riscv: csr: Hook debug CSR read/write
>   target/riscv: machine: Add debug state description
>   target/riscv: cpu: Enable native debug feature
>   hw/core: tcg-cpu-ops.h: Update comments of debug_check_watchpoint()

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  include/hw/core/tcg-cpu-ops.h |   1 +
>  target/riscv/cpu.h            |   4 +-
>  target/riscv/debug.h          |   6 ++
>  target/riscv/cpu.c            |  12 ++++
>  target/riscv/csr.c            |  57 +++++++++++++++++++
>  target/riscv/debug.c          | 102 ++++++++++++++++++++++++++++++++++
>  target/riscv/machine.c        |  32 +++++++++++
>  7 files changed, 213 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
>


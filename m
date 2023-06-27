Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BB6EB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 18:55:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEDq3-0000vo-Nc; Tue, 27 Jun 2023 14:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEDq1-0000vR-Ke
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 14:54:53 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEDpz-0004Bz-Kb
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 14:54:53 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b74b37fbe0so2137896a34.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687892090; x=1690484090;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WtCKymkgg4on1u4++AkgCZ1r9smCyMHq+6C+dhBZNaw=;
 b=ENER2AdJYulcH6mUXogwLCLaDKiUhBtxPVIyeCs0Rp2X39Nm9b2e2GGYYekJEfhOsI
 JNsLOQAJqi9r7xT4vPYn4i4CJXg37uW02XmaUxJwe2pY5geOrHuiwbIU1yzmpBHmHaIF
 vYVY8G1DLZnAHDejk0EeWalZdwW3mA8L4MPORWwnauLbqUqn3A0yGV8QWtImng+J+0xO
 zDdp3YSLqykFYijV+iVb2cVXpVsGs8x9lOetix0byASVsQDXP3hPqyJ76iUgNNWE8+hp
 ePaIlKYQB9bLqckT4KrzQ46OCNqEl+KUT7zMQFxLVVOsL57Aajk3lBZ9q5Yn7rqUCuNJ
 9D1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687892090; x=1690484090;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WtCKymkgg4on1u4++AkgCZ1r9smCyMHq+6C+dhBZNaw=;
 b=dPFzp2rDSTh1RO40q6GUN0Bv7QUi2M4VfuOxJjgfbjXdaNNstBxZyz9U4rcOSYlu60
 sAATP59gJyfIzP/8oymWYK3JSlzNukwb4FKPslYgH/MZbl19A18juI8GXI6iO8m65kQ7
 Dl1ICNa+ujHK0VPC21G6WGPdp8uifxRintLcqSAxwU3l8wwi7VLLMKAA19XFX3AITkpy
 iJkqYAclH/BtxZ9TH0adlExs8EnquPH62UYBUyvdIVltdq16IkW7mX86xc1HKN7Asojp
 JbdfiHR7q6+E9QZ/EUfIcFEL2xuwzl1Z7I5ZfK9p0z68o+CaZGJVt/mNSYsGnPpmMLyw
 2/9Q==
X-Gm-Message-State: AC+VfDzY1p9Pd9GslMxE0Dg/ntNoo2V82KMH7Fib5F5bXB7Svk/whQSN
 AbeC6Tk4kAhWG9IlYd7x1bAJHQ==
X-Google-Smtp-Source: ACHHUZ4dHDxim2KZZHCRjgZyZiIszErJOTZdv1ElKB3rlRggmr0O81f0/mpTzMIXROHlYFlH2jH7ZQ==
X-Received: by 2002:a9d:6859:0:b0:6b7:4af2:492d with SMTP id
 c25-20020a9d6859000000b006b74af2492dmr7013988oto.38.1687892090152; 
 Tue, 27 Jun 2023 11:54:50 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 f11-20020a9d5f0b000000b006a44338c8efsm4013102oti.44.2023.06.27.11.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 11:54:49 -0700 (PDT)
Message-ID: <59b5b342-8940-5ac1-0cec-8c136c4916d8@ventanamicro.com>
Date: Tue, 27 Jun 2023 15:54:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/16] target/riscv: Allow building without TCG (KVM-only
 so far)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
References: <20230626232007.8933-1-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230626232007.8933-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
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

Phil,

Can you rebase this on top of Alistair's riscv-to-apply.next?

https://github.com/alistair23/qemu/tree/riscv-to-apply.next

There's a trivial conflict in patch 8 and a not so trivial conflict in patch 14
that I'd rather let you deal with it.

Also, can you take a look at these KVM patches to see if there's a potential
design conflict with what you're doing here?

"[PATCH v5 00/19] target/riscv, KVM: fixes and enhancements"

We're missing a few details in one of the patches and it seems good to go. I am
doing some stuff there that I'm unsure if it will compromise the work you're
doing here (e.g. creating kvm user properties by using TCG user properties). In
a quick glance at your series I think we'll be fine, but better safe than sorry.

I guess I'll wait for you to send a rebased version of this series and apply
mine on top of it to see what happens. That would be a good test.


Thanks,


Daniel


On 6/26/23 20:19, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> this series reorder TCG specific code in order to easily
> build a KVM-only binary. sysemu specific code is also
> moved around, to help noticing invalid uses from user
> emulation. Last patch adds a new job to our CI to avoid
> this to bitrot.
> 
> Please review,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (16):
>    target/riscv: Remove unused 'instmap.h' header in translate.c
>    target/riscv: Restrict KVM-specific fields from ArchCPU
>    target/riscv: Restrict sysemu specific header to user emulation
>    target/riscv: Restrict 'rv128' machine to TCG accelerator
>    target/riscv: Move sysemu-specific files to target/riscv/sysemu/
>    target/riscv: Restrict riscv_cpu_do_interrupt() to sysemu
>    target/riscv: Move TCG-specific files to target/riscv/tcg/
>    target/riscv: Move TCG-specific cpu_get_tb_cpu_state() to tcg/cpu.c
>    target/riscv: Expose some 'trigger' prototypes from debug.c
>    target/riscv: Extract TCG-specific code from debug.c
>    target/riscv: Move sysemu-specific debug files to target/riscv/sysemu/
>    target/riscv: Expose riscv_cpu_pending_to_irq() from cpu_helper.c
>    target/riscv: Move TCG/sysemu-specific code to tcg/sysemu/cpu_helper.c
>    target/riscv: Move sysemu-specific code to sysemu/cpu_helper.c
>    target/riscv: Restrict TCG-specific prototype declarations
>    gitlab-ci.d/crossbuilds: Add KVM riscv64 cross-build jobs
> 
>   target/riscv/cpu.h                            |   29 +-
>   target/riscv/internals.h                      |    4 +
>   target/riscv/{ => sysemu}/debug.h             |    6 +
>   target/riscv/{ => sysemu}/instmap.h           |    0
>   target/riscv/{ => sysemu}/kvm_riscv.h         |    0
>   target/riscv/{ => sysemu}/pmp.h               |    0
>   target/riscv/{ => sysemu}/pmu.h               |    0
>   target/riscv/{ => sysemu}/time_helper.h       |    0
>   target/riscv/{ => tcg}/XVentanaCondOps.decode |    0
>   target/riscv/{ => tcg}/insn16.decode          |    0
>   target/riscv/{ => tcg}/insn32.decode          |    0
>   target/riscv/{ => tcg}/xthead.decode          |    0
>   hw/riscv/virt.c                               |    2 +-
>   target/riscv/cpu.c                            |   35 +-
>   target/riscv/cpu_helper.c                     | 1692 +----------------
>   target/riscv/csr.c                            |    6 +-
>   target/riscv/{ => sysemu}/arch_dump.c         |    0
>   target/riscv/sysemu/cpu_helper.c              |  863 +++++++++
>   target/riscv/{ => sysemu}/debug.c             |  153 +-
>   target/riscv/{ => sysemu}/kvm-stub.c          |    0
>   target/riscv/{ => sysemu}/kvm.c               |    0
>   target/riscv/{ => sysemu}/machine.c           |    8 +-
>   target/riscv/{ => sysemu}/monitor.c           |    0
>   target/riscv/{ => sysemu}/pmp.c               |    0
>   target/riscv/{ => sysemu}/pmu.c               |    0
>   target/riscv/{ => sysemu}/riscv-qmp-cmds.c    |    0
>   target/riscv/{ => sysemu}/time_helper.c       |    0
>   target/riscv/{ => tcg}/bitmanip_helper.c      |    0
>   target/riscv/tcg/cpu.c                        |   97 +
>   target/riscv/{ => tcg}/crypto_helper.c        |    0
>   target/riscv/{ => tcg}/fpu_helper.c           |    0
>   target/riscv/{ => tcg}/m128_helper.c          |    0
>   target/riscv/{ => tcg}/op_helper.c            |    0
>   target/riscv/tcg/sysemu/cpu_helper.c          |  766 ++++++++
>   target/riscv/tcg/sysemu/debug.c               |  165 ++
>   target/riscv/tcg/tcg-stub.c                   |   31 +
>   target/riscv/{ => tcg}/translate.c            |    1 -
>   target/riscv/{ => tcg}/vector_helper.c        |    0
>   target/riscv/{ => tcg}/zce_helper.c           |    0
>   .gitlab-ci.d/crossbuilds.yml                  |    8 +
>   target/riscv/meson.build                      |   33 +-
>   target/riscv/sysemu/meson.build               |   14 +
>   target/riscv/tcg/meson.build                  |   22 +
>   target/riscv/tcg/sysemu/meson.build           |    4 +
>   44 files changed, 2046 insertions(+), 1893 deletions(-)
>   rename target/riscv/{ => sysemu}/debug.h (96%)
>   rename target/riscv/{ => sysemu}/instmap.h (100%)
>   rename target/riscv/{ => sysemu}/kvm_riscv.h (100%)
>   rename target/riscv/{ => sysemu}/pmp.h (100%)
>   rename target/riscv/{ => sysemu}/pmu.h (100%)
>   rename target/riscv/{ => sysemu}/time_helper.h (100%)
>   rename target/riscv/{ => tcg}/XVentanaCondOps.decode (100%)
>   rename target/riscv/{ => tcg}/insn16.decode (100%)
>   rename target/riscv/{ => tcg}/insn32.decode (100%)
>   rename target/riscv/{ => tcg}/xthead.decode (100%)
>   rename target/riscv/{ => sysemu}/arch_dump.c (100%)
>   create mode 100644 target/riscv/sysemu/cpu_helper.c
>   rename target/riscv/{ => sysemu}/debug.c (83%)
>   rename target/riscv/{ => sysemu}/kvm-stub.c (100%)
>   rename target/riscv/{ => sysemu}/kvm.c (100%)
>   rename target/riscv/{ => sysemu}/machine.c (98%)
>   rename target/riscv/{ => sysemu}/monitor.c (100%)
>   rename target/riscv/{ => sysemu}/pmp.c (100%)
>   rename target/riscv/{ => sysemu}/pmu.c (100%)
>   rename target/riscv/{ => sysemu}/riscv-qmp-cmds.c (100%)
>   rename target/riscv/{ => sysemu}/time_helper.c (100%)
>   rename target/riscv/{ => tcg}/bitmanip_helper.c (100%)
>   create mode 100644 target/riscv/tcg/cpu.c
>   rename target/riscv/{ => tcg}/crypto_helper.c (100%)
>   rename target/riscv/{ => tcg}/fpu_helper.c (100%)
>   rename target/riscv/{ => tcg}/m128_helper.c (100%)
>   rename target/riscv/{ => tcg}/op_helper.c (100%)
>   create mode 100644 target/riscv/tcg/sysemu/cpu_helper.c
>   create mode 100644 target/riscv/tcg/sysemu/debug.c
>   create mode 100644 target/riscv/tcg/tcg-stub.c
>   rename target/riscv/{ => tcg}/translate.c (99%)
>   rename target/riscv/{ => tcg}/vector_helper.c (100%)
>   rename target/riscv/{ => tcg}/zce_helper.c (100%)
>   create mode 100644 target/riscv/sysemu/meson.build
>   create mode 100644 target/riscv/tcg/meson.build
>   create mode 100644 target/riscv/tcg/sysemu/meson.build
> 


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA33C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 08:51:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0Hnw-0003hV-Ll; Tue, 07 Nov 2023 03:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0Hnn-0003bj-IA
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 03:51:16 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0Hnl-0003O0-8N
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 03:51:15 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507a62d4788so7280766e87.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 00:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699347070; x=1699951870; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrSZHFiJAA/AwU7WufUuWN5MLuX6xE725trQkA5y2eI=;
 b=WeHrMOiTJxp0PJHD/V3JJDHN5cQNdf7TtOVnDLHUnvX7MTVuGL+lY6H0uz4mWNPlav
 0es55CkpjQTim+PEOWKV8KsJ+J+KEf19S8fiZTohcmPDV0JPeULRdMRWnEzBmVooHAM7
 w6B50zO9eAZB5fSC2rtKFnYLB62Zd1MCGF4aGeM/yA/02QZb2LX1Q8qvT+bRgMbJSJ0r
 XuxD0R8VoCzYCqVP5pAXI2NmtEFpO/M5c6s31noJF6lcIW/prZHeugh21Y/oYjpDC9zX
 ooAhX1HPCrNIwBvL4Yc01qfbdKUdnfhkPE+0D5aLN06XLgj2B6Pt6Zxn1lKc6U1ja/k4
 bW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699347070; x=1699951870;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrSZHFiJAA/AwU7WufUuWN5MLuX6xE725trQkA5y2eI=;
 b=QDvTXRvX2MKi+r49WXMkfjAsGLjBwiILzHHldRuQfJ4T3BK/rGS4yJExBWm5nFq9H4
 tVaBA022UChQSjHX8Iz3fYhTXRQ3MRZmgwpXR9PQQcOLl0A2zNHVN7ogicSMjy33UflD
 W6SpuTpZ+w3K8ROpxPHLg7idigB2XCVqgoXTYXuEQHbaof73XA+quPeFo9IcgY/BpPvb
 wTzkKBUtMNAe2bJkd5ub9UQ/mBMqbpXGNhTrq92F5UWx/A71298dsKP+Aqvq2D+kXe5v
 ptMjVBBcEy5P1+QeYMpDV4w4jGjrabml8Dg8sGRWLml/ga/3lU6BwbRhilnUdCR1GeN1
 Vvgg==
X-Gm-Message-State: AOJu0YyGcKBlA69+WAY4kr/kPo0MXJPzd2xdbWVGS/7RohpLxGrIl8/0
 Ma+cMydkUuUGiivefJDSKDcRkQ==
X-Google-Smtp-Source: AGHT+IHoMv3nExW5cDVokGdoq6qHnq/PG7wEVoZ88hDscpByiKlLR2kw/aP+0d8R4Aw18DTMIGQT9Q==
X-Received: by 2002:ac2:4c43:0:b0:509:4aae:f2b1 with SMTP id
 o3-20020ac24c43000000b005094aaef2b1mr13277690lfk.8.1699347069952; 
 Tue, 07 Nov 2023 00:51:09 -0800 (PST)
Received: from [192.168.69.115] ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4406000000b003196b1bb528sm1705437wrq.64.2023.11.07.00.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 00:51:09 -0800 (PST)
Message-ID: <009d27a1-79ba-43de-b732-b5a86aa4f7d9@linaro.org>
Date: Tue, 7 Nov 2023 09:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/60] Misc HW/UI patches for 2023-11-06
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org
References: <20231106110336.358-1-philmd@linaro.org>
 <CAJSP0QXN5LQ_56do2MOAXyHWwqstYPDEDgptN4h464mW7wnjqA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJSP0QXN5LQ_56do2MOAXyHWwqstYPDEDgptN4h464mW7wnjqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 7/11/23 02:39, Stefan Hajnoczi wrote:
> On Mon, 6 Nov 2023 at 19:03, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> The following changes since commit d762bf97931b58839316b68a570eecc6143c9e3e:
>>
>>    Merge tag 'pull-target-arm-20231102' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-11-03 10:04:12 +0800)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/philmd/qemu.git tags/misc-cpus-20231106
>>
>> for you to fetch changes up to a81b438ac3933419910cbdf2e2e8d87681de611e:
>>
>>    ui/sdl2: use correct key names in win title on mac (2023-11-06 11:07:32 +0100)
>>
>> Few checkpatch warnings in target/i386/hvf/x86_emu.c are deliberately ignored.
>> ----------------------------------------------------------------
>> Misc hardware patch queue
>>
>> HW emulation:
>> - PMBus fixes and tests (Titus)
>> - IDE fixes and tests (Fiona)
>> - New ADM1266 sensor (Titus)
>> - Better error propagation in PCI-ISA i82378 (Philippe)
>>
>> Topology:
>> - Fix CPUState::nr_cores calculation (Zhuocheng Ding and Zhao Liu)
>>
>> Monitor:
>> - Synchronize CPU state in 'info lapic' (Dongli Zhang)
>>
>> QOM:
>> - Have 'cpu-qom.h' target-agnostic (Philippe)
>> - Call object_class_is_abstract once in cpu_class_by_name (Philippe)
>>
>> UI:
>> - Use correct key names in titles on MacOS / SDL2 (Adrian)
>>
>> MIPS:
>> - Fix MSA BZ/BNZ and TX79 LQ/SQ opcodes (Philippe)
>>
>> Nios2:
>> - Create IRQs *after* vCPU is realized (Philippe)
>>
>> PPC:
>> - Restrict KVM objects to system emulation (Philippe)
>>
>> X86:
>> - HVF & KVM cleanups (Philippe)
>>
>> Various targets:
>> - Use env_archcpu() to optimize (Philippe)
>>
>> Misc:
>> - Few global variable shadowing removed (Philippe)
>> - Introduce cpu_exec_reset_hold and factor tcg_cpu_reset_hold out (Philippe)
>> - Remove few more 'softmmu' mentions (Philippe)
>> - Fix and cleanup in vl.c (Akihiko & Marc-André)
>> - MAINTAINERS updates (Thomas, Daniel)
>>
>> ----------------------------------------------------------------
>>
>> Adrian Wowk (1):
>>    ui/sdl2: use correct key names in win title on mac
>>
>> Akihiko Odaki (1):
>>    vl: Free machine list
>>
>> Daniel P. Berrangé (1):
>>    MAINTAINERS: update libvirt devel mailing list address
>>
>> Dongli Zhang (1):
>>    target/i386/monitor: synchronize cpu state for lapic info
>>
>> Fiona Ebner (2):
>>    hw/ide: reset: cancel async DMA operation before resetting state
>>    tests/qtest: ahci-test: add test exposing reset issue with pending
>>      callback
>>
>> Marc-André Lureau (1):
>>    vl: constify default_list
>>
>> Philippe Mathieu-Daudé (39):
>>    tests/vm/ubuntu.aarch64: Correct comment about TCG specific delay
>>    tests/unit/test-seccomp: Remove mentions of softmmu in test names
>>    accel/tcg: Declare tcg_flush_jmp_cache() in 'exec/tb-flush.h'
>>    accel: Introduce cpu_exec_reset_hold()
>>    accel/tcg: Factor tcg_cpu_reset_hold() out
>>    target: Unify QOM style
>>    target: Mention 'cpu-qom.h' is target agnostic
>>    target/arm: Move internal declarations from 'cpu-qom.h' to 'cpu.h'
>>    target/ppc: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
>>    target/riscv: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
>>    target: Declare FOO_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'
>>    target/hexagon: Declare QOM definitions in 'cpu-qom.h'
>>    target/loongarch: Declare QOM definitions in 'cpu-qom.h'
>>    target/nios2: Declare QOM definitions in 'cpu-qom.h'
>>    target/openrisc: Declare QOM definitions in 'cpu-qom.h'
>>    target/riscv: Move TYPE_RISCV_CPU_BASE definition to 'cpu.h'
>>    target/ppc: Use env_archcpu() in helper_book3s_msgsndp()
>>    target/riscv: Use env_archcpu() in [check_]nanbox()
>>    target/s390x: Use env_archcpu() in handle_diag_308()
>>    target/xtensa: Use env_archcpu() in update_c[compare|count]()
>>    target/i386/hvf: Use x86_cpu in simulate_[rdmsr|wrmsr]()
>>    target/i386/hvf: Use env_archcpu() in simulate_[rdmsr/wrmsr]()
>>    target/i386/hvf: Use CPUState typedef
>>    target/i386/hvf: Rename 'CPUState *cpu' variable as 'cs'
>>    target/i386/hvf: Rename 'X86CPU *x86_cpu' variable as 'cpu'
>>    target/i386/kvm: Correct comment in kvm_cpu_realize()
>>    target/mips: Fix MSA BZ/BNZ opcodes displacement
>>    target/mips: Fix TX79 LQ/SQ opcodes
>>    sysemu/kvm: Restrict kvmppc_get_radix_page_info() to ppc targets
>>    hw/ppc/e500: Restrict ppce500_init_mpic_kvm() to KVM
>>    target/ppc: Restrict KVM objects to system emulation
>>    target/ppc: Prohibit target specific KVM prototypes on user emulation
>>    target/nios2: Create IRQs *after* accelerator vCPU is realized
>>    target/alpha: Tidy up alpha_cpu_class_by_name()
>>    hw/cpu: Call object_class_is_abstract() once in cpu_class_by_name()
>>    exec/cpu: Have cpu_exec_realize() return a boolean
>>    hw/cpu: Clean up global variable shadowing
> 
> Please take a look at the following CI failure:
> 
> cc -m64 -mcx16 -Ilibqemu-arm-bsd-user.fa.p -I. -I.. -Itarget/arm
> -I../target/arm -I../common-user/host/x86_64 -I../bsd-user/include
> -Ibsd-user/freebsd -I../bsd-user/freebsd -I../bsd-user/host/x86_64
> -Ibsd-user -I../bsd-user -I../bsd-user/arm -Iqapi -Itrace -Iui
> -Iui/shader -I/usr/local/include/capstone
> -I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include
> -I/usr/local/include -fcolor-diagnostics -Wall -Winvalid-pch -Werror
> -std=gnu11 -O2 -g -fstack-protector-strong -Wundef -Wwrite-strings
> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> -Wendif-labels -Wexpansion-to-defined -Wmissing-format-attribute
> -Wno-initializer-overrides -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-string-plus-int
> -Wno-typedef-redefinition -Wno-tautological-type-limit-compare
> -Wno-psabi -Wno-gnu-variable-sized-type-not-at-end -Wthread-safety
> -iquote . -iquote /tmp/cirrus-ci-build -iquote
> /tmp/cirrus-ci-build/include -iquote
> /tmp/cirrus-ci-build/host/include/x86_64 -iquote
> /tmp/cirrus-ci-build/host/include/generic -iquote
> /tmp/cirrus-ci-build/tcg/i386 -pthread -D_GNU_SOURCE
> -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fno-strict-aliasing
> -fno-common -fwrapv -fPIE -DNEED_CPU_H
> '-DCONFIG_TARGET="arm-bsd-user-config-target.h"'
> '-DCONFIG_DEVICES="arm-bsd-user-config-devices.h"' -MD -MQ
> libqemu-arm-bsd-user.fa.p/bsd-user_main.c.o -MF
> libqemu-arm-bsd-user.fa.p/bsd-user_main.c.o.d -o
> libqemu-arm-bsd-user.fa.p/bsd-user_main.c.o -c ../bsd-user/main.c
> ../bsd-user/main.c:121:36: error: use of undeclared identifier 'cpus';
> did you mean 'cpu'?
> QTAILQ_REMOVE_RCU(&cpus, cpu, node);
> ^~~~
> cpu
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/5472832586

Hmm for some reason the Cirrus jobs aren't running anymore in
my GitLab namespace, sorry for not catching that trivial leftover.

Phil.


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB902C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 01:40:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0B4t-0002As-0Y; Mon, 06 Nov 2023 20:40:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1r0B4c-00029J-3s; Mon, 06 Nov 2023 20:40:10 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1r0B4V-000283-UY; Mon, 06 Nov 2023 20:40:09 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6ce37683cf6so3204185a34.3; 
 Mon, 06 Nov 2023 17:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699321199; x=1699925999; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJleMQjaaLsKD3zymDLq2GG+Em4KcVhskoi6Q7RZmiw=;
 b=DqiTEY4PM2+bm+NoSokqhgd+nn9dzV1fdeqNPtDr/hzZa2UuOK+2Dpv0UE0zFrHE5j
 hCjzXVv9NtXgJVqOha4uRWqmNJdNE9sCGlwe1A8Gzg6R5C86XikpwfiJAezGwTbFVnGs
 mR4S2bGzYvptlEkg/9KHog8/6XTC3UeNQzsgctbn22TzA/elWarFwK8tvLfz/Jvdgayr
 qTc6gCrtbN/MVxmYPa3k49ygZpBWQUERAxThF5g7n2//2qqawwE9cEb4f4VcR5/DGoN6
 yjpt5R2R/NniJIhrFfvaHaf+sPZri4YhjK2UyO2v/G8JJg2OEDZQRVUvyFOUAkrwdgbW
 bcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699321199; x=1699925999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJleMQjaaLsKD3zymDLq2GG+Em4KcVhskoi6Q7RZmiw=;
 b=o8ZUe9Oo89EdBKBUsbtRXcgipBdU5yKzFozdJ8e3H15cB8rk7S1n5sX7WdLUVJynpH
 erBdMEjAe2sN4nFQvoDGBcrZRi+0TMIWHt4t6oCUr7HR9ML5Q0PcgR10wbhEueCR99G6
 mvZBjKOLXeJpqqVVeFyuHICjAgPE9gDZLlQgyM1qRo8d/krF6P4/4NeBrZE+Gtc6nzb4
 6yOPdBW7g2FvWFDaAY3jIy/NgE9eFfkh00mNC0js22pgOZz3HcQdw9cmGy8IJErkjCp7
 pJsmr09Y2AzMxrpmTccpTrd7UFPoAZ2NYFIsgycLRR2h6Km+CpUHdaGePujDDimTRC5w
 RMoA==
X-Gm-Message-State: AOJu0YytdeeAaVotm76XZYcH1VxlZ0q8BnmRrK4OYKuULkVOGHeCi2zM
 nsKs8qm2S9xWRVkz6opJQ6Dyd5qkOeiGkRZM4e4=
X-Google-Smtp-Source: AGHT+IHZuWbCytkP8n4Amau66dg4WgfHSel/3swE8s+v2uWdPs0YkGJaZNGLV00cj0Ae+JV0sLY/HpwJ8DtyiDahvh8=
X-Received: by 2002:a05:6830:2054:b0:6c4:ac5b:aaea with SMTP id
 f20-20020a056830205400b006c4ac5baaeamr30873746otp.25.1699321199492; Mon, 06
 Nov 2023 17:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20231106110336.358-1-philmd@linaro.org>
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 7 Nov 2023 09:39:47 +0800
Message-ID: <CAJSP0QXN5LQ_56do2MOAXyHWwqstYPDEDgptN4h464mW7wnjqA@mail.gmail.com>
Subject: Re: [PULL 00/60] Misc HW/UI patches for 2023-11-06
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-s390x@nongnu.org, 
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=stefanha@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, 6 Nov 2023 at 19:03, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> The following changes since commit d762bf97931b58839316b68a570eecc6143c9e=
3e:
>
>   Merge tag 'pull-target-arm-20231102' of https://git.linaro.org/people/p=
maydell/qemu-arm into staging (2023-11-03 10:04:12 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/misc-cpus-20231106
>
> for you to fetch changes up to a81b438ac3933419910cbdf2e2e8d87681de611e:
>
>   ui/sdl2: use correct key names in win title on mac (2023-11-06 11:07:32=
 +0100)
>
> Few checkpatch warnings in target/i386/hvf/x86_emu.c are deliberately ign=
ored.
> ----------------------------------------------------------------
> Misc hardware patch queue
>
> HW emulation:
> - PMBus fixes and tests (Titus)
> - IDE fixes and tests (Fiona)
> - New ADM1266 sensor (Titus)
> - Better error propagation in PCI-ISA i82378 (Philippe)
>
> Topology:
> - Fix CPUState::nr_cores calculation (Zhuocheng Ding and Zhao Liu)
>
> Monitor:
> - Synchronize CPU state in 'info lapic' (Dongli Zhang)
>
> QOM:
> - Have 'cpu-qom.h' target-agnostic (Philippe)
> - Call object_class_is_abstract once in cpu_class_by_name (Philippe)
>
> UI:
> - Use correct key names in titles on MacOS / SDL2 (Adrian)
>
> MIPS:
> - Fix MSA BZ/BNZ and TX79 LQ/SQ opcodes (Philippe)
>
> Nios2:
> - Create IRQs *after* vCPU is realized (Philippe)
>
> PPC:
> - Restrict KVM objects to system emulation (Philippe)
>
> X86:
> - HVF & KVM cleanups (Philippe)
>
> Various targets:
> - Use env_archcpu() to optimize (Philippe)
>
> Misc:
> - Few global variable shadowing removed (Philippe)
> - Introduce cpu_exec_reset_hold and factor tcg_cpu_reset_hold out (Philip=
pe)
> - Remove few more 'softmmu' mentions (Philippe)
> - Fix and cleanup in vl.c (Akihiko & Marc-Andr=C3=A9)
> - MAINTAINERS updates (Thomas, Daniel)
>
> ----------------------------------------------------------------
>
> Adrian Wowk (1):
>   ui/sdl2: use correct key names in win title on mac
>
> Akihiko Odaki (1):
>   vl: Free machine list
>
> Daniel P. Berrang=C3=A9 (1):
>   MAINTAINERS: update libvirt devel mailing list address
>
> Dongli Zhang (1):
>   target/i386/monitor: synchronize cpu state for lapic info
>
> Fiona Ebner (2):
>   hw/ide: reset: cancel async DMA operation before resetting state
>   tests/qtest: ahci-test: add test exposing reset issue with pending
>     callback
>
> Marc-Andr=C3=A9 Lureau (1):
>   vl: constify default_list
>
> Philippe Mathieu-Daud=C3=A9 (39):
>   tests/vm/ubuntu.aarch64: Correct comment about TCG specific delay
>   tests/unit/test-seccomp: Remove mentions of softmmu in test names
>   accel/tcg: Declare tcg_flush_jmp_cache() in 'exec/tb-flush.h'
>   accel: Introduce cpu_exec_reset_hold()
>   accel/tcg: Factor tcg_cpu_reset_hold() out
>   target: Unify QOM style
>   target: Mention 'cpu-qom.h' is target agnostic
>   target/arm: Move internal declarations from 'cpu-qom.h' to 'cpu.h'
>   target/ppc: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
>   target/riscv: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
>   target: Declare FOO_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'
>   target/hexagon: Declare QOM definitions in 'cpu-qom.h'
>   target/loongarch: Declare QOM definitions in 'cpu-qom.h'
>   target/nios2: Declare QOM definitions in 'cpu-qom.h'
>   target/openrisc: Declare QOM definitions in 'cpu-qom.h'
>   target/riscv: Move TYPE_RISCV_CPU_BASE definition to 'cpu.h'
>   target/ppc: Use env_archcpu() in helper_book3s_msgsndp()
>   target/riscv: Use env_archcpu() in [check_]nanbox()
>   target/s390x: Use env_archcpu() in handle_diag_308()
>   target/xtensa: Use env_archcpu() in update_c[compare|count]()
>   target/i386/hvf: Use x86_cpu in simulate_[rdmsr|wrmsr]()
>   target/i386/hvf: Use env_archcpu() in simulate_[rdmsr/wrmsr]()
>   target/i386/hvf: Use CPUState typedef
>   target/i386/hvf: Rename 'CPUState *cpu' variable as 'cs'
>   target/i386/hvf: Rename 'X86CPU *x86_cpu' variable as 'cpu'
>   target/i386/kvm: Correct comment in kvm_cpu_realize()
>   target/mips: Fix MSA BZ/BNZ opcodes displacement
>   target/mips: Fix TX79 LQ/SQ opcodes
>   sysemu/kvm: Restrict kvmppc_get_radix_page_info() to ppc targets
>   hw/ppc/e500: Restrict ppce500_init_mpic_kvm() to KVM
>   target/ppc: Restrict KVM objects to system emulation
>   target/ppc: Prohibit target specific KVM prototypes on user emulation
>   target/nios2: Create IRQs *after* accelerator vCPU is realized
>   target/alpha: Tidy up alpha_cpu_class_by_name()
>   hw/cpu: Call object_class_is_abstract() once in cpu_class_by_name()
>   exec/cpu: Have cpu_exec_realize() return a boolean
>   hw/cpu: Clean up global variable shadowing

Please take a look at the following CI failure:

cc -m64 -mcx16 -Ilibqemu-arm-bsd-user.fa.p -I. -I.. -Itarget/arm
-I../target/arm -I../common-user/host/x86_64 -I../bsd-user/include
-Ibsd-user/freebsd -I../bsd-user/freebsd -I../bsd-user/host/x86_64
-Ibsd-user -I../bsd-user -I../bsd-user/arm -Iqapi -Itrace -Iui
-Iui/shader -I/usr/local/include/capstone
-I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include
-I/usr/local/include -fcolor-diagnostics -Wall -Winvalid-pch -Werror
-std=3Dgnu11 -O2 -g -fstack-protector-strong -Wundef -Wwrite-strings
-Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
-Wendif-labels -Wexpansion-to-defined -Wmissing-format-attribute
-Wno-initializer-overrides -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-string-plus-int
-Wno-typedef-redefinition -Wno-tautological-type-limit-compare
-Wno-psabi -Wno-gnu-variable-sized-type-not-at-end -Wthread-safety
-iquote . -iquote /tmp/cirrus-ci-build -iquote
/tmp/cirrus-ci-build/include -iquote
/tmp/cirrus-ci-build/host/include/x86_64 -iquote
/tmp/cirrus-ci-build/host/include/generic -iquote
/tmp/cirrus-ci-build/tcg/i386 -pthread -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasing
-fno-common -fwrapv -fPIE -DNEED_CPU_H
'-DCONFIG_TARGET=3D"arm-bsd-user-config-target.h"'
'-DCONFIG_DEVICES=3D"arm-bsd-user-config-devices.h"' -MD -MQ
libqemu-arm-bsd-user.fa.p/bsd-user_main.c.o -MF
libqemu-arm-bsd-user.fa.p/bsd-user_main.c.o.d -o
libqemu-arm-bsd-user.fa.p/bsd-user_main.c.o -c ../bsd-user/main.c
../bsd-user/main.c:121:36: error: use of undeclared identifier 'cpus';
did you mean 'cpu'?
QTAILQ_REMOVE_RCU(&cpus, cpu, node);
^~~~
cpu

https://gitlab.com/qemu-project/qemu/-/jobs/5472832586

Thanks,
Stefan


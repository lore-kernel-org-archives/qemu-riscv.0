Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3145FC021A6
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 11:48:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmWwJ-0002T5-WF; Mon, 24 Feb 2025 06:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmWwD-0002S6-S0
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 06:47:53 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmWwB-0007dn-RA
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 06:47:53 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6fcf90d09c6so5424687b3.0
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 03:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740397670; x=1741002470; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k7y1iGF6azviOXT41pICQfPUU2u7nAyQGwI9LVQFm+I=;
 b=NSaggR43/wu2CPqlbNLRS2pK+QgEuUG1pv2s+rX8+jwm1Fb1BB0ZfJkIm/JmaRxKwI
 aCkEt3mBIAULZmfo/CAFzDX4u5a/zmpMbFuolgd1GhAKgKXTkoo3Qr7hQ3w8F5sAjwfe
 myewHc1SQaVho3Uul63xOejP/ctqfBiGYHLWX1zBlnEaToT+b4YJoCr/8avsqpPX8eRf
 BzwYinkGsphLXFVaoDj58yjUvJy04/5H9HBJVOUBtvRq/tnt3l9vs9cdshIDGfE3NJVT
 vSMnzQtJiHnekLqulW4JJlyocK4/fSV9k7wtS6sNJHsxyE89e5YY0+Jb5TQs9Raj2THJ
 sANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740397670; x=1741002470;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k7y1iGF6azviOXT41pICQfPUU2u7nAyQGwI9LVQFm+I=;
 b=QkydFKrRCerrDmT2yqCVl/rtXTsTnPBhg9uLctIey5lT6vLGEWrsuw58j04kWwgXav
 wqKcYaTigkYiH/XEQczfGJGm+j8HNiEgnfrS3/DtQ9zk5SeLnkgd0gOYB9ECDVi/VuVh
 L+aLfXI0XgkaL94U72DS5MRc4MYBopdynH0K9ifk4zFonfKSmxvuxSslaCLe90LZa5yz
 RplS+1ss8L7vWeIezhOy2TWH6TJf8bEKkGv7XbPZHMBJKiQFjQeKivd1800mVozwOYL1
 69kgjTSMa+/IiTfqYa7qWayx/hoZu9QwgoFHVqAiV003aEKZiDitCStYrfd4TGcqeJ+t
 8gDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzowUilszXNGKpqBOpVigLoDWUwaGxvXfaxxvJk5BOC+u+Wzc9FjE/9000OBU0R4ltsr47zHd4fO3k@nongnu.org
X-Gm-Message-State: AOJu0YyNbp6Y7ZpKS7O0e3e5EkyQ7usauqHuk1fMIi5pj2gvzy60XHp7
 ocLEk9lq9AoGY4i/e4qObL4a1hErIjtm9vovhNCjE0wgGPL7MC7N/jd7ep9EsxcRNivPtqWtbV9
 NeQMbM1bAZssjtIz4V/StM+oijdg/+y6uVoKRNg==
X-Gm-Gg: ASbGncsexVRMtvirAkVRe4XoWwvmRUt5/BsL2Vxv69B2x6EBOCNo2YGKf/s0ZrNAr4C
 OONuXe4ikb0hW+B9UIIpeIF7Yy1QvTAjJ0U2WGVs4sPIQq6MxcZitfBKdkrC3kL5i9C5COwHzKG
 2Ipm1CGH1k
X-Google-Smtp-Source: AGHT+IFIlcyVXRCKzrivIa1Cd4jMAhbev9+tO/sn1wv9emX5aROQ2+jZewxrR38IExrj9L2hGKXFNW95ahrvqRcwv9s=
X-Received: by 2002:a05:690c:7446:b0:6f9:5a36:577d with SMTP id
 00721157ae682-6fbb791557cmr142012087b3.9.1740397670282; Mon, 24 Feb 2025
 03:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20250220161313.127376-1-dbarboza@ventanamicro.com>
 <20250220161313.127376-2-dbarboza@ventanamicro.com>
 <CAFEAcA8u8C2HTRjOBReSQ7oN7L248034VrfTHYgHCxBPy0gwDg@mail.gmail.com>
 <b04d1e5a-36f6-4c54-8bc7-134c79f0addb@ventanamicro.com>
In-Reply-To: <b04d1e5a-36f6-4c54-8bc7-134c79f0addb@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Feb 2025 11:47:39 +0000
X-Gm-Features: AWEUYZn_z21FHxD7XRGf-IeGYRmZU7nGYZt0SFaRypvHX8uQxjrDbOhtPq8zCOI
Message-ID: <CAFEAcA-kBsw6fZAqWkFMhH7+42BE+z5YNz7kAWtBQwf3ZqQVfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv/cpu: ignore TCG init for KVM CPUs in
 reset_hold
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, 24 Feb 2025 at 11:29, Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 2/24/25 6:59 AM, Peter Maydell wrote:
> > On Thu, 20 Feb 2025 at 16:14, Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >> riscv_cpu_reset_hold() does a lot of TCG-related initializations that
> >> aren't relevant for KVM, but nevertheless are impacting the reset state
> >> of KVM vcpus.
> >>
> >> When running a KVM guest, kvm_riscv_reset_vcpu() is called at the end of
> >> reset_hold(). At that point env->mstatus is initialized to a non-zero
> >> value, and it will be use to write 'sstatus' in the vcpu
> >> (kvm_arch_put_registers() then kvm_riscv_put_regs_csr()).
> >>
> >> Do an early exit in riscv_cpu_reset_hold() if we're running KVM. All the
> >> KVM reset procedure will be centered in kvm_riscv_reset_vcpu().
> >>
> >> While we're at it, remove the kvm_enabled() check in
> >> kvm_riscv_reset_vcpu() since it's already being gated in
> >> riscv_cpu_reset_hold().

> > This looks super odd, from an "I don't know anything about
> > riscv specifics" position. Generally the idea is:
> >   * reset in QEMU should reset the CPU state
> >   * what a reset CPU looks like doesn't differ between
> >     accelerators
> >   * when we start the KVM CPU, we copy the state from QEMU
> >     to the kernel, and then the kernel's idea of the reset state
> >     matches
> >
> > This patch looks like it's entirely skipping basically
> > all of the QEMU CPU state reset code specifically for KVM.
>
> Not sure I understood what you said here.
>
> Without this patch, riscv_cpu_reset_hold() is doing initializations that are TCG
> based, both for user mode and system mode, and in the end is calling the kvm
> specific reset function if we're running KVM. This patch is simply skipping
> all the TCG related reset procedures if we're running KVM. So the patch isn't
> skipping the KVM specific QEMU CPU reset code, it is skipping the TCG specific
> reset code if we're running KVM.

What I'm saying is that you shouldn't have "TCG reset" and
"KVM reset" that are totally different code paths, but that the
reset function should be doing "reset the CPU", and then the
KVM codepath makes specific decisions about "for KVM these
particular things should be the kernel's reset settings" and
then passes that state over to the kernel.

> Granted, after applying patches 2 and 3 we could discard this patch because
> now we're resetting all that KVM needs in kvm_reset_vcpu(), but why go
> through the reset steps for TCG if we're going to overwrite them later during
> kvm_reset_vcpu()?

The idea is that you only overwrite specific state where
you've decided "actually the kernel is the authoritative
source for what the reset state for these registers is".

> > So now you'll have two different pieces of code controlling
> > reset for different accelerators, and the resulting CPU
> > state won't be consistent between them...
>
> That is already the case even without this patch, doesn't it? If we have to call
> a specific kvm reset function during cpu reset_hold then we're already in a point
> where the reset procedure is differing between accelerators. I won't say that
> this is a good design but I don't see it as a problem.

> For instance, going to a code you're probably more familiar with, target/arm/cpu.c,
> arm_cpu_reset_hold(), is doing something similar to what riscv_cpu_reset_hold() is
> doing without this patch: a lot of TCG setups are made, then kvm_arm_reset_vcpu() is
> called in the end if kvm_enabled(). kvm_arm_reset_vcpu() then overwrites at least some
> of the TCG specific setup that was done before:
>
>      /* Re-init VCPU so that all registers are set to
>       * their respective reset values.
>       */
>      ret = kvm_arm_vcpu_init(cpu);
>
> kvm_arm_vcpu_init() is doing a KVM_ARM_VCPU_INIT ioctl that will populate the CPU object
> with the kernel specific feature bitmask and so on. Note that this is not copying the TCG
> setup into the kernel, it is in fact doing the opposite.

The way this code path in Arm works is:
 * we reset all the QEMU-side CPU state struct in arm_cpu_reset_hold()
 * kvm_arm_reset_vcpu() calls kvm_arm_vcpu_init() which inits
   the KVM side vcpu
 * kvm_arm_reset_vcpu() calls the sequence write_kvmstate_to_list()
   followed by write_list_to_cpustate() which does "for the system
   registers specifically, read the values (and which registers we
   have) from KVM, and write them to the QEMU CPU state struct".
   We do this because on Arm we've said that the system registers
   in particular have the kernel as their authoritative source.
   (IIRC x86 makes QEMU the authority for its similar registers,
   so it has to do even less in its kvm_arch_reset_vcpu().)
 * the generic CPU core code will call kvm_arch_put_registers()
   before starting the vCPU, which copies whatever is in the QEMU-side
   CPU state struct into KVM

The upshot is that QEMU is the authority and arm_cpu_reset_hold()
defines the reset value for all CPU state by default. (For instance,
reset values for general purpose registers are set there.) But for
specific parts of the state where we want KVM to be the authority,
kvm_arm_reset_vcpu() gets to override that by filling in the CPU
state struct by asking the kernel what its values are.

> Note that my intention here isn't to make a case that the ARM KVM cpu doesn't need anything
> that is being done in arm_cpu_reset_hold(). My point here is that KVM and TCG CPUs will have
> different reset setups for some archs. For RISC-V I can say that KVM CPU does not rely on
> anything that the TCG reset code is doing, hence why I sent this patch to make it official.

What I'm trying to suggest here is that we don't want different
architectures to end up doing things differently. There are
multiple different design patterns that will work, but it will
be easier to work on QEMU if we can standardise on doing it
the same way across architectures.

thanks
-- PMM


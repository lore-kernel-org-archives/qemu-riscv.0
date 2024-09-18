Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F44BCDD543
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 15:33:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sqwfg-0005ls-Df; Wed, 18 Sep 2024 11:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqwfe-0005ko-IR
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 11:32:46 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqwfc-0005mf-VK
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 11:32:46 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c260b19f71so7848623a12.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 08:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726673563; x=1727278363; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DCpTEL/dYMB7Uol2NlYZ7DCyhiPYwgEy6rc2BA5KywU=;
 b=TnL5GxtxcpnSE1L9udozZXG0h4AkfLyeoGqVCR+Se3MWwE9k2ms2q8yv238wqW2iWc
 75I+F4VjaQEHCP0uD0+9UjShZknnQs+YSwiDMzscbQG9blI99Uc75NBZdfBmAKciFffc
 6w0HK2ODM37Fyqp4fK8LY/Zg21NcmZc0Jrh4EjvkBNdKPu09s9ruQ4IrtqU88erYpFHZ
 lS10Xtvo2qvgyagVwv2pH5F9+lRmEYH1eMRMcbktKpxAae9WocoOJYylbSm462RaqQ2e
 q5TWmYxX097XCq/tt/Jhzw2Zfrja5LnfO2Fppn9aZhVtO1ecsRVIQkheCE4HlDb7Eb7l
 0gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726673563; x=1727278363;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DCpTEL/dYMB7Uol2NlYZ7DCyhiPYwgEy6rc2BA5KywU=;
 b=tqz4RrvKLPbWU4h/vv4hUy53Jz9Yj73+N5Y9N9uYXIIDfecwczqCbXljCVuOi5aHBp
 egOxHC/eeZ8zreksTQ/Jg+wSvKE8xyUFg0K1RfF9SJdOixcPqcXdqGOlA1nQlzXvpRiY
 8j9CTo46S3oYUhOCSoENayKBgsVPF1Iz95efhqdLLJdxSlAtBq2cOSzorSvBeSdpCJYk
 HXP0LEiPpt315F0HowAsDn5faSTSBHnCgWzqB0VEbQHr1g2srMaXeFBs9faE9DbTrYpO
 vkIZvP54rCdVgtLK2zD/llAWX3LtnwBHjF7Reb7dX743bHNocPYe0qqfUexDTcrl7QdY
 Or8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3WCXqAjPbBH7BoFN4RluO6uvkDuLBHRbLBE/cZnKPIiuqJjFCqgOIBmyKcOMKOnimR856rFYnL8fo@nongnu.org
X-Gm-Message-State: AOJu0YyiSZn2XPg1UEkJLtxBYVDe+z7q+ZThYQxjXLIixOD2Q7ClnKpl
 /6e7GI/cOnQhRXFj6Jx+mW15lvQm480Var0fKuXvIECSjFU2mBLL6Y76Le9iTt1E2K4OpvhkIqM
 PfOd55ZvyuPJI/smSqJUps0TiG0KtHXhFQXjHGQ==
X-Google-Smtp-Source: AGHT+IHUXyXfmA5Am44lE06hFsf1unXiUfxYsmWUCGV8LXPzN024Cxhz2eXy8PcJcIICTPqY5rE5RE0MwfG5g8Mtkro=
X-Received: by 2002:a05:6402:280a:b0:5c2:8249:b2d3 with SMTP id
 4fb4d7f45d1cf-5c413e4c51fmr18852185a12.26.1726673562914; Wed, 18 Sep 2024
 08:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
 <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel>
 <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
 <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
 <CAFEAcA-L7sQfK6MNt1ZbZqUMk+TJor=uD3Jj-Pc6Vy9j9JHhYQ@mail.gmail.com>
 <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com>
In-Reply-To: <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Sep 2024 16:32:31 +0100
Message-ID: <CAFEAcA_ePVwnpVVWJSx8=-8v2h_z2imfSdyAZd62RhXaZUTojA@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Wed, 18 Sept 2024 at 14:49, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 18.09.24 15:12, Peter Maydell wrote:
> > On Wed, 18 Sept 2024 at 14:06, Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> >> Thanks Peter for looking into this.
> >>
> >> QEMU's cpu_synchronize_all_post_init() and
> >> do_kvm_cpu_synchronize_post_reset() both end up in
> >> kvm_arch_put_registers() and that is long after Linux
> >> kvm_arch_vcpu_create() has been setting some FPU state. See the output
> >> below.
> >>
> >> kvm_arch_put_registers() copies the CSRs by calling
> >> kvm_riscv_put_regs_csr(). Here we can find:
> >>
> >>       KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
> >>
> >> This call enables or disables the FPU according to the value of
> >> env->mstatus.
> >>
> >> So we need to set the desired state of the floating point unit in QEMU.
> >> And this is what the current patch does both for TCG and KVM.
> >
> > If it does this for both TCG and KVM then I don't understand
> > this bit from the commit message:
> >
> > # Without this patch EDK II with TLS enabled crashes when hitting the first
> > # floating point instruction while running QEMU with --accel kvm and runs
> > # fine with --accel tcg.
> >
> > Shouldn't this guest crash the same way with both KVM and TCG without
> > this patch, because the FPU state is the same for both?

> By default `qemu-system-riscv64 --accel tcg` runs OpenSBI as firmware
> which enables the FPU.
>
> If you would choose a different SBI implementation which does not enable
> the FPU you could experience the same crash.

Ah, so KVM vs TCG is a red herring and it's actually "some guest
firmware doesn't enable the FPU itself, and if you run that then it will
fall over, whether you do it in KVM or TCG" ? That makes more sense.

I don't have an opinion on whether you want to do that or not,
not knowing what the riscv architecture mandates. (On Arm this
would be fairly clearly "the guest software is broken and
should be fixed", but that's because the Arm architecture
says you can't assume the FPU is enabled from reset.)

I do think the commit message could use clarification to
explain this.

thanks
-- PMM


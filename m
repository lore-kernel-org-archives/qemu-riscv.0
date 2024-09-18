Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9E4CCD1A0
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 13:57:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sqvB8-000622-85; Wed, 18 Sep 2024 09:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sqvB3-0005zM-Et
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 09:57:05 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sqvB0-0001sn-4P
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 09:57:04 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8a7cdfdd80so830073766b.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 06:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1726667820; x=1727272620; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jw9R7zHcU6wAlHrH9jZChqK3i5AsMOvAHMYccAaAi1I=;
 b=kFJebzrS9808ph+BOh4rDcBqZb3BhwrYQEFxVuLM3U3/xW+4XfpZlUj1XJGx9RkNmy
 HLZQ4lwN58pmVR/7/XMoaRyWR0N9OldUAdlNObF66tEp0bDLxTKnbM779Y/EkHh/Skix
 +KoNiQBfhjsA9lHbx6CN0r3yiXuVXK320im2cz8DKruAAX08HYw2iqdzSupjfosVce8z
 lpGFKnlpzakWo4ra7aPBrro7IXQvURAmIBQ88qGR3DfOp+R4vORH6wjRA5j7fa1jbqkv
 EcbhtRTjjZkwgznCSR8PeA+EQpH47eT4v3gjfuOp/Oxdxlp2mrphdWPDWrr6YisJUygk
 L5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726667820; x=1727272620;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jw9R7zHcU6wAlHrH9jZChqK3i5AsMOvAHMYccAaAi1I=;
 b=GlauuPvsduMzR8372L8fSAw8kkqDx8X/Swlipiznp2RBaoxjc8jBFy49VW0o9EFApi
 vD9a4QWimqmSDe+sWBeJNXAxmMsYVl2YftIOrHDEX6tTPTNmKrR0cNq/c966G1YEz7wO
 x+9+kQYPBnV0sJ1tmDQYtC8ghprLdzOoZZyJtgCbOvo0dyc4IZuY7nM9jgmlRo8cgZLE
 /29sQDyiTfROg29etFqt8nfJcwio9D/lCmt/3IATFKKiNt0BAH83oQf8yGfgud3x5Xpr
 grh7jsXBZX9hGLV/V2ct792E5VkhRR0Rlufpq4uQFFx2n9V0eftp9rhQ1Yd3To02oLsr
 TdGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaaxMzovXB7mB+W8PNZNw4c6VLd25Ek4nBIQac/hSLUMjnvtxZ/+cnQI8ICfLS89qTHYd6pmPw5KkA@nongnu.org
X-Gm-Message-State: AOJu0YyKoQT5n6LfxQ00wACvaNQkwKFTBqXXXcC7CBEcYdnV2nd5r0X1
 cIANCcrXPwAB3pVOgkNu3i7DPeuqhSLp58cnF/yL80L7akcUsnM02GM6pzIilpI=
X-Google-Smtp-Source: AGHT+IEnUf2BBLrMw6AF9knDQNnY2Bh71rIsr9GcMfumfal10/pMPKRiwjmEtak/OEyud7HuRes7Yg==
X-Received: by 2002:a17:907:971b:b0:a89:ffd0:352f with SMTP id
 a640c23a62f3a-a90481045d7mr2005808166b.48.1726667820268; 
 Wed, 18 Sep 2024 06:57:00 -0700 (PDT)
Received: from localhost ([83.68.141.146]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a906109662fsm594583266b.38.2024.09.18.06.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 06:56:59 -0700 (PDT)
Date: Wed, 18 Sep 2024 15:56:58 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
Message-ID: <20240918-4e2df3f0cabdb8002d7315d9@orel>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
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

On Wed, Sep 18, 2024 at 03:49:39PM GMT, Heinrich Schuchardt wrote:
> On 18.09.24 15:12, Peter Maydell wrote:
> > On Wed, 18 Sept 2024 at 14:06, Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> > > Thanks Peter for looking into this.
> > > 
> > > QEMU's cpu_synchronize_all_post_init() and
> > > do_kvm_cpu_synchronize_post_reset() both end up in
> > > kvm_arch_put_registers() and that is long after Linux
> > > kvm_arch_vcpu_create() has been setting some FPU state. See the output
> > > below.
> > > 
> > > kvm_arch_put_registers() copies the CSRs by calling
> > > kvm_riscv_put_regs_csr(). Here we can find:
> > > 
> > >       KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
> > > 
> > > This call enables or disables the FPU according to the value of
> > > env->mstatus.
> > > 
> > > So we need to set the desired state of the floating point unit in QEMU.
> > > And this is what the current patch does both for TCG and KVM.
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
> > 
> > -- PMM
> 
> By default `qemu-system-riscv64 --accel tcg` runs OpenSBI as firmware which
> enables the FPU.
> 
> If you would choose a different SBI implementation which does not enable the
> FPU you could experience the same crash.
> 

Thanks Heinrich, I had also forgotten that distinction. So the last
question is whether or not we want to reset mstatus.FS to 1 instead of 3,
as is done in this patch.

Thanks,
drew


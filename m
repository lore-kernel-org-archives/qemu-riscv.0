Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2765CCD1A0
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 13:13:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1squUU-0005xM-Dt; Wed, 18 Sep 2024 09:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1squUS-0005u2-AO
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 09:13:04 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1squUQ-0004yk-DM
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 09:13:04 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f77fe7ccc4so59675011fa.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726665180; x=1727269980; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1UIao/Jz5H8HMYQFxpoEYcHdlz/BHFAG+1NToY/M7y4=;
 b=uC3wh7ofxzBlYtYf8fC6jrxngnOUjxUnyD50bL3Xgmda0EZAV/C9oW2owVpvuTnwwV
 xNkaF6hynUZgmHeTNW2osOeYy+Yyl1N7A15L9ooTdsqvOexEz8aHpnYHtFAiZ+IDgE4s
 iPV4/VPgeJpTAIZrc8FllLZgqU93IX4KAtEOuVcDLRxJPXzekpGuEm6NkzOWXOeSA+cS
 e87yMxdjfHnFZwqRUxZYZo60lX4oaZOoZHLInWMgPq1veZrYxNUw2ZDMS0AdYFrXhp7F
 ZAw9VH2er2FWE5KHRkPXv+WrTEhPKa1sYiTuso69TzRi/C1KA6yd3rfRmp8tP8uu9PYA
 Kk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726665180; x=1727269980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1UIao/Jz5H8HMYQFxpoEYcHdlz/BHFAG+1NToY/M7y4=;
 b=U17Lk3r5/ZEId0nIbjey5Yo0LYdOOyAgp4PnjiA5LhywYK8p4hHoKVpaRQC9enfHIW
 cYabA0EXoSB2D0C9Na6rrb/stG581XyCTl+iOhkKYqg+Di46poukiTOGufJ7CH1zKN+J
 bh1Tm83J8Ky9bTVe4ZETi0FPM8rrQG6AdjMT+hac9spBb+qPBcMW753RlRi/bjLAuZTv
 z1XzvaJjzxqs8JIF4qPAMvy2lx9WiP5AafAGOKrGHyfVspKOqC78G8I74EuNX0PWv4Zh
 cuDjV6QQm9+BKh2b/KJr4LEOpXpKW3ws5+Gy65fh797owHB9R74govq0/7POUMhNufE1
 8tiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp+v6mvyg3k6BDFJg6iVrIXPttfjVbvZdTsRnQmC+NaJChrvcRMYzb8ofTSE7Tm+gusZLxEucWf7my@nongnu.org
X-Gm-Message-State: AOJu0YyELE3gaZUKTau/Xm+/LGERQFazP8eBp+WTDeJEFfY3Gtp81DOa
 SHoOlYMw0eo4JUeX96KVmAMsX5wRVUqwSHzCjPZwDpC3kv/PE2vc351ot4VAr0fpH05SHy99gmQ
 +jyfPA8yf9ZxFdXAJD+3f/s9wYPEAFLIwxpb31rImkkecE2VKaeQ=
X-Google-Smtp-Source: AGHT+IF5izfJa+xhgK0mjYVqlKJIK89IcU1cb1NpZfcXm0pryp2o/BMT6N8z0wfXVAWqfUbW+2JjG7UdxmVTGR7xheE=
X-Received: by 2002:a05:651c:509:b0:2f3:fd4a:eac6 with SMTP id
 38308e7fff4ca-2f7919fe8d6mr81760011fa.18.1726665180209; Wed, 18 Sep 2024
 06:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
 <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel>
 <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
 <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
In-Reply-To: <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Sep 2024 14:12:48 +0100
Message-ID: <CAFEAcA-L7sQfK6MNt1ZbZqUMk+TJor=uD3Jj-Pc6Vy9j9JHhYQ@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 18 Sept 2024 at 14:06, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
> Thanks Peter for looking into this.
>
> QEMU's cpu_synchronize_all_post_init() and
> do_kvm_cpu_synchronize_post_reset() both end up in
> kvm_arch_put_registers() and that is long after Linux
> kvm_arch_vcpu_create() has been setting some FPU state. See the output
> below.
>
> kvm_arch_put_registers() copies the CSRs by calling
> kvm_riscv_put_regs_csr(). Here we can find:
>
>      KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
>
> This call enables or disables the FPU according to the value of
> env->mstatus.
>
> So we need to set the desired state of the floating point unit in QEMU.
> And this is what the current patch does both for TCG and KVM.

If it does this for both TCG and KVM then I don't understand
this bit from the commit message:

# Without this patch EDK II with TLS enabled crashes when hitting the first
# floating point instruction while running QEMU with --accel kvm and runs
# fine with --accel tcg.

Shouldn't this guest crash the same way with both KVM and TCG without
this patch, because the FPU state is the same for both?

-- PMM


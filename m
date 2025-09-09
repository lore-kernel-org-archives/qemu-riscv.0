Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F869CAC583
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 16:51:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uw1Yk-00048P-GY; Tue, 09 Sep 2025 12:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uw1Yi-00046t-VH
 for qemu-riscv@nongnu.org; Tue, 09 Sep 2025 12:51:08 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uw1Yc-0006oF-DK
 for qemu-riscv@nongnu.org; Tue, 09 Sep 2025 12:51:08 -0400
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-41310b1ebc5so3962815ab.1
 for <qemu-riscv@nongnu.org>; Tue, 09 Sep 2025 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1757436657; x=1758041457; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Abo/pJutmKWJyRImXcynGOS4llqtC6EIoKnZjs6fDLs=;
 b=c06hN1F6coQqiGGdDh+ULC/aSdq9Dh4ZGwih2AgwA8Xqyld7ny5AnRSIPu+/GXswoa
 JCnYvjgJmhe6wgKijo/E5ZIEbUtggnArzZE5an8czG2YaPjh4B8p1o9ZcE+4LQUBYIyh
 W4CsLv0OiilfE6SgyItvKHQY/gEAWnCfwCiaUUb8O5MteXVyszBkG+wYWJIshxmXLu1J
 Yu085uxyGbI9SQE0jTid/2WgR3KN4zyijHS1Uqt6yhB0YOru8R47q0X/8fObZUycvikX
 IqaLyp9pm9i10ZOXE2l5ItNVpKbtoueDJoIGZ2/CfSYGCzvvUNjQtA/dzZ57WZ1uCif3
 RWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757436657; x=1758041457;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Abo/pJutmKWJyRImXcynGOS4llqtC6EIoKnZjs6fDLs=;
 b=M+f25cwkvCk75PXgjQPajmcEAwT1GULTbdGbJJia222NI4RX8pLeHjtjjQ4ofryJfO
 IxCOgHsc4GcBw6WUMlLj2gx8MmfRLL/qnsHzyA68GheKBwAw4GXzsHtPXewLOqvAZs8j
 acae1b/KYeBFKV3BizuwjeaqlC887jJ45LXnO6SVzihsUZTQTT4adl9R2DMKW0xh7BMJ
 wlldZUUlyC3FkVj4y4+EjCDcOt0cdZ+J13eJ+KfdB/YpeuFn5rIYkkfX3CZ0qFjTB6aN
 +r085HMOV3VOAogFbUeZUFDH1+1k0ugan61RlBgSVvqMM+eAAOpU9Swn9kgVYNFYrNSk
 mO9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlEyjo+BQ2BTwokZHywHOKrwl/WmA4V5FM+mPVcyh3olZeHUqWcGZTfb7Rjnz5zjDv5vhF5WQM96pV@nongnu.org
X-Gm-Message-State: AOJu0YwmNmxQVOxMikJZxDo3VI1+t/7kBPKhI3Ij90ZRDvsLW9OsTv/r
 gpl2HsDFnVRmN25HRF28NXtpV1gNl/MrIqwsiIPycxC9iBlM31ByAxFmVk3bkoZeBU8=
X-Gm-Gg: ASbGncsPVZtMOuGPX8MNt46pCOLC+dkOOwOUZKjlJDaCWvseZOHpCC5vgT4gKKw+qOq
 fIg0nAe9FClZDvqlMQQlFh08X40sHDA2sEq4mLxnBFz3SnbdnphGuXJUCP1uYYv2D+LMEYZkJSc
 C1YaxUET5IyPGjXPvFXFr2i5bS9KSsr9crcGQQGmaoSV48DWx4sQl0jEsvCQ2I6m3YPTV4L8D3a
 2qJRBK3ZNLA/0usdTK9or3CCVbOuj3D6W8wdOziGCxYHk4h2MgJW2oJXituJAQ/NKysVWe+G1fi
 OFYtNjMljenpB1ATondkhcF0vaFXzsoxv/CiChyn/dWhLR60IU4Sr2YpfM3H5HIEuXJC+Q1x1dQ
 o3pLg5psgZ0VcSH7LcXd/OQ3M
X-Google-Smtp-Source: AGHT+IE2B+lyMQ1D0hyEyDWRm/v6BuCgDu2OLgKxI5/+4PvKrkpU3Yx5unLV7bCqh9YsRrgtx4gBzg==
X-Received: by 2002:a05:6e02:450d:b0:3fb:fda6:5b7a with SMTP id
 e9e14a558f8ab-3fbfda65caemr171516925ab.4.1757436657276; 
 Tue, 09 Sep 2025 09:50:57 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5103ba7ba7dsm5758949173.12.2025.09.09.09.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 09:50:56 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:50:56 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Xie Bo <xb@ultrarisc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 anup@brainfault.org, alistair.francis@wdc.com, rkrcmar@ventanamicro.com, 
 palmer@dabbelt.com, xiamy@ultrarisc.com
Subject: Re: [PATCH v5 for v10.0.0 1/2] =?utf-8?B?dGFyZ2V0L3Jpc2N277yaU2V0?=
 =?utf-8?Q?-KVM-initial-privilege-mode?= and mp_state
Message-ID: <20250909-3b874759e3bc0b6554028032@orel>
References: <20250818-e7e56e26bbf62a23417c2567@orel>
 <20250909090917.21301-1-xb@ultrarisc.com>
 <20250909090917.21301-2-xb@ultrarisc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909090917.21301-2-xb@ultrarisc.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=ajones@ventanamicro.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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


Remove the dashes in the summary (Set-KVM-initial-privilege-mode).

On Tue, Sep 09, 2025 at 05:09:16PM +0800, Xie Bo wrote:
> For KVM mode, the privilege mode should not include M-mode, and the initial value should be set to S-mode. Additionally,patch 2 adds the implementation of putting the vCPU privilege mode to KVM. When the vCPU runs for the first time, QEMU will first put the privilege state to KVM.If the initial value is set to M-mode, KVM will encounter an error.

Don't reference "patch 2" in a commit message. You may say something like
"a following patch".

> 
> In addition, this patch introduces the 'mp_state' field to RISC-V vCPUs,following the convention used by KVM on x86. The 'mp_state' reflects the multiprocessor state of a vCPU, and is used to control whether the vCPU is runnable by KVM.
> - The bootstrap processor (cpu_index == 0) is initialized with KVM_MP_STATE_RUNNABLE.
> - All other vCPUs are initialized with KVM_MP_STATE_STOPPED.

This is just stating what the code does. What we should put here is
_why_ we choose cpu_index 0 to be the only runnable cpu. Is there some
reason? Or is it just because it's the first cpu and we'd otherwise need
to randomly select a boot cpu.

Use newlines to format commit messages, breaking around 70 chars. The
text is also missing space after commas and periods.

> 
> Signed-off-by: Xie Bo <xb@ultrarisc.com>
> ---
>  target/riscv/cpu.c | 11 ++++++++++-
>  target/riscv/cpu.h |  2 ++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 09ded6829a..5fa48c1485 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1042,7 +1042,16 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>      }
>  #ifndef CONFIG_USER_ONLY
>      env->misa_mxl = mcc->misa_mxl_max;
> -    env->priv = PRV_M;
> +    if (kvm_enabled()) {
> +        env->priv = PRV_S;
> +    } else {
> +        env->priv = PRV_M;
> +    }
> +    if (cs->cpu_index == 0) {
> +        env->mp_state = KVM_MP_STATE_RUNNABLE;
> +    } else {
> +        env->mp_state = KVM_MP_STATE_STOPPED;
> +    }
>      env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>      if (env->misa_mxl > MXL_RV32) {
>          /*
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 51e49e03de..4b1c5bf0e4 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -256,6 +256,8 @@ struct CPUArchState {
>  #endif
>  
>      target_ulong priv;
> +    /* Current multiprocessor state of this vCPU. */
> +    uint32_t mp_state;
>      /* CSRs for execution environment configuration */
>      uint64_t menvcfg;
>      target_ulong senvcfg;
> -- 
> 2.43.0
>

Thanks,
drew


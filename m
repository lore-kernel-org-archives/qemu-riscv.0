Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7828CAC58D
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 12:46:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uwghD-00011k-Fr; Thu, 11 Sep 2025 08:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uwgh8-0000xP-EU
 for qemu-riscv@nongnu.org; Thu, 11 Sep 2025 08:46:34 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uwgh2-0004FW-JG
 for qemu-riscv@nongnu.org; Thu, 11 Sep 2025 08:46:33 -0400
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-88432e29adcso18516839f.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Sep 2025 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1757594785; x=1758199585; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZrMI/UQCPUOK+lYpzzNGXyFkKmZBkCOOrg3ZVSWqMFY=;
 b=cxTCOsQXEyto+t4bU28FnXS6/uqbShJidqAP9ubiqu+VpnqgCjPOjcplBAw8I0/b9q
 2hbuLmW/+lMNsD5k/DQaYczLDt//O6BG10urv+27K7bN900ZZtBSBfGMapzERYGej1J2
 XU5IYjjQCPEqwDsL8Hi+9dP+4FVCKQZmfsq0kOQgQd3BnLpWKOgpJZk1AO8p8b/jmZn0
 VLsCCtpXkpYHb0pcYzSzKS7nZjsr2sOTN09kus9TnM/3B4BxRZHJ6Tu+vEcm9oK2Q+97
 IS+k5MPIef2Z60otkm9wAGN/fmAGCDqDb2psy6DgwHndxSGzaaiuM5Y9JDVRTZENirZw
 udsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757594785; x=1758199585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZrMI/UQCPUOK+lYpzzNGXyFkKmZBkCOOrg3ZVSWqMFY=;
 b=BJeD2Xt54Wyrxa7LbsF9kBrlWVOsUEDW8bcx/QE3gaWivh3bv10ZngbMZStGzm1OWQ
 CRmWv5OI9pJom89bVqr/PcpHehN38MWlQpwCrJwUJ1MztdC75GM+f2RRQVmLvePY7j91
 TQu+X/rFBZap6QVrZu7GntSoT6OTO+J4Lzx0s5nChNb6XmmAkQ+gdvR9gTWJ9elh/Th7
 LdDootb/cmG4W9l5BDT3SiDh7AbtDsQwqJlO/zKxjiuvVZtftkzcfSBn1JEn1NVCx3GF
 OXRGWBrpCWeX26Gm0hFjjgpDbantpSzMIf1T+99iUTY7c/bbqD8JF2xKq7wCjBf4g5ds
 o71A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8J2Qg3x1btB1+DxXSCGklaMjd5voKEF109pz7NSef2aMBMaTqYQT7vRe1Kpg1eBJ1ltZvRxcchz/D@nongnu.org
X-Gm-Message-State: AOJu0Yxko02vd1NRIVCcDep2qxFwesASB4d3AY1p+ii80B6dBpHhQ836
 6+1Tfkqi94phUukLRTwgqdMGjkuYz09TY9fweHzIrap9sJ73sGOibAts+tpFalmm8lk=
X-Gm-Gg: ASbGncs2oiBxhko215ptZAEE3b/lvpev8733iu8OZZkGJQQP6aB9dpiJQoyCoLE1qCE
 cce169K+L7dWlqhfRmBUZS+2bDEw+i2Vk4RUOLWIzwQWk3kEQZ0r9pVL+05lEZn6vmklDEECBb/
 ahNkEVj4nacF2z2pWmXPv/PYJuSbKjSA59HsnlOeeP35bGfVOcc9CFzC5ud+68Fd87/Zwdt5jrY
 dULoQBLFW9GcfXYIjC/cHBl8GVukdvBFm0Ci5tqhS2MCPh+4R548i3uooBjsE3s5agBGgU88Eyz
 ARzv7VXac4rRXYzM1pMUgU4F1xOd1e//XpOsOvQv09CuKUaL/4ArAoUXrA7OMQOY6QBwNGhVIx2
 HFPC6twJbEw9pxiJZqeiv/ShfbOQ3RMyT0VU=
X-Google-Smtp-Source: AGHT+IFwEd/ORFVt79NhnL5cGBqEHtyXZpA8Ltmn4DyQFoyRY2/vbHU5V5Yqnhq5V5qFX0Brdi2ZQQ==
X-Received: by 2002:a05:6e02:b4c:b0:405:5e08:a3e4 with SMTP id
 e9e14a558f8ab-4055e17ea60mr205917515ab.1.1757594785530; 
 Thu, 11 Sep 2025 05:46:25 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-511f2efcd0csm564275173.5.2025.09.11.05.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:46:25 -0700 (PDT)
Date: Thu, 11 Sep 2025 07:46:24 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Xie Bo <xb@ultrarisc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, mjt@tls.msk.ru, 
 pbonzini@redhat.com, anup@brainfault.org, alistair.francis@wdc.com, 
 rkrcmar@ventanamicro.com, palmer@dabbelt.com, xiamy@ultrarisc.com
Subject: Re: [PATCH v7 for v10.0.0 1/2] Set KVM initial privilege mode and
 mp_state
Message-ID: <20250911-de7f0f79263432894c875141@orel>
References: <20250911083617.1173094-1-xb@ultrarisc.com>
 <20250911083617.1173094-2-xb@ultrarisc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911083617.1173094-2-xb@ultrarisc.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=ajones@ventanamicro.com; helo=mail-io1-xd31.google.com
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

On Thu, Sep 11, 2025 at 04:36:15PM +0800, Xie Bo wrote:
> For KVM mode, the privilege mode should not include M-mode, and the 
> initial value should be set to S-mode. Additionally, a following patch 
> adds the implementation of putting the vCPU privilege mode to KVM. 
> When the vCPU runs for the first time, QEMU will first put the privilege 
> state to KVM. If the initial value is set to M-mode, KVM will encounter 
> an error.
> 
> In addition, this patch introduces the 'mp_state' field to RISC-V 
> vCPUs, following the convention used by KVM on x86. The 'mp_state' 
> reflects the multiprocessor state of a vCPU, and is used to control 
> whether the vCPU is runnable by KVM. Randomly select one CPU as the 
> boot CPU. Since each CPU executes the riscv_cpu_reset_hold() function 
> and CPU0 executes first, only CPU0 randomly selects the boot CPU.
> 
> Signed-off-by: Xie Bo <xb@ultrarisc.com>
> ---
>  target/riscv/cpu.c | 17 ++++++++++++++++-
>  target/riscv/cpu.h |  2 ++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 09ded6829a..f6c787ebdc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -38,6 +38,7 @@
>  #include "kvm/kvm_riscv.h"
>  #include "tcg/tcg-cpu.h"
>  #include "tcg/tcg.h"
> +#include "hw/boards.h"
>  
>  /* RISC-V CPU definitions */
>  static const char riscv_single_letter_exts[] = "IEMAFDQCBPVH";
> @@ -1031,18 +1032,32 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>  #ifndef CONFIG_USER_ONLY
>      uint8_t iprio;
>      int i, irq, rdzero;
> +    static int boot_cpu_index;
>  #endif
>      CPUState *cs = CPU(obj);
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(obj);
>      CPURISCVState *env = &cpu->env;
> +    MachineState *ms = MACHINE(qdev_get_machine());
>  
>      if (mcc->parent_phases.hold) {
>          mcc->parent_phases.hold(obj, type);
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
> +        boot_cpu_index = g_random_int_range(0, ms->smp.cpus);
> +    }
> +    if (cs->cpu_index == boot_cpu_index) {
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


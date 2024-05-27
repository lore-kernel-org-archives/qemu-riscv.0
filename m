Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B3FC25B78
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 May 2024 15:49:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sBcaQ-0000eq-Eh; Mon, 27 May 2024 11:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sBcaN-0000e4-Sb
 for qemu-riscv@nongnu.org; Mon, 27 May 2024 11:48:31 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sBcaI-0005nH-UJ
 for qemu-riscv@nongnu.org; Mon, 27 May 2024 11:48:31 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a62972c88a9so257594566b.1
 for <qemu-riscv@nongnu.org>; Mon, 27 May 2024 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716824905; x=1717429705; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XyGgKIkmTttpkmw/7ox8RUECmAQTYLavTGpRT6uRqdE=;
 b=Xc5gKQFJpJOR5DhxYrg58QvZXxVTPNxhjoCWaSEWMxoDN4221JK53Lol5xqBYXRii7
 by87aIEUxMlnH2erW4aLC4kHBJ4m+zc1cAsjhMslVbca0I26zGCMzKE1iKuQ6kNYXwd/
 Z3eDWGNBv6D78UoVsdhDDiaCyKnizzn0yjvxfCVWCjyMp4ODxzYR+wI8HTqyOe+CKhjU
 x4SG2O01nOGSIbR2Hwj/qKVjTvKGFc6J8Aoyj5MW7gnMRCyzosvXE16wgzeyXYt/RQ0M
 Khvk0dgBRT8kdopadtNSs4EPk9PGVP1w1ZDzFuvpj6rkzOTKQVB2tJyZWUaEjwf5pQy2
 HwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716824905; x=1717429705;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyGgKIkmTttpkmw/7ox8RUECmAQTYLavTGpRT6uRqdE=;
 b=H8LWXvGKq3i02QHF5kReGCX8WYPjsawauwLPcDfCCf1jQXA5R05mEwFg4U8RZqkRwG
 fbK+vZId5Qxdv3O5CQ2fCGOwAQDUO2yYSRH8Zbybct+ZNuK+6vvptCMdR1CubLEvBIQj
 P01vkq9gz2XJbRjoV4PIDyTONK0Eo6jOtST3Dt4QvCrlV9AKEwYdVhFHYzN/I7MUubFL
 QbL8ezpUoTJF+5VFNND21Ggm+5kZj/gx5inm2iJO0Ey61SHpcyroc7EtA+30eUdl8s6a
 opB9YHXdyWXC76WbZbT012eQpeAuRNz0bU4DtI37m5oF1VREasKromcJ/GE5BQ7Zl/nk
 m3/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1iFJrikFCl/R/rfm+OzBBH2Ly/UAZLXwuJqHTIWhUH05DvSKMOu8GtH7G4M0VGuv+k56S4AqjLqpz5khBVlP9x6F7eng=
X-Gm-Message-State: AOJu0Yw4DFbNYCJyXZh+LD69VorIZM19VBQVAk5JScjUs0998cP63E2d
 wU12wjXJJWPhA+rSZrHpBElgWKYnmPHXcXnVtnFueJ1B/4gSrzTHw9Gr5mt6FtQ=
X-Google-Smtp-Source: AGHT+IF3EvT3HVB2jvBnunDQnTqJd8fOv2PfVYBdDuRbTk7DG1bNSMndfiIltz/dXEjbrfvttgZjlA==
X-Received: by 2002:a17:907:82a5:b0:a59:d39a:8d65 with SMTP id
 a640c23a62f3a-a62641b9de4mr561588366b.21.1716824905010; 
 Mon, 27 May 2024 08:48:25 -0700 (PDT)
Received: from localhost ([176.74.158.132]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc4ff24sm507445566b.130.2024.05.27.08.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 08:48:24 -0700 (PDT)
Date: Mon, 27 May 2024 17:48:23 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Chao Du <duchao@eswincomputing.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 alistair23@gmail.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, 
 anup@brainfault.org, duchao713@qq.com
Subject: Re: [PATCH v1 3/4] target/riscv/kvm: handle the exit with debug reason
Message-ID: <20240527-c55d280af95ef901fb715dc0@orel>
References: <20240527021916.12953-1-duchao@eswincomputing.com>
 <20240527021916.12953-4-duchao@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527021916.12953-4-duchao@eswincomputing.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, May 27, 2024 at 02:19:15AM GMT, Chao Du wrote:
> If the breakpoint belongs to the userspace then set the ret value.
> 
> Signed-off-by: Chao Du <duchao@eswincomputing.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 0bc3348b91..0c45e520b2 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1555,6 +1555,21 @@ static int kvm_riscv_handle_csr(CPUState *cs, struct kvm_run *run)
>      return ret;
>  }
>  
> +static bool kvm_riscv_handle_debug(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +
> +    /* Ensure PC is synchronised */
> +    kvm_cpu_synchronize_state(cs);
> +
> +    if (kvm_find_sw_breakpoint(cs, env->pc)) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>  int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>  {
>      int ret = 0;
> @@ -1565,6 +1580,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>      case KVM_EXIT_RISCV_CSR:
>          ret = kvm_riscv_handle_csr(cs, run);
>          break;
> +    case KVM_EXIT_DEBUG:
> +        if (kvm_riscv_handle_debug(cs)) {
> +            ret = EXCP_DEBUG;
> +        }
> +        break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
>                        __func__, run->exit_reason);
> -- 
> 2.17.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


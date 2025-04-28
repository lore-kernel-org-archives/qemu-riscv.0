Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8979C36005
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 07:02:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9IUH-0007gq-06; Mon, 28 Apr 2025 03:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u9IUC-0007Y7-Fl
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 03:01:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u9IU8-0002bG-6n
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 03:01:04 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso34915535e9.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Apr 2025 00:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745823657; x=1746428457; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MamdC0jArYaqUu++xBB54BJf9CBHcn1k953vhqqVTdM=;
 b=aOdplhcP6HqwNH208NIOc/ImVKbEuITL23W3rElpICkJWGBE3tjibaVjOe+AwejCJG
 KEPDbFbd67MLZJhhQi3UVYb1jfQTa85Ytw+h67iYnZhrJ333fGU9Uko7iqjDceb09gq7
 TgKceBIGTsP1WtAQOPaE+frB0OcU2ClEOaAGQ4CuK1asLLPifdfjiTXkp1dqoy8RTC3e
 bLVzf8+PN8mQYQDV25HUtbqJ670nQWuLTXz+yUu4Ju1dOUjyERx+aQHOXG1pI8aeOMPj
 23MYGfP2ETSondtpbuWtA0HdJf++TZ5pB9h4+xVX3ANvVt0nKvlMeC9hx13PJBVAJPer
 oPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745823657; x=1746428457;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MamdC0jArYaqUu++xBB54BJf9CBHcn1k953vhqqVTdM=;
 b=nHa/UFZLqfcCCjTu+J1K8I+ItdFv2G9Ldsinka6593FeP2Rk5rrweqHhf7UdDx5pln
 AfSeRzrcIlF0RD7I4AyiDZqmcho1bd267zS1Jba5mSmSBQYvn43cYMVi2tdqEYqGNUJg
 1+j62BNoXiJu0kWZKohMWKe3ordWTRnIL92wxr/FAXPjmjKCjkPyysm5g17m1xjw9lIp
 suIl5LAiuNt+PtNyPjLjcog+OFyrCmcuSpzAqYFbYmnqC/BvyftJhgQAmpb10ngIchZ+
 /etWU4YT0aznELd87iXkW0arYvhSfkdmlWTzpZ46LKMcCjqKTeC6DX+MgXg/hsY91GXE
 xfaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVvwp7NQtZf8yn75K0A/y10AfU7Bu6aftH9jgXO/+BXgcqI0gyJqaGfJqMEUWeRAdgP83udBlHo0w8@nongnu.org
X-Gm-Message-State: AOJu0YyOSYmBrUMNT6L0lsrJ0Cju1ITWSL12EQKssVw95BQ5RpBr6T88
 xbEfzJYqAQjQohJhbvm0Dv65F2nB0cAlY1SQYRmDpldCdfwN9lcMU9TL8sfTwos=
X-Gm-Gg: ASbGnctDhMp3oj51wkdlDgVOKncQpbLDE9w3b/e9LkgMiLwJXAGGhcwzAFrtCSdJghD
 27WCz731WrqR1Kl/4C+/H4tptVD5nhJpjMAuyiG96h4YkQBtM+gPfedrcqiwA7ftquXtS35dSBc
 y/rsUR2JSnzVIRlnnx1oREtzUhWMFe0mSu5VFAcIOYD7dJ2WgycRpMt/7pSUnuwu7PpobjjTwU/
 25s5yj400QzX8QzquVyklX3574OaECzy8ueGfXubdS5IgNhXPwr3HyNeuMLuShbp7x2OcOoklE5
 TWbVYlxUh5UCdfdDfmrBxv5PHm8fMgT9Rw9Jz8gcHMOeuCKzUYB9a5J9efiivChfuc4c4A==
X-Google-Smtp-Source: AGHT+IGsLMzRpdgJAn4dK+qT1sDbOkPfB1ataffIge1MAsoMwNBbB3vQ0pEu3tPgIntL/vnRSouSDg==
X-Received: by 2002:a05:600c:5028:b0:43c:fda5:41e9 with SMTP id
 5b1f17b1804b1-440a66b6f63mr110428755e9.31.1745823657580; 
 Mon, 28 Apr 2025 00:00:57 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a531dc6csm112845115e9.24.2025.04.28.00.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 00:00:57 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:00:55 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Meng Zhuo <mengzhuo@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH] target/riscv: add satp mode for kvm host cpu
Message-ID: <20250428-00fc862d2d2d628ffa4c8547@orel>
References: <20250427132557.1589276-1-mengzhuo@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427132557.1589276-1-mengzhuo@iscas.ac.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x331.google.com
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

On Sun, Apr 27, 2025 at 09:25:57PM +0800, Meng Zhuo wrote:
> This patch adds host satp mode while kvm/host cpu satp mode is not
> set.

Huh, the KVM side[1] was written for this purpose, but it appears we never
got a QEMU side merged.

[1] commit 2776421e6839 ("RISC-V: KVM: provide UAPI for host SATP mode")

> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2931
> Signed-off-by: Meng Zhuo <mengzhuo@iscas.ac.cn>
> ---
>  target/riscv/kvm/kvm-cpu.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 5315134e08..942f942b25 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -953,6 +953,21 @@ static void kvm_riscv_destroy_scratch_vcpu(KVMScratchCPU *scratch)
>      close(scratch->kvmfd);
>  }
>  
> +static void kvm_riscv_init_satp_mode(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    int ret;
> +    uint64_t val;

Please add a blank line here.

> +    reg.id = RISCV_CONFIG_REG(env, satp_mode);
> +    reg.addr = (uint64_t)&val;
> +    ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +    if (ret != 0) {
> +        error_report("Unable to retrieve satp from host, error %d", ret);
> +    }
> +    env->satp = 1 << val;

We need to expose set_satp_mode_max_supported() and then call it here
instead of setting env->satp. At this phase we're just figuring out what's
supported by KVM. riscv_cpu_finalize_features() will then sort out what's
supported by KVM and what's selected by the user (if anything) in order
to determine what mode should be used.

> +}
> +
>  static void kvm_riscv_init_machine_ids(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>  {
>      CPURISCVState *env = &cpu->env;
> @@ -1212,6 +1227,7 @@ static void riscv_init_kvm_registers(Object *cpu_obj)
>      kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>      kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
>      kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
> +    kvm_riscv_init_satp_mode(cpu, &kvmcpu);
>  
>      kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
>  }
> @@ -1891,7 +1907,16 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
>          }
>      }
>  
> -   return true;
> +    RISCVSATPMap *satp_mode = &cpu->cfg.satp_mode;
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (!satp_mode->init && env->satp) {
> +        satp_mode->init = env->satp;
> +        satp_mode->map = env->satp;
> +        satp_mode->supported = env->satp;
> +    }
> +
> +    return true;

Other than the indentation fix, none of the above hunk is correct or
needed.

Thanks,
drew

>  }
>  
>  void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
> -- 
> 2.39.5
> 
> 


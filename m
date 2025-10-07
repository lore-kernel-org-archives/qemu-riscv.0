Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F3BCCA476
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 13:31:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v67ly-000143-Bf; Tue, 07 Oct 2025 09:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1v67lu-00013K-De
 for qemu-riscv@nongnu.org; Tue, 07 Oct 2025 09:30:30 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1v67lb-00057y-AN
 for qemu-riscv@nongnu.org; Tue, 07 Oct 2025 09:30:30 -0400
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-4248b34fc8eso65937255ab.3
 for <qemu-riscv@nongnu.org>; Tue, 07 Oct 2025 06:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1759843803; x=1760448603; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5u6Ur4oT6s0jXoCTIiLRdpi+SLDQablwl5SIadoUr04=;
 b=X8nYhkhqYW1IoNADw7W8kDtPSfzz/uRw7PnWp20U9WCNNE1RXHj9Uwyk0keLL2QBA/
 m57Egtn1n2IVu9OnVvp61PYd843UMJ+15GWybz8J8m+XLk9miWzVOMOyEYBMuUufnglz
 5LqcjJXjqwcxh9EQn3TvsLN8qAIZXfroSWHWUNJpteIlOoROolW8YI6riHFoolD01/NM
 8IWXzUmJAY+uwhMyRnfrdUNiTQHvh9t3NlacZvp4i6jZSwOoSH1j4GdJSMHLuitTLGzh
 I95F8WJeppz4WVs0mCDh8/wPeMW/hWuD5RYW3ZlDMWsfWuUE8aQIUHiz4RKt4OaTwyX+
 UziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759843803; x=1760448603;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5u6Ur4oT6s0jXoCTIiLRdpi+SLDQablwl5SIadoUr04=;
 b=RPAJLIlY8S4z4gnGEfeziTuSwDZ1X4bj0U3nHtuE1zm/bFKr12cZou1LpKEvRB37XO
 hXeD0IkP5LX2BAE70L3T1ktd++L67XHwoDAKidKNBOkfYOb6Pop4A1RSTS1fDPnVnV4G
 OG7+6T/InVW15xVioAVzkdAcXUc8pTVmPbqaeLuxtOIxspUyW4xltB/aVmNm8R6idpO9
 RRUwVWxg8M3QBGhDDdyOOCR7nOV3J/C9TDoipOcW/iMZTVHJtraL3fF59v6Xh23fkXXW
 8AYHMnxsBT2BAvHTEKjBe79j/yGmV7NTJfUb1fWpmv3Z/wvlDKrboL/bi+ZN1oM8hW43
 y61A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmeXakKkQ024SpMtLO4W0DhlYCjadgyiHEzA1aDX2gFdzU71PcYNr+cI1xHjCuk4I0ozmhQkGsg8MY@nongnu.org
X-Gm-Message-State: AOJu0Yxnt4MMmrYQ71pPSxkFIryyir2SWlSSzq5u19pEkwVTF0SamDpF
 j/9vcU+uPO45O5l1aXosmeMfS6DCSWZ3yjiJ5AEVQuQfqAoHnyNLzUHNeGeNt+AnMLo=
X-Gm-Gg: ASbGncvMfHm3RThxRRFlnrXykzOfpEmnIIoPDF01qEDISLZq8MYSETpm91IBHA4F+ug
 BMDNoInBj+mpXBqxy1Desk8LGgzXtZaSOXTJFn6iFdq59jtEOywJz8Zgt7/zMZU/WGhN4A0OG2B
 m+w4BYoUMV3+QoXllvZGxjGo7JEgGAhHqVZ/qx4Fge8vmS9owGX4xAjN8UWajBQ/F+ICipJGAAU
 TB/G8teXZ4PjJe7Xm9DGQZEQu4rXr6ZQLKa9Ej1SjGUawxq8k9NF1TmXUSkkMoZ4iKElAUp5XyL
 VjNa6NVHmtVQTxZmDbdehLtUJfSQfYGjyvpv9kCgMtfXZfe954vpqus8UUy3vFA8hnvLg3Kmstp
 pMhb+WGw8IS0f7IS+MQy5IcdnHous2iP1FF2ZA7EvW+Clt5be
X-Google-Smtp-Source: AGHT+IH4v0smDXGJoO2/bNfPuuXziacLVjQ6SQwubdaf2LC1SFVxIjbd2i4GmNAZcFHgw8u2RhgIHw==
X-Received: by 2002:a05:6e02:168e:b0:424:14a4:5064 with SMTP id
 e9e14a558f8ab-42e7ac437a1mr208082325ab.0.1759843802699; 
 Tue, 07 Oct 2025 06:30:02 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-57b5ec0b026sm6035706173.59.2025.10.07.06.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 06:30:02 -0700 (PDT)
Date: Tue, 7 Oct 2025 08:30:01 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Weiwei Li <liwei1518@gmail.com>, 
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Halil Pasic <pasic@linux.ibm.com>, kvm@vger.kernel.org,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, qemu-riscv@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 3/3] accel/kvm: Factor kvm_cpu_synchronize_put() out
Message-ID: <20251007-650e7ef70cc4591d1ef647f1@orel>
References: <20251007081616.68442-1-philmd@linaro.org>
 <20251007081616.68442-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007081616.68442-4-philmd@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=ajones@ventanamicro.com; helo=mail-il1-x130.google.com
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

On Tue, Oct 07, 2025 at 10:16:16AM +0200, Philippe Mathieu-Daudé wrote:
> The same code is duplicated 3 times: factor a common method.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  accel/kvm/kvm-all.c | 47 ++++++++++++++++++---------------------------
>  1 file changed, 19 insertions(+), 28 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 9060599cd73..de79f4ca099 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2935,22 +2935,32 @@ void kvm_cpu_synchronize_state(CPUState *cpu)
>      }
>  }
>  
> -static void do_kvm_cpu_synchronize_post_reset(CPUState *cpu, run_on_cpu_data arg)
> +static bool kvm_cpu_synchronize_put(CPUState *cpu, KvmPutState state,
> +                                    const char *desc)
>  {
>      Error *err = NULL;
> -    int ret = kvm_arch_put_registers(cpu, KVM_PUT_RESET_STATE, &err);
> +    int ret = kvm_arch_put_registers(cpu, state, &err);
>      if (ret) {
>          if (err) {
> -            error_reportf_err(err, "Restoring resisters after reset: ");
> +            error_reportf_err(err, "Restoring resisters %s: ", desc);
>          } else {
> -            error_report("Failed to put registers after reset: %s",
> +            error_report("Failed to put registers %s: %s", desc,
>                           strerror(-ret));
>          }
> -        cpu_dump_state(cpu, stderr, CPU_DUMP_CODE);
> -        vm_stop(RUN_STATE_INTERNAL_ERROR);
> +        return false;
>      }
>  
>      cpu->vcpu_dirty = false;
> +
> +    return true;
> +}
> +
> +static void do_kvm_cpu_synchronize_post_reset(CPUState *cpu, run_on_cpu_data arg)
> +{
> +    if (kvm_cpu_synchronize_put(cpu, KVM_PUT_RESET_STATE, "after reset")) {

This should be !kvm_cpu_synchronize_put() and same comment for the other
calls below.

Thanks,
drew

> +        cpu_dump_state(cpu, stderr, CPU_DUMP_CODE);
> +        vm_stop(RUN_STATE_INTERNAL_ERROR);
> +    }
>  }
>  
>  void kvm_cpu_synchronize_post_reset(CPUState *cpu)
> @@ -2964,19 +2974,9 @@ void kvm_cpu_synchronize_post_reset(CPUState *cpu)
>  
>  static void do_kvm_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
>  {
> -    Error *err = NULL;
> -    int ret = kvm_arch_put_registers(cpu, KVM_PUT_FULL_STATE, &err);
> -    if (ret) {
> -        if (err) {
> -            error_reportf_err(err, "Putting registers after init: ");
> -        } else {
> -            error_report("Failed to put registers after init: %s",
> -                         strerror(-ret));
> -        }
> +    if (kvm_cpu_synchronize_put(cpu, KVM_PUT_FULL_STATE, "after init")) {
>          exit(1);
>      }
> -
> -    cpu->vcpu_dirty = false;
>  }
>  
>  void kvm_cpu_synchronize_post_init(CPUState *cpu)
> @@ -3166,20 +3166,11 @@ int kvm_cpu_exec(CPUState *cpu)
>          MemTxAttrs attrs;
>  
>          if (cpu->vcpu_dirty) {
> -            Error *err = NULL;
> -            ret = kvm_arch_put_registers(cpu, KVM_PUT_RUNTIME_STATE, &err);
> -            if (ret) {
> -                if (err) {
> -                    error_reportf_err(err, "Putting registers after init: ");
> -                } else {
> -                    error_report("Failed to put registers after init: %s",
> -                                 strerror(-ret));
> -                }
> +            if (kvm_cpu_synchronize_put(cpu, KVM_PUT_RUNTIME_STATE,
> +                                        "at runtime")) {
>                  ret = -1;
>                  break;
>              }
> -
> -            cpu->vcpu_dirty = false;
>          }
>  
>          kvm_arch_pre_run(cpu, run);
> -- 
> 2.51.0
> 
> 


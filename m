Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A340C369D1
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 11:44:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8HTY-0000Hx-Ca; Fri, 25 Apr 2025 07:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8HTS-0008U1-JL
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:44:06 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8HTQ-0007Jc-59
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:44:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a064a3e143so1045548f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745581442; x=1746186242; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cCzXr/y6JsqwWuOJ7YF76cv/0ZvqUOF0VgvBEebNKzo=;
 b=Ad+OetMhm4xnhfgf5JsYFBVTFqArLkBJXdD7vnytwHbuBMz+R7KrpJORweL1t62r6g
 1QwZA56xS29HsVeF0Qzc5Y3+jxS+CHVPiyXutHYL3QDDw+DnBUVCPzgXKbMY2uvObEc5
 uFSJ8H7sK9ZtR1BCYPbS6/2IUnvc5VtE+8q1gOtf6mFxBQX6qJUSIp0pn/Nzfz3mAfVf
 AA6RhCIfJHHL8dN6oZN5MvGd7A/SKpeACxEkxO3Wsg9JdAb8Ig9sJdC5jlN3wrL2ubgL
 eP33afb2G4QIYxKuZVZCe97N0nFuX+eIds4OPjj4SCeeNSxw2VKRPoObf70etTuYyP3O
 X7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745581442; x=1746186242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cCzXr/y6JsqwWuOJ7YF76cv/0ZvqUOF0VgvBEebNKzo=;
 b=T+I+7DV1vHeFv/HPrTVqB4CzNVniz0ju0/DiOrBIVdyavRG/8IOsMNBF3kEYTrcBWO
 Jbm3Bxbe3tiljAAz4/TP4BEkBUFfOIl/gryy3JNkYd/TyqNOMvBuGHNegqFSjlccPgrR
 BphFjEE1rYFAwrk/J4VtG5MpULHQjAuX/sf5+9AjsH1s3vGZgellZjtnbQRmWsBRBIxv
 9tNdFZQwqOEvxadSjvrKVgF9XgRTL9M29cVeYVXUkt23SF/smXMzW8Jgs9n9JmlRKnAu
 1CfF4YtIOyWA+t8Ua/T5UJF2SbiiOgZ9yWDZ/xFbn9uhf0h59AuioLkyBmA6oFBC1qyP
 UySw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU+0Ree7t2RRWLtWQVJ8VeVVPmQcXjiuJPNJ0sd8MxyXWP2Ai95VdH3ei6fGHx8PcVB7Sv7pgFIVqW@nongnu.org
X-Gm-Message-State: AOJu0YyDcuMvYaOMOeknoRL0kt0d9xPwY7z1I0FpGe7Z/Y3XZcr5LNGZ
 MhHsbHd0lGTetTwAhrUvdIVSa5aLgK9gYlsmRWJvvrNs7wWOwA7Mvstc418+Qgs=
X-Gm-Gg: ASbGnct1naHD0nhjx+ftLnHxrVEAkkx61yuiTuN7E0RL1g4igwTx7eLDmkwamlTzOs0
 5JMfcawu+gcaXFRDfkxVsVN44u17AXtIO8qnhf68UubSPw5zqLd2sbnJLI/QRpZHvSwJHcfniS/
 RT6rRm7UU9HuZKJztqNThnZtZ9DxbilEf2t3HAOv0WWSrH5/QzX/9tL7VPvcp6VtcLg2h5Ebn9x
 MVVBMaBam1CzxXwmo40U0Q8fq78COA4tHvDcWBGnhYEZijKJxqvAfLzACh5nuq+zPeUKb5a6iBX
 mPgVDYaWyBjzJthtP7l/J+CAaJTT
X-Google-Smtp-Source: AGHT+IHApvV06442Ez+WTsOFOtJpYxo1DjAPthyQ0T3z4X0S3ar94mjYlVEgtwL3JaNpoVPA4ddGRg==
X-Received: by 2002:a05:6000:4310:b0:39c:30d8:ef9c with SMTP id
 ffacd0b85a97d-3a074e1f56amr1507024f8f.24.1745581442443; 
 Fri, 25 Apr 2025 04:44:02 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073cbdb78sm2097926f8f.41.2025.04.25.04.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:44:02 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:44:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v2 2/9] target/riscv/kvm: fix leak in
 kvm_riscv_init_multiext_cfg()
Message-ID: <20250425-bb49293340060a72a32d6d5a@orel>
References: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
 <20250425113705.2741457-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425113705.2741457-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x433.google.com
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

On Fri, Apr 25, 2025 at 08:36:58AM -0300, Daniel Henrique Barboza wrote:
> 'reglist' is being g+malloc'ed but never freed.
                     g_malloc'ed

> 
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index accad4c28e..6ba122f360 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1119,10 +1119,10 @@ static void kvm_riscv_read_vlenb(RISCVCPU *cpu, KVMScratchCPU *kvmcpu,
>  
>  static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>  {
> +    g_autofree struct kvm_reg_list *reglist = NULL;
>      KVMCPUConfig *multi_ext_cfg;
>      struct kvm_one_reg reg;
>      struct kvm_reg_list rl_struct;
> -    struct kvm_reg_list *reglist;
>      uint64_t val, reg_id, *reg_search;
>      int i, ret;
>  
> -- 
> 2.49.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


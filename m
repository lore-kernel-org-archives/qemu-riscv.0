Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDA8C7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:47:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6YuR-0005XI-4p; Tue, 06 Jun 2023 11:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6YuG-0005L1-Vb
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:47:42 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6YuB-0002SK-Oj
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:47:35 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9768fd99c0cso821686866b.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 08:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686066450; x=1688658450;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=52SJSOIhXRtWR+atuqChnDE9wIvyPkmBrD1xHodIqcc=;
 b=IPitqhOUhn9CjHaQk3J/Lwr2lJiWSBPB3hVUqW2kOScb8uSk4n0Ynt/AOom1Ik+IQl
 tnh5xrS7m4jihRVZcbEeextXgj0pBaJItGPwStgceizCakQO/Agm6P5FK81JOSgn1Wno
 HuXgg+lQM+NKbcKDDVztrAjuXBWIfdxI/6LYIfbRRFfcLtcMJ4PgCoj69GAUyX56s/eo
 tFwRaRkhdRGRtddneECRn+FvUbL9aBVbnyqY2pa6PsOIQfOAckUK+biVP7MZQ7WT8qiQ
 VGmsAPgUQXDN4UyAoS58h0Fwxun43gDvE9OZQv3mDneRSKdP5rX3mrtuxfABnvWCIhBl
 a0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686066450; x=1688658450;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52SJSOIhXRtWR+atuqChnDE9wIvyPkmBrD1xHodIqcc=;
 b=dX/pMg2G5pnUwIR50msuSvCIc+q48xwzfZBLTNYeKVo8SxR9phnVUg4W+dhbO3Lkbm
 fZl2fBf2DdEg+1EPrko83IKZIsHEejR05ZwscDwWdhLEDMhWrg47OMKBQWhTO0LqqBu2
 pweT8K62d1Yn8RgrQxKnI8qyfhOJ6eRnPSDzZJ4Lj08Hti9Ycspar+7UzHxZPQfsZWNf
 j4n6Yv6jrKHdlM4gA/lpQ8FYcwnOZiydqWOYzEy1809NTuAEr+lqxGL09h+UXBEOA24I
 3Q2L1DlP7viTu2AOW5MBqltmCxcQ3VUk+HY8hNmmRWlUouum5H4h6XnQ5cJwIk77xev5
 mztg==
X-Gm-Message-State: AC+VfDxOpBa7zML3TlwR31yaGEQsrwMdrqMiiT4eBSZmmavVm1b92p09
 NrJ57TeYmecgr+t4eQT98teH/A==
X-Google-Smtp-Source: ACHHUZ6jwmU0GK2AUq0kVfRZLi6iG2VsJpyItV5hbAEbkW9C46a45q0B2G6OXyrBdAEYTB2vZgx3Pg==
X-Received: by 2002:a17:907:70a:b0:94e:bf3e:638 with SMTP id
 xb10-20020a170907070a00b0094ebf3e0638mr2684631ejb.11.1686066450215; 
 Tue, 06 Jun 2023 08:47:30 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a170906a28f00b00968242f8c37sm5664736ejz.50.2023.06.06.08.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 08:47:29 -0700 (PDT)
Date: Tue, 6 Jun 2023 17:47:29 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 07/16] target/riscv: read marchid/mimpid in
 kvm_riscv_init_machine_ids()
Message-ID: <20230606-a61eb46771466f46ca54e62d@orel>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-8-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530194623.272652-8-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 30, 2023 at 04:46:14PM -0300, Daniel Henrique Barboza wrote:
> Allow 'marchid' and 'mimpid' to also be initialized in
> kvm_riscv_init_machine_ids().
> 
> After this change, the handling of mvendorid/marchid/mimpid for the
> 'host' CPU type will be equal to what we already have for TCG named
> CPUs, i.e. the user is not able to set these values to a different val
> than the one that is already preset.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 37f0f70794..cd2974c663 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -378,6 +378,22 @@ static void kvm_riscv_init_machine_ids(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>      if (ret != 0) {
>          error_report("Unable to retrieve mvendorid from host, error %d", ret);
>      }
> +
> +    reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                              KVM_REG_RISCV_CONFIG_REG(marchid));
> +    reg.addr = (uint64_t)&cpu->cfg.marchid;
> +    ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +    if (ret != 0) {
> +        error_report("Unable to retrieve marchid from host, error %d", ret);
> +    }
> +
> +    reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                              KVM_REG_RISCV_CONFIG_REG(mimpid));
> +    reg.addr = (uint64_t)&cpu->cfg.mimpid;
> +    ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +    if (ret != 0) {
> +        error_report("Unable to retrieve mimpid from host, error %d", ret);
> +    }
>  }
>  
>  void kvm_riscv_init_user_properties(Object *cpu_obj)
> -- 
> 2.40.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


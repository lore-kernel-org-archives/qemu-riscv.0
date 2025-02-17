Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8789FC021AA
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 14:02:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tk1gp-0001iP-7H; Mon, 17 Feb 2025 09:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tk1gm-0001h8-It
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 09:01:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tk1gk-0006RM-If
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 09:01:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4395f81db4dso26034065e9.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 06:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1739800892; x=1740405692; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1OqSpTQRh1Twfi3SR5Jg4mnKOhwoe/lifEQcR2LHgI8=;
 b=hh85vzviDG4905JBTCfZjatFJ/gGl/Pr4TRDCDi2pY/AkeCj01weDmk1w02z3+BhG+
 0OvIivFqDZ0fYP4DqQ56Y5Khdb/5qRRHrMhuee3LB0ha9sSw9r0jjXpXcR+akANCq+jN
 xzOr4Dzv3Ln48kFMPFNNsT6rRStMn00i9P+X2IFZqpLZccyUcWcyrhOly1KFv1L7kOkF
 IKMCJv6/+lAjI2Jsam8dt1FhAGgnGJH2KunT9Y6sOK9UB0XOYCu+b29Bq7eFc9GKYmha
 hSgoTBimFiVkSGsHdU/BtIrf36fPd3C2agspdOX3ux2YC/Eu/nPRO7YUn5kSfEFSyLBn
 Dvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739800892; x=1740405692;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1OqSpTQRh1Twfi3SR5Jg4mnKOhwoe/lifEQcR2LHgI8=;
 b=JqnLhZ5vrrgPlp8vU8R1SG5ltJtWpVVb5XRWjkfxvzS7msOkm0JnQV2R4ftWDWHu/E
 5nxoMXbnjX+PhDdpPE09eq3EZ/n2/70JbyehpAj+uZqhOQ8Ofsq2mtccUdk+LKcp3qly
 eOgAQmITA1t28fzuNh4f3s8gPPjDYRUlbxDrbmwNNOvEYTS3x9Ge2Z6C0AMUz/8qQzg9
 8yC2d2r/lZVVq8CcUi5fAfZU/RwoUYoA+qIopHT1rCV+10P6yPP3MZRl/GF/OjBd0d/U
 Gqw2Bz8KvBcjrtFK7CDwR6ZpYwgJrN94UprFNrnVVzrWSgxJc3R6CiYjVYSUqMKsQ5e6
 gGeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW65C52HEkTr36XnlbeYp/7gVYEJ0ntoGjWwyoBTo4fhbfc85HSDLhxBHaYuMIf4ZdtIEeBlSV9EVgs@nongnu.org
X-Gm-Message-State: AOJu0YwNj1X/APUBWzKZOya0D0JX3jrnRQJRGkcpx6R7hZ2Zq/tRtkXr
 zvWyYjKLALAt5WVrbuJgNVw7SChYPKjfmF2rcAinj5dce31tR9W4/8gsCDg8VeI=
X-Gm-Gg: ASbGncukJeOo5+lNxx4fcDepxldDg2iPGDO1VYRyhSOZrktBxMoSVj5mV+Z6MWffxeB
 5bB1/uUz95naaf7u5h14LJP7N71BOIyys4WoUHoKQuIo9d7tr0AdfKMK+WenjJp1y9gJXPjcuz3
 0L3JqzrQeO8iLJRguPmS3F8m+kfEzOgbVIIKN7FLsCMQE9h0aadtaDk1yarEyTBFul6mjFPVsab
 ACmDJ9gD6emW7iXtlCiaH4Y/ZNpVrsaBoD5mvhBiAK/LcdF3ZrZxXYYA/2ZcGhY2clidEU2EO8N
 p6g=
X-Google-Smtp-Source: AGHT+IFpyHztwirWiksqSwCLmRhjqFwfop7ZWjHDH19YOXoNe2bHw+ng8hatedolJBjP2gwMFVmOEQ==
X-Received: by 2002:a05:600c:1c25:b0:439:8345:17a6 with SMTP id
 5b1f17b1804b1-439834518abmr30833915e9.12.1739800892374; 
 Mon, 17 Feb 2025 06:01:32 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43989087517sm19306015e9.8.2025.02.17.06.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:01:31 -0800 (PST)
Date: Mon, 17 Feb 2025 15:01:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, greentime.hu@sifive.com, 
 vincent.chen@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH 4/8] target/riscv: add helper to get CSR name
Message-ID: <20250217-d6ff55e1f04b68643ae8295e@orel>
References: <20250217081730.9000-1-yongxuan.wang@sifive.com>
 <20250217081730.9000-5-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217081730.9000-5-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32b.google.com
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

On Mon, Feb 17, 2025 at 04:17:24PM +0800, Yong-Xuan Wang wrote:
> Add a helper function to get CSR name from CSR number.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  target/riscv/cpu.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 616c3bdc1c24..133d1852ee1e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -920,8 +920,12 @@ extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
>  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
>  
> -void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
> +static inline const char *riscv_get_csr_name(int csr_no)
> +{
> +    return csr_ops[csr_no & (CSR_TABLE_SIZE - 1)].name;

Shouldn't we assert csr_no is correct rather than silently
truncate it?

Thanks,
drew

> +}
>  
> +void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>  target_ulong riscv_new_csr_seed(target_ulong new_value,
>                                  target_ulong write_mask);
>  
> -- 
> 2.17.1
> 
> 


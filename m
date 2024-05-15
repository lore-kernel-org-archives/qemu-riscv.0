Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8706C25B75
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 May 2024 14:34:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s7Fi3-0005xj-9C; Wed, 15 May 2024 10:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1s7Fi1-0005v3-DD
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 10:34:21 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1s7Fhx-0003xm-2A
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 10:34:21 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52389c1308dso1533767e87.3
 for <qemu-riscv@nongnu.org>; Wed, 15 May 2024 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1715783655; x=1716388455; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2KdtZ1u+WQ4YTJUTFSc8fW+OHiQwxQk4DxsVoRWF2GY=;
 b=EnWexb6HwWJ5SHzwp7FsY9aFQMRD4GqdKzhnKSQR1JHdo3V0JuUGg8wRySS4d7choq
 rqhdPW8wxKbpaQjqCffaKnL6RzfRKonIDAhXKB2m7Ho8qnKBZ+k8rz66WKJXglicGCEF
 05MjJv6Tj5qzQG8J00Kgm3xI5FVxZKzpB/ilPtQ050zePHI++SoxLlXJaBx2UQIM6ctJ
 pwpQyyiocszSrUQNCcRYyzUlfCR8amwUvHUI+cR3TMhiyIS+HtzavmgVkMJfBXq0E4YH
 iP5PGld2mQt5vQd2d6HlVmfmZGIdGKMS6UgcyiYmVzwoHnEd1EhqRh/LOO2XbzwXxlVa
 hW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715783655; x=1716388455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2KdtZ1u+WQ4YTJUTFSc8fW+OHiQwxQk4DxsVoRWF2GY=;
 b=LplvSBEn/bwFFdpkDizFB9MYz5H9xjhEG9sC0X8aLkWYUfpMkIclMDbYYFnU52R5iQ
 IkOg9WJd4+aQyRDFe+5iPChlNLz/Li2hFavz4y7QibdTBCw0YkRZx6gKl787OEkmefRi
 VIJw0Q38cb6f2qcuLeHLvxGmjsFVhPClfswJv5+eP6/RnS7VJ7d+6n9LZOMSpvT0m6Hg
 QEVXb7eNhkFInogm9pCc+BYlz8EFWWQiEKgp+NEbEKHNashZXNUmG4Nbfb3GbV3iFFvM
 JPrOaEh6U8MvnHw3xYW3rdEPiJvg+HcGLYbrk4z5AzxnPkjV4KguoPiFrnOpiWzqnLTA
 NBVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkupNejVUPzdCrHZnphv9VUgqALU4RHvYGwETJ7+uM7v/JZzz7KGJHrHqEtxWFfNlycUxstqaScqReovoRmIumtkurggk=
X-Gm-Message-State: AOJu0YymamNY7w1Vdc6qpe/F4/VCRtXQaW54H+86CJXVqFiUmLac/uxX
 /CAUncDL4A4RcvaqsNznr2lZuRq662j7DY1Ny+tqtjcv6ASrjD32KlmFSwQweH8=
X-Google-Smtp-Source: AGHT+IFPadRYhM/E3bwZqDqB3Dx5YOzzJeTA1TKJRuQqo2WA7PSnwdlDG7VkNnQXlgv/ND82GnjA+g==
X-Received: by 2002:ac2:4c8c:0:b0:51d:a87e:27ec with SMTP id
 2adb3069b0e04-5220fc735f1mr10383753e87.9.1715783654919; 
 Wed, 15 May 2024 07:34:14 -0700 (PDT)
Received: from localhost (cst2-173-78.cust.vodafone.cz. [31.30.173.78])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b895731sm16763633f8f.42.2024.05.15.07.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 07:34:14 -0700 (PDT)
Date: Wed, 15 May 2024 16:34:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, greentime.hu@sifive.com, 
 vincent.chen@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 1/1] target/riscv/kvm.c: Fix the hart bit setting of AIA
Message-ID: <20240515-aad670c0d802abedcd4a240d@orel>
References: <20240515091129.28116-1-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515091129.28116-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x12e.google.com
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

On Wed, May 15, 2024 at 05:11:28PM GMT, Yong-Xuan Wang wrote:
> In AIA spec, each hart (or each hart within a group) has a unique hart
> number to locate the memory pages of interrupt files in the address
> space. The number of bits required to represent any hart number is equal
> to ceil(log2(hmax + 1)), where hmax is the largest hart number among
> groups.
> 
> However, if the largest hart number among groups is a power of 2, QEMU
> will pass an inaccurate hart-index-bit setting to Linux. For example, when
> the guest OS has 4 harts, only ceil(log2(3 + 1)) = 2 bits are sufficient
> to represent 4 harts, but we passes 3 to Linux. The code needs to be
> updated to ensure accurate hart-index-bit settings.
> 
> Additionally, a Linux patch[1] is necessary to correctly recover the hart
> index when the guest OS has only 1 hart, where the hart-index-bit is 0.
> 
> [1] https://lore.kernel.org/lkml/20240415064905.25184-1-yongxuan.wang@sifive.com/t/
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
> Changelog
> v2:
> - update commit message
> ---
>  target/riscv/kvm/kvm-cpu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 473416649fda..235e2cdaca1a 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1777,7 +1777,14 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>          }
>      }
>  
> -    hart_bits = find_last_bit(&max_hart_per_socket, BITS_PER_LONG) + 1;
> +
> +    if (max_hart_per_socket > 1) {
> +        max_hart_per_socket--;
> +        hart_bits = find_last_bit(&max_hart_per_socket, BITS_PER_LONG) + 1;
> +    } else {
> +        hart_bits = 0;
> +    }
> +
>      ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
>                              KVM_DEV_RISCV_AIA_CONFIG_HART_BITS,
>                              &hart_bits, true, NULL);
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


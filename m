Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C118FC369DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 09:03:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9gsG-00067r-MB; Tue, 29 Apr 2025 05:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u9grz-0005wv-6k
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 05:03:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u9grw-00024E-TE
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 05:03:14 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso54303465e9.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Apr 2025 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745917390; x=1746522190; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WqYYzZJ2etaj+iMzBfgvsYHIDCe3M37Qn2AkgGnnBQ4=;
 b=bLGws2JG8vlJzS5bD8oNsBbxYyIPRAeofCO5abgDJQDF3LujX4jxCzZYuslIHqv1pA
 43oQrtj71X1B6KrknXGUvORNdvC5JMrdqqiLh8YoVk5z74Si08ob82gdn9BgXyLnKVxW
 cbC8WYrr42e9B1TTvZxQNAA5Xf4kjyTbSLD6Zm0BL8/e/p6x8fbtUfX/LbpbYaPw/1Ao
 jk4s5LF23LaKGYZ0ShWebhxDJ7wt64ngn50VJtSqFa+EX8pfuP50MeQAA4xp3kLF1aP8
 N+c/iVHQorVJHDya61Rm7P0KoaDgnnJUJ8vJHPmbSU+YXsoa9bh12qpOmOhsUD+aDd2l
 NLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745917390; x=1746522190;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqYYzZJ2etaj+iMzBfgvsYHIDCe3M37Qn2AkgGnnBQ4=;
 b=hau8qD1nI5JQ0nHlPdIglH5g5Yz7DRQJfBM6VeCs9XND5vyeiGjKtqisvHW7vvLDqy
 d3bJH1hw2SfA/8qY5YWRB2rEhW8qzZAD/pg7WiAie0YlV5GjKfhJt42jZBEG0P9bMd4A
 QZqot4H5l72vz6eOn/wuCivH80ts4uXBsvBXdVj8ayKyOWAV0q6PxaGbRNHCwoKod/er
 fVvdkJVzc0v1jy6mqT/2yEM+ct4sEbnxp2ieVLdFKHaiaKXZV++HX4VODRPSJVvzp8IV
 ZQzred7b+xWAe0IsHxQcg79qXoOBjKAbi80yebDr91j8NjhiVaZDSml0cYVqNIT/rFSl
 hoEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjnEepvSxN1Xg6qQmyiDG0Ife8QJfYMdjHIyW0/vZdTl7GTT8NHGoRjajFjz8zPA/W9vaaDaWLNuLf@nongnu.org
X-Gm-Message-State: AOJu0Yz87pfMWn9P8kqIBMWj1YzCHxGuvchCEzw7hhDil/O6aDxiAwRC
 8kxeYTX5rxw3epG+5/DguNv5oISfySH8eu3Y57/6Fx6MiCdqgfDuxVOaTCAYsEU=
X-Gm-Gg: ASbGncv1L2QUwWGn2rTrfaDfJAsoaUwowgwg0jnjDy7t0kWkQHmRNa7TeyfTvHGgx6K
 yXRyUaoCJziJmUIZUrxAKKvoErR8k61IuIvatspe26ihQ0CFyXCfuyB0GGb0xuppMalZqYviYk+
 IDNytwJSTFEo+/tQ/GasEUzVWduibE2e7Dx4Zp3kJHOKlE4TMOylLCBuMjTF1zgsUj8worKRj2/
 3LBndL/QtdbCr/b+8hDJ3mLXy7vZ+haH+fjxQYSPj3SmVQSGLCXpEtDNJ84v4eFiz+f7kRFdKSv
 grkBmfFMKKxva7Sa3cby7ioxvNk8QYez/inZ6kI=
X-Google-Smtp-Source: AGHT+IHNo/K259IOEMrjXVSiVhCsZiYcv3RF3C8lySddyQWQ0mrOdZgyHeYM7+RuX9dVXyTO3zXJQg==
X-Received: by 2002:a05:6000:1887:b0:39e:e438:8e4b with SMTP id
 ffacd0b85a97d-3a0894b0c0emr1939446f8f.50.1745917390045; 
 Tue, 29 Apr 2025 02:03:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8ca72sm13081625f8f.4.2025.04.29.02.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 02:03:09 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:03:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v4 0/9] target/riscv/kvm: CSR related fixes
Message-ID: <20250429-a9aadd5aae504ada565a7c1e@orel>
References: <20250428192323.84992-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428192323.84992-1-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x332.google.com
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

On Mon, Apr 28, 2025 at 04:23:14PM -0300, Daniel Henrique Barboza wrote:
> Hi,
> 
> In this new version a change was made in patch 8. Instead of changing
> scounteren to target_ulong, change the current logic to honor the QEMU
> env storage instead of the KVM reg size. 
> 
> This will make QEMU the authority when deciding how to read/write the
> CSRs in the env flags instead of KVM.
> 
> We're doing this change in patch 8 but it could also be squashed into
> patch 4. If the code in patch 8 is good to go I don't oppose merging it
> with patch 4 if desired.

I think you mean patch 5, but I think I prefer it separate anyway.

Thanks,
drew

> 
> No other changes made. 
> 
> Patches missing acks/review: patch 8.
> 
> Changes from v3:
> - patch 8:
>   - instead of widening scounteren, use the QEMU storage size instead of
>     KVM reg size when reading/writing KVM CSRs
> - v3 link: https://lore.kernel.org/qemu-riscv/20250425160203.2774835-1-dbarboza@ventanamicro.com/
> 
> Daniel Henrique Barboza (9):
>   target/riscv/kvm: minor fixes/tweaks
>   target/riscv/kvm: fix leak in kvm_riscv_init_multiext_cfg()
>   target/riscv/kvm: turn u32/u64 reg functions into macros
>   target/riscv/kvm: turn kvm_riscv_reg_id_ulong() into a macro
>   target/riscv/kvm: add kvm_csr_cfgs[]
>   target/riscv/kvm: do not read unavailable CSRs
>   target/riscv/kvm: add senvcfg CSR
>   target/riscv/kvm: read/write KVM regs via env size
>   target/riscv/kvm: add scounteren CSR
> 
>  target/riscv/cpu.h         |   1 +
>  target/riscv/kvm/kvm-cpu.c | 335 +++++++++++++++++++++++--------------
>  2 files changed, 214 insertions(+), 122 deletions(-)
> 
> -- 
> 2.49.0
> 


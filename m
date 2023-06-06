Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51135C7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:47:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6YtH-0004It-Ud; Tue, 06 Jun 2023 11:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6YtE-0004Hs-Cm
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:46:32 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6YtA-0002Ez-EO
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:46:31 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-977d0ee1736so429253666b.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686066386; x=1688658386;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PMykGFw7YgKpaICUOC8LdD6f5V7SJPXiGqPbwi/MV58=;
 b=cFdXHXHN1Il1tXPy72erVfWWC6HQBEInNyNAXuG0Dk3K8tHfiyWwWycVn1Z7etnotU
 LAJwUGmB2z8i3rG1NIpP7n0OQfasAVHtw8/HKe1x6002XuBkY+zAoof1CS1fLQKA5oPX
 DgnULjhrOxWkc3tue2hwbzj58JP1uVUIRyUq+WW+Eg3HI4vX8ZEkM3U8hGqVxYz8P9MK
 00cLo4PozNCBqvGIVSFQq+IGeG8Cj/ciZFoHC51L0AUdJYVj3KzU8VcV/JjW6FYnjhay
 m89qBQw1YCYH+rxgB640FGRETm55zH1k5Z2D1LzPmtYl5w58kLBIEJGhPUOQlcpxvkta
 qNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686066386; x=1688658386;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PMykGFw7YgKpaICUOC8LdD6f5V7SJPXiGqPbwi/MV58=;
 b=I1M4eXw4ghKruO6kDRDwNSzAra/eOoRvwzsI3w9kB0M0Uq19Bytm46ctEzrdxkKxp0
 On42AW8+22Qy9Bmm6yiVeuUJ4f6JLjJXFtyoNFcZvUEZzq8JaJ/7KCXaJnv8TXUwZY/z
 LKZawotP9sQOq4w6BPlPnGjvrL6Qxi1rJEQaqwwhrBi7l3u7kEnpZSFe0f/0cTfiqILX
 K83MLRpSICwPbql/n7PZfoJKhr6haijKiREkYL2rN6XjooqcUdaz7WPBZZ1oEZPO7A0p
 EV+lnfNM5dNGDgeMLekOEojBXmCtY8Ox7THluagCLS+xMj2OZDGxpGVekRiL4zszOx7V
 oECQ==
X-Gm-Message-State: AC+VfDxMriqjVI25wLdwJIsqP4XKYye4WEkrOCQJto5wTuq2N9tpqMHi
 oSTugOepKH5n+LFPq6QsOzKC5g==
X-Google-Smtp-Source: ACHHUZ4nxExFuAZqzxPtF85VRaF6nv3xjfrpSzmKgkuqgWa7c4T4ckmZwN7pgHvxxjXQe/zedyFaVw==
X-Received: by 2002:a17:907:1606:b0:94a:7b2c:205e with SMTP id
 hb6-20020a170907160600b0094a7b2c205emr2444986ejc.72.1686066386549; 
 Tue, 06 Jun 2023 08:46:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 fx12-20020a170906b74c00b0094ebc041e20sm5705316ejb.46.2023.06.06.08.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 08:46:26 -0700 (PDT)
Date: Tue, 6 Jun 2023 17:46:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 06/16] target/riscv: use KVM scratch CPUs to init KVM
 properties
Message-ID: <20230606-87a03bf04af265ce7070f168@orel>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-7-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530194623.272652-7-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, May 30, 2023 at 04:46:13PM -0300, Daniel Henrique Barboza wrote:
> Certain validations, such as the validations done for the machine IDs
> (mvendorid/marchid/mimpid), are done before starting the CPU.
> Non-dynamic (named) CPUs tries to match user input with a preset
> default. As it is today we can't prefetch a KVM default for these cases
> because we're only able to read/write KVM regs after the vcpu is
> spinning.
> 
> Our target/arm friends use a concept called "scratch CPU", which
> consists of creating a vcpu for doing queries and validations and so on,
> which is discarded shortly after use [1]. This is a suitable solution
> for what we need so let's implement it in target/riscv as well.
> 
> kvm_riscv_init_machine_ids() will be used to do any pre-launch setup for
> KVM CPUs, via riscv_cpu_add_user_properties(). The function will create
> a KVM scratch CPU, fetch KVM regs that work as default values for user
> properties, and then discard the scratch CPU afterwards.
> 
> We're starting by initializing 'mvendorid'. This concept will be used to
> init other KVM specific properties in the next patches as well.
> 
> [1] target/arm/kvm.c, kvm_arm_create_scratch_host_vcpu()
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c       |  4 ++
>  target/riscv/kvm.c       | 85 ++++++++++++++++++++++++++++++++++++++++
>  target/riscv/kvm_riscv.h |  1 +
>  3 files changed, 90 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


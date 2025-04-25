Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B87C369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 11:44:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8HTL-00080A-Iy; Fri, 25 Apr 2025 07:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8HT1-0007fb-Nu
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:43:53 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8HSt-0007GQ-7v
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:43:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso1431411f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 04:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745581407; x=1746186207; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zRv8hPb4CwC0hf3eeA0fsDZjS3srhsCUDGnEcyG8TvY=;
 b=nI9x/EQ6OPJa7zjTMqLp6Twd2H+KWb3HVuXvFlSkhbJ7AmNtrhxQjHSm7eQuboLtsa
 017silNFwGmKaV0f6VLH0154lIgPX6D+T97+nUJI75HZ3icypS9plmi7/M51ZTQJ4wFK
 oNW9kHIwlPBUerZdhuIfv+lvAwZH/HpqLo4IBr8UsPvAiopj5eRNLJghGh7+9vMHvJW9
 +w1zgU8tpsZwwg32WHopkSh7SztTmIXPEEHCmd7QnNDb/Vc845W5dmE2uPXuFwIL2Vxr
 9k3trT+jC4oe8jGiFMP98CgxuTcT+9aJJC3CeHQHi7zdllfwzficPE2q6l4D5jTUy4VE
 rBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745581407; x=1746186207;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zRv8hPb4CwC0hf3eeA0fsDZjS3srhsCUDGnEcyG8TvY=;
 b=bvaeLFKWp6qv1pVx4WWJfNmHBfLo3nZPiLCQNbhU10V9+48UK6gxA6bnoRFVlS4+5m
 iUTlPY5f8igmVthVgqe8aSSW4fzpyp8nTjbyaraH9meEj5F3z0ducE/7mr+/w3mv1Qz3
 OHsHcG2v6Uh69O5KxMjY0X7WxmB7oasaQzmoILCIf6azVF6FiOSLj43ZODLQFz+KYPVB
 6P+vOwuZhhrKV0Yw6S8+SVwEHt1ypGf7ExuNEjm8kPhQ92NfjBxDWfckr+gcOMq584UB
 bqV17BrnFUCqZlU8AhO0hWTQy5AMNdPyR2Jdfm58+JLBZqOk3UALqJ74wZOoNrtxFk+Q
 4qKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjZAVKi/WMqlklO0XdYJj/4deN7sEFnDqURtITJOE3vXLdfMpzOBa4p/ikRSC+thwD+y6mJ3SHHwbf@nongnu.org
X-Gm-Message-State: AOJu0YwRsjIr94ljKyyiABLUBiiyttkG9Bk7dtmIpGbPWdVqvdFOsHBi
 TSmFnYsWJ0dHetJKcjmpEpcRuRGRL7yTbecY+FoHPszNVyZ+BYKAsLHw+IlYZhA=
X-Gm-Gg: ASbGncuZragGgXU/GPlkK8q3KaLLt9GhKjE6IjCPRQIOw8GgtgG/Z2DpME3QvnAoc/a
 fV3RN0trMc717bQ7QNOpbmJ0nlnaaeiYiehtWGcwOlgBfdnJzHBnPTSdVrnNJ0GnpklbP1V543G
 CO3sZ68dmmtFxWimFw/+eqJA7xqnFjRE7COzEh4OiZKEyjOJ/UifSoiEnmJjx8A0O+sBoOvlmgR
 exywQpKqXNpfXX+aoguzF67DKWSNhKTtnnsEMekcE4k21EOunXBa0IMRbzQC1y8op8HBxnHBvoq
 F/+ihcyhVuigLd+VM1ix0kFf+j4H
X-Google-Smtp-Source: AGHT+IHxvOaU+LGtQkB6xTyHim0+kpoDYVHoD3+2dGECFYvX8ZZTUT7QlksfYOtOPQdER5Q+9hwmYg==
X-Received: by 2002:a5d:47ce:0:b0:39b:32fc:c025 with SMTP id
 ffacd0b85a97d-3a06d641dadmr5445192f8f.2.1745581406807; 
 Fri, 25 Apr 2025 04:43:26 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a5310a1csm22277555e9.20.2025.04.25.04.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:43:26 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:43:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v2 1/9] target/riscv/kvm: minor fixes/tweaks
Message-ID: <20250425-03bcf9d07d3ade02833d17c1@orel>
References: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
 <20250425113705.2741457-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425113705.2741457-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42f.google.com
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

On Fri, Apr 25, 2025 at 08:36:57AM -0300, Daniel Henrique Barboza wrote:
> Remove an unused 'KVMScratchCPU' pointer argument in
> kvm_riscv_check_sbi_dbcn_support().
> 
> Put kvm_riscv_reset_regs_csr() after kvm_riscv_put_regs_csr(). This will
> make a future patch diff easier to read, when changes in
> kvm_riscv_reset_regs_csr() and kvm_riscv_get_regs_csr() will be made.
> 
> Fixes: a6b53378f5 ("target/riscv/kvm: implement SBI debug console (DBCN) calls")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


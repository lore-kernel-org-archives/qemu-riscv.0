Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA72C83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:22:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhci-0000H1-1U; Thu, 31 Aug 2023 09:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhcf-0000Fg-Se
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:22:10 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhcd-0006DH-Bx
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:22:09 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52a3ec08d93so997320a12.2
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693488126; x=1694092926; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JHIOb+lmlzqzBlRtVdVPzEewoRPaKNtQgbobNXdxnLk=;
 b=IFhRt3172eImeP60nit8xcRAjFv4+pvVVd+b2bkDU+AguvGaIB7bswHAE/zYcLAzLn
 6XKHwnCTSwhyDYQCKwqqTbvP3Mq35zd+p5famTcl4ox1QTkNN0njNwCoWQIsb2cfmpL9
 iMaAw62rCER+tdNoGVOxozUd7dDjRKRm/qDbhS1OPDe1oOphQgGp796e3rdgpjG50IxU
 eXY07GocZedbQEBhNmGXc/aOvQZ1AXQU0L+UGtRhFklyYqcIS4IYaqPd3enORebTFr/w
 tyrMQJ45fF9uGXGAm7rFwBsSttPyXuBtmhfwpIzwuv+R4zSW22QclyiIfpmqAZ/Ezj/M
 OhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693488126; x=1694092926;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JHIOb+lmlzqzBlRtVdVPzEewoRPaKNtQgbobNXdxnLk=;
 b=L0n5emmptteSyg0OXqQMORJ8nnueHgoRaOf2eNbL8NxDi7ltBI1/1p95MigBriaij0
 vGnZcKHUA20MPsCV5trI/YFlowuZvDVs+kCDJM9phkbcV0EZ0Ng+Ss6WnS1sWPYROn7/
 WkQros/GofXr8b5h8Z46Q6RhjpFSBGdoX790xwXJkst5Qb+S/uP1nFaJr1DK522bjFVg
 63afKh0RLz+9zw4F3AekQXYAk2jsCTMGmzg6GSo4Jg+uFNqxzntae3q/ixT5iCRiPTWe
 syp8vByJvMAlx9PtKedKsSjWbbAa8f1l1dBwnBoRRvs3ThyykTdJN/LmV5GssdrdeZNI
 yx1g==
X-Gm-Message-State: AOJu0YzlvKrK712/lHI6ipbDUnyoYL+LeyEbhtLRrPgwIinpwC9RPXxF
 jKelqY+XKIKekOl5PBp/M6jDbQ==
X-Google-Smtp-Source: AGHT+IHvbHVgjFghHMc7Ne7jONJr6t2H9dE7z1vyaDu8N1uJGw/PGLt78YU/S3ItTfkYQ9elHvDj1Q==
X-Received: by 2002:aa7:d6cb:0:b0:525:4c2b:b87b with SMTP id
 x11-20020aa7d6cb000000b005254c2bb87bmr3874095edr.22.1693488125754; 
 Thu, 31 Aug 2023 06:22:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a056402069a00b0051e2670d599sm799794edy.4.2023.08.31.06.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 06:22:05 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:22:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH RESEND v8 14/20] target/riscv: make CPUCFG() macro public
Message-ID: <20230831-31d8999871829091f53c2b5c@orel>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-15-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824221440.484675-15-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x533.google.com
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

On Thu, Aug 24, 2023 at 07:14:34PM -0300, Daniel Henrique Barboza wrote:
> The RISC-V KVM driver uses a CPUCFG() macro that calculates the offset
> of a certain field in the struct RISCVCPUConfig. We're going to use this
> macro in target/riscv/cpu.c as well in the next patches. Make it public.
> 
> Rename it to CPU_CFG_OFFSET() for more clarity while we're at it.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 2 +-
>  target/riscv/cpu.h | 2 ++
>  target/riscv/kvm.c | 8 +++-----
>  3 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


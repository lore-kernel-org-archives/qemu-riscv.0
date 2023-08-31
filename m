Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C203C83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:37:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhrQ-0000sb-CA; Thu, 31 Aug 2023 09:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhrJ-0000o8-H4
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:37:19 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhrH-0001wN-2k
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:37:17 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bcfdadd149so16201071fa.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693489027; x=1694093827; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rmfq62vsL94pyF+HF7vP9/qbbAvmU1stwduxfoRM5iA=;
 b=EC7K3+EENLiBaGYWnn9My+33HZcrhB+mK+iTXyHREThhceJAQ7rg8HeKL6VXIE2JJD
 go8y8HE8CjwG5LF4Da4u9T8KPzj/zuwOSQoSxZ0M70DDrtfCwMKRnHZW8dTKy0WNYjrv
 6h0nz4BYHGJoo9dnTpotlLEkAGlQj3pFljV548pa8ShWYzgkI9gsT6/+8QARDAQzhjBK
 62wiVGJ28kj03Z4rYKaiBF6Pj9Q7fDh3UAVIZucGsLDhz4R6eETM3ZBIEsPuyEKsO2Ia
 98NFMlWnkd2MxzXp49hqzZkq0Jy88rspMCkUwWaApJVyLi20BcKZPBJwlAo5Py2biI1w
 T+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693489027; x=1694093827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rmfq62vsL94pyF+HF7vP9/qbbAvmU1stwduxfoRM5iA=;
 b=jE+6T3yxvP6qvi1Qd92M6tQgn/CWG7+O+ic8A2rnIn/T35v8+2Z2e8hjSK6+PD1g0c
 cfGcOFjb8eIMTtWyYaz+Vgu37nC2R2TDrms3v7aEwDpFYdCHjEwTXLbmmkczrMDq7cx1
 WxmNNLBuijqslrn0y7U+tC7wp5kJFf6a5UzPNxPEszX9MODyXgkyuptC6XG7mi+3ctg0
 lmOx8IM5mQmxCyNBwL47M2RkDH21TJsPcaxa/gQ51LKBCsMQPkgbYRdL48kxrya2j5dJ
 a043BXoxjORluTmTOfe9UAgrPTE5nj8H+6WP99F8Gn3unsbJ47q9Y1ijc8ozm0rDtJVz
 nCxg==
X-Gm-Message-State: AOJu0Yx9SHWlU14yu0j6d+p0wysJq97tNVFALAqV30QK9i987+eL8kGV
 I8SgJqfQRm7l1b8TR2v/bxB43w==
X-Google-Smtp-Source: AGHT+IGwwU/1GgPf8UjwkP6pd3q+rDGUFH4mrybFjfJmCBUF6enFvtJfoWNRsc8wnEj2ruFvM03X2w==
X-Received: by 2002:a2e:b533:0:b0:2b9:c046:8617 with SMTP id
 z19-20020a2eb533000000b002b9c0468617mr3876805ljm.5.1693489026730; 
 Thu, 31 Aug 2023 06:37:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a1709064f1800b00992b1c93279sm767926eju.110.2023.08.31.06.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 06:37:06 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:37:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH RESEND v8 16/20] target/riscv/cpu.c: use
 cpu_cfg_ext_auto_update() during realize()
Message-ID: <20230831-0790fce2c8b7c72401c79d6b@orel>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-17-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824221440.484675-17-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x236.google.com
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

On Thu, Aug 24, 2023 at 07:14:36PM -0300, Daniel Henrique Barboza wrote:
> Let's change the other instances in realize() where we're enabling an
> extension based on a certain criteria (e.g. it's a dependency of another
> extension).
> 
> We're leaving icsr and ifencei being enabled during RVG for later -
> we'll want to error out in that case. Every other extension enablement
> during realize is now done via cpu_cfg_ext_auto_update().
> 
> The end goal is that only cpu init() functions will handle extension
> flags directly via "cpu->cfg.ext_N = true|false".
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 50 +++++++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


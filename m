Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE46C7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:54:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Z0w-0000wv-Eq; Tue, 06 Jun 2023 11:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6Z0u-0000wZ-J4
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:54:28 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6Z0s-0003u1-PQ
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:54:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe9a4so54831255e9.2
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 08:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686066865; x=1688658865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QD0B8F/hFYpCl/CMQBukCAYpFaWSfJME8PtsC3EXHKc=;
 b=M2DmzW8eqladMkHJTWA30eKtkcCxhShcTzAm/1VTW2alL38QpH+tOLBKGtu7I9Qd5h
 4XPkbWSSPRVxWJFjZrMdcYXd6OjeOIXP84bMyDEyQVEqgrIRS6C7aaoUM6oi5FfRAJOG
 zJOdmXMsBONMACbO8qLkaFrZ/jrAmUyEMLH0qEvchfF6jIL905DEK8UTft4lVoyGCrIy
 Sjd3GaBmdFh3qFjEZPxB0ShVBtVMgvb0rFrDeHdrttMUo6GZQ0aKfYc4y+cf0adbN+BH
 gMcC8GRtq5NZmBiYK5NxZguk7+43uNiMOFjH4Ve5dbHiaKCuyrzTzpvGEOZQgc5rb46+
 XXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686066865; x=1688658865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QD0B8F/hFYpCl/CMQBukCAYpFaWSfJME8PtsC3EXHKc=;
 b=d0GAKfrFSOb4waop6IiTOC4dicw69PwLiipgZOD2E6AGuwb7TplZbLIxRn4+BtNDjh
 6lFMZaR54Lp5msqTEwH/RYMfPYiFQWDB4q3jfMy0gKY7N3u1VUMhUJT1NKCMABB8g9Mr
 mtaeMkKQ9177Yfqzb832uIu21KzKOg0Aphy860VQIPOXYmDVRgqWBsjCaQZelsC4DXdv
 a3hRo4iZN5ZT22WniG42qKdMRwBvwNaqIi8sX9x9HP31V1EyZide/568Yk7NpcFEUu3t
 8R+jePeFAdDnCWGyTNdBBygB48IdnwSdVfNz1MMr8lED/ZHKiY47cNGtVWPyfelabmMk
 y9Kw==
X-Gm-Message-State: AC+VfDyTCAsWiGzabPRxp6/zo0ftrimjscz0nZr7jRyeR9mHR3fhvp7u
 iUEomX9gXgYOgJ2irgAisqqXGQ==
X-Google-Smtp-Source: ACHHUZ6o8J/K5YJvHijru+TJTG8zEwYLKrNNKZQjabJYQ1SGNkMKAO1V4CTRrFvNWvMDbhAenBeIrg==
X-Received: by 2002:a05:600c:220e:b0:3f7:3673:5429 with SMTP id
 z14-20020a05600c220e00b003f736735429mr2310097wml.2.1686066865320; 
 Tue, 06 Jun 2023 08:54:25 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a7bce99000000b003f182a10106sm14453188wmj.8.2023.06.06.08.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 08:54:24 -0700 (PDT)
Date: Tue, 6 Jun 2023 17:54:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 10/16] target/riscv/kvm.c: init 'misa_ext_mask' with
 scratch CPU
Message-ID: <20230606-6b0d5ce5cacc7e9190eeb39a@orel>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-11-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530194623.272652-11-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32d.google.com
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

On Tue, May 30, 2023 at 04:46:17PM -0300, Daniel Henrique Barboza wrote:
> At this moment we're retrieving env->misa_ext during
> kvm_arch_init_cpu(), leaving env->misa_ext_mask behind.
> 
> We want to set env->misa_ext_mask, and we want to set it as early as
> possible. The reason is that we're going to use it in the validation
> process of the KVM MISA properties we're going to add next. Setting it
> during arch_init_cpu() is too late for user validation.
> 
> Move the code to a new helper that is going to be called during init()
> time, via kvm_riscv_init_user_properties(), like we're already doing for
> the machine ID properties. Set both misa_ext and misa_ext_mask to the
> same value retrieved by the 'isa' config reg.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm.c | 34 +++++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 11 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09709C83F33
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 09:17:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qd5hZ-0000Fo-JY; Mon, 04 Sep 2023 05:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qd5hY-0000FP-6a
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:16:56 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qd5hS-00065w-Fa
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:16:55 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fee5ddc23eso11938675e9.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Sep 2023 02:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693819008; x=1694423808; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ajwIb1OOP16nZ2y6sDayift7lnd6zfLVjB8Pub8ktMo=;
 b=ESoIpQj3A9u8I2VXUdYtno1qDDqrmQm6QyBDwisCtg1b91ofg37JJ8WaC2ILaUvJq5
 VZ+yABkeExNXRHd93A+CxEvkkBNpt3/tpaRW2phiq9HveDpurAUIwIgSeGJvkXv0KVs7
 L0zl5lbbSJNiQ6NX9LDQ5ZMr+zByPj58KrOC3aKNw/796ZguGOH4cWndjtkYl4hTEhyM
 D2Uufy+QsT0T3TEzgwimujtamtmEed+F1qcs5kg0MzwWAEstnwS/ioDnNITMjjUuDUs5
 VV3iUhqLhlblyN+1ShDJP9Vde4cgfokusUYRcZjaB6giKX86OsZMV4vmcDlOXh4k2Gdp
 rLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693819008; x=1694423808;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ajwIb1OOP16nZ2y6sDayift7lnd6zfLVjB8Pub8ktMo=;
 b=isajiKgTX0Sy1USVNsor1GM014zt3TGu8Wse5evIHboIhf/9Oiz+bDpA6rfsDTnYxn
 DB2lb8NnFVbA3LXDfQD2tPfEFdx/aTXk6IhTHmPZWqwza3RX4Dj7XKQyh20i6es2JmWT
 MWYgARgseTJrB5w7nvdY3HOYUfEx8AqbiMUMbEkFiYLGglZ6qS0FVBKdH2ri2Wdu5Mn9
 j7uBP+BuWkPorHY3zIM007o2V8Mo3TRo6L0jDcmTx1d1JwN17sPXOlLQ/HVe4ekxRbzY
 bXhK+dqq5o+cKg2Z9uPidjDGUQZYDkd/cCUpBLPsos36nu0AjYBn0QuVUl4xaz99BeeP
 0TpA==
X-Gm-Message-State: AOJu0Yy7/HUEdAfIk2ghn94XJ7jAbLbyzPR728bMlsZeSq8/n5jrEs+2
 agCDHV9BqYlmKVA2UGL8d4jlRg==
X-Google-Smtp-Source: AGHT+IHjvaVNMgZRuJBusCCyqzUdyLUyyEIchdGx0sWZUcr8+9JvoVVtJrdpV+6IU8NvP+ff2UwS8w==
X-Received: by 2002:a05:600c:3781:b0:401:519:d2 with SMTP id
 o1-20020a05600c378100b00401051900d2mr7082989wmr.23.1693819008305; 
 Mon, 04 Sep 2023 02:16:48 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a7bcb89000000b003fe29f6b61bsm13294839wmi.46.2023.09.04.02.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 02:16:47 -0700 (PDT)
Date: Mon, 4 Sep 2023 11:16:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v9 15/20] target/riscv/cpu.c: introduce
 cpu_cfg_ext_auto_update()
Message-ID: <20230904-4d9d67000cb284c362f8d06f@orel>
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
 <20230901194627.1214811-16-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901194627.1214811-16-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32e.google.com
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

On Fri, Sep 01, 2023 at 04:46:21PM -0300, Daniel Henrique Barboza wrote:
> During realize() time we're activating a lot of extensions based on some
> criteria, e.g.:
> 
>     if (cpu->cfg.ext_zk) {
>         cpu->cfg.ext_zkn = true;
>         cpu->cfg.ext_zkr = true;
>         cpu->cfg.ext_zkt = true;
>     }
> 
> This practice resulted in at least one case where we ended up enabling
> something we shouldn't: RVC enabling zca/zcd/zcf when using a CPU that
> has priv_spec older than 1.12.0.
> 
> We're also not considering user choice. There's no way of doing it now
> but this is about to change in the next few patches.
> 
> cpu_cfg_ext_auto_update() will check for priv version mismatches before
> enabling extensions. If we have a mismatch between the current priv
> version and the extension we want to enable, do not enable it. In the
> near future, this same function will also consider user choice when
> deciding if we're going to enable/disable an extension or not.
> 
> For now let's use it to handle zca/zcd/zcf enablement if RVC is enabled.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 43 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


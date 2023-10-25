Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC0EC25B47
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 16:15:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvgXd-0002wR-G8; Wed, 25 Oct 2023 12:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgXA-0002O2-14
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:15:04 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgWx-0006rL-LX
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:15:03 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso9026560a12.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 09:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698250490; x=1698855290; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aTWBnDvBqbBrRgUKRIpeRX4suZ0xDLWPDF07b7QbSE8=;
 b=D8dnsbrjx9du4LohsDd2qB5Tm95VnSpECfY6AXzdomkirEj+0LFl0A9C894BWS7liO
 SLitDVWlkaDJcrQPb7R4YikaFFbKb2AxQBMDXxzVxaxH1+v4Rr13qv1C7Y1BTWknO5Jl
 WLYanNrlLgY5IuLMxOgCPnOeh/DKktqKKIo5Hp+bDJuHnFjdO1DHbVBcKFouQRW9KY4U
 0F0eC/ELmMd+p9DEZUwAeRlfFc6FYQQI+3nSoORkx2VObSgvs+b0ASwPrx72fmpbm78b
 XB2EYDJhrK4SbUn+rws8k9SSvzMdnQMTdZ4Q10PkIG/f1RGXJzw5VApkfUFzA78LiwcT
 oURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698250490; x=1698855290;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aTWBnDvBqbBrRgUKRIpeRX4suZ0xDLWPDF07b7QbSE8=;
 b=wuwdr/ECpoRXlz/6vXYkILFncCu9BMW2J6XJ60cxKK4TQyxKVxUvD4thmauOGns5WK
 qZjCn35LJH2G0q5CRrLPOO586u0Wo/xbQnEUaW9PEMJOHpNQ9cP15dzXW/HyqtqJbkY+
 aHvPN6lCOtNHAFAT38/+JzrMQ1mlTbK3IWsXfoATheCt/jsZVSCEn6BgClU/MJmXh8CL
 zxDqY0dhZfc49rR5mam6QIHOGZmzfM2wsF0MNEqavpva2R9+NS/b2pX7FcausBfGHn5E
 I0b4Tdi8NEx37cm/xbAGvIrBTEWsbVjFmCyO1Z3XppRIal9Jfx7ajCiBYnV1D8vdrK7g
 vnQA==
X-Gm-Message-State: AOJu0Yxtjegak2VEKQBVzJwI61KRSxdYHduFDy/8a20ooRFoMjPVTzt6
 UOOt5DRR2qwDwITADFTEmlshww==
X-Google-Smtp-Source: AGHT+IFPC6lq+mKqQ32M5nggvNq/qN3CnSzMP7Eg7OUTnOpbbrceVWkUWVN9iac8qbEO2idsPT5uhg==
X-Received: by 2002:a50:cbc4:0:b0:53e:3a80:e6f1 with SMTP id
 l4-20020a50cbc4000000b0053e3a80e6f1mr10844815edi.32.1698250490259; 
 Wed, 25 Oct 2023 09:14:50 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a62-20020a509ec4000000b0053e5f67d637sm10004697edf.9.2023.10.25.09.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 09:14:49 -0700 (PDT)
Date: Wed, 25 Oct 2023 18:14:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v4 5/9] target/riscv/tcg: add riscv_cpu_write_misa_bit()
Message-ID: <20231025-34515daeb452f08a3a421b88@orel>
References: <20231025135001.531224-1-dbarboza@ventanamicro.com>
 <20231025135001.531224-6-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025135001.531224-6-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52a.google.com
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

On Wed, Oct 25, 2023 at 10:49:57AM -0300, Daniel Henrique Barboza wrote:
> We have two instances of the setting/clearing a MISA bit from
> env->misa_ext and env->misa_ext_mask pattern. And the next patch will
> end up adding one more.
> 
> Create a helper to avoid code repetition.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 44 ++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 21 deletions(-)
> 

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


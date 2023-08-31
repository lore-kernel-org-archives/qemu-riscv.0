Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF7EC83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:20:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhbR-0006fF-8u; Thu, 31 Aug 2023 09:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhbO-0006WG-6w
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:20:50 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhbL-0005in-Pi
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:20:49 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-500913779f5so1580304e87.2
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693488045; x=1694092845; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ToxEdmUwvjaTNnj+Xvb22a+4E6VAdhi3PQJkLJugAqQ=;
 b=K+spaktBCuJDvi8GZQ2QkijkyOGg4BxOZuzcioie6C23SAzOBmLj+5mWBYBw5TtJMj
 rFqa72MsMm1Q3D+LNWE3nyto6N3dGMgETvb3T5RWQ8rnEXJPOt5KgLZCDr6HIsehSGLM
 E64uTGjV+RWJ88ZNxTltsUYrU3b8nqXggPSOK94s30UNT4+7z9yYQGPyfqEExmkAvC+z
 UGt4MTVJJyOEs0ha+O7cyGNEyRsV9GMBExlEnfzYcTDxWgtwsPxYBTIpfWqBhLPrbb/G
 dWP4LbVyq+oqMTUqi9DSVcdJ5kJiXsiGMTYpKsUhwiI3WFC4zow/Tc5VTlXsndoS7OrM
 BB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693488045; x=1694092845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ToxEdmUwvjaTNnj+Xvb22a+4E6VAdhi3PQJkLJugAqQ=;
 b=ljzUDWJSgun46ouYWtPyk0x7fX7fAPkSPACehFQfBy2ds6rdcPM0hXb0iHy3+9ccJT
 ADmyul9LVkY06hVsMCaFXK6PYMLeNC9wzKL9XYgNEqagcvMx1FH7twUo+Q45lXC63DPG
 EdH7526kW5MSGwMq5iVcn+sqYn/DNJJn8/TuWhk/omxXhwKbQWoNskSUM6O1V/dgF7Zz
 M+g0IOGg9rJITxD+6HweTm3q0LAoZaiOHu5jFC4D1DhG6AdD9osEE2GHJloqYang3ukx
 pfDCib7GpWNXNh0FAHX7Abzd3rbLoJCxtbEQjrtCI185kjWgIXBHqibaoBNbqgCP9Qym
 TR4Q==
X-Gm-Message-State: AOJu0YykQjnT+wyq6q59Sb2aBR7jXSBKoYM3bsIEqB2R0HuXQlYo9BHE
 4VUEbcqYlYs9dxG/8g4B5a3K0A==
X-Google-Smtp-Source: AGHT+IFGsCmAuWx3l7hGJfr+u0t2JlCHvYneezsYgvRwjcnCtvDE9cLsKAkb9rQscBRAx1kxqN8dHg==
X-Received: by 2002:a05:6512:3196:b0:4fe:2f8a:457e with SMTP id
 i22-20020a056512319600b004fe2f8a457emr4517976lfe.43.1693488045203; 
 Thu, 31 Aug 2023 06:20:45 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm776967edb.79.2023.08.31.06.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 06:20:44 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:20:43 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH RESEND v8 13/20] target/riscv/cpu.c: use offset in
 isa_ext_is_enabled/update_enabled
Message-ID: <20230831-1a196d8870884638806ebda6@orel>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-14-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824221440.484675-14-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x12f.google.com
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

On Thu, Aug 24, 2023 at 07:14:33PM -0300, Daniel Henrique Barboza wrote:
> We'll have future usage for a function where, given an offset of the
> struct RISCVCPUConfig, the flag is updated to a certain val.
> 
> Change all existing callers to use edata->ext_enable_offset instead of
> 'edata'.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


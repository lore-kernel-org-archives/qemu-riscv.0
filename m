Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBEAC4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 09:20:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qy7OF-0008Go-BB; Wed, 01 Nov 2023 05:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qy7OD-0008G8-Hu
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 05:19:53 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qy7OC-00024q-2l
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 05:19:53 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c51388ccebso90758141fa.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698830390; x=1699435190; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PvfGYQAf8rR+gkB7UGOsowdVVBIDkfG8GVzI7GEQYcw=;
 b=FmDAvb2Tx/JCZlL/ECjXZkcRQ2HU6P53i8SHVtBR4llep2A8cv4hJqIYjnpzE9cYlV
 7s3ZTmc/Bt3i4dRO6MJnCWDQeiVmags0Q4+vmXiX/5yfjPH0AH/VWxXz6xcrOgLUfNxh
 jiFMcpVnoWvD3N293DjFEFdEruixVHsJ5zCh/D/H3ifx2WR4xxiLHAB+GcRa9LqtkUUU
 mjyvld81rOsN9cFCPLgp3eMAeeYdF5TcPY8llIih7ql21Pges1lwIlZB5VIC/9/N2Uy4
 QNUhGXbmFNJ6PNdSWeBBCm2EkwBpUBuy4eknud/4MMHip067pSo854OdnzvjBe4Y4qIG
 CLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698830390; x=1699435190;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PvfGYQAf8rR+gkB7UGOsowdVVBIDkfG8GVzI7GEQYcw=;
 b=bTXJZnVLsma+Ohpb1lUZA2uYiaTNQH9SYncEaVoHtpPFWTsX/ZVXVkc7q5wH/u4GJ4
 Byd2+7Q1eBDYkZu0j1G3xT2fOXR2WzpmGfqesLwfrFGpwA9s1vkq3heOcWzjIbHuRZ+4
 SPM29EcXqZz1YzFdnKVjGqsOqP0k4+AhVXdes2SCbqC8ivxR5PXbC9W+eb0+IQBCoB+P
 TuSfooMSJlza7PjhhdTAqUJE3n9f445i9ffrbz5i4BYEZmK8Ia8yGaKvynbntVWe1pFH
 A/AvJKUk1O909RKpdkZkGhCNdTh/YQSDhcTcS7qBej6dlUXhjWx2Zc8OC7ai4P7omKf5
 lbMQ==
X-Gm-Message-State: AOJu0Yzvvu4U7XhPVsGZmt4nnCq2VLIwzHJbuzZcrUXKu9ysRrWq3VV2
 91tBt5vXbbYPrPC3XB4Wq8nh6g==
X-Google-Smtp-Source: AGHT+IHIyIEhW0carXk8e0fOpyJtDG7aku4kSUBFTbORoP+bs6ReasJAb0B3a9wdTkyHN9Svwe69Tg==
X-Received: by 2002:a2e:9198:0:b0:2b9:412a:111d with SMTP id
 f24-20020a2e9198000000b002b9412a111dmr12667236ljg.42.1698830390023; 
 Wed, 01 Nov 2023 02:19:50 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfcc8e000000b0032dbf32bd56sm3688282wrj.37.2023.11.01.02.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 02:19:49 -0700 (PDT)
Date: Wed, 1 Nov 2023 10:19:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v7 01/16] target/riscv: create TYPE_RISCV_VENDOR_CPU
Message-ID: <20231101-2b306f5b57863cf8136f568a@orel>
References: <20231031203916.197332-1-dbarboza@ventanamicro.com>
 <20231031203916.197332-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031203916.197332-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x22c.google.com
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

On Tue, Oct 31, 2023 at 05:39:01PM -0300, Daniel Henrique Barboza wrote:
> We want to add a new CPU type for bare CPUs that will inherit specific
> traits of the 2 existing types:
> 
> - it will allow for extensions to be enabled/disabled, like generic
>   CPUs;
> 
> - it will NOT inherit defaults, like vendor CPUs.
> 
> We can make this conditions met by adding an explicit type for the
> existing vendor CPUs and change the existing logic to not imply that
> "not generic" means vendor CPUs.
> 
> Let's add the "vendor" CPU type first.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu-qom.h |  1 +
>  target/riscv/cpu.c     | 30 +++++++++++++++++++++---------
>  2 files changed, 22 insertions(+), 9 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


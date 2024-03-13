Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ECCC54E60
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 09:55:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkLKF-0006Md-95; Wed, 13 Mar 2024 05:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rkLKC-0006JL-VQ
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 05:55:05 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rkLKB-0003mi-C7
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 05:55:04 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a46606e82d9so37867666b.1
 for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2024 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710323701; x=1710928501; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iTKcyKFdgOCRJPBs6+8xdwqySNv/F9vhDlc8R8UoU+0=;
 b=D7MTBtIrziJWB0iqAA9V+5DBxEN6dU5TrKrJv++6KGnIqJQZhJiojiE53YE5/gIJYQ
 yGfaJYm+5ynfTSbn6UzX/WvbqnRDdeYrBj5y+lgwr0Ka2Sd8bMoEfWfgL/rndHhAeqlz
 ULHrG3DdzlipEXeo1Q3ndG1VJ6Gs0KQWX5ESLRSX/t2eC/WYUYwsn8ustrxn74ulMvzz
 hsN27f5lu7mLR4GjVxZecSsXosZYk2z7WZXKQcRY8VTHhVIdKjfCjFCIaiad0os4ukbo
 IrR83YLN8w7cDqlMtkevJaofroKatWci4oqnmEVvKq85WPEfprET5H1iukq4phIRpFrb
 G7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710323701; x=1710928501;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iTKcyKFdgOCRJPBs6+8xdwqySNv/F9vhDlc8R8UoU+0=;
 b=jmeKuoaslvTUZyyBq5kfWXl62etJ6jeKdfnKlYxqoSnIg23pgsZ+C2LI3D2gXiwRJ0
 C7RQqgJrMZYYU3Xju6EixHJq1kHxpBt8FtAOUGgJaMhxrsSY41AF7P+zqx1KwuXA77rf
 4N6v4dlholerOvZipi3Exo288CnNkcJNrjgz90/vuh54ScMFAE7CnJjR5pTg2pB95y2h
 xx0CA2tGSaDYWaoA5JYW8gR3K2enVY0YuppY2g0snrdYdSRqawQ9KSsOLVMZZhmtZOcX
 BW9XH2Z4hkCbuqhCOrkXRN1tXGNJkR4ANKsLdHqdmz4x1r+9unJ05C/5YCsl5+l8G2b0
 AZLA==
X-Gm-Message-State: AOJu0YwReO6JnPBvj1NtXiGDc6Ngz6Xos5ZZebLuApOu0ZUn28US7f4u
 oM3QBOfac33SG0ytT2y57Z1K1RZZ7BQCa2dp1cx329UaEo8qdX1+58W1HJg7NNw=
X-Google-Smtp-Source: AGHT+IGUdsefFubr7gXMY4DtJ8OgwTSVJ+XNPEG3Jd0QYoEfud7z7PbD1jfVuwHjvzjSc2ySeUFPZg==
X-Received: by 2002:a17:907:d041:b0:a46:22ec:9d7f with SMTP id
 vb1-20020a170907d04100b00a4622ec9d7fmr5841166ejc.67.1710323701660; 
 Wed, 13 Mar 2024 02:55:01 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 ws7-20020a170907704700b00a42f6d17123sm4635917ejb.46.2024.03.13.02.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:55:01 -0700 (PDT)
Date: Wed, 13 Mar 2024 10:55:00 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/3] target/riscv: Enable sdtrig for Ventana's Veyron
 CPUs
Message-ID: <20240313-2615762e76df40c9470c9e28@orel>
References: <20240313060931.242161-1-hchauhan@ventanamicro.com>
 <20240313060931.242161-4-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313060931.242161-4-hchauhan@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x631.google.com
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

On Wed, Mar 13, 2024 at 11:39:31AM +0530, Himanshu Chauhan wrote:
> Ventana's Veyron CPUs support sdtrig ISA extension. By default, enable
> the sdtrig extension and disable the debug property for these CPUs.
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ab057a0926..9ddebe468b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -568,7 +568,9 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>      cpu->cfg.ext_zicbom = true;
>      cpu->cfg.cbom_blocksize = 64;
>      cpu->cfg.cboz_blocksize = 64;
> +    cpu->cfg.debug=false;

Need spaces around '='

>      cpu->cfg.ext_zicboz = true;
> +    cpu->cfg.ext_sdtrig = true;
>      cpu->cfg.ext_smaia = true;
>      cpu->cfg.ext_ssaia = true;
>      cpu->cfg.ext_sscofpmf = true;
> -- 
> 2.34.1
> 
>

Thanks,
drew


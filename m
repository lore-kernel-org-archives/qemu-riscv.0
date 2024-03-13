Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49658C54E60
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 19:15:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkU4l-0003Xo-Lz; Wed, 13 Mar 2024 15:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rkU4d-0003X8-0u
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 15:15:36 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rkU4b-00088P-Er
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 15:15:34 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso193752a12.2
 for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2024 12:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710357330; x=1710962130; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S73Ez4aLojGa5m6oGyjmaYW4vkiMXs/MYff/gasLOqk=;
 b=C98L3f/B6H5fFfqW7VH3aB7kqDyT6qcQWKBoiB2daQGITSbYEV2eKT496lk0YxP2ki
 L06CmEFIk5d0TXfuFKX6P4eqJmKC3bf4Eb0UpwW06Tz/4zcrFNyRTOQoGknijqLG/CD8
 G3yuGPyA9JjYjhZ7AI0PmFxV4K5zvjKDzNYkevHfem6cNhevB5L1GCUaiXHWTEq5aOeL
 6syQqYxsLEToZfFsOrrykf9RIc05Fzzsz0A/SAwIrM1h056yn/wJAtRTsvlFHAZL0tZy
 BsBCO4uf5WiBhntMfeiRporReRLZBygyHEMhO9mtPUNzBbbMHJXQZdj17zf4Nj4flYwv
 ofRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710357330; x=1710962130;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S73Ez4aLojGa5m6oGyjmaYW4vkiMXs/MYff/gasLOqk=;
 b=f8QkzrgWvIVlIyOBqUgu/hANd6rxy0ovVMJ1LvI9je9PkY0d6uDN8sCSyzkFPQaLJZ
 BgP2DV+EmjGTxlhx/nU1pPOcsiIopOzBDKe4ulEZ45uQL0HOdtuZfTzQO2vdqgpFbTJV
 Xmj55al7S0nj2w6xmMIUh4Fh69dGRYDY/fPxg80vN0+NclCLI23h7zwy/pHbQ6IDwpft
 KflPkkaFkOu2e8OUWDR5NgHzd3jXDk/lDQ4TtGJUWZ0w0Aw1avi4Oe3gCLn4q3ltMcKE
 zcISt4eMBZ5Uy1vTLApcNwcFDMXRKHAuuy5BxAJTf/PsK/n76d779qlmcT0UNHQicabj
 GVOg==
X-Gm-Message-State: AOJu0YzrLwNJEf/JkaKkmxd0+Z7cKs5row8B/HUnR6eGC3zjLOkfMsvP
 XfIkd2mvz/zEVd4tSMD6KVyZcYRTCLgF0l1MObK8ZLL13HjUlaOKjd+OqiXOOffoGYOowdZOkQM
 E
X-Google-Smtp-Source: AGHT+IHoEqtr6t1XwJmpOsv5FfPnmKNqFYeVU7ON7oEDvgOeY7RGQzWYwjUXMLlZJZv6TzmSFvy7NQ==
X-Received: by 2002:a50:9f64:0:b0:568:231e:5e9f with SMTP id
 b91-20020a509f64000000b00568231e5e9fmr5529751edf.26.1710357330103; 
 Wed, 13 Mar 2024 12:15:30 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a50e703000000b005661badcccesm5228509edn.87.2024.03.13.12.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 12:15:29 -0700 (PDT)
Date: Wed, 13 Mar 2024 20:15:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 3/3] target/riscv: Enable sdtrig for Ventana's Veyron
 CPUs
Message-ID: <20240313-b392d97ea13635ecc7810909@orel>
References: <20240313182009.608685-1-hchauhan@ventanamicro.com>
 <20240313182009.608685-4-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313182009.608685-4-hchauhan@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x533.google.com
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

On Wed, Mar 13, 2024 at 11:50:09PM +0530, Himanshu Chauhan wrote:
> Ventana's Veyron CPUs support sdtrig ISA extension. By default, enable
> the sdtrig extension and disable the debug property for these CPUs.
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e0710010f5..a7ea66c7fa 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -568,7 +568,9 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>      cpu->cfg.ext_zicbom = true;
>      cpu->cfg.cbom_blocksize = 64;
>      cpu->cfg.cboz_blocksize = 64;
> +    cpu->cfg.debug = false;

We don't want/need the above line. Veyron does support 'debug' since it
supports 'sdtrig'. And removing the line above allows all the
'|| cfg->ext_sdtrig' to also be removed.

Thanks,
drew

>      cpu->cfg.ext_zicboz = true;
> +    cpu->cfg.ext_sdtrig = true;
>      cpu->cfg.ext_smaia = true;
>      cpu->cfg.ext_ssaia = true;
>      cpu->cfg.ext_sscofpmf = true;
> -- 
> 2.34.1
> 
> 


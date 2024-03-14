Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46091C54E60
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 17:12:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkoct-0002IE-Gw; Thu, 14 Mar 2024 13:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rkocs-0002Hs-Bk
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 13:12:18 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rkocq-000686-Fw
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 13:12:18 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d204e102a9so14578701fa.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Mar 2024 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710436334; x=1711041134; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GlwNh4X5tkK5uQltiM/Y7mHfvfz0V3pZejS7zbo2hB4=;
 b=E+GT4QnCrGsDFktlPIdPLIYG3TgTm4I+th0yvGF1k3ReGv/eW69OyxUdRzBpR4QWfH
 g0LiW5TaSwD/RBJqYVE+CWJ02/VGzBeFy053nB1iUNVTw/d5XTD7RTlNeEE32pCno9a2
 /BT35prgelxDrBuWH1Anu6QjBcsBXxYsvA/Q6+GIj4++TI9Lb+4X2q+eQTJv3q05Bhnk
 rjOL7qUiINjxbDUiZ8DiNgBz12vG0G6s/+SF0IhSfywRyd89neuWHl/7EBsF/rHP4uOG
 n2nror2TCZL1p+bkQW/uPuBRe6fWUuPZV2GBE+YcWX3ezh1I4/h9+eG38JI8rSFTnxP2
 nIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710436334; x=1711041134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GlwNh4X5tkK5uQltiM/Y7mHfvfz0V3pZejS7zbo2hB4=;
 b=brp3k6YVutkJMWUfkY6EjkIqorHTeLtDTk+rReRCrECg4xJViWb69HU89U2FrdgkCH
 LjyUrKC8zicPtjPsfCfLUvobPgF7PhF0kRJKt/TxZX3WPBhm/3wYsEDzdq1kzVmV6T0X
 rpSwLngbPoh3pyy5rrmCGIh59zTv/2iYEAbH/SziE9FzLFfwBiaks2+4sbJ02JlZCCYu
 2Sr6v0O6Q/xJ5Cztrb5peBAnT4HgK2sDJnBDFipuPtEY4It06kDeyisszTUjQNDDzXx/
 5AOsFw0VXkEjYQKGAviPWRVORlKSZehope+jRguR5CZ/zhwbxuNHca56ipMnBbaQcs7O
 msmQ==
X-Gm-Message-State: AOJu0YxIa7j4/JVP9IiwrQ0L8+ZCkvCZvGQ23bxQGCDxUm1y4sGLOpSv
 lzb6sh2gz2yP0+4XNATV2Ie9cve/GngYJdm1umJJY4n90rrow7OombNRTZbZCug=
X-Google-Smtp-Source: AGHT+IFEZHL89z2/eRNIMs5Id3weDYC+TKvEXCwNiWYuOazg2LEccYq9Mv49/9fKH4qCpiXF1bqK1Q==
X-Received: by 2002:a2e:9147:0:b0:2d4:4b6b:3cf3 with SMTP id
 q7-20020a2e9147000000b002d44b6b3cf3mr1386317ljg.3.1710436334082; 
 Thu, 14 Mar 2024 10:12:14 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a4576dd5a8csm864215ejb.201.2024.03.14.10.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 10:12:13 -0700 (PDT)
Date: Thu, 14 Mar 2024 18:12:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 2/3] target/riscv: Expose sdtrig ISA extension
Message-ID: <20240314-2fa4f2e8a2ab1740a72cc09a@orel>
References: <20240314113510.477862-1-hchauhan@ventanamicro.com>
 <20240314113510.477862-3-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314113510.477862-3-hchauhan@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x234.google.com
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

On Thu, Mar 14, 2024 at 05:05:09PM +0530, Himanshu Chauhan wrote:
> This patch adds "sdtrig" in the ISA string when sdtrig extension is enabled.
> The sdtrig extension may or may not be implemented in a system. Therefore, the
>            -cpu rv64,sdtrig=<true/false>
> option can be used to dynamically turn sdtrig extension on or off.
> 
> Since, the sdtrig ISA extension is a superset of debug specification, disable
> the debug property when sdtrig is enabled. A warning is printed when this is
> done.
> 
> By default, the sdtrig extension is disabled and debug property enabled as usual.
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2602aae9f5..66c91fffd6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -175,6 +175,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
>      ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>      ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
> +    ISA_EXT_DATA_ENTRY(sdtrig, PRIV_VERSION_1_12_0, ext_sdtrig),

sdtrig isn't in 1.12, is it? I think it's 1.13. Hmm, I wonder if we don't
need to audit all our recently added extensions to make sure they're
actually 1.12, since we don't have PRIV_VERSION_1_13_0 defined...

>      ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
>      ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>      ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
> @@ -1008,6 +1009,11 @@ static void riscv_cpu_reset_hold(Object *obj)
>      set_default_nan_mode(1, &env->fp_status);
>  
>  #ifndef CONFIG_USER_ONLY
> +    if (!cpu->cfg.debug && cpu->cfg.ext_sdtrig) {
> +        warn_report("Enabling 'debug' since 'sdtrig' is enabled.");
> +        cpu->cfg.debug = true;
> +    }
> +
>      if (cpu->cfg.debug || cpu->cfg.ext_sdtrig) {
>          riscv_trigger_reset_hold(env);
>      }
> @@ -1480,6 +1486,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>      MULTI_EXT_CFG_BOOL("zvfhmin", ext_zvfhmin, false),
>      MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
>  
> +    MULTI_EXT_CFG_BOOL("sdtrig", ext_sdtrig, false),
>      MULTI_EXT_CFG_BOOL("smaia", ext_smaia, false),
>      MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
>      MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
> -- 
> 2.34.1
> 

Thanks,
drew


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F45EB64DB
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 09:55:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBBbt-00027x-9I; Mon, 19 Jun 2023 05:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBBbo-000200-Tu
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 05:55:42 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBBbn-00026s-Ap
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 05:55:40 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3112f5ab0b1so1282980f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687168538; x=1689760538;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TEFehyNRD5aLepVyE1hLkYaoKQA+bA/TgBrF5ZNef54=;
 b=I7GIUw62pw5TWH4Iu1qmhZ5mjfUZPwbN8Bn5mK7Q+uQRaH8L55wPTs+NkpKtYxwv1B
 rTorToUAj3cQVndKxXA3J3CkxoO0E7n9lmMgV6MUOVI9/oj/S9jkf+G5gCEy/kuIuZAL
 O3udUKaxioeoG+IuCvtZL6XC21bHVhgunfBSYXx+HQo4V/7eD5GW5u9k8/BGoLMMbwhK
 6CWXhjgpBmn+wZH+cyLT1zXlgn0c7BZta6glpmdsVzfv4s++GSc/Y1riHMUejSLyn25h
 aucyugfmsuqTA30HhfVhxmVr52RdOQrUjp83Js9yk+cCxb7vawg21co1mFZDgHSxMXNX
 YtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687168538; x=1689760538;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEFehyNRD5aLepVyE1hLkYaoKQA+bA/TgBrF5ZNef54=;
 b=jK+c8vRFwZnxaZkFr/BdGNIkCtZhCA0BJefnDMefP70XSnKGU6ZECF3/j4qlVegU/E
 ZoDcPIhP27cakD3Jmk/tPELIE9rWDpRzujpFEusOsQNaqbE1Ng7B+lW/vMZhS9kVJa2/
 iNfC5kSsUQyTBFoeFiHaiEoEZsSj6ElOtRADZeF/ZztXEsmy16omqJqZMD/OB6YCTif8
 XTdpEk7PWWqu/7B+4l8dsE9KAisZBAT6+kSmWxc4jhIw2ufXxVq9mISeV66B8Ng9hDKS
 bJFuGYNo3f0pIeyLzGPOgDM6Gs8GraJZ32clvacNZ2VTzsPOn4UyIQqc9G2RaFqQxmcA
 mfmQ==
X-Gm-Message-State: AC+VfDywS3W5gWW5lw42hjr8xOprZFu+BrLpvT53cHM7OQizPTt7gObl
 q3jMnc9E6GL1ZnGY0J9+idKbcA==
X-Google-Smtp-Source: ACHHUZ7lY210ayYAyUo1Dn4syBzhgUH6a7GwCPawJ69gM8YfTdru+zjsLoCcavhi099ZEy8Uk+smxw==
X-Received: by 2002:a5d:674a:0:b0:311:18cc:3887 with SMTP id
 l10-20020a5d674a000000b0031118cc3887mr5862801wrw.57.1687168537750; 
 Mon, 19 Jun 2023 02:55:37 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a056000050400b0030ae3a6be4asm31336551wrf.72.2023.06.19.02.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:55:37 -0700 (PDT)
Date: Mon, 19 Jun 2023 11:55:36 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 17/18] target/riscv/kvm.c: add
 kvmconfig_get_cfg_addr() helper
Message-ID: <20230619-78ca2c1eb3d742a3d496954e@orel>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-18-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613205857.495165-18-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42f.google.com
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

On Tue, Jun 13, 2023 at 05:58:56PM -0300, Daniel Henrique Barboza wrote:
> There are 2 places in which we need to get a pointer to a certain
> property of the cpu->cfg struct based on property offset. Next patch
> will add a couple more.
> 
> Create a helper to avoid repeating this code over and over.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 0b6dff70de..3a9f7b0722 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -222,11 +222,15 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] = {
>      KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
>  };
>  
> +static void *kvmconfig_get_cfg_addr(RISCVCPU *cpu, KVMCPUConfig *kvmcfg)
> +{
> +    return (void *)&cpu->cfg + kvmcfg->offset;
> +}
> +
>  static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
>                              uint32_t val)
>  {
> -    int cpu_cfg_offset = multi_ext->offset;
> -    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
> +    bool *ext_enabled = kvmconfig_get_cfg_addr(cpu, multi_ext);
>  
>      *ext_enabled = val;
>  }
> @@ -234,8 +238,7 @@ static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
>  static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
>                                  KVMCPUConfig *multi_ext)
>  {
> -    int cpu_cfg_offset = multi_ext->offset;
> -    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
> +    bool *ext_enabled = kvmconfig_get_cfg_addr(cpu, multi_ext);
>  
>      return *ext_enabled;
>  }
> -- 
> 2.40.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


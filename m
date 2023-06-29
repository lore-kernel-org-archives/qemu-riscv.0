Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F2EEB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 09:16:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEnkl-0000Zo-Jx; Thu, 29 Jun 2023 05:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEnkj-0000Z2-4t
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 05:15:49 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEnkh-000341-GM
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 05:15:48 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b6a084a34cso6188271fa.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688030143; x=1690622143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2k8puZQet7HMkINbxQlA/+vJe6i6bvujgy0amDidWP0=;
 b=jkbZPdDzjHOAr1n7PVmGSXEifdApSSUciQRoF2jr5VcMV0kuybKrNPqPx2zy+GNMsv
 8GstmYCLhRlAMwLVF4UdopLBDoo+LWZir2Xyp85BvyVq564C8NCYZCGsqY4Mir0LKOW7
 sEEK5mELOTPWY/sO3MtGQcAYYeSeceEJi95ViSXQg2y5thRI1kxxmdsTl7FPDisEAapF
 EkAD0KjsmpU0KKH+/9AKrprbU7y+e6yRbq31ehbiZotJtYQ5nG/SHUbtHIAft/ufUFLH
 ln/LYW4qGoyxndFnrWbuNd3l/M+4tTxVXtN5bSpqDSm4/Lbm4Awea6xvAAQK36oCTKZT
 5ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688030143; x=1690622143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2k8puZQet7HMkINbxQlA/+vJe6i6bvujgy0amDidWP0=;
 b=ep+YmT8yMIc0v4eJoe8U4GWmGjz9UjE69IfYvyS22fLDmRSUcZ20xQS4/qzfkTqw+w
 ATM9g8wHNf+j8XRAXmAcQd9MCXNqG/rHelTHZ8kq7b5N0JOaC0aiBuataOmd3GiY9M78
 B6FGnxHUcc6e9Xu+5vpVFc0dN6xOtdb+4adAvzCmYcS6csjZb8DhmPEIjOcAVfD2JSPC
 hRhQsD9cJUkmt1ksWoaVH4kbeVSHckF04Ns3eodD29wQqh9nKsPgQVGH+CeRp5J2uVFp
 WXzyyXW7WvjiL92x2w8Xcw4aRRVQ1yi1PUzNgteF8H/zTH7Q+pB841mJPzkTTc2B9o6t
 trhA==
X-Gm-Message-State: AC+VfDzTb90/kHfS53UcnoKVeKTDkl5EPEJTpSxmBIt/wgbdxNth3jzZ
 R9dMCLvzXgdsbQXA218zSMKPcg==
X-Google-Smtp-Source: ACHHUZ6UbSWhc++G5KYUv8wp4AbQ3iqRoP34wqY1UV+PbYMYH59+cwLVQ78Ot7cdi9ok0r7Hs31d6g==
X-Received: by 2002:a2e:97d1:0:b0:2b6:9ed5:bf15 with SMTP id
 m17-20020a2e97d1000000b002b69ed5bf15mr7937497ljj.23.1688030142956; 
 Thu, 29 Jun 2023 02:15:42 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a1c730b000000b003fb416d732csm8375863wmb.6.2023.06.29.02.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 02:15:42 -0700 (PDT)
Date: Thu, 29 Jun 2023 11:15:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org
Subject: Re: [PATCH v6 15/20] target/riscv/cpu.c: add satp_mode properties
 earlier
Message-ID: <20230629-2cdf4705d067b0af0be0ce43@orel>
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-16-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628213033.170315-16-dbarboza@ventanamicro.com>
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

On Wed, Jun 28, 2023 at 06:30:28PM -0300, Daniel Henrique Barboza wrote:
> riscv_cpu_add_user_properties() ended up with an excess of "#ifndef
> CONFIG_USER_ONLY" blocks after changes that added KVM properties
> handling.
> 
> KVM specific properties are required to be created earlier than their
> TCG counterparts, but the remaining props can be created at any order.
> Move riscv_add_satp_mode_properties() to the start of the function,
> inside the !CONFIG_USER_ONLY block already present there, to remove the
> last ifndef block.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5428402cfa..b4a6fd8bab 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1743,6 +1743,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
>      DeviceState *dev = DEVICE(obj);
>  
>  #ifndef CONFIG_USER_ONLY
> +    riscv_add_satp_mode_properties(obj);
> +
>      if (kvm_enabled()) {
>          kvm_riscv_init_user_properties(obj);
>      }
> @@ -1761,10 +1763,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
>  #endif
>          qdev_property_add_static(dev, prop);
>      }
> -
> -#ifndef CONFIG_USER_ONLY
> -    riscv_add_satp_mode_properties(obj);
> -#endif
>  }
>  
>  static Property riscv_cpu_properties[] = {
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


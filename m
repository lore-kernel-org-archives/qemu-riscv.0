Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AE0C3DA7E
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 15:02:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWdUe-000583-P8; Wed, 24 Jul 2024 11:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sWdUc-00056z-KO
 for qemu-riscv@nongnu.org; Wed, 24 Jul 2024 11:01:27 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sWdUa-0000R9-S0
 for qemu-riscv@nongnu.org; Wed, 24 Jul 2024 11:01:26 -0400
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-447ea09c8ddso37258031cf.0
 for <qemu-riscv@nongnu.org>; Wed, 24 Jul 2024 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1721833282; x=1722438082; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mUcgQnbk9+Lhuv4RqW24kBuIhcVeQSMiKcEY1fW1j+I=;
 b=mJYE0DSmhFBNT/2evcxq9y93LfyJktWqdl713rxM5lO0Lkk4tcKzhyn9j2SjTPCGPr
 9lS03AwUY0wpoTEHg/cLFVoCZ6OWpAM5FfeENv2o0u6nnfb2c7OcBRdFZMZeh2F84pNI
 CzLPaeAUBc6dCl13RgLUcOd+dQLu2U4BHzy4oqtRqbucZruGOQxp74S5V2BSxuwSPr/T
 aIBSU4pzQw20bhq1webBi3AznlR0FV9tYGKusXUUi8sreZDSVBNV+eiTwGGt1FhPmL4L
 jDkHyrVrbOg6SYs3BtOwwTnO6LRTSH+mKz9wC7nq4StPHUu6oC5O0EFaK/wWuzw/KHda
 6+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721833282; x=1722438082;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUcgQnbk9+Lhuv4RqW24kBuIhcVeQSMiKcEY1fW1j+I=;
 b=Kb65GfCR3VNwa0w6GbgWCXtmBGGrm3UCdK7eWYAEPP3ESqD01uXlnu0nIJRLI2s9en
 srst4xulE0iie9WimgUAuhuh/3zEBzV4gVBItPVbg+koaYntOhJ4Fm9eKplnb4FIFiWl
 28/pYYNvhfBCptaZfclI1UZcoMRR8Kf8KiUQy7Rj3RIpF/R2PCK291aq2Dn+DGof5xiy
 fxgLt9pKzbWeYgCDiR74R/fQtf9yev+LdY659Fj0b36jb61lfLqKJUStGUf1iwJdIEgA
 ev0Gs/8GJsAM4upZiUe3rkW9JPhE+uyWp0HCuak8FmztVbc9BlOZILKPDy0hN2l9zOWK
 cAUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeJwNaHAODg2Ud38MJ4leZ8Hi/A+PHfSLyE10Al4R5cvv60oFCobfvZ4/zL8Yn713qsAFZbynJdzQbU/X9kq0Izo0nnkQ=
X-Gm-Message-State: AOJu0YzApm7rhQjIumDBmkdM62BU+dUreiji8jq27bj/GbG0lKBeSl/9
 GffqCSV05/ws34/Iy18Uco3bF46V6jLTVGyNM2dFeg0GyUGujy36XmUgiKG3xp4=
X-Google-Smtp-Source: AGHT+IEZUpyayi4/xAQTGgufL3ZkRJQv+8SMJ1gjVuuZZkqCUh3AsbTN8VbFFBBFwwbcHmbFcpPfow==
X-Received: by 2002:a05:6214:493:b0:6b5:7fb9:747 with SMTP id
 6a1803df08f44-6b98ed245c1mr34824466d6.2.1721833281506; 
 Wed, 24 Jul 2024 08:01:21 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7ac7e5fdcsm59275936d6.50.2024.07.24.08.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:01:21 -0700 (PDT)
Date: Wed, 24 Jul 2024 10:01:18 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, dbarboza@ventanamicro.com, liwei1518@gmail.com, 
 bmeng.cn@gmail.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v6 7/8] target/riscv: Add any32 and max32 CPU for RV64 QEMU
Message-ID: <20240724-ef8cf69388fb767b6710b48f@orel>
References: <20240719231149.1364-1-zhiwei_liu@linux.alibaba.com>
 <20240719231149.1364-8-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719231149.1364-8-zhiwei_liu@linux.alibaba.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=ajones@ventanamicro.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, Jul 20, 2024 at 07:11:48AM GMT, LIU Zhiwei wrote:
> We may need 32-bit max or 32-bit any CPU for RV64 QEMU. Thus we add
> these two CPUs for RV64 QEMU.
> 
> The reason we don't expose them to RV32 QEMU is that we already have
> max or any cpu with the same configuration. Another reason is that
> we want to follow the RISC-V custom where addw instruction doesn't
> exist in RV32 CPU.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Suggested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu-qom.h |  2 ++
>  target/riscv/cpu.c     | 13 ++++++++-----
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 3670cfe6d9..9f91743b78 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -31,6 +31,8 @@
>  
>  #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>  #define TYPE_RISCV_CPU_MAX              RISCV_CPU_TYPE_NAME("max")
> +#define TYPE_RISCV_CPU_ANY32            RISCV_CPU_TYPE_NAME("any32")

'any' is on its way out[1], so we probably shouldn't bother adding any32
at all with this series

[1] https://lore.kernel.org/all/20240724130717.95629-1-philmd@linaro.org/

Thanks,
drew


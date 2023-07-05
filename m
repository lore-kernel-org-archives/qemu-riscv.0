Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE60EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 08:15:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGxfP-0004YF-Ha; Wed, 05 Jul 2023 04:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qGxfA-0004Wd-LB
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 04:15:01 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qGxf6-0006ye-Tm
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 04:15:00 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-992f6d7c7fbso562678466b.3
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 01:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688544895; x=1691136895;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0/WZ6781MvIOR+qgsR68tCvVFjtqlQLt6cCtAIGVrpE=;
 b=LiD+4jbm0YjbbRNRQnoBipGpHKHG3rffvMu2hFi/A0wRVNcrTk8SMPf9IROYcBmi69
 ru6eKEhYpKvsgfkAB2V58wG47UpNBMKjL1qFqLxEasWonTw/hooqyLSEUJZM3YvBXaae
 Q7tm4kmKRjNJ7LxbNO0/zHYY4esMd8m9YhGqq8tISCIgKpmfu3ysHFwG7urO9vrgXCPV
 ujSCmXP/96FLMsFPCnBOITgGyr6wZYFMvErufOWg6f2+Sv75nOJ0UNWXpbiKooOOeCeT
 zYPcsiw9YhOx/vb6EnynUJ4PnyVtn7i6NDTWU4qOa9QTMBOmkGx4w8MGxv6TuqSJyTN4
 m2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688544895; x=1691136895;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/WZ6781MvIOR+qgsR68tCvVFjtqlQLt6cCtAIGVrpE=;
 b=fWSiG9BO1P6tHDsJN598tk7Y46eYaNKC0VJhjOeR/XBgRsVswLnFY+Rt4tHnKZ+WiG
 LWrFZyDiviEObxa+FGoGjeRHSWojZLUtOfLEhePkamErhWZBm5YCf86DxOth1PLCvkEm
 egLBNYv1QQN1/pbyAJp8PDf7oYIG1RosF6MSKLFtbhuW4t/EJiLijwooUW0DlzF3aBa9
 KxwDCyBd5ecKZzLkkODqaWf21wHA64wPh3lB+IFrUnDbyVxVllkY++xEr0xptiAhiecM
 RIXQt73ehoQAadCvell9/RK1vF+kxhJPy3MUgMTcYIbnqMNt932kbr9YpsnAazq2nDyC
 XMBA==
X-Gm-Message-State: AC+VfDwxGZMy45zf8NXOnBvwmxwXEcfAHp+mLWDDfCY7URfO54aQm0yV
 KbVVAPEKuSrpRr4bQ/fIsQ31Bg==
X-Google-Smtp-Source: ACHHUZ71doAi9/phGNTNiFosywGK4CwK8WiNkay3m6bkm8YYOyxEOsw5p8At3eRd6RON5+dyKscXVA==
X-Received: by 2002:a17:906:ccdd:b0:991:de8e:4f91 with SMTP id
 ot29-20020a170906ccdd00b00991de8e4f91mr9421713ejb.11.1688544895342; 
 Wed, 05 Jul 2023 01:14:55 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a17090633c600b0098748422178sm14079846eja.56.2023.07.05.01.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 01:14:54 -0700 (PDT)
Date: Wed, 5 Jul 2023 10:14:53 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com, 
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org, 
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com
Subject: Re: [PATCH v4 0/6] Add RISC-V KVM AIA Support
Message-ID: <20230705-31abcb5d920f105c9a9ccaa8@orel>
References: <20230621145500.25624-1-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621145500.25624-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x632.google.com
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

On Wed, Jun 21, 2023 at 02:54:50PM +0000, Yong-Xuan Wang wrote:
> This series adds support for KVM AIA in RISC-V architecture.
> 
> In order to test these patches, we require Linux with KVM AIA support which can
> be found in the riscv_kvm_aia_hwaccel_v1 branch at
> https://github.com/avpatel/linux.git

Is it possible to add irqfd support? Maybe even as simply as the diff
below? If not, can you explain what still needs to be done in order
to do so?

Thanks,
drew


diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index 00fdb60fc6ab..b38d9bb5506a 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -371,6 +371,7 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
     }

     msi_nonbroken = true;
+    kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
 }

 static Property riscv_imsic_properties[] = {



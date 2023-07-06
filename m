Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055ECEB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 09:38:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHLQw-0007Sm-FW; Thu, 06 Jul 2023 05:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qHLQv-0007Sc-E9
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 05:37:53 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qHLQt-0003Mk-S2
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 05:37:53 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51d9128494cso680630a12.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Jul 2023 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688636270; x=1691228270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0YDhZnWVBjYPbyQSeU2KRYtScEDsZcOto/Uc1SRTiWk=;
 b=Hr6WF6aWk4ItEwY62hwq3xqHLyRTfZkXKS5I87wC/ji2DysvZSV80R1ohLVmtYM7tM
 2TIvFz9Qi9k0BfbsrISssQBlTZztGOvD7dSjgTbM1ES6cZCAhg2iM9Qsk67HD0BbooyD
 ftwms4Uh9zCjR8Y4Q8b2MiP9K6G3uf1ryooEbfS9LB8iRQ5xQtZf8Y6yPXUugjAFtm0N
 yU6YenLSCODPmWnbNmiAMOy1wIUOfrVGCrhlnKyGCSPX+fevbUoQLxWGPWFVJHJXiS4K
 Qn/jvuhJuRypcuu/eMvowb0b5/g0fAIuGzMU+V09COn75Yf+NoGwW6U1jEJZ4GiFMwQ4
 w6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688636270; x=1691228270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0YDhZnWVBjYPbyQSeU2KRYtScEDsZcOto/Uc1SRTiWk=;
 b=a49i3fNiIjtin0iSQVrTOcj/O2510eYryyyWo1jesrxasWhVKLTnnpl/BroXa2quL9
 isobv25WMjXsQ5T/CAXOs+nNdHRpvC8FvZWn81jY1x4PrvsdFsK+OAJnZo4e+RZUt2qs
 9SqEyyMSCrq6dP8cjiy/9LDzH7emjyTEYWnTUtSEeCuJsmdYaK5hchWd+/95yH4cB1G/
 O4QcSBwREkuiGjr3/ut25wUgsUWoHWZvITuo6hwX98siny8YYIakTM4P0rU53EX+lUM2
 gQdtVNl98anOm1EtjBHuyDZjZhLmJ7I5lb73oRygM4yHJ9nPdABRJoc2A98HJNhLquEX
 D7JQ==
X-Gm-Message-State: ABy/qLZqDsdJbRB7BoJZYr4nDWDq6OiXiQ17+VrQ58Mzc6qCM0QmSGyi
 hktdnxNug6sOB9N0V8RXGUBE2Q==
X-Google-Smtp-Source: APBJJlG4HElbpChl9zVrtcpmQxY5d3z9a8iziX7JJi/OdUJL5xU1jXkO7cm7TTjaCh5hFVdcJEzubw==
X-Received: by 2002:a17:906:2b51:b0:982:cfe2:32fe with SMTP id
 b17-20020a1709062b5100b00982cfe232femr1166575ejg.63.1688636270116; 
 Thu, 06 Jul 2023 02:37:50 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a170906454600b00992c92af6f4sm577739ejq.144.2023.07.06.02.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 02:37:49 -0700 (PDT)
Date: Thu, 6 Jul 2023 11:37:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v8 14/20] target/riscv/kvm.c: add multi-letter extension
 KVM properties
Message-ID: <20230706-38ab9f9705448bb10413f1af@orel>
References: <20230705213955.429895-1-dbarboza@ventanamicro.com>
 <20230705213955.429895-15-dbarboza@ventanamicro.com>
 <20230706-ec06b3d750f813f9c7256fe9@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706-ec06b3d750f813f9c7256fe9@orel>
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52c.google.com
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

On Thu, Jul 06, 2023 at 10:45:04AM +0200, Andrew Jones wrote:
...
>  1. Audit KVM to ensure using EINVAL for get-one-reg's "register not
>     present" is currently safe, and keep our eye on KVM to make sure
>     it remains safe until get-reg-list lands.

I just did the audit and it looks fine. There's only one way these types
of get-one-reg invocations can return EINVAL other than for "register
not present" and that's for the encoded reg size not being
sizeof(unsigned long). As long as we construct the register ID with the
correct size then that can't happen. We currently construct it with
kvm_riscv_reg_id() which does the right thing for these invocations.

Thanks,
drew


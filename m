Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704EDEB64DC
	for <qemu-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 11:02:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFYMS-0006E3-Lh; Sat, 01 Jul 2023 07:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qFYML-0006BE-SQ
 for qemu-riscv@nongnu.org; Sat, 01 Jul 2023 07:01:45 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qFYMK-0006Z5-BW
 for qemu-riscv@nongnu.org; Sat, 01 Jul 2023 07:01:45 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51d805cb33aso3152083a12.3
 for <qemu-riscv@nongnu.org>; Sat, 01 Jul 2023 04:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688209302; x=1690801302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iUgkxYj4hDdaeULOykMIAMiTYI4q7YAWRcLFU1vSbps=;
 b=Hl6PE+6tbQAK3mCvx+YO6XTFLzapBMm8lxpT/1mcQfSusfpxU8+WUET6DNyDlb9gG8
 tYNvNPt8I+LTE58jZu3BrFuSpW3vvVraNpSu+Jpl4S4ELRffi/YrwE/3b5LQSXuJjdyW
 ifHY4vY7etvbXXNEgHbvmWOL368iaR8tvZdn0DDuHJ338jSWzHaq2TX53R4OexKYDUoK
 10Qj/oj/1RBrC9bj45Lv8C1pWw05ejDbivtz8ZP/8XqTrjYHN98NiWBFHG+4fMjX3Mon
 TE0gKszRbjVhL0hqjesgen/EEUGk2UkdcGfZTNBbNiXC4qV1UuUpe9tEEln2IWWcvu+Y
 KcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688209302; x=1690801302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUgkxYj4hDdaeULOykMIAMiTYI4q7YAWRcLFU1vSbps=;
 b=JdszgegnTLdOJRWuP8Y2NZwWYLfxIc9OuAz4xCu2zSZoU8byEIWPK5mDQfS6ek8tBk
 0LXVRdrS2OhyoF0NrqJZPFK9xsncKjROfrWUBG5KLObZyeQ9bKZAaXpDU1bGN+gnht7Z
 qIFGs+vuckRDHcQcfvZ/OCr+vjoFQs/STPeFDnHd59r+ur5hN98igpUdLz3q4PvuIVsY
 L93yIq7XCWZH6P6FstlqI2C05Yr/OHVC1xboZwYQH+cSrEH6cEb2T+mTHEEhwCd4KCYH
 YGnH4bxOrslBgefe/p08mti1mReTjlFJEvLSM7W4kwWRS2nL/CTqIJxJdM2w34zH73SC
 hEeQ==
X-Gm-Message-State: ABy/qLZI3c70eRVB3JN45Ho+0Nspoww3lUUIlbXdCB5rAdzDpze0HcTS
 RBcSrh7AWyDcZLUbNjklK/XFPA==
X-Google-Smtp-Source: APBJJlFkK8StAK5YsG+2ZcpOu+kBMm85tO+8fKQBITtMoynDzvNSvGndfZtNLBSou1PvXBWQdFIuWw==
X-Received: by 2002:a17:906:7a0b:b0:98d:cd3e:c18f with SMTP id
 d11-20020a1709067a0b00b0098dcd3ec18fmr4312746ejo.72.1688209302131; 
 Sat, 01 Jul 2023 04:01:42 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a170906710600b0098e48ad11f2sm7705332ejj.93.2023.07.01.04.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 04:01:41 -0700 (PDT)
Date: Sat, 1 Jul 2023 13:01:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
 Leo <ycliang@andestech.com>, 
 Oleksii <oleksii.kurochko@gmail.com>, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, 
 u-boot@lists.denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230701-b348653e432924f090c513db@orel>
References: <20230630-very-greedless-16522d7b7830@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630-very-greedless-16522d7b7830@spud>
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x534.google.com
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

On Fri, Jun 30, 2023 at 07:04:04PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
...
> +oneOf:
> +  - required:
> +      - riscv,isa
> +  - required:
> +      - riscv,isa-base
> +

I guess this means a DT must have either isa or isa-base, but not both.
What should QEMU and other platforms which want to provide DTs that work
for older kernels, but also start using the new schema do? I'd guess
they'd like to provide both, where they'd expect isa-base to be used by
newer kernels and isa by the old.

Thanks,
drew


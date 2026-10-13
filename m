Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DCFCC6B03
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 12:11:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGbLF-0006xY-K7; Tue, 13 Oct 2026 08:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWVd-0001mV-AO
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 03:01:17 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWVZ-0006Fa-AE
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 03:01:11 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c350db5a761so260281466b.1
 for <qemu-riscv@nongnu.org>; Tue, 13 Oct 2026 00:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791874868; cv=none;
 d=google.com; s=arc-20260327;
 b=O8Deyb5fFj0wCIet1+I1gE6X95xydRWcFKY7K5kSEmfWJp9QZUFabnnvdZ0GeectJk
 aezKXk341gUmHCYQNfIlrkWckWMA7B7zDyPy65gxfSG/kVji1zzAq6yM4oUt9D7Hp9d4
 P10OfROwkM4uwQTBDm1W9N9hkRfonAMxk/tOe/+im+RXJmt28DuQjZGf75lfB2HlLCdb
 mBK0knoecRCYXytBWWmfuba8EDTKjDdPtFEAqr67AATwxGrO72n2ElZJqjzPK71zsbRu
 mzCL250zRcXSOnnXZAp2w9LhCoRmNyBJK3sdA9lvCvXhyRteUVD75jyA8WA/8/iWL2zc
 8Kwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TKCT5RnEV1vWOyylNVGqIx5R7i4UZOmdib+i9xrVYAQ=;
 fh=PrIck+c2bS0T0YKHxhli3SBDU4RzQknhXs60o6AnzV4=;
 b=a9VE1BZOdo6vKcM8vrTwqp1H2iFCWHdb+QhD/wo5C3lktN/3xJcWK5N6kx1O6bIi3d
 a062zE+AXOZskI7afjOh4jGbElsym/zAOep1wwBn6kj2UTuM6INmWqaqniJdTvAJ2PSX
 rhZ2+l6lHlUoeECoQhD9MR7qi8aAtIkvLK1htjABEc5E/CKt9Jjkc3Z3PRmWF8DP2kzB
 2xeK0ejXL4JB4amJ8/A1HUDFbPyAjhgWV63XbfAbkp8V1RXUWsu7rIwkgamWjA2/C3tX
 SC2OpTtWuL6lcBRlPOE6rIFZ8YJP2ZCZE3o3fWKd5ou/iJccb/LAGeHIHfBHjWIAUlMH
 CFDA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791874868; x=1792479668; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TKCT5RnEV1vWOyylNVGqIx5R7i4UZOmdib+i9xrVYAQ=;
 b=euDsU3nmDmV8pvwsq/RmQSM6yefFODWpYrQ911F4gUsavtNlacBv6ZjmuJeQl1XT42
 e2o5LfHDD9H6dhgozDnVz/nNrpWcC6T9c1n8/geC3A9PQeN3xezfB0zAighk7DBaRaDJ
 uHrXaoeVtHIkoeku+0Xh8z8CASfq0KV3pONFzFJigdzV3C/HlkZrqZYwjq4dnAOKuDJq
 7g5HflYa2WDbE/k045pKNJ6Y4XL+Elgkip1tBbNfxjJWeDmFcQhtc47OmtbpdYyNW6s9
 O/hoplpkA6BMT9dkLf/20iN0WnMj0a/FIzKGxg15IQcYBa4uJIAz1RUYNnm2VzR3tVYQ
 V/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791874868; x=1792479668;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TKCT5RnEV1vWOyylNVGqIx5R7i4UZOmdib+i9xrVYAQ=;
 b=NIJURuMRwzfG5QzZ07khIy3au8M8Ai+XhGg6hVEbvteirFFlBR7oZrQYxYaVliAI4n
 Ngc8sPKDnhsoUB7+Qj0vElA/6c/lVJDqwUWOwXWvmxbi6tc7kZI7r+WqspJb94MBpNR/
 P9H4caJLsWtoe5uIXkUInIzEVz3eqjwSrkL/OK90xrgUJcNTOUpA5p8A3B0dL4HXlzht
 DSiAUeIjQj2uE5IhuIev4kdu0uqDqwuLfUOiRQ1zvqNQeUWWUR8SwnwOGVewWjBMCcyG
 muWvbWdusQy3STlno42FwQsDuD0WiapvlhHAn1tcP3jiJ3myUurG9cCv6Dxz/0didhda
 KFpw==
X-Forwarded-Encrypted: i=1;
 AKwUvByBUBgH7elVpqTcSdBG1o9LVrpL3vZ3oLg5E9/RdkrGjlQLhvAoGj9KynTAaDRSmWBWX6plMX1Xab+m@nongnu.org
X-Gm-Message-State: AFq9FYL9l/QE01xdV12mHLei6U4/d28LgrblRqscQWNUG345Y1YU4MxD
 69nQNSeERPqJOv0iXaT7X0LQrHiLhoGAqEQSsYdrtZdnO6OoEI0iqKX2rMH3nIRlzlD2AMVed4m
 553D1LopFCrVZ489zYnOY1kjshNGR/L0=
X-Gm-Gg: AYBFou3EvGK85VVrJzLlDCzVaqXbqyUb8JucJ+oH2eSwoXJpaNUppQU2aBbDlS9WxJY
 +GrWlKuO38mQkNN1jASB8ggrUxmBx0IF8KnY6a0tGEbJIUW0LmzNym57WpJ8lS7lsWJcD8Z7MLo
 A854VaI5YKD5SI8rNkopul1fRJYYgoOEcvHtwJkS/7c+1nSRntyrVPzcOX0eVmvBbA56ZuxIT9C
 kuqnYLhX0FOPHFXNYOrl2WrMm1SyXFeSW3cUHMG7CeJFbwR0K+UBTJ2LJ3kE2QJjcipncsZLbyQ
 XG4nvHxMvQ0/7CHZryyTA7AFBSxf8+UbVZhUTfi3SdaZobPT8NcF
X-Received: by 2002:a17:907:724b:b0:c2e:1d6a:6b78 with SMTP id
 a640c23a62f3a-c31aa0e0cb8mr1176461466b.47.1791874867472; Tue, 13 Oct 2026
 00:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
 <20261012-bmc-minerva-v2-3-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-3-4c3dff084ec9@free.fr>
From: =?UTF-8?B?5p6X5bu65piO?= <jaminlin1207@gmail.com>
Date: Tue, 13 Oct 2026 15:00:55 +0800
X-Gm-Features: AclHuK_0EmA86gxslNXKzkKFMXSLT-zOmF24a1p4E6djvihwlnmWjCpLOGNXMCs
Message-ID: <CA+8rw5xkA0idsTC5e+G=YWLDn4cPLkvMiDNjcT9ef5Sh_3QMQQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/50] hw/arm: sanmiguel: remove the second SPI flash
 controller
To: Emmanuel Blot <emmanuel.blot@free.fr>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=jaminlin1207@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Oct 2026 08:10:03 -0400
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

>
> The board only populates the flash device attached to the FMC
> controller; the SoC SPI controllers are left unused. Advertising a
> part there presents the guest with a flash device the hardware does
> not have.
>
> While here, add the missing year to the copyright line.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
> ---
>  hw/arm/aspeed_ast2600_sanmiguel.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/aspeed_ast2600_sanmiguel.c b/hw/arm/aspeed_ast2600_sanmiguel.c
> index 345a9c9416..ac2aef740a 100644
> --- a/hw/arm/aspeed_ast2600_sanmiguel.c
> +++ b/hw/arm/aspeed_ast2600_sanmiguel.c
> @@ -1,7 +1,7 @@
>  /*
>   * Facebook SanMiguel BMC
>   *
> - * Copyright (c) Meta Platforms, Inc. and affiliates.
> + * Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
>   *
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
> @@ -384,7 +384,7 @@ static void aspeed_machine_sanmiguel_class_init(ObjectClass *oc,
>      amc->hw_strap1 = SANMIGUEL_BMC_HW_STRAP1;
>      amc->hw_strap2 = SANMIGUEL_BMC_HW_STRAP2;
>      amc->fmc_model = "mx66l1g45g";
> -    amc->spi_model = "mx66l1g45g";
> +    amc->spi_model = NULL;
>      amc->num_cs    = 2;
>      amc->macs_mask = ASPEED_MAC0_ON;
>      amc->i2c_init  = sanmiguel_bmc_i2c_init;
>
> --
> 2.50.1
>
>

Reviewed-by: Jamin Lin <jaminlin1207@gmail.com>


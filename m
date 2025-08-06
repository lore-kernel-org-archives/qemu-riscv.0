Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92479C87FCB
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 07:23:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ujYUI-0007II-4f; Wed, 06 Aug 2025 03:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujYU7-0007Dw-TG
 for qemu-riscv@nongnu.org; Wed, 06 Aug 2025 03:22:56 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujYU5-0003Lp-Qx
 for qemu-riscv@nongnu.org; Wed, 06 Aug 2025 03:22:51 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so55614905e9.3
 for <qemu-riscv@nongnu.org>; Wed, 06 Aug 2025 00:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754464967; x=1755069767; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bae4Rj8LksmUKRExgA49m4XV5dPKfuJ3tBM7IB+NI0M=;
 b=xlQPsPLyN4ro1uJ0/pEenwFv0bwb79kA59DNSycpieDf4+EV2PBni9a+1HEq5EHBii
 HFmvCodYswicyQzYcI8Ks2GaC5OAqVNujzMvCA5WA8WVu+v1uEDHCp6l0YdtzvoMc+lp
 y/YF5gjRuWHntkTeX0Q1K2EiLVab7JGajM7vX7YXVn/BplSN5kec+2HNVvvH0vR0XqTC
 XO/7HHz6V38VwFVsbGGo9sAdqAEnqfsQA19mqBPGyVNhVbhwOm3CG+xXiZUQz2ZA+6ws
 BJZ8exGv6G12L1ZSRWxowo6PCTKfCxTYwCrYJfFq0FaF/Ri1CitqX8Owa+zX6my/Vpb8
 jasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754464967; x=1755069767;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bae4Rj8LksmUKRExgA49m4XV5dPKfuJ3tBM7IB+NI0M=;
 b=WXZ+gumasSKOogxuZfqQMI3WTsgHPEPITgRyCJoBN9setqfwNoSZBcS7aQRK2KZuxs
 Huimv73IbauOuV6QKooAMUUbC918c0v6CyLJDidslzzM3k+M9arc9b7ck7kRh+TRRUql
 4RvgiG31hdTiKa0tZjw7r0gkeFGHAGj2OIcKDVRsXCi20shOR0HqwBp9MK8dLgXPu2jt
 EuhHFWdCkt+BVkXJGce9yKOHQu9Gdi7/VuQXuBKjjhsSmjd3OaH0enn4tpBP23aB0am0
 kcyur8EtACF+QXP5StO0GKbATAhgMqQwdq2lMUvxSXHjaNCO9ShEEmNzUGXI1jnCakgw
 1qHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIg4+h3uDMoV4nA9hwlMWBaE5TJCualotHav0Q+SeQZx1Sk4EOPWH53V28qTpP31G+izEhYCMkeyVu@nongnu.org
X-Gm-Message-State: AOJu0YypTYXeApy3zkkBHe3r0BmkI3WxgHGvyCLUOPcPp+Uar3+aucj7
 EMXOaBx2deTG/IOrZbEHKAV2P0L86mxe1KckcwvtWt8BwPgGkehKNGnxX7gIvSP/Bzo=
X-Gm-Gg: ASbGncsW9ceK3AAFj38RCVRuP/JrLZeRWZ6DkWE6NJ+TiamhSbCcWwL3jVgu96wCXxo
 czgdfnI2zYe/Tsh+s7NgphFRRiHFlL/+ob8dnCyeS4pxZwnc0Qp+eupIi3jrqf9Jtgmdx4KAZpg
 EReJOSkfF8C91KhgpMkmRw+T5qBNZEX0Pn1E7BEJ84iybzhU/fEyUj58lS5pRFeuPQBotv0g+dg
 W1bUYjsRAznvIESnqbMeZOYPAEcX9NOmeVxXWOI+2zpmUyb2puwwbJSbkLw78b1cKs9STQzaq3c
 TuwFsW0pyggKPhg7hoiEVr/vDvpuIDUqQVO9MtasBbW6gm17gZMisEa55SkCjmmEwGNj4eI2vaF
 mf/r5jySLmGzLtRjNBo6qw6eFsZekLZljmedwkOa3xbBcbaIiwTFlmax7DdMe/M7vhw==
X-Google-Smtp-Source: AGHT+IEq7Fi+v8VMGb3iE03uYVSnoegLa4ss7xD7txAF33FygpV+xi18teaRJhVGAgls37e5/InL+A==
X-Received: by 2002:a05:600c:a342:b0:459:e3a1:a0c4 with SMTP id
 5b1f17b1804b1-459e70f63cfmr14736275e9.30.1754464967572; 
 Wed, 06 Aug 2025 00:22:47 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453333sm22751525f8f.45.2025.08.06.00.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 00:22:47 -0700 (PDT)
Message-ID: <9dc90489-9e74-4e00-8fc6-f97e3f425495@linaro.org>
Date: Wed, 6 Aug 2025 09:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 00/11] hw/sd: Fix SD cards in SPI mode
To: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
References: <20250804133406.17456-1-philmd@linaro.org>
 <39982478-b3fb-46b0-bef0-c0839c123300@tls.msk.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <39982478-b3fb-46b0-bef0-c0839c123300@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/8/25 08:39, Michael Tokarev wrote:

> Philippe, do you think this series is something which should
> go to stable-10.0 (LTS) branch?  I'm not sure for the impact if
> it is not applied, though, - what do we miss in this case?

Only 2 machines use a SD card wired over SPI lines:

$ git grep '"ssi-sd"'
hw/arm/stellaris.c:1302:            sddev = ssi_create_peripheral(bus, 
"ssi-sd");
hw/riscv/sifive_u.c:671:    sd_dev = 
ssi_create_peripheral(s->soc.spi2.spi, "ssi-sd");
hw/sd/ssi-sd.c:70:#define TYPE_SSI_SD "ssi-sd"

I don't know them enough to tell if they are that important. This
isn't a security problem. The emulation of the transport (SPI) to the
SD card being broken, guests can not access the emulated card.


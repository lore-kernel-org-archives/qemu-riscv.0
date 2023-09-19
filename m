Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92937CE79A9
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 21:41:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiiT6-0008Tl-5O; Tue, 19 Sep 2023 17:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qiiT4-0008RU-U8
 for qemu-riscv@nongnu.org; Tue, 19 Sep 2023 17:41:14 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qiiT3-00057D-5n
 for qemu-riscv@nongnu.org; Tue, 19 Sep 2023 17:41:14 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6b9a2416b1cso4077020a34.2
 for <qemu-riscv@nongnu.org>; Tue, 19 Sep 2023 14:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695159672; x=1695764472; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DWreNtzW5Du7KZ4Np7KARTRlOQBqABg3WbFf1X7TYQM=;
 b=Vu62oNX374FwBX8Nx6I20P0qk0vxY/LLqpkALRp5MhErO+rzahUry1Kethyngu1Qwm
 /MQiXEZmpxiPftEy0vRXJ+oTgp5mnfSpTNL1wL2HMyX5PNbc0Dli9lAFOco0CKU87WI2
 BK4rTE8XewWDhokKuSULCtcS5hHuor3DwxsF4PRGrSnfh+L6kImXa6C9qjNTNT8rFxXA
 +Fm3g24yejQPuuiPe3XQEbYYt7Sikyy0x8DtpA6Y3qg/KlZ2XAsti7UFvoeZbjJJS/uV
 ifvhgzqhHdhB9p7rRrvnzD3tM6H8ipZGfg2rfux0yNS/LrQAq4+G5ubSbg5NwjwB9rVO
 xz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695159672; x=1695764472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DWreNtzW5Du7KZ4Np7KARTRlOQBqABg3WbFf1X7TYQM=;
 b=eC8PEpTech0O9eGv6Zr/I2y1X1NlawBJYWYNqPX+Tp2hYsH0ZN7h+vTnaKNkD0ixso
 zm56XgOTnFXozMrUA2/KPMsN+zChfWHdpJTtqv+fCgWGsXbquno9zuEO/LDbGO3NJaZF
 Kn0iMbzMyX4J+KhQqYOD7vJEfS/7S3LaJLKKyGZ3mpubt3iELvzY6fKDzwxawpFHlBmK
 DCE90UT063XoGkY/pQJrPlGcePLW4svHdaEUow+2xhb+gABGzBs2xm+gGM1XwPqgg+Rx
 gC8MFkxWLj2XuHEslDWh5byJDkNiO3ZYoj80TjHAnBxY1dJY9R+hxZSIp26NxBR6zyjg
 bcYg==
X-Gm-Message-State: AOJu0YwaLfcOl/btke6pDfXLi0ogvI61DaMAandN7xB/kxbsV1nyEm8a
 dsPkiiBgqcL3qE2gJM4MaAv27A==
X-Google-Smtp-Source: AGHT+IF2fG4S9vB0jm9W9fzFE6n5VjTAM4wNHF00jIkvakLn2Ra3yOk9MWUcTuKADzKNyNpQ3rRSBA==
X-Received: by 2002:a05:6830:1616:b0:6b9:8ea6:fbc2 with SMTP id
 g22-20020a056830161600b006b98ea6fbc2mr832424otr.27.1695159671893; 
 Tue, 19 Sep 2023 14:41:11 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.59])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a9d6650000000b006b871010cb1sm5572293otm.46.2023.09.19.14.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 14:41:11 -0700 (PDT)
Message-ID: <651db547-7297-dcb1-91c9-f9a54f568be2@ventanamicro.com>
Date: Tue, 19 Sep 2023 18:41:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: GPIO emulation in QEMU RISCV
Content-Language: en-US
To: Sivachandran S <siva63@multicorewareinc.com>, qemu-riscv@nongnu.org
Cc: Deepak LS <deepak34@multicorewareinc.com>,
 Pandian Ayyar Karuppaswamy <pandian.ayyar@multicorewareinc.com>,
 Balaji Viswanathan <v.balaji@multicorewareinc.com>
References: <CAL==hzHC2hA_m38NNpALjOdpFsEqpDp6Za0Rmw52ZW+aYTSOOA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAL==hzHC2hA_m38NNpALjOdpFsEqpDp6Za0Rmw52ZW+aYTSOOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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



On 9/19/23 10:23, Sivachandran S wrote:
> Hi Daniel,
> 
> We are working to generate device interrupts via GPIO.But the problem here is by default the QEMU doesn't have any GPIO device emulated. (QEMU 8.0.0)
> 
> 1. How to emulate the VIRT GPIO device or any other GPIO device in QEMU? The device models listed in QEMU don't have any of the GPIO devices listed. Any idea how to enable any of the GPIO device emulation in QEMU RISCV?

The Si-Five boards (sifive_e.c, sifive_u.c) uses the Si-Five GPIO device. In
sifive_u.c the device is create here:


static void sifive_u_soc_instance_init(Object *obj)
{
(...)
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_SIFIVE_GPIO);
}


The device itself is implemented in hw/gpio/sifive_gpio.c. In this file it mentions
that the Si-Five GPIO device was based on another GPIO device implemented in
hw/gpio/nrf51_gpio.c, which in turn is based on this reference manual:

http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf



Thanks,

Daniel



> 2. Also whether a software patch is required for the QEMU to enable it? If so, please point to it.
> 
> Thanks,
> SIva.S


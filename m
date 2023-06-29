Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F4AEB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 13:14:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qErTg-0002pi-42; Thu, 29 Jun 2023 09:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qErTf-0002pS-Bh
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 09:14:27 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qErTd-0006qr-AO
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 09:14:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbc0981733so3278535e9.3
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688044463; x=1690636463;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4HGhkT2pkRfKP+xt/D+slTkYWgm6XqxwpAxVQ7LBa5o=;
 b=VkH55KNZkhRHJC9gWuZHkKYFGx91MvBasoM2cePI24HqYfiELWEIxSkvLxEz392lZ2
 iaG10wTVVMXLZL/Hwm/Mt8RQQoHE4BZ1EI/sAnh4A1fcH/GgX0yuU5nkjrc2oufHUfKg
 zuCmhDY5R0qY3HrVSeZh21P8VnIBx87sWacX1gAM/FxejJhJoB0TB6kjngnr0wpmovC5
 9+owoTco3uT8EqjspaNpclEKELRGrsg565AlqEspF5O0vwU0ei2Y+Z5a+88l7s4Y8lGy
 FwLSh1yxdlDMEjuPQuPRSHr7NK8vOAkqX0YxujYQTOe3rxmekH5vNFF741XpU6d40Q8w
 TztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688044463; x=1690636463;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4HGhkT2pkRfKP+xt/D+slTkYWgm6XqxwpAxVQ7LBa5o=;
 b=MTwJHQVtrErcrKTwAOyuhHLRZGBuqju36ARW53GqQ+M7PQH/TPwG8UnxRZ5bswe0xR
 CPVi/OgR8XBQy/yw9I8ekL8MmIne31WyCLBFg8RD28jk2DEmTGM1XdyizHU9xSU0E2Se
 ZlQrslPSeiLtt3w6TWelcu8RKwaeTcWRm3IGmuChzCSLxBCftRbkRBUcBkPHjR4S5/1N
 DJ2cnA6Xt0o4xxbf/ZRt4NwYb7c3iuXw56wdG9vYFUdnFQtr92N9gaX5h3saUXq9im9H
 NlJ1Pm7SJWJfIN+q5GjwrKorm9eb1XyqYnJMPVi0hmGrF9/maOFev8Oh2bS4h+CQiwc1
 DS9g==
X-Gm-Message-State: AC+VfDwf3A++wQogOVK4/BGmI+NWGdBpHr7zJBcQ+NJGIA8zAxi8aB8x
 peX05ZRBfhizP7+p5zAZvjlCLg==
X-Google-Smtp-Source: ACHHUZ7vM5sFVpeE67gPsWFnipdTRE1hiU49LlYxYANpt0Och4aI9dtkqVKFZzDByI3SosDXMje+HA==
X-Received: by 2002:a05:600c:2204:b0:3fa:8db4:91ec with SMTP id
 z4-20020a05600c220400b003fa8db491ecmr9523766wml.10.1688044463026; 
 Thu, 29 Jun 2023 06:14:23 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a1ccc0b000000b003fa8158135esm17081716wmb.11.2023.06.29.06.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 06:14:22 -0700 (PDT)
Message-ID: <9624e58a-1305-c522-2405-fcbb53e01dcb@linaro.org>
Date: Thu, 29 Jun 2023 15:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] hw/riscv/virt: Fix 'controller' typo
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230629121103.87733-1-philmd@linaro.org>
 <20230629121103.87733-2-philmd@linaro.org>
 <057c335b-a614-95c9-953d-d9eaa793d529@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <057c335b-a614-95c9-953d-d9eaa793d529@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 29/6/23 14:26, Daniel Henrique Barboza wrote:
> Phil,
> 
> I've fixed this typo a few weeks ago. qemu-trivial picked it up.

Ah great, thanks :)

> Thanks,
> 
> Daniel
> 
> On 6/29/23 09:11, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/riscv/virt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index ed4c27487e..68ccd0bde1 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -1692,7 +1692,7 @@ static void virt_machine_class_init(ObjectClass 
>> *oc, void *data)
>>                                     virt_set_aia);
>>       object_class_property_set_description(oc, "aia",
>>                                             "Set type of AIA interrupt "
>> -                                          "conttoller. Valid values 
>> are "
>> +                                          "controller. Valid values 
>> are "
>>                                             "none, aplic, and 
>> aplic-imsic.");
>>       object_class_property_add_str(oc, "aia-guests",



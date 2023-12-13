Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866F5C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:13:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rDQvE-0006Qc-8K; Wed, 13 Dec 2023 10:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDQvB-0006PM-W0
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 10:13:14 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDQv8-0007Wc-H9
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 10:13:13 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c3f68b79aso50318265e9.0
 for <qemu-riscv@nongnu.org>; Wed, 13 Dec 2023 07:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702480386; x=1703085186; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NacKrLcFKE+swjj3apwDGz+I51NWfy8uBYCUPz0MLbo=;
 b=ogV16M+hF28h9k37iucj4mnVGzb9ELEwGdpwdi/as1E8IrS+kQRETIg3YaKQAEnXPM
 pO26vGVMMTz8wwMNYoE04C2fyEldhK2e96BWyDi6JYUtfDONKSsrFrS2LAz4M464Ux3I
 Zk0chdapNwQTDy/vKebhqJea2R623e/1rhFctgQiME951bx8ij/CmLkhOpgJRnHwqlup
 HqNVTQ2qforoW+3rQ9Y2ZNDdssBHP8fxNOHM3q1WSjxneAdMth5qWCpQDnSiEXavq5Uf
 e4NW0KzpVHyee44XYWgCTR/2dGLU9OmWWwkX89m35yrYm9NgOvcQgoNDrvGF/I7FAAcT
 zimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702480386; x=1703085186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NacKrLcFKE+swjj3apwDGz+I51NWfy8uBYCUPz0MLbo=;
 b=hPNZCgJCIAewv/5tNboiSrzpC7/N7I2a2Wr8YUO32I5mPFHDbV5AZOhE/ocAGzX/Md
 JK4rYso93vYQ2KIZj3hpNBVjnWcGQbwotoRcBvbVPTJrpVdukOzrjRhZYoYXz0mJtgH9
 lrUjet8v82XvvIwF/yYkn7fN6rnxV8bSk2RldZyhIl+zyt7T0d7YzGfOg5s4GabY9FDg
 iqOpSryWL5skA9945kTPuk/FqB/3j5h3s2IxLGC8EV+qShRRC02GxbSwdRd/Sv3752wk
 IrmzUi1x7YC8cYGO2Xh+5Yk5PK+LSO2Af8Ixun1lG4xjOw5CwVz7w0qWaL7DjLJ+wbOR
 X5sA==
X-Gm-Message-State: AOJu0YyLz154Azy5+nsZUDRRGnls8HMXhDWsJgfout7WITwH9UNbYpuK
 qE1Ji5qQnZH9xyatjwJLtf8ipQ==
X-Google-Smtp-Source: AGHT+IHWPgPq1Qz3fNek7La9w78eboVD77R6REFM2CaruuSR28jnQGFN7L2wKoY5L1a8EKgUGxoC+w==
X-Received: by 2002:a05:600c:308a:b0:40c:370d:71e9 with SMTP id
 g10-20020a05600c308a00b0040c370d71e9mr4859136wmn.77.1702480386382; 
 Wed, 13 Dec 2023 07:13:06 -0800 (PST)
Received: from [192.168.71.175] (76.red-88-28-19.dynamicip.rima-tde.net.
 [88.28.19.76]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c354100b0040c411da99csm15326015wmq.48.2023.12.13.07.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 07:13:06 -0800 (PST)
Message-ID: <90e11c50-2640-46e2-978e-ca989768f861@linaro.org>
Date: Wed, 13 Dec 2023 16:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/23] exec: Declare target_words_bigendian() in
 'exec/tswap.h'
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Brian Cain <bcain@quicinc.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-16-philmd@linaro.org>
 <ryg3gighbp4tzel44ogzgvt42nwehllmfjrfe4brhpjgornd22@o4glvgq2p67j>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ryg3gighbp4tzel44ogzgvt42nwehllmfjrfe4brhpjgornd22@o4glvgq2p67j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 13/12/23 12:20, Anton Johansson wrote:
> On 12/12/23, Philippe Mathieu-Daudé wrote:
>> We usually check target endianess before swapping values,
>> so target_words_bigendian() declaration makes sense in
>> "exec/tswap.h" with the target swapping helpers.
>>
>> Remove "hw/core/cpu.h" when it was only included to get
>> the target_words_bigendian() declaration.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/tswap.h     | 12 +++++++++++-
>>   include/hw/core/cpu.h    | 11 -----------
>>   cpu-target.c             |  1 +
>>   disas/disas.c            |  1 +
>>   hw/audio/virtio-snd.c    |  2 +-
>>   hw/core/cpu-sysemu.c     |  2 +-
>>   hw/core/generic-loader.c |  2 +-
>>   hw/display/vga.c         |  2 +-
>>   hw/virtio/virtio.c       |  1 +
>>   9 files changed, 18 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/exec/tswap.h b/include/exec/tswap.h
>> index 68944a880b..77954bbc2b 100644
>> --- a/include/exec/tswap.h
>> +++ b/include/exec/tswap.h
>> @@ -8,9 +8,19 @@
>>   #ifndef TSWAP_H
>>   #define TSWAP_H
>>   
>> -#include "hw/core/cpu.h"
>>   #include "qemu/bswap.h"
> 
> This breaks system/qtest.c which gets first_cpu from hw/core/cpu.h
> through the inclusion of tswap.h...
> 
> ../system/qtest.c:548:33: error: ‘first_cpu’ undeclared (first use in this function);
>    548 |             address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
>        |                                 ^~~~~~~~~

Doh sorry, in this series I dropped some already reviewed patches,
and extracted some not-that-related series. I was lazy to add the
many 'Based-on:' tags on the cover.

What you mentioned here is fixed here:
https://lore.kernel.org/qemu-devel/20231212113016.29808-1-philmd@linaro.org/

> Adding hw/core/cpu.h to system/qtest.c seems sufficient.
> 
> Otherwise,
> Reviewed-by: Anton Johansson <anjo@rev.ng>

Thanks!


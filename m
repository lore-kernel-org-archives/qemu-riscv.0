Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BACCC4345F
	for <qemu-riscv@archiver.kernel.org>; Sat, 13 Apr 2024 09:51:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rva2K-000408-Jt; Sat, 13 Apr 2024 05:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rva2G-0003zP-8I
 for qemu-riscv@nongnu.org; Sat, 13 Apr 2024 05:51:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rva2A-0003J9-89
 for qemu-riscv@nongnu.org; Sat, 13 Apr 2024 05:50:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-346359c8785so1221388f8f.0
 for <qemu-riscv@nongnu.org>; Sat, 13 Apr 2024 02:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713001853; x=1713606653; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bJOu7SmLQ4SK5G8Ze27aM5i/v4HGQsYscYUNFejLy3o=;
 b=o7UjCJzAdN7pqFFGNqU71c4edggRqD2f2jNBCoXR8zJJpLPQ7tbaNZqYm710byKxAB
 JvQQfrk52fuAeIau+2deTwakhCu7vezT4nWjpC37mM2M2W+wUFPDFi5IBlGmYEuo9L9C
 z7cMmoQYMbS27pUvAHg0HZu2ZNhPk7dZBKkWyPztYdYqs4PyuSNI9q450uI1MuGQb2TM
 zVAJbNHPfmwfdy1ct55fJvGJeOqbvnPbrtSFn+gs58p3UVHBg8ac++t+7wDK37HOcPRz
 GHnxTj/MZn+RoO2vTJ9Vo407cFE2V2hX6vsoQ3kLK+liHvXVURxp2m1Ua7hGW+QHxMWy
 AXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713001853; x=1713606653;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJOu7SmLQ4SK5G8Ze27aM5i/v4HGQsYscYUNFejLy3o=;
 b=Nv2mYkILbRXLr4RZUDwjPB7yG8MUj3YoZH3VOEzojPMmmgRxsUwXe4/b7q3eT0zGDv
 7HPRZZdxhdrqYRnEzrOx6FfhsNKQLIc+YodGFrrqg5g6jlRywC0rN2O5jsbCpk6nRhyW
 XRAED7pzAdO/4jDrfXQ29TuQYxhKdzTcI19TBWQbL7sL1DDSPJHTPY8AdxM2wov5Mmjf
 EwNLcg6xThXqeGJKKtPq128QRYiAegTc+wvsNXkyQ1s1NX4z1LPPXBd4G6s3OGWB9gik
 XKUKs/5X880o5dqnh39FHQ9wgVLPPpOWD/VbPNstSHvIDJiV3K8rFH+b6Bh5yP5WPaZs
 ngZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0RMWm2X0qnBAJ15eM83u7O51A1dZXsquphMYn5Mrpg8lD47QGfef22kZ3kHhNF6cNM+PdvafU/xxccOyyAYO9Jb6E6MA=
X-Gm-Message-State: AOJu0Yy+J6tyKr1pOyeKQ3Y1qCjXA+zJrO3WtO0icVPQS2sVb+2nN1A5
 KXDp/pSYb1I2y/OjuK3jv+iwZbgBRze7o5GXInDQJbiqVjbdXWqbceaM0gBBwUEK9QoX1ukj4sn
 e
X-Google-Smtp-Source: AGHT+IEDeOsfbS+NVLX/0Ea2NGXoTMn7gGRN53iVRd/TDVYx+A6F9z/VhxE2nBRNGrwMfv/SPu7wkA==
X-Received: by 2002:a05:6000:232:b0:346:e650:61eb with SMTP id
 l18-20020a056000023200b00346e65061ebmr3154664wrz.9.1713001852631; 
 Sat, 13 Apr 2024 02:50:52 -0700 (PDT)
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 e8-20020adfe388000000b003469b59b2a2sm6183094wrm.106.2024.04.13.02.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Apr 2024 02:50:52 -0700 (PDT)
Message-ID: <a6bb2e1d-ef8e-446e-b898-5ddf13cd66b0@linaro.org>
Date: Sat, 13 Apr 2024 11:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw: Add a Kconfig switch for the TYPE_CPU_CLUSTER
 device
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20240412062042.105174-1-thuth@redhat.com>
 <20240412062042.105174-3-thuth@redhat.com>
 <12d6a650-a0a9-4e25-9ad1-68aa03064794@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <12d6a650-a0a9-4e25-9ad1-68aa03064794@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 12/4/24 11:15, Thomas Huth wrote:
> On 12/04/2024 08.20, Thomas Huth wrote:
>> The cpu-cluster device is only needed for some few arm and riscv
>> machines. Let's avoid compiling and linking it if it is not really
>> necessary.

I expect clustering become the new default for heterogeneous machines,
but we are not there yet.

>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/arm/Kconfig     | 3 +++
>>   hw/cpu/Kconfig     | 3 +++
>>   hw/cpu/meson.build | 2 +-
>>   hw/riscv/Kconfig   | 2 ++
>>   4 files changed, 9 insertions(+), 1 deletion(-)

>> diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
>> index 38cdcfbe57..43a34c4c6e 100644
>> --- a/hw/cpu/meson.build
>> +++ b/hw/cpu/meson.build
>> @@ -1,4 +1,4 @@
>> -system_ss.add(files('core.c', 'cluster.c'))
>> +system_ss.add(when: 'CONFIG_CPU_CLUSTER', if_true: files('core.c', 
>> 'cluster.c'))
> 
> Oops, sorry, the switch should only be used for cluster.c, not for 
> core.c. I'll change it in v2 ...

For v2:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>




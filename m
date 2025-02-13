Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BC6C0219D
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 12:15:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiY7w-0000NI-Mr; Thu, 13 Feb 2025 07:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiY7j-0000GD-JV
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 07:15:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiY7d-0001bT-7t
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 07:15:15 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso5075635e9.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Feb 2025 04:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739448911; x=1740053711; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vzaZlFcD7N8Wjjl/eyiqiLniNbSdtEp+pnDniDyde9g=;
 b=Pg3FHKISHaAtXrGWtFVY08TIL9aysYhOYseQmcTFL8CK2Eno5IVrGE5PCwC/2AhwWo
 5BOHM7y+9q1djsgMw9Up3FQARK7f+666Qvs7AKlyIGbbLbnBY2fvvMcIVPWKeAJKN8HZ
 Val2BwDAiFFmx9a7ntb6nizQYrG+TEFo6VfTnekbXJ3d+viBk6L8z525voyeWozQE7OA
 kIaVZHhSzJgTquFRCMFpV7MKIT6/OF/lpgiOYhe1gaMlMbq1uEj4olGPOdijo78k1x+b
 Xdss8pQb3GuvdA+I3hWniuPOXKufIemugpilf+Rcl2zJispv9gqiD+33+S4zXlo9g4bB
 TSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739448911; x=1740053711;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vzaZlFcD7N8Wjjl/eyiqiLniNbSdtEp+pnDniDyde9g=;
 b=TVKbB3buNGu3J1EiCwmrMnh86XaxLKdVjE/H7bzn9HhvEyoHFFWJo6+z7ErO+L2BVX
 Vrej6hJGO2irUYcC65ONCtcAuJH6+48NQV8ZjHArzInYmQdL5W8wBHM52FfcDwJMSV5g
 sRujlIadYGftMAvYqMOOMkdXqT7O3l5a0pVqS6TJrgzo8Maf4zieFUyimq2KMx3d4GF2
 VupwpMLqaGCibbjD+DvLf9+gB1PRSseATdhCrwLG6VT5MmhcqUZUnXhWWOSF4nuFZMQw
 qISgXOO4rIU2SmyA+LWSbuxj36DaQQCWzGCvYYMcAnPzx43pBhAc6PuhYj8dRaciYRWF
 Z6cw==
X-Gm-Message-State: AOJu0YyPGwp6N0fDGzOI/l+VateacvRJ8iIHpO850vVL6nlEmCUS1mmO
 vT33GrdbKlZcnSq5yeaiRm9AQT9HpYk/E5lZGw9QERHCsgTnwwt6v6wsltuIiu0=
X-Gm-Gg: ASbGnctacDyV761AZ1o2ovj4VsOz7NMc+maClMKnbWlH5K4kqVD9K9KzrKvt8l39Wrl
 qJrwKEaBulORP1obb9B1FAE27hlAeP0Kiybh1o3lAsq+STDFI3uc1CBkbhjuI6GdrPTr7jHUsjE
 55HeHZ6EytEV5yF0s9i46P8ZHKm3sLXeoeMszGGCNqUoZ+T8XtWCGL0jUKPZ2iXNFFIicmNT1EQ
 4bdYpyktskbRUsJygiplkduEskujHrHIQkFfAl+IuhwHDV1XE7ZYAH0vRjP3oTy9/cW7eZxxxuK
 HnsBgYH2toFqjEBQ+n1hvYaRbv8NWyDMuBd7e9Zf5ZWdP28=
X-Google-Smtp-Source: AGHT+IFVSdY4A8hl0J8R1xzffZyqo2EGtj4UJhs4TdlGadkWQGH3lOBL4wCLTSkruaWT1uY1DCXCSw==
X-Received: by 2002:a05:600c:444d:b0:439:5529:33e0 with SMTP id
 5b1f17b1804b1-439581bf09fmr64411835e9.27.1739448910744; 
 Thu, 13 Feb 2025 04:15:10 -0800 (PST)
Received: from [10.223.46.213] (6.170.88.92.rev.sfr.net. [92.88.170.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4394f2c2c41sm63499255e9.1.2025.02.13.04.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 04:15:10 -0800 (PST)
Message-ID: <57ab57e3-65cc-4301-922f-87dbaaf85d8b@linaro.org>
Date: Thu, 13 Feb 2025 13:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/10] hw/intc/xilinx_intc: Make device endianness
 configurable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212123659.52764-1-philmd@linaro.org>
 <20250212123659.52764-3-philmd@linaro.org>
 <8e5050d7-2792-44af-8317-2dd6948f72c7@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <8e5050d7-2792-44af-8317-2dd6948f72c7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 12/2/25 13:56, Thomas Huth wrote:
> On 12/02/2025 13.36, Philippe Mathieu-Daudé wrote:
>> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
>> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
>> Add the "little-endian" property to select the device
>> endianness, defaulting to little endian.
>> Set the proper endianness for each machine using the device.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> ...
>> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/ 
>> petalogix_ml605_mmu.c
>> index 8b44be75a22..55398cc67d1 100644
>> --- a/hw/microblaze/petalogix_ml605_mmu.c
>> +++ b/hw/microblaze/petalogix_ml605_mmu.c
>> @@ -111,6 +111,7 @@ petalogix_ml605_init(MachineState *machine)
>>       dev = qdev_new("xlnx.xps-intc");
>> +    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
> 
> Do we still need a TARGET_BIG_ENDIAN ?: check here, too? ... the 
> petalogix_ml605_machine_init() code still contains it, though big endian 
> is marked as deprecated and untested ...

Oops, I guess my mind already discarded it...

> Anyway, assuming that nobody uses this in big endian anymore:
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks!


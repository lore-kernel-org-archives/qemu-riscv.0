Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23500CCF9EB
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 13:19:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vE64m-0004OH-9B; Wed, 29 Oct 2025 09:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE64k-0004No-5F
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 09:18:54 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE64b-0007Ov-MC
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 09:18:53 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47114a40161so81646395e9.3
 for <qemu-riscv@nongnu.org>; Wed, 29 Oct 2025 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761743920; x=1762348720; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bbBhe7Jqme4xLw7q/N3DTDLYkblUqkjEodwvETnzT40=;
 b=j4uYM9/nRk5RqmYgsMCxUY7VR/1V1NBHs04eDhSRxgbP9Wq5E3pfXTZ2sBZf5KQxNw
 nNmnW73MrdM3fmAFqUKbYbVQLIbNRBLTpHeYqaqTSGlxh70RKUbLrFHpU/EYbcKqAZ82
 t2peRHdrFrmN/kn1x+ad1wNrDGWIo36iT28hrJ1GloIVg4o5JVjU58t/v6UmBSzhoAXz
 0OTKCmpquZULDb07h71NuXy+60w9YtIfFRDfbWvvtWlsyZPFJ/nx0ETw6XE6ghVy0u9F
 +APmWXXLQRF1b6v5+CYzWCPP/0MzNUwLGo1iYkbjKKGLApE608maZEmrUGq0FCOTXQhV
 cf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761743920; x=1762348720;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bbBhe7Jqme4xLw7q/N3DTDLYkblUqkjEodwvETnzT40=;
 b=i0PrNJjbotCtDcbcft96NdoWM6HX/vg+pPn6uMhX08dvtrN+nLsbQt6VxqMj21VM1D
 gHYcyyzPkgOxftY00flmkMBakrnYFmsmTdHb3oQCEqe+zGe+eCcyZ+iVckl9zZoHmzP5
 /xHNT8/lDRCO3kdPRA0eGvGmGZRs+HiIu6AXgQNHEh/E4GFKVu5tJWuNM/65wMU/bRUr
 4iE8k0uYJa4vUDfOlcdqzVD6lh0SPPkoDmxI1P4Uyduiv9A97KdJY/j596wMCYjKCNUc
 jEdq4jBfnvq+/ME92BwicE7vpKZS+yLsfRBD/KcMCVKqmJ/EAJ45sdc+LwMFpFi9Vq5o
 Nakg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9RZU8gxBRV2+o5MXE3c5EkwUXQb0lBenZgfbzoCTofhpBX2qPqU0MSLHpTw83DNg0StDIA0srM/F+@nongnu.org
X-Gm-Message-State: AOJu0YxVvfXjKdl281nm1O1EpnFWpGgRkN9QRQrdDfdp8HftG4/pzpJi
 D5V2KQf7yeuCbTtwv4HLzZIELbls57R4xmoZt5U2T1awY2A7HlSj0Rjj7OAvmcP0Oo8=
X-Gm-Gg: ASbGncvEK+tjTpqcLozxCr8ADI275CHO1G8yxGhhtKSjj89D9R8eHGZWHWd4TDjBaER
 Pq808291/8aC6sqFVbxpO+HYt+gPueuK/ZFpfKfNt9BiOD1hOdElZiwCnBTXBfPPfWV6UAHgvRV
 nQI6uJtmkA8jcNpCRyMDH2Gw+pEFu1mvMQf/M3Urmk1G1T/wNUMxayQ4jDV1+iZPlmQft1a5hin
 guzWJT6TCK0NfxN50JLqKNfzynFYx5WcS2Xbuo8JNxbvJB0sow6MiSLOL8UJTLNS6EmzlsXsjhw
 6t+lX50ksmBZG4ljNHI6DPWm2kixlyppKds/6EVqSdnt3OAjL7FWlbanwt3I0Bs9EdZ8J75pgRC
 I6EGOtkBEk1IG6BucjmWY/RZ+cP9ZPTNYyUq3k+Z2UQhBKYOZZj45GY82vTFrbewn8E6PDj4+cN
 LnVbwL5mAYgcOaoLQJkzkr8p4NLCZVZwKtdMt+rGOjtyw=
X-Google-Smtp-Source: AGHT+IEMBHugsNYOma8f2/rsZ6jwMDfJvaKdC7qaYRPPFatsYFYUZNyqOyrnr5aU+Wuff07IpogmmQ==
X-Received: by 2002:a05:600c:6818:b0:46f:b42e:e3a0 with SMTP id
 5b1f17b1804b1-4771e3df22fmr24017395e9.41.1761743920557; 
 Wed, 29 Oct 2025 06:18:40 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db9c6sm26820345f8f.36.2025.10.29.06.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:18:39 -0700 (PDT)
Message-ID: <99870dc8-830c-4ce9-a25a-5aa7c47e074f@linaro.org>
Date: Wed, 29 Oct 2025 14:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/25] hw/s390x: Use memory_region_get_address()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20251028181300.41475-1-philmd@linaro.org>
 <20251028181300.41475-17-philmd@linaro.org>
 <f99989f4-88bd-4167-b9e3-fe4a249a2c99@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <f99989f4-88bd-4167-b9e3-fe4a249a2c99@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 29/10/25 09:28, David Hildenbrand wrote:
> 
>> @@ -510,11 +514,12 @@ static MemTxResult 
>> zpci_write_bar(S390PCIBusDevice *pbdev, uint8_t pcias,
>>                                     uint64_t offset, uint64_t data, 
>> uint8_t len)
>>   {
>>       MemoryRegion *mr;
>> +    hwaddr subregion_base_addr;
>>       mr = pbdev->pdev->io_regions[pcias].memory;
>>       mr = s390_get_subregion(mr, offset, len);
>> -    offset -= mr->addr;
>> -    return memory_region_dispatch_write(mr, offset, data,
>> +    subregion_base_addr = memory_region_get_address(mr);
> 
> Any partixular reason for the temp variable?

To fit the 72-80 chars per line limit. Since various people
asked the same, I'll just replace in place, ignoring the
checkpatch.pl warnings.

> 
>> +    return memory_region_dispatch_write(mr, offset - 
>> subregion_base_addr, data,
>>                                           size_memop(len) | MO_BE,
>>                                           MEMTXATTRS_UNSPECIFIED);
>>   }
>> @@ -832,6 +837,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, 
>> uint8_t r3, uint64_t gaddr,
>>       S390PCIBusDevice *pbdev;
>>       MemoryRegion *mr;
>>       MemTxResult result;
>> +    hwaddr subregion_base_addr;
>>       uint64_t offset;
>>       int i;
>>       uint32_t fh;
>> @@ -900,7 +906,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, 
>> uint8_t r3, uint64_t gaddr,
>>       mr = pbdev->pdev->io_regions[pcias].memory;
>>       mr = s390_get_subregion(mr, offset, len);
>> -    offset -= mr->addr;
>> +    subregion_base_addr = memory_region_get_address(mr);
> 
> Dito
> 
> 



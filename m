Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C79CCCF9F0
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 08:29:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vE1YF-0000HB-UD; Wed, 29 Oct 2025 04:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1vE1YB-0000Fn-HE
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 04:29:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1vE1Xw-00077l-Ea
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 04:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761726523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kyjVsMl1eSjjHZkpjfWsuFiTuc3rIZwFQPjqzSBA0qY=;
 b=BJExQqIJk7V5RICRnzM2NGeTB8HupUKZhIet1XpF5vlKiS2B7I4oohkd5HtXsnuGU5k92A
 NZ2PSePLpq0XzjzljEK433BjL+duZ4I6slBwmUjp2ab3Ibzpp781j0/RscAzE+b9TL+E5a
 R6RFEQ7xRLqq8Mc4auA09QsMaoVgTuw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-qOn4vEzPPHmfExuwso-bmA-1; Wed, 29 Oct 2025 04:28:39 -0400
X-MC-Unique: qOn4vEzPPHmfExuwso-bmA-1
X-Mimecast-MFC-AGG-ID: qOn4vEzPPHmfExuwso-bmA_1761726518
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-470fd92ad57so82413765e9.3
 for <qemu-riscv@nongnu.org>; Wed, 29 Oct 2025 01:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761726518; x=1762331318;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kyjVsMl1eSjjHZkpjfWsuFiTuc3rIZwFQPjqzSBA0qY=;
 b=NLWmOhDFpypK4q1L8LsbhpnQyfnYfVysW/FvTVSP1eV7iZXPGWXsH1Qu7+kZpZzxCc
 jix3OnO0AZefN3esRDACEzViwscUOwA5T37/l5PKCjDGZEzCEwhrTgrPHzXhmWz/YGYH
 36zZb7FhM7zFa/jm0u6xrqzaaYFxzXweOfxPCI3Z8UWR+gV+NEJhS5QT5EEcL8+b3bA0
 vDK7xo2gI5PPjwbsNX5qR945Pn/R5clHa/yncWxhz16gLXAR5rH8smlY9EpWTIg/5H/A
 i1ypCen4UzzqVr9vljZqJp/2CKWV1yKIRgCSLtQgvqKrgDAsxq87YLIFCilZZf6IPlIZ
 hfcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8SMzs1J9CuN/2uFUtnPtmLkmx/GY6AWR3I7kDV1HS2QeXwjQ3DlNcMulZkOKdtzj6yEuvV0zz3NLA@nongnu.org
X-Gm-Message-State: AOJu0YwQUcEDpQbLK2x+iMnKnkvNJLAzjzuXzVMKCclGLYpQ8aYhY4i1
 HZX8g/WKa8ZehvASvYWxH327ojfwAGMqVwhiXMxNa1faUxrQ8gyNvTRFTyG/97bUzqui+TGEzw4
 dRUvrEVmGAM4teCn1qX+SZXowqdENDGPf7uux6wfsQRL4wEZyJ1Vlr2Bt
X-Gm-Gg: ASbGncsiDaRFIbJhvu5x1+/rHBsiuQYCYlaT5cDQvfGvuZ9jMHOpbFvrXFo+QQditWD
 Xe0VNP+ADIXaGJYkaLpOI2yhd95jbVNmSV/L7G8FLz5S5ToYJpyYiWbuk+lll10kcau+xGn2GoB
 zCEYDGQBdcdG2ySmkujB0wu/Z9AnW2pbJ1hwC4zA6maypsOha/z4EyqsGuJn1IVtVG/noLqjVVF
 uKy9cxQBY/oBaV/4p8/tl30Tve1cCEpsqeT5T+ntKMDVGi1UdMPNr50G+UzNL1j2zBZirsQdPdD
 EsVeWHBtgQkFBzih1e3KhIwSp0kyqqrvtBiT1Ru67B24mD2ANEjjClCJvpgxTI/CWskLFkRLWgY
 xqALfZ/FZl7oV+XX0Y9GMLg==
X-Received: by 2002:a05:600c:46ce:b0:471:15c1:45b9 with SMTP id
 5b1f17b1804b1-4771e3b84c0mr19996285e9.29.1761726518495; 
 Wed, 29 Oct 2025 01:28:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwH5iYlR3CCOII9CX1s2YW9mYg5eVnuX9ag5pm3FcjObAoRCGOd+6CNkhXP35RGWKSwOIIjg==
X-Received: by 2002:a05:600c:46ce:b0:471:15c1:45b9 with SMTP id
 5b1f17b1804b1-4771e3b84c0mr19995995e9.29.1761726518045; 
 Wed, 29 Oct 2025 01:28:38 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e27f7b8sm36443235e9.0.2025.10.29.01.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 01:28:37 -0700 (PDT)
Message-ID: <f99989f4-88bd-4167-b9e3-fe4a249a2c99@redhat.com>
Date: Wed, 29 Oct 2025 09:28:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/25] hw/s390x: Use memory_region_get_address()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251028181300.41475-17-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G6-g_SALWvwsWHCmIaI_w2I6PQb_iitfDBXlyX31c6c_1761726518
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


> @@ -510,11 +514,12 @@ static MemTxResult zpci_write_bar(S390PCIBusDevice *pbdev, uint8_t pcias,
>                                     uint64_t offset, uint64_t data, uint8_t len)
>   {
>       MemoryRegion *mr;
> +    hwaddr subregion_base_addr;
>   
>       mr = pbdev->pdev->io_regions[pcias].memory;
>       mr = s390_get_subregion(mr, offset, len);
> -    offset -= mr->addr;
> -    return memory_region_dispatch_write(mr, offset, data,
> +    subregion_base_addr = memory_region_get_address(mr);

Any partixular reason for the temp variable?

> +    return memory_region_dispatch_write(mr, offset - subregion_base_addr, data,
>                                           size_memop(len) | MO_BE,
>                                           MEMTXATTRS_UNSPECIFIED);
>   }
> @@ -832,6 +837,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>       S390PCIBusDevice *pbdev;
>       MemoryRegion *mr;
>       MemTxResult result;
> +    hwaddr subregion_base_addr;
>       uint64_t offset;
>       int i;
>       uint32_t fh;
> @@ -900,7 +906,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>   
>       mr = pbdev->pdev->io_regions[pcias].memory;
>       mr = s390_get_subregion(mr, offset, len);
> -    offset -= mr->addr;
> +    subregion_base_addr = memory_region_get_address(mr);

Dito


-- 
Cheers

David / dhildenb



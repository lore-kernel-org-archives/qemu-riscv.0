Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D8EE7716D
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIjD6-0008Hd-Kw; Wed, 04 Dec 2024 01:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tIjD2-0008H8-Lf
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 01:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tIjCz-0008MZ-3K
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 01:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733294999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=J1E8R3dW6tV138ZRkbVrPlUAn7vvGa4J37rC1Eiqw2c=;
 b=ClMdFs3SesxtjoUsJYrPcq+ldg3Nai2JSZod8S4uNFgm0vAkpfFNkqo3FvCKxPvcGCmsUh
 B/6+ihr9S0ZBlp5jIcodRgkCWdJCJ1zGjyxlbIGsHSc/6nYm1x0lT8L/NrwyYfuipEaCbE
 mk0Lug0LxVMPqCnKma0r2sJmth2eNac=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-dNkC5jGiPHelrKw9lz3NYA-1; Wed, 04 Dec 2024 01:49:58 -0500
X-MC-Unique: dNkC5jGiPHelrKw9lz3NYA-1
X-Mimecast-MFC-AGG-ID: dNkC5jGiPHelrKw9lz3NYA
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ffb0921706so47390461fa.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 22:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733294996; x=1733899796;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J1E8R3dW6tV138ZRkbVrPlUAn7vvGa4J37rC1Eiqw2c=;
 b=Etr0aQYpYZn0iTmvBVais+Ck9A03yNcGvJjPJ1doAtg3mr07t3XSMW6aCrdr4fZ4Zm
 UCPzzURliYrav9fgAnn/hPyJj1ky9z5+p41wVCw76AZ0FPxP67QhGC/Mb92mLKRaOkDF
 qEkjN+aoHc8hKUs4xtn/s7Qf2NxXPGrmWSNCyiVXqQ9+RKNu0G1ocIAQ3CAUD/QSx4vP
 ACjG1DQVX44QilwRmnOGohZfvnlar3LMvwU57QuKjg/XTFZZMDy6zeKl7pYYx9yHdwEu
 5oWKSxAW+LfsK9mHQEGPBnekCNvSn989rmRmJrebeeykJZxlOA8zdogCa8oSUMXjQD+q
 9yfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqcePzROiGWGZvTVEsGO6Y3MhcaZOjGbgJ00amPgtdeJQgp+XXrsmNfG4hkmTd1ir+yHB/i0KPhj98@nongnu.org
X-Gm-Message-State: AOJu0YwPHnggK0EOGm44lclIs0NdTphnjwBPZEP1yfvKIbNhnN761+LG
 I6FOEEsr3ZQSjdWzjwSN0XRt+Lr7e81uR8hoFPRCErbnateO7UeAHlrodcc5u0OSd/FE1vbjM3J
 B6QsO4YaF3ahZWHaoJIf176vavfO+k1Rc1Mngb4zgWsS9nAyEysT6
X-Gm-Gg: ASbGnctdgv5DM0e8TMTWckKM1drlRq2j8F3mlbCKGT53onVsR6QyiUKelAKrg7K/Owv
 I7HlpkAOIuqt9TjDP3RYU9jhOHYShTn1oJrFjX9393ED+P/uQ2mKnKqudRXrsRGdmNoz1z24XVV
 FPQ9OZAyMmZ5v0Jp1KIdD5FV1mG0vOsWxPuyAtnFSu0iygmW0z26WJDcfqWmFEZrE7wcpMcqz6i
 gc0DyAe7p4RvhQpgYV2xt1BQTh3vvt+NRhGF2AF6fjK82nD220+mUIpHrhxmo35yEZKwvdquP37
 GilmXw==
X-Received: by 2002:a05:6512:1048:b0:53e:1c7b:618e with SMTP id
 2adb3069b0e04-53e1c7b6255mr1023188e87.10.1733294996624; 
 Tue, 03 Dec 2024 22:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgPwxGY+1eC+/eLMmrtBR8WPWPFY5ticvC6HoCVYJqC8skKCzjLQRMa8RVyKWHIz7H+JjJZg==
X-Received: by 2002:a05:6512:1048:b0:53e:1c7b:618e with SMTP id
 2adb3069b0e04-53e1c7b6255mr1023167e87.10.1733294996241; 
 Tue, 03 Dec 2024 22:49:56 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-199.web.vodafone.de.
 [109.42.51.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997d5646sm697355766b.62.2024.12.03.22.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 22:49:55 -0800 (PST)
Message-ID: <d24c3fb5-4edd-491d-b651-a13a1f7aacec@redhat.com>
Date: Wed, 4 Dec 2024 07:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 v2 01/13] hw/pci: Do not declare PCIBus::flags
 mask as enum
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20241126112212.64524-1-philmd@linaro.org>
 <20241126112212.64524-2-philmd@linaro.org>
 <ab884d96-6648-4888-962c-35a6b1d90857@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <ab884d96-6648-4888-962c-35a6b1d90857@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LOHnio2Y2oPNu5wiJBQQy1932-JDbKA7WH6Lwcok4ls_1733294997
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 27/11/2024 10.37, Philippe Mathieu-Daudé wrote:
> On 26/11/24 12:22, Philippe Mathieu-Daudé wrote:
>> We use PCIBus::flags to mask various flags. It is not
>> an enum, and doing so confuses static analyzers. Rename
>> the enum as singular. Use a generic unsigned type for
>> the mask.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/pci/pci_bus.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
>> index 22613125462..6ecfe2e06d5 100644
>> --- a/include/hw/pci/pci_bus.h
>> +++ b/include/hw/pci/pci_bus.h
>> @@ -19,7 +19,7 @@ struct PCIBusClass {
>>       uint16_t (*numa_node)(PCIBus *bus);
>>   };
>> -enum PCIBusFlags {
>> +enum PCIBusFlag {
>>       /* This bus is the root of a PCI domain */
>>       PCI_BUS_IS_ROOT                                         = 0x0001,
>>       /* PCIe extended configuration space is accessible on this bus */
> 
> (more diff context:)
> 
>          PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
>         /* This is a CXL Type BUS */
>         PCI_BUS_CXL                                          = 0x0004,
> 
> Enum would be the [0, 1, 2] bits. Since we define bitmask and use
> bitmask arguments in the code, shouldn't we simply replace that
> enum by #define?

Agreed, this rather sounds like #defines than an enum to me, too.

  Thomas



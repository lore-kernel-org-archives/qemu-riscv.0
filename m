Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF915C3ABC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 May 2025 08:17:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uEkp0-0007W1-4R; Tue, 13 May 2025 04:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uEkoy-0007VE-Ca
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 04:17:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uEkow-0004UK-3w
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 04:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747124220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TtiueEWiZviwIh7GeF47XQVseYGD54OAElPbnCaybHs=;
 b=WK9qQCPpKPn5Z50a8J4TwQa5jJHbhVZGcUOAu7trHSc3Wr1xnyOxgBsCYhT2+N5dR16WXO
 BSvSqMLZuN1H+pvlcREthTFqUBKqnbtmcXhKtxj8+W9cbtgt9pB9KeKx1685nCYtUd3JXo
 bjZXQ6MkqphFx/Evj7tCg5vrkZ7UDuE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-NAFyIJaEMiuWBxdb7-rvwQ-1; Tue, 13 May 2025 04:16:58 -0400
X-MC-Unique: NAFyIJaEMiuWBxdb7-rvwQ-1
X-Mimecast-MFC-AGG-ID: NAFyIJaEMiuWBxdb7-rvwQ_1747124217
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a1f6c5f54cso1492935f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 01:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747124217; x=1747729017;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TtiueEWiZviwIh7GeF47XQVseYGD54OAElPbnCaybHs=;
 b=kXEviQxXOeWzjoD465nI+rT2D+w4u+QdM7slFOGyncM56htJYfNUfU4H1WCg2Q0gZH
 L/y4Yjv9ekZPfhj/AmXw7m/sUorgmo4J+QN7DT3VZwNfrvDwikMSK0u+8KykU16K1Iwf
 B8ARpr/lmk668Ko8FS3x/ItMBzqgklkMteOSulai9y8byEWCILhm0M7M0xAw+/qUma5m
 7YLOYnPuNPzqvRk74PkaEy8Ov4rPB1bQmUcuNw5MaqtMFs8ROT0qJ+p+La4GNxv96Fs1
 r6JE+N3Tm6iKNTFVnGzmzaYEM8AiMwwKK804NcsqueLUuW8ZrmbcQND1skaKfTqfmvrC
 4L+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG4G7VjR5B6/Tq6nk0p+FHajXqPDpmUBWMQ9ND/wbHmjqgPH5DBf+DmBPHr70hTEHjlCRpGyk/QnA4@nongnu.org
X-Gm-Message-State: AOJu0YzEt/tg5V/OqFXu2onKvKgyrlIznG+LOc4v2/WqOwo4VkR6AYeL
 XLotgr805pVYv0G2W1JYxspxzTvrujLyS8CooD0ySffA7dJDLgqEkqcHUDZEIIEUUZMnLk8ZDS1
 uLdQBtbk9CzYjVz5MRoM7mZG9ikntm+GhfQf2ytfEXOkxQxVgy50B
X-Gm-Gg: ASbGncu5GOskIAJZ1WgjytLHG1k1xV6/QuM9B4/KezcJATl/xgszRc6b+XvBFh0FnmJ
 CdHHPj/MRtuA8hYpDhAMXo+m1n+VuZGscwu1ciEcaV15Hp7ruLDJ/sq8SSTh/+7HepQDDHCJ+wf
 KsewSKE8BM6CGMqL+YcX6g0OaHSuT8Af9otXjYnB2Vt8MJ6dZxqJZloB0kcYZ9Qi7dMK9fvYWbP
 aTR2gSPolxF+yOePQ3x3YUG6wC/tZ1pgA/uWr4ikVAoAK8rq7ZqEM1oKdazEl480HsoUUJ6JBij
 zUEWrpx5M8Bfd+IpgRkNUjo3/ZtZ3VjsIB90Ihk6bHE=
X-Received: by 2002:a05:6000:1a87:b0:3a2:6b2:e558 with SMTP id
 ffacd0b85a97d-3a206b2e7cbmr5897805f8f.28.1747124217083; 
 Tue, 13 May 2025 01:16:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfPswOblyV4cGUNvCcq/Q0I9l2BJEKA8SVRI8+dxfH2dwpsY8l/tUTVbBanGOyi9wgYHInKA==
X-Received: by 2002:a05:6000:1a87:b0:3a2:6b2:e558 with SMTP id
 ffacd0b85a97d-3a206b2e7cbmr5897756f8f.28.1747124216678; 
 Tue, 13 May 2025 01:16:56 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-48-129.web.vodafone.de.
 [109.42.48.129]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2ab2sm15094625f8f.46.2025.05.13.01.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 01:16:56 -0700 (PDT)
Message-ID: <fee40b62-a98c-46d4-baf1-d108da775c9c@redhat.com>
Date: Tue, 13 May 2025 10:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to mark internal properties
To: BALATON Zoltan <balaton@eik.bme.hu>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha <anisinha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jason Wang <jasowang@redhat.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-13-philmd@linaro.org>
 <23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com> <aB2vjuT07EuO6JSQ@intel.com>
 <2f526570-7ab0-479c-967c-b3f95f9f19e3@redhat.com>
 <CAFEAcA-kuHvxjuV_cMh-Px3C-k2Gd51jFqhwndO52vm++M_jAA@mail.gmail.com>
 <aCG6MuDLrQpoTqpg@redhat.com> <87jz6mqeu5.fsf@pond.sub.org>
 <e5a305cc-4c8b-48df-99fe-539ebd9b72f9@intel.com>
 <f342557b-e589-f51d-cfd8-04f97e9c5efd@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <f342557b-e589-f51d-cfd8-04f97e9c5efd@eik.bme.hu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J2UhdwWROZSQDG_vryY1ooprYraAFz2Lr4lHKeis-RI_1747124217
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 12/05/2025 16.41, BALATON Zoltan wrote:
> On Mon, 12 May 2025, Xiaoyao Li wrote:
...
>> We need something in code to restrict the *internal* property really 
>> internal, i.e., not user settable. What the name of the property is 
>> doesn't matter.
> 
> What's an internal property? Properties are there to make some field of an 
> object introspectable and settable from command line and QEMU monitor or 
> other external interfaces. If that's not needed for something why is it 
> defined as a property in the first place and not just e.g. C accessor 
> functions as part of the device's interface instead? I think this may be 
> overusing QOM for things that may not need it and adding complexity where 
> not needed.

Maybe some things could easily be simplified indeed, but for some others, 
it's currently the way it's deeply rooted in the logic of QEMU. Have a look 
at the hw_compat arrays in hw/core/machine.c ... it all goes via properties, 
so there is certainly no easy and quick solution for this.

  Thomas



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B849FD75E30
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Nov 2024 12:01:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tESKe-0002wg-20; Fri, 22 Nov 2024 07:00:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tESKb-0002vh-CP
 for qemu-riscv@nongnu.org; Fri, 22 Nov 2024 07:00:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tESKY-0006qs-VQ
 for qemu-riscv@nongnu.org; Fri, 22 Nov 2024 07:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732276809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ImaqswwEAOm8DHGAkB77N8hsQ0mKlAHog5bMnpBMVmU=;
 b=UhXuil+79TWL0v8b29iAKuna//EXI2XCzT8ODEsBdwvARyVXN/9PsAi1h0jHOKsJ3lhspG
 UbXns/zIAKZXP0E7HgRpZxsp2KtFe3lIsmVR/cXG7kYmuOVCUB4TXfgTpw0UV28Mw2HprX
 TVidgLGR+k5eHV9mJeN/XIPNuiuVtvE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-WQj-HbECNSqPXZQMc4d-eg-1; Fri, 22 Nov 2024 07:00:08 -0500
X-MC-Unique: WQj-HbECNSqPXZQMc4d-eg-1
X-Mimecast-MFC-AGG-ID: WQj-HbECNSqPXZQMc4d-eg
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-46360a97a99so28009931cf.1
 for <qemu-riscv@nongnu.org>; Fri, 22 Nov 2024 04:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732276808; x=1732881608;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImaqswwEAOm8DHGAkB77N8hsQ0mKlAHog5bMnpBMVmU=;
 b=j82LJ+4v8/2RQuGHf1bpd6tqC4HTQLbjjRUrmuRiMtCSLf6UBe+7cQnxEFMJWSet0A
 FlSXUIgztdUky3Zty7O1F3gSQ+3qQiv6Tn6jRglDenc7RZ9evQB9RZL+x0sth9DFIq05
 eeU4LhpH266RANdGepUDykRcBjTm/GP87nyRcm/CWexfCS1vptTNhgwdksBmwk1A9mJU
 +OKM7LH7tzumMwi9fC57paBxjU6+4R+wglUJ9M0JWLBNy1XKOZa15KcOkVIKI/WPxU/i
 UOZkie++ncxev6riSmgr4pxC1ctAfG2iieRWM39oMUKOAdk/feOLF2c3JeWARXhvDHb0
 sL9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+OschDv/pyqZerfvFRePz5D8OIEKFBQn1zrY8N/KGw33JGzRwGLIn9AEj41ne5xsd91kghwisisyR@nongnu.org
X-Gm-Message-State: AOJu0YxpYu9zHUxx99L/NoO9keZenNLQS0BnnwOdbzuMoZB6weZSaWR6
 7QL27UAB6pdhhnZAgJC/CW7PdkeMmEptlA5vCltMYnNaLP4uh2BkBeSCNYxAyMYhHf5z1McDWbo
 Uy3GnqB7FoJwT7mgZxeLjPW5TtoGdFoLPv9g7uAeoCxiFNUHsjMsG
X-Gm-Gg: ASbGnctfOMf0R3g7gev7/eNne0stZZofQDd/GGzYZyzWxbOX78UWPkQfWlpdjwGL4pn
 oAJH5vXOO/9ndEy0StFOxJ0GwlnvTsaiRPeU6HdErFX+Q3vsnEERo4UjIIn6Nak625c4OMZOqts
 JTzLPzw/BFFgyizuNCu2CirB1wAbuESYwRBqKDr1Omrg/AXJZp7Rsm6oQyzU7F4p/6FkloQHRiK
 WnohZ7YXR0L2g3tsguE/qP9Bj4F/B65WiR6q6E2hZydZEpDfj+kBocrMqjhpwJ40TOgHJ88Ng9Y
 eQJDh5tmIPeU
X-Received: by 2002:a05:622a:1817:b0:460:90aa:ba8e with SMTP id
 d75a77b69052e-4653d63ec53mr35348871cf.52.1732276806664; 
 Fri, 22 Nov 2024 04:00:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpPXGWva8jt7B3LhKOXthXeQM9HZlvXRs3KdNha7mMH8AUytRmRNLmTuMVU8xNx9isPZzmYg==
X-Received: by 2002:a05:622a:1817:b0:460:90aa:ba8e with SMTP id
 d75a77b69052e-4653d63ec53mr35346691cf.52.1732276805475; 
 Fri, 22 Nov 2024 04:00:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4653c48fd02sm10502501cf.81.2024.11.22.04.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 04:00:05 -0800 (PST)
Message-ID: <f30aa80f-613e-4a01-94ce-b2779349ece7@redhat.com>
Date: Fri, 22 Nov 2024 12:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <2b8f6079-f2ca-471f-8580-43352437625d@redhat.com>
 <a3935ca8-5a44-4f2a-a414-aaa39f8e193c@redhat.com>
 <0cbbec0d-5be0-4ec2-8791-470c70d93e33@redhat.com>
 <ae1ee2e9-4be2-49ae-a5dc-2bc6e72a8506@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <ae1ee2e9-4be2-49ae-a5dc-2bc6e72a8506@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CPdYv52dPTdBNCI09SdDVTMaCXncR5mh2mFb2TRFBTo_1732276808
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/22/24 11:47, Thomas Huth wrote:
> On 21/11/2024 22.46, Cédric Le Goater wrote:
>> On 11/21/24 20:10, Thomas Huth wrote:
>>> On 21/11/2024 20.03, Cédric Le Goater wrote:
>>>> Hello Alex,
>>>>
>>>> On 11/21/24 17:57, Alex Bennée wrote:
>>>>> This is a mostly testing focused set of patches but a few bug fixes as
>>>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>>>> are objected to but I think its pretty safe.
>>>>>
>>>>> Contains:
>>>>>
>>>>>    - Daniel's clean-up of functional tests
>>>>>    - Another avocado->function conversion from Thomas
>>>>>    - Update the tuxrun baseline images
>>>>>    - Minor fix to the rust pl011 device
>>>>>    - Documentation clarification on identity
>>>>>
>>>>> The following could do with some review:
>>>>>
>>>>>    tests/functional: update the x86_64 tuxrun tests
>>>>>    tests/functional: update the sparc64 tuxrun tests
>>>>>    tests/functional: update the s390x tuxrun tests
>>>>>    tests/functional: update the riscv64 tuxrun tests
>>>>>    tests/functional: update the riscv32 tuxrun tests
>>>>>    tests/functional: update the ppc64 tuxrun tests
>>>>>    tests/functional: update the ppc32 tuxrun tests
>>>>>    tests/functional: update the mips64el tuxrun tests
>>>>>    tests/functional: update the mips64 tuxrun tests
>>>>>    tests/functional: update the mips32el tuxrun tests
>>>>>    tests/functional: update the mips32 tuxrun tests
>>>>>    tests/functional: add a m68k tuxrun tests
>>>>>    tests/functional: update the i386 tuxrun tests
>>>>>    tests/functional: update the aarch64 tuxrun tests
>>>>>    tests/functional: update the arm tuxrun tests
>>>>>    tests/functional: Convert the Avocado aarch64 tuxrun tests 
>>>>
>>>> Do you think we could include patches 2-4 from this series ?
>>>>
>>>> https://lore.kernel.org/all/20241112130246.970281-1-clg@redhat.com/
>>>>
>>>> Only patch 3 lacks a R-b.
>>>
>>> I had a question on patch 3 and a suggestion on patch 4 ... could you maybe address them first? Thanks!
>>
>> Oh Sorry I forgot.
>>
>> I did address patch 4 in my tree ... In Patch 3, EXTRA_BOOTARGS was
>> added by Alex IIRC to work around the console issue. We ended up
>> adding the sleep call. I can resend tomorrow.
> 
> IMHO v4 looks fine now ( https://lore.kernel.org/qemu-devel/20241122090322.1934697-1-clg@redhat.com/ ) in case you want to pick it up, Alex.
> 
>   Thomas
> 

Here is a check-functional run with this series and the v4 I sent :

   https://paste.debian.net/1336417/

This system is fast so the timeouts are more certainly tests failures :

   func-sh4-sh4_tuxrun		?
   func-rx-rx_gdbsim     	https://gitlab.com/qemu-project/qemu/-/issues/2691

Thanks,

C.



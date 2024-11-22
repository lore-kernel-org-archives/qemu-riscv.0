Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9D8D75E22
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Nov 2024 10:48:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tERCQ-0002r6-G0; Fri, 22 Nov 2024 05:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tERCO-0002pl-UO
 for qemu-riscv@nongnu.org; Fri, 22 Nov 2024 05:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tERCM-0003BF-0k
 for qemu-riscv@nongnu.org; Fri, 22 Nov 2024 05:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732272457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EjhUJp9WVm3oviZK5yosiicB8UpQmbESDlz+6oezQj0=;
 b=eib91B3Fcoc9BC/9O744sqcTQPNN5yMJlQ+wIKEa2CpBk2Tw9/Jt5EMfEfkG5fu3PU6VaP
 A8kQteV7j2ZOhv/sjDqEMWFAJSGCFxa0RArLLXTxMneLdwGdfYOtK7b7xGORWh7AmfVd/2
 9K/F0nudfr7hRDx/Y7Pp+frYlAUevFQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-dd1DJRxvN2GMG1mEK9TLGg-1; Fri, 22 Nov 2024 05:47:36 -0500
X-MC-Unique: dd1DJRxvN2GMG1mEK9TLGg-1
X-Mimecast-MFC-AGG-ID: dd1DJRxvN2GMG1mEK9TLGg
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-460a9b67fadso22960611cf.3
 for <qemu-riscv@nongnu.org>; Fri, 22 Nov 2024 02:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732272455; x=1732877255;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EjhUJp9WVm3oviZK5yosiicB8UpQmbESDlz+6oezQj0=;
 b=R/PwWl05D2c2yZcuqIl5ybN1XS7DbNt7qBwSVePKebukCVJkyjjxKTr9PdD7CmQ9dp
 ItlBDS2GnCGNf66742ckYSEtmnYHIci4iHGLo2IMa5UXi3QOK0zqHgp+kayWcyyVpd/d
 ZFX9qesOO3hF+4AsRkmghaCZUy/ErlfaQ7JAvI9/sFawPiJn4qv4uiGndJ337CSlHSE3
 Jw1Juib9+XTt91cpyIiI7NN2z4+goPU/Be7J38IsEH8lIEEa72+gPPEHzL83Z7yIZcR7
 Nlv9gXriw0nmaKeLQRjqdyhlJ4weMeWJpW0FwhO+/cw0hfZN4rSIsGAMJ0Mxw9hufo+V
 6rcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVV8wUq2qX2tIL/2xjhYSzFLcStVKZP+Lpd+c5jHHujmfFHHluRWnuwwqxWhPdUUS9OO0kRBsoIlpJ@nongnu.org
X-Gm-Message-State: AOJu0YyhOwVonSvo1mtdXEmPGF9qVfs15pke9kXFgrosMhqUpuf/Wqn5
 USOwiBll2/Re/eyPqx18GJFd+v4DE+UEzKfMwvzF1oIxBtAJ3BQEnW4/VweCE+8ejRLMOhpsQKH
 VDUls+Kk07RK24QEaDKgtSRdOc5SYGrGJ/BPAr3pBsHi5tptx2/s7
X-Gm-Gg: ASbGncsm8R7pAQSLLw4vPAdduAENJqmcagqtnfy/CnwvVuSU/KAlStj6V1Jj4gtVNjR
 WLCCCg6H57R3nn5rCNKMFegGw3FLk0bgJ/1ZA+JftOIlqTE1EH203IRWLJoQ1a93FqBOr6aW3F3
 2jz4//HgDeJQShQbNR8Ifbg4+injWp4v+ErKwYGpYsNXW9DjX6rkaRJdFVtTbsjnn8C0SReoRJG
 Yo8JcIlxH5p7MvN89UJmJIKl1E48l/cgxo2SaUOTdzpWtwH2yp1scl8zdEW5XISoc0qhLqmN9Q=
X-Received: by 2002:a05:622a:1929:b0:463:9183:8515 with SMTP id
 d75a77b69052e-4653d568c93mr27324711cf.20.1732272455585; 
 Fri, 22 Nov 2024 02:47:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIg2x/ynxV3bkxS+u1OCMHN/kUDJnnkJGH9a1TwfI1f88iwdBcLYIr/y1hJfsbJZESFLAkvg==
X-Received: by 2002:a05:622a:1929:b0:463:9183:8515 with SMTP id
 d75a77b69052e-4653d568c93mr27324361cf.20.1732272455262; 
 Fri, 22 Nov 2024 02:47:35 -0800 (PST)
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4653c3d7240sm9960521cf.7.2024.11.22.02.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 02:47:34 -0800 (PST)
Message-ID: <ae1ee2e9-4be2-49ae-a5dc-2bc6e72a8506@redhat.com>
Date: Fri, 22 Nov 2024 11:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
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
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <0cbbec0d-5be0-4ec2-8791-470c70d93e33@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HIhBHOv3lRzxY36Hrb-551CzO0A2ybYMqCelISs56j4_1732272455
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 21/11/2024 22.46, Cédric Le Goater wrote:
> On 11/21/24 20:10, Thomas Huth wrote:
>> On 21/11/2024 20.03, Cédric Le Goater wrote:
>>> Hello Alex,
>>>
>>> On 11/21/24 17:57, Alex Bennée wrote:
>>>> This is a mostly testing focused set of patches but a few bug fixes as
>>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>>> are objected to but I think its pretty safe.
>>>>
>>>> Contains:
>>>>
>>>>    - Daniel's clean-up of functional tests
>>>>    - Another avocado->function conversion from Thomas
>>>>    - Update the tuxrun baseline images
>>>>    - Minor fix to the rust pl011 device
>>>>    - Documentation clarification on identity
>>>>
>>>> The following could do with some review:
>>>>
>>>>    tests/functional: update the x86_64 tuxrun tests
>>>>    tests/functional: update the sparc64 tuxrun tests
>>>>    tests/functional: update the s390x tuxrun tests
>>>>    tests/functional: update the riscv64 tuxrun tests
>>>>    tests/functional: update the riscv32 tuxrun tests
>>>>    tests/functional: update the ppc64 tuxrun tests
>>>>    tests/functional: update the ppc32 tuxrun tests
>>>>    tests/functional: update the mips64el tuxrun tests
>>>>    tests/functional: update the mips64 tuxrun tests
>>>>    tests/functional: update the mips32el tuxrun tests
>>>>    tests/functional: update the mips32 tuxrun tests
>>>>    tests/functional: add a m68k tuxrun tests
>>>>    tests/functional: update the i386 tuxrun tests
>>>>    tests/functional: update the aarch64 tuxrun tests
>>>>    tests/functional: update the arm tuxrun tests
>>>>    tests/functional: Convert the Avocado aarch64 tuxrun tests 
>>>
>>> Do you think we could include patches 2-4 from this series ?
>>>
>>> https://lore.kernel.org/all/20241112130246.970281-1-clg@redhat.com/
>>>
>>> Only patch 3 lacks a R-b.
>>
>> I had a question on patch 3 and a suggestion on patch 4 ... could you 
>> maybe address them first? Thanks!
> 
> Oh Sorry I forgot.
> 
> I did address patch 4 in my tree ... In Patch 3, EXTRA_BOOTARGS was
> added by Alex IIRC to work around the console issue. We ended up
> adding the sleep call. I can resend tomorrow.

IMHO v4 looks fine now ( 
https://lore.kernel.org/qemu-devel/20241122090322.1934697-1-clg@redhat.com/ 
) in case you want to pick it up, Alex.

  Thomas



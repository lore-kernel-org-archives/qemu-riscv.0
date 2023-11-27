Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43129C07D5A
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:16:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7Yf8-0004CO-HK; Mon, 27 Nov 2023 05:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Yet-0004Af-AM
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 05:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Yep-0007y6-NF
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 05:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701080162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WnDqxlwPP8NlnJnlA+JKQnJAog6oGukwqh/qQR4RmmU=;
 b=RDjdR7Qr6fqXwtwx5Jafih0DW5AErO8wVYPD6I+iWef7ZZ9MXZHJ0oHcJ/GL3ghwRyEgO4
 60CPeAU7nOwWZCxap8CRj6rJG7BoSUEPeoiZ5Lh8EckbQVf4MPBE8DQPhu6s4RVSsN09UA
 nwb6rguYP/ay/V2swz2uqvRoQ8h7lMI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-LxK_0tMbNVyISPs1mL-Frw-1; Mon, 27 Nov 2023 05:16:00 -0500
X-MC-Unique: LxK_0tMbNVyISPs1mL-Frw-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1cf8ea601c8so44125155ad.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 02:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701080159; x=1701684959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WnDqxlwPP8NlnJnlA+JKQnJAog6oGukwqh/qQR4RmmU=;
 b=lXUyb4QKfOfwnKxu5m8KZwliFwxF6AEangiQrXALV7HK55jwy+LZ6jgJLRxTjngSW6
 58l4zG1O7wp46q24BsilgnzhpkoZdQ/ktb1VzkTbuStDtZYe/IriUT8wIpT2/kiaeYEY
 FCnCVWR5HKb6KprUkWq900Oaji//BwxLx/OzhRPiXcsZk570MGMJVJ43dvRO2UyvO6B1
 LLeO9IX0A77A1Y8P3vN+MVWdTWK+AtRXroZ6z8lR2R2FTdWNI/hvSYeXUEHb8eug51AJ
 ofFnQyRvHk8HCDKYTzZTWcCo1GONnb5/7VWd43GSeVJKF799SmEDq3IeY4yzpBSYl5NV
 3U4A==
X-Gm-Message-State: AOJu0YwNSC67+5h1voB7KGBmfNE/eCXnB6drAlPrOAYqW3BvLt6pPVmr
 8kraGbtBFCB+OfjQJXU2Cok977LkB2YX+R7x1ct21lwNttzAygWR3EumzmZoccx1xormrT5k3c5
 eFt+J6Drgaxy/TR0=
X-Received: by 2002:a17:903:1205:b0:1cc:5589:7dba with SMTP id
 l5-20020a170903120500b001cc55897dbamr11322476plh.43.1701080159721; 
 Mon, 27 Nov 2023 02:15:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJpPavdokpRpfr72AFmhOEVjru8ANIib8w1ygXH0KZ7pVnpJMQOGTANqbE8DIgtcQPyX+dTA==
X-Received: by 2002:a17:903:1205:b0:1cc:5589:7dba with SMTP id
 l5-20020a170903120500b001cc55897dbamr11322433plh.43.1701080159341; 
 Mon, 27 Nov 2023 02:15:59 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902e9cd00b001cfca7b8ec4sm1975798plk.101.2023.11.27.02.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 02:15:59 -0800 (PST)
Message-ID: <1a4e1fa1-ee5f-457e-86e3-2dd2a27500e5@redhat.com>
Date: Mon, 27 Nov 2023 21:15:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] Unified CPU type check
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231126231210.112820-1-gshan@redhat.com>
 <35c87631-062c-43e8-bf46-67aa3cef5b30@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <35c87631-062c-43e8-bf46-67aa3cef5b30@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 11/27/23 21:10, Marcin Juszkiewicz wrote:
> W dniu 27.11.2023 o 00:12, Gavin Shan pisze:
>> After the series is applied:
>>
>>    [gshan@gshan q]$ ./build/qemu-system-aarch64 -M virt -cpu cortex-a8
>>    qemu-system-aarch64: Invalid CPU type: cortex-a8
>>    The valid types are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,     \
>>                         cortex-a72, cortex-a76, cortex-a710, a64fx,        \
>>                         neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53, \
>>                         cortex-a57, max
> 
> Can this list have some better order? A35, A53, A55, A57, A72 feels better than current one.
> 

Definitely a good idea. I think this series is about to be queued,
let me send one additional patch to do so after this series is
merged.

Thanks,
Gavin



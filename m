Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nRxjr-0000in-G2
	for mharc-qemu-riscv@gnu.org; Wed, 09 Mar 2022 09:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRxjp-0000hC-OW
 for qemu-riscv@nongnu.org; Wed, 09 Mar 2022 09:56:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRxjn-0002wb-LY
 for qemu-riscv@nongnu.org; Wed, 09 Mar 2022 09:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646837787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9ZdWyX26tCAuPR80TNpSa8PTMYAyIqEcyE0pjazQ2c=;
 b=PeBeRr1CsKBV5oNM9ys9g3SpPCPzOI4k71mzNH5WB6kINRs1Ied5jFE1NMgHS0Q0gjc807
 qcclPKL6+bwE0/eHnwjqHUCTqUTHPcrP4GKxSD7S+5YKvcDESPTBV7Stt5Ix3z57SsM3AU
 qcAanalb8AvqCBU4gk8xFXrcu9O0FfU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-5q1TaBIGMU-__5kyBunoeg-1; Wed, 09 Mar 2022 09:56:23 -0500
X-MC-Unique: 5q1TaBIGMU-__5kyBunoeg-1
Received: by mail-ej1-f71.google.com with SMTP id
 d7-20020a1709061f4700b006bbf73a7becso1410897ejk.17
 for <qemu-riscv@nongnu.org>; Wed, 09 Mar 2022 06:56:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V9ZdWyX26tCAuPR80TNpSa8PTMYAyIqEcyE0pjazQ2c=;
 b=gkqR0chokqpxbqQ5eys4UH7jX7JPAPmrC8YSJdEOYBTTaNJwJ9WYvBTeEB97HQuWkP
 MFQj5Ywwa/kDWarcEoulZmgtuXoS6rFLoemWR14Dwp8GsA0+FiZGwoRDb9wGNPZpynrX
 mrJZam8rS+U3Jy3Bp+anr+5KnYDI7jdYwu6oqUHFMe9Rkxn6+1UNYgmeXgZJy+EwxiuG
 JmcrZlszqqeWBZldhwu4UDyUlEr1hU9XABUPmzdk4Fm2ZM2APQ3177lryrL3IJWucUSE
 JVs68IKO62vI2+glessDZzNMs7BI4a0wrFWaUWjt2MqiX/okinilhEc/tqPLOpchirot
 pV0A==
X-Gm-Message-State: AOAM531SAKvhqfDAJLHXk6OsM+3RGZSiTExzc063HXkxx6vj0taF3OF1
 w3Rz7WB7phfDGcvC/LwHyHdExsvz0D7PmsKANoaRtuCbKJPr0DrxgKQqs6lJCSJ17gGbphDn+gv
 /84X9dZR8qxWQOBg=
X-Received: by 2002:a05:6402:7cb:b0:415:f059:c817 with SMTP id
 u11-20020a05640207cb00b00415f059c817mr21494099edy.364.1646837782560; 
 Wed, 09 Mar 2022 06:56:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxswt9jt+Tef3jrUND70a8RvgcVkqUDCzSr+IOL2u4RW8XfEMMLA9LfRO1pchMo3mzmIiHxmQ==
X-Received: by 2002:a05:6402:7cb:b0:415:f059:c817 with SMTP id
 u11-20020a05640207cb00b00415f059c817mr21494064edy.364.1646837782248; 
 Wed, 09 Mar 2022 06:56:22 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm818506eje.92.2022.03.09.06.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 06:56:21 -0800 (PST)
Message-ID: <5ff007ca-863a-81f9-4f99-3a1edc4106e0@redhat.com>
Date: Wed, 9 Mar 2022 15:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] tests: add (riscv virt) machine mapping to testenv
To: laokz <laokz@foxmail.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: kwolf@redhat.com
References: <35ea2e99-8049-9b72-b639-744afcdde726@redhat.com>
 <tencent_E4219E870165A978DB5BBE50BD53D33D2E06@qq.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <tencent_E4219E870165A978DB5BBE50BD53D33D2E06@qq.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 09 Mar 2022 14:56:30 -0000

On 08.03.22 05:33, laokz wrote:
> Some qemu-iotests(040 etc) use PCI disk to do test. Without the
> mapping, RISC-V flavor use spike as default machine which has no
> PCI bus, causing test failure.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/894
>
> Signed-off-by: Kai Zhang <laokz@foxmail.com>
> ---
> Thanks for the detailed info. Corrected S-o-b tag.
>
>   tests/qemu-iotests/testenv.py | 2 ++
>   1 file changed, 2 insertions(+)

Thanks!

I’ve applied this patch to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F35ACAC586
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 13:23:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uvbpF-00071u-Nh; Mon, 08 Sep 2025 09:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uvbpB-0006xP-8x
 for qemu-riscv@nongnu.org; Mon, 08 Sep 2025 09:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uvbor-0001Ct-Lw
 for qemu-riscv@nongnu.org; Mon, 08 Sep 2025 09:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757337718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bq+RJ7Gmt9Q7A9t9xcs222B/vb+IdvpL3rTB6x6NSQE=;
 b=Yp/IGwkglX2Qh3mSSv/EhBS6cDMv4zsWjNrQjKYeLxKaAkUkERYLLyS/CFvBwga3nXQE2/
 x1+iFV6adcWyajyKL25muW7atcGuaLCWDkqyzWiFDY2S66ksT4hWBv4CgoBGuPUZto9Tb0
 mzNHRebJ+ls6NtHIqYh4tAosar6sP5I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-DrM7fh_pMvSicYnU-ucl5Q-1; Mon, 08 Sep 2025 09:21:55 -0400
X-MC-Unique: DrM7fh_pMvSicYnU-ucl5Q-1
X-Mimecast-MFC-AGG-ID: DrM7fh_pMvSicYnU-ucl5Q_1757337714
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45d6c770066so22876735e9.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Sep 2025 06:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757337714; x=1757942514;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bq+RJ7Gmt9Q7A9t9xcs222B/vb+IdvpL3rTB6x6NSQE=;
 b=niKhDvFs5+XzYY7EPqT96O2pyG52O7UwPQQmklTePSu3XOrguTBBGp9pCEhUvhyRjS
 r2NgSakdr0C0DvLMNw6gH9/VxzcRS/Xwgg9uBi942WH4oRu7tXBBMwp0s9xziKCXa8da
 q0EwejQJLFWBKHe1WfyD+SYHvNAjVav50eomHApXy2QwJWU5qQio09PKMCvBIv/Jwm6F
 yic21QIRY2LKPjUoDZ/+HaGkGVWy0GUswd69hnL1T/7kGmdCFAqYehVokgx8vBpazzQr
 2zHk0Vfl+0tWh+M+8Yy8Y8T2ezFdK3rWTyhAzfnHFQ2dL4FwE0eVa1QrVSQSTjohyb2b
 NWrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0IqTzPbetAAtoR8W+1eiRFOwUX35FmO0tE+vfaFnPYcpnRzzcWrvfKWBcfQKCK0UuDWdLB5y8Pqs0@nongnu.org
X-Gm-Message-State: AOJu0Yya9f6I5mIcTh2QoQSnBpfUPabLLlxIFtYj3DMS30px3LfQO2Wf
 OQBf8bWon4OS9Jjbf+GubfcpO9SyuDvYOrPduLU+Pn4C9gnM1l1rQ282MtjpEZVl5DRrXHSrUO2
 kA37UafsoKaGft12wOMf6fCO9o3a+yKGL3qJ43jD490flLVtI/RjHVs11
X-Gm-Gg: ASbGncsaByKyAZY7YaVMtAUDP48D50B4UuJALZH0bPDWoLIyE04SqQsXIQbUI02pE/D
 YDvzSwJR5OA7HBAjVx+4vPRmgluaimmxBMhgJCJbRVC3EBoLw4DdZtXQYE5G1OEcmQfuEpn0XIx
 M6iSYW1duUjMWjEBdKFKtLAptj2rmKZJVwvFUVyZ32ssFe7NNJnj47OzG5+qQUiKnFN93UptLA+
 E33VpCMr99m4p109hebWVGDPXzk7ky5MC1UnjJXGA8DhAYiNldnpb4BH2iqgdzroEgjkgxVTp5+
 NXDmtYBExjsx5+m6Nv7QsuOI77k5HcIEgc5lSspl05ADxx5FiDJbx7UCZjAj64XZZD48IGe8cN1
 9hsNKjw==
X-Received: by 2002:a05:600c:5247:b0:45d:e285:c4d7 with SMTP id
 5b1f17b1804b1-45de285c731mr42758305e9.9.1757337713536; 
 Mon, 08 Sep 2025 06:21:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxCL7+OJ3xvDn9HZ2p3Q4xAqBtipY2VjYe25j1Ej87BmxiaHJVNq41ULrETliD2LocdDhK4g==
X-Received: by 2002:a05:600c:5247:b0:45d:e285:c4d7 with SMTP id
 5b1f17b1804b1-45de285c731mr42757895e9.9.1757337713089; 
 Mon, 08 Sep 2025 06:21:53 -0700 (PDT)
Received: from [192.168.0.5] (ltea-047-064-114-112.pools.arcor-ip.net.
 [47.64.114.112]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf276d5816sm41326358f8f.25.2025.09.08.06.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 06:21:52 -0700 (PDT)
Message-ID: <c9192739-430a-4f9f-bce0-3fe2e819f9b7@redhat.com>
Date: Mon, 8 Sep 2025 15:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] docs/system/security: Restrict "virtualization use
 case" to specific machines
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>
References: <20250908125058.220973-1-peter.maydell@linaro.org>
 <58abecd0-4071-4cd9-8df6-78478c310969@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <58abecd0-4071-4cd9-8df6-78478c310969@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IzTvt4Duuh6iwXbwaZXcudXG6yX5oOAFX0m930rWW14_1757337714
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 08/09/2025 15.09, Paolo Bonzini wrote:
> On 9/8/25 14:50, Peter Maydell wrote:
>> architectures where I've made a guess:
>>
>> i386, x86_64:
>>   -- I have assumed that all machine types except the "experimental"
>>      x-remote are supported
> 
> Please exclude isapc as well.

Ack, isapc uses ne2k as NIC for example, so you certainly don't want to have 
this in the list of supported machines.

>> mips, mips64
> 
> Probably none.
> 
>> riscv32, riscv64
> 
> I'd assume "virt" only.
> 
>> ppc, ppc64
> 
> "pseries" only.

Ack, ppc64 should use "pseries". But that's 64-bit only. I don't think we 
want any of the 32-bit machines listed here, though, so I'd simply suggest 
to drop the 32-bit "ppc" word from this section.

  Thomas



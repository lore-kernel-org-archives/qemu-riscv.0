Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A02C47258
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 08:21:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQ1AH-0006ld-43; Wed, 17 Jan 2024 03:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQ1AF-0006kM-7k
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 03:20:47 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQ1AC-0005w8-Ja
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 03:20:46 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so120255895e9.0
 for <qemu-riscv@nongnu.org>; Wed, 17 Jan 2024 00:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705479643; x=1706084443; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7LrgQPHbpCYKbZaSLtjO3LRr9bvKD/BTYKzEJd/knyI=;
 b=SGwI4lHXkyF3W1oz1PQ0GvIJ3RLma25LdKFLj79RNR2y05g79Xqs+xo5P6JWcApCyu
 OXB0NnK2DBFtZWaNhbWjtYwKCIYVSXbX0ggkl1ZC5HuEw5PKMw1N61i179L1OM8dhphT
 iRkmNN7xaSBAJhR0Z3tBuFKgv3AllDNr8s2hTPmmBC5yC/F2yO7BPHsk3lIVoLUZT2On
 kWpPuFQexTUugVLMVfl3daJLaxh8I26fP8BSFPV5XXard/5EzJU/zWp2dqN91jqxOzrF
 Ilih229zH2g7+h4LsGX145KtAMF/UW/yat+WNgYD4LcyM/lcdHRgg/Tk3axyz2D6J/eB
 hHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705479643; x=1706084443;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7LrgQPHbpCYKbZaSLtjO3LRr9bvKD/BTYKzEJd/knyI=;
 b=eLzZOKgUxdK0nY/a3jkYMu2Sp1VeMxKfXt1MqkpSrd94zZDMN3pdWFeuqh5b+gG7gU
 GDv6Va8bO/jLVg2pQCBCZe/A81GoHo56cTDyXLiCv0M3TBlC8gy+XeV3sEeOi1emvZ0E
 i5ztcRp6f/7wOpY/XbA+uv7yXugEEZujr8lJIyg5IRGqX4xqAUeQTBGv6aquT7pOOcOb
 SbL1vpaAqIiEDUIaoPLAh/TtERq4vW0FRHrw/3uKznSnwMvE13Q2m3nrQ5pY/W7vXGCe
 tcGWruKZod8xesShyuPTU+ZkbfyDptKUKEg+qm58YLvgyxtZKpuAvq3O59V4WlNHfxK4
 lCSQ==
X-Gm-Message-State: AOJu0YzQ0ggigeaQ8b7y1CqCUgSoYhbgbF4msIJgIbDQ1swRPiP8EFig
 3SX1RBwf2zhywRJCpLJEUxAjAPpeZowfHg==
X-Google-Smtp-Source: AGHT+IFsxJReS9qJRaCXsrjrI09WOc7aRCJQCul//PxGhmJaIvgVVutBr+hPnwPCnP7wLqPn/vZQzw==
X-Received: by 2002:a05:600c:1709:b0:40e:3b99:6379 with SMTP id
 c9-20020a05600c170900b0040e3b996379mr3372810wmn.259.1705479643014; 
 Wed, 17 Jan 2024 00:20:43 -0800 (PST)
Received: from [192.168.69.100] ([176.176.156.199])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d51cd000000b0033673ddd81csm1033645wrv.112.2024.01.17.00.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 00:20:42 -0800 (PST)
Message-ID: <ab450fd4-5a7b-4a19-bf60-4c9f079f5357@linaro.org>
Date: Wed, 17 Jan 2024 09:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] misc: Trivial code rename cleanup
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Eric Farman
 <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20240111120221.35072-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240111120221.35072-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 11/1/24 13:02, Philippe Mathieu-Daudé wrote:
> Rename some code names to ease navigating / grepping
> the code.

> Philippe Mathieu-Daudé (5):
>    accel: Rename accel_init_ops_interfaces() to include 'system'
>    hw/core/cpu: Rename cpu_class_init() to include 'common'
>    hw/s390x: Rename cpu_class_init() to include 'sclp'
>    target/i386: Rename tcg_cpu_FOO() to include 'x86'
>    target/riscv: Rename tcg_cpu_FOO() to include 'riscv'

Thanks, series queued.



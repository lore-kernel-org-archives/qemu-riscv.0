Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B400C27C52
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 08:09:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sEPDd-0003Bh-4L; Tue, 04 Jun 2024 04:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sEPDb-0003A2-AX
 for qemu-riscv@nongnu.org; Tue, 04 Jun 2024 04:08:31 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sEPDZ-00007p-JK
 for qemu-riscv@nongnu.org; Tue, 04 Jun 2024 04:08:31 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42133f8432aso21323325e9.3
 for <qemu-riscv@nongnu.org>; Tue, 04 Jun 2024 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717488508; x=1718093308; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ytNDWVR2oHjQ3nd9kyIjG9dFmCbjdL9BJfVV+A4Cikc=;
 b=lXNlfLAWxaPAD+qFFLma+UM0B+BxF+vukHkvLERbklr20AC0C9ZQi1dKkOmgWLXunE
 CY38oSO5gnnc9apCqktc/Sxa9gU+pmvOZ48fQ+GTpDkvTIuRu1CaaldDGfXiLSiRDPCH
 Ac3k58ioVA2WmUaJeoNVlkN83AJw6SMMCNieMjgXUp+bGCZaTIWQ23q5/WAuy/XbQoV6
 WNGSgdMuTb5kOpNBMhU4EON2RUUzgk+hI4DoZIByVh2mhBpHhPf6Y067r+lim+dyf7AB
 J71AXc9qbK4svRoWOKB2sKlCNVwI43WrUwc4hf+sbD0sf8NVD+K+8KpEbVawzmIuFk9O
 TAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717488508; x=1718093308;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ytNDWVR2oHjQ3nd9kyIjG9dFmCbjdL9BJfVV+A4Cikc=;
 b=rkGAQb7JqXlj8mZh5YEJGSfkC6hUVTeGFyM+bG5hKepSbRWhAxek8Z8VbSCUgYYynA
 ozAzEkthmHOnMgaayxmxbYglHLOTLHAzdgFDlkyVnVmk/4t13fI5XbRA+EzrJ8gzRDui
 JRC4LiwDV3hQYD0SapnUOBMXde1PVzHpP//fjoNelOW2fqWv0IMrns0YYBQxhWMch0pl
 kN4HWH6r0t54C+tdyCd96Osev7cqcFYj84t8a8q8N3HQIMwTlzWVvi69ULfCOGr2l6dD
 Z/EC3jhrtvWA0bKTcJunRLSVf7mHJMWH6NXr2nxj7BYE5udDPEbo/PYfgyfzB9kFz1+P
 aYbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxDkbpcVXbRFcYomY1HGbT/UVbKHjDCitDf3+XLNztpWtLY7MW1u/PA5s5k0EnSTh307FVl33w5+jP8/VjY9+lSS56sUc=
X-Gm-Message-State: AOJu0YwU35vlKyD8WVOEWuRNs7zjvQeZG1njmjWqanGVPJSSpJWo3u3A
 kTMcEpaoEj8CgmFlg2oGldxbXkFNbv9OdqxngueQwbLkXJh7xBKtersw1WtUty8=
X-Google-Smtp-Source: AGHT+IHf8Ie12xc3+rg0kBy0ZVzg1wR5OGDQWUC9sW2OKDYcfQjfBrdubAMeqDqyFFFA7PxKhuXBHg==
X-Received: by 2002:a05:600c:4f06:b0:421:28e6:990b with SMTP id
 5b1f17b1804b1-4212e0addf8mr98161125e9.25.1717488507855; 
 Tue, 04 Jun 2024 01:08:27 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.159.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b8a4cb3sm145568275e9.35.2024.06.04.01.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 01:08:27 -0700 (PDT)
Message-ID: <d74d4b69-7c1c-4c02-b7a6-3fab4073c2b0@linaro.org>
Date: Tue, 4 Jun 2024 10:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Use get_address() to get address with
 Zicbom extensions
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Zhiwei Jiang <jiangzw@tecorigin.com>
References: <20240419110514.69697-1-philmd@linaro.org>
 <fcbe4473-b460-4eae-ab33-e6e1ed723878@linaro.org>
 <CAKmqyKMefPOn3Wq8DJpH-85zO7+7DhLtEGymRvstQj4TjPGewA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAKmqyKMefPOn3Wq8DJpH-85zO7+7DhLtEGymRvstQj4TjPGewA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/6/24 02:20, Alistair Francis wrote:
> On Wed, May 29, 2024 at 2:56 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> ping?
> 
> I originally missed this patch somehow and it has then been fixed
> separately as part of
> https://patchew.org/QEMU/20240514023910.301766-1-alistair.francis@wdc.com/

I see (I also missed your one myself). Maybe add the Fixes/Reported-by 
tags in yours?

> 
> Alistair
> 
>>
>> On 19/4/24 13:05, Philippe Mathieu-Daudé wrote:
>>> We need to use get_address() to get an address from cpu_gpr[],
>>> since $zero is "special" (NULL).
>>>
>>> Fixes: e05da09b7c ("target/riscv: implement Zicbom extension")
>>> Reported-by: Zhiwei Jiang (姜智伟) <jiangzw@tecorigin.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>    target/riscv/insn_trans/trans_rvzicbo.c.inc | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)



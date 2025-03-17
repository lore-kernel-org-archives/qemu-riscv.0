Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C076EC282EC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 13:13:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuAH0-0007Qr-0C; Mon, 17 Mar 2025 09:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuAGw-0007GF-1I
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 09:12:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuAGt-0004aY-MI
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 09:12:49 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso19458105e9.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 06:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742217165; x=1742821965; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KNJ7M218ffxDY6ICDLw/30l2jXTRbqIn/zz2bIvcdYQ=;
 b=jp95mSUM1Acz1sur2ihFsbEU3O1tyNPjwFYsKh6fgf5RjPHeU3WtSVI0b1ckwDaMvX
 W0SSMujMW7c/sxTLAPaQf1sPwgKEFhjbrXxheO4wAfucA9L/0JySOaeoaDMpq3DNpbb7
 RODjlNXPHGgUGpOnhTGO4FpmylsYNEN8EDV6zI1Il2vDlwPsZth7F3u4A6L9CmFkjh86
 DowbHk1uxJJ+2c+4tiZd3hbQ1Mrf8lQ93Oam8hG9/UwZxvH2wnoQ6xXx7DMQkEt/CH8/
 FzJwkUkGB3IuExQaQwx3xtA1/w3fkpJ//ASOlrnYhybvOPYSo2lylt/kahLYI95Z/eZ2
 RpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742217165; x=1742821965;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KNJ7M218ffxDY6ICDLw/30l2jXTRbqIn/zz2bIvcdYQ=;
 b=E/WalSeBnO26rcXJR8pTub0xt+FY5gwb6cazZYrq8+o7n6kVKDBOe4VtrYNSH5K9IW
 pFnSrGVWj2vqCAdA8XuPzYGAqp3XNbPlRcA+W/XQGCEprf0Btsshx1jtYRzry0dtkLXo
 Jwjw2wwdP0VVH+cnqV7Tqu/9nYZswMcrVKMds4FMeF3k2aOz3azPi1In8nelaUzrW5UB
 5wkQlyqWesdG5SyzzqfABssL2xxF76Ar7IW9szWDZDN/B28RbFP1G+3q/BanP5qNbDel
 kH0UavkoEkALMHKmDXog4q3aILfTQicRJlUHpHvXv6bzea5k+yrfw2XD2+IhcWcyRRXL
 44Bw==
X-Gm-Message-State: AOJu0Yyw6GQ+1WpX9eMS79B5iwnNGZMqRmaDls4K52zalEuWkus+Fi0j
 rZx875q9mKLP3rt/audWR3chLIHz08451ky77GMFCRHNeZwKKUxGiuOOpFNxKGw=
X-Gm-Gg: ASbGncvQwdyBZ4JtB/nRdceqK6ml/q+dLOPcwYDP11iTe9DIVt+9OjSEB2UJFngYKxF
 cIYyBKnBKTHuhRiZ7qu3nw5PTwMP8eUq4Gdbyep6pZtNqcVfu+LLgf+ilAx+Sr/yhGO3bW+cYeB
 1c05q45E77CP4UvGt8l5EwCKlSKlI4hOikKGPhmKKmtu+B6RwL4QT/xu3beEFbdc3bqt1LhJUpK
 +tOshPg8L0qH2uHjsijuQ+9h38BhsLGoCzpu4LZMGCdzouPJMT5w92WjDOE/gx1xTcWBBAhmIk/
 pJVBHsR2GM5q3TFeuzdOimQ3ZldS5cbwsYbGgdXzLqkPkbCAn2VvgOGlJTT5EMvwo64SXpH7JhK
 supr8sFt/ndIs
X-Google-Smtp-Source: AGHT+IGprCd88A6aDVOWIi0Z46aSt7DTO0GweoPfwWLf/vkTnyUwWxTQ5fSQaZjIo+GuPHlz4Z0eZg==
X-Received: by 2002:a05:6000:18ae:b0:391:40bd:621e with SMTP id
 ffacd0b85a97d-39720398fe7mr13152912f8f.44.1742217165113; 
 Mon, 17 Mar 2025 06:12:45 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffb626esm104516535e9.8.2025.03.17.06.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 06:12:44 -0700 (PDT)
Message-ID: <994737fb-287a-452e-8ea0-9e1abd6f50f5@linaro.org>
Date: Mon, 17 Mar 2025 14:12:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding "Microblaze-V generic board,
 amd-microblaze-v-generic"
To: Prashant Joshi <prashant.joshi79s10@gmail.com>, qemu-discuss@nongnu.org
References: <CAGK8z34FBuHukQ9qorkVqGsm3sTtU3TbQt-bdgrrSxrva_qkww@mail.gmail.com>
Content-Language: en-US
Cc: qemu-riscv <qemu-riscv@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAGK8z34FBuHukQ9qorkVqGsm3sTtU3TbQt-bdgrrSxrva_qkww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Prashant,

Cc'ing qemu-riscv list.

On 15/3/25 01:03, Prashant Joshi wrote:
> Hi,
> 
> I have question regarding Riscv architecture machine "Microblaze-V 
> generic board". As per the documentation this machine boots only till u- 
> boot prompt and does not load kernel image. I tried to give the Image 
> using -kernel option but it did not work. Does this machine support 
> linux boot from u-boot?
> 
> Regards,
> Prashant



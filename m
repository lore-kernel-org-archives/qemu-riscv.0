Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0923FC87FDA
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 16:42:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ukQAb-0003c6-F3; Fri, 08 Aug 2025 12:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukQAY-0003Q6-MY
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 12:42:14 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukQAV-0005kN-2G
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 12:42:13 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso15492615e9.0
 for <qemu-riscv@nongnu.org>; Fri, 08 Aug 2025 09:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754671329; x=1755276129; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yBp4Z9X4Zu54uV8c//qzLmRKIosrDeLLfiJ8vnQLuKI=;
 b=aiGUBpFY2D3phnA/FvDSsBAC48j6sA/FsbGwshlhgAQtJE9xf62adrp+xzARbyvAZx
 CEyy4SUryvsEY4N2TvnRXf0NQbWA8W0JdgWY6kRkrBEmxDJDY9xsvJATvgxZvJ8NGAQ7
 cqO1M43BWCUD/WuYjLqg2EmMfFQYyrQfks4A+8k6V+3H5qzqOgHGBFc5LUHLtAA7wsLd
 o292+T4W6U1lUTEiChCKQRt3cLafrycljpE3z/yq8Zio6mS1QMb1N5LYkJJZ4Lnb7bet
 a0A4MfKFylKRtpomHLPo1YUVmWQO3pqeo0feamoTjZYobivLB3ouuuQwh/AfDKy+xYeb
 L2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754671329; x=1755276129;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yBp4Z9X4Zu54uV8c//qzLmRKIosrDeLLfiJ8vnQLuKI=;
 b=NVSF7sO68KHD3RcGX/pv0sLSjCZsCVkcLCHZui5zXMZ8knQwqUPIktagmz8iEDbSr4
 wIQJdaPlARODfMk5U6uGdmvNN5d0Ugjzfkl4wBs/IXJOBwo7/DTC20xVJ9ADilIt70nA
 Y0rlfX/IqyLY0orNY0TNA6MyMgmRK40uTkHprq4A8s1XUmIFrLjx8dkwcs/asJVAMmNM
 ew9dBPE1IJkq4eXWsdEbcPqSoIrh0uFDqov7VdviMumkulVK0zuWRkPMFnu0lNqTYDZR
 U3BQrLmNOPSsOBBoB+GE6pQP9Ib4jvDiVrj/RVGOzH0y2bH9D5r1GdAqMlD5PbMK0hV/
 PlKA==
X-Gm-Message-State: AOJu0Yz/DmrPFplP2FGB76SgRdojsyAtmxDAYlGrXMhS6gUeBvTJVxen
 jB57paBMmNlGRD0Fqd7AqIJKn9TogJzd1PDxWdiNFmbnDd/4LnX2yLgZG+iY+BilT7c=
X-Gm-Gg: ASbGncvL7EfF8CJ9XnNR1LDfpiLsosUZCKEx6e5cIvI4d69PsX/Wym0uEX689bJuN8w
 Iz99MJNxO2oun+pCwmtwM+3mJqlvR0SaPoSZnVIrUKRUton1R46MhNbzFb+S/dLRO5J+15CbhC0
 dbWi+RqvrR/q+5VlkR2kUH9RFS670nSNBWwixaqytdujQL1aeTXzoKnpgdFQxyiv3MzPGYGMt1/
 kQjvifnOQzRsyRP82FtuPod8beuKquw7plkNC1B2z2fFMgdMaF/Vk3LLswEKcG5L84s42OTFeNq
 lP/te5ioAB62uVf1AmgmEAIsFrsbnAK+hux9oF32GlwMU1R+yCqrM6IDuT5yg0zvN8fWrZze/nn
 ixg1OCw8AIuHtT7ZhB0oMVaw6afMSU37UREaBGXZ0WpU0xksKAi0Ld9U7Pcead+A1GA==
X-Google-Smtp-Source: AGHT+IGWtt0f+VO70j/Bym7iPy81gUPIWkIY3lZ73aWreZ31rYIuVtBUffC4iujne4u7GpX3XfJuog==
X-Received: by 2002:a05:600c:190d:b0:43b:ca39:6c75 with SMTP id
 5b1f17b1804b1-459f4f9d9ddmr33422005e9.16.1754671328635; 
 Fri, 08 Aug 2025 09:42:08 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e009e465sm22125953f8f.43.2025.08.08.09.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 09:42:08 -0700 (PDT)
Message-ID: <6daaff50-c951-450e-bd94-9f0e4365ebe4@linaro.org>
Date: Fri, 8 Aug 2025 18:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] riscv: Add support for MIPS P8700 CPU
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>
References: <20250717093833.402237-1-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250717093833.402237-1-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

On 17/7/25 11:38, Djordje Todorovic wrote:
> I addressed several comments in this version, major ones:
>    - split CPC / CMGCR into separated changes
>    - split CPS into a separated change
>    - added functional tests for boston-aia board
> 
> Djordje Todorovic (14):

>    hw/misc: Add RISC-V CMGCR device implementation
>    hw/misc: Add RISC-V CPC device implementation
>    hw/riscv: Add support for RISCV CPS
I'm not keen on having theses models duplicated with the
MIPS ones. Are the IPs really different? They are just
dealing with bit masks to stop/start VPs AFAICT.

Could we model them with plain CPUState objects instead?


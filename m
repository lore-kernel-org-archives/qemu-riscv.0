Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58574C71153
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 12:25:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qabJS-0002eI-PF; Mon, 28 Aug 2023 08:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qabJE-0002Xu-DR
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 08:25:33 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qabJ1-0007Hg-AL
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 08:25:21 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fea0640d7aso29822665e9.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693225517; x=1693830317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l/3sH09h8iYEeGTTqbw1KjNYFaMh2VZG2OLssAiabnw=;
 b=NLyFCaM7rTiFQx3SQ4SqSCYvX8EPZDvvzMcrDTBjycfgn6iR42DMjMoyASbZUazyAd
 J9p0rz3IAgu/oXVn9J1XZgJpoIwppMxfe+0uKJfN2w1X20FZLeOVYfGiVzH39k6kwdKT
 AgLwEBXSonR6HhBfjiJKRxj89AVLA7JHZgGudAqxAKFaZSKAo/621zlUTuzvNha1VUEw
 k4OrGIVsnNJ9dwd465Kh0D9JXM9JBxDrzNRcL7RkfK7iredXYOBBnm+YuENE7TV8CUGh
 nO1FRpUy2itUEEFuNwJ/yCdFcXHuNe8MrsJf9BwlK53BMk/ojKjuEHxUtH6+Rp+/fTXC
 u/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693225517; x=1693830317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l/3sH09h8iYEeGTTqbw1KjNYFaMh2VZG2OLssAiabnw=;
 b=WqRQ7eww8Z5LNghor7gB62UJw4phfsAgC4p+G8Sc22p3DlBZwlzWYak45hQpCzIdAu
 P/FwuQ8td8J7gAMf/ypL2eIXpiVkEH4eAefP2Z54s9CDZoKPY9e2MKMVXMhC1q939Bto
 oZ8nX6CK3A82YkDF/EBZSwTA6y7lJ3GjTCQmJbSvP5bm5RWT6VzQ/7gfvEVQFhj3XtUL
 CX1+nMdPoMsdZ0SvOAHI40o/rQmPZCzUan4qyiF4NI0THgplYUDnrpdMfjvMm9VZNWJH
 IzADF6c54S9mnAi3ZkL4lIJiBLJaqiodr+EI/SkqJJpUWDYluVHWxWB4qaYEHkP2iyex
 W/YA==
X-Gm-Message-State: AOJu0YzpLpCfQLOKc0iSjB+b5mFG+0xKN5BBNr7Bx2Tiu4Zd8Grcwe2e
 xFaW8ZX3qQYaaPjrohk0Lnt8sA==
X-Google-Smtp-Source: AGHT+IHYBZtmfqNiTV/DbdUBDTdWYFnM81TCUkkueVMLTLnbSdkRZrW/Vv9UXK/J+p/pqRInMZfBqw==
X-Received: by 2002:a1c:f304:0:b0:3fb:e4ce:cc65 with SMTP id
 q4-20020a1cf304000000b003fbe4cecc65mr18556235wmq.25.1693225517488; 
 Mon, 28 Aug 2023 05:25:17 -0700 (PDT)
Received: from [192.168.69.115] ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a1cf20b000000b003fe1a092925sm10463799wmc.19.2023.08.28.05.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 05:25:17 -0700 (PDT)
Message-ID: <5f7ecbf2-67ed-2563-e504-92ccc69f9566@linaro.org>
Date: Mon, 28 Aug 2023 14:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 1/3] cpu: Add new API cpu_type_by_name
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 richard.henderson@linaro.org, pbonzini@redhat.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org,
 ajones@ventanamicro.com
References: <20230825121651.1534-1-zhiwei_liu@linux.alibaba.com>
 <20230825121651.1534-2-zhiwei_liu@linux.alibaba.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230825121651.1534-2-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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

On 25/8/23 14:16, LIU Zhiwei wrote:
> cpu_type_by_name is used to get the cpu type name from the command
> line -cpu.
> 
> Currently it is only used by parse_cpu_option. In the next patch, it
> will be used by other cpu query functions.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   cpu.c | 31 +++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)

Alternative patch subject:
"cpu: Extract cpu_type_by_name() from parse_cpu_option()"

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



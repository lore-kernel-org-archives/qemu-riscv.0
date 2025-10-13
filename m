Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EB0CCD183
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 16:17:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8LEi-0001fS-Rm; Mon, 13 Oct 2025 12:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v8LEC-0001bL-JS
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 12:16:55 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v8LE9-0003fu-7p
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 12:16:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-33274fcf5c1so4690501a91.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 09:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1760372203; x=1760977003; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y1h9y3HDxUmHFS2mF6HQqQXRyWO1u0/MIY4NUaHZnCg=;
 b=jPCJfdYK6RPJ6X73AOOZ4Jh6fvEP/ekhDqrf4uHjIV6+byJxkMHVgFCipV3gIWzReV
 TqPi2ZPu5FJ8hkN+zWodNeYmd76w+LnSW0iKwQcHL7Es986rMdg9kWvIh1UGnlLbqmHT
 bRWNmQy09ieIIdqsNGxHBWWN0VY/nj09rhgSpam8rK4P/YZkfVAybU0DOHDIe2P5X6tX
 +V8tlNT2r5nmDdSN+dI+ak199YS3rY1moiNl9DHdFb2tuLiwcVKGeqo97vo7lrGJ/Y4J
 6tN66zcKb0bs1kXAT1UlBp8hcBE345MerppiaxHGDwwNNdBk+ij0OiIoGJ5HwCQo5VB7
 TaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760372203; x=1760977003;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1h9y3HDxUmHFS2mF6HQqQXRyWO1u0/MIY4NUaHZnCg=;
 b=Nu9tvqQ0DRKUHvvCakdHlE8/HjwFhYyH7K2TMyAeLjg82EK3GunhRZvRBQ/ubGE608
 ztMvpLDxESOXAyUSvpQUlt0/50IGHA3HXOnZL8Sc0vjGVgdcVkd1Y7z+hAY8j8iNH9YK
 HmFbtnliJyNAkP5RU7aw7MCsurM1zcdo59inJXCKlq/+XS1PbMHTRILMUyrMa1zIcu2/
 aUsNUs1Zcc8/KCMBmdVRzX2Wmq9k2qsVggbq3D4rmkaHiv+pQW8RKTUmnorp6AUCImuo
 azAweNov7b7z16gUequYcdhYCQ6vMUSS5Laws9HEeEtHkmkA5kqk0MlX1pRRE7JFdspC
 vYuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6c2wuTraFKgnkJKU6qMKMP+o7EaO+7v7Cs5Nl39sxz2xYNz2wsYhriH7WNzqpWAKfNRy5DNeHQwnh@nongnu.org
X-Gm-Message-State: AOJu0YwZoaLlOtv+Xct+c0hdROw4DcdqcinO6xex23NhtJUKWwdYMqtO
 C7yRvBp3YkD/T+MiDCyf1ux8KAw5FJn4nLJMUZSrqErYvTP6w52aYYmCD15/2RO0f5iShINHitF
 xGMuu26k=
X-Gm-Gg: ASbGncuJQRY3gnmogYj+yWA+qMI+WARIpxmda+7iQUWe4qtLBTJcxBoBIsJYXXuleJh
 sSgxR8lxu+GsfodHiF5VqGqzALEy6XmldGBpf9BUb160GIs3FCGz4yNoVLOr7blI3RKeKslrVgK
 4bYy8qWhjyBMSIFV9DrKkfHIdlpe0DkcOgJMbzwUpCDkMDuQyZo3o02Q7WLpEHNM0hgNYrtk2TK
 rlLui1xAjHcW2JYOf+zY+mSO7NWa8W1MX0VYTT4yRMGUTuo9fmycFTY+rHqvTrHYbgnjxZamOjs
 5QiZsl31QR+xW79PIN86mhWHf1mrJvIPdbIdm8rFAD/SomWqxjLr0aWWagKALFU43qy/fpzILhd
 M8Vn53vrbOnWXLB6CUc+3atXIINOU5JmWY4wLcB2Of7jWKOwAsl/u9lx6X8eIGWKSbL4=
X-Google-Smtp-Source: AGHT+IH2lh2hUbejzzXB6Rjn0/EqHlwSFpvG3oimksxs2N16AQWIGFd9fouz9uVnTqL79B+ADtXOnw==
X-Received: by 2002:a17:90b:3947:b0:31e:c95a:cef8 with SMTP id
 98e67ed59e1d1-33b5139a259mr26967181a91.32.1760372203580; 
 Mon, 13 Oct 2025 09:16:43 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.122.223])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b626e8f80sm12599059a91.22.2025.10.13.09.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 09:16:43 -0700 (PDT)
Message-ID: <6dc5ac5b-32a1-46bd-81a0-a3c1db63127d@ventanamicro.com>
Date: Mon, 13 Oct 2025 13:16:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv: Correct mmu-type property of sifive_u harts in
 device tree
To: Zejun Zhao <jelly.zhao.42@gmail.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20251013133242.1945681-1-jelly.zhao.42@gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251013133242.1945681-1-jelly.zhao.42@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102b.google.com
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



On 10/13/25 10:32 AM, Zejun Zhao wrote:
> Correct mmu-type property of sifive_u harts from Sv48 to Sv39 in 64-bit
> mode since it's the only supported SATP mode.
> 
> Signed-off-by: Zejun Zhao <jelly.zhao.42@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/sifive_u.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index d69f942cfb..3e1ed209ca 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -176,7 +176,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>               if (is_32_bit) {
>                   qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
>               } else {
> -                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
> +                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv39");
>               }
>               riscv_isa_write_fdt(&s->soc.u_cpus.harts[cpu - 1], fdt, nodename);
>           } else {



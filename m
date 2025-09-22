Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F9ECAC5A7
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 11:53:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0f5x-0002WL-JT; Mon, 22 Sep 2025 07:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v0f5m-0002T0-Bl
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 07:52:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v0f5d-0006eF-KN
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 07:52:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45dcff2f313so25481755e9.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758541930; x=1759146730; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xzeOzFV6f9ebg2fJBHj6nu9ySkmpD0tvjZMjaRHj4AA=;
 b=u6o+03ylm1kfE6eM8B0/qMdqmeJmnVV4lO/3X4hxEQJsrA7v8oToFLMHV6V0mnKsMS
 /EaxYlyPnTEnsCxgT3Gb5gHRAwZu1yuka1nUYoJcZx6FaYkuDOcvlpTjVa++w8pr1hMI
 5L7ik6mWQpTzPqFshTHpVDga2tGrwbMuccH4JuwKIDeF+lcSgVqtVHIEAHi/GTTeAOxn
 08vElgTYsKRcMDDjsLluIY90tF1aaH+05hTsgAJ1FT+SFbGqDVPvZqe2akXngkWLadCQ
 cLGGcPSgPXFe7le+/venZltrBvOGofU7WtSoefg/AuhrKUDAEPEaDICjV3UmDRUYh2Y/
 aKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758541930; x=1759146730;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xzeOzFV6f9ebg2fJBHj6nu9ySkmpD0tvjZMjaRHj4AA=;
 b=T8umAevi5JP4A0PGIP9mSmHXgkq61kJ0akpk5n5C59exlBWzvGMSfv1xKQY+A1+Rhl
 9buSz9FF9DvGyvzCWomL1L83vwBkicBc5huRSLJfLcv5Qemc3+s56R+s/qeyBIMyehpD
 7qThkMk5+xTZIkZdsUTSk1iqvLBoJ5KBLexDNVncBAOznTBote/+5ypwSymEP/dxsD55
 2UNjYoYWb/m11syZW6nTq+LVwvIIrSYUOMNBBva+1v9gCftbm1RKzqgacWmrPd1HZDJy
 rB+nLELZ75O9192G6GFgLCAlAHhB3W6u7D24KSPMgwZ1D2wsdPPwzhIXQyg8JdHUq9tH
 rt7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtNkqivt5Wdph1W+XaM7oqtvQtHdCou/j7nQfLDClcICvZwWsjUwEK/75/rAr9Im6YieMF23a9eh/+@nongnu.org
X-Gm-Message-State: AOJu0YxLY1GeXROTY7rGEzjty+DMifpbXYZVPs3UOduepCuZo8XIUS6C
 wTi4qNonSKCGiMT6vMIQoe04f/RcQ4m44VpptDhk+o6RDGygEmb7JKYUSk6qPEZZCDI=
X-Gm-Gg: ASbGncsDSoSo0MUOSi0tX4Hz3FpRBlLoT5+/cKdt9aUpncTgLWtcoNoRxrewd3JRmiv
 CdPMPJDw1yzx1QF2AxESi4pWeXWK373i07+v5eW8ifGSobjx3ma9vh9159JnBkkZz8tZIvpEQba
 xiWY2KnvwOZUwgl2Xw3NKIaimX1lSpHiHEUypSYKnv5tQsQlf+BZwnFSwaaH+AzR5OyCM4+Xfut
 uhJAG3aZ77HNqkpvhwQSqzWM0L/VHjylEP0CKCPJURBP3TPHI0ZsbFvyULu9pSGx0XQy0baYrNP
 XDj5d4xHreWqs8QAE7k1jtFVpU8aOKvyzsmAf00yLsmOaRRcA9ls8MYeXNFCQq+uj4sku9Zn8Ap
 6J29frisR9GbvXVj4bU4qXv/Xv5VN7gfT/8qKqxPtIXl4KM7rye4MAf6DxSE4bsHTnQ==
X-Google-Smtp-Source: AGHT+IGgw0LqDQ7r1/T6odtz9zB5wIBDnC9BRKdDP32gffJkEcsCuSirEuYsRqGQb7RV+mikDCVgtQ==
X-Received: by 2002:a05:600c:630e:b0:46c:9e81:ad0 with SMTP id
 5b1f17b1804b1-46c9e904ffamr37242405e9.0.1758541929709; 
 Mon, 22 Sep 2025 04:52:09 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f527d6cdsm226382965e9.12.2025.09.22.04.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 04:52:09 -0700 (PDT)
Message-ID: <dc5cf3fc-0e1d-41e1-bbfa-a3451eee1741@linaro.org>
Date: Mon, 22 Sep 2025 13:52:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/25] semihosting/arm-compat-semi: eradicate
 sizeof(target_ulong)
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
 <20250922093711.2768983-12-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250922093711.2768983-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 22/9/25 11:36, Alex Bennée wrote:
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> No semantic change.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Message-ID: <20250822150058.18692-9-pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   semihosting/arm-compat-semi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



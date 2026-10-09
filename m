Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED38CA601C
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 05:06:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xF2nf-00060j-SZ; Fri, 09 Oct 2026 01:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xF2nM-0005zY-6v
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 01:05:27 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xF2nJ-0003Lm-2M
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 01:05:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so31707435e9.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Oct 2026 22:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791522318; x=1792127118; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bgn3rIQ/UgL3wuGhAg1jpPsos+fR3FomTzHCiwO6Ipk=;
 b=B1z9/sdwFx0dnCl7TrREckSQ/vABhr40rJXiaHnKI4pFmtdiRZhXMINBT/GAZ6Bg5Y
 gpdbcmCHBiupEMLXdXq4+XVvwmfmD3zSCowkZpOqlqCZZfCm3JyThXTJ4UYZgjhtda2l
 hRshiKgWSWV6UuoaazkoP798S0rF0xSc2WxWIqX8lVHJnTTm7smI55R8UJGzEyvDWcnm
 UyYOihxmP80GdASU0b7PNwTf0oSh/bXoUdA2WDboVLveUJmVyvGJvc25EH5ztpbuX3VF
 L/stS8qC8+sIK9Sb/uvxR5dSTrqBhzwZ54ESYLGCG2KR3XBEpFUfp25lOuVEi2o6RmgJ
 lm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791522318; x=1792127118;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=bgn3rIQ/UgL3wuGhAg1jpPsos+fR3FomTzHCiwO6Ipk=;
 b=TCENOK+MAFn0Y2lUUHq83u0a5fzHbJX7ms1oNmXS6p7zVZYqPbmSRQgX8YhSkZBDVv
 P++gH7s8rG8II1td2VE4NYD1WEC7s8bKWXXRSNLhyFtHenYtxgO8+1owLXIs4ZtmJxUs
 g7IcDDnTp0lOQffE3LxLEKFl84cHCXqzNbbHaxzyzkU5Pwjhcyj5G+XE194ZOBBwefkS
 OBXELdo4sNpgOQe23Vhw4uy9GNLdqzZ7st4Kf6zQ91HEOk5gzXGfOLjRxd8QnLnLtjud
 9ean1K0sarB2qAf1VXM8t7MYWhsIWmzTya9wSx6xxqY8uQLVfL/VrfVrVau1Lz2EcEnS
 Pw3w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzK1W5Ht0ImpWB9Oy/yEf/3ws77q+myVaNoc26xidJKUVIohGg4qgg/dheNDeYOTfynWFgJ61dMZY3m@nongnu.org
X-Gm-Message-State: AFuF++ki6k12jcJK+ihtzythiw3hVkxGlRyyWfzMpPVCfogK5yqjQ9Pa
 NhTmryFCQV6z98+i3Ua9qAWWBPiH7Xqq5EpK10uEbASsIgeYXf8Z/o+Tp3MKP1GlHNY=
X-Gm-Gg: AYBFou1tftk/2er1bDvLe2eVrk3oJXfwlZH2YCsDfyILaRT6wnXP2ECDkc7dZT6gOn3
 wTFtTbJOu+2FlpCfXIvnp2gEajjMqL9Ob7kvayIHgOzvvIL421wQjrPz5sHYVYYL0GNKbWqlsL2
 adHS5uRPn7ZUHcSsJ+hniWjuCV3UaKMQok/IJQdT0EDgyGzAiszvHwVffg87MkYR4biOCSC9285
 y5KS47bW8+D6Zq9TWSWwqJhtIOYRaMtoQgTHpNpGCSGPtPWZ8J1iYNHiRjfrQ2ZqKKRTcntGyNj
 qLykrAptqDk80yu0eVh8pqVQEGIFsyCu2jObT767OPzNNszwF09tSzjWJ+Z+GZTZJWOIIJZZfUL
 t2mWwgtroL/DVQlMgFdynFdgEiHTCiyp+STIqtHxD3ApjdhliJS1gvxyMSUFBaDM7A08iqxMaC7
 0MHVJ+e4tPQqza347j6Mvlai8suljMX40I8bvSmh6LArWvxIurStuBMpKRofVTwWyNmGu6lQ8bi
 qqWIReVigZzdvHtCGjkIrR58jByney/lUn7794+Dazeh4OOxMUHt6I+gzuXrRkpba0QqvfzF5U/
 yw==
X-Received: by 2002:a05:600c:1e24:b0:4a1:7e77:c382 with SMTP id
 5b1f17b1804b1-4a18e49310amr10096675e9.5.1791522316298; 
 Thu, 08 Oct 2026 22:05:16 -0700 (PDT)
Received: from [10.86.151.227]
 (ipservice-092-208-245-012.092.208.pools.vodafone-ip.de. [92.208.245.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9463499sm1744110f8f.3.2026.10.08.22.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 22:05:15 -0700 (PDT)
Message-ID: <118805f8-bc4c-4600-b156-5b494a840ef5@linaro.org>
Date: Fri, 9 Oct 2026 07:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg/riscv64: Fix vector constant matching for logical ops
To: Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "open list:RISC-V TCG target" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20261008181647.3015949-1-aurelien@aurel32.net>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261008181647.3015949-1-aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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

On 10/8/26 20:16, Aurelien Jarno wrote:
> +        if ((vece != MO_8) || (val == (uint8_t)val * 0x0101010101010101ull)) {

Do you really want

     val = dup_const(vece, val)

?

r~


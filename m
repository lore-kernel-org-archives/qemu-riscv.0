Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F5CCA1007
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 03:44:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utePJ-0000SZ-A1; Tue, 02 Sep 2025 23:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utePF-0000RF-TW
 for qemu-riscv@nongnu.org; Tue, 02 Sep 2025 23:43:35 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utePC-0006nu-Lf
 for qemu-riscv@nongnu.org; Tue, 02 Sep 2025 23:43:31 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61e425434bbso4817206a12.2
 for <qemu-riscv@nongnu.org>; Tue, 02 Sep 2025 20:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756871008; x=1757475808; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4xjxI4BE0qWMEXX4A6DHtuV3oxHnBBkPIUk4lP++ZZE=;
 b=qgDHHvN5K3NC7UOtCVJCpP5SaKmc3x6UxlqHF/CJxQFH/VnBb6d+4TwQn6DWv505Rh
 DFs05Js8s/Tvvsuvpk8+/q5SiBWU+A5V1CptkG4AKwDA02dLHTpWUvsZ8yQkcci/WE8a
 aPIl2I5ZvinThmPn+TcbaevokB6vMsPKYqm2m3sNhqGKHRvi1ULtXAyQ8FE6M+UD8vKk
 M9QyL8TEASwZoemv7zukESHHi86+QIsO+J1l5JgCAJZUVV1esFZWbSbSoalW8W4UjgMY
 wD1tzSeNxlwDwTIxQW8NOGH1hdCUjfvGjp+ykG5F/gFJK5dmMWffawBk3Hz1htRTVa4d
 PQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756871008; x=1757475808;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4xjxI4BE0qWMEXX4A6DHtuV3oxHnBBkPIUk4lP++ZZE=;
 b=DiCIOiXpXECwFWsitJkzwNtbge3UUDWV1qpxgqPFR49t8WknxB/JWSMdTiVcXP9uD9
 ntholDW5GIrpCPvD/eBdAxYmy2l2GFud9tpgaMDIFsGldRlp/z3N/lxqedagWdKFJTps
 COduGw3Q35hpD8ItiCCZ5B9qevG1Ep/a6eCU88xk0SVwV7+SzGEh5TfPZTWOBpZHTRFG
 nxENanZrqcioflZX+7MQK7RhmG0qGBiv7CS+a9MGVXM06ZY9EtkdLlMydXTEf0VifPjf
 fdR/L78+m66PEEMVHMu87XJeCg635eiF1orO1fumD+X5uTzFnyQbX8P4lNjeaJlqk4LH
 onFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaoSBhwrbaRBYMaUPLbzjfhBb9NmZepP4R/9+NEb5Vw1N5XwWP0U1TcsuEJJ4iJFZUsaAMqZrj6Uf9@nongnu.org
X-Gm-Message-State: AOJu0Yx4gVBOjMZturbsm16OKtTyJ07u5YRuoy3uKksy9j5e4RKdM6KX
 Tb1pNeyjV4KyanGNmWsGO6XN8Q7NzFoICeqC/yVnXmCFaFuqZIPHuG706IELpqDQC0s=
X-Gm-Gg: ASbGncuApTrCRxTvwyhzaIhoBHEOkM2lyBzO9Gq9PC2b1Dds9c708WI9cU4eGaOFtYx
 GRt7rt+aMdOpX86lks5MdhCW69LuAHpeC0fl0qGeCH3K/ZVM6R0p3AlXMmBsMmtXTZ9qehl5MJF
 UZn6OMOiYo2dZgsKij8ex65aBYxyY/zOqNjEZOxoIq3q3CtHY8iDZM59E8VWMqaQX4CCNgXeNom
 4LarmWrXbOxpvsbZo7LY06G8gGP0SsyBp1jECWJlvLoeX1MmLbhd6/yt/t9VZqsyhs1sJQDUueO
 8mowEguugWayqOoCPAn/L1gj37LN9qmERRubqZoXz+xTqFctnurmMiEksbkYJt9R7Y80qj3on4I
 evmxqDsM6wUJmum803ZU/mmAxxNnWK/BXvBd1J7NOfsrg5o9GTepTvqJxyr+Fyuf3WUEOreQ=
X-Google-Smtp-Source: AGHT+IFT3PtoyEKwo4VdO1hkIjm4C5yKzyP67e3WdqwIS6o9AJ8nohGEhp0Zh2J9kvVZ7/W5AIdBGA==
X-Received: by 2002:a05:6402:27c9:b0:61c:bd9f:723e with SMTP id
 4fb4d7f45d1cf-61d26c3fabfmr11124143a12.22.1756871008543; 
 Tue, 02 Sep 2025 20:43:28 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc52ae40sm10870030a12.44.2025.09.02.20.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 20:43:28 -0700 (PDT)
Message-ID: <54f806ed-a393-4ced-8343-877e5e76c586@linaro.org>
Date: Wed, 3 Sep 2025 05:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] target/riscv: rvv: Add Zvqdotq support
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250901133815.1693077-1-max.chou@sifive.com>
 <20250901133815.1693077-3-max.chou@sifive.com>
 <5d0fe741-9063-441d-8abc-3bb0662c1fbe@linaro.org>
 <CANiaA1sP1KvhFhOOZRYJPzb=cf1DwTJNMTgEx5j2oppFNj6mdA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CANiaA1sP1KvhFhOOZRYJPzb=cf1DwTJNMTgEx5j2oppFNj6mdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52b.google.com
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

On 9/3/25 02:26, Max Chou wrote:
> The partial_sum and the final mask are created to ensure the behavior described in the 
> Zvqdotq isa spec section 3 as follows:
> 
> “Finally, the four products are accumulated into the corresponding element of vd, wrapping 
> around signed overflow.”

This is accomplished by the -fwrapv argument to the compiler, with which all of qemu is 
compiled.


r~


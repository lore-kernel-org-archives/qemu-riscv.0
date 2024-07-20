Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733EAC3DA49
	for <qemu-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 09:25:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sV6Kl-0005UV-4y; Sat, 20 Jul 2024 05:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sV6KW-0005M2-8K
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2024 05:24:41 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sV6KT-0005ZR-Hk
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2024 05:24:38 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3d9c487b2b5so1771248b6e.3
 for <qemu-riscv@nongnu.org>; Sat, 20 Jul 2024 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1721467476; x=1722072276; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8xY51Jb5ypiUobSDVwSxPdVHyTf6zg+N/h3nUWpPq6o=;
 b=TJ40tHCSLSsy4EfgwXa1WIxVwH8Ifqy6+zN0AUBEBOQTQA55jtEYI3Y6ziZ29ZQ/hi
 SvU5b76RQ95LTxheqUfiiqyPp4xiCc900ouMgm4duQOPwNDH50VpLFuoOz8tLYm6X287
 va6IDeSa4qjKubEV0iE/LZ4kAc74fvNUFgypU9oPjkqhJ4KO6bXQZeMCnHlP/70+DGxX
 SJs5g2nNPyIhsPyc4uLgi7znyJFAVCDHxMRtadH6Bsfl+K98202nRlKcmZaiDxmfKB3E
 2nsTo4fXWjf3CwvpBZV+rAuLCrCvsNw3OeThMLJuFXx6f6ZLpBq68+LYH5PgCUtcDd58
 HH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721467476; x=1722072276;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8xY51Jb5ypiUobSDVwSxPdVHyTf6zg+N/h3nUWpPq6o=;
 b=nia/hWDz1tav4bT4qURXdIhGbsLEo5e4j79DH7NMVHFlnJYmpI7AoVWrRmmIH4ZoTS
 Xil1bphIuyzOZ2+lZRnlk9nNh3lAfnej7ljTTMot7fSDAUumMcUi9OpfrC7EomSBIBfb
 258kQnldnArYYgQ6yxHucfbqFKE2X/YiDhqc5vkyUo90tIL+RnOGYFsHnPtrU4ZS+NPI
 mTSvd1gJU93L8eBaciJAu9jlR2b+hKsshq43PD4FJtLUI7rfp+GvLTh3PkHiDj1gtGiK
 SceQOTs9pEBCTMnNoyBx/DmQfYBlO/sZkcmexynns9jdlmB4qTZcc4qjr5k3F2g11m7w
 CBYg==
X-Gm-Message-State: AOJu0YzwmVuF61IVX6RfDKhcVndhBjBfFD8HduLDdFqgtNk+HSzyHKus
 9WR34gy8BFWyRfglAokI+YQLK2Pv60kNhm7eCobA0grQACpo5eFF0+1ERSuQPp7nuwbjHngZMcu
 M
X-Google-Smtp-Source: AGHT+IFJQqaOVeiLgadNOuRqIzShX+BflcMndgm3s1IBgbROdGWXxyu/xrw2+gDjWuyZtSEAL8dnVA==
X-Received: by 2002:a05:6808:138c:b0:3d6:30c4:de30 with SMTP id
 5614622812f47-3dae5ffa48cmr2693476b6e.22.1721467475813; 
 Sat, 20 Jul 2024 02:24:35 -0700 (PDT)
Received: from [192.168.68.110] ([179.193.8.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70cff4c2278sm2336001b3a.88.2024.07.20.02.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jul 2024 02:24:35 -0700 (PDT)
Message-ID: <29e10101-3504-4cb8-a397-b6832c518b21@ventanamicro.com>
Date: Sat, 20 Jul 2024 06:24:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] tests/avocado: Boot Linux for RV32 cpu on RV64 QEMU
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, bmeng.cn@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20240719231149.1364-1-zhiwei_liu@linux.alibaba.com>
 <20240719231149.1364-9-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240719231149.1364-9-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
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



On 7/19/24 8:11 PM, LIU Zhiwei wrote:
> make check-avocado AVOCADO_TESTS=tests/avocado/tuxrun_baselines.py: \
> TuxRunBaselineTest:test_riscv64_rv32
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Suggested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tests/avocado/tuxrun_baselines.py | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
> index 736e4aa289..589c7f254b 100644
> --- a/tests/avocado/tuxrun_baselines.py
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -533,6 +533,22 @@ def test_riscv64_maxcpu(self):
>   
>           self.common_tuxrun(csums=sums)
>   
> +    def test_riscv64_rv32(self):
> +        """
> +        :avocado: tags=arch:riscv64
> +        :avocado: tags=machine:virt
> +        :avocado: tags=tuxboot:riscv32
> +        :avocado: tags=cpu:rv32
> +        """
> +        sums = { "Image" :
> +                 "89599407d7334de629a40e7ad6503c73670359eb5f5ae9d686353a3d6deccbd5",
> +                 "fw_jump.elf" :
> +                 "f2ef28a0b77826f79d085d3e4aa686f1159b315eff9099a37046b18936676985",
> +                 "rootfs.ext4.zst" :
> +                 "7168d296d0283238ea73cd5a775b3dd608e55e04c7b92b76ecce31bb13108cba" }
> +
> +        self.common_tuxrun(csums=sums)
> +
>       def test_s390(self):
>           """
>           :avocado: tags=arch:s390x


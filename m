Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7BFC77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 14:04:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2Y3e-0000Ej-Fn; Fri, 26 May 2023 10:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q2Y3d-0000EH-CN
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 10:04:41 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q2Y3b-0000p0-GC
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 10:04:40 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-309550d4f73so1652727f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 07:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685109877; x=1687701877;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RrGu5Z8/SkD7l3Ukj0FwTQqkiFp3LvVlz2cMv2B0iWU=;
 b=IlxMnWE8xS0msvj8ZEF3mllbCkQ+xDTL0a4HDSJL9nm22QkB26G1q3Ezs7EzUHDve2
 ZvDhwDoRcv6I5WrSoGZhAAoDiHA2A3SAFlH48b7Zbh0uENl6e7YkOjkc2PTD1Axb5Yjp
 gZy4D1rz+k2pcARvGo338P1qRkwNPfOtV31Xpf/lqwn5UQlOrfpPBPWr0vKVr1GXTX+u
 2ADQskyliY9iIB/097l9zrTheEdsNRv/4y85biJg/Cj4LMktWcts3971jozXNmbx1IvW
 cm/FhLwsuYRqQDh41Wvp0DbktgLPMCuqL0HyJIiDQ0ClykEwp7rWMAuE2Deg0Zkpd8iI
 pMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685109877; x=1687701877;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RrGu5Z8/SkD7l3Ukj0FwTQqkiFp3LvVlz2cMv2B0iWU=;
 b=ZKPCF4BvnHJyTCMki385ILRroicEbUBGzPo+P3JxiCBTNgNw8XWjh8i++abyPFd7cH
 SKKTTFaDbNnczCFVMUebdfjEmJHQ40KrP0ojle0+/7IcmxFxwXGqClpyo49qzNOnQoRp
 heUMyDd7MrUSds1u8snLKHSuZu3hkfFvM4ujvFISMtWx8MYoYc33IejpC5DNJsE8zP5+
 O0DwLX2anBOhyF6AxLjIwTK5ke8bzGO2jm+8K/JSTshAsKFEPy33XewKbCD4CaEXPchz
 qNrddCh/uQa9ZIKGqSRsU5EgtIYDoAMubyU7FCfoJgD0VYQHZ2u+eMbzZIuQJwEV2ZeR
 rAPQ==
X-Gm-Message-State: AC+VfDwS33tCJrfwlfpbTb7aFmeGxerYMs0J0sc1oIqGzg73ObLnoKMa
 LAvx/7w4VvNc0/jNBOZXZOCf0w==
X-Google-Smtp-Source: ACHHUZ7A+kgTEnkepuNOiHlWXqoWn4j8/iaFA6yCt8QL0ayYLH+1K2PvmixcK9xbZdgC+kDVWdAGAg==
X-Received: by 2002:adf:fe84:0:b0:30a:c707:902b with SMTP id
 l4-20020adffe84000000b0030ac707902bmr3401597wrr.25.1685109877400; 
 Fri, 26 May 2023 07:04:37 -0700 (PDT)
Received: from [192.168.69.115] (vit94-h02-176-184-29-207.dsl.sta.abo.bbox.fr.
 [176.184.29.207]) by smtp.gmail.com with ESMTPSA id
 m1-20020adfe0c1000000b0030796e103a1sm5236100wri.5.2023.05.26.07.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 07:04:36 -0700 (PDT)
Message-ID: <c267b027-5b60-ad39-2940-6960be1fb7ba@linaro.org>
Date: Fri, 26 May 2023 16:04:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v5 2/3] riscv/virt: Support using pflash via -blockdev
 option
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrea Bolognani <abologna@redhat.com>
References: <20230526121006.76388-1-sunilvl@ventanamicro.com>
 <20230526121006.76388-3-sunilvl@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230526121006.76388-3-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 26/5/23 14:10, Sunil V L wrote:
> Currently, pflash devices can be configured only via -pflash
> or -drive options. This is the legacy way and the
> better way is to use -blockdev as in other architectures.
> libvirt also has moved to use -blockdev method.
> 
> To support -blockdev option, pflash devices need to be
> created in instance_init itself. So, update the code to
> move the virt_flash_create() to instance_init. Also, use
> standard interfaces to detect whether pflash0 is
> configured or not.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reported-by: Andrea Bolognani <abologna@redhat.com>
> Tested-by: Andrea Bolognani <abologna@redhat.com>
> ---
>   hw/riscv/virt.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



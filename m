Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5E8C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 08:48:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxNx8-0001Fk-Iv; Mon, 30 Oct 2023 04:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxNx4-0001F2-O9
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 04:48:51 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxNx3-0006Oq-76
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 04:48:50 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c50cd16f3bso57734151fa.2
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698655726; x=1699260526; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BxotMTA7zgaoJrf2veaoR7Z33I7QPF8c1mSn2VHKSOk=;
 b=c+5dvKovfiD6eCciPimYG18wowUTOe1SF4LMAv2/S00VhIgVRhUhKsZiL+DnObGv1I
 56c65iT8JioreoSARq9kt5NL7YiV8IJ5TBBKg3ODPJoMRvkN0RGVS9mitCggXpZ7s8uA
 tmdDWuznmKDrLz4vHOuVldUCFhLhDC1a64tBAo9KenzItNo9Ul0TsuWRMFaJgZnWt2b6
 IXaeok5huxie67raBAweCw8MgPmVGE2rdMagAp88X9bAIcFCk17jxHPxeLXko8t+tUkv
 eOJWEoRGSj34miAMAmQS+ZGK72M06BKrlYRYafSsM86iUU2VLmDH3sJ+FE+01l/7lGfE
 QXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698655726; x=1699260526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BxotMTA7zgaoJrf2veaoR7Z33I7QPF8c1mSn2VHKSOk=;
 b=Ujvr3Wp0yGv9SXkXLoGOHMV2QSjPwD4Sxlr0V0k/Ri78P5hKE3plr0Kyxm4tFhaYsj
 svK+aISC3QhSkcUqSgeN2yMZVSexSEDNmgdymKNQEw00mOCqqLUPyFvfruX7irpim2No
 b6tuHPOQ1PaVdLroVgZj1eFQ87IPk3plSsePcOZtiUX3E5UvF0nY10dTnflUTItNTRJM
 ylAvf5NXe6b+zT4xe5LWtVEqn8nS81D53z9k2gxuzSOUdHLdhFrTBZJ+vrkXA41njswx
 l9LXQiQ/uOVLf4paiNmKDqjDBh/dTpRkseN1d+pdm7DAKHGCb+R6bgeVlbYzYSCK8sHM
 zUTA==
X-Gm-Message-State: AOJu0YzOLom6wYfTQtiypmFmUh2DN7+lRaM5r5clgSqR4aSMC284IcUn
 FKY8dPIEkdiDvioB+tezZp1HLQ==
X-Google-Smtp-Source: AGHT+IEYRBxYq89PQveDuqA39ajKsFfBoDrAWvQ9p/N4QrW+1nn/++fBrRFO+fqOcVXVHIP7rs4rzA==
X-Received: by 2002:a2e:9510:0:b0:2bc:d5f1:b9cf with SMTP id
 f16-20020a2e9510000000b002bcd5f1b9cfmr7103612ljh.27.1698655726480; 
 Mon, 30 Oct 2023 01:48:46 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a05600c4e0a00b00402d34ea099sm11993865wmq.29.2023.10.30.01.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 01:48:46 -0700 (PDT)
Message-ID: <9570da29-881e-7e6d-40ec-5cdd2177e664@linaro.org>
Date: Mon, 30 Oct 2023 09:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/1] MAINTAINERS: update mail address for Weiwei Li
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 lazyparser@gmail.com, Weiwei Li <liwei1518@gmail.com>
References: <20231030081607.115118-1-liweiwei@iscas.ac.cn>
 <20231030081607.115118-2-liweiwei@iscas.ac.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231030081607.115118-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x230.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.972,
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

On 30/10/23 09:16, Weiwei Li wrote:
> My Iscas mail account will be disabled soon, change to my personal
> gmail account.
> 
> Signed-off-by: Weiwei Li <liwei1518@gmail.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



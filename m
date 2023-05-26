Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671C7C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 14:06:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2Y42-0000Gi-FS; Fri, 26 May 2023 10:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q2Y40-0000GS-R7
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 10:05:04 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q2Y3z-0000sU-An
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 10:05:04 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f6077660c6so5748905e9.0
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685109901; x=1687701901;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J72BzWYbijrZepyjdTGnY7swll5B4dqMgDn/MnBhBDk=;
 b=aeoT67e9shGqa/zpYgAFvksDTDz5VUGVPP4vyJ+X2wq8MX+WvNFIzZkVm7Wy3thxxx
 GbSaR5tWp/+xU6+xKCbAQQe41KIPMcagJ3erz1M7KqueGmCsO1fdcvcn6E5R0Xejx8E7
 CCa+5OYYrpwfUF2u+aRUL5tPEtKBaw9FJ+NEBSj564OBP7SCTqacLFteabJrCQs2oWPU
 9QZMvaUW6FlXDfLzzSqDwYMgF77ixFm2NnqfVAOJ/XG3jw/81fX4U65hPH64vT2lb9hq
 wZNFVB1jui7scE9flErvzosIM0H7+Lsv2utkT1npzFkROGT71oR2ZqOHWzPrq9SD0BG1
 ro8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685109901; x=1687701901;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J72BzWYbijrZepyjdTGnY7swll5B4dqMgDn/MnBhBDk=;
 b=Yx+3TPRuHAqlfCsQ6AwFDTRm2amzwRqawI4+AQV8zIACZxBY+yX0SlRAlNWP6yGhvt
 JTGu5a/Teb1LJf+HwneNBy9obb0BUA6bNcQxBwgUvyunDwLl0sGqjJbiMdR3AeqZgqNb
 +mz5BoEvBVSzM4s9PLgGxenkfZgD0GCH2k472bq4JTFanBc32PSduNmTcsc1kSb36DUz
 SRU/tSDmZyfctx0sae5RayD1buXvA03l7zkf92/WxWHAquoaUs8+RNVoEp4n9glVeNSF
 SIZhsLy2k0478SioXyfaxN6GTDo3QlzlLKRFK4CTPrtKRuJ502pbYbDAvWzbPWGANKId
 ErWg==
X-Gm-Message-State: AC+VfDzsTZXK5rg+h323imVcw9ZK7mFp4YuQ06q+lNUpbIZ229enwT87
 qcQut49uf6ePa9yVtgqdGo5xNw==
X-Google-Smtp-Source: ACHHUZ5dY3YclxAbmtv/EOrtbjh5x9Op3gLlFO5dZt4fLNE0vXbTc5kvqf1bBkz6R1XxP8iWPI2Yog==
X-Received: by 2002:a1c:7407:0:b0:3f6:cfc7:8bce with SMTP id
 p7-20020a1c7407000000b003f6cfc78bcemr1815704wmc.22.1685109901410; 
 Fri, 26 May 2023 07:05:01 -0700 (PDT)
Received: from [192.168.69.115] (vit94-h02-176-184-29-207.dsl.sta.abo.bbox.fr.
 [176.184.29.207]) by smtp.gmail.com with ESMTPSA id
 s15-20020a7bc38f000000b003f6028a4c85sm8884022wmj.16.2023.05.26.07.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 07:05:01 -0700 (PDT)
Message-ID: <3eb1d51e-7393-2dbb-a233-e9ff05be56f0@linaro.org>
Date: Fri, 26 May 2023 16:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v5 3/3] docs/system: riscv: Add pflash usage details
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrea Bolognani <abologna@redhat.com>
References: <20230526121006.76388-1-sunilvl@ventanamicro.com>
 <20230526121006.76388-4-sunilvl@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230526121006.76388-4-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
> pflash devices can be used in virt machine for different
> purposes like for ROM code or S-mode FW payload. Add a
> section in the documentation on how to use pflash devices
> for different purposes.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>   docs/system/riscv/virt.rst | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>




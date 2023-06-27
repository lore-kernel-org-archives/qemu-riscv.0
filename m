Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83BDEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 22:33:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEHFC-0003zK-G3; Tue, 27 Jun 2023 18:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEHFB-0003z1-3J
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 18:33:05 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEHF9-000457-D9
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 18:33:04 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9924ac01f98so89021966b.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687905181; x=1690497181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0hj8eouBAiRGhw+hc7cUfNXpep9mhaNbRJfPnHj4/G4=;
 b=kq62pezfd2hZP3Bpi5rjiOnKr72esS3DZBbq5Kjct09WaCZYC6ncPD+4JSxJYnomaF
 UNalbb9jK3+jbtxCbKGdiBKZllA7QXnV7zJZJcy7WfKnPSoEyvCKZNFscjTPjBnDB1Aq
 MJztrUEwKdoz7LMKV83MedADpCZQnIn0G5ouGI3vV/nx6TzZfX3k8znTExwhO8DB4p0t
 8MVDZ6WMK+AlNb3K3yExj2dvx915q/QBzpV1AM5WXiDFhWHZgoRxSS0pnbVxFJZVPclq
 /twR84/R9q9ZHZ80mpECrip7t1tBvDMvVaB/5wAGEC+G/BbaA49lNP0JkAL60mHQUnF5
 0z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687905181; x=1690497181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0hj8eouBAiRGhw+hc7cUfNXpep9mhaNbRJfPnHj4/G4=;
 b=F88MJrKtZGufIwSOpyR5mcimpUkM+MrObGB8Ud4YwwCZkbm6mZF/uYyxaq7AOEy7jZ
 /cUbNBfbC4YzqrEauWizqSjU9JUUkODsSsXlneEZTQjfaMQ+bYNryiHf5JpaWHnBiMOd
 xCCoj1KLRRzxsNxRimExuMJ29oYBbCoXdMq5imeClzk/NYrKhfaxbQKguTeC84kdADnN
 N9ieLPa2w84H1T9nIHFTp+WR3zKawXbHLPU/aYIgh/XexkeU+TTRkhBFCavxIl0Kc+xW
 CPWJdYl2WQEwHb2fCYn5zw/pWBziCLc00/IUpXupwj18ROrK289mm3pFbSV40uHu8l39
 Gv9Q==
X-Gm-Message-State: AC+VfDxwmCgVo48fFNl0gjDnbiX1Mzo/OYCGtWXxEBv7Oj0z9Ipus1Ps
 VkiteuNeBI536jVK8U+wpqIWKw==
X-Google-Smtp-Source: ACHHUZ4pNYBAsnMSaCCHRHOHgG5ZKREULGcixIuUnJUAgvsg+NW8EiLE9iVq3dyi37B6Zv21NcUuOg==
X-Received: by 2002:a17:907:2cc5:b0:988:2a2f:91b9 with SMTP id
 hg5-20020a1709072cc500b009882a2f91b9mr29831665ejc.63.1687905181679; 
 Tue, 27 Jun 2023 15:33:01 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.204])
 by smtp.gmail.com with ESMTPSA id
 ci8-20020a170906c34800b00982d0563b11sm4985675ejb.197.2023.06.27.15.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 15:33:01 -0700 (PDT)
Message-ID: <8b6b144d-23f0-445a-77f5-5858253b9c8e@linaro.org>
Date: Wed, 28 Jun 2023 00:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 00/16] target/riscv: Allow building without TCG (KVM-only
 so far)
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
References: <20230626232007.8933-1-philmd@linaro.org>
 <59b5b342-8940-5ac1-0cec-8c136c4916d8@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <59b5b342-8940-5ac1-0cec-8c136c4916d8@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
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

On 27/6/23 20:54, Daniel Henrique Barboza wrote:
> Phil,
> 
> Can you rebase this on top of Alistair's riscv-to-apply.next?
> 
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next
> 
> There's a trivial conflict in patch 8 and a not so trivial conflict in 
> patch 14
> that I'd rather let you deal with it.

Sure, no problem.

I'd like patches 1-4,6 to go for the 8.1 release. I don't expect the
rest to be picked, and am ready to rebase and repost once the tree
re-opens after the release. So don't worry about 8/14.

> Also, can you take a look at these KVM patches to see if there's a 
> potential
> design conflict with what you're doing here?
> 
> "[PATCH v5 00/19] target/riscv, KVM: fixes and enhancements"
> 
> We're missing a few details in one of the patches and it seems good to 
> go. I am
> doing some stuff there that I'm unsure if it will compromise the work 
> you're
> doing here (e.g. creating kvm user properties by using TCG user 
> properties). In
> a quick glance at your series I think we'll be fine, but better safe 
> than sorry.

I had a quick look and I don't see any particular divergeance. Anyhow
your work is older and more important that what I'm cleaning here, so
don't worry :)

> I guess I'll wait for you to send a rebased version of this series and 
> apply
> mine on top of it to see what happens. That would be a good test.

Nah, at this point in the cycle, don't bother.

Thanks for having a look at this series!

Phil.


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB90CDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:46:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqw1E-0003uv-1D; Thu, 12 Oct 2023 09:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqw0w-0003nn-91
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 09:46:10 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqw0q-0004Bi-Vb
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 09:46:10 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9b9ad5760b9so151026066b.3
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697118363; x=1697723163; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y5qqyPzMfBchWSX09ks8xoRx7OOOdYLZgYkzCeEAB98=;
 b=Q3GIjrDuRrS/6k6PNjQYEpu6aMVhgm6JfjriUAGwiYbjvYUykWgWefvkZk1KCZ3Wg2
 9RnxYJ6J27pReO98CkkUAwsvNKfQOsS7AXtEvtevLk6akzChBfG32v++lsunrpYoEuEj
 ycZVgxD6455hcvK9SzapUS+gXJ3nXfrymyoJVHm5vA7Nt1vDMzitg+C5V1Le6YfrOqHs
 +4e5UJarEK8pLmRepnDgxESH1icTLEx0h4l+YZJbiulOc0y2AlFhJxp2w2yNOjR1Jdeo
 Ck7+HLJnTxeatp6Y+tAR6O0ysg4U/WcNiBRFttEEyenDnShrfMZWIn7JCqLe35n+YVLX
 OPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697118363; x=1697723163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y5qqyPzMfBchWSX09ks8xoRx7OOOdYLZgYkzCeEAB98=;
 b=LEEYk8UE87TmOBgjgCZsOKUGjefCKOGe/5MLXMj87Mv3/W8zZgmdnrhPzxmZKrA76N
 o5VWf447wp8kNCNtRYNrV3mDJeDfVezI67tCAA1+mu4kvYcNMl5YNSFgukhg6ASLLIXt
 YSJyVZmjduUbJiP0TIiCYfKg0PRAm4L4qf3eZGcFvI5JXlsDgL8D9MledNdiFoO19nyf
 IEEp4+FnEf9IsvdX4hx7DrQ/IcSkxTTIPJVbzX+VMThpiboO8BK8uQYFz1d8zqp5ewL1
 6hwdYcmQ8Glw+84n8XS/KYO6/u2QbzQ/ZsJS0HqBWDkI/B8dTUvN21JJ0E+Us9GFZ2XS
 WNxQ==
X-Gm-Message-State: AOJu0YxQsn/a3kS3n49ETmCigZgvdoVEk8wL9gPqfXmr6Gy7Q8u39lAj
 QGmZfEpUpa+7Iiyv7rMCu1ZvZw==
X-Google-Smtp-Source: AGHT+IFwpyrpKzi1DxGwgDLQ+uExtNc5bh9SEaiArJ7YpDFiqNNM0/Vx5p9bNsUT7cj8zRyK7xSclA==
X-Received: by 2002:a17:906:8a49:b0:9ae:5202:e611 with SMTP id
 gx9-20020a1709068a4900b009ae5202e611mr20408231ejc.14.1697118363199; 
 Thu, 12 Oct 2023 06:46:03 -0700 (PDT)
Received: from [192.168.69.115] (176-131-211-232.abo.bbox.fr.
 [176.131.211.232]) by smtp.gmail.com with ESMTPSA id
 h24-20020a1709063b5800b009b285351817sm11155765ejf.116.2023.10.12.06.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 06:46:02 -0700 (PDT)
Message-ID: <dc65e5ae-42b0-db23-4d1d-1dc58275e2e3@linaro.org>
Date: Thu, 12 Oct 2023 15:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v11 12/18] hw/core/cpu: Remove gdb_get_dynamic_xml member
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231012130616.7941-1-akihiko.odaki@daynix.com>
 <20231012130616.7941-13-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231012130616.7941-13-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 12/10/23 15:06, Akihiko Odaki wrote:
> This function is no longer used.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/hw/core/cpu.h |  4 ----
>   target/arm/cpu.h      |  6 ------
>   target/ppc/cpu.h      |  1 -
>   target/arm/cpu.c      |  1 -
>   target/arm/gdbstub.c  | 18 ------------------
>   target/ppc/cpu_init.c |  3 ---
>   target/ppc/gdbstub.c  | 10 ----------
>   target/riscv/cpu.c    | 14 --------------
>   8 files changed, 57 deletions(-)

Shouldn't this patch follow "gdbstub: Simplify XML lookup",
before "gdbstub: Infer number of core registers from XML"?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



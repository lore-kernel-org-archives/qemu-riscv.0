Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BDAC4167B
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 10:59:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r91Ef-0002iZ-J1; Fri, 01 Dec 2023 05:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r91Ea-0002YP-EN
 for qemu-riscv@nongnu.org; Fri, 01 Dec 2023 05:59:02 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r91EU-0004U6-SO
 for qemu-riscv@nongnu.org; Fri, 01 Dec 2023 05:58:57 -0500
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c9b88cf626so26409801fa.3
 for <qemu-riscv@nongnu.org>; Fri, 01 Dec 2023 02:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701428333; x=1702033133; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kBgEHer+ht0dHaP6LJn8O1147TeXZtstiObP4o2ORIE=;
 b=yyYBidxIwnP/yECByAwEj1U8ScmGdnOSohVSKzyBsjPuUDynXQJDmnP/6yp1nSq8q5
 w3bbQoHhgDD2nAuOdBGyyVjuX/GXBoFPj2ZcqeGrNi3S1IhlsjzuDiYOk6vDjF66v1Wp
 asaUT7FrQPV0/ioRrMwK52JQQMtJu0K5S3BM/xoqb+Mz+fNJDbFKTzJ5JNhS3dYp+pRy
 RPrIXVV9wsJTkL4aG3jaLgvBYVDEIbyHUDVfyCqsOvhI/XgJfZVOvTQrFUiSfCW9wKRO
 SvyZDEXQwEGwOqxq12gjnkCYv5/7JwdEy5XgfKJiYEU3rhXueR+sttFKiqPiEjV8BBgK
 VOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701428333; x=1702033133;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kBgEHer+ht0dHaP6LJn8O1147TeXZtstiObP4o2ORIE=;
 b=lemJ57XpTyvATO9YdKZjOaJKcn7CbAG0RDvMeW6Y+9PsLC2euQJXW3sPcI8e2OYwFR
 +gVMQogRHcVADpNDfj079dC1pVSctSF1Rb8bKsTdrwvNBepZaOlBYR20hdZx7yoKNKhY
 Z4dlEqi153tid+Yr8vq82nbH2iHURPc/zFonshTJwTA6MokU0oZAQzc/L4tLDAgx6WQ8
 hQSYTO/nK6QwfhOAhh6IEj5eWsQ8T1Ngyg0HHqtKesL/QInbev536qhbeO1Jmvo/aRcw
 LXYKYcpHENMkf+4UVZlB1iVJIMFDATZM0G3gjRxBrkOb4V00w7vIE6gUCqKlCXjhsIv0
 2b4Q==
X-Gm-Message-State: AOJu0YwLFr8e7enSJtGrARhmxfYmrtPk4t1MxBKrpLpnz56MNn033N9r
 Pq42ywhvu6waErkpS8yCfslAP8IuI7qDMk2ZNecwRg==
X-Google-Smtp-Source: AGHT+IFFwM1ZKy97oak8J+Rv7ndWdysgnH6YMTw9IM1ZOw/7O+SBo5Jv9glACV8c6uZ3wTh7JlJkaQ==
X-Received: by 2002:a05:6512:3ca2:b0:50b:cf6d:fe33 with SMTP id
 h34-20020a0565123ca200b0050bcf6dfe33mr912018lfv.58.1701428333107; 
 Fri, 01 Dec 2023 02:58:53 -0800 (PST)
Received: from [192.168.69.100] ([176.176.160.225])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a05600c348d00b0040b5377cf03sm8725717wmq.1.2023.12.01.02.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 02:58:52 -0800 (PST)
Message-ID: <33f3cdfa-fe4a-4512-bf87-5b26e2fc2c81@linaro.org>
Date: Fri, 1 Dec 2023 11:58:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/9] machine: Print CPU model name instead of CPU type
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231129042012.277831-1-gshan@redhat.com>
 <20231129042012.277831-5-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129042012.277831-5-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 29/11/23 05:20, Gavin Shan wrote:
> The names of supported CPU models instead of CPU types should be
> printed when the user specified CPU type isn't supported, to be
> consistent with the output from '-cpu ?'.
> 
> Correct the error messages to print CPU model names instead of CPU
> type names.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v8: Use g_autofree                                        (Phil)
>      Relace 'type' with 'model' in error messages          (Gavin)
> ---
>   hw/core/machine.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



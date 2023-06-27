Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E773EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 14:31:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE9is-0002v1-8d; Tue, 27 Jun 2023 10:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qE9ir-0002uq-6h
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:31:13 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qE9ip-0003KW-17
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:31:12 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-991e69499d1so202103966b.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 07:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687876269; x=1690468269;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wWh3wbLWDZw0Yq2Bc0d2ZHSKMF/ZCOBFVqmG1YYYJ28=;
 b=hfk69eC/TXZo3H0i0o5v7pli1F+nmb+qLPViUc0NAjl0QOv85RvHhO6LssCBpYc7o5
 9EaABn4ECkipuK51l/vA4gv+qAEIyhlIqA9HSrSN+sgFWzt0d02MBrQP9eeXC2vnQ+Py
 4CoC1HpbpX6RdY8H26JFun89rpZuk6p7Nx1shIVoGvxjebgOsCb3VsLVdJu38W46Ualf
 HzZPYiXSnfuSOozldHXeVOqxgREjBANMJJ4fsuT59J+g6+cpP3HHplN04qBSVdq1MMpu
 ZWWYawC+mmlvgQGuKtd73FyALR96tzW0LoFH9r81njCqChrFYy3Pyngehcqs9rtwil58
 gnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687876269; x=1690468269;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wWh3wbLWDZw0Yq2Bc0d2ZHSKMF/ZCOBFVqmG1YYYJ28=;
 b=LauADncY45bXHh+bCHcxfiG7NPv76Of3Mmlox5bL1dVp+NcdrcseScqBcjWSY5WuIW
 LOf6d0aNuDicCdlYX4Nme7kfrhEPMEO2+lnhuJ2jeZjwbMFbqwycdk7/mKvjOU74Usg3
 kbWRbHgpihWe/9NVxvcpc1LpR3GNg7gcr8ErCUdmYmi3gSwpDwdty5cXcheeSpaRJ1u4
 ZXLtl2kcbUwFJSc7oMT/zqROVeycDvbb3vdGXVjiuDwn1w/7s+5odwPwZuMLl0CNcTIl
 Uci74hbKoMHb2XdGbhko9Z83YuCiGEXy4mCpo7zSuILt6Fe8bye/O0FNbDEEeHSIuV+B
 QLFg==
X-Gm-Message-State: AC+VfDxKu+jGRnmsfGBkNGST3Ekg0BOFC7fiVkyO5pyZbUGxHgmwl/za
 B3EftVnr2MKxAH4brG5GoOKsZg==
X-Google-Smtp-Source: ACHHUZ5Wv6Dz5ATY8ECZMCYPN6BHfb45Nveaq4T2+IYJbvkIVrg97Pc97telh1RSebYWrMF2XB68qQ==
X-Received: by 2002:a17:907:934e:b0:989:5d0:3189 with SMTP id
 bv14-20020a170907934e00b0098905d03189mr21833116ejc.33.1687876269517; 
 Tue, 27 Jun 2023 07:31:09 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.204])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170906170f00b00986211f35bdsm4577382eje.80.2023.06.27.07.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 07:31:09 -0700 (PDT)
Message-ID: <30946e95-4ce8-485c-35c5-daa60ccb187c@linaro.org>
Date: Tue, 27 Jun 2023 16:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: Is it possible to boot a riscv32 guest on riscv64 host using KVM?
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>
Cc: Yifei Jiang <jiangyifei@huawei.com>, Mingwang Li <limingwang@huawei.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv <qemu-riscv@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <deda3e29-654a-5a60-98bf-b97b0ada570e@linaro.org>
 <CAAhSdy2JeRHeeoEc1XKQhPO3aDz4YKeyQsPT4S8yKJcYTA+AiQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAAhSdy2JeRHeeoEc1XKQhPO3aDz4YKeyQsPT4S8yKJcYTA+AiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 27/6/23 15:24, Anup Patel wrote:
> On Mon, Jun 26, 2023 at 4:57 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> Hi,
>>
>> I'm working on a tree-wide accelerator refactor and want
>> to run various configs to be sure I didn't broke anything.
>>
>> QEMU theoretically supports running a riscv32 guest using
>> KVM on a riscv64 host, however the documentation I'm finding
>> only refers to riscv64 guests:
>> https://github.com/kvm-riscv/howto/wiki
>>
>> So I wonder, is this a valid / supported config? If so,
>> do you mind helping me with pointing me to a guest image
>> and its command line?
> 
> Currently, we only support running rv64 guest on rv64 host
> and rv32 guest on rv32 host.

Good news, less configs to test!

Thank you,

Phil.

> In the future, we might support running rv32 guest on rv64 host
> but as of now we don't see a strong push for it.
> 
> Regards,
> Anup
> 
>>
>> Thanks,
>>
>> Phil.



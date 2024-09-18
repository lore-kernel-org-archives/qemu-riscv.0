Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29405CE8D6F
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 10:07:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1srE1n-0005LU-KF; Thu, 19 Sep 2024 06:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1srE1i-00055g-F8
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 06:04:42 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1srE1g-0002Gw-Ct
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 06:04:41 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c42bcf35fbso897196a12.1
 for <qemu-riscv@nongnu.org>; Thu, 19 Sep 2024 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726740279; x=1727345079; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=81ACQ82gDj72T87fy7/My8kXXhxYI09wt3YtDri9Pls=;
 b=M6Dyj09H+11MBxr7CMiaNRcJJrgsheNKIYRWdRAevKtlA5bLTVvK1gtvt+aZcK9ovt
 Xj9e9F/i73Nb/SdRAZmo3r3UeWFK9070KaMTYKHmC4QJn3mhb6bUrY7d5SMFIb8XKUkG
 E5JBcLjykqkjVhyycKHK85hxyBOyo7yGiXsT8KGPHSaVzahqPvEdE58U72PGHWw+1c7c
 1aogejzh7w3D9AGZo+wjABfUnSB5D+smN25zHiD+Y2wKB8V7xv21G9SwGEveiwggxhQC
 oX67BNjQ261gWL38JFosizzz3TfKjYzcDHEZvNpClOajuTa6q2uxMMNHHVdUjfy1zNSb
 PPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726740279; x=1727345079;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=81ACQ82gDj72T87fy7/My8kXXhxYI09wt3YtDri9Pls=;
 b=oMdSdi7inLT/GYClCa2fjYxIMLcLP6PcVyA2iLFa8re++91qqLGP+CTwLtH2HnpUh9
 y6WzfWZDAXfmH5l08JWG3y7iNxfo6yZ0A2/WrjzEEci0th6w3CQJH8sU0B5A8eyKE2HE
 da3IQA1sxgX+XRGK4WJN+h+XVvmZFah4f/MJG4TbYL9WOOD2R+wdLe1MTBzR5LU+rkHq
 4usZue4xxHegRe9IzTw2+JxZ/+cWijLJOd14osM1ELtb7F/+lFdIn34Vj46rk4HmG+l6
 XLz/kaufk5t7bz1lExpZkLh1i/jR3U8PDt04UzFLmz/DlH5XGw4IwjFM7L6TGO+AV0h/
 W4Ow==
X-Gm-Message-State: AOJu0YyUXoOvxSJihdut3lQbNnTT9T/zt/BmWiRofcC/eo3wN+NzSd7H
 zUWDRp69a8NOCT/SVJL738pJnvAxO7wzNx9TRVfcH9rXslfYJ8eeJELhO0CTgPU=
X-Google-Smtp-Source: AGHT+IE+Yatp9E73lkXWZgN6JDVIz6cIW61Qna3MKjZXdj3GufiJylKkykMDQkuD494+LUPA/H02Qw==
X-Received: by 2002:a17:907:980e:b0:a77:cca9:b212 with SMTP id
 a640c23a62f3a-a9048048388mr2008383566b.45.1726740278668; 
 Thu, 19 Sep 2024 03:04:38 -0700 (PDT)
Received: from [10.133.7.245] ([83.68.141.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f3aaesm701574766b.53.2024.09.19.03.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2024 03:04:38 -0700 (PDT)
Message-ID: <20e20fde-830f-4314-a944-e7973bda5d8c@linaro.org>
Date: Wed, 18 Sep 2024 16:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] tcg/riscv: Add basic support for vector
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 Swung0x48 <swung0x48@outlook.com>,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240911132630.461-1-zhiwei_liu@linux.alibaba.com>
 <20240911132630.461-3-zhiwei_liu@linux.alibaba.com>
 <0d591570-02c6-48c9-9e3f-ef47ac20ce7d@linaro.org>
 <b87e7a7e-41fd-4b26-bde3-9adca9babb24@linux.alibaba.com>
 <33101e38-080d-4444-a8c3-9d01827e243f@linaro.org>
 <b88244bc-aaf7-42f9-a90f-e4027ac72ebf@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b88244bc-aaf7-42f9-a90f-e4027ac72ebf@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 9/18/24 12:43, LIU Zhiwei wrote:
> 
> On 2024/9/18 18:11, Richard Henderson wrote:
>> On 9/18/24 07:17, LIU Zhiwei wrote:
>>>
>>> On 2024/9/12 2:41, Richard Henderson wrote:
>>>> On 9/11/24 06:26, LIU Zhiwei wrote:
>>>>> From: Swung0x48<swung0x48@outlook.com>
>>>>>
>>>>> The RISC-V vector instruction set utilizes the LMUL field to group
>>>>> multiple registers, enabling variable-length vector registers. This
>>>>> implementation uses only the first register number of each group while
>>>>> reserving the other register numbers within the group.
>>>>>
>>>>> In TCG, each VEC_IR can have 3 types (TCG_TYPE_V64/128/256), and the
>>>>> host runtime needs to adjust LMUL based on the type to use different
>>>>> register groups.
>>>>>
>>>>> This presents challenges for TCG's register allocation. Currently, we
>>>>> avoid modifying the register allocation part of TCG and only expose the
>>>>> minimum number of vector registers.
>>>>>
>>>>> For example, when the host vlen is 64 bits and type is TCG_TYPE_V256, with
>>>>> LMUL equal to 4, we use 4 vector registers as one register group. We can
>>>>> use a maximum of 8 register groups, but the V0 register number is reserved
>>>>> as a mask register, so we can effectively use at most 7 register groups.
>>>>> Moreover, when type is smaller than TCG_TYPE_V256, only 7 registers are
>>>>> forced to be used. This is because TCG cannot yet dynamically constrain
>>>>> registers with type; likewise, when the host vlen is 128 bits and
>>>>> TCG_TYPE_V256, we can use at most 15 registers.
>>>>>
>>>>> There is not much pressure on vector register allocation in TCG now, so
>>>>> using 7 registers is feasible and will not have a major impact on code
>>>>> generation.
>>>>>
>>>>> This patch:
>>>>> 1. Reserves vector register 0 for use as a mask register.
>>>>> 2. When using register groups, reserves the additional registers within
>>>>>     each group.
>>>>>
>>>>> Signed-off-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
>>>>> Co-authored-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
>>>>
>>>> If there is a co-author, there should be another Signed-off-by.
>>>
>>> This patch has added a tag:
>>>
>>> Signed-off-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
>>>
>>>
>>> Do you mean we should add the same tag twice?
>>
>> The from line is "Swung0x48 <swung0x48@outlook.com>".
>> If this is an alternate email for TANG Tiancheng,
> 
> No, Swung0x48 is another author.

Then we need a proper Signed-off-by line from that author.


r~


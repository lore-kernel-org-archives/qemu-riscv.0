Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E737C072A2
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 07:34:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3tMg-0006l1-Sp; Fri, 17 Nov 2023 02:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3tMf-0006ao-CP
 for qemu-riscv@nongnu.org; Fri, 17 Nov 2023 02:34:09 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3tMc-00068U-NA
 for qemu-riscv@nongnu.org; Fri, 17 Nov 2023 02:34:08 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40838915cecso13239255e9.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 23:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700206445; x=1700811245; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GUG/da0yQm5vkAjxdGxAQZYhgv/9yGi8exyh3Zhe7yk=;
 b=TUWHVLsP7CbIjEcKYgsmUqs/brDghelIVicoxd+cIPpQ4VTZsmFOylSPLgcGDX1iGL
 U4m0ThMz6oYTrYii2aUOMk+tup7JCgE5qC4kzq17Z5m4BfMj5bS03fZTzVY4QezCnWGw
 J+UREQ3XP0rbaiilnTfRkyhYy+NAJ+qmxmVCiH0/ldPppiJFKOEnZPtJZ6td16332s1I
 d4NTtuC7kGeTs2cASRlRqjGokRksmIMXBk0Qru5mrGURvL9ha0m6kwscD+tGtp2KxcBw
 p/JFRntWOhrLR/LymKIQg6WRbNk1iT6KWj0l4Valnm1xrWthnUnuBSfA5UJu8KVwirrW
 +YxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700206445; x=1700811245;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GUG/da0yQm5vkAjxdGxAQZYhgv/9yGi8exyh3Zhe7yk=;
 b=AUAUB4L08sVevulRuTs1txHWwTAM/hLVxscBrKqpPJUJ6Bm6ClHoQZQ9xKaLquqRjz
 b3stTWYK7a9UFD16YEvAb+RI3YuYgjdSuGgfGaFk8ib0aDidnz0BEPwNcVWzQC6m/vIA
 JG80EitjXYa9tQsvzfSRN0PVpEgFxkD5I/AxUfBruEW/B4VIPZM3Q3TuMlLmdoebsPSl
 26oHK5oBF4sSj+HXrw43oHgKz3tPykidGTp0ieC+u8+4AcrlOdfoVGsuDHXVsWBSjqIL
 UeQYvWyS8c9KoTHJNVvXajeykDZlaJucpnFFDFWkBtj2W/b9/DBQEg9lF92z7+0MbI8j
 +LXQ==
X-Gm-Message-State: AOJu0YyC3Hq0kjEF/DgVMplCIYfAU2wqCyHMBs7AsOtLFFGI6Q721hrd
 5E2eGAjpZ9fIKem9m/4fqg1HDg==
X-Google-Smtp-Source: AGHT+IEtoCKUwFq+pgycxTgFJBYrRNeX0Xdz8ARFoOchyUviFs6pr50nGZx6OvoxJWcTOw0fcg7IEQ==
X-Received: by 2002:a05:600c:1d02:b0:405:a30:151e with SMTP id
 l2-20020a05600c1d0200b004050a30151emr14823869wms.12.1700206444811; 
 Thu, 16 Nov 2023 23:34:04 -0800 (PST)
Received: from [192.168.69.100] (bd137-h02-176-184-46-187.dsl.sta.abo.bbox.fr.
 [176.184.46.187]) by smtp.gmail.com with ESMTPSA id
 f19-20020a1c6a13000000b0040a4751efaasm1698120wmc.17.2023.11.16.23.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 23:34:04 -0800 (PST)
Message-ID: <ebaa5c70-e410-465a-a94e-1a254506a81e@linaro.org>
Date: Fri, 17 Nov 2023 08:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <efc49f7b-70f5-4ce9-8179-79e8a6abd732@linaro.org>
 <78526851-6d44-4c18-97b8-57462fb42ab7@linaro.org>
 <7252553e-9ab3-4c8e-a867-55c57d0178ba@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <7252553e-9ab3-4c8e-a867-55c57d0178ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 17/11/23 00:26, Gavin Shan wrote:
> Hi Phil,
> 
> On 11/17/23 02:20, Philippe Mathieu-Daudé wrote:
>> On 16/11/23 14:35, Philippe Mathieu-Daudé wrote:
>>>
>>> I'm queuing patches 1-3 & 5-23 to my cpus-next tree. No need to
>>> repost them, please base them on my tree. I'll follow up with the
>>> branch link when I finish my testing and push it.
>>
>> Here are these patches queued:
>>
>>    https://github.com/philmd/qemu.git branches/cpus-next

Oops, no clue why I wrote github instead of gitlab, sorry =)

>> I might queue more patches before the 9.0 merge window opens.
>>
> 
> Thanks for queuing these patches, but I don't see 'cpus-next' branch
> in the repository. Please let me know if I checked out the code properly.
> 
> $ git clone https://github.com/philmd/qemu.git philmd
> $ cd philmd
> $ git branch
> * staging
> $ git branch -a | grep cpus-next
> $ echo $?
> 1

No need to clone, you can use in your current cloned repository:

   $ git fetch https://gitlab.com/philmd/qemu.git cpus-next:cpus-next

Regards,

Phil.


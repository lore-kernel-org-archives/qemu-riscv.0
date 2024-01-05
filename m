Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280E8C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 22:12:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLsQG-0006ZW-3L; Fri, 05 Jan 2024 17:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLsQF-0006Yx-CF
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 17:12:11 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLsQD-000808-Jk
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 17:12:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e37524fafso352285e9.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 14:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704492728; x=1705097528; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m3yG2KWxa3OKqQ8Fyt1qmo+ZnAZcvxYX44w2OFrXt/Q=;
 b=MTUoNOk/jncpVXdPapbY8Uai2x71dNygsqjzzS2jIrDhO+N1QucVsdSbAfBihoQq51
 evtr8VuidkMpZ2wnvgtcNB8vJI3kgco4ednP24BVQOZc69VgUXpjW2WNJGzx7FgzhLmR
 eXE/FUqpF4cCtaKOWU3nHP8XeSSOkzkNsTwNeaXCT4nZU5P9UMnfHZXJ9QjD8uI05FBf
 gRc/m8+yxKQGmRJd/z+PKds6QEo9v/MpBVlcQRM/MveYRh7jwTHbMotmJo+eOlzq2ZtG
 3W6jD+Tj05jgkj1INrxalFaxSigqXY6ndufYWYOK6knO6Uzt5xNKkMscwiKD1s961uv1
 sPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704492728; x=1705097528;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3yG2KWxa3OKqQ8Fyt1qmo+ZnAZcvxYX44w2OFrXt/Q=;
 b=mQ4G3FVV4PKb6nFtFkvxe6ZYMU0Cz+vtpTsK+LmOlsVf7i0qTa4sCX+Rd3z76ZM1Ag
 TENt+PKqyYUDgg63sx8sCnd7BXxWFkJDEKXR1r2gxDN7m+CFB4JNKfE8yQWZ+bsLkE2m
 eKUH/kthR1FKMdNwYT4MuIXPOCkP6SajhMeGhbBvnCYwpJhT51JAYFHuXhCT28pmaT57
 jbMaMEqAbdI9lxsklOFMqzE2I8LGS2Bqh+X798y5RgLCAwgFX9Q+ME9sWCQzezLX43cA
 PIpaewhMhhgRKDR1WDyrJBGAI0C5d8RSBra3tQp5djdM5MQM2E6iWJT0bpPeOMRLxpIy
 F2Zg==
X-Gm-Message-State: AOJu0Yyg5KTZF0BgY2w5TJ/QTPwXkS+3R7arkahV/m3QAIfF8xA++/Al
 8DfEMeIIoTyEPEFa37O2gKHfPEwz09YlAA==
X-Google-Smtp-Source: AGHT+IF3+MACXyun/VaYd6Fe2jOiVpF2kQbmrws3G83slXwUiNc3/CPYnP77XHyaydocrM//Qd2xrA==
X-Received: by 2002:a5d:6350:0:b0:336:a125:5385 with SMTP id
 b16-20020a5d6350000000b00336a1255385mr35451wrw.93.1704492728039; 
 Fri, 05 Jan 2024 14:12:08 -0800 (PST)
Received: from [192.168.69.100] (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 f12-20020adfc98c000000b003366aad3564sm2119510wrh.30.2024.01.05.14.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 14:12:07 -0800 (PST)
Message-ID: <2ddfcd43-b5db-4f87-922b-0d2d5dd27d77@linaro.org>
Date: Fri, 5 Jan 2024 23:12:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/9] Unified CPU type check
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 wangyanan55@huawei.com, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231204004726.483558-1-gshan@redhat.com>
 <0b2aaedf-7a4c-49f4-b4af-71f9ab693207@redhat.com>
 <ff0237a8-9e1c-46bf-ae69-99c3f33112f6@linaro.org>
 <23213dcb-16ca-4be4-9ff2-32e4fc491495@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <23213dcb-16ca-4be4-9ff2-32e4fc491495@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Hi Gavin,

On 13/12/23 11:54, Gavin Shan wrote:
> On 12/13/23 20:08, Philippe Mathieu-Daudé wrote:
>> On 12/12/23 05:55, Gavin Shan wrote:
>>> On 12/4/23 10:47, Gavin Shan wrote:
>>>> This series bases on Phil's repository because the prepatory commits
>>>> have been queued to the branch.
>>>>
>>>>    https://gitlab.com/philmd/qemu.git (branch: cpus-next)
>>>>
>>>> There are two places where the user specified CPU type is checked to 
>>>> see
>>>> if it's supported or allowed by the board: machine_run_board_init() and
>>>> mc->init(). We don't have to maintain two duplicate sets of logic. This
>>>> series intends to move the check to machine_run_board_init() so that we
>>>> have unified CPU type check.
>>>>
>>>> This series can be checked out from:
>>>>
>>>>    git@github.com:gwshan/qemu.git (branch: kvm/cpu-type)
>>>>
>>>> PATCH[1-4] refactors and improves the logic to validate CPU type in
>>>>             machine_run_board_init()
>>>> PATCH[5-9] validates the CPU type in machine_run_board_init() for the
>>>>             individual boards
>>>>
>>>> v6: 
>>>> https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00768.html
>>>> v7: 
>>>> https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01045.html
>>>> v8: 
>>>> https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01168.html
>>>>
>>>
>>> Ping to see if there is a chance to queue it up before the Chrismas? :)
>>
>> Series queued. "Before" Christmas will depend on the final release tag.
>>
>> Thanks for the various iterations,
>>
> 
> Phil, thank you for you continuous reviews and valuable comments.
> 
> Yes, the final merge to master branch depends on the release plan.
> 'queue' meant to merge the series to your 'cpus-next' branch ;-)

I had to fix 3 different issues caught by our CI. Next time please
run your series on GitLab CI, you just have to push your branch and
wait for the result :)

Now merged as 445946f4dd..cd75cc6337.

Happy new year!


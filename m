Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE05EC4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 10:08:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rDMAg-0004SF-0t; Wed, 13 Dec 2023 05:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDMAd-0004PK-KR
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 05:08:51 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDMAT-0005T0-Cy
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 05:08:50 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c256ffdbcso68744205e9.2
 for <qemu-riscv@nongnu.org>; Wed, 13 Dec 2023 02:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702462120; x=1703066920; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1jeRVloAfgc9VzxVBvU1eZ5DA0UROdx957mdkIzl4oQ=;
 b=KUqJk/4kyGkcfEFKCyxE+PhvUnuypsaXB6wW239kJ2aArHKExWiKrZos4dbRiDvrOh
 +EFoXECX3gdVUuYetmmbqfm1FJnNR1S1IWsJA6QAFSpouYrpfVMR1ex+SXzeg7qTWbPQ
 gV979wDVkw4lQuX3dlXbkxdMxWK/kO53nYxnepkdZnyHP57bIaWLQiR0JIFY2o+5OMk2
 EI8XziHTePvP+ZQ1z/pLwrGTat2IV9TNv0yTaZ5UpVTlgonGNeNnXb8qLQm2P8C4TyDk
 9nSvn5cAjc7gHg2XIwQVxLkw6on8MTERYckDAty+8LJKDBK57Put8anE57h3n5I16pui
 9C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702462120; x=1703066920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1jeRVloAfgc9VzxVBvU1eZ5DA0UROdx957mdkIzl4oQ=;
 b=asOh2xOOv4xnu+NrXoP+FCuzvLcXbNIIQSf08oCqdMt2UB5bMKGTmoihsc1vVgU3im
 18HtjO0Jfoilxzrv694ppgRINYlP7lBGegWo2XIFYm2p7z9wmDQ2I/Yzbhehuo4RJh5d
 VXwfT8i+xQydIElsrs/WbAKVIs/44ObgUGmmbE2Ulo5AXWL1AAn54aT3u5beXVMPSL4V
 lVh+T5AtsqaPLK4YkUI3m2m5mS4WaiaLpx7VFSvHq3iVkqu4MNDIklEquEJtxM4+jYdl
 94sfKMNfJk0e71wP68qfKaDnPrNkuDtG41OFCcqcdtJuAX7mjAwlA6JAFQg1gFny+3Cs
 p2Mg==
X-Gm-Message-State: AOJu0YzJKjyzSLJBtRoh7JZv0mP3eFO8VvpStVvQTNbX2QkPTr13C62P
 9fESwveJG92gUNDESWwE7oZRjA==
X-Google-Smtp-Source: AGHT+IH87rFAreeniJ3MdD3kXbX+E2Su8zg16d3KUGa1yJI+qt9gtmWVT+bCyKjf7Vjo1dI7wBQxeQ==
X-Received: by 2002:a05:600c:243:b0:40c:5583:c69d with SMTP id
 3-20020a05600c024300b0040c5583c69dmr1114688wmj.112.1702462119858; 
 Wed, 13 Dec 2023 02:08:39 -0800 (PST)
Received: from [192.168.19.175] (234.red-88-28-2.dynamicip.rima-tde.net.
 [88.28.2.234]) by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b0040b3515cdf8sm19847959wms.7.2023.12.13.02.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 02:08:39 -0800 (PST)
Message-ID: <ff0237a8-9e1c-46bf-ae69-99c3f33112f6@linaro.org>
Date: Wed, 13 Dec 2023 11:08:32 +0100
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0b2aaedf-7a4c-49f4-b4af-71f9ab693207@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On 12/12/23 05:55, Gavin Shan wrote:
> Hi Phil,
> 
> On 12/4/23 10:47, Gavin Shan wrote:
>> This series bases on Phil's repository because the prepatory commits
>> have been queued to the branch.
>>
>>    https://gitlab.com/philmd/qemu.git (branch: cpus-next)
>>
>> There are two places where the user specified CPU type is checked to see
>> if it's supported or allowed by the board: machine_run_board_init() and
>> mc->init(). We don't have to maintain two duplicate sets of logic. This
>> series intends to move the check to machine_run_board_init() so that we
>> have unified CPU type check.
>>
>> This series can be checked out from:
>>
>>    git@github.com:gwshan/qemu.git (branch: kvm/cpu-type)
>>
>> PATCH[1-4] refactors and improves the logic to validate CPU type in
>>             machine_run_board_init()
>> PATCH[5-9] validates the CPU type in machine_run_board_init() for the
>>             individual boards
>>
>> v6: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00768.html
>> v7: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01045.html
>> v8: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01168.html
>>
> 
> Ping to see if there is a chance to queue it up before the Chrismas? :)

Series queued. "Before" Christmas will depend on the final release tag.

Thanks for the various iterations,

Phil.


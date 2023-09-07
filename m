Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CAEEC875E
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 23:36:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeOY1-0003cq-00; Thu, 07 Sep 2023 19:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOXw-0003bK-MS
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 19:36:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOXt-0007NW-Km
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 19:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694129780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zu2K1dMy8vm8K0rvVM1RHy2lhBh8qmZ9yitufa0eHac=;
 b=id2PRwk2DFNydtLZbAgSYQb4xn8KtgS/FdxxbqCZundki+RzBFbYoA7TmwuTbGLXqdCtXu
 9IQuC4I4siDIFQoGYk914tTRam8Dzzd3YFow7eYGbHcKaZJvz3uIaLbsaURl0gu5yE2+Di
 ehA033scQl7qerMmhOmXBnaWfyn4hi0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-lDqb979uNPyO75tFToNEzw-1; Thu, 07 Sep 2023 19:36:16 -0400
X-MC-Unique: lDqb979uNPyO75tFToNEzw-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-26f9107479bso1908951a91.1
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 16:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694129775; x=1694734575;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zu2K1dMy8vm8K0rvVM1RHy2lhBh8qmZ9yitufa0eHac=;
 b=WjuOUdEEYehu989xvbg8f9JI0ODzCX38svNefZWxdsJj2pzXWqe9MUYMJxR3x+JUxE
 GGifzHeR+yrNgilQm5dctFaerAJdAXqXE9rWevW6mKCEhNBuTEySQbV70y3KOIWebMYg
 L2+i6ovulzP1dEWbgksU+5cEBq5/oAHj+zxXMgliifPSuAqOPVPdI2cPrj0rUaaGWKba
 U9C1W0yC38C8AsLCf/g0Hq71BS/cUx/Nu1n6BZqePEusc0++pwWxwUkB8D7g7JFcJ0mH
 huJTP0/iTZCcyIYpvu2j+SMIKWhpXbVFC+ChFQ7DyfugPVd2CEn+aVetASi2ReWV5HZl
 vxXg==
X-Gm-Message-State: AOJu0YwLBqLkPq2m7d7c/RBZLsrIUBFtWNaWd+hH0KO0PX3LFgOEvJDz
 Jyy/MMYDiy3d2mj2WRcr9W2ssaqQjxOQoqXUltTpbhJIE0S41k0rkiOV8kwDvCM6wGJetyJgoe+
 NS45uc6c75+jGR4Y=
X-Received: by 2002:a17:90a:660d:b0:269:13f0:4b9a with SMTP id
 l13-20020a17090a660d00b0026913f04b9amr1080075pjj.7.1694129775653; 
 Thu, 07 Sep 2023 16:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1p9RUVJQfxeRch1CBtV4WfYlMDTCp1B+3LTylA16aABKxq3TMkdwR9L/z6DMWql7iF3ZWIQ==
X-Received: by 2002:a17:90a:660d:b0:269:13f0:4b9a with SMTP id
 l13-20020a17090a660d00b0026913f04b9amr1080022pjj.7.1694129775359; 
 Thu, 07 Sep 2023 16:36:15 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 mj11-20020a17090b368b00b0026fb228fafasm1929825pjb.18.2023.09.07.16.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 16:36:14 -0700 (PDT)
Message-ID: <6ae8a82d-44ee-f002-ea44-d3f0f5808c1c@redhat.com>
Date: Fri, 8 Sep 2023 09:35:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 01/32] cpu: Add helper cpu_model_from_type()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 mrolnik@gmail.com, edgar.iglesias@gmail.com, bcain@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 pbonzini@redhat.com, imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-2-gshan@redhat.com>
 <923ad3bf-4663-248a-aaf2-cd596d5ec0b2@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <923ad3bf-4663-248a-aaf2-cd596d5ec0b2@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/7/23 18:54, Philippe Mathieu-Daudé wrote:
> On 7/9/23 02:35, Gavin Shan wrote:
>> Add helper cpu_model_from_type() to extract the CPU model name from
>> the CPU type name in two circumstances: (1) The CPU type name is the
>> combination of the CPU model name and suffix. (2) The CPU type name
>> is same to the CPU model name.
>>
>> The helper will be used in the subsequent patches to conver the
> 
> "patches to conver" -> "commits to convert"
> 

Thanks, it will be fixed in next respin.

>> CPU type name to the CPU model name.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   cpu.c                 | 16 ++++++++++++++++
>>   include/hw/core/cpu.h | 12 ++++++++++++
>>   2 files changed, 28 insertions(+)
> 

Thanks,
Gavin



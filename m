Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D79C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 10:55:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rDMtK-0008W5-3X; Wed, 13 Dec 2023 05:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rDMtI-0008Vf-1m
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 05:55:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rDMtG-0006cy-EA
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 05:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702464897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HU8SWwamGacwL6Ipt63TqUDV0WFAIHBdSLcEitBLHvM=;
 b=Mt+TTIZOZeMoefBe3aq83C/w1AKAp9lgaf6D0z3YLXxREF234+fP+w3oxJwx/HmJslwNlZ
 RWjb+VIRssAKQpg2LivUmKRX6tUuFvc0809+ZLXtjO7+uAkW+B8AJY6hF6uaGhodyY/4Uu
 G6a3AGHwq5A+pNQ18RdhuJU8DL+UioE=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-BpPG5uXJPmC7aFf5cqLt_Q-1; Wed, 13 Dec 2023 05:54:55 -0500
X-MC-Unique: BpPG5uXJPmC7aFf5cqLt_Q-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-6ceb9596211so7563139b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 13 Dec 2023 02:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702464895; x=1703069695;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HU8SWwamGacwL6Ipt63TqUDV0WFAIHBdSLcEitBLHvM=;
 b=e6OK1x0O0w25w1Us50bT5+D7TQ1ssOC2iSw7cjjJFiJvCmZ+gdz1IHxZEw05unYHM7
 xlHU5CtcJzLz0HWf7R/U0HJ9ghm8pfxxLZ0x8RTb6AvTGIrouHKNjhUATttsG7dQbpSK
 LBPVy2e0wZU48CbfKX6AO0qxGjVg+l/n/oR7CciSQKshBKGkkujwHMT5XMuBbwdhdbRY
 bE+FQklbjM62rQfWIVrKXswiF/EWrTCPS276/mcBRGwfS8fOuDFpwDgx7KmB/0MHz0kq
 LjgBVvf1Bdk1b+YXbdQLI9Rk9RgxIQm68Vy3UKF7c3o9hquDuGdZqj/ajPud65cmG8id
 ZJhA==
X-Gm-Message-State: AOJu0YwnXohLK9OTUXfPKjr9UYtA7CEplapid65c+hFIgg0Wi/DBaGVO
 UT69IxWGONdpxUTR6s0PzIb3sYPhHtnxpZ4TmOrAVFDCTCFwvcHHb81cPIv8mCcR1noIl6myEWF
 oCrmADgk4Saxd7Mo=
X-Received: by 2002:a05:6a20:1388:b0:187:5db4:1688 with SMTP id
 hn8-20020a056a20138800b001875db41688mr7896293pzc.18.1702464894977; 
 Wed, 13 Dec 2023 02:54:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHg6umOAb9b/pM1wLYg5nnAL0BtmZIjDnLqgbtZOvIGm+xy3vWclv/21zWnt6UwJDrMKFFl+Q==
X-Received: by 2002:a05:6a20:1388:b0:187:5db4:1688 with SMTP id
 hn8-20020a056a20138800b001875db41688mr7896283pzc.18.1702464894684; 
 Wed, 13 Dec 2023 02:54:54 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a17090a9c0500b0028ad273525dsm1977655pjp.25.2023.12.13.02.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 02:54:54 -0800 (PST)
Message-ID: <23213dcb-16ca-4be4-9ff2-32e4fc491495@redhat.com>
Date: Wed, 13 Dec 2023 20:54:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/9] Unified CPU type check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ff0237a8-9e1c-46bf-ae69-99c3f33112f6@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


On 12/13/23 20:08, Philippe Mathieu-Daudé wrote:
> On 12/12/23 05:55, Gavin Shan wrote:
>> On 12/4/23 10:47, Gavin Shan wrote:
>>> This series bases on Phil's repository because the prepatory commits
>>> have been queued to the branch.
>>>
>>>    https://gitlab.com/philmd/qemu.git (branch: cpus-next)
>>>
>>> There are two places where the user specified CPU type is checked to see
>>> if it's supported or allowed by the board: machine_run_board_init() and
>>> mc->init(). We don't have to maintain two duplicate sets of logic. This
>>> series intends to move the check to machine_run_board_init() so that we
>>> have unified CPU type check.
>>>
>>> This series can be checked out from:
>>>
>>>    git@github.com:gwshan/qemu.git (branch: kvm/cpu-type)
>>>
>>> PATCH[1-4] refactors and improves the logic to validate CPU type in
>>>             machine_run_board_init()
>>> PATCH[5-9] validates the CPU type in machine_run_board_init() for the
>>>             individual boards
>>>
>>> v6: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00768.html
>>> v7: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01045.html
>>> v8: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01168.html
>>>
>>
>> Ping to see if there is a chance to queue it up before the Chrismas? :)
> 
> Series queued. "Before" Christmas will depend on the final release tag.
> 
> Thanks for the various iterations,
> 

Phil, thank you for you continuous reviews and valuable comments.

Yes, the final merge to master branch depends on the release plan.
'queue' meant to merge the series to your 'cpus-next' branch ;-)

Thanks,
Gavin



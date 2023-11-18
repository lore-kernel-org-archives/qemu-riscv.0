Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5768C2BB3F
	for <qemu-riscv@archiver.kernel.org>; Sat, 18 Nov 2023 06:41:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r4F1I-0000Yk-GJ; Sat, 18 Nov 2023 01:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4F1A-0000XQ-KV
 for qemu-riscv@nongnu.org; Sat, 18 Nov 2023 01:41:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4F16-00065C-Sp
 for qemu-riscv@nongnu.org; Sat, 18 Nov 2023 01:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700289676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UnpuoslZpH27s0YVxL2DOtr7qbZMS0LnrfN9VuXqNhs=;
 b=ch62wGsIrGEsH/co9+zVX+94Z//Fn8ZJPy+xVSZdVKdLUM+RXVjiD/xAKjmLAqbQHk1PdL
 6navSfMjjsJMLFwS7bk9wvwwECAeJCW8PS/VYlbWK5fcrp9Ibl2z7kVATyQqJYmvhowzAx
 0a1TWjUzkT0CPSxDIQ7XcUt0jetxhfo=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-SRmFjQd5NcCJW48iCwZQYg-1; Sat, 18 Nov 2023 01:41:14 -0500
X-MC-Unique: SRmFjQd5NcCJW48iCwZQYg-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6bfd5856509so3799401b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 17 Nov 2023 22:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700289673; x=1700894473;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UnpuoslZpH27s0YVxL2DOtr7qbZMS0LnrfN9VuXqNhs=;
 b=Iiz5iZfULest/SaiWeKJra+Hx3IMnTkrMbZ2ROsZObUYpEGXKHq1r1VH5cja+sM5E4
 LigBj7LLLILQAqp6/aPigtWjWU6xHN8bLArDbqWtXybmgQe2AvWyUkUI19NUnIVdjYCC
 pcWtxR6xk/seyH3EgRWIZcqnSHW7xAJHVEAuqISoDzx4LwCkwU/J6TLIDIoL9j8GnBI5
 k+hNVyrvSV1bwGDPduN8P0vvSaIz6pNYeNFPaJa0d5KqukcsPNPLWaaMPzlOGuhrcCQW
 4Y4TcAqtkemw6Lz7xVIEgIvlYL617W/guUCcu+X0ThBA6se0s6keouUVQgY3JCfuCDPW
 8c3g==
X-Gm-Message-State: AOJu0YxP7TpnIYNyaJ6oAhwEKiMZY7BRxlS49QU0hn+KWxMdE9NqGRif
 IEarplj5B9hSxbxzb6YErDD1W0vbqUH2WvfzAq3+WFFD1rb5ejcGz1rvXn1nIKHFa3JQRFtfaUp
 czyFq3cr3+xgqUp8=
X-Received: by 2002:a05:6a00:1886:b0:6b6:5ed4:dd42 with SMTP id
 x6-20020a056a00188600b006b65ed4dd42mr2251997pfh.31.1700289673281; 
 Fri, 17 Nov 2023 22:41:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb8zeud0zSNkXCyNWKb08LrvZ4xkXxIY2zoqDcsZlUpRxfVBXVfvp3HnySFCFjNkWXQI3MxQ==
X-Received: by 2002:a05:6a00:1886:b0:6b6:5ed4:dd42 with SMTP id
 x6-20020a056a00188600b006b65ed4dd42mr2251911pfh.31.1700289671951; 
 Fri, 17 Nov 2023 22:41:11 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 s19-20020aa78293000000b006b22218cb92sm2365475pfm.43.2023.11.17.22.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 22:41:11 -0800 (PST)
Message-ID: <e638c40b-fbf9-4495-93aa-1443877b553f@redhat.com>
Date: Sat, 18 Nov 2023 16:40:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
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
 <ebaa5c70-e410-465a-a94e-1a254506a81e@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ebaa5c70-e410-465a-a94e-1a254506a81e@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


On 11/17/23 17:34, Philippe Mathieu-Daudé wrote:
> On 17/11/23 00:26, Gavin Shan wrote:
>> On 11/17/23 02:20, Philippe Mathieu-Daudé wrote:
>>> On 16/11/23 14:35, Philippe Mathieu-Daudé wrote:
>>>>
>>>> I'm queuing patches 1-3 & 5-23 to my cpus-next tree. No need to
>>>> repost them, please base them on my tree. I'll follow up with the
>>>> branch link when I finish my testing and push it.
>>>
>>> Here are these patches queued:
>>>
>>>    https://github.com/philmd/qemu.git branches/cpus-next
> 
> Oops, no clue why I wrote github instead of gitlab, sorry =)
> 

No worries, Phil.

>>> I might queue more patches before the 9.0 merge window opens.
>>>
>>
>> Thanks for queuing these patches, but I don't see 'cpus-next' branch
>> in the repository. Please let me know if I checked out the code properly.
>>
>> $ git clone https://github.com/philmd/qemu.git philmd
>> $ cd philmd
>> $ git branch
>> * staging
>> $ git branch -a | grep cpus-next
>> $ echo $?
>> 1
> 
> No need to clone, you can use in your current cloned repository:
> 
>    $ git fetch https://gitlab.com/philmd/qemu.git cpus-next:cpus-next
> 

Thanks. It worked for me.

Thanks,
Gavin



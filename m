Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86C1C54E76
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 23:27:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3llU-0005l8-SL; Thu, 16 Nov 2023 18:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3llR-0005kE-Np
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 18:27:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3llO-00039A-Vi
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 18:27:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700177229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bsVUf95nsvz8HsXCQuGgq3Eei7P+SUSqTDa5H9h4TAs=;
 b=GncoRWWWLsKVCCvVH2ZjTj6G7kf2P/ROh2kX7psMEccwp0nM/CfLy1/+8dG5z1Wdx9e+Ma
 aQEhKAEZw+jGiAYr4zrx7Ir4pb5qSh7cZveMzotMnhM+Plns5SjOZtO6pdcZ8FaJderb2l
 yGWPwnP4Bix5HdeL1NCuxhLZFwZ6i6A=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-h4F1ie2oPCume-vbQMHD1Q-1; Thu, 16 Nov 2023 18:27:08 -0500
X-MC-Unique: h4F1ie2oPCume-vbQMHD1Q-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-5c19a2f606dso1556768a12.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 15:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700177227; x=1700782027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bsVUf95nsvz8HsXCQuGgq3Eei7P+SUSqTDa5H9h4TAs=;
 b=e4rMhNETASXKba3SOW/WlFSXb6SRYlaXu8LXaoHQ9KbG4mwt4Gi0WQI5cS6LX4ETPY
 5L3gwCBY43Dxo/cC0DAQ7ZGhTyloZ4TEaOZGbw9+93g7EBuRu3zcN/nFHyINIiDsKaIf
 IKwWxiYgiGZhOgxZ2xvxd/CmU2eDKqVGP15b/njOQawR4wyj5nQ2xFrmgmIdgNiSTdYS
 XNNFa5pP7LaW9t5MD7pp0C/F8NM1S2eiO94ViGYvUutWUMFes+DNdf7lnxJnYfgHyPkQ
 wAOwC4y6w9MywLc/Sir3zfiDE4u+7JR1+KH2zQfjGjLRJpOg+y3KXCbcfAVQe9xkMdbe
 HkuA==
X-Gm-Message-State: AOJu0YxtBUSWZW/NOCMWePHBbN9NBZI/cJ/AUUAoGKKz94TWqxKQxeVd
 TN7tv2e+rywy1KGts8zl9lbfpjPBPcD92WWkfNClo8ClhyvAO1cBT+m9hL194ySjE54tiNrEwDs
 gZYg6qacQi5Krdoc=
X-Received: by 2002:a17:902:ecc8:b0:1cc:3875:e654 with SMTP id
 a8-20020a170902ecc800b001cc3875e654mr12056114plh.26.1700177227034; 
 Thu, 16 Nov 2023 15:27:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3vxHbcjnWTgT6Z/kSUD7c/8W3id7f/D5dsO7xEi1omqLkh+Epr9AU49QKPClN+smHHORp+w==
X-Received: by 2002:a17:902:ecc8:b0:1cc:3875:e654 with SMTP id
 a8-20020a170902ecc800b001cc3875e654mr12056063plh.26.1700177226745; 
 Thu, 16 Nov 2023 15:27:06 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170903230800b001cc0e3a29a8sm202183plh.89.2023.11.16.15.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 15:27:06 -0800 (PST)
Message-ID: <7252553e-9ab3-4c8e-a867-55c57d0178ba@redhat.com>
Date: Fri, 17 Nov 2023 09:26:50 +1000
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <78526851-6d44-4c18-97b8-57462fb42ab7@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.117,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Phil,

On 11/17/23 02:20, Philippe Mathieu-Daudé wrote:
> On 16/11/23 14:35, Philippe Mathieu-Daudé wrote:
>>
>> I'm queuing patches 1-3 & 5-23 to my cpus-next tree. No need to
>> repost them, please base them on my tree. I'll follow up with the
>> branch link when I finish my testing and push it.
> 
> Here are these patches queued:
> 
>    https://github.com/philmd/qemu.git branches/cpus-next
> 
> I might queue more patches before the 9.0 merge window opens.
> 

Thanks for queuing these patches, but I don't see 'cpus-next' branch
in the repository. Please let me know if I checked out the code properly.

$ git clone https://github.com/philmd/qemu.git philmd
$ cd philmd
$ git branch
* staging
$ git branch -a | grep cpus-next
$ echo $?
1

Thanks,
Gavin



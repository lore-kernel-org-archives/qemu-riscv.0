Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0555BC001E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:05:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWI56-0006N2-1a; Wed, 16 Aug 2023 11:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWI51-00066C-Jq
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 11:05:03 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWI4v-0004Ot-FA
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 11:05:01 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bdc8081147so28538415ad.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692198295; x=1692803095;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=spCUFVdjDT/l80JdlzLeqn0kF7ADg+0QZ3H7hNfAWdc=;
 b=nYSVqIQIMq0Bjo+CIrgdDde3EJPJuj/MJ9uTwbDZ6RyfEyxCU7M4X7UBFiGs9qcrMC
 VeoxXj9CK5JBYNjr8yerHF/vFCd7Ojr5q3tGrYvYLPmJmtxfk9krsjYHD7JYjJyADOid
 HxzTpMBO7TucX0pjBONox8wJqz2c7WGZotTTOqiup/9oIna6tF0JVMFHqj1S8H9TMWaC
 d+yBzLYyU88We5hYKlsegfpWmKQbi1wnv83N1wjNSGA4sxHfGS3PnnWEYxSriceQgWQu
 ddHFa9+TucrohYT71IsRI0v3nQyHm8SMePXDc+4muaZvX9FxaZjVKfCbozWAffO0z8+T
 VWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692198295; x=1692803095;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=spCUFVdjDT/l80JdlzLeqn0kF7ADg+0QZ3H7hNfAWdc=;
 b=SQQOr09Jq7VK+MJZuT446RbFYFuvV2P1CKQ6LJXdozrT8RJCE7YxhdXhAkSoK/hVd4
 Lbu256Y9EHhvg+qwhDmRyZcSircqKxmEcbBTWTn62jkiqV39ykzdijhiIlStnGSf09l7
 T6yUqg76RW3kl2vadXmIWdbgTwC6Djtu9nBFaYoFww0FFmYvE3Z754eTXqOY5JpqR7RK
 GZ46e13d6mQQSFrNwvqe5iAMV8tOe4lf+k3lQ6hLvMfoUJ2gjdnAf298qD9BLBJVVrlg
 qn3sZieLXtgZ/iLP+AeLlCK2lWvcFNpeMMrmqBFzgDVmYqssTNWCzt4p5pYvyduVNp85
 /COQ==
X-Gm-Message-State: AOJu0Yz3iHK67s2wFNjN+wU1ZU4Iwxug7FiFpA8m+gHjx+H22PczfVgz
 OH3IQEeXbKfRVg7ZOLs3TXts3g==
X-Google-Smtp-Source: AGHT+IGqXgAIw6g805RTzCsYUKME2etnxfetoohdotLB6/EfbqsYWmEFcmJOdy2UTTkeqcKF6VxSbg==
X-Received: by 2002:a17:90a:648e:b0:268:3ca4:6152 with SMTP id
 h14-20020a17090a648e00b002683ca46152mr3023992pjj.15.1692198295212; 
 Wed, 16 Aug 2023 08:04:55 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a17090a8c9600b0026d034f6badsm691307pjo.38.2023.08.16.08.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 08:04:54 -0700 (PDT)
Message-ID: <1e77c6b2-646d-42de-9ed5-df60a3c7d3b8@daynix.com>
Date: Thu, 17 Aug 2023 00:04:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 24/24] contrib/plugins: Add cc plugin
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-25-akihiko.odaki@daynix.com>
 <87pm3pprv8.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87pm3pprv8.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2023/08/15 0:23, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> This demonstrates how to write a plugin in C++.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   docs/devel/tcg-plugins.rst |  8 ++++++++
>>   configure                  | 15 ++++++++++++---
>>   contrib/plugins/Makefile   |  5 +++++
>>   contrib/plugins/cc.cc      | 15 +++++++++++++++
>>   tests/tcg/Makefile.target  |  3 +++
>>   5 files changed, 43 insertions(+), 3 deletions(-)
>>   create mode 100644 contrib/plugins/cc.cc
>>
>> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
>> index c9f8b27590..0a11f8036c 100644
>> --- a/docs/devel/tcg-plugins.rst
>> +++ b/docs/devel/tcg-plugins.rst
>> @@ -584,6 +584,14 @@ The plugin has a number of arguments, all of them are optional:
>>     configuration arguments implies ``l2=on``.
>>     (default: N = 2097152 (2MB), B = 64, A = 16)
>>   
>> +- contrib/plugins/cc.cc
>> +
>> +cc plugin demonstrates how to write a plugin in C++. It simply outputs
>> +"hello, world" to the plugin log::
>> +
>> +  $ qemu-system-arm $(QEMU_ARGS) \
>> +    -plugin ./contrib/plugins/libcc.so -d plugin
>> +
> 
> I'm going to assume this is useful because you have some out of tree C++
> plugins? I'd drop the last two patches for now until there is a slightly
> more compelling use case.

The out-of-tree plugin is mentioned in the cover letter and available at:
https://github.com/shioya-lab/sniper/tree/akihikodaki/bb/frontend/qemu-frontend

This plugin emits a trace of execution for use in Sniper simulator. I 
believe it's useful for other people doing microarchitecture research 
since processor simulation infrastructure is often written in C++.

> 
> The C++ compiler detection moved into meson in b485458e00 (configure,
> meson: move C++ compiler detection to meson.build) so I don't think
> there is currently a compelling reason to bring this back into
> configure.
> 

It is necessary because TCG tests use Makefile and config-host.mak is 
emitted by configure. We can remove C++ detection from configure when 
TCG tests or the config-host.mak generation migrate to Meson.


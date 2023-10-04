Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4908E7B604
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:37:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qo17z-0001gj-1r; Wed, 04 Oct 2023 08:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qo17x-0001fR-3N
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 08:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qo17v-00011o-J8
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 08:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696423038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QAi0IIFmd1uLGA69a3sYX8NgxiuutGABC52gw0w1l+k=;
 b=bafEZAcfb+GQfELsVOqZd3VHtUd6K6aJ2QK2JeWWprl4my5UEzJN8HmVn3reBIoEtBGk1g
 HOD55v2xUzIcPwgsMinXGTxJrutQd9/In44Tv/oFqytnGtf24wjW1qmnh9oABup+cUAjox
 pH0zY9zZnXdp/pDIu3C545lrW0LhBZ4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-4pYor9u9NNeAI2aMuUrgVA-1; Wed, 04 Oct 2023 08:37:17 -0400
X-MC-Unique: 4pYor9u9NNeAI2aMuUrgVA-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7740c35073bso253379985a.3
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 05:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696423037; x=1697027837;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QAi0IIFmd1uLGA69a3sYX8NgxiuutGABC52gw0w1l+k=;
 b=p2H8/d9UfmsKBuwJa3oxR2VAALaKhhKnL5gVvcwgE/vRMzEIYRscblrVJivsLPxihT
 ZmUFHBBY61CUakqcCJdhJ4+LJFnV1ixr/D+0PF3My4jVkeFiXYC0IrqOJ+dhY9FpapeK
 FA520OLAOar+UyCXWGUXZeLTfkBgKgbOkRs0LSSEyezVmT9JaLXjsjrOL4R1Oy2uSSb/
 aw7+wvdhoBrsGRn7/nbats2h7uW13BnbLuItspjsyJJABJLtef05p8OympWPV2hTb1Wz
 SkLXgWmyBV/qezwnAe5gR1I1MZ++Qb4B1AmXpNanuDvMjEkMS0COKTUk4+DtaaBe/iUl
 inJA==
X-Gm-Message-State: AOJu0YwDEqfJhXjkkgUUqWDg9kIpAc5K1whaE4OwsxzrkzNy7FrXU+V+
 JIe0posbMS49C81y1/rbxLPXl4ZEXr74XwkSZprtpACmLPrIYkHMZrpha9kpPMlfhzVHlH1I72U
 9nzI7X5iy2HcEjfs=
X-Received: by 2002:a05:622a:30c:b0:417:f9e1:664f with SMTP id
 q12-20020a05622a030c00b00417f9e1664fmr2064829qtw.36.1696423037206; 
 Wed, 04 Oct 2023 05:37:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEIEGPh3VjHBS2G5OxAuSF9eExLVpg8FiVDNgJE9L4xs9bmKUgF0JBLq/AWSHfMT+tUsI1ig==
X-Received: by 2002:a05:622a:30c:b0:417:f9e1:664f with SMTP id
 q12-20020a05622a030c00b00417f9e1664fmr2064814qtw.36.1696423036930; 
 Wed, 04 Oct 2023 05:37:16 -0700 (PDT)
Received: from [10.200.209.159] (nat-pool-str-u.redhat.com. [149.14.88.107])
 by smtp.gmail.com with ESMTPSA id
 b6-20020ac87546000000b00419792c1be7sm1179462qtr.30.2023.10.04.05.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 05:37:16 -0700 (PDT)
Message-ID: <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
Date: Wed, 4 Oct 2023 14:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231004090629.37473-1-philmd@linaro.org>
 <ZR1bjpEi5HdFp2xj@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZR1bjpEi5HdFp2xj@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.528, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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

On 04/10/2023 14.33, Daniel P. Berrangé wrote:
> On Wed, Oct 04, 2023 at 11:06:15AM +0200, Philippe Mathieu-Daudé wrote:
>> This series finishes the cleanup which remove the confusion
>> of using 'softmmu' when we really mean 'system emulation',
>> as opposition to 'user emulation'.
> 
> Am I mis-understanding what you mean by 'finishes' here, as
> I see many references to softmmu remaining
> 
>    $ git grep softmmu | wc -l
>    270
> 
> In particular under configs/
> 
> I was also hoping it meant that we'd be changing configure
> to allow
> 
>      configure --target-list=x86_64-system
> 
> though the lazy side of me would like
> 
>      configure --target-list=x86_64-vm
> 
> for less typing

Maybe we should also bikeshed about the naming first... "system" is a quite 
overloaded word in this context already, and "vm" sounds rather like 
hardware-accelerated stuff ... what about using something like "sysemu"? Or 
"fullsys" for "full system emulation" (in contrast to "user space"-only 
emulation)?

  Thomas



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3F2EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 12:21:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJCLK-0006hA-QK; Tue, 11 Jul 2023 08:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJCL7-0006Ma-Km
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:19:33 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJCL5-0006EH-0F
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:19:32 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6b5d5e6b086so3442750a34.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 05:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689077969; x=1691669969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ivKlnEegzK41xB+c4zD3qRuC2IcF3WPeMJWOjExcp4=;
 b=BYh2k2NAu2w1ayQ0phhLl7f5ZmY7qvGZadLPBIwTJNmv00Nm6UupRkvhaHRUWENNis
 DygzvOAUSsy1lqIjLfbIB3HmJdIrGcjukZsHAZ+LrIWxJqFefeG9dvUcpCXSY+VRvWg4
 WuM9ZLRWyP0TrqAuqR69/QAw/k8/ScHsLEAr9RIr1gm6JvEf6UvquQWoJ0NNLgFkzCwm
 2MRNvEugZTjd8F+ene8ZCcaFXSEpe9+iA6R+HCR4FLJcE7kQ67U9GhT4Y4Jky7PHK8iq
 wQ3n8qYkFPKhZO0/jTKupKMZY/IxdMUPxrVF5haAiHbleIPWHTl27+OpDcuUjMcT+8uQ
 8w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689077969; x=1691669969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ivKlnEegzK41xB+c4zD3qRuC2IcF3WPeMJWOjExcp4=;
 b=g/w1NtlvMT/rjmZefj64kWQ0UznJeNzU6pz336jX0QVHjIOR2PLVUpupOkrhRgg2JN
 EyOTj3l9CHx7U+RQtJk5XwkQT5ADwssnUIQ7tr05RtuF/zQV23YZ5fJozrpnyLtNRaNp
 PkDLMdC3i3+T6bPU/HAGknZCxg9gunF/tT04g2a1G+rp7RacRi2+Wp0lGxPkmzVOZftx
 AILgrerrQeuVA8J+tqax3BR2oq08u/JGbc3Dv0ncYV9z3ttkh9/xWkLGSoJVp6uDRJd1
 R8maTcrErp5ccI8IxFjXOwoI1dXoP68OAoQyhonv2gwolEgOWTm7Q6bL94pJweuNqeEC
 bZXA==
X-Gm-Message-State: ABy/qLbGk1aDvfoXyiqkIEALKo3lvL24IqmSicjVEwL53bM9zrsuNWE0
 6T5dI8GqZ0okSmYxbSXIZJRjAQ==
X-Google-Smtp-Source: APBJJlGqDg1plgmIk7pL3HMeZNAQp6CDjhmuyvfyTYOFS6ehX4I9MybyFxwznVQP7SSqwyLl1VmI3Q==
X-Received: by 2002:a05:6830:c1:b0:6b8:7a07:b312 with SMTP id
 x1-20020a05683000c100b006b87a07b312mr8735300oto.10.1689077969436; 
 Tue, 11 Jul 2023 05:19:29 -0700 (PDT)
Received: from ?IPV6:2804:18:101b:e2d4:6e1c:1525:a874:9563?
 ([2804:18:101b:e2d4:6e1c:1525:a874:9563])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a9d63da000000b006b46b913767sm876384otl.24.2023.07.11.05.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 05:19:29 -0700 (PDT)
Message-ID: <74b03293-5227-09d3-084c-83359c9f7ea5@ventanamicro.com>
Date: Tue, 11 Jul 2023 09:19:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-riscv <qemu-riscv@nongnu.org>, Andrea Bolognani <abologna@redhat.com>
References: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
 <20230711-c2dd60b2d7d86712dc8a1c59@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230711-c2dd60b2d7d86712dc8a1c59@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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



On 7/11/23 05:30, Andrew Jones wrote:
> On Mon, Jul 10, 2023 at 02:53:12PM -0300, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> We don't have a 'max' cpu type in riscv32 and riscv64. This is a special,
>> fictional CPU type that has all possible extensions enabled. It can be
>> either an alias for a real CPU or a new CPU type. It's used by tooling
>> such as libvirt for capabilities probing.
>>
>> Well, in our case it can't be an alias because we don't have any CPU type
>> that enables all extensions. Which brings me to my first question:
>> what's the criteria for marking a certain extension default true/false
>> in rv32/rv64/rv128?
>>
>> E.g. this is the riscv,isa DT for rv64:
>>
>> rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu
>>
>> It has a lot of extensions but it's missing some common ones like svinval
>> and smstateen.
>>
>> We can add/remove some extensions from these generic CPUs, document it
>> and be done with it. I want to propose a different design though:
>>
>> 1 - introduce the 'max' CPU. I guess we'll need some prep work in how
>> the extensions are being declared/stored in the code. I'll work on
>> it;
>>
>> 2 - introduce rva23U64/rva23S64. I would like to add a new 'profile' option
>> for generic CPUs, with '-cpu rv64,profile=rva23U64' enabling a whole set
>> of extensions. We would also support enabling optional profile extensions.
>> Yes, we don't have all the profile extensions available yet (neither does
>> the kernel AFAIK) but nothing is stopping us from adding the base
>> framework;
>>
>> 3 - reduce the generic CPUs up to the minimum required to boot Linux.
>> Yes, a rather arbitrary criteria, but Linux is the most common OS used
>> by RISC-V QEMU currently so we'll go with what most people are using.
>> This would reduce rv64 to "rv64ima".
>>
>> The end result is that we would have a max extensions CPU, a barebones
>> generic CPU that can be fully customizable from the ground up, and
>> a profile option to allow users to boost the generic CPUs with a
>> set of extensions. We will avoid having to deal with generic CPUs having
>> an (apparently) arbitrary set of extensions.
>>
>> I don't think we'll have too much opposition on adding (1) so I'll get
>> on it. I really would like to hear about (2) and (3). (3) will break
>> users that are using rv64 while counting with that whole set of extensions
>> that are being enabled by default, but this is why we're going to add
>> (2) first.
> 
> Everything sounds good to me, once we've agreed on a proper "minimal
> Linux supporting" base to map rv64 to. One thing I would change, though,
> is rather than have an enum property 'profile', I'd create booleans
> rva22S64, rva23S64, ... Keeping cpu properties boolean simplifies
> introspection. And, when we have mutually exclusive profiles, QEMU can
> error out at cpu feature finalize time, but, when they're not mutually
> exclusive, then why not allow more than one to be selected.

So instead of

'-cpu rv64,profile=rva23s64'

we would have

'-cpu rv64,rva23s64=true'

With the possibility of stacking profiles one after the other, assuming they're
compatible. Looks good to me.


Daniel

> 
> Thanks,
> drew


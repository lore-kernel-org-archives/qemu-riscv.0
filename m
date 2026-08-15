Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F613C5DF67
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 02:58:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wv4am-0006Zr-Gh; Fri, 14 Aug 2026 22:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1wv4ak-0006YY-Tk
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 22:57:50 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1wv4aj-0006Cs-4o
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 22:57:50 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2cc61541f8cso34409825ad.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 19:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786762667; x=1787367467; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7XdL0uSdHIdAYvz4JdabL6WTB9fzVrkj0z8ukE5LUWQ=;
 b=n2ykzsgNL6ZZh8x33YThMReHQj3WnzsiNwbi/vToqPTPLuIaS2GD+fsgV5s2CVj/fD
 ynlvFVnw4lDmJIvVzVLUsszATXnoqfERaaLZ3yQwSjvET9QPUXcLvxccP94vEh65er9M
 heCpfp184R/bhqWDje0yG1l5xlJr5cBRv+czbYTFfdJEMSKoKMHzudyJlNTxMiJvnO1I
 lRMyD7EdCI41tmYn+DLlsFw41sgqIPz0hWicZ5AweY34ZucMY1UmZ5vz/R9URF0lxj4g
 2PbiWolViBLwatFVsyWhptOBPu76eYo1d6biiciA0AXTaAoJoASfxy23W89xZgVrehMl
 R6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786762667; x=1787367467;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7XdL0uSdHIdAYvz4JdabL6WTB9fzVrkj0z8ukE5LUWQ=;
 b=aOBEojvaMAhUbtpCqy2Zt7kbtpJxiFz7rFVL7qhZAqPhY9UvGPUcZAo3dDlsbKg4lu
 RTWVaJt3bOYeD68qFQy1+k2bZ7UF2qNYyzLenb5W7Qdp5tAESnRClSwYsiWEU84iHGTM
 jrsHSzU58pGq2ZheUBZ2/X+SvdKuBtNBaDee4pfCkzr4rm3ah4j5buIWaTne1C3R4I2u
 493BsdOeMqTO+/WFCnUlfEne4XCvwiPcBGE/Gc4Xbw/SOOL6STELLyS0wbhx/bRu+eps
 /6D1hrNP1y5uQAXpmNFmYNT9nJyQnGNlJGefnSQKbluKkUrRRvLOQsQQPtWwK3RYjq2R
 E/bA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrXaezcU2vV5d2JEcOM/QkEvdWAh3h5FOGiU+TAVeh3KkPAYBaW/WUHPzoF7mDDqGaqaV4oyg/6PKJz@nongnu.org
X-Gm-Message-State: AOJu0Yxxm07qCFyPXDoYWpVVPzq8zzOOrdTT8qE7h5pBVXne5+Wy+yU5
 90kchl/9A+oTJ4tZ1ER62o8QKfOkS6SH4WoRIaNhGeCcdpjtKYlsY8Ba
X-Gm-Gg: AR+sD13Rq9KoizdHdU/Tl+WJAqdUgG7O1/xSd86q7y5qcQNrtZzJJy2TVVWsUlrCmVd
 dmduUowXORkKvN3EG5P6r95F+Y/KTZ6CmIKSCaOyL9n91c7unSDm8JTc1/1jJisqSpWxLgbnqEL
 RLtGq9BNeIUaMRUgZly8lyh0B8+/hqlOZBDHyoBClZ/abNJSTgDEP9NaBWNA9FZabx12gyx3bGn
 l2K0Y0XWHsW1lnKdNBFoxf4oLDUT+SPXKx3dI9ynBf5qGVoxvAdf9G7QYJ3Q4LK4eSS9RU8Ely8
 9jHRGnjbh4mrVBVlEwGwCln6hb7+lifMFGbYdsgvtmcJtFmF7VGZmDJC+6jpJEl8Myn6xhNtCRH
 MPSHglDOWn4xx9oeSWcpB3FK96b096/0zitVBOcaSlGPd5/a5CPR0OOaXiZkjVJftJGm2qpGAdz
 7i+ayAOZKgGJSvBSCMDU5hEU4Ze5zphELk5Q2oSfU9CUz6FMfVOKyCPaz0LxPIUw==
X-Received: by 2002:a17:90b:48c2:b0:385:3ab:fecb with SMTP id
 98e67ed59e1d1-3933af07e4dmr8577641a91.4.1786762666698; 
 Fri, 14 Aug 2026 19:57:46 -0700 (PDT)
Received: from [192.168.200.57] ([14.19.21.7])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394eb7539d3sm5118057a91.15.2026.08.14.19.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 19:57:46 -0700 (PDT)
Message-ID: <f94c21d2-18bd-40ea-a21b-b4e6a0d03682@gmail.com>
Date: Sat, 15 Aug 2026 10:57:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] riscv: Add K230 DW 8250-compatible UART
To: Alistair <alistair@alistair23.me>, Bin Meng <bmeng.cn@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
References: <20260808-feat-k230-uart-v3-v3-0-d73b31f0034b@gmail.com>
 <CACPK8Xfgj+AUx0h_46f=qG_UEE_o7kTZ0=Buxr7+bdHDODHpgw@mail.gmail.com>
 <CAEUhbmWJzY4qZA6DvTKu3gbP=BEe_Byw6+cpiKEruvVCyL-jiw@mail.gmail.com>
 <068899e5a13d1fc6fab8052736f143dae187dbdc.camel@alistair23.me>
Content-Language: en-US
From: WX Chen <wxchen0913@gmail.com>
In-Reply-To: <068899e5a13d1fc6fab8052736f143dae187dbdc.camel@alistair23.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=wxchen0913@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 8/14/26 23:52, Alistair wrote:
> On Fri, 2026-08-14 at 14:27 +0800, Bin Meng wrote:
>> On Thu, Aug 13, 2026 at 6:21 PM Joel Stanley <joel@jms.id.au> wrote:
>>> This is a model for the same hardware as this patch:
>>>
>>> https://lore.kernel.org/qemu-riscv/20260616190147.1286316-2-visitorckw@gmail.com/
>>>
>>> I'm not fussed which one we end up with in the tree, but it would
>>> be
>>> good to name it generically so other machines can use it.
>>>
>> Agree.
>>
>> Hi Alistair,
>>
>> I suggest we drop the series from your riscv-to-apply.next tree and
>> ask WX Chen to respin another version.
> Done!
>
> Alistair

Hi everyone:

Agreed. The name k230_uart looks like it's specific to K230 SoC. I will 
check my patch again to make sure it's usable for other machines, then 
rename the source file and submit v4 soon. Thanks for the review and 
suggestions!

Regards,

Chen



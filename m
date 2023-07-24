Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA893C0015E
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:13:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNuQt-00055P-Ed; Mon, 24 Jul 2023 08:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qNuQj-00054e-JK
 for qemu-riscv@nongnu.org; Mon, 24 Jul 2023 08:12:51 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qNuQg-0004T6-Dq
 for qemu-riscv@nongnu.org; Mon, 24 Jul 2023 08:12:49 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-55e1ae72dceso2705135eaf.3
 for <qemu-riscv@nongnu.org>; Mon, 24 Jul 2023 05:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690200764; x=1690805564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AvEyxTRTdHkFiRdP6POVuyTxDBpT3CIXiTLocalvLI8=;
 b=P+22xvC+JMxv0R1EexVSo1yLaQKtvyfNxzUVw2dd5jfeNQCvARhHJiLhNneBpXnYyR
 jbluTuR8l8QGxBdm6yyBBQVKns4eMVWSDhWLhsF+ZFYz7a8jsEZe3whVe+YWR9QSpy40
 +FxC7JrbNkrbZUPjBxC+Z0kjzbeEsEfvYn1AMFdkJ2nui1LiuqghwIdeWPUd9PKOZA5V
 8e/SmbCWbj0H+QAu3PI7H4SUYhn2U+db9Ex4DorqUq5NTuj7FUQf6pMosTCXAfN0fkOA
 4DgCKMMLOzPwV/5YyLpwbkhZQ1wOFMqh3y6h6z4Bpn8aQaKmKBYctXvq//o4ATOgdsQL
 qXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690200764; x=1690805564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AvEyxTRTdHkFiRdP6POVuyTxDBpT3CIXiTLocalvLI8=;
 b=MNtPLFTYVfdaPsA5lxlY80q/9uQhznTE960PLX5NrtGS0x7dio2Xw3mOgaJ08NCBIY
 1+wB/iT5m0Fg/sX0JhwvQ4khdeVC/NKv9qOntBXVIIaM19rduaxs6Q+ROXMiYCmRpMPJ
 P8At7/ZnoTk3M/7bD/hUs3u0FRBFxIr7nGt6y0T0D38nZxR+GmDTBfilR1UIZMFk9fci
 Zd6PDaUGaf9hVeayXG0DGt1jbJoq8n2V7L9/Y9gXAZntItoMdvw1y8MJ7crnEAIPj+Ps
 s4pZDGlzUq/xCKIzxbf89D/0KloKGRCm1fAp9+l5GOAFNhogv08OdrBmATB/qbluAvcO
 uIxQ==
X-Gm-Message-State: ABy/qLZB1n5dTSwjADNg09d2TiMpFayft7cl+lrMnqeC0KBs7Ha66wbL
 eGnJRUXiqzmbWfjKh8t6SIlBrw==
X-Google-Smtp-Source: APBJJlEKlAcZJbf5R9UoEUkh5qut2MP5QzHU0bEf9FmQt/BjtjDxyO0ch9UuAie8EViZl3FpIe+BdA==
X-Received: by 2002:a4a:344a:0:b0:566:f8ee:fa67 with SMTP id
 n10-20020a4a344a000000b00566f8eefa67mr7309367oof.0.1690200764729; 
 Mon, 24 Jul 2023 05:12:44 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-36.dial-up.telesp.net.br.
 [201.69.66.36]) by smtp.gmail.com with ESMTPSA id
 h7-20020a4aa9c7000000b005660b585a00sm3888184oon.22.2023.07.24.05.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 05:12:44 -0700 (PDT)
Message-ID: <5b3bbe94-780e-abe0-cc7b-705b067f337b@ventanamicro.com>
Date: Mon, 24 Jul 2023 09:12:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] target/riscv: add missing riscv,isa strings
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230720132424.371132-1-dbarboza@ventanamicro.com>
 <CAKmqyKPzwDrtSH5_V4n=QR+CCPz6L1YqcSL+Y83fP7Fy70h-kQ@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKPzwDrtSH5_V4n=QR+CCPz6L1YqcSL+Y83fP7Fy70h-kQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 7/23/23 23:51, Alistair Francis wrote:
> On Thu, Jul 20, 2023 at 11:25 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> Hi,
>>
>> Found these 2 instances while working in more 8.2 material.
>>
>> I believe both are safe for freeze but I won't lose my sleep if we
>> decide to postpone it.
> 
> I wasn't going to squeeze them into the freeze
> 
>>
>> Daniel Henrique Barboza (2):
>>    target/riscv/cpu.c: add zmmul isa string
>>    target/riscv/cpu.c: add smepmp isa string
> 
> Do you mind rebasing :)
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next


:)


Thanks!


Daniel




> 
> Alistair
> 
>>
>>   target/riscv/cpu.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> --
>> 2.41.0
>>
>>


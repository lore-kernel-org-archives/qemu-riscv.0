Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C60AEB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 09:51:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDise-0003Go-3c; Mon, 26 Jun 2023 05:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDisc-0003En-If
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 05:51:30 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDisa-00067j-Lq
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 05:51:30 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-38e04d1b2b4so2324947b6e.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 02:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687773087; x=1690365087;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bGHZ09p9HNhwi6ydE37wMbqW/noRTOLjULCMWI4arMs=;
 b=XSKj2Hfbz7Yfex4M9EtolXW8CzdE6rmW0sO6Y0H3H69ZU/1wGt2gvE4pNVGlQUQqLQ
 vOf/XT22LJ4aCP02c/Qg/L1I0ek29PUD3oxaYxYm+OoredKGvionPIJpVVl/vVlE2QEv
 zoojlUeYcKl/QbYkatSk/DnhcET8IY57hjV8K8VfUt99guR/gArOcbfTxWf0XOSmasn0
 UpSaJOgpbVLTQs4kixKOPKojtEPZfusutTH5F46Tt3rcn+U7fXkFSu8+6+CiPOrBVRMx
 b13/tzyaMMzRi3QtcvFYI1ndkvP94808bqyv8cXIQQJpppTZTygWFpgqql3t7urFchvo
 T5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687773087; x=1690365087;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bGHZ09p9HNhwi6ydE37wMbqW/noRTOLjULCMWI4arMs=;
 b=c+05CnI+7UFFcBpzqZCjNtCiNYVReMEZJsYoD74y/ymo1ckR1pfYppFVbShw/jdNM4
 sBVObJtRDPZSPF8WwTJY9nqfm/n56iX06eSy1u124xRMYOk08R7rGbh9BgIC+ZvOo45d
 gqag+DxEuVt00/fu3xBorWgGaET5Os46Yn+O9Gt9w3qqOkwagLzw8PMMCla9WQTheIz5
 aXJoSXjbzs2sVHmz3XudScEt1Clh72TPe/1FQNKhhZKhDAq5bYbVG7UTpOJNOOIryL+l
 aPi43tzNFJ+wa97qVye5EUlEqMmboNlPO+5dA9uzBIcJ1uAjGIHLuJ9RG6My2FuqyfKJ
 QtMA==
X-Gm-Message-State: AC+VfDxzCqRs2I0WQE/S3xcrI9uCQqR6IRqg+F5KrUuFEtUf2Mkh/YZQ
 wfsOP72U+SgLWuf7CFfxqw9bLNmXCncp4/i0Z0c=
X-Google-Smtp-Source: ACHHUZ6Ez9S9uzAjTnFxC9RzXjNOgxf4uiVfpP7iaybrwsmMf3NUHrQBcd303Zhti3/kdiIZNfsIgw==
X-Received: by 2002:a05:6808:1924:b0:39b:a87f:91e8 with SMTP id
 bf36-20020a056808192400b0039ba87f91e8mr42619714oib.45.1687773087158; 
 Mon, 26 Jun 2023 02:51:27 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 b10-20020aca220a000000b0039ea7ababefsm2260364oic.57.2023.06.26.02.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 02:51:26 -0700 (PDT)
Message-ID: <e7491dd0-6bbc-b785-1019-2bd26b123de8@ventanamicro.com>
Date: Mon, 26 Jun 2023 06:51:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: How to enable Zicsr extension support on qemu-riscv32?
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: Tommy Murphy <tommy_murphy@hotmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
References: <LO0P265MB686600A85E9B6F3AEFAC066BF921A@LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM>
 <a998a5d1-f397-4925-d61f-5abacf44fb96@ventanamicro.com>
In-Reply-To: <a998a5d1-f397-4925-d61f-5abacf44fb96@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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

Tommy,

I tried it out and yeah, the SIGILL happens but it's supposed to happen. The
reason is that 'misa' is a CSR that is not available for linux-user mode. If
you try the same example with an available CSR it works.

I posted this info with a little more detail in the riscv-gnu-toolchain issue
you mentioned. Opening a gitlab QEMU issue is not necessary.


Thanks,


Daniel

On 6/25/23 20:24, Daniel Henrique Barboza wrote:
> Hi,
> 
> On 6/25/23 17:44, Tommy Murphy wrote:
>> Hi there
>>
>> I've tried searching to find an answer to this question but with no success so far unfortunately.
>>
>> The issue is discussed here: https://github.com/riscv-collab/riscv-gnu-toolchain/issues/1278#issuecomment-1606108826 <https://github.com/riscv-collab/riscv-gnu-toolchain/issues/1278#issuecomment-1606108826>
>>
>> But the gist is that I can configure, build and use `qemu-riscv32` to run a simple bare metal "hello world" program fine.
>> But if I add a CSR read instruction to it (e.g. `asm("csrr t0, misa");`) then I get Illegal Instruction.
>>
>> This is the case even if I use `qemu-riscv32 -cpu rv32,Zicsr=on hello.exe`.
>>
>> How can I configure/invoke `qemu-riscv32` so that I can emulate CSR instructions?
> 
> rv32 already has Zicsr support enabled by default. There might a bug
> somewhere.
> 
> Please file a gitlab bug (https://gitlab.com/qemu-project/qemu/-/issues) and
> we'll take a look. Don't forget to mention that you managed to reproduce the
> SIGILL using upstream QEMU as you mentioned in the toolchain bug. Thanks,
> 
> 
> Daniel
> 
>>
>> Thanks a lot
>>
>> Regards
>> Tommy
>>
>>


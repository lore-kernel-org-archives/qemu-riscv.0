Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CF3C54791
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 09:25:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkKr3-0007T0-O9; Wed, 13 Mar 2024 05:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkKr0-0007Ss-LQ
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 05:24:54 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkKqy-0007xJ-M7
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 05:24:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-29a8911d11cso481016a91.1
 for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2024 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710321891; x=1710926691; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5DjiWaFJcCvSjAo7i+dTOYm0GzRI5Aje4xC9p0UUNfk=;
 b=Yb59kz4cg05a8URDU3Rl0zeyB5s5eo/A7Nl2cN4MYL+ZMfygG7/4S0xDFz1CZzH86z
 QZm1uNvTnf61gex+NasaWl+o9sfv9QFASWTk1vYTULpoGT+WuKg7dOrL2yiJi0zpbV3K
 9CuEVGRwnIDKO0RTk671Tg8GFfe6wXAkvtrPHVlpLKmEuzwao+UuufWHjJ73n1JY+e+D
 nvVZLv91RP90DUElSR9S4C7GXUbYbrqoqZH7fNQytdyJlDl2MhAg2KqN1ijq5NnWQ2Iv
 D85N6M5CQpgdb0exCpYA1M/JdbxKymmRjHOtGQaVKw5goFqHP7Ra9vJCqad2Qo8DnheN
 7w5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321891; x=1710926691;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5DjiWaFJcCvSjAo7i+dTOYm0GzRI5Aje4xC9p0UUNfk=;
 b=MNqyfchINMZeP8rF4yRFXsephHxTEBJtFKbt23Oh3XYXVh1JCeKfIvjwBfvJ4fKIcl
 ywauQTOYU/5xd4Pa16KW3tXrnwawsHtDW/uB/af19gSn7NP+KiyUwMikuu5ia8DE8OMY
 hWYz/6NcGluKQfYzRJaubLmTVlES+FFSilLBGQ5iF7JGKvBdhC2LXGqsfAQCRzcCsrXu
 cPeg9wC+3HoPa4cOC/Ik/+Q7XMFoh4Bri45vmq4v+RRKEL9cLMOmihT35vF1sbGtLGII
 Ezh2rDlZA9o1P/WPOmw+3owJAsP0VRqL3BtMN/TE/5h3/YgRi+an5srs9ydnqduW0rxz
 E0Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7UAPmcm7Oh6YipJiXNT1bzR/oV76S6ThAPvqomQic4o03yjPEjEWe/pmJKUUNWAQ+tCqQwXxbMprzlYEkILFBO5gDiy8=
X-Gm-Message-State: AOJu0Ywd3Ej2E7SANobaNHvohMkSSR7qlc5NOert7Ih9zL6R6gPc1UZm
 N9x51T1UshbaW4QegGI0boPz08KS/1ydfxXpsqXpsAyqwDgvnZFXrnC1u+65h9Y=
X-Google-Smtp-Source: AGHT+IFBV7Vm3WIVYAFiVeswKyBjh/4+kObY/RGN6legcT4Fsa36Woa4B/NldOEEl8JRRsVWGzAZ6g==
X-Received: by 2002:a17:90b:4d85:b0:29b:82ee:13f with SMTP id
 oj5-20020a17090b4d8500b0029b82ee013fmr5759567pjb.11.1710321890863; 
 Wed, 13 Mar 2024 02:24:50 -0700 (PDT)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a17090a72c600b0029c129473a8sm938588pjk.9.2024.03.13.02.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 02:24:50 -0700 (PDT)
Message-ID: <d78fdd0c-1faa-4863-9fbe-a8b9a7226406@ventanamicro.com>
Date: Wed, 13 Mar 2024 06:24:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird behavior on RISC-V code running on QEMU
Content-Language: en-US
To: Alexander Pinheiro Paschoaletto <alexp@isep.ipp.pt>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
References: <VI1PR0402MB3613CDF1B2054516974813D6F82B2@VI1PR0402MB3613.eurprd04.prod.outlook.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <VI1PR0402MB3613CDF1B2054516974813D6F82B2@VI1PR0402MB3613.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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

Hi Alexander,

Can you please also file a bug here:

https://gitlab.com/qemu-project/qemu/-/issues/new

We use Gitlab as a bug tracker. The issue will have more visibility there than
in this mailing list.

You did a good job describing the problem in the email already, so you can
simply copy/paste the contents in the new Gitlab issue.


Thanks,

Daniel

On 3/12/24 19:06, Alexander Pinheiro Paschoaletto via wrote:
> Hello everyone, hope you are all doing great!
> 
> This is my first email within this group and frankly I'm not sure if it's the right place to ask for help or report a bug, so please feel free to warn me in case I should post this elsewhere. I am currently facing some weird problems on a RISC-V project meant to run on the QEMU environment and thought that maybe someone here could give me a light on the subject.
> 
> I am trying to run a project built on top of one of FreeRTOS' official demo ports that target the 'virt' QEMU board. I ran across a few weird behaviors where code execution would just hang at some point (QEMU would keep execution but the expected terminal output would never come up). I don't have sufficient knowledge to tell whether the issue is with the FreeRTOS port, the RISC-V gnu toolchain or QEMU itself, hence why I am raising my hand for help on all related channels.
> 
> This repository <https://bitbucket.org/softcps-investigacao-risc-v/freertos-riscv-bugs/src/master/> contains more details and a sample project that illustrates well one of the problems I've been getting lately (I also give more context about it here <https://github.com/riscv-collab/riscv-gnu-toolchain/issues/1434>). It basically goes like this: the program *executes fine* when a certain code snippet is encapsulated *within a function*, but *"crashes"* (i.e. hangs) when the same snippet is placed *directly in the main code*:
> 
> 
> 
> The scope shouldn't matter at all here, since there is no local variable being used or anything like that. I have tested things like removing compiling optimization (i.e. changing -Os for -O0) and using regular malloc() instead of FreeRTOS' dynamic allocation API, but all without success.  Note that even though the project is build on top of the FreeRTOS demo port, no RTOS functionality is used within this code to make it as simple as it gets.
> 
> And that's basically it. If any of you have a wild guess on the likely cause or something, please let me know.
> Thanks in advance.
> 
> Best regards,
> Alexander Paschoaletto
> 
> 


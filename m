Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBEDC47DB3
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 11:44:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rVryM-00055c-Vn; Fri, 02 Feb 2024 06:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rVryM-00055U-4s
 for qemu-riscv@nongnu.org; Fri, 02 Feb 2024 06:44:42 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rVryK-0005hJ-ID
 for qemu-riscv@nongnu.org; Fri, 02 Feb 2024 06:44:41 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2909a632e40so1625547a91.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Feb 2024 03:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1706874279; x=1707479079; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/56ML8DEVkLXwwkLgYh2U8m4CxJpd39lbiGTG9EnOBM=;
 b=DRoAiOqlK+5ctuGqbhW/tBM/HsbJoBhnpJ6A4st/pTLc/W7tqRThVTmeAhy1/kXkpg
 21rlrw/Z20tdFYeABtjuxc8OFvcAQP+U/h+pD62/sDU/eCEM6M/Ex1cO8UfNtMep0qaI
 VPThhFaajK2+Q9I5+V+Io8Ol85iJ26SDy9jlgFMojOtnqQH6cszM0ZV8wfnd9dY1dK4U
 i9/DuXXpjWaACRTq+OiuVnGaPFEKiz553kIfd1i2xu4tTNo2ArD9ZuQYa1/QoytyjTtO
 CcXEuiflNgQ7ZQREFNbiIoRWUlw3cLqBTMsQN7DPE4Qjdc+Z32oDhzq72HsNRAzONiF/
 XXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706874279; x=1707479079;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/56ML8DEVkLXwwkLgYh2U8m4CxJpd39lbiGTG9EnOBM=;
 b=fi9bCxeFJanUkVTlnS6glS+BWJwmhRIw8zI22hliFfYfEjMBmS5x1nOm7N8NS2s7EG
 NlHPqtigAUFqH/jKVbpGjhn1vd6wcIYYP7647A/MTjBsx1BwwSr0ur2RxmfUHFUNdbzm
 pFyChxU0SemUMcFIGbRJt8hMASzW3laEPcKchAU9RBBUSDERY8e27MB+2zWPAE7BRqn8
 nbhD9WlPoCOklI+LAi8ISVhnarIO2+IC3xI8dOz9YXTfizTVejJ5TEUWEaGHKpBQNu+B
 DgTvz2V706ZssrFYsFFaM1d6O8yIVBCAf94woO4IwNZgT84LF3gj7QqgpE+la8K+J6M6
 W4cg==
X-Gm-Message-State: AOJu0Yx40aELWti3URgw26sPRwAGcaGglLodzuGKVVqrAqSuuJsuKvFi
 lhv09hLkFbTN+HB9etJFw2yuYR9zonkbrFAfJ1T8NzAffuJLJBLUq/O7A4+WQAI=
X-Google-Smtp-Source: AGHT+IHlMIovokMGlK2rH8OoxQWy3YZ0uCbYe7EUYUp4tpoovFtdaK/OgHeZmRksMP6jN1yT1ZYvSw==
X-Received: by 2002:a17:90a:cc2:b0:295:c61c:1c07 with SMTP id
 2-20020a17090a0cc200b00295c61c1c07mr7700171pjt.21.1706874278971; 
 Fri, 02 Feb 2024 03:44:38 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWfrfga9oL+ffAB5xxjyppoxKDhFmIBoWm6XqWkh5eiQHJTWXO5scNgWeKwM4qedIFSRmrS2yzQ5AsErIXDnW7+kL0QIloJMzDwCM3YI5VuhjRiagD54jski9be3pB6RaTdn6Ruwdo0zpzyuv4njuBvWyc+HYVRNbvbUVCp6a3Di89lbMx67PjLLfHivfSTTVfo1ZWYxWrRiQl0Mc1hXXJvYncn
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 iz5-20020a170902ef8500b001d8f111804asm1425260plb.113.2024.02.02.03.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 03:44:38 -0800 (PST)
Message-ID: <bf7d4474-8307-4d4a-ac7d-c2b4cfebae8f@ventanamicro.com>
Date: Fri, 2 Feb 2024 08:44:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] riscv: add rv32i,rv32e and rv64e CPUs
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20240122123348.973288-1-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240122123348.973288-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Alistair,


I think we should just queue this up since it's all acked. It's still
applicable in riscv-to-apply.next.


Thanks,

Daniel

On 1/22/24 09:33, Daniel Henrique Barboza wrote:
> Hi,
> 
> This v3 has the same patches from v2 rebased with a newer
> riscv-to-apply.next branch (@ 096b6b07298).
> 
> No other changes made. All patches acked.
> 
> v2 link: https://lore.kernel.org/qemu-riscv/20240108161903.353648-1-dbarboza@ventanamicro.com/
> 
> Daniel Henrique Barboza (2):
>    target/riscv/cpu.c: add riscv_bare_cpu_init()
>    target/riscv: add rv32i, rv32e and rv64e CPUs
> 
>   target/riscv/cpu-qom.h |  3 ++
>   target/riscv/cpu.c     | 64 ++++++++++++++++++++++++++++++++----------
>   2 files changed, 52 insertions(+), 15 deletions(-)
> 


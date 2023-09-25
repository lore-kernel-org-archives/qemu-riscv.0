Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A39CE7A89
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 09:11:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkhcY-0002oM-Me; Mon, 25 Sep 2023 05:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkhcU-0002lg-Ex
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 05:11:11 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkhcR-0004ET-Ma
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 05:11:10 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3ab2436b57dso4080219b6e.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 02:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695633065; x=1696237865; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2c8f+kSR5X9rbugZ9MLJ+qSuWbDWY0Y72TRx5TxrNl0=;
 b=hE/X875sKmqudDVov847ubi78+kvNgwFo9t6jkqCvYt3ZWfMcFQJv8P9vuuzpIAEwt
 mrw/RDFnIPjodcZRXE33LpXKWAeGREQEyopaUZ24MLHY36VT/9daVkbOXEZrEf6z4iPK
 RivdhMDknlWn4Zjjvh7xD+hnyXFlaxy9q2kyxQoMY2l5hq9rqJJX1MM92OvCT/63dOhB
 +6aGGzytccn9NIbsg5HY54gXk+lWC/KNNuVtE2csU1P1bSBjXIaVWaWcKc2X47FOSlTd
 dyMtTJ0tJUL8Tl85m9OcfwodKs4YobaGvc2rs2TWqC+KV7DB2XAY6fFjzqBrRKuBQ/XP
 uIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695633065; x=1696237865;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2c8f+kSR5X9rbugZ9MLJ+qSuWbDWY0Y72TRx5TxrNl0=;
 b=S9zur2mCt+1RoT0BrBrKGfOCzCKwNV8RVD/3/DvOqE7TQEOrplIJ4Uds5Uia5tFyaO
 5oTvAT7dcGYmIynSVoD0ae8O89vZeNNVq5mWa5ihOyMuz0D8IzWfQXO6RUie5X9nWnDo
 Iiobpi/MXf0UcYnhJJqv4Vlu0VVjxeKXdW4vC5jqb6L7W6elcgpgawHNxnmsXZbEwmhw
 MRw0A2rJkvqd77/J41+mkkQ6QDA9cwdxVyp/ejKmRm19PlcE2CvJbDYnEVVGI2QI4qH1
 EhysJnJMf4amPTz4BKBdFKSwE/nzDHdzPfNFkVXUmL8Sudq54hXoa/QChkCLXE2jKxrU
 u6Fg==
X-Gm-Message-State: AOJu0YztTAbtLxeL2Yt0VVZZwQbIQLlTqBvFrNhASF3KrX9YoMH/A7SQ
 l7YJ+9qZmVPfkB/hHvEth5sdog==
X-Google-Smtp-Source: AGHT+IFtYByJ+qylVk9GN7uBTAJ+nAWjUQ+sdaoqhDM+12uQcsiiHnEQeFoVxQgDhfDxhgoAQYMHLA==
X-Received: by 2002:a05:6808:488:b0:3ab:8272:b158 with SMTP id
 z8-20020a056808048800b003ab8272b158mr7780740oid.19.1695633065468; 
 Mon, 25 Sep 2023 02:11:05 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.59])
 by smtp.gmail.com with ESMTPSA id
 fn3-20020a056a002fc300b0068bbe3073b6sm738039pfb.181.2023.09.25.02.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 02:11:05 -0700 (PDT)
Message-ID: <2cefc804-1b7b-614c-7c96-3004609878ea@ventanamicro.com>
Date: Mon, 25 Sep 2023 06:11:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/4] RISC-V: Work towards enabling -Wshadow=local
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>, david@gibson.dropbear.id.au,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair.francis@wdc.com,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, palmer@dabbelt.com,
 liweiwei@iscas.ac.cn, Bin Meng <bin.meng@windriver.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230925043023.71448-1-alistair.francis@wdc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230925043023.71448-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

CCing Markus since he might want to add these in his shadow-next tree.


Daniel

On 9/25/23 01:30, Alistair Francis wrote:
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Bugs love to hide in such code.
> Evidence: "[PATCH v3 1/7] migration/rdma: Fix save_page method to fail
> on polling error".
> 
> This patch removes the local variable shadowing. Tested by adding:
> 
>      --extra-cflags='-Wshadow=local -Wno-error=shadow=local -Wno-error=shadow=compatible-local'
> 
> To configure
> 
> Alistair Francis (4):
>    hw/riscv: opentitan: Fixup local variables shadowing
>    target/riscv: cpu: Fixup local variables shadowing
>    target/riscv: vector_helper: Fixup local variables shadowing
>    softmmu/device_tree: Fixup local variables shadowing
> 
>   hw/riscv/opentitan.c         | 2 +-
>   softmmu/device_tree.c        | 6 +++---
>   target/riscv/cpu.c           | 4 ++--
>   target/riscv/vector_helper.c | 7 ++++---
>   4 files changed, 10 insertions(+), 9 deletions(-)
> 


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DEDC369DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 17:12:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9oUt-0008Gr-8o; Tue, 29 Apr 2025 13:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9oUl-0008Ew-TV
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 13:11:48 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9oUj-0006ck-J8
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 13:11:47 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-224191d92e4so68978045ad.3
 for <qemu-riscv@nongnu.org>; Tue, 29 Apr 2025 10:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745946704; x=1746551504; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6CaCUpqk+9FSZbThzpVRvIPtToFP6IsxF0amHL3mChY=;
 b=fyltm2veyKnXqgZIdlu8RjRjYT3Axc8gUvICWCwqXo1CVZEAikjJAhzgLqUHCJkRhC
 GcD6Y6jAJXcUrUCz5DpdWypmCOIsuza87PMRgm4m0wjKXlAynydzxdhmbscKs3CGnc8C
 tcz9FGNiLXlSQhsSBko0PdPy56KyaWYK7NU4wcSMe7I4fiKgo31/TBLzEK/YUk4UiMQu
 Ac87MkKnDgG2nesa7Wx/hl0eMRgNXivkN2Q8/R/KlKL/p3uRZWPckCErdAJZQR//W9mp
 Y52dTBbICt+LrROi3qkzpLPINoJnTXeeLh0zORVYqadOYPaJLdLWttYuuRjgnUuCIozu
 X8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745946704; x=1746551504;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6CaCUpqk+9FSZbThzpVRvIPtToFP6IsxF0amHL3mChY=;
 b=Gq7+BIv+OozLVBv4JXXcQCn7ROEzBRhH9UjGBZt033PrE7JXkQPu5/YIOTs2pf4/vs
 hPTq7OctgIT+QGc2PJzU1Hbs8wMxeQFoCdHdbV1yJ2EuE3yfl35PihuOJ3tIJL4kn9+9
 HPDUHrfuBOwrJaG2sDkovTiC28sFGxi0/rQ6zIWuaU0MSVVje+NYqYQndOMjDcNPF9OD
 8zAc+pGlzmWVaZIh+o19YWubp6kcBT9HyiZuOF/dkgSKZvk0uqrFhpSkotLFFYgLo+qh
 Joj4q7I/crHe+Cu+zFAcLxZ6hC1NkZ0JaivHUk8f2BorVttT16sRWjSTS9L6FJg7CgRy
 iJzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtTfrRc9JfZljJvlRH7tsb8nql/tv0Ok4fO0UvSA2BfNcBL8dNBBwKAf1kIuBeIp2jQrEEnsyOsDFm@nongnu.org
X-Gm-Message-State: AOJu0YwkqCuxmmEEBOHLITC1L1oXAvRAAPyA7cOUQ/u3NeUKyAQHWufi
 0fdxPYak2GfOwq1QDoTN6Kxi4v2wUlmpAG03Ax+mUHmpNH0Ir353s7oXjU3DAXk=
X-Gm-Gg: ASbGncuk7h8xrdAHhL9S0oueTZQja8MPrmK/tCorTjZTX6TKqDcnUMQKN9rDAOn2sR9
 B9Dvop/ZcYgqNQJWiaTnp4hfXd9pBKBXb/iwa6ui4/EaU421IBg35JOruPLj/s9S2EFNgmkDojy
 zst1fMJ5Mh7ecDJiqIRfsyIxDhcHVYLDapm7TSf0mzX/GC6Amsl3Fmyeb8RWdyJYcfIQ3g3w/cd
 dVHcCWMYh+Vs0blqdl5Z+3Z9HiqfO75wmsObM8DKd2Oetk4n0m/YxlQYC0GFES9hdGVDRIkQlFQ
 IkY88oZFtZ9lN8bZLHDWg9XtrhmDfw/wZbms/7NGCeJRI7q7UOvqR14=
X-Google-Smtp-Source: AGHT+IFMEBJtPgNb1DpLL8WYgeOjwjmFLqaAfM3eJ2gHJDyyIGTJs3VNmn/Q1POVvRR51jLv4WkgAg==
X-Received: by 2002:a17:903:19c6:b0:227:eb61:34b8 with SMTP id
 d9443c01a7336-22df34e9148mr2491075ad.25.1745946703845; 
 Tue, 29 Apr 2025 10:11:43 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4dbe58csm105647575ad.97.2025.04.29.10.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 10:11:43 -0700 (PDT)
Message-ID: <45b9b66d-1aa7-47da-9458-04ab726d5aae@ventanamicro.com>
Date: Tue, 29 Apr 2025 14:11:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] hw/riscv/virt.c: remove 'long' casts in fmt strings
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20250423110630.2249904-1-dbarboza@ventanamicro.com>
 <20250423110630.2249904-10-dbarboza@ventanamicro.com>
 <CACPK8Xei9L_82YV7+wPmTacEh2MNLFticOEny_6kSM9miCAt2w@mail.gmail.com>
 <d404d535-fc04-43ac-a7a7-2f216cad993c@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <d404d535-fc04-43ac-a7a7-2f216cad993c@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 4/29/25 9:40 AM, Daniel Henrique Barboza wrote:
> Joel,
> 
> I'll make these changes in this patch to be consistent with what we've
> been discussing:
> 
> - change addr to hwaddr
> - use HWADDR_PRIx instead of PRIx64
> 
> i.e. this diff:
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 1eae84db15..0020d8f404 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -303,12 +303,13 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>   static void create_fdt_socket_memory(RISCVVirtState *s, int socket)
>   {
>       g_autofree char *mem_name = NULL;
> -    uint64_t addr, size;
> +    hwaddr addr;
> +    uint64_t size;
>       MachineState *ms = MACHINE(s);
> 
>       addr = s->memmap[VIRT_DRAM].base + riscv_socket_mem_offset(ms, socket);
>       size = riscv_socket_mem_size(ms, socket);
> -    mem_name = g_strdup_printf("/memory@%"PRIx64, addr);
> +    mem_name = g_strdup_printf("/memory@%"HWADDR_PRIx, addr);
>       qemu_fdt_add_subnode(ms->fdt, mem_name);
>       qemu_fdt_setprop_cells(ms->fdt, mem_name, "reg",
>           addr >> 32, addr, size >> 32, size);
> 
> 
> I did this change and applied your "hw/riscv/virt: device tree reg cleanups" series on top
> of it, and there are no conflicts. No change needed in your side.

It seems I was wrong. The v2 will conflict with your patch 03. I think a rebase from
your series can't be avoided ...

Daniel

> 
> 
> Thanks,
> 
> Daniel
> 
> 
> 
> On 4/24/25 6:41 AM, Joel Stanley wrote:
>> On Wed, 23 Apr 2025 at 20:39, Daniel Henrique Barboza
>> <dbarboza@ventanamicro.com> wrote:
>>>
>>> We can avoid the 'long' casts by using PRIx64 and HWADDR_PRIx on the fmt
>>> strings for uint64_t and hwaddr types.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   hw/riscv/virt.c | 29 +++++++++++++++--------------
>>>   1 file changed, 15 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>> index 036a0a9bfb..075c035f25 100644
>>> --- a/hw/riscv/virt.c
>>> +++ b/hw/riscv/virt.c
>>> @@ -309,7 +309,7 @@ static void create_fdt_socket_memory(RISCVVirtState *s, int socket)
>>>
>>>       addr = s->memmap[VIRT_DRAM].base + riscv_socket_mem_offset(ms, socket);
>>>       size = riscv_socket_mem_size(ms, socket);
>>> -    mem_name = g_strdup_printf("/memory@%lx", (long)addr);
>>> +    mem_name = g_strdup_printf("/memory@%"PRIx64, addr);
>>
>> I wondered why this wasn't a HWADDR_PRIx.
>>
>> addr (and NodeInfo::node_mem?) could be a hwaddr? That would make
>> everything more consistent.
>>
>> Cheers,
>>
>> Joel
> 



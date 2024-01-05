Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16B3C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 18:13:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLoh1-0003bG-EE; Fri, 05 Jan 2024 13:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1rLoh0-0003an-5d
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 13:13:14 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1rLogx-0007pW-VY
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 13:13:13 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5ce942efda5so1281039a12.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 10:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704478388; x=1705083188;
 darn=nongnu.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RS7Lx4FCFlf4wwtDGeR0IuUSD/hX1OA9zQ16GGAQD78=;
 b=I8p7vP+HjqqDo+GxgUKcL6bSNdcdXB40fzlXxoCciRRnKv31CMfdyv0GD3F+2JzxKb
 FCnOnVNbC7wWI4xJf7OENtHVkRLxnQ4KgPem1eiAYQwPS2if48vebWC5DuErWMtBrHpi
 a3GrgjJpo5M8Dc0V601VYB+wS5TTY//1eUMvqfcCYTKpIU+jpjSzWZBjJ5NTAwky0Z9M
 4mx+biRS6CWMlEVLF7Ld1MNaOEa2TIdUqlFIFR17uxTlQQaPqadHeFHWnY0/QkVoGsi0
 Fp4tiVd+pP9APgndoYoqjDMW8KI26XFTqausk9RYsYA94cTPjadqtcgyCWj5g1GxR6SW
 +vLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704478388; x=1705083188;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RS7Lx4FCFlf4wwtDGeR0IuUSD/hX1OA9zQ16GGAQD78=;
 b=GPOPFhUKp2MnwTFb6maMJSAgF2dyLFc3YrQHa6558DUu7HWRcANHGc8o7OWkqyv4As
 YxUBIKCArCg4bcLeDQuFeK9URlVxDiaHfBXdx+5cbl7On+x03rpuPiqH0Q3ZMChUW7AX
 UCebD8fTHXh35nCisjSbeCrqLYdVvCFO4KGkMNGTuO2dK9wGGS6o2hcOYBcePOcZvVd3
 t4sqCZBA3aJ13CpK9hUHNTTqm4/W5O/GCzJoP+cxOWGflY/Y7yodunWrCEIU7fp+cVHA
 7RhaqcQ1ODIImG76533w7ISSV6xe0QOOI4ZsCIeIWPz6+oStkS/OuQM6zCyGJuosdlhU
 MiWA==
X-Gm-Message-State: AOJu0Yzmy09CwL+CONFNYMmUfMAfs26eE98et2WaZiar9F6fnv5Ex5dG
 v+whyfcXDhqxH+oqkVNiUvXyrPXhk/1jcw==
X-Google-Smtp-Source: AGHT+IFe04pgCvOmlVw1vNydD0E14kTKmA0zlMoqh4Ao+vja60PaPzs1oVE/ibM/sQHmlfwAktqlzg==
X-Received: by 2002:a17:90a:4f05:b0:28b:ecdf:326f with SMTP id
 p5-20020a17090a4f0500b0028becdf326fmr2199481pjh.87.1704478388587; 
 Fri, 05 Jan 2024 10:13:08 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 su6-20020a17090b534600b0028d136ba928sm911372pjb.28.2024.01.05.10.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 10:13:08 -0800 (PST)
Date: Fri, 5 Jan 2024 10:13:06 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 3/6] target/riscv: Add helper functions to calculate
 current number of masked bits for pointer masking
Message-ID: <ZZhGslp0vzJAYPPQ@debug.ba.rivosinc.com>
References: <20240103185716.1790546-1-me@deliversmonkey.space>
 <20240103185716.1790546-4-me@deliversmonkey.space>
 <CAKC1njQwWxwSeGKVMUtUVmTkWEO-Z8zL8O20VmC+NJvUQNj94w@mail.gmail.com>
 <CAFukJ-CSS2QPmP5xKxRS=VaXBNy_-pv24w-ovnmxcXxOD9jrZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFukJ-CSS2QPmP5xKxRS=VaXBNy_-pv24w-ovnmxcXxOD9jrZA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On Fri, Jan 05, 2024 at 10:33:40AM +0300, Alexey Baturo wrote:
>I think you're right, thanks.
>I'll add a check for M-mode as well and I guess I'll have to rename the
>function.
>Any ideas on the proper and self-describing name?

Since all we care for is whether virtual memory is enabled and in effect or not.
Some suggestions below
`
bool riscv_cpu_mmu_enabled
bool riscv_cpu_paging_enabled
bool riscv_cpu_virt_mem_enabled


>
>Thanks
>
>пт, 5 янв. 2024 г. в 03:46, Deepak Gupta <debug@rivosinc.com>:
>
>> On Wed, Jan 3, 2024 at 10:59 AM Alexey Baturo <baturo.alexey@gmail.com>
>> wrote:
>> > +
>> > +bool riscv_cpu_bare_mode(CPURISCVState *env)
>> > +{
>> > +    int satp_mode = 0;
>> > +#ifndef CONFIG_USER_ONLY
>> > +    if (riscv_cpu_mxl(env) == MXL_RV32) {
>> > +        satp_mode = get_field(env->satp, SATP32_MODE);
>> > +    } else {
>> > +        satp_mode = get_field(env->satp, SATP64_MODE);
>> > +    }
>> > +#endif
>> > +    return (satp_mode == VM_1_10_MBARE);
>> > +}
>> > +
>>
>> Assume the CPU was in S or U with satp = non-bare mode but then a
>> transfer to M-mode happened.
>> In that case, even though the CPU is in M mode, the above function
>> will return non-bare mode and enforce
>> signed extension on M mode pointer masking (if enabled).
>>
>> right or am I missing something here?
>>


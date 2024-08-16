Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B440FC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 05:35:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sepcJ-0005LI-SR; Fri, 16 Aug 2024 01:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sepcJ-0005KB-9v
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 01:35:15 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sepcH-0006XN-E1
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 01:35:15 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-260f81f7fb5so1122914fac.0
 for <qemu-riscv@nongnu.org>; Thu, 15 Aug 2024 22:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723786512; x=1724391312; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8T/+vv8KsLZQa506sxKSHhsEOP6vBcVSEGShKVPGRlo=;
 b=pcHlqF8+UW3y6ZSrjyeuhAzgEsQ/nsJf1zoFTN6u1Drmj9bijwV0mvpHb89/tQxkkK
 NWaYA7O1BtB2LwtmADL89XgyTv+JZ7BDVo2b+qqCry82wP89sE9xWrFa9i9U6pMf8TVn
 US4mdkhMfdsk8koQDD99ncXt2bt5U42yCn2qbxQ9zqTG4C+4Y5LGZqv8djy8GuxL88iJ
 PDxfKW3KzlQhUd8r9whSGTdFbrg608bbntIxg9xhFZ3iGthWqNltF9zN+DSpWfsT4o5c
 jcNkfz5nueJtIE5biu1aQWdpSNB1RWQjjEVz4lxVq0dmZNYISdqOeu6qb56nLsmWYT3D
 X8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723786512; x=1724391312;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8T/+vv8KsLZQa506sxKSHhsEOP6vBcVSEGShKVPGRlo=;
 b=uAjQEiocIpy2TPqCHWrCdHjd4A/IGUnJdFdZJu7hs+EYfFQnBHX1qaheBDGLJGsOAA
 q0ag+iSPlvlUbxG0bJsw9E3P/rGFksv+ZiEBT4ESFd2H6qpZT5WAdZ79QCKTOp6XAB0g
 nE4BgQpb3NoMPSzIm2biwhzgUuC4q1ntWbwGpo476TMVldf2QPhoUYIrW4mswC0UJK9b
 XH1BISf2lUld2r9w0viQx2A5Gy3XivGKadl1DJPDIdRVmtEEXE86yQhlzhNgvl3FUr0M
 chOB9hWWOG/k/4goZInHp/O7Y98MQQ4cW/Og8l2uBHHunVz5H6F6v4tftMc1Q8SlwFv4
 SMtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOs1Fo5ZIvWoDejHaTukiFdJnkNQ7lRWSQcTBjE6GpMm6pHCUnuWnTR9oUus1oPLjHXwHM+hSWqMrtNWZDB7rt3wdY6kY=
X-Gm-Message-State: AOJu0YzHWZXU1ubD1OT+jRsvtegrL0eNc2SuBvq8WMnr12dVzId5REg2
 MYA6SRJqL1cVDKPgQnupXsiPxcd30WJ91Fa8jEW17eMdidvzb+wVIrXxn7Kg4JI=
X-Google-Smtp-Source: AGHT+IEmyJAkeW3NlN2exSVp2enGJEDMjORU+M7bqo20gj8tpUfKhtmjnlCbVfcfB7jQ9BWkRtt3qQ==
X-Received: by 2002:a05:6870:468b:b0:260:f5ab:62ff with SMTP id
 586e51a60fabf-2701c5ed7c1mr2054888fac.44.1723786511709; 
 Thu, 15 Aug 2024 22:35:11 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:1b6b:8c7b:90f9:144f?
 (2403-580a-f89b-0-1b6b-8c7b-90f9-144f.ip6.aussiebb.net.
 [2403:580a:f89b:0:1b6b:8c7b:90f9:144f])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b6364e76sm2143089a12.81.2024.08.15.22.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 22:35:11 -0700 (PDT)
Message-ID: <38238616-f692-4223-a9fd-949193f051f3@linaro.org>
Date: Fri, 16 Aug 2024 15:35:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/16] target/riscv: mmu changes for zicfiss shadow
 stack protection
To: Deepak Gupta <debug@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, pbonzini@redhat.com, jim.shu@sifive.com,
 andy.chiu@sifive.com, kito.cheng@sifive.com
References: <20240816010711.3055425-1-debug@rivosinc.com>
 <20240816010711.3055425-12-debug@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240816010711.3055425-12-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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

On 8/16/24 11:07, Deepak Gupta wrote:
> zicfiss protects shadow stack using new page table encodings PTE.W=0,
> PTE.R=0 and PTE.X=0. This encoding is reserved if zicfiss is not
> implemented or if shadow stack are not enabled.
> Loads on shadow stack memory are allowed while stores to shadow stack
> memory leads to access faults. Shadow stack accesses to RO memory
> leads to store page fault.
> 
> To implement special nature of shadow stack memory where only selected
> stores (shadow stack stores from sspush) have to be allowed while rest
> of regular stores disallowed, new MMU TLB index is created for shadow
> stack.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   target/riscv/cpu_helper.c | 52 +++++++++++++++++++++++++++++++++++++--
>   target/riscv/internals.h  |  3 +++
>   2 files changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d3115da28d..4d282fd9ed 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -817,6 +817,18 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>       env->load_res = -1;
>   }
>   
> +static bool legal_sstack_access(int access_type, bool sstack_inst,
> +                                bool sstack_attribute)
> +{
> +    /*
> +     * Read/write/execution permissions are checked as usual. Shadow
> +     * stack enforcement is just that (1) instruction type must match
> +     * the attribute unless (2) a non-SS load to an SS region.
> +     */
> +    return (sstack_inst == sstack_attribute) ||
> +        ((access_type == MMU_DATA_LOAD) && sstack_attribute);
> +}

While helpers are usually helpful, the invocation and logic of this one isn't.

> @@ -894,6 +906,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>       hwaddr ppn;
>       int napot_bits = 0;
>       target_ulong napot_mask;
> +    bool is_sstack_insn = ((mmu_idx & MMU_IDX_SS_WRITE) == MMU_IDX_SS_WRITE);

is_sstack_idx is a better name, because we are testing the idx.
The fact that this idx is intended to be used only by sstack insns is beside the point.

> +    bool sstack_page = false;
>   
>       /*
>        * Check if we should use the background registers for the two
> @@ -1104,13 +1118,34 @@ restart:
>   
>       /* Check for reserved combinations of RWX flags. */
>       switch (pte & (PTE_R | PTE_W | PTE_X)) {

Perhaps

     rwx = ptw & ...;
     switch (rwx)

> -    case PTE_W:
>       case PTE_W | PTE_X:
>           return TRANSLATE_FAIL;
> +    case PTE_W:
> +        /* if bcfi enabled, PTE_W is not reserved and shadow stack page */
> +        if (cpu_get_bcfien(env) && first_stage) {
> +            sstack_page =  true;

Extra space.

Perhaps, at this point,

     /* Shadow stack pages are globally readable,
        but only writable from the sstack idx. */
     rwx = is_sstack_idx ? RWX_R | RWX_W : RWX_R;

> +    /* Illegal combo of instruction type and page attribute */
> +    if (!legal_sstack_access(access_type, is_sstack_insn,
> +                            sstack_page)) {
> +        /* shadow stack instruction and RO page then it's a page fault */
> +        if (is_sstack_insn && ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_R)) {
> +                return TRANSLATE_FAIL;
> +        }
> +        /* In all other cases it's an access fault, so raise PMP_FAIL */
> +        return TRANSLATE_PMP_FAIL;

Continuing the above switch,

     case PTE_R:
         /* Shadow stack writes to read-only pages are page faults. */
         if (is_sstack_idx && access_type == MMU_DATA_STORE) {
             return TRANSLATE_FAIL;
         }
         break;

> -    if (pte & PTE_R) {
> +    /*
> +     * If PTE has read bit in it or it's shadow stack page,
> +     * then reads allowed
> +     */
> +    if ((pte & PTE_R) || sstack_page) {

Using rwx, no longer need to special case sstack_page.

The second half of leval_sstack_access can be handled by adjusting

     if (!((prot >> access_type) & 1)) {
         /* Access check failed */
         return sstack_page ? TRANSLATE_PMP_FAIL : TRANSLATE_FAIL;
     }

I don't think you need or want to move this ahead of the user/supervisor check.  I see "U 
and SUM bit enforcement is performed normally", which makes sense.  Differing behavior for 
user/supervisor could allow a timing attack against kernel pages to identify where the 
kernel shadow stack is located.  (Not an observation on qemu, but an observation on the 
architecture spec.)


r~


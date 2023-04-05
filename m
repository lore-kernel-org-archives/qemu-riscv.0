Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pk9QF-00059P-Dg
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 16:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pk9QE-00058x-1b; Wed, 05 Apr 2023 16:07:58 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pk9QC-0001oY-Gd; Wed, 05 Apr 2023 16:07:57 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 r17-20020a05683002f100b006a131458abfso17061036ote.2; 
 Wed, 05 Apr 2023 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680725274;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RhuMLQBR3rCl5VaE4Hh/yoxhUD1OUMBEn6EcaPgazrI=;
 b=pP2fEUvwYrEdiuXNPTkMXHVUnka40mUzp56rRN/Y4Zu2s8YPUib88gYRW3BHfC43Cg
 qa73BgsFEcRx9oKCRE4NyOA29hxbN+s7KpHb/hD+G3OXrYE1kUb8B5uEXM9I8FTwt0FD
 MbfxJ0L1uPSJsn6pZa14djxWBecTp5ujmuYlwjXvQPGq86mE7eRXzZ7NXut4e629R/NW
 kttNdIRtFu1dQIAOa4B3rgTDe8JMgZygmUEv5bXus2bdqqIG+7/cuG1tGH7qyZx92BFM
 Zt7KLIA7ckf19f7PP6Ab1vqbtQAQvGuxt7cz8k/EID+e/GMQLgp3FQ5x6B2obzBckZHg
 S8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680725274;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RhuMLQBR3rCl5VaE4Hh/yoxhUD1OUMBEn6EcaPgazrI=;
 b=qvPPZjt3EGmfBzHNKXYjjLG7ou46f84/CdHb+Pe00tkjdCchcaKqtNRTONDCEcH4qh
 S3oLRGEQN/MR35n9njQNlP7/J/ZFupSBUXppvsmPtvlr2UYHZjp7zRppb4fTRrZajZJ9
 Rf4fyFKpZAjq8tMuMqYs0RPwn+q9UX8VpXsGlPNJddaLDwEJQYq1V50sZjIzfO/WT+0g
 cVUw0ceg/7XZ2Ww3ahfuWqob2NoeXZrmVw9uBRJwEal/cdc6Byk0y5XTof+vhVFozYF+
 8LVZT7aADy5r4O2pK1mUUd8OoRfPsIC9EFWBsXyRcr2AuXY1AJSE7vrNgTsiZtPk0PNF
 UJ3w==
X-Gm-Message-State: AAQBX9eXn04D0OU7TJNtje7c3qPRqcrJIztfkJEWpGdK5wm+3KSAvq/2
 7Cu52al4N37EQ2B9Cy46Pmw=
X-Google-Smtp-Source: AKy350YiSmUilKBLhtGMkDdEkcF20XopvLMbOWeSCDMkvT7LnCLKjzIhC+ILBPXNxeO6263OpKyUnQ==
X-Received: by 2002:a9d:76d5:0:b0:69f:a723:bd60 with SMTP id
 p21-20020a9d76d5000000b0069fa723bd60mr3301505otl.5.1680725273722; 
 Wed, 05 Apr 2023 13:07:53 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a056830019000b0069fb87285fdsm7212817ota.59.2023.04.05.13.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 13:07:53 -0700 (PDT)
Message-ID: <330814bb-1568-9f64-b7ab-005776671ec5@gmail.com>
Date: Wed, 5 Apr 2023 17:07:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 08/10] target/ppc: Restrict KVM-specific field from ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-9-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230405160454.97436-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.355,
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
X-List-Received-Date: Wed, 05 Apr 2023 20:07:58 -0000



On 4/5/23 13:04, Philippe Mathieu-Daudé wrote:
> The 'kvm_sw_tlb' field shouldn't be accessed when KVM is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/cpu.h        | 2 ++
>   target/ppc/mmu_common.c | 4 ++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 557d736dab..0ec3957397 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1148,7 +1148,9 @@ struct CPUArchState {
>       int tlb_type;    /* Type of TLB we're dealing with */
>       ppc_tlb_t tlb;   /* TLB is optional. Allocate them only if needed */
>       bool tlb_dirty;  /* Set to non-zero when modifying TLB */
> +#ifdef CONFIG_KVM
>       bool kvm_sw_tlb; /* non-zero if KVM SW TLB API is active */
> +#endif /* CONFIG_KVM */
>       uint32_t tlb_need_flush; /* Delayed flush needed */
>   #define TLB_NEED_LOCAL_FLUSH   0x1
>   #define TLB_NEED_GLOBAL_FLUSH  0x2
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 7235a4befe..21843c69f6 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -917,10 +917,12 @@ static void mmubooke_dump_mmu(CPUPPCState *env)
>       ppcemb_tlb_t *entry;
>       int i;
>   
> +#ifdef CONFIG_KVM
>       if (kvm_enabled() && !env->kvm_sw_tlb) {
>           qemu_printf("Cannot access KVM TLB\n");
>           return;
>       }
> +#endif
>   
>       qemu_printf("\nTLB:\n");
>       qemu_printf("Effective          Physical           Size PID   Prot     "
> @@ -1008,10 +1010,12 @@ static void mmubooke206_dump_mmu(CPUPPCState *env)
>       int offset = 0;
>       int i;
>   
> +#ifdef CONFIG_KVM
>       if (kvm_enabled() && !env->kvm_sw_tlb) {
>           qemu_printf("Cannot access KVM TLB\n");
>           return;
>       }
> +#endif
>   
>       for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
>           int size = booke206_tlb_size(env, i);


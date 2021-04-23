Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZkZW-00018v-Rp
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 21:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkZP-00013p-Iu
 for qemu-riscv@nongnu.org; Thu, 22 Apr 2021 21:25:24 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkZ7-0008ND-G9
 for qemu-riscv@nongnu.org; Thu, 22 Apr 2021 21:25:19 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 nm3-20020a17090b19c3b029014e1bbf6c60so370974pjb.4
 for <qemu-riscv@nongnu.org>; Thu, 22 Apr 2021 18:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/v3ueyu767UR2a71ujrmoLFs5EhOGrkoQ0rgfThnahc=;
 b=GOR/qFhRZvfu105UOFwvo7fZV2GpZIopkU6A0DRQymL5H6S8SWfAhwHhA4vh0Mlj9K
 WOWoX7u6oUgLKvN+gZhdn9/9GK7nc62kUjbHIwg0wTcOSRilaLSS499Fy8C2n7PoodJf
 DBD6x6fuN+950K396NB0LKbNvhW8mk5KZLVPCfzmgD0l375+UEr/ce9TLwl+Yce6mtFe
 z2QR5bAeWN1n3ERq2e4EtnHkZA9zvA07nD/5XMwSCF6MyXFUOd+ZcLdS59/2OmqEMNFK
 4REh5lIk3lM82MiajAFpM3eaS8redxpjanuGAZVuM9sTCOwbVt4Zh5be4IYG4aYBAVeI
 zSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/v3ueyu767UR2a71ujrmoLFs5EhOGrkoQ0rgfThnahc=;
 b=Iy7V2T2RjKP3vF2iqaz6u30D32547DvamO5S1CnHi4QJ7A/Qok/pcye89IF34+DUlg
 HKMlTFa0Kt3VNcJkDerV7SpujMjvAN+LEKPjZTMmWgwIxnlfiRhQXFlcpe4JD77Kk/ZH
 AGp/0FxHW9LmIh5p7XEj8kzl5u+uRKc8irOH28H6TbRaek7kOdsndA6oqT3yGchq1x/4
 lS/T5aKmI1sJggKtr2QtZtIasmcNj57UJB7LQOW/YAQM/B8EMed104eWIk3Fz5cnmqZX
 7UcF8bZZLgB03hOHCIkvXA4xMAsgLl3GbaSyDRIyrinB8lnBwc1irg+If15ayYwpHv7X
 s8rA==
X-Gm-Message-State: AOAM532FwvZboOyZV/GIyhcy+rUZHQEnmgMDm0hf0txW30CLjRHSkuqv
 4DtDxELW31Jm7Q3tvWmpbt+WJQ==
X-Google-Smtp-Source: ABdhPJzu8DoNrnpnltTN+rETfNORh6Llx4nULhsxSle3Ax014Sx8NB+SHiqQh+NvdLXWT50EGu1LIw==
X-Received: by 2002:a17:90a:a58f:: with SMTP id
 b15mr1557539pjq.135.1619141102090; 
 Thu, 22 Apr 2021 18:25:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h8sm3215390pjt.17.2021.04.22.18.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 18:25:01 -0700 (PDT)
Subject: Re: [PATCH v6 10/18] cpu: Move CPUClass::vmsd to SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20210422193902.2644064-1-f4bug@amsat.org>
 <20210422193902.2644064-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc8cd5b3-3502-1937-1400-f471078cad9b@linaro.org>
Date: Thu, 22 Apr 2021 18:24:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422193902.2644064-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Apr 2021 01:25:24 -0000

On 4/22/21 12:38 PM, Philippe Mathieu-Daudé wrote:
> Migration is specific to system emulation.
> 
> - Move the CPUClass::vmsd field to SysemuCPUOps,
> - restrict VMSTATE_CPU() macro to sysemu,
> - vmstate_dummy is now unused, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

>   #ifndef CONFIG_USER_ONLY
>   static const struct SysemuCPUOps riscv_sysemu_ops = {
> +    /* For now, mark unmigratable: */
> +    .legacy_vmsd = &vmstate_riscv_cpu,
>   };
>   #endif
>   
> @@ -628,8 +630,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>       cc->disas_set_info = riscv_cpu_disas_set_info;
>   #ifndef CONFIG_USER_ONLY
>       cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
> -    /* For now, mark unmigratable: */
> -    cc->legacy_vmsd = &vmstate_riscv_cpu;

I'll note that the comment has been incorrect since f7697f0e629.


r~

>       cc->sysemu_ops = &riscv_sysemu_ops;
>       cc->write_elf64_note = riscv_cpu_write_elf64_note;
>       cc->write_elf32_note = riscv_cpu_write_elf32_note;
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 7503b9e0c8b..131e7dfdf82 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
>   
>   #ifndef CONFIG_USER_ONLY
>   static const struct SysemuCPUOps s390_sysemu_ops = {
> +    .legacy_vmsd = &vmstate_s390_cpu,
>   };
>   #endif
>   
> @@ -522,7 +523,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
>       cc->gdb_write_register = s390_cpu_gdb_write_register;
>   #ifndef CONFIG_USER_ONLY
>       cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
> -    cc->legacy_vmsd = &vmstate_s390_cpu;
>       cc->get_crash_info = s390_cpu_get_crash_info;
>       cc->write_elf64_note = s390_cpu_write_elf64_note;
>       cc->sysemu_ops = &s390_sysemu_ops;
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 743a7287a4f..543853c24dc 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -850,6 +850,7 @@ static Property sparc_cpu_properties[] = {
>   
>   #ifndef CONFIG_USER_ONLY
>   static const struct SysemuCPUOps sparc_sysemu_ops = {
> +    .legacy_vmsd = &vmstate_sparc_cpu,
>   };
>   #endif
>   
> @@ -894,7 +895,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
>       cc->gdb_write_register = sparc_cpu_gdb_write_register;
>   #ifndef CONFIG_USER_ONLY
>       cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
> -    cc->legacy_vmsd = &vmstate_sparc_cpu;
>       cc->sysemu_ops = &sparc_sysemu_ops;
>   #endif
>       cc->disas_set_info = cpu_sparc_disas_set_info;
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
> index b15abc36851..e3f2f2fefa3 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -10880,6 +10880,7 @@ static Property ppc_cpu_properties[] = {
>   
>   #ifndef CONFIG_USER_ONLY
>   static const struct SysemuCPUOps ppc_sysemu_ops = {
> +    .legacy_vmsd = &vmstate_ppc_cpu,
>   };
>   #endif
>   
> @@ -10925,7 +10926,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>       cc->gdb_write_register = ppc_cpu_gdb_write_register;
>   #ifndef CONFIG_USER_ONLY
>       cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
> -    cc->legacy_vmsd = &vmstate_ppc_cpu;
>       cc->sysemu_ops = &ppc_sysemu_ops;
>   #endif
>   #if defined(CONFIG_SOFTMMU)
> 



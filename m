Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4720ACDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:44:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqvyf-0008Oi-N5; Thu, 12 Oct 2023 09:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqvyc-0008Kx-8k
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 09:43:46 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqvyZ-0003Q6-04
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 09:43:44 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso168242366b.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 06:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697118219; x=1697723019; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L2A4E9+dNa00po2MED/4cipHnTQuGy+ZY0n6n2MKQQc=;
 b=tMCO3YB/vl1iY33pNSihGyrERFfi/b4GUWAnX6XpQpAPq2g4lPU+6/VYBCleXS8BI4
 jyAtVhmvBUd1Bfw2T9s1FIBaPhSgoKOx735q8nzJIYT6CILkupYTImSS+KTN9AGpnzUp
 WA1xpMC06Ae2XgsGjnx4jOyrnD2lYcx2NMcFob9T+Ycai2hQAoTEZuX0Y2Pzpx3tSJRP
 iK1BuNu01PuvsKBTir7O4CMS7OmS92rvGTBdTBt92PkEVkPddyndcQVSSNhKb/nelYKw
 K6h+OfmHEZbmYLa/1Zpjiq+7sJFm6NM0AMrhHZzhywa4dpleMXzljC/4343iwqa8T2lF
 3ROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697118219; x=1697723019;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L2A4E9+dNa00po2MED/4cipHnTQuGy+ZY0n6n2MKQQc=;
 b=bzEX6NIvVsyQnyefTmTPDu5RX5qq2A4Z6kBZTMAyu4kVS+CjK5qm85Pgiijgcngez6
 2ExesJ1qXxjGVOdlDfXyyGX9b0AUElNwNQ5jwx5JdALGfxdeEg7hHhVgbTr47hfuFb+O
 U2Z73LOPSvUmxsWftqMduIRzTPak+LV6w+5Co9CGRJqVfc1oTYgEdooWaYCLUcGcT4WR
 OGnJuLShwZllPZXcTiobjVUOeZveqAcaG3aimd3GMajf0RcyotqA+PKsJxVUPV/Yv/oL
 HAT66UbOwD2fadMYEyde7kslvRDhSPM+425fNq7j6YETEHmV6HNalXncWIn8UiXow+Yj
 pjQA==
X-Gm-Message-State: AOJu0YxP3paPXMKMhYacrdUkDmiwOVUpyvtKcrrwN89Lyu6dYd+v1MP9
 QcRDllXKiSs8gNRP8pPVnfXU/g==
X-Google-Smtp-Source: AGHT+IEDy6fJIRNDADZI7QVJi+E/Qi6xb8q8nnzhVdJmr6Hoa6fvIuP8jXhrKbJskGQZ/rNo7vLFyw==
X-Received: by 2002:a17:906:76d4:b0:9b7:37de:600d with SMTP id
 q20-20020a17090676d400b009b737de600dmr21357008ejn.62.1697118218838; 
 Thu, 12 Oct 2023 06:43:38 -0700 (PDT)
Received: from [192.168.69.115] (176-131-211-232.abo.bbox.fr.
 [176.131.211.232]) by smtp.gmail.com with ESMTPSA id
 w19-20020a170906481300b009b9720a85e5sm11078419ejq.38.2023.10.12.06.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 06:43:38 -0700 (PDT)
Message-ID: <62fd649b-1c07-c0f5-11cc-ca17ad0675e5@linaro.org>
Date: Thu, 12 Oct 2023 15:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v11 11/18] gdbstub: Infer number of core registers from XML
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <20231012130616.7941-1-akihiko.odaki@daynix.com>
 <20231012130616.7941-12-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231012130616.7941-12-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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

Hi Akihiko,

On 12/10/23 15:06, Akihiko Odaki wrote:
> GDBFeature has the num_regs member so use it where applicable to
> remove magic numbers.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/hw/core/cpu.h   | 3 ++-
>   target/s390x/cpu.h      | 2 --
>   gdbstub/gdbstub.c       | 5 ++++-
>   target/arm/cpu.c        | 1 -
>   target/arm/cpu64.c      | 1 -
>   target/avr/cpu.c        | 1 -
>   target/hexagon/cpu.c    | 1 -
>   target/i386/cpu.c       | 2 --
>   target/loongarch/cpu.c  | 2 --
>   target/m68k/cpu.c       | 1 -
>   target/microblaze/cpu.c | 1 -
>   target/riscv/cpu.c      | 1 -
>   target/rx/cpu.c         | 1 -
>   target/s390x/cpu.c      | 1 -
>   14 files changed, 6 insertions(+), 17 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 3968369554..11d4b5cd0c 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -127,7 +127,8 @@ struct SysemuCPUOps;
>    * @gdb_adjust_breakpoint: Callback for adjusting the address of a
>    *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>    *       its Harvard architecture split code and data.
> - * @gdb_num_core_regs: Number of core registers accessible to GDB.
> + * @gdb_num_core_regs: Number of core registers accessible to GDB or 0 to infer
> + *                     from @gdb_core_xml_file.
>    * @gdb_core_xml_file: File name for core registers GDB XML description.
>    * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
>    *           before the insn which triggers a watchpoint rather than after it.
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 7bea7075e1..83eafbe4b1 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -452,8 +452,6 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
>   #define S390_R13_REGNUM 15
>   #define S390_R14_REGNUM 16
>   #define S390_R15_REGNUM 17
> -/* Total Core Registers. */
> -#define S390_NUM_CORE_REGS 18
>   
>   static inline void setcc(S390CPU *cpu, uint64_t cc)
>   {
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 49fb23a68a..c19f1785e4 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -541,9 +541,12 @@ void gdb_init_cpu(CPUState *cpu)
>           gdb_register_feature(cpu, 0,
>                                cc->gdb_read_register, cc->gdb_write_register,
>                                feature);
> +        cpu->gdb_num_regs = cpu->gdb_num_g_regs = feature->num_regs;
>       }
>   
> -    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
> +    if (cc->gdb_num_core_regs) {
> +        cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;

Why not remove SysemuCPUOps::gdb_num_core_regs entirely?

> +    }
>   }



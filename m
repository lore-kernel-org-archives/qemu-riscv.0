Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A2BCD98E9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 02:52:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqPKq-0005bx-Re; Tue, 10 Oct 2023 22:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqPKn-0005Wy-Oh; Tue, 10 Oct 2023 22:52:29 -0400
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqPKj-0006yj-Kb; Tue, 10 Oct 2023 22:52:29 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=43; SR=0;
 TI=SMTPD_---0VtuL3TB_1696992726; 
Received: from 30.221.100.88(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VtuL3TB_1696992726) by smtp.aliyun-inc.com;
 Wed, 11 Oct 2023 10:52:08 +0800
Message-ID: <348eaf9c-9fb6-4674-b324-c3f3017f1851@linux.alibaba.com>
Date: Wed, 11 Oct 2023 10:51:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/18] target: Declare FOO_CPU_TYPE_NAME/SUFFIX in
 'cpu-qom.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Marek Vasut
 <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
References: <20231010092901.99189-1-philmd@linaro.org>
 <20231010092901.99189-5-philmd@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231010092901.99189-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/10/10 17:28, Philippe Mathieu-Daudé wrote:
> Hegerogeneous code needs access to the FOO_CPU_TYPE_NAME()
> macro to resolve target CPU types.

Hi Philippe,

I don't understand why should we use FOO_CPU_TYPE_NAME macro to resolve 
target CPU types? In my opinion, we should pass the
CPU typename from command line for heterogeneous case.

Could you make it clearer how should we use FOO_CPU_TYPE_NAME macro to 
resolve target CPU types in heterogeneous case?

Thanks,
Zhiwei

> Move the declaration
> (along with the required FOO_CPU_TYPE_SUFFIX) to "cpu-qom.h".
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/alpha/cpu-qom.h   | 5 ++++-
>   target/alpha/cpu.h       | 2 --
>   target/avr/cpu-qom.h     | 5 ++++-
>   target/avr/cpu.h         | 2 --
>   target/cris/cpu-qom.h    | 5 ++++-
>   target/cris/cpu.h        | 2 --
>   target/i386/cpu-qom.h    | 3 +++
>   target/i386/cpu.h        | 2 --
>   target/m68k/cpu-qom.h    | 5 ++++-
>   target/m68k/cpu.h        | 2 --
>   target/mips/cpu-qom.h    | 3 +++
>   target/mips/cpu.h        | 2 --
>   target/rx/cpu-qom.h      | 5 ++++-
>   target/rx/cpu.h          | 2 --
>   target/s390x/cpu-qom.h   | 5 ++++-
>   target/s390x/cpu.h       | 2 --
>   target/sh4/cpu-qom.h     | 5 ++++-
>   target/sh4/cpu.h         | 2 --
>   target/sparc/cpu-qom.h   | 5 ++++-
>   target/sparc/cpu.h       | 2 --
>   target/tricore/cpu-qom.h | 5 +++++
>   target/tricore/cpu.h     | 2 --
>   target/xtensa/cpu-qom.h  | 5 ++++-
>   target/xtensa/cpu.h      | 2 --
>   24 files changed, 47 insertions(+), 33 deletions(-)
>
> diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
> index 1f200724b6..d596d1b69f 100644
> --- a/target/alpha/cpu-qom.h
> +++ b/target/alpha/cpu-qom.h
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU Alpha CPU
> + * QEMU Alpha CPU QOM header (target agnostic)
>    *
>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>    *
> @@ -27,6 +27,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(AlphaCPU, AlphaCPUClass, ALPHA_CPU)
>   
> +#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
> +#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
> +
>   /**
>    * AlphaCPUClass:
>    * @parent_realize: The parent class' realize handler.
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index e2a467ec17..ba0d9e3468 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -428,8 +428,6 @@ enum {
>   
>   void alpha_translate_init(void);
>   
> -#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
> -#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
>   
>   void alpha_cpu_list(void);
> diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
> index 01ea5f160b..a810d6dc09 100644
> --- a/target/avr/cpu-qom.h
> +++ b/target/avr/cpu-qom.h
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU AVR CPU
> + * QEMU AVR CPU QOM header (target agnostic)
>    *
>    * Copyright (c) 2016-2020 Michael Rolnik
>    *
> @@ -28,6 +28,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(AVRCPU, AVRCPUClass, AVR_CPU)
>   
> +#define AVR_CPU_TYPE_SUFFIX "-" TYPE_AVR_CPU
> +#define AVR_CPU_TYPE_NAME(name) (name AVR_CPU_TYPE_SUFFIX)
> +
>   /**
>    *  AVRCPUClass:
>    *  @parent_realize: The parent class' realize handler.
> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> index 4ce22d8e4f..d3f0cc65d4 100644
> --- a/target/avr/cpu.h
> +++ b/target/avr/cpu.h
> @@ -28,8 +28,6 @@
>   #error "AVR 8-bit does not support user mode"
>   #endif
>   
> -#define AVR_CPU_TYPE_SUFFIX "-" TYPE_AVR_CPU
> -#define AVR_CPU_TYPE_NAME(name) (name AVR_CPU_TYPE_SUFFIX)
>   #define CPU_RESOLVING_TYPE TYPE_AVR_CPU
>   
>   #define TCG_GUEST_DEFAULT_MO 0
> diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
> index 431a1d536a..02a5b589b8 100644
> --- a/target/cris/cpu-qom.h
> +++ b/target/cris/cpu-qom.h
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU CRIS CPU
> + * QEMU CRIS CPU QOM header (target agnostic)
>    *
>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>    *
> @@ -27,6 +27,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(CRISCPU, CRISCPUClass, CRIS_CPU)
>   
> +#define CRIS_CPU_TYPE_SUFFIX "-" TYPE_CRIS_CPU
> +#define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)
> +
>   /**
>    * CRISCPUClass:
>    * @parent_realize: The parent class' realize handler.
> diff --git a/target/cris/cpu.h b/target/cris/cpu.h
> index 676b8e93ca..1af7ae5ef9 100644
> --- a/target/cris/cpu.h
> +++ b/target/cris/cpu.h
> @@ -242,8 +242,6 @@ enum {
>   /* CRIS uses 8k pages.  */
>   #define MMAP_SHIFT TARGET_PAGE_BITS
>   
> -#define CRIS_CPU_TYPE_SUFFIX "-" TYPE_CRIS_CPU
> -#define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)
>   #define CPU_RESOLVING_TYPE TYPE_CRIS_CPU
>   
>   /* MMU modes definitions */
> diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
> index 2350f4ae60..78207c0a7c 100644
> --- a/target/i386/cpu-qom.h
> +++ b/target/i386/cpu-qom.h
> @@ -32,6 +32,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(X86CPU, X86CPUClass, X86_CPU)
>   
> +#define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
> +#define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
> +
>   typedef struct X86CPUModel X86CPUModel;
>   
>   /**
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index e1875466b9..862e4f1ff5 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2241,8 +2241,6 @@ void cpu_x86_update_dr7(CPUX86State *env, uint32_t new_dr7);
>   /* hw/pc.c */
>   uint64_t cpu_get_tsc(CPUX86State *env);
>   
> -#define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
> -#define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
>   #define CPU_RESOLVING_TYPE TYPE_X86_CPU
>   
>   #ifdef TARGET_X86_64
> diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
> index 0ec7750a92..7192ecd71f 100644
> --- a/target/m68k/cpu-qom.h
> +++ b/target/m68k/cpu-qom.h
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU Motorola 68k CPU
> + * QEMU Motorola 68k CPU QOM header (target agnostic)
>    *
>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>    *
> @@ -27,6 +27,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(M68kCPU, M68kCPUClass, M68K_CPU)
>   
> +#define M68K_CPU_TYPE_SUFFIX "-" TYPE_M68K_CPU
> +#define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
> +
>   /*
>    * M68kCPUClass:
>    * @parent_realize: The parent class' realize handler.
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 20afb0c94d..ae144ebc2f 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -563,8 +563,6 @@ enum {
>       ACCESS_DATA  = 0x20, /* Data load/store access        */
>   };
>   
> -#define M68K_CPU_TYPE_SUFFIX "-" TYPE_M68K_CPU
> -#define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_M68K_CPU
>   
>   #define cpu_list m68k_cpu_list
> diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
> index 0dffab453b..9c98ca1956 100644
> --- a/target/mips/cpu-qom.h
> +++ b/target/mips/cpu-qom.h
> @@ -31,6 +31,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(MIPSCPU, MIPSCPUClass, MIPS_CPU)
>   
> +#define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
> +#define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
> +
>   /**
>    * MIPSCPUClass:
>    * @parent_realize: The parent class' realize handler.
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index 5fddceff3a..6b026e6bcf 100644
> --- a/target/mips/cpu.h
> +++ b/target/mips/cpu.h
> @@ -1303,8 +1303,6 @@ enum {
>    */
>   #define CPU_INTERRUPT_WAKE CPU_INTERRUPT_TGT_INT_0
>   
> -#define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
> -#define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_MIPS_CPU
>   
>   bool cpu_type_supports_cps_smp(const char *cpu_type);
> diff --git a/target/rx/cpu-qom.h b/target/rx/cpu-qom.h
> index 1c8466a187..99fe771534 100644
> --- a/target/rx/cpu-qom.h
> +++ b/target/rx/cpu-qom.h
> @@ -1,5 +1,5 @@
>   /*
> - * RX CPU
> + * QEMU RX CPU QOM header (target agnostic)
>    *
>    * Copyright (c) 2019 Yoshinori Sato
>    *
> @@ -28,6 +28,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(RXCPU, RXCPUClass, RX_CPU)
>   
> +#define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
> +#define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
> +
>   /*
>    * RXCPUClass:
>    * @parent_realize: The parent class' realize handler.
> diff --git a/target/rx/cpu.h b/target/rx/cpu.h
> index f66754eb8a..f89d88a37f 100644
> --- a/target/rx/cpu.h
> +++ b/target/rx/cpu.h
> @@ -114,8 +114,6 @@ struct ArchCPU {
>       CPURXState env;
>   };
>   
> -#define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
> -#define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_RX_CPU
>   
>   const char *rx_crname(uint8_t cr);
> diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
> index 00cae2b131..463fe16386 100644
> --- a/target/s390x/cpu-qom.h
> +++ b/target/s390x/cpu-qom.h
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU S/390 CPU
> + * QEMU S/390 CPU QOM header (target agnostic)
>    *
>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>    *
> @@ -27,6 +27,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(S390CPU, S390CPUClass, S390_CPU)
>   
> +#define S390_CPU_TYPE_SUFFIX "-" TYPE_S390_CPU
> +#define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)
> +
>   typedef struct S390CPUModel S390CPUModel;
>   typedef struct S390CPUDef S390CPUDef;
>   
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 7bea7075e1..3e161862e5 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -810,8 +810,6 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t gen, uint8_t ec_ga,
>   
>   
>   /* helper.c */
> -#define S390_CPU_TYPE_SUFFIX "-" TYPE_S390_CPU
> -#define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)
>   #define CPU_RESOLVING_TYPE TYPE_S390_CPU
>   
>   /* interrupt.c */
> diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
> index 89785a90f0..ed2de98949 100644
> --- a/target/sh4/cpu-qom.h
> +++ b/target/sh4/cpu-qom.h
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU SuperH CPU
> + * QEMU SuperH CPU QOM header (target agnostic)
>    *
>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>    *
> @@ -31,6 +31,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(SuperHCPU, SuperHCPUClass, SUPERH_CPU)
>   
> +#define SUPERH_CPU_TYPE_SUFFIX "-" TYPE_SUPERH_CPU
> +#define SUPERH_CPU_TYPE_NAME(model) model SUPERH_CPU_TYPE_SUFFIX
> +
>   /**
>    * SuperHCPUClass:
>    * @parent_realize: The parent class' realize handler.
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index f75a235973..f44b3e5b25 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -252,8 +252,6 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr);
>   
>   void cpu_load_tlb(CPUSH4State * env);
>   
> -#define SUPERH_CPU_TYPE_SUFFIX "-" TYPE_SUPERH_CPU
> -#define SUPERH_CPU_TYPE_NAME(model) model SUPERH_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_SUPERH_CPU
>   
>   #define cpu_list sh4_cpu_list
> diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
> index 78bf00b9a2..86b24a254a 100644
> --- a/target/sparc/cpu-qom.h
> +++ b/target/sparc/cpu-qom.h
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU SPARC CPU
> + * QEMU SPARC CPU QOM header (target agnostic)
>    *
>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>    *
> @@ -31,6 +31,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(SPARCCPU, SPARCCPUClass, SPARC_CPU)
>   
> +#define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
> +#define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
> +
>   typedef struct sparc_def_t sparc_def_t;
>   /**
>    * SPARCCPUClass:
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index b3a98f1d74..924e83b9ce 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -650,8 +650,6 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
>   #endif
>   #endif
>   
> -#define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
> -#define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_SPARC_CPU
>   
>   #define cpu_list sparc_cpu_list
> diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
> index 612731daa0..5368689bd9 100644
> --- a/target/tricore/cpu-qom.h
> +++ b/target/tricore/cpu-qom.h
> @@ -1,4 +1,6 @@
>   /*
> + * QEMU TriCore CPU QOM header (target agnostic)
> + *
>    *  Copyright (c) 2012-2014 Bastian Koppelmann C-Lab/University Paderborn
>    *
>    * This library is free software; you can redistribute it and/or
> @@ -26,6 +28,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(TriCoreCPU, TriCoreCPUClass, TRICORE_CPU)
>   
> +#define TRICORE_CPU_TYPE_SUFFIX "-" TYPE_TRICORE_CPU
> +#define TRICORE_CPU_TYPE_NAME(model) model TRICORE_CPU_TYPE_SUFFIX
> +
>   struct TriCoreCPUClass {
>       /*< private >*/
>       CPUClass parent_class;
> diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
> index a357b573f2..fc09590a4f 100644
> --- a/target/tricore/cpu.h
> +++ b/target/tricore/cpu.h
> @@ -270,8 +270,6 @@ static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env, vaddr *pc,
>       *flags = new_flags;
>   }
>   
> -#define TRICORE_CPU_TYPE_SUFFIX "-" TYPE_TRICORE_CPU
> -#define TRICORE_CPU_TYPE_NAME(model) model TRICORE_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_TRICORE_CPU
>   
>   /* helpers.c */
> diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
> index 419c7d8e4a..710ffa0403 100644
> --- a/target/xtensa/cpu-qom.h
> +++ b/target/xtensa/cpu-qom.h
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU Xtensa CPU
> + * QEMU Xtensa CPU QOM header (target agnostic)
>    *
>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>    * All rights reserved.
> @@ -36,6 +36,9 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(XtensaCPU, XtensaCPUClass, XTENSA_CPU)
>   
> +#define XTENSA_CPU_TYPE_SUFFIX "-" TYPE_XTENSA_CPU
> +#define XTENSA_CPU_TYPE_NAME(model) model XTENSA_CPU_TYPE_SUFFIX
> +
>   typedef struct XtensaConfig XtensaConfig;
>   
>   /**
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index c6bbef1e5d..20ea6826e4 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -588,8 +588,6 @@ G_NORETURN void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
>   
>   #define cpu_list xtensa_cpu_list
>   
> -#define XTENSA_CPU_TYPE_SUFFIX "-" TYPE_XTENSA_CPU
> -#define XTENSA_CPU_TYPE_NAME(model) model XTENSA_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_XTENSA_CPU
>   
>   #if TARGET_BIG_ENDIAN


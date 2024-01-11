Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3445C4707B
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 19:54:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO17T-00075B-1t; Thu, 11 Jan 2024 14:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rO17Q-00073h-9W; Thu, 11 Jan 2024 14:53:36 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rO17O-000810-3z; Thu, 11 Jan 2024 14:53:35 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 65496429BA;
 Thu, 11 Jan 2024 22:53:34 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1DBA460EAC;
 Thu, 11 Jan 2024 22:53:18 +0300 (MSK)
Message-ID: <3ef7f710-24a9-4ce4-9ebc-6072362656df@tls.msk.ru>
Date: Thu, 11 Jan 2024 22:53:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] target/i386: Rename tcg_cpu_FOO() to include 'x86'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Eric Farman
 <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20240111120221.35072-1-philmd@linaro.org>
 <20240111120221.35072-5-philmd@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 xsBLBETIiwkBCADh3cFB56BQYPjtMZCfK6PSLR8lw8EB20rsrPeJtd91IoNZlnCjSoxd9Th1
 bLUR8YlpRJ2rjc6O1Bc04VghqUOHgS/tYt8vLjcGWixzdhSLJgPDK3QQZPAvBjMbCt1B6euC
 WuD87Pv5Udlpnzf4aMwxkgfTusx+ynae/o+T5r7tXD+isccbC3SiGhmAPxFyY3zGcFk4+Rxc
 0tP8YY2FWE/baHu+lBDTUN79efWAkHhex1XzVZsV7ZD16rzDbXFK5m6ApvGJWlr5YDEEydTF
 WwmvwBfr4OINVxzEG/ujNiG4fpMf2NsnFGyB9aSbFjXZevB4qWkduYYW+xpK1EryszHtAAYp
 zSBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1PsLAlgQTAQoAQAIbAwYLCQgHAwIE
 FQIIAwQWAgMBAh4BAheAAhkBFiEEbuGV0Yhuj/uBDUMkRXzgoIBEZcUFAmBbcjwFCS5e6jMA
 CgkQRXzgoIBEZcUTIQgA1hPsOF82pXxbcJXBMc4zB9OQu4AlnZvERoGyw7I2222QzaN3RFuj
 Fia//mapXzpIQNF08l/AA6cx+CKPeGnXwyZfF9fLa4RfifmdNKME8C00XlqnoJDZBGzq8yMy
 LAKDxl9OQWFcDwDxV+irg5U3fbtNVhvV0kLbS2TyQ0aU5w60ERS2NcyDWplOo7AOzZWChcA4
 UFf78oVdZdCW8YDtU0uQFhA9moNnrePy1HSFqduxnlFHEI+fDj/TiOm2ci48b8SBBJOIJFjl
 SBgH8+SfT9ZqkzhN9vh3YJ49831NwASVm0x1rDHcIwWD32VFZViZ3NjehogRNH9br0PSUYOC
 3s7ATQRX2BjLAQgAnak3m0imYOkv2tO/olULFa686tlwuvl5kL0NWCdGQeXv2uMxy36szcrh
 K1uYhpiQv4r2qNd8BJtYlnYIK16N8GBdkplaDIHcBMbU4t+6bQzEIJIaWoq1hzakmHHngE2a
 pNMnUf/01GFvCRPlv3imkujE/5ILbagjtdyJaHF0wGOSlTnNT4W8j+zPJ/XK0I5EVQwtbmoc
 GY62LKxxz2pID6sPZV4zQVY4JdUQaFvOz1emnBxakkt0cq3Qnnqso1tjiy7vyH9CAwPR/48W
 fpK6dew4Fk+STYtBeixOTfSUS8qRS/wfpUeNa5RnEdTtFQ9IcjpQ/nPrvJJsu9FqwlpjMwAR
 AQABwsBlBBgBCAAPBQJX2BjLAhsMBQkSzAMAAAoJEEV84KCARGXFUKcH/jqKETECkbyPktdP
 cWVqw2ZIsmGxMkIdnZTbPwhORseGXMHadQODayhU9GWfCDdSPkWDWzMamD+qStfl9MhlVT60
 HTbo6wu1W/ogUS70qQPTY9IfsvAj6f8TlSlK0eLMa3s2UxL2oe5FkNs2CnVeRlr4Yqvp/ZQV
 6LXtew4GPRrmplUT/Cre9QIUqR4pxYCQaMoOXQQw3Y0csBwoDYUQujn3slbDJRIweHoppBzT
 rM6ZG5ldWQN3n3d71pVuv80guylX8+TSB8Mvkqwb5I36/NAFKl0CbGbTuQli7SmNiTAKilXc
 Y5Uh9PIrmixt0JrmGVRzke6+11mTjVlio/J5dCM=
In-Reply-To: <20240111120221.35072-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

11.01.2024 15:02, Philippe Mathieu-Daudé :
> The tcg_cpu_FOO() names are x86 specific, so rename
> them as x86_tcg_cpu_FOO() (as other names in this file)
> to ease navigating the code.

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>

Wow, that's a large list of recipients..

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/tcg/tcg-cpu.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
> index 6e881e9e27..e56489caea 100644
> --- a/target/i386/tcg/tcg-cpu.c
> +++ b/target/i386/tcg/tcg-cpu.c
> @@ -114,18 +114,18 @@ static const struct TCGCPUOps x86_tcg_ops = {
>   #endif /* !CONFIG_USER_ONLY */
>   };
>   
> -static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
> +static void x86_tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
>   {
>       /* for x86, all cpus use the same set of operations */
>       cc->tcg_ops = &x86_tcg_ops;
>   }
>   
> -static void tcg_cpu_class_init(CPUClass *cc)
> +static void x86_tcg_cpu_class_init(CPUClass *cc)
>   {
> -    cc->init_accel_cpu = tcg_cpu_init_ops;
> +    cc->init_accel_cpu = x86_tcg_cpu_init_ops;
>   }
>   
> -static void tcg_cpu_xsave_init(void)
> +static void x86_tcg_cpu_xsave_init(void)
>   {
>   #define XO(bit, field) \
>       x86_ext_save_areas[bit].offset = offsetof(X86XSaveArea, field);
> @@ -147,25 +147,25 @@ static void tcg_cpu_xsave_init(void)
>    * TCG-specific defaults that override cpudef models when using TCG.
>    * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
>    */
> -static PropValue tcg_default_props[] = {
> +static PropValue x86_tcg_default_props[] = {
>       { "vme", "off" },
>       { NULL, NULL },
>   };
>   
> -static void tcg_cpu_instance_init(CPUState *cs)
> +static void x86_tcg_cpu_instance_init(CPUState *cs)
>   {
>       X86CPU *cpu = X86_CPU(cs);
>       X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
>   
>       if (xcc->model) {
>           /* Special cases not set in the X86CPUDefinition structs: */
> -        x86_cpu_apply_props(cpu, tcg_default_props);
> +        x86_cpu_apply_props(cpu, x86_tcg_default_props);
>       }
>   
> -    tcg_cpu_xsave_init();
> +    x86_tcg_cpu_xsave_init();
>   }
>   
> -static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
> +static void x86_tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
>   {
>       AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>   
> @@ -173,18 +173,18 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
>       acc->cpu_target_realize = tcg_cpu_realizefn;
>   #endif /* CONFIG_USER_ONLY */
>   
> -    acc->cpu_class_init = tcg_cpu_class_init;
> -    acc->cpu_instance_init = tcg_cpu_instance_init;
> +    acc->cpu_class_init = x86_tcg_cpu_class_init;
> +    acc->cpu_instance_init = x86_tcg_cpu_instance_init;
>   }
> -static const TypeInfo tcg_cpu_accel_type_info = {
> +static const TypeInfo x86_tcg_cpu_accel_type_info = {
>       .name = ACCEL_CPU_NAME("tcg"),
>   
>       .parent = TYPE_ACCEL_CPU,
> -    .class_init = tcg_cpu_accel_class_init,
> +    .class_init = x86_tcg_cpu_accel_class_init,
>       .abstract = true,
>   };
> -static void tcg_cpu_accel_register_types(void)
> +static void x86_tcg_cpu_accel_register_types(void)
>   {
> -    type_register_static(&tcg_cpu_accel_type_info);
> +    type_register_static(&x86_tcg_cpu_accel_type_info);
>   }
> -type_init(tcg_cpu_accel_register_types);
> +type_init(x86_tcg_cpu_accel_register_types);



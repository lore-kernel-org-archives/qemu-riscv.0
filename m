Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plrXn-0003cZ-NB
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 09:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plrXi-0003cA-Q0; Mon, 10 Apr 2023 09:26:48 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plrXf-0006is-PH; Mon, 10 Apr 2023 09:26:46 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAAXXJyLDjRkpV_jAQ--.55243S2;
 Mon, 10 Apr 2023 21:26:36 +0800 (CST)
Message-ID: <b17f918e-fa77-e5aa-84bb-ec29d2b6a672@iscas.ac.cn>
Date: Mon, 10 Apr 2023 21:26:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH 4/4] target/riscv: make generic cpus not static
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230410122945.77439-1-dbarboza@ventanamicro.com>
 <20230410122945.77439-5-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230410122945.77439-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAXXJyLDjRkpV_jAQ--.55243S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AFWfCw15tw18AF1DAw47Jwb_yoW7Cr48pF
 17GFZ0vFZ8JFsFv3yfJr9Fgry5tw4kW3yYg398Xw4rAa1xurWUJF4Dt3yjkr4kWFZ7Z3Wa
 ya1rAFy3Ca1Yya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
 U==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.246,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 10 Apr 2023 13:26:50 -0000


On 2023/4/10 20:29, Daniel Henrique Barboza wrote:
> A CPU is declared static or not by changing the class attribute
> 'static'. For now the base class is defining every CPU as static via
> riscv_cpu_class_init().
>
> To change this setting for generic CPUs we'll need a different class
> init for them. Then we'll ned a macro that allows us to set a different
> .class_init implementation for the CPU. With all that we're now able to
> set 'static' as false for the 'any', 'rv32', 'rv64' and 'x-rv128' CPUs.
> For the riscv64 target:
>
> $ ./build/qemu-system-riscv64 -S -M virt -display none -qmp stdio
> {"QMP": {"version": (...) }
> {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
> {"return": {}}
> {"execute": "query-cpu-definitions"}
> {"return": [
> {"name": "rv64", "typename": "rv64-riscv-cpu", "static": false, "deprecated": false},
> {"name": "sifive-e51", "typename": "sifive-e51-riscv-cpu", "static": true, "deprecated": false},
> {"name": "any", "typename": "any-riscv-cpu", "static": false, "deprecated": false},
> {"name": "x-rv128", "typename": "x-rv128-riscv-cpu", "static": false, "deprecated": false},
> {"name": "shakti-c", "typename": "shakti-c-riscv-cpu", "static": true, "deprecated": false},
> {"name": "thead-c906", "typename": "thead-c906-riscv-cpu", "static": true, "deprecated": false},
> {"name": "sifive-u54", "typename": "sifive-u54-riscv-cpu", "static": true, "deprecated": false}]
> }
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 48 ++++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 44 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 30a1e74ea6..4a9624404c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -340,6 +340,13 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
>   }
>   #endif
>   
> +static void riscv_any_cpu_class_init(ObjectClass *c, void *data)
> +{
> +    RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> +
> +    mcc->static_model = false;
> +}
> +
>   static void riscv_any_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -360,6 +367,13 @@ static void riscv_any_cpu_init(Object *obj)
>   }
>   
>   #if defined(TARGET_RISCV64)
> +static void rv64_base_cpu_class_init(ObjectClass *c, void *data)
> +{
> +    RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> +
> +    mcc->static_model = false;
> +}
> +

We needn't duplicate the similar function. They can share  a special 
class_init for general cpus.

Regards,

Weiwei li

>   static void rv64_base_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -430,6 +444,13 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>   #endif
>   }
>   
> +static void rv128_base_cpu_class_init(ObjectClass *c, void *data)
> +{
> +    RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> +
> +    mcc->static_model = false;
> +}
> +
>   static void rv128_base_cpu_init(Object *obj)
>   {
>       if (qemu_tcg_mttcg_enabled()) {
> @@ -449,6 +470,13 @@ static void rv128_base_cpu_init(Object *obj)
>   #endif
>   }
>   #else
> +static void rv32_base_cpu_class_init(ObjectClass *c, void *data)
> +{
> +    RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> +
> +    mcc->static_model = false;
> +}
> +
>   static void rv32_base_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -1779,6 +1807,14 @@ void riscv_cpu_list(void)
>           .instance_init = initfn            \
>       }
>   
> +#define DEFINE_CPU_WITH_CLASSFN(type_name, initfn, classfn) \
> +    {                                      \
> +        .name = type_name,                 \
> +        .parent = TYPE_RISCV_CPU,          \
> +        .instance_init = initfn,           \
> +        .class_init = classfn              \
> +    }
> +
>   static const TypeInfo riscv_cpu_type_infos[] = {
>       {
>           .name = TYPE_RISCV_CPU,
> @@ -1790,23 +1826,27 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>           .class_size = sizeof(RISCVCPUClass),
>           .class_init = riscv_cpu_class_init,
>       },
> -    DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
> +    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_ANY, riscv_any_cpu_init,
> +                            riscv_any_cpu_class_init),
>   #if defined(CONFIG_KVM)
>       DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
>   #endif
>   #if defined(TARGET_RISCV32)
> -    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
> +    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_BASE32, rv32_base_cpu_init,
> +                            rv32_base_cpu_class_init),
>       DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
>       DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
>       DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
>       DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
>   #elif defined(TARGET_RISCV64)
> -    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
> +    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_BASE64, rv64_base_cpu_init,
> +                            rv64_base_cpu_class_init),
> +    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_BASE128, rv128_base_cpu_init,
> +                            rv128_base_cpu_class_init),
>       DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>       DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>       DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
>       DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
>   #endif
>   };
>   



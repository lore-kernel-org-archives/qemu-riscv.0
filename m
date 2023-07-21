Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B488EB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 01:16:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMekF-0004Rv-15; Thu, 20 Jul 2023 21:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qMekD-0004RS-1H; Thu, 20 Jul 2023 21:15:45 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qMekA-0007W7-1a; Thu, 20 Jul 2023 21:15:44 -0400
Received: from [192.168.0.120] (unknown [180.175.26.191])
 by APP-01 (Coremail) with SMTP id qwCowAA3Phos3LlkivaEDA--.511S2;
 Fri, 21 Jul 2023 09:15:25 +0800 (CST)
Message-ID: <5fd0c5ea-107e-5191-2160-ccfd685a856c@iscas.ac.cn>
Date: Fri, 21 Jul 2023 09:15:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.2 v5 01/11] target/riscv/cpu.c: split CPU options
 from riscv_cpu_extensions[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230720171933.404398-1-dbarboza@ventanamicro.com>
 <20230720171933.404398-2-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230720171933.404398-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAA3Phos3LlkivaEDA--.511S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXryrJFyUJFWUJF4furyxAFb_yoWrtrWrpw
 s8GF1DKwsrJFy3A3y7tw4Dt3yFkw1ruay7tw1fXwn7AFWxGr47WF1DtFs0krsrJFWxZw42
 9a13uF1I93yqva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
 U==
X-Originating-IP: [180.175.26.191]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 2023/7/21 01:19, Daniel Henrique Barboza wrote:
> We'll add a new CPU type that will enable a considerable amount of
> extensions. To make it easier for us we'll do a few cleanups in our
> existing riscv_cpu_extensions[] array.
>
> Start by splitting all CPU non-boolean options from it. Create a new
> riscv_cpu_options[] array for them. Add all these properties in
> riscv_cpu_add_user_properties() as it is already being done today.
>
> 'mmu' and 'pmp' aren't really extensions in the usual way we think about
> RISC-V extensions. These are closer to CPU features/options, so move
> both to riscv_cpu_options[] too. In the near future we'll need to match
> all extensions with all entries in isa_edata_arr[], and so it happens
> that both 'mmu' and 'pmp' do not have a riscv,isa string (thus, no priv
> spec version restriction). This further emphasizes the point that these
> are more a CPU option than an extension.
>
> No functional changes made.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/cpu.c | 33 +++++++++++++++++++++++----------
>   1 file changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b93b04453..9a3afc0482 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1752,7 +1752,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>   
>   static Property riscv_cpu_extensions[] = {
>       /* Defaults for standard extensions */
> -    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>       DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> @@ -1764,15 +1763,8 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
>       DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
>       DEFINE_PROP_BOOL("Zve64d", RISCVCPU, cfg.ext_zve64d, false),
> -    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> -    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>       DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
>   
> -    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> -    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> -    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> -    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> -
>       DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
>       DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
>       DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> @@ -1803,9 +1795,7 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>   
>       DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> -    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
>       DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> -    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
>   
>       DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>   
> @@ -1849,6 +1839,21 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> +static Property riscv_cpu_options[] = {
> +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> +
> +    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> +    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +
> +    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> +    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> +
> +    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> +    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> +
> +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
> +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
> +};
>   
>   #ifndef CONFIG_USER_ONLY
>   static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
> @@ -1917,6 +1922,14 @@ static void riscv_cpu_add_user_properties(Object *obj)
>   #endif
>           qdev_property_add_static(dev, prop);
>       }
> +
> +    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> +        /* Check if KVM created the property already */
> +        if (object_property_find(obj, riscv_cpu_options[i].name)) {
> +            continue;
> +        }
> +        qdev_property_add_static(dev, &riscv_cpu_options[i]);
> +    }
>   }
>   
>   static Property riscv_cpu_properties[] = {



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA5FEB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 01:33:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMf17-0008R7-20; Thu, 20 Jul 2023 21:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qMf15-0008Qs-QN; Thu, 20 Jul 2023 21:33:11 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qMf13-0002ed-B5; Thu, 20 Jul 2023 21:33:11 -0400
Received: from [192.168.0.120] (unknown [180.175.26.191])
 by APP-01 (Coremail) with SMTP id qwCowABHThpO4LlkyPyFDA--.7619S2;
 Fri, 21 Jul 2023 09:33:02 +0800 (CST)
Message-ID: <6859c563-5f25-bfa0-379d-3262cd99b55b@iscas.ac.cn>
Date: Fri, 21 Jul 2023 09:33:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.2 v5 04/11] target/riscv/cpu.c: del
 DEFINE_PROP_END_OF_LIST() from riscv_cpu_extensions
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230720171933.404398-1-dbarboza@ventanamicro.com>
 <20230720171933.404398-5-dbarboza@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230720171933.404398-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowABHThpO4LlkyPyFDA--.7619S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1UGw43Jr4UJFyrWF47twb_yoW5JryDpr
 45GFW2ka48JFn7J34xXF18Cr1UKr1DW3yfKw47G347ZFWxXrWa9r1Dt3WSyFnrWFW8ua1Y
 9a1UCFyYya12yaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUU
 UU=
X-Originating-IP: [180.175.26.191]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
> This last blank element is used by the 'for' loop to check if a property
> has a valid name.
>
> Remove it and use ARRAY_SIZE() instead like riscv_cpu_options is already
> using. All future arrays will also do the same and we'll able to
> encapsulate more repetitions in macros later on.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/cpu.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7f0852a14e..4dadb7f0a0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1835,8 +1835,6 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
>       DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
>       DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
> -
> -    DEFINE_PROP_END_OF_LIST(),
>   };
>   
>   static Property riscv_cpu_options[] = {
> @@ -1894,14 +1892,13 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
>   
>   static void riscv_cpu_add_kvm_properties(Object *obj)
>   {
> -    Property *prop;
>       DeviceState *dev = DEVICE(obj);
>   
>       kvm_riscv_init_user_properties(obj);
>       riscv_cpu_add_misa_properties(obj);
>   
> -    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> -        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> +    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_extensions); i++) {
> +        riscv_cpu_add_kvm_unavail_prop(obj, riscv_cpu_extensions[i].name);
>       }
>   
>       for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> @@ -1922,7 +1919,6 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
>    */
>   static void riscv_cpu_add_user_properties(Object *obj)
>   {
> -    Property *prop;
>       DeviceState *dev = DEVICE(obj);
>   
>   #ifndef CONFIG_USER_ONLY
> @@ -1936,8 +1932,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
>   
>       riscv_cpu_add_misa_properties(obj);
>   
> -    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> -        qdev_property_add_static(dev, prop);
> +    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_extensions); i++) {
> +        qdev_property_add_static(dev, &riscv_cpu_extensions[i]);
>       }
>   
>       for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovdKA-0008A8-Co
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 06:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovdK8-00089v-VL; Thu, 17 Nov 2022 06:44:52 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovdK3-00025s-Uy; Thu, 17 Nov 2022 06:44:52 -0500
Received: from [192.168.3.6] (unknown [180.165.240.202])
 by APP-01 (Coremail) with SMTP id qwCowADX3Y2qHnZjoUcqCg--.27948S2;
 Thu, 17 Nov 2022 19:44:43 +0800 (CST)
Message-ID: <c117741e-f804-6796-796d-da9cf73dfe8a@iscas.ac.cn>
Date: Thu, 17 Nov 2022 19:44:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: liweiwei@iscas.ac.cn, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v3 7/9] target/riscv: add support for Zcmt extension
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-8-liweiwei@iscas.ac.cn>
 <da87af96-b8e0-d6d1-02d3-a4d3afe8edf0@linaro.org>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <da87af96-b8e0-d6d1-02d3-a4d3afe8edf0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADX3Y2qHnZjoUcqCg--.27948S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW8KryDtr1rtw47Jr43Jrb_yoW8GrykpF
 1kJrWUJFWUJr95Jw17Gr4DJFyrAr1UG3WDXF1kXFyUJa13AryFgr1UWrsFgF17JF4kAr4U
 AF1UXrnrZr17XrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUU
 UU=
X-Originating-IP: [180.165.240.202]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 17 Nov 2022 11:44:53 -0000


On 2022/11/17 17:56, Richard Henderson wrote:
> On 11/16/22 23:03, Weiwei Li wrote:
>> +target_ulong HELPER(cm_jalt)(CPURISCVState *env, target_ulong index,
>> +                             target_ulong next_pc)
>> +{
>> +    target_ulong target = next_pc;
>> +    target_ulong val = 0;
>> +    int xlen = riscv_cpu_xlen(env);
>> +
>> +    val = env->jvt;
>> +
>> +    uint8_t mode = get_field(val, JVT_MODE);
>> +    target_ulong base = get_field(val, JVT_BASE);
>> +
>> +    target_ulong t0;
>> +
>> +    if (mode != 0) {
>> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>> +    }
>> +
>> +    if (xlen == 32) {
>> +        t0 = base + (index << 2);
>> +        target = cpu_ldl_code(env, t0);
>> +    } else {
>> +        t0 = base + (index << 3);
>> +        target = cpu_ldq_code(env, t0);
>> +    }
>> +
>> +    /* index >= 32 for cm.jalt, otherwise for cm.jt */
>> +    if (index >= 32) {
>> +        env->gpr[1] = next_pc;
>> +    }
>> +
>> +    return target & ~0x1;
>> +}
>
> Missing a smstateen_check.  Not mentioned in the instruction 
> description itself, but it is within the State Enable section of JVT.

smstateen_check have been added in REQUIRE_ZCMT.

Regards,

Weiwei Li

>
>
> r~



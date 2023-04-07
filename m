Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkkRt-0004HR-9E
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 07:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkkRp-0004H3-6K; Fri, 07 Apr 2023 07:40:05 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkkRl-0003px-Rd; Fri, 07 Apr 2023 07:40:04 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowADn758FATBkB0uJAA--.20762S2;
 Fri, 07 Apr 2023 19:39:50 +0800 (CST)
Message-ID: <e11774cb-7917-4e55-55f0-7901a78b6c1e@iscas.ac.cn>
Date: Fri, 7 Apr 2023 19:39:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/riscv: Mask the implicitly enabled extensions in
 isa_string based on priv version
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230407033014.40901-1-liweiwei@iscas.ac.cn>
 <c65a5831-ce79-f198-f491-37707abf9f81@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <c65a5831-ce79-f198-f491-37707abf9f81@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADn758FATBkB0uJAA--.20762S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr17Kr1xuw17JFy3GFyrXrb_yoW8KrWkpr
 WkGFWUKrWDJ348Ga4Iqr1UXFyUCrZ5Wa1UJrn5Ka4UArW3AryFgr9ruw4FgF1DJrs5GrWa
 vw1DArnxZr4UXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.03,
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
X-List-Received-Date: Fri, 07 Apr 2023 11:40:05 -0000


On 2023/4/7 18:58, Daniel Henrique Barboza wrote:
>
>
> On 4/7/23 00:30, Weiwei Li wrote:
>> Using implicitly enabled extensions such as Zca/Zcf/Zcd instead of their
>> super extensions can simplify the extension related check. However, they
>> may have higher priv version than their super extensions. So we 
>> should mask
>> them in the isa_string based on priv version to make them invisible 
>> to user
>> if the specified priv version is lower than their minimal priv version.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index cb68916fce..1a5099382c 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1709,6 +1709,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, 
>> char **isa_str,
>>         for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>>           if (isa_edata_arr[i].multi_letter &&
>> +            (cpu->env.priv_ver >= isa_edata_arr[i].min_version) &&
>
> We don't have a way of telling whether an extension was enabled by us 
> or by the user.
> This will end up filtering user extensions from the isa_string.

As the method described in the 
https://lists.gnu.org/archive/html/qemu-riscv/2023-04/msg00200.html:

The user specified extension have been disabled in realize(), So what 
needs masked is the implied extensions here.

>
> IMHO, the way the logic is working today, we can't enable Z extensions 
> based on enabled
> MISA bits alone and disable extensions based on priv_spec at the same 
> time. We would
> need to check for priv_version when enabling these extensions 
> implicitly during realize().

If we check this in realize(), we also need check them in support of the 
extension. So this is unnecessary.

Regards,

Weiwei Li

> Another alternative is to not disable any extensions at all based on 
> priv spec - we send
> a warning about the priv mismatch and that's it.
>
>
> Thanks,
>
> Daniel
>
>
>
>>               isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
>>               new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>>               g_free(old);



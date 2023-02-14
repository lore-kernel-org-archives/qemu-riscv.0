Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRvc6-0007yX-IN
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 08:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRvc3-0007xs-F0; Tue, 14 Feb 2023 08:44:52 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRvc1-0000tD-Cj; Tue, 14 Feb 2023 08:44:51 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowAA3PJhLkOtjse0yBQ--.42953S2;
 Tue, 14 Feb 2023 21:44:44 +0800 (CST)
Message-ID: <55b3b8c8-9f53-a46c-8bfc-a107164e0242@iscas.ac.cn>
Date: Tue, 14 Feb 2023 21:44:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [Patch 13/14] target/riscv: Simplify check for EEW = 64 in
 trans_rvv.c.inc
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-14-liweiwei@iscas.ac.cn>
 <77307e37-6144-b8b3-ac6f-7ad3ae3aefa8@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <77307e37-6144-b8b3-ac6f-7ad3ae3aefa8@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3PJhLkOtjse0yBQ--.42953S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrW8Jr43Xry8Kw1UJF17trb_yoW5AF4xpw
 1kGrWxCryUCrn7Cw1rKr4UXFyUArW8tw1DJw1jv3WrX3y5Jr4j9r1qqr1Fgr1UJr48Jr1j
 yF15XF1fZr13XFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbd-PUUUUUU==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
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
X-List-Received-Date: Tue, 14 Feb 2023 13:44:53 -0000


On 2023/2/14 21:37, Daniel Henrique Barboza wrote:
>
>
> On 2/14/23 05:38, Weiwei Li wrote:
>> Only V extension support EEW = 64 in these case: Zve64* extensions
>> don't support EEW = 64 as commented
>
> "as commented" where? In the previous patch?
>
>
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>
> The code LGTM.
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>
>
>>   target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++--------
>>   1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc 
>> b/target/riscv/insn_trans/trans_rvv.c.inc
>> index 5dbdce073b..fc0d0d60e8 100644
>> --- a/target/riscv/insn_trans/trans_rvv.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>> @@ -1998,8 +1998,7 @@ static bool vmulh_vv_check(DisasContext *s, 
>> arg_rmrr *a)
>>        * are not included for EEW=64 in Zve64*. (Section 18.2)
>>        */
".... are not included for EEW=64 in Zve64*. (Section 18.2) "

The comment is here, and similar comments can be found in following code.

Regards,

Weiwei Li

>>       return opivv_check(s, a) &&
>> -           (!has_ext(s, RVV) &&
>> -            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
>> +           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
>>   }
>>     static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
>> @@ -2012,8 +2011,7 @@ static bool vmulh_vx_check(DisasContext *s, 
>> arg_rmrr *a)
>>        * are not included for EEW=64 in Zve64*. (Section 18.2)
>>        */
>>       return opivx_check(s, a) &&
>> -           (!has_ext(s, RVV) &&
>> -            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
>> +           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
>>   }
>>     GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
>> @@ -2230,8 +2228,7 @@ static bool vsmul_vv_check(DisasContext *s, 
>> arg_rmrr *a)
>>        * for EEW=64 in Zve64*. (Section 18.2)
>>        */
>>       return opivv_check(s, a) &&
>> -           (!has_ext(s, RVV) &&
>> -            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
>> +           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
>>   }
>>     static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
>> @@ -2242,8 +2239,7 @@ static bool vsmul_vx_check(DisasContext *s, 
>> arg_rmrr *a)
>>        * for EEW=64 in Zve64*. (Section 18.2)
>>        */
>>       return opivx_check(s, a) &&
>> -           (!has_ext(s, RVV) &&
>> -            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
>> +           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
>>   }
>>     GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)



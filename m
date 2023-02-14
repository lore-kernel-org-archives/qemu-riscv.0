Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRwye-0000WF-7e
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 10:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRwyc-0000V4-DP; Tue, 14 Feb 2023 10:12:14 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRwyZ-0004L6-K8; Tue, 14 Feb 2023 10:12:14 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAC3sz_CpOtjePkXBQ--.29086S2;
 Tue, 14 Feb 2023 23:12:02 +0800 (CST)
Message-ID: <4108972e-7598-af6a-a9cd-f42d4f3477fc@iscas.ac.cn>
Date: Tue, 14 Feb 2023 23:12:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/11] target/riscv: allow users to actually write the
 MISA CSR
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 weiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
 <20230210133635.589647-3-dbarboza@ventanamicro.com>
 <2a0d5e1e-f2ff-6502-0f88-f6b3005bcaf3@iscas.ac.cn>
 <0d853c1b-7554-1813-693f-e31a62ef9298@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <0d853c1b-7554-1813-693f-e31a62ef9298@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3sz_CpOtjePkXBQ--.29086S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr4kWF4xKr47Wr43AF1kXwb_yoWrZFy7pr
 WkKFW5KrWDJr97Aa1xtF1jqFy8Zw1UGay3Kw1kWF18Jr43GrWY9FnFqF1q9F1DCF4rZr42
 qF45CFy7ZrsFvF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbnmRUUUUU
 U==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
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
X-List-Received-Date: Tue, 14 Feb 2023 15:12:14 -0000


On 2023/2/11 19:50, Daniel Henrique Barboza wrote:
>
>
> On 2/10/23 23:43, weiwei wrote:
>>
>> On 2023/2/10 21:36, Daniel Henrique Barboza wrote:
>>> At this moment, and apparently since ever, we have no way of enabling
>>> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
>>> the nuts and bolts that handles how to properly write this CSR, has
>>> always been a no-op as well because write_misa() will always exit
>>> earlier.
>>>
>>> This seems to be benign in the majority of cases. Booting an Ubuntu
>>> 'virt' guest and logging all the calls to 'write_misa' shows that no
>>> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
>>> RISC-V extensions after the machine is powered on, seems to be a niche
>>> use.
>>>
>>> There is a good chance that the code in write_misa() hasn't been
>>> properly tested. Allowing users to write MISA can open the 
>>> floodgates of
>>> new breeds of bugs. We could instead remove most (if not all) of
>>> write_misa() since it's never used. Well, as a hardware emulator,
>>> dealing with crashes because a register write went wrong is what we're
>>> here for.
>>>
>>> Create a 'misa-w' CPU property to allow users to choose whether writes
>>> to MISA should be allowed. The default is set to 'false' for all RISC-V
>>> machines to keep compatibility with what we´ve been doing so far.
>>>
>>> Read cpu->cfg.misa_w directly in write_misa(), instead of executing
>>> riscv_set_feature(RISCV_FEATURE_MISA) in riscv_cpu_realize(), that 
>>> would
>>> simply reflect the cpu->cfg.misa_w bool value in 'env->features' and
>>> require a riscv_feature() call to read it back.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   target/riscv/cpu.c | 1 +
>>>   target/riscv/cpu.h | 1 +
>>>   target/riscv/csr.c | 4 +++-
>>>   3 files changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 93b52b826c..69fb9e123f 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -1197,6 +1197,7 @@ static void register_cpu_props(DeviceState *dev)
>>>   static Property riscv_cpu_properties[] = {
>>>       DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>>> +    DEFINE_PROP_BOOL("misa-w", RISCVCPU, cfg.misa_w, false),
>>>       DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
>>>       DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, 
>>> RISCV_CPU_MARCHID),
>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> index 7128438d8e..103963b386 100644
>>> --- a/target/riscv/cpu.h
>>> +++ b/target/riscv/cpu.h
>>> @@ -498,6 +498,7 @@ struct RISCVCPUConfig {
>>>       bool pmp;
>>>       bool epmp;
>>>       bool debug;
>>> +    bool misa_w;
>>>       bool short_isa_string;
>>>   };
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index e149b453da..4f9cc501b2 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -1329,7 +1329,9 @@ static RISCVException read_misa(CPURISCVState 
>>> *env, int csrno,
>>>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>>>                                    target_ulong val)
>>>   {
>>> -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
>>> +    RISCVCPU *cpu = env_archcpu(env);
>>> +
>>> +    if (!cpu->cfg.misa_w) {
>>
>> It's Ok to get it directly from cfg. However, personally, I prefer to 
>> keep the non-isa features in a separate list.
>
> I don't mind a separated non-isa list. cpu->cfg has everything 
> contained in it
> though, ISA and non-ISA (e.g. vendor extensions that weren't ratified 
> yet), and
> the current RISCV_FEATURES_* list is just a duplicate of it that we 
> need to
> update it during riscv_cpu_realize().
>
> In my opinion we can spare the extra effort of keeping a separated, 
> up-to-date
> non-ISA extension/features list, by just reading everything from cfg.
>
>
> Thanks,
>
>
> Daniel

OK. It's  acceptable to me.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

By the way, the riscv_cpu_cfg() in patch 4 can be used here.

Regards,

Weiwei Li

>
>>
>> Regards,
>>
>> Weiwei Li
>>
>>>           /* drop write to misa */
>>>           return RISCV_EXCP_NONE;
>>>       }
>>



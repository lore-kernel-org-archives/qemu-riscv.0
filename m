Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prq4I-0006hI-TW
	for mharc-qemu-riscv@gnu.org; Wed, 26 Apr 2023 21:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1prq4H-0006gw-0P; Wed, 26 Apr 2023 21:05:05 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1prq4D-0007M3-QZ; Wed, 26 Apr 2023 21:05:04 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowACXnp4zyklk+AV+Cw--.45761S2;
 Thu, 27 Apr 2023 09:04:52 +0800 (CST)
Message-ID: <3e14b76b-7aa7-4a98-ac97-11725f4664bf@iscas.ac.cn>
Date: Thu, 27 Apr 2023 09:04:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 alistair.francis@wdc.com, Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH v2 3/4] target/riscv: check smstateen fcsr flag
To: Mayuresh Chitale <mchitale@ventanamicro.com>
References: <20230414160202.1298242-1-mchitale@ventanamicro.com>
 <20230414160202.1298242-4-mchitale@ventanamicro.com>
 <615227a7-0406-8c52-d08c-e5d225909d6f@iscas.ac.cn>
 <CAN37VV5yCOx6P2No33_pyhuKEma9RoE95gV07kQ2g98mQf14JQ@mail.gmail.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <CAN37VV5yCOx6P2No33_pyhuKEma9RoE95gV07kQ2g98mQf14JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXnp4zyklk+AV+Cw--.45761S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFW3CF47Aryruw4DXF4kXrb_yoWrKry5pr
 WrGayYyrWrZryIya1SqFn8Ar9Iqws7Kw4kGwnxtw1DXa98Kr43Xrs5Kr17KryxJFn7WFy8
 AayjyFW3ur4fXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUU
 UU=
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 27 Apr 2023 01:05:05 -0000


On 2023/4/27 01:18, Mayuresh Chitale wrote:
> On Sat, Apr 15, 2023 at 6:55 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>
>> On 2023/4/15 00:02, Mayuresh Chitale wrote:
>>> If misa.F and smstateen_fcsr_ok flag are clear then all the floating
>>> point instructions must generate an appropriate exception.
>>>
>>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>> ---
>>>    target/riscv/insn_trans/trans_rvd.c.inc   | 13 ++++++++----
>>>    target/riscv/insn_trans/trans_rvf.c.inc   | 24 +++++++++++++++++++----
>>>    target/riscv/insn_trans/trans_rvzfh.c.inc | 18 ++++++++++++++---
>>>    3 files changed, 44 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
>>> index 2c51e01c40..d9e0cf116f 100644
>>> --- a/target/riscv/insn_trans/trans_rvd.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
>>> @@ -18,10 +18,15 @@
>>>     * this program.  If not, see <http://www.gnu.org/licenses/>.
>>>     */
>>>
>>> -#define REQUIRE_ZDINX_OR_D(ctx) do { \
>>> -    if (!ctx->cfg_ptr->ext_zdinx) { \
>>> -        REQUIRE_EXT(ctx, RVD); \
>>> -    } \
>>> +#define REQUIRE_ZDINX_OR_D(ctx) do {           \
>>> +    if (!has_ext(ctx, RVD)) {                  \
>>> +        if (!ctx->cfg_ptr->ext_zdinx) {        \
>>> +            return false;                      \
>>> +        }                                      \
>>> +        if (!smstateen_fcsr_check(ctx)) {      \
>>> +            return false;                      \
>>> +        }                                      \
>>> +    }                                          \
>>>    } while (0)
>>>
>>>    #define REQUIRE_EVEN(ctx, reg) do { \
>>> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
>>> index 9e9fa2087a..6bf6fe16be 100644
>>> --- a/target/riscv/insn_trans/trans_rvf.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
>>> @@ -24,10 +24,26 @@
>>>                return false; \
>>>    } while (0)
>>>
>>> -#define REQUIRE_ZFINX_OR_F(ctx) do {\
>>> -    if (!ctx->cfg_ptr->ext_zfinx) { \
>>> -        REQUIRE_EXT(ctx, RVF); \
>>> -    } \
>>> +static inline bool smstateen_fcsr_check(DisasContext *ctx)
>>> +{
>>> +#ifndef CONFIG_USER_ONLY
>>> +    if (!has_ext(ctx, RVF) && !ctx->smstateen_fcsr_ok) {
>> We needn't check RVF here. Two reasons:
>>
>> 1. This check only be done when RVF is diabled.
>>
>> 2. ctx->smstateen_fcsr_ok is always be true (set in last patch) when RVF
>> is enabled
> Ok.
>>> +        ctx->virt_inst_excp = ctx->virt_enabled;
>>> +        return false;
>>> +    }
>>> +#endif
>>> +    return true;
>>> +}
>>> +
>>> +#define REQUIRE_ZFINX_OR_F(ctx) do {           \
>>> +    if (!has_ext(ctx, RVF)) {                  \
>>> +        if (!ctx->cfg_ptr->ext_zfinx) {        \
>>> +            return false;                      \
>>> +        }                                      \
>>> +        if (!smstateen_fcsr_check(ctx)) {      \
>>> +            return false;                      \
>>> +        }                                      \
>>> +    }                                          \
>>>    } while (0)
>>>
>>>    #define REQUIRE_ZCF(ctx) do {                  \
>>> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
>>> index 74dde37ff7..74a125e4c0 100644
>>> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
>>> @@ -16,28 +16,40 @@
>>>     * this program.  If not, see <http://www.gnu.org/licenses/>.
>>>     */
>>>
>>> -#define REQUIRE_ZFH(ctx) do { \
>>> +#define REQUIRE_ZFH(ctx) do {          \
>>>        if (!ctx->cfg_ptr->ext_zfh) {      \
>>> -        return false;         \
>>> -    }                         \
>>> +        return false;                  \
>>> +    }                                  \
>>> +    if (!smstateen_fcsr_check(ctx)) {  \
>>> +        return false;                  \
>>> +    }                                  \
>> This is unnecessary here. This check is only for Zhinx.
>>
>> Similar to REQUIRE_ZFHMIN.
>>
>>>    } while (0)
>>>
>>>    #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
>>>        if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
>>>            return false;                  \
>>>        }                                  \
>>> +    if (!smstateen_fcsr_check(ctx)) {  \
>>> +        return false;                  \
>>> +    }                                  \
>> This check is only for Zhinx here. So it's better to take the similar
>> way as REQUIRE_ZFINX_OR_F.
>>
>> Similar to REQUIRE_ZFHMIN_OR_ZHINXMIN.
> I am not sure I follow the comments above.
> The FCSR check is applicable to all the extensions ie zfinx, zdinx,
> zhinx and zhinxmin.

Yeah. FCSR check is applicable to all Z*inx extensions, but unnecessary 
for Zfh.  So I think it's better to be:

       if (!ctx->cfg_ptr->ext_zfh) {                                \
           if (!ctx->cfg_ptr->ext_zhinx)) {                         \
               return false;                                        \
           }                                                        \
           if (!smstateen_fcsr_check(ctx)) {                        \
               return false;                                        \
           }                                                        \
       }

Regards,

Weiwei Li

>> Regards,
>>
>> Weiwei Li
>>
>>>    } while (0)
>>>
>>>    #define REQUIRE_ZFHMIN(ctx) do {              \
>>>        if (!ctx->cfg_ptr->ext_zfhmin) {          \
>>>            return false;                         \
>>>        }                                         \
>>> +    if (!smstateen_fcsr_check(ctx)) {         \
>>> +        return false;                         \
>>> +    }                                         \
>>>    } while (0)
>>>
>>>    #define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {                 \
>>>        if (!(ctx->cfg_ptr->ext_zfhmin || ctx->cfg_ptr->ext_zhinxmin)) { \
>>>            return false;                                        \
>>>        }                                                        \
>>> +    if (!smstateen_fcsr_check(ctx)) {                        \
>>> +        return false;                                        \
>>> +    }                                                        \
>>>    } while (0)
>>>
>>>    static bool trans_flh(DisasContext *ctx, arg_flh *a)



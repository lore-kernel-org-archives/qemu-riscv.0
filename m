Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nt38g-0002gm-CE
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 04:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nt38X-0002e6-RJ; Mon, 23 May 2022 04:10:03 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:48060 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nt38P-00028M-P5; Mon, 23 May 2022 04:09:53 -0400
Received: from [192.168.0.105] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAC3v4c8QYtiyhzSCQ--.51870S2;
 Mon, 23 May 2022 16:09:35 +0800 (CST)
Subject: Re: [PATCH] target/riscv: add support for zmmul extension v0.1
To: Alistair Francis <alistair23@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220518015316.20504-1-liweiwei@iscas.ac.cn>
 <CAKmqyKNBQo91af1m5t_wDOVMeh=6uYD9Q+KugoTOQYzQJUtf5w@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <3ed635e4-5705-007c-be5c-edd07936758d@iscas.ac.cn>
Date: Mon, 23 May 2022 16:09:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNBQo91af1m5t_wDOVMeh=6uYD9Q+KugoTOQYzQJUtf5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAC3v4c8QYtiyhzSCQ--.51870S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr4fZryxWry3KryUCw18Grg_yoWrKw4Upr
 W8GFW7AFs8tFySvayIyan0qF1xJanagw47t39ayw4kJayfKrWDCF1DK3yakr4UAFyv9r1j
 y3WjyFnxZ3y0qa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUU
 UU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 23 May 2022 08:10:05 -0000


在 2022/5/23 下午2:34, Alistair Francis 写道:
> On Wed, May 18, 2022 at 11:54 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>   - includes all multiplication operations for M extension
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu.c                      |  2 ++
>>   target/riscv/cpu.h                      |  1 +
>>   target/riscv/insn_trans/trans_rvm.c.inc | 18 ++++++++++++------
>>   3 files changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index e373c61ba2..01b57d3784 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -903,6 +903,7 @@ static Property riscv_cpu_properties[] = {
>>
>>       /* These are experimental so mark with 'x-' */
>>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>> +    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
> Is this really experimental?
>
> Alistair

I think it's experimental currently. The zmmul version in latest riscv 
spec is v0.1, even though described as  v1.0 in spike README.

Its specification status 
(https://wiki.riscv.org/display/home/specification+status) is Freeze 
Complete and TSC Sign-Off Voting.

And It's not in the ratified extension 
list(https://wiki.riscv.org/display/home/recently+ratified+extensions).

Any status update I missed?

Regards,

Weiwei Li

>>       /* ePMP 0.9.3 */
>>       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>>       DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>> @@ -1027,6 +1028,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>>        *    extensions by an underscore.
>>        */
>>       struct isa_ext_data isa_edata_arr[] = {
>> +        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
>>           ISA_EDATA_ENTRY(zfh, ext_zfh),
>>           ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>>           ISA_EDATA_ENTRY(zfinx, ext_zfinx),
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index f5ff7294c6..68177eae12 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -405,6 +405,7 @@ struct RISCVCPUConfig {
>>       bool ext_zhinxmin;
>>       bool ext_zve32f;
>>       bool ext_zve64f;
>> +    bool ext_zmmul;
>>
>>       uint32_t mvendorid;
>>       uint64_t marchid;
>> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
>> index 16b029edf0..ec7f705aab 100644
>> --- a/target/riscv/insn_trans/trans_rvm.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
>> @@ -18,6 +18,12 @@
>>    * this program.  If not, see <http://www.gnu.org/licenses/>.
>>    */
>>
>> +#define REQUIRE_M_OR_ZMMUL(ctx) do {                      \
>> +    if (!ctx->cfg_ptr->ext_zmmul && !has_ext(ctx, RVM)) { \
>> +        return false;                                     \
>> +    }                                                     \
>> +} while (0)
>> +
>>   static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, TCGv bh)
>>   {
>>       TCGv tmpl = tcg_temp_new();
>> @@ -65,7 +71,7 @@ static void gen_mul_i128(TCGv rl, TCGv rh,
>>
>>   static bool trans_mul(DisasContext *ctx, arg_mul *a)
>>   {
>> -    REQUIRE_EXT(ctx, RVM);
>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>       return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, gen_mul_i128);
>>   }
>>
>> @@ -109,7 +115,7 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
>>
>>   static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
>>   {
>> -    REQUIRE_EXT(ctx, RVM);
>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>       return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w,
>>                               gen_mulh_i128);
>>   }
>> @@ -161,7 +167,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
>>
>>   static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
>>   {
>> -    REQUIRE_EXT(ctx, RVM);
>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>       return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w,
>>                               gen_mulhsu_i128);
>>   }
>> @@ -176,7 +182,7 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
>>
>>   static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
>>   {
>> -    REQUIRE_EXT(ctx, RVM);
>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>       /* gen_mulh_w works for either sign as input. */
>>       return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w,
>>                               gen_mulhu_i128);
>> @@ -349,7 +355,7 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a)
>>   static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
>>   {
>>       REQUIRE_64_OR_128BIT(ctx);
>> -    REQUIRE_EXT(ctx, RVM);
>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>       ctx->ol = MXL_RV32;
>>       return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
>>   }
>> @@ -389,7 +395,7 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
>>   static bool trans_muld(DisasContext *ctx, arg_muld *a)
>>   {
>>       REQUIRE_128BIT(ctx);
>> -    REQUIRE_EXT(ctx, RVM);
>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>       ctx->ol = MXL_RV64;
>>       return gen_arith(ctx, a, EXT_SIGN, tcg_gen_mul_tl, NULL);
>>   }
>> --
>> 2.17.1
>>
>>



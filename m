Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgzgQ-00089t-C9
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 23:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgzgO-00085j-Qr; Mon, 27 Mar 2023 23:07:36 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgzgL-0001PO-VR; Mon, 27 Mar 2023 23:07:36 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAA3P0vrWSJkPk70Fw--.47819S2;
 Tue, 28 Mar 2023 11:07:24 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------BFQHy7s11fzXel81ofyw15vz"
Message-ID: <052a7215-4c24-e0b4-fcd0-c713aaa949c2@iscas.ac.cn>
Date: Tue, 28 Mar 2023 11:07:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] target/riscv: Use sign-extended data address when xl
 = 32
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-3-liweiwei@iscas.ac.cn>
 <821f3122-ea3e-f770-1b88-6b512a22cfbe@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <821f3122-ea3e-f770-1b88-6b512a22cfbe@linux.alibaba.com>
X-CM-TRANSID: qwCowAA3P0vrWSJkPk70Fw--.47819S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ary7Jw15tFWfXF1UXw4kCrg_yoW8CFy5pF
 1xKw42grykJFZ7ZFWxtw4UXr15GFn5CFWjk3sa9w1rurWaqr45CFWqk3y5ta1kWFWxWFWj
 9rsF9Fy5Za1jgrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0E
 x4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5V
 A0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l7480Y4vEI4kI2Ix0rVAq
 x4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjfUwYFCUUUUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 28 Mar 2023 03:07:37 -0000

This is a multi-part message in MIME format.
--------------BFQHy7s11fzXel81ofyw15vz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/3/28 10:14, LIU Zhiwei wrote:
>
>
> On 2023/3/27 18:00, Weiwei Li wrote:
>> Currently, the pc use signed-extend(in gen_set_pc*) when xl = 32. And
>> data address should use the same memory address space with it when
>> xl = 32. So we should change their address calculation to use sign-extended
>> address when xl = 32.
>
> Incorrect. PC sign-extend is mandated by the spec. It can be seen for 
> gdb or the OS. But for the memory address for xl = 32, it's the qemu 
> internal implementation.
>
Yeah, there is no spec description for the memory address for xlen = 32. 
But it seems  easier to use the original (sign-extended) pc in this case.

We needn't cut the pc in cpu_get_tb_cpu_state and sign-extend it in 
riscv_cpu_synchronize_from_tb.

Regards,

Weiwei Li

> We should not to make it too complex.
>
> Even for the PC, when fectch instruction, we only use the low 32-bits, 
> as you can see  from the cpu_get_tb_cpu_state.
>
> *pc = cpu_get_xl(env) == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
>
> Zhiwei
>
>> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/translate.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index bf0e2d318e..c48cb19389 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -570,7 +570,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>>       tcg_gen_addi_tl(addr, src1, imm);
>>   
>>       if (get_xl(ctx) == MXL_RV32) {
>> -        tcg_gen_ext32u_tl(addr, addr);
>> +        tcg_gen_ext32s_tl(addr, addr);
>>       }
>>   
>>       if (ctx->pm_mask_enabled) {
>> @@ -592,7 +592,7 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
>>       tcg_gen_add_tl(addr, src1, offs);
>>   
>>       if (get_xl(ctx) == MXL_RV32) {
>> -        tcg_gen_ext32u_tl(addr, addr);
>> +        tcg_gen_ext32s_tl(addr, addr);
>>       }
>>   
>>       if (ctx->pm_mask_enabled) {
--------------BFQHy7s11fzXel81ofyw15vz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/3/28 10:14, LIU Zhiwei wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:821f3122-ea3e-f770-1b88-6b512a22cfbe@linux.alibaba.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2023/3/27 18:00, Weiwei Li wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20230327100027.61160-3-liweiwei@iscas.ac.cn">
        <pre class="moz-quote-pre" wrap="">Currently, the pc use signed-extend(in gen_set_pc*) when xl = 32. And
data address should use the same memory address space with it when
xl = 32. So we should change their address calculation to use sign-extended
address when xl = 32.</pre>
      </blockquote>
      <p>Incorrect. PC sign-extend is mandated by the spec. It can be
        seen for gdb or the OS. But for the memory address for xl = 32,
        it's the qemu internal implementation.</p>
    </blockquote>
    <p>Yeah, there is no spec description for the memory address for
      xlen = 32. But it seems  easier to use the original
      (sign-extended) pc in this case.</p>
    <p>We needn't cut the pc in cpu_get_tb_cpu_state and sign-extend it
      in <span style="color: #000000;">riscv_cpu_synchronize_from_tb.</span></p>
    <p><span style="color: #000000;">Regards,</span></p>
    <p><span style="color: #000000;">Weiwei Li<br>
      </span></p>
    <blockquote type="cite"
      cite="mid:821f3122-ea3e-f770-1b88-6b512a22cfbe@linux.alibaba.com">
      <p>We should not to make it too complex.</p>
      <p>Even for the PC, when fectch instruction, we only use the low
        32-bits, as you can see  from the cpu_get_tb_cpu_state.</p>
      <pre>*pc = cpu_get_xl(env) == MXL_RV32 ? env-&gt;pc &amp; UINT32_MAX : env-&gt;pc;
</pre>
      <p>Zhiwei<br>
      </p>
      <blockquote type="cite"
        cite="mid:20230327100027.61160-3-liweiwei@iscas.ac.cn">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Weiwei Li <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn" moz-do-not-send="true">&lt;liweiwei@iscas.ac.cn&gt;</a>
Signed-off-by: Junqiang Wang <a class="moz-txt-link-rfc2396E" href="mailto:wangjunqiang@iscas.ac.cn" moz-do-not-send="true">&lt;wangjunqiang@iscas.ac.cn&gt;</a>
---
 target/riscv/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index bf0e2d318e..c48cb19389 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -570,7 +570,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
     tcg_gen_addi_tl(addr, src1, imm);
 
     if (get_xl(ctx) == MXL_RV32) {
-        tcg_gen_ext32u_tl(addr, addr);
+        tcg_gen_ext32s_tl(addr, addr);
     }
 
     if (ctx-&gt;pm_mask_enabled) {
@@ -592,7 +592,7 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
     tcg_gen_add_tl(addr, src1, offs);
 
     if (get_xl(ctx) == MXL_RV32) {
-        tcg_gen_ext32u_tl(addr, addr);
+        tcg_gen_ext32s_tl(addr, addr);
     }
 
     if (ctx-&gt;pm_mask_enabled) {
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------BFQHy7s11fzXel81ofyw15vz--



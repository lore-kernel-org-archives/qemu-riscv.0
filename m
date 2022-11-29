Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozpaS-0007S2-8T
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 20:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ozpaQ-0007Re-86; Mon, 28 Nov 2022 20:39:02 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ozpaM-0003lq-T1; Mon, 28 Nov 2022 20:39:01 -0500
Received: from [192.168.3.6] (unknown [180.175.30.174])
 by APP-01 (Coremail) with SMTP id qwCowAAnLzOnYoVjUOksAw--.19368S2;
 Tue, 29 Nov 2022 09:38:48 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------w7meOOcTNhT2yqnKQHY3yrUz"
Message-ID: <3f606e08-749a-22a5-d4a5-6668fb2dab81@iscas.ac.cn>
Date: Tue, 29 Nov 2022 09:38:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 2/9] target/riscv: add support for Zca extension
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "liweiwei@iscas.ac.cn" <liweiwei@iscas.ac.cn>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "wangjunqiang@iscas.ac.cn" <wangjunqiang@iscas.ac.cn>,
 "lazyparser@gmail.com" <lazyparser@gmail.com>
References: <20221128122913.55611-1-liweiwei@iscas.ac.cn>
 <20221128122913.55611-3-liweiwei@iscas.ac.cn>
 <421c4ba3559b6d83e8a348766b7a77f9e1268bf8.camel@wdc.com>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <421c4ba3559b6d83e8a348766b7a77f9e1268bf8.camel@wdc.com>
X-CM-TRANSID: qwCowAAnLzOnYoVjUOksAw--.19368S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr13Xw1rAr18WFyrur17Wrg_yoW5uw1Dpr
 yrCr4UGryUJryfJF4DJF4jqryUJr4UGw1UJw1kXa1kJFW3Jr4YqF1qgry2gr1UJF4kXr1j
 vF4UZr15Za1UXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mx8GjcxK6IxK0xIIj40E
 5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfUwYFCUUUUU
X-Originating-IP: [180.175.30.174]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 29 Nov 2022 01:39:02 -0000

This is a multi-part message in MIME format.
--------------w7meOOcTNhT2yqnKQHY3yrUz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/11/29 07:06, Wilfred Mallawa wrote:
> On Mon, 2022-11-28 at 20:29 +0800, Weiwei Li wrote:
>> Modify the check for C extension to Zca (C implies Zca)
>>
>> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
>> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
>> Reviewed-by: Alistair Francis<alistair.francis@wdc.com>
>> ---
>>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>>   target/riscv/translate.c                | 8 ++++++--
>>   2 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc
>> b/target/riscv/insn_trans/trans_rvi.c.inc
>> index 4496f21266..ef7c3002b0 100644
>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr
>> *a)
>>       tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>>   
>>       gen_set_pc(ctx, cpu_pc);
>> -    if (!has_ext(ctx, RVC)) {
>> +    if (!ctx->cfg_ptr->ext_zca) {
>>           TCGv t0 = tcg_temp_new();
>>   
>>           misaligned = gen_new_label();
>> @@ -178,7 +178,7 @@ static bool gen_branch(DisasContext *ctx, arg_b
>> *a, TCGCond cond)
>>   
>>       gen_set_label(l); /* branch taken */
>>   
>> -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3))
>> {
>> +    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) &
>> 0x3)) {
>>           /* misaligned */
>>           gen_exception_inst_addr_mis(ctx);
>>       } else {
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 2ab8772ebe..ee24b451e3 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -557,7 +557,7 @@ static void gen_jal(DisasContext *ctx, int rd,
>> target_ulong imm)
>>   
>>       /* check misaligned: */
>>       next_pc = ctx->base.pc_next + imm;
>> -    if (!has_ext(ctx, RVC)) {
>> +    if (!ctx->cfg_ptr->ext_zca) {
>>           if ((next_pc & 0x3) != 0) {
>>               gen_exception_inst_addr_mis(ctx);
>>               return;
>> @@ -1097,7 +1097,11 @@ static void decode_opc(CPURISCVState *env,
>> DisasContext *ctx, uint16_t opcode)
>>       ctx->virt_inst_excp = false;
>>       /* Check for compressed insn */
>>       if (insn_len(opcode) == 2) {
>> -        if (!has_ext(ctx, RVC)) {
>> +        /*
>> +         * Zca support all of the existing C extension, excluding
>> all
>> +         * compressed floating point loads and stores
>> +         */
> Look like a typo: *`supports` and *`C extensions`

Thanks a lot!

Yeah,  it should be 'supports' here (and it's 'is' here in original Zc* 
0.70.1 spec).

Maybe we can use the new description from newest spec here:

/"The Zca extension is added as way to refer to instructions in the C 
extension that do not i/

/nclude the//floating-point loads and stores."/

By the way, why do you think it should be 'C extensions' ?/
/

Regards,

Weiwei Li

>> +        if (!ctx->cfg_ptr->ext_zca) {
>>               gen_exception_illegal(ctx);
>>           } else {
>>               ctx->opcode = opcode;
> otherwise,
> Reviewed-by: Wilfred Mallawa<wilfred.mallawa@wdc.com>
>
> Wilfred
--------------w7meOOcTNhT2yqnKQHY3yrUz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/11/29 07:06, Wilfred Mallawa
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:421c4ba3559b6d83e8a348766b7a77f9e1268bf8.camel@wdc.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 2022-11-28 at 20:29 +0800, Weiwei Li wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Modify the check for C extension to Zca (C implies Zca)

Signed-off-by: Weiwei Li <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a>
Signed-off-by: Junqiang Wang <a class="moz-txt-link-rfc2396E" href="mailto:wangjunqiang@iscas.ac.cn">&lt;wangjunqiang@iscas.ac.cn&gt;</a>
Reviewed-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
Reviewed-by: Alistair Francis <a class="moz-txt-link-rfc2396E" href="mailto:alistair.francis@wdc.com">&lt;alistair.francis@wdc.com&gt;</a>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
 target/riscv/translate.c                | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc
b/target/riscv/insn_trans/trans_rvi.c.inc
index 4496f21266..ef7c3002b0 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr
*a)
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
     gen_set_pc(ctx, cpu_pc);
-    if (!has_ext(ctx, RVC)) {
+    if (!ctx-&gt;cfg_ptr-&gt;ext_zca) {
         TCGv t0 = tcg_temp_new();
 
         misaligned = gen_new_label();
@@ -178,7 +178,7 @@ static bool gen_branch(DisasContext *ctx, arg_b
*a, TCGCond cond)
 
     gen_set_label(l); /* branch taken */
 
-    if (!has_ext(ctx, RVC) &amp;&amp; ((ctx-&gt;base.pc_next + a-&gt;imm) &amp; 0x3))
{
+    if (!ctx-&gt;cfg_ptr-&gt;ext_zca &amp;&amp; ((ctx-&gt;base.pc_next + a-&gt;imm) &amp;
0x3)) {
         /* misaligned */
         gen_exception_inst_addr_mis(ctx);
     } else {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2ab8772ebe..ee24b451e3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -557,7 +557,7 @@ static void gen_jal(DisasContext *ctx, int rd,
target_ulong imm)
 
     /* check misaligned: */
     next_pc = ctx-&gt;base.pc_next + imm;
-    if (!has_ext(ctx, RVC)) {
+    if (!ctx-&gt;cfg_ptr-&gt;ext_zca) {
         if ((next_pc &amp; 0x3) != 0) {
             gen_exception_inst_addr_mis(ctx);
             return;
@@ -1097,7 +1097,11 @@ static void decode_opc(CPURISCVState *env,
DisasContext *ctx, uint16_t opcode)
     ctx-&gt;virt_inst_excp = false;
     /* Check for compressed insn */
     if (insn_len(opcode) == 2) {
-        if (!has_ext(ctx, RVC)) {
+        /*
+         * Zca support all of the existing C extension, excluding
all
+         * compressed floating point loads and stores
+         */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Look like a typo: *`supports` and *`C extensions`</pre>
    </blockquote>
    <p>Thanks a lot!  <br>
    </p>
    <p>Yeah,  it should be 'supports' here (and it's 'is' here in
      original Zc* 0.70.1 spec). <br>
    </p>
    <p>Maybe we can use the new description from newest spec here:</p>
    <p><i>"The Zca extension is added as way to refer to instructions in
        the C extension that do not i</i></p>
    <p><i>nclude the</i><i> floating-point loads and stores."</i></p>
    <p>By the way, why do you think it should be 'C extensions' ?<i><br>
      </i></p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
      cite="mid:421c4ba3559b6d83e8a348766b7a77f9e1268bf8.camel@wdc.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        if (!ctx-&gt;cfg_ptr-&gt;ext_zca) {
             gen_exception_illegal(ctx);
         } else {
             ctx-&gt;opcode = opcode;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
otherwise,
Reviewed-by: Wilfred Mallawa <a class="moz-txt-link-rfc2396E" href="mailto:wilfred.mallawa@wdc.com">&lt;wilfred.mallawa@wdc.com&gt;</a>

Wilfred
</pre>
    </blockquote>
  </body>
</html>

--------------w7meOOcTNhT2yqnKQHY3yrUz--



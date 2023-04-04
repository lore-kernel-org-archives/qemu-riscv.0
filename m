Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjhjM-0005Tn-Rg
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 10:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjhjG-0005QM-40; Tue, 04 Apr 2023 10:33:46 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjhjB-0004ZT-Ne; Tue, 04 Apr 2023 10:33:44 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowADHzUkzNSxkWLDLGg--.15797S2;
 Tue, 04 Apr 2023 22:33:23 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------dBagsI9phAph2Sd8orhKyq0G"
Message-ID: <f466aa0b-1312-d8ba-c2d6-d386038df781@iscas.ac.cn>
Date: Tue, 4 Apr 2023 22:33:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v6 4/6] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-5-liweiwei@iscas.ac.cn>
 <f0923f4b-e5e5-b648-6c77-4a5a151a9b6c@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <f0923f4b-e5e5-b648-6c77-4a5a151a9b6c@linaro.org>
X-CM-TRANSID: qwCowADHzUkzNSxkWLDLGg--.15797S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GF4UKw4xurWkCr4rCFy7GFg_yoW8JF45p3
 4rGrnFyFWDJFW0ya4kWw4kuFy3Xw4fGw4DGwn2yasayF4SqrW2grWFqrWS93s5XrZ3W3yr
 Za1Yyw1qvF43AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mx8GjcxK6IxK0xIIj40E5I8C
 rwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
 cVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUtkuxUUUUU=
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.925, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 04 Apr 2023 14:33:46 -0000

This is a multi-part message in MIME format.
--------------dBagsI9phAph2Sd8orhKyq0G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/4/4 21:56, Richard Henderson wrote:
> On 4/3/23 19:06, Weiwei Li wrote:
>>   static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>>   {
>> -    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
>> +    TCGv target_pc = dest_gpr(ctx, a->rd);
>> +    gen_pc_plus_diff(target_pc, ctx, a->imm + ctx->base.pc_next);
>> +    gen_set_gpr(ctx, a->rd, target_pc);
>>       return true;
>>   }
>
> This is not how I expect a function called "pc plus diff" to work.

Yeah, it's different from the similar function in ARM.

However, it's more in line with the original RISC-V logic.

Maybe we can change a name for the function, such as 
gen_pc_relative_address().

> It should be simpler:
>
>
>     TCGv rd = dest_gpr(ctx, a->rd);
>
>     gen_pc_plus_diff(ctx, rd, a->imm);
>     gen_set_gpr(ctx, a->rd, rd);
>
> All of the manipulation of cpu_pc, pc_save, and pc_next are all hidden 
> inside the function.  All that "add upper immediate to pc" should do 
> is supply the immediate.

If we want to hide all of them in gen_pc_plus_diff,  then we need 
calculate the diff for pc_succ_insn or introduce a new API for it, since 
we need get the successor pc in many instructions.

And the logic for gen_goto_tb or gen_set_pc_imm also need update.

Regards,

Weiwei Li

>
>
> r~
--------------dBagsI9phAph2Sd8orhKyq0G
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/4/4 21:56, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f0923f4b-e5e5-b648-6c77-4a5a151a9b6c@linaro.org">On
      4/3/23 19:06, Weiwei Li wrote:
      <br>
      <blockquote type="cite">  static bool trans_auipc(DisasContext
        *ctx, arg_auipc *a)
        <br>
          {
        <br>
        -    gen_set_gpri(ctx, a-&gt;rd, a-&gt;imm +
        ctx-&gt;base.pc_next);
        <br>
        +    TCGv target_pc = dest_gpr(ctx, a-&gt;rd);
        <br>
        +    gen_pc_plus_diff(target_pc, ctx, a-&gt;imm +
        ctx-&gt;base.pc_next);
        <br>
        +    gen_set_gpr(ctx, a-&gt;rd, target_pc);
        <br>
              return true;
        <br>
          }
        <br>
      </blockquote>
      <br>
      This is not how I expect a function called "pc plus diff" to work.
      <br>
    </blockquote>
    <p>Yeah, it's different from the similar function in ARM.</p>
    <p>However, it's more in line with the original RISC-V logic.</p>
    <p><span style="color: #000000;">Maybe we can change a name for the
        function, such as gen_pc_relative_address().</span></p>
    <blockquote type="cite"
      cite="mid:f0923f4b-e5e5-b648-6c77-4a5a151a9b6c@linaro.org">It
      should be simpler:
      <br>
      <br>
      <br>
          TCGv rd = dest_gpr(ctx, a-&gt;rd);
      <br>
      <br>
          gen_pc_plus_diff(ctx, rd, a-&gt;imm);
      <br>
          gen_set_gpr(ctx, a-&gt;rd, rd);
      <br>
      <br>
      All of the manipulation of cpu_pc, pc_save, and pc_next are all
      hidden inside the function.  All that "add upper immediate to pc"
      should do is supply the immediate.
      <br>
    </blockquote>
    <p>If we want to hide all of them in gen_pc_plus_diff,  then we need
      calculate the diff for <span style="color: #000000;">pc_succ_insn</span>
      or introduce a new API for it, since we need get the successor pc
      in many instructions.</p>
    <p>And the logic for <span style="color: #000000;">gen_goto_tb or
        gen_set_pc_imm also need update.</span></p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
      cite="mid:f0923f4b-e5e5-b648-6c77-4a5a151a9b6c@linaro.org">
      <br>
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------dBagsI9phAph2Sd8orhKyq0G--



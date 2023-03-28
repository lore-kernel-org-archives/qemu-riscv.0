Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgyr9-0002So-Sv
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 22:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgyr8-0002SV-2H; Mon, 27 Mar 2023 22:14:38 -0400
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgyr5-0001U1-Bo; Mon, 27 Mar 2023 22:14:37 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Ver7R.G_1679969662; 
Received: from 30.221.98.176(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Ver7R.G_1679969662) by smtp.aliyun-inc.com;
 Tue, 28 Mar 2023 10:14:23 +0800
Content-Type: multipart/alternative;
 boundary="------------iWjV2prEssxD3MLKXec67WsS"
Message-ID: <821f3122-ea3e-f770-1b88-6b512a22cfbe@linux.alibaba.com>
Date: Tue, 28 Mar 2023 10:14:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] target/riscv: Use sign-extended data address when xl
 = 32
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-3-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230327100027.61160-3-liweiwei@iscas.ac.cn>
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Mar 2023 02:14:38 -0000

This is a multi-part message in MIME format.
--------------iWjV2prEssxD3MLKXec67WsS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/3/27 18:00, Weiwei Li wrote:
> Currently, the pc use signed-extend(in gen_set_pc*) when xl = 32. And
> data address should use the same memory address space with it when
> xl = 32. So we should change their address calculation to use sign-extended
> address when xl = 32.

Incorrect. PC sign-extend is mandated by the spec. It can be seen for 
gdb or the OS. But for the memory address for xl = 32, it's the qemu 
internal implementation.

We should not to make it too complex.

Even for the PC, when fectch instruction, we only use the low 32-bits, 
as you can see  from the cpu_get_tb_cpu_state.

*pc = cpu_get_xl(env) == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;

Zhiwei

>
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index bf0e2d318e..c48cb19389 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -570,7 +570,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>       tcg_gen_addi_tl(addr, src1, imm);
>   
>       if (get_xl(ctx) == MXL_RV32) {
> -        tcg_gen_ext32u_tl(addr, addr);
> +        tcg_gen_ext32s_tl(addr, addr);
>       }
>   
>       if (ctx->pm_mask_enabled) {
> @@ -592,7 +592,7 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
>       tcg_gen_add_tl(addr, src1, offs);
>   
>       if (get_xl(ctx) == MXL_RV32) {
> -        tcg_gen_ext32u_tl(addr, addr);
> +        tcg_gen_ext32s_tl(addr, addr);
>       }
>   
>       if (ctx->pm_mask_enabled) {
--------------iWjV2prEssxD3MLKXec67WsS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
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
    <p>Incorrect. PC sign-extend is mandated by the spec. It can be seen
      for gdb or the OS. But for the memory address for xl = 32, it's
      the qemu internal implementation.</p>
    <p>We should not to make it too complex.</p>
    <p>Even for the PC, when fectch instruction, we only use the low
      32-bits, as you can see  from the cpu_get_tb_cpu_state.</p>
    <pre>*pc = cpu_get_xl(env) == MXL_RV32 ? env-&gt;pc &amp; UINT32_MAX : env-&gt;pc;
</pre>
    <p>Zhiwei<br>
    </p>
    <blockquote type="cite"
      cite="mid:20230327100027.61160-3-liweiwei@iscas.ac.cn">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Weiwei Li <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a>
Signed-off-by: Junqiang Wang <a class="moz-txt-link-rfc2396E" href="mailto:wangjunqiang@iscas.ac.cn">&lt;wangjunqiang@iscas.ac.cn&gt;</a>
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
  </body>
</html>

--------------iWjV2prEssxD3MLKXec67WsS--


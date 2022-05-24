Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntKEw-0002md-5a
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 22:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ntKEu-0002mP-LE; Mon, 23 May 2022 22:25:40 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:58118 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ntKEq-00076D-MM; Mon, 23 May 2022 22:25:40 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAC3vo4VQoxio83_CQ--.27078S2;
 Tue, 24 May 2022 10:25:26 +0800 (CST)
Subject: Re: [PATCH] target/riscv: add support for zmmul extension v0.1
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220518015316.20504-1-liweiwei@iscas.ac.cn>
 <CAKmqyKNBQo91af1m5t_wDOVMeh=6uYD9Q+KugoTOQYzQJUtf5w@mail.gmail.com>
 <3ed635e4-5705-007c-be5c-edd07936758d@iscas.ac.cn>
 <CAKmqyKPBqGvvE1LLu3s3zHNYJqhT=OKD5tLU02gmKfPdsBcy8w@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <d1e5e7b3-f508-77c2-a95a-3e6feb98a230@iscas.ac.cn>
Date: Tue, 24 May 2022 10:25:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPBqGvvE1LLu3s3zHNYJqhT=OKD5tLU02gmKfPdsBcy8w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------8F9916AEAE48DB5BC891310B"
Content-Language: en-US
X-CM-TRANSID: qwCowAC3vo4VQoxio83_CQ--.27078S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WryDWFWfGr47Wry3Cry5twb_yoW7WFWfpF
 W8WryIyF4DtFyfAa97Jw4qqF18Gan3K3y7t39ayws5GF4fGrZ8ZF1DK3yakr15JFykZF1a
 v3WjyFnxZw4jva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfUeID7DUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 24 May 2022 02:25:41 -0000

This is a multi-part message in MIME format.
--------------8F9916AEAE48DB5BC891310B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/5/24 上午5:15, Alistair Francis 写道:
> On Mon, May 23, 2022 at 6:10 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>
>> 在 2022/5/23 下午2:34, Alistair Francis 写道:
>>> On Wed, May 18, 2022 at 11:54 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>>>    - includes all multiplication operations for M extension
>>>>
>>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>>> ---
>>>>    target/riscv/cpu.c                      |  2 ++
>>>>    target/riscv/cpu.h                      |  1 +
>>>>    target/riscv/insn_trans/trans_rvm.c.inc | 18 ++++++++++++------
>>>>    3 files changed, 15 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>> index e373c61ba2..01b57d3784 100644
>>>> --- a/target/riscv/cpu.c
>>>> +++ b/target/riscv/cpu.c
>>>> @@ -903,6 +903,7 @@ static Property riscv_cpu_properties[] = {
>>>>
>>>>        /* These are experimental so mark with 'x-' */
>>>>        DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>>>> +    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
>>> Is this really experimental?
>>>
>>> Alistair
>> I think it's experimental currently. The zmmul version in latest riscv
>> spec is v0.1, even though described as  v1.0 in spike README.
> Hmm... Your right that it is only v0.1, but there is no indication of
> draft state in the RISC-V spec chapter on Zmmul
>
>> Its specification status
>> (https://wiki.riscv.org/display/home/specification+status) is Freeze
>> Complete and TSC Sign-Off Voting.
>>
>> And It's not in the ratified extension
>> list(https://wiki.riscv.org/display/home/recently+ratified+extensions).
>>
>> Any status update I missed?
> Confusing. Ok, I guess let's leave it as experimental, we can always
> remove the `x-` easily :)
>
>> Regards,
>>
>> Weiwei Li
>>
>>>>        /* ePMP 0.9.3 */
>>>>        DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>>>>        DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>>>> @@ -1027,6 +1028,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>>>>         *    extensions by an underscore.
>>>>         */
>>>>        struct isa_ext_data isa_edata_arr[] = {
>>>> +        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
> We should have some checks though. We don't want users to enable this
> and the multiply (M) extension
>
>
> Alistair

Maybe we can add a check like this:

/* M + Zmmul = Zmmul */
if (cpu->cfg.ext_m && cpu->cfg.ext_zmmul) {
warn_report("Zmmul will override M");
cpu->cfg.ext_m = false;
}

It seems OK to enable both M and Zmmul in gnu toolchain. However, divide 
operations

will be disabled when Zmmul is enabled.

Regards,

Weiwei Li

>>>>            ISA_EDATA_ENTRY(zfh, ext_zfh),
>>>>            ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>>>>            ISA_EDATA_ENTRY(zfinx, ext_zfinx),
>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>> index f5ff7294c6..68177eae12 100644
>>>> --- a/target/riscv/cpu.h
>>>> +++ b/target/riscv/cpu.h
>>>> @@ -405,6 +405,7 @@ struct RISCVCPUConfig {
>>>>        bool ext_zhinxmin;
>>>>        bool ext_zve32f;
>>>>        bool ext_zve64f;
>>>> +    bool ext_zmmul;
>>>>
>>>>        uint32_t mvendorid;
>>>>        uint64_t marchid;
>>>> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
>>>> index 16b029edf0..ec7f705aab 100644
>>>> --- a/target/riscv/insn_trans/trans_rvm.c.inc
>>>> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
>>>> @@ -18,6 +18,12 @@
>>>>     * this program.  If not, see <http://www.gnu.org/licenses/>.
>>>>     */
>>>>
>>>> +#define REQUIRE_M_OR_ZMMUL(ctx) do {                      \
>>>> +    if (!ctx->cfg_ptr->ext_zmmul && !has_ext(ctx, RVM)) { \
>>>> +        return false;                                     \
>>>> +    }                                                     \
>>>> +} while (0)
>>>> +
>>>>    static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, TCGv bh)
>>>>    {
>>>>        TCGv tmpl = tcg_temp_new();
>>>> @@ -65,7 +71,7 @@ static void gen_mul_i128(TCGv rl, TCGv rh,
>>>>
>>>>    static bool trans_mul(DisasContext *ctx, arg_mul *a)
>>>>    {
>>>> -    REQUIRE_EXT(ctx, RVM);
>>>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>>>        return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, gen_mul_i128);
>>>>    }
>>>>
>>>> @@ -109,7 +115,7 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
>>>>
>>>>    static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
>>>>    {
>>>> -    REQUIRE_EXT(ctx, RVM);
>>>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>>>        return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w,
>>>>                                gen_mulh_i128);
>>>>    }
>>>> @@ -161,7 +167,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
>>>>
>>>>    static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
>>>>    {
>>>> -    REQUIRE_EXT(ctx, RVM);
>>>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>>>        return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w,
>>>>                                gen_mulhsu_i128);
>>>>    }
>>>> @@ -176,7 +182,7 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
>>>>
>>>>    static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
>>>>    {
>>>> -    REQUIRE_EXT(ctx, RVM);
>>>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>>>        /* gen_mulh_w works for either sign as input. */
>>>>        return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w,
>>>>                                gen_mulhu_i128);
>>>> @@ -349,7 +355,7 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a)
>>>>    static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
>>>>    {
>>>>        REQUIRE_64_OR_128BIT(ctx);
>>>> -    REQUIRE_EXT(ctx, RVM);
>>>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>>>        ctx->ol = MXL_RV32;
>>>>        return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
>>>>    }
>>>> @@ -389,7 +395,7 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
>>>>    static bool trans_muld(DisasContext *ctx, arg_muld *a)
>>>>    {
>>>>        REQUIRE_128BIT(ctx);
>>>> -    REQUIRE_EXT(ctx, RVM);
>>>> +    REQUIRE_M_OR_ZMMUL(ctx);
>>>>        ctx->ol = MXL_RV64;
>>>>        return gen_arith(ctx, a, EXT_SIGN, tcg_gen_mul_tl, NULL);
>>>>    }
>>>> --
>>>> 2.17.1
>>>>
>>>>

--------------8F9916AEAE48DB5BC891310B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/5/24 上午5:15, Alistair Francis
      写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAKmqyKPBqGvvE1LLu3s3zHNYJqhT=OKD5tLU02gmKfPdsBcy8w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, May 23, 2022 at 6:10 PM Weiwei Li <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

在 2022/5/23 下午2:34, Alistair Francis 写道:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, May 18, 2022 at 11:54 AM Weiwei Li <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">  - includes all multiplication operations for M extension

Signed-off-by: Weiwei Li <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a>
Signed-off-by: Junqiang Wang <a class="moz-txt-link-rfc2396E" href="mailto:wangjunqiang@iscas.ac.cn">&lt;wangjunqiang@iscas.ac.cn&gt;</a>
---
  target/riscv/cpu.c                      |  2 ++
  target/riscv/cpu.h                      |  1 +
  target/riscv/insn_trans/trans_rvm.c.inc | 18 ++++++++++++------
  3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e373c61ba2..01b57d3784 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -903,6 +903,7 @@ static Property riscv_cpu_properties[] = {

      /* These are experimental so mark with 'x-' */
      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
+    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Is this really experimental?

Alistair
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I think it's experimental currently. The zmmul version in latest riscv
spec is v0.1, even though described as  v1.0 in spike README.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hmm... Your right that it is only v0.1, but there is no indication of
draft state in the RISC-V spec chapter on Zmmul

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Its specification status
(<a class="moz-txt-link-freetext" href="https://wiki.riscv.org/display/home/specification+status">https://wiki.riscv.org/display/home/specification+status</a>) is Freeze
Complete and TSC Sign-Off Voting.

And It's not in the ratified extension
list(<a class="moz-txt-link-freetext" href="https://wiki.riscv.org/display/home/recently+ratified+extensions">https://wiki.riscv.org/display/home/recently+ratified+extensions</a>).

Any status update I missed?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Confusing. Ok, I guess let's leave it as experimental, we can always
remove the `x-` easily :)

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,

Weiwei Li

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">      /* ePMP 0.9.3 */
      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
@@ -1027,6 +1028,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
       *    extensions by an underscore.
       */
      struct isa_ext_data isa_edata_arr[] = {
+        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We should have some checks though. We don't want users to enable this
and the multiply (M) extension


Alistair
</pre>
    </blockquote>
    <p>Maybe we can add a check like this:<font face="monospace"><span
          style="color: #000000;"> <br>
        </span></font></p>
    <div style="color: #000000;background-color: #ffffff;font-family: 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback';font-weight: normal;font-size: 18px;line-height: 24px;white-space: pre;"><div><span style="color: #000000;">        </span><font color="#0e170a">/* M + Zmmul = Zmmul */</font></div><div><font color="#0e170a">        if (cpu-&gt;cfg.ext_m &amp;&amp; cpu-&gt;cfg.ext_zmmul) {</font></div><div><font color="#0e170a">            warn_report("Zmmul will override M");</font></div><div><font color="#0e170a">            cpu-&gt;cfg.ext_m = false;</font></div><div><font color="#0e170a">        }</font></div><div><span style="color: #000000;">
</span></div></div>
    <p><font face="monospace"><span style="color: #000000;"></span></font></p>
    <p><font face="monospace"><span style="color: #000000;"></span></font></p>
    <p><font face="monospace"><span style="color: #000000;">It seems OK
          to enable both M and Zmmul in gnu toolchain. However, divide
          operations</span></font></p>
    <div>
      <p><font face="monospace"><span style="color: #000000;">will be
            disabled when Zmmul is enabled.</span></font></p>
      <p><font face="monospace"><span style="color: #000000;">Regards,</span></font></p>
      <p><font face="monospace"><span style="color: #000000;">Weiwei Li<br>
          </span></font></p>
    </div>
    <blockquote type="cite"
cite="mid:CAKmqyKPBqGvvE1LLu3s3zHNYJqhT=OKD5tLU02gmKfPdsBcy8w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">          ISA_EDATA_ENTRY(zfh, ext_zfh),
          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5ff7294c6..68177eae12 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -405,6 +405,7 @@ struct RISCVCPUConfig {
      bool ext_zhinxmin;
      bool ext_zve32f;
      bool ext_zve64f;
+    bool ext_zmmul;

      uint32_t mvendorid;
      uint64_t marchid;
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 16b029edf0..ec7f705aab 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -18,6 +18,12 @@
   * this program.  If not, see <a class="moz-txt-link-rfc2396E" href="http://www.gnu.org/licenses/">&lt;http://www.gnu.org/licenses/&gt;</a>.
   */

+#define REQUIRE_M_OR_ZMMUL(ctx) do {                      \
+    if (!ctx-&gt;cfg_ptr-&gt;ext_zmmul &amp;&amp; !has_ext(ctx, RVM)) { \
+        return false;                                     \
+    }                                                     \
+} while (0)
+
  static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, TCGv bh)
  {
      TCGv tmpl = tcg_temp_new();
@@ -65,7 +71,7 @@ static void gen_mul_i128(TCGv rl, TCGv rh,

  static bool trans_mul(DisasContext *ctx, arg_mul *a)
  {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
      return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, gen_mul_i128);
  }

@@ -109,7 +115,7 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)

  static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
  {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
      return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w,
                              gen_mulh_i128);
  }
@@ -161,7 +167,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)

  static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
  {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
      return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w,
                              gen_mulhsu_i128);
  }
@@ -176,7 +182,7 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)

  static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
  {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
      /* gen_mulh_w works for either sign as input. */
      return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w,
                              gen_mulhu_i128);
@@ -349,7 +355,7 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a)
  static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
  {
      REQUIRE_64_OR_128BIT(ctx);
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
      ctx-&gt;ol = MXL_RV32;
      return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
  }
@@ -389,7 +395,7 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
  static bool trans_muld(DisasContext *ctx, arg_muld *a)
  {
      REQUIRE_128BIT(ctx);
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
      ctx-&gt;ol = MXL_RV64;
      return gen_arith(ctx, a, EXT_SIGN, tcg_gen_mul_tl, NULL);
  }
--
2.17.1


</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------8F9916AEAE48DB5BC891310B--



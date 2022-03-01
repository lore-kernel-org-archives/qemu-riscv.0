Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOsFO-0003dl-4o
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 21:28:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOsFI-0003cw-8i; Mon, 28 Feb 2022 21:28:12 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:49690 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOsFC-0006Cf-Ac; Mon, 28 Feb 2022 21:28:09 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowACnrsKqhB1iDT19AQ--.22023S2;
 Tue, 01 Mar 2022 10:27:56 +0800 (CST)
Subject: Re: [PATCH v7 12/14] target/riscv: rvk: add CSR support for Zkr
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-13-liweiwei@iscas.ac.cn>
 <0879f52c-165b-75f2-82e1-761013816f03@linaro.org>
 <72840ca4-9dde-e496-da85-75547f37a096@iscas.ac.cn>
Message-ID: <07c003f8-b34b-0da0-2298-ff3be5fd7655@iscas.ac.cn>
Date: Tue, 1 Mar 2022 10:27:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <72840ca4-9dde-e496-da85-75547f37a096@iscas.ac.cn>
Content-Type: multipart/alternative;
 boundary="------------144B4F0BE331C4E0BE852860"
Content-Language: en-US
X-CM-TRANSID: rQCowACnrsKqhB1iDT19AQ--.22023S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw17Jr4rGFyDCF4DKw1rZwb_yoW5Zw43pr
 y8tr4UArWUJr48Gr1UtryUXry5Gry5Jw45Jw1vqa4DJry5JryYqr1UXrZ0gr1DGr48Kr1U
 JF45Jrn8ZF1DXFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mx8GjcxK6IxK0xIIj40E
 5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSsjbUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Tue, 01 Mar 2022 02:28:14 -0000

This is a multi-part message in MIME format.
--------------144B4F0BE331C4E0BE852860
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/3/1 上午9:44, Weiwei Li 写道:
>
> 在 2022/3/1 上午4:11, Richard Henderson 写道:
>> On 2/28/22 04:48, Weiwei Li wrote:
>>> +/* Crypto Extension */
>>> +static RISCVException rmw_seed(CPURISCVState *env, int csrno,
>>> +                              target_ulong *ret_value,
>>> +                              target_ulong new_value, target_ulong 
>>> write_mask)
>>> +{
>>> +    if (!write_mask) {
>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>> +    }
>>
>> This is incorrect.  The error should only be with a write-mask of the 
>> actual x0 register, not another register which happens to contain 0.  
>> There is in fact no way to diagnose exactly what you want here, which 
>> IIRC has an existing fixme comment somewhere.
> Yeah. write_mask is also used in riscv_csrrw_check to check whether 
> the read-only csr is written. We cannot distinguish x0 and reg which 
> contains 0  here without changing total progress of csr read/write.
>>
I seems misunderstand the code for csr read/write:  write_mask will be 
set zero only for read-only operation (CSRRS/CSRRC with rs1=x0 or 
CSRRSI/CSRRCI with uimm=0) via do_csrr --> helper_csrr -> riscv_csrrw 
call-chain.

The write_mask for do_csrw and do_csrrw will not be zero.

As said in the spec :

"TheseedCSR must be accessed with a read-write instruction. A read-only 
instruction such asCSRRS/CSRRC
withrs1=x0orCSRRSI/CSRRCIwithuimm=0will raise an illegal instruction 
exception. "

So it's suitable to check write_mask here.

>>> +    uint32_t return_status = SEED_OPST_ES16;
>>> +
>>> +    *ret_value = return_status;
>>> +    if (return_status == SEED_OPST_ES16) {
>>> +        uint16_t random_number;
>>> +        qemu_guest_getrandom_nofail(&random_number, 
>>> sizeof(random_number));
>>> +        *ret_value = (*ret_value) | random_number;
>>> +    } else if (return_status == SEED_OPST_BIST) {
>>> +        /* Do nothing */
>>> +    } else if (return_status == SEED_OPST_WAIT) {
>>> +        /* Do nothing */
>>> +    } else if (return_status == SEED_OPST_DEAD) {
>>> +        /* Do nothing */
>>> +    }
>>
>> This is also incorrect.  This should be
>>
>>     uint32_t result;
>>     uint16_t random_v;
>>     Error *random_e = NULL;
>>     int random_r;
>>
>>     random_r = guest_getrandom(&random_v, 2, &random_e);
>>     if (unlikely(random_r < 0)) {
>>         /*
>>          * Failed, for unknown reasons in the crypto subsystem.
>>          * The best we can do is log the reason and return a
>>          * failure indication to the guest.  There is no reason
>>          * we know to expect the failure to be transitory, so
>>          * indicate DEAD to avoid having the guest spin on WAIT.
>>          */
>>         qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
>>                       __func__, error_get_pretty(random_e));
>>         error_free(random_e);
>>         result = SEED_OPST_DEAD;
>>     } else {
>>         result = random_v | SEED_OPST_ES16;
>>     }
>>
>> C.f. target/arm/helper.c, rndr_readfn.
>
> OK.  I'll fix this.
>
> Regards,
>
> Weiwei Li
>
>>
>>
>> r~

--------------144B4F0BE331C4E0BE852860
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/3/1 上午9:44, Weiwei Li 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:72840ca4-9dde-e496-da85-75547f37a096@iscas.ac.cn">
      <br>
      在 2022/3/1 上午4:11, Richard Henderson 写道:
      <br>
      <blockquote type="cite">On 2/28/22 04:48, Weiwei Li wrote:
        <br>
        <blockquote type="cite">+/* Crypto Extension */
          <br>
          +static RISCVException rmw_seed(CPURISCVState *env, int csrno,
          <br>
          +                              target_ulong *ret_value,
          <br>
          +                              target_ulong new_value,
          target_ulong write_mask)
          <br>
          +{
          <br>
          +    if (!write_mask) {
          <br>
          +        return RISCV_EXCP_ILLEGAL_INST;
          <br>
          +    }
          <br>
        </blockquote>
        <br>
        This is incorrect.  The error should only be with a write-mask
        of the actual x0 register, not another register which happens to
        contain 0.  There is in fact no way to diagnose exactly what you
        want here, which IIRC has an existing fixme comment somewhere.
        <br>
      </blockquote>
      Yeah. write_mask is also used in riscv_csrrw_check to check
      whether the read-only csr is written. We cannot distinguish x0 and
      reg which contains 0  here without changing total progress of csr
      read/write.
      <br>
      <blockquote type="cite">
        <br>
      </blockquote>
    </blockquote>
    <p>I seems misunderstand the code for csr read/write:  write_mask
      will be set zero only for read-only operation (CSRRS/CSRRC with
      rs1=x0 or CSRRSI/CSRRCI with uimm=0) via do_csrr --&gt;
      helper_csrr -&gt; riscv_csrrw call-chain. <br>
    </p>
    <p>The write_mask for do_csrw and do_csrrw will not be zero. <br>
    </p>
    <p>As said in the spec :<br>
    </p>
    <p>"<span style="left: 80.4px; top: 690.954px; font-size: 17.5px;
        font-family: sans-serif; transform: scaleX(0.932386);"
        role="presentation" dir="ltr">The</span><span style="left:
        109.118px; top: 690.954px; font-size: 17.5px; font-family:
        sans-serif;" role="presentation" dir="ltr"> </span><span
        style="left: 117.035px; top: 690.521px; font-size: 17.5px;
        font-family: monospace; transform: scaleX(0.872231);"
        role="presentation" dir="ltr">seed</span><span style="left:
        153.785px; top: 690.521px; font-size: 17.5px; font-family:
        monospace;" role="presentation" dir="ltr"> </span><span
        style="left: 161.703px; top: 690.954px; font-size: 17.5px;
        font-family: sans-serif; transform: scaleX(0.916069);"
        role="presentation" dir="ltr">CSR must be accessed with a
        read-write instruction. A read-only instruction such as</span><span
        style="left: 777.668px; top: 690.954px; font-size: 17.5px;
        font-family: sans-serif;" role="presentation" dir="ltr"> </span><span
        style="left: 810.671px; top: 690.521px; font-size: 17.5px;
        font-family: monospace; transform: scaleX(0.872231);"
        role="presentation" dir="ltr">CSRRS/CSRRC</span><br
        role="presentation">
      <span style="left: 80.4px; top: 714.454px; font-size: 17.5px;
        font-family: sans-serif; transform: scaleX(0.873383);"
        role="presentation" dir="ltr">with</span><span style="left:
        111.9px; top: 714.454px; font-size: 17.5px; font-family:
        sans-serif;" role="presentation" dir="ltr"> </span><span
        style="left: 118.547px; top: 714.021px; font-size: 17.5px;
        font-family: monospace; transform: scaleX(0.872231);"
        role="presentation" dir="ltr">rs1=x0</span><span style="left:
        173.672px; top: 714.021px; font-size: 17.5px; font-family:
        monospace;" role="presentation" dir="ltr"> </span><span
        style="left: 180.318px; top: 714.454px; font-size: 17.5px;
        font-family: sans-serif; transform: scaleX(0.847651);"
        role="presentation" dir="ltr">or</span><span style="left:
        195.053px; top: 714.454px; font-size: 17.5px; font-family:
        sans-serif;" role="presentation" dir="ltr"> </span><span
        style="left: 201.699px; top: 714.021px; font-size: 17.5px;
        font-family: monospace; transform: scaleX(0.872231);"
        role="presentation" dir="ltr">CSRRSI/CSRRCI</span><span
        style="left: 321.137px; top: 714.021px; font-size: 17.5px;
        font-family: monospace;" role="presentation" dir="ltr"> </span><span
        style="left: 327.783px; top: 714.454px; font-size: 17.5px;
        font-family: sans-serif; transform: scaleX(0.873383);"
        role="presentation" dir="ltr">with</span><span style="left:
        359.283px; top: 714.454px; font-size: 17.5px; font-family:
        sans-serif;" role="presentation" dir="ltr"> </span><span
        style="left: 365.93px; top: 714.021px; font-size: 17.5px;
        font-family: monospace; transform: scaleX(0.872231);"
        role="presentation" dir="ltr">uimm=0</span><span style="left:
        421.055px; top: 714.021px; font-size: 17.5px; font-family:
        monospace;" role="presentation" dir="ltr"> </span><span
        style="left: 427.701px; top: 714.454px; font-size: 17.5px;
        font-family: sans-serif; transform: scaleX(0.916146);"
        role="presentation" dir="ltr">will raise an illegal instruction
        exception. </span>"<br>
    </p>
    <p>So it's suitable to check write_mask here.</p>
    <p><span style="left: 365.93px; top: 714.021px; font-size: 17.5px;
        font-family: monospace; transform: scaleX(0.872231);"
        role="presentation" dir="ltr"></span></p>
    <span style="left: 365.93px; top: 714.021px; font-size: 17.5px;
      font-family: monospace; transform: scaleX(0.872231);"
      role="presentation" dir="ltr"></span><span style="left: 421.055px;
      top: 714.021px; font-size: 17.5px; font-family: monospace;"
      role="presentation" dir="ltr"></span>
    <blockquote type="cite"
      cite="mid:72840ca4-9dde-e496-da85-75547f37a096@iscas.ac.cn">
      <blockquote type="cite">
        <blockquote type="cite">+    uint32_t return_status =
          SEED_OPST_ES16;
          <br>
          +
          <br>
          +    *ret_value = return_status;
          <br>
          +    if (return_status == SEED_OPST_ES16) {
          <br>
          +        uint16_t random_number;
          <br>
          +        qemu_guest_getrandom_nofail(&amp;random_number,
          sizeof(random_number));
          <br>
          +        *ret_value = (*ret_value) | random_number;
          <br>
          +    } else if (return_status == SEED_OPST_BIST) {
          <br>
          +        /* Do nothing */
          <br>
          +    } else if (return_status == SEED_OPST_WAIT) {
          <br>
          +        /* Do nothing */
          <br>
          +    } else if (return_status == SEED_OPST_DEAD) {
          <br>
          +        /* Do nothing */
          <br>
          +    }
          <br>
        </blockquote>
        <br>
        This is also incorrect.  This should be
        <br>
        <br>
            uint32_t result;
        <br>
            uint16_t random_v;
        <br>
            Error *random_e = NULL;
        <br>
            int random_r;
        <br>
        <br>
            random_r = guest_getrandom(&amp;random_v, 2, &amp;random_e);
        <br>
            if (unlikely(random_r &lt; 0)) {
        <br>
                /*
        <br>
                 * Failed, for unknown reasons in the crypto subsystem.
        <br>
                 * The best we can do is log the reason and return a
        <br>
                 * failure indication to the guest.  There is no reason
        <br>
                 * we know to expect the failure to be transitory, so
        <br>
                 * indicate DEAD to avoid having the guest spin on WAIT.
        <br>
                 */
        <br>
                qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
        <br>
                              __func__, error_get_pretty(random_e));
        <br>
                error_free(random_e);
        <br>
                result = SEED_OPST_DEAD;
        <br>
            } else {
        <br>
                result = random_v | SEED_OPST_ES16;
        <br>
            }
        <br>
        <br>
        C.f. target/arm/helper.c, rndr_readfn.
        <br>
      </blockquote>
      <br>
      OK.  I'll fix this.
      <br>
      <br>
      Regards,
      <br>
      <br>
      Weiwei Li
      <br>
      <br>
      <blockquote type="cite">
        <br>
        <br>
        r~
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------144B4F0BE331C4E0BE852860--



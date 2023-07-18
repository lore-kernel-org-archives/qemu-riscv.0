Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E1CC001DE
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 02:17:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLaHU-00076t-C9; Mon, 17 Jul 2023 22:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qLaHT-00076g-32; Mon, 17 Jul 2023 22:17:39 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qLaHQ-0006zL-09; Mon, 17 Jul 2023 22:17:38 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0Vnfj.mK_1689646644; 
Received: from 30.221.100.194(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vnfj.mK_1689646644) by smtp.aliyun-inc.com;
 Tue, 18 Jul 2023 10:17:25 +0800
Content-Type: multipart/alternative;
 boundary="------------0Z0ykRfNzhR1u4loeKdT9jmJ"
Message-ID: <035b6d20-daa0-eac1-afa1-21ccf775a1f4@linux.alibaba.com>
Date: Tue, 18 Jul 2023 10:16:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/riscv: Fix LMUL check to use minimum SEW
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, Rob Bradford <rbradford@rivosinc.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230706104433.16264-1-rbradford@rivosinc.com>
 <dfc75d1f-f28d-7d2c-26f9-72086ffb54ca@iscas.ac.cn>
 <7a102598badfaa01b0e0c04e4f59e81eac5a2b81.camel@rivosinc.com>
 <21bd465f-9f27-be77-cb3b-2b44b5f1e837@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <21bd465f-9f27-be77-cb3b-2b44b5f1e837@iscas.ac.cn>
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This is a multi-part message in MIME format.
--------------0Z0ykRfNzhR1u4loeKdT9jmJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/7/18 8:43, Weiwei Li wrote:
>
> On 2023/7/17 23:13, Rob Bradford wrote:
>> On Thu, 2023-07-06 at 21:22 +0800, Weiwei Li wrote:
>>> On 2023/7/6 18:44, Rob Bradford wrote:
>>>> The previous check was failing with:
>>>>
>>>> ELEN = 64 SEW = 16 and LMUL = 1/8 (encoded as 5) which is a valid
>>>> combination.
>>>>
>>>> Fix the check to correctly match the specification by using minimum
>>>> SEW
>>>> rather than the active SEW.
>>>>
>>>>   From the specification:
>>>>
>>>> "In general, the requirement is to support LMUL ≥ SEWMIN/ELEN,
>>>> where
>>>> SEWMIN is the narrowest supported SEW value and ELEN is the widest
>>>> supported SEW value. In the standard extensions, SEWMIN=8. For
>>>> standard
>>>> vector extensions with ELEN=32, fractional LMULs of 1/2 and 1/4
>>>> must be
>>>> supported. For standard vector extensions with ELEN=64, fractional
>>>> LMULs
>>>> of 1/2, 1/4, and 1/8 must be supported."
>>>>
>>>>   From inspection this new check allows:
>>>>
>>>> ELEN=64 1/2, 1/4, 1/8 (encoded as 7, 6, 5 respectfully)
>>>> ELEN=32 1/2, 1/4 (encoded as 7 and 6 respectfully)
>> Hi Weiwei Li,
>>
>> Thanks for your reply. Sorry for delay in replying i've been away.
>>
>>> This is a little confusing.  there is note in spec to explain why
>>> LMUL
>>> ≥ SEW MIN /ELEN:
>>>
>>> "When LMUL < SEW MIN /ELEN, there is no guarantee an implementation
>>> would have enough bits in the fractional vector register to store
>>>
>>> Note at least one element, as VLEN=ELEN is a valid implementation
>>> choice. For example, with VLEN=ELEN=32, and SEW MIN =8, an LMUL of
>>>
>>> 1/8 would only provide four bits of storage in a vector register."
>>>
>>> In this way, when VLEN=ELEN=64,  an LMUL of 1/8 would only provide 8
>>> bits of storage in a vector register, so it's also not suitable for
>>> sew
>>> = 16.
>>>
>>> Maybe we can explain the above description of the spec in another
>>> way:
>>> we must support lmul=1/8 when ELEN=64, but it's only available when
>>> sew = 8.
>>>
>> I'm afraid i'm not sure I agree with this comment.
>>
>> VLEN=128 ELEN=64 SEW=16 LMUL=1/8 is a perfectly reasonable
>> configuration and contradicts your statement.
>>
>> The goal of my patch was to ensure that we permit a valid configuration
>> not to also reject other invalid configurations.
>>
>> An extra check that takes into consideration VLEN would also make sense
>> to me:
>>
>> e.g. VLEN=64 LMUL=1/8 SEW=16 should be rejected
>
> Yeah. I agree. But instead of an extra check, I think VLEN is the one 
> that really works instead of ELEN.

Yes.  Currently,  we only check sew <= cpu.cfg->elen. We should also add 
a check

SEW <= VLEN * LMUL

Zhiwei

>
> Such as when ELEN=32,  LMUL=1/8 with SEW=8 is also a reasonable 
> configuration  if VLEN >= 64.
>
> Regards,
>
> Weiwei Li
>
>>
>> Cheers,
>>
>> Rob
>>
>>> Regards,
>>>
>>> Weiwei Li
>>>
>>> `
>>>
>>> Regards,
>>>
>>> Weiwei Li
>>>
>>>> Fixes: d9b7609a1fb2 ("target/riscv: rvv-1.0: configure
>>>> instructions")
>>>>
>>>> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
>>>> ---
>>>>    target/riscv/vector_helper.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/target/riscv/vector_helper.c
>>>> b/target/riscv/vector_helper.c
>>>> index 1e06e7447c..8dfd8fe484 100644
>>>> --- a/target/riscv/vector_helper.c
>>>> +++ b/target/riscv/vector_helper.c
>>>> @@ -43,9 +43,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env,
>>>> target_ulong s1,
>>>>                                                xlen - 1 -
>>>> R_VTYPE_RESERVED_SHIFT);
>>>>           if (lmul & 4) {
>>>> -        /* Fractional LMUL. */
>>>> +        /* Fractional LMUL - check LMUL >= ELEN/SEW_MIN (8) */
>>>>            if (lmul == 4 ||
>>>> -            cpu->cfg.elen >> (8 - lmul) < sew) {
>>>> +            cpu->cfg.elen >> (8 - lmul) < 8) {
>>>>                vill = true;
>>>>            }
>>>>        }
--------------0Z0ykRfNzhR1u4loeKdT9jmJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/7/18 8:43, Weiwei Li wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:21bd465f-9f27-be77-cb3b-2b44b5f1e837@iscas.ac.cn">
      <br>
      On 2023/7/17 23:13, Rob Bradford wrote:
      <br>
      <blockquote type="cite">On Thu, 2023-07-06 at 21:22 +0800, Weiwei
        Li wrote:
        <br>
        <blockquote type="cite">On 2023/7/6 18:44, Rob Bradford wrote:
          <br>
          <blockquote type="cite">The previous check was failing with:
            <br>
            <br>
            ELEN = 64 SEW = 16 and LMUL = 1/8 (encoded as 5) which is a
            valid
            <br>
            combination.
            <br>
            <br>
            Fix the check to correctly match the specification by using
            minimum
            <br>
            SEW
            <br>
            rather than the active SEW.
            <br>
            <br>
              From the specification:
            <br>
            <br>
            "In general, the requirement is to support LMUL ≥
            SEWMIN/ELEN,
            <br>
            where
            <br>
            SEWMIN is the narrowest supported SEW value and ELEN is the
            widest
            <br>
            supported SEW value. In the standard extensions, SEWMIN=8.
            For
            <br>
            standard
            <br>
            vector extensions with ELEN=32, fractional LMULs of 1/2 and
            1/4
            <br>
            must be
            <br>
            supported. For standard vector extensions with ELEN=64,
            fractional
            <br>
            LMULs
            <br>
            of 1/2, 1/4, and 1/8 must be supported."
            <br>
            <br>
              From inspection this new check allows:
            <br>
            <br>
            ELEN=64 1/2, 1/4, 1/8 (encoded as 7, 6, 5 respectfully)
            <br>
            ELEN=32 1/2, 1/4 (encoded as 7 and 6 respectfully)
            <br>
          </blockquote>
        </blockquote>
        Hi Weiwei Li,
        <br>
        <br>
        Thanks for your reply. Sorry for delay in replying i've been
        away.
        <br>
        <br>
        <blockquote type="cite">This is a little confusing.  there is 
          note in spec to explain why
          <br>
          LMUL
          <br>
          ≥ SEW MIN /ELEN:
          <br>
          <br>
          "When LMUL &lt; SEW MIN /ELEN, there is no guarantee an
          implementation
          <br>
          would have enough bits in the fractional vector register to
          store
          <br>
          <br>
          Note at least one element, as VLEN=ELEN is a valid
          implementation
          <br>
          choice. For example, with VLEN=ELEN=32, and SEW MIN =8, an
          LMUL of
          <br>
          <br>
          1/8 would only provide four bits of storage in a vector
          register."
          <br>
          <br>
          In this way, when VLEN=ELEN=64,  an LMUL of 1/8 would only
          provide 8
          <br>
          bits of storage in a vector register, so it's also not
          suitable for
          <br>
          sew
          <br>
          = 16.
          <br>
          <br>
          Maybe we can explain the above description of the spec in
          another
          <br>
          way:
          <br>
          we must support lmul=1/8 when ELEN=64, but it's only available
          when
          <br>
          sew = 8.
          <br>
          <br>
        </blockquote>
        I'm afraid i'm not sure I agree with this comment.
        <br>
        <br>
        VLEN=128 ELEN=64 SEW=16 LMUL=1/8 is a perfectly reasonable
        <br>
        configuration and contradicts your statement.
        <br>
        <br>
        The goal of my patch was to ensure that we permit a valid
        configuration
        <br>
        not to also reject other invalid configurations.
        <br>
        <br>
        An extra check that takes into consideration VLEN would also
        make sense
        <br>
        to me:
        <br>
        <br>
        e.g. VLEN=64 LMUL=1/8 SEW=16 should be rejected
        <br>
      </blockquote>
      <br>
      Yeah. I agree. But instead of an extra check, I think VLEN is the
      one that really works instead of ELEN.
      <br>
    </blockquote>
    <p>Yes.  Currently,  we only check sew &lt;= cpu.cfg-&gt;elen. We
      should also add a check</p>
    <pre>SEW &lt;= VLEN * LMUL
</pre>
    <p>Zhiwei<br>
    </p>
    <blockquote type="cite"
      cite="mid:21bd465f-9f27-be77-cb3b-2b44b5f1e837@iscas.ac.cn">
      <br>
      Such as when ELEN=32,  LMUL=1/8 with SEW=8 is also a reasonable
      configuration  if VLEN &gt;= 64.
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
        Cheers,
        <br>
        <br>
        Rob
        <br>
        <br>
        <blockquote type="cite">Regards,
          <br>
          <br>
          Weiwei Li
          <br>
          <br>
          `
          <br>
          <br>
          Regards,
          <br>
          <br>
          Weiwei Li
          <br>
          <br>
          <blockquote type="cite">Fixes: d9b7609a1fb2 ("target/riscv:
            rvv-1.0: configure
            <br>
            instructions")
            <br>
            <br>
            Signed-off-by: Rob Bradford <a class="moz-txt-link-rfc2396E" href="mailto:rbradford@rivosinc.com">&lt;rbradford@rivosinc.com&gt;</a>
            <br>
            ---
            <br>
               target/riscv/vector_helper.c | 4 ++--
            <br>
               1 file changed, 2 insertions(+), 2 deletions(-)
            <br>
            <br>
            diff --git a/target/riscv/vector_helper.c
            <br>
            b/target/riscv/vector_helper.c
            <br>
            index 1e06e7447c..8dfd8fe484 100644
            <br>
            --- a/target/riscv/vector_helper.c
            <br>
            +++ b/target/riscv/vector_helper.c
            <br>
            @@ -43,9 +43,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState
            *env,
            <br>
            target_ulong s1,
            <br>
                                                           xlen - 1 -
            <br>
            R_VTYPE_RESERVED_SHIFT);
            <br>
                      if (lmul &amp; 4) {
            <br>
            -        /* Fractional LMUL. */
            <br>
            +        /* Fractional LMUL - check LMUL &gt;= ELEN/SEW_MIN
            (8) */
            <br>
                       if (lmul == 4 ||
            <br>
            -            cpu-&gt;cfg.elen &gt;&gt; (8 - lmul) &lt; sew)
            {
            <br>
            +            cpu-&gt;cfg.elen &gt;&gt; (8 - lmul) &lt; 8) {
            <br>
                           vill = true;
            <br>
                       }
            <br>
                   }
            <br>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0Z0ykRfNzhR1u4loeKdT9jmJ--


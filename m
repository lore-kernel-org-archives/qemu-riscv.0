Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMPjQ-0006LS-Gw
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 03:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pMPjO-00066C-5S; Mon, 30 Jan 2023 03:41:38 -0500
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pMPjJ-0006v8-7j; Mon, 30 Jan 2023 03:41:37 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R381e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VaQTWCF_1675068080; 
Received: from 30.221.97.63(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VaQTWCF_1675068080) by smtp.aliyun-inc.com;
 Mon, 30 Jan 2023 16:41:21 +0800
Content-Type: multipart/alternative;
 boundary="------------R9GyhGRl0ph5OT0O0r2XcIHp"
Message-ID: <82e49515-512f-9439-ceab-6c5df3bb20e4@linux.alibaba.com>
Date: Mon, 30 Jan 2023 16:41:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 08/14] RISC-V: Adding T-Head MemPair extension
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-9-christoph.muellner@vrull.eu>
 <48ff4151-25d9-4b4d-d50a-6516000599c7@linaro.org>
 <8385d954-678e-d78d-c3ae-d74a4a902907@linux.alibaba.com>
 <7f8383f6-e860-5e3e-e89c-dfdac4e05dc5@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <7f8383f6-e860-5e3e-e89c-dfdac4e05dc5@linaro.org>
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.092, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 30 Jan 2023 08:41:38 -0000

This is a multi-part message in MIME format.
--------------R9GyhGRl0ph5OT0O0r2XcIHp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/1/30 13:43, Richard Henderson wrote:
> On 1/29/23 16:03, LIU Zhiwei wrote:
>> Thanks. It's a bug. We should load all memory addresses to  local TCG 
>> temps first.
>>
>> Do you think we should probe all the memory addresses for the store 
>> pair instructions? If so, can we avoid the use of a helper function?
>
> Depends on what the hardware does.  Even with a trap in the middle the 
> stores are restartable, since no register state changes.

I refer to the specification of LDP and STP on AARCH64. The 
specification allows

"any access performed before the exception was taken is repeated".

In detailed,

"If, according to these rules, an instruction is executed as a sequence of accesses, exceptions, including interrupts,
can be taken during that sequence, regardless of the memory type being accessed. If any of these exceptions are
returned from using their preferred return address, the instruction that generated the sequence of accesses is
re-executed, and so any access performed before the exception was taken is repeated. See also Taking an interrupt
during a multi-access load or store on page D1-4664."

However I see the implementation of LDP and STP on QEMU are in different 
ways. LDP will only load the first register when it ensures no trap in 
the second access.

So I have two questions here.

1) One for the QEMU implementation about LDP. Can we implement the LDP 
as two directly loads to cpu registers instead of local TCG temps?

2) One for the comment. Why register state changes cause 
non-restartable? Do you mean if the first register changes, it may 
influence the calculation of address after the trap?

"Even with a trap in the middle the stores are restartable, since no register state changes."

>
> But if you'd like no changes verifying both stores, for this case you 
> can pack the pair into a larger data type: TCGv_i64 for pair of 
> 32-bit, and TCGv_i128 for pair of 64-bit.
> Patches for TCGv_i128 [1] are just finishing review; patches to 
> describe atomicity of the larger operation are also on list [2]. 
> Anyway, the idea is that you issue one TCG memory operation, the 
> entire operation is validated, and then the stores happen.
>
>
>> The main reason is that assembler can do this check. Is it necessary 
>> to check this in QEMU?
>
> Yes.  Conciser what happens when the insn is encoded with .long. Does 
> the hardware trap an illegal instruction?  Is the behavior simply 
> unspecified?  The manual could be improved to specify, akin to the Arm 
> terms: UNDEFINED, CONSTRAINED UNPREDICTABLE, IMPLEMENTATION DEFINED, etc.
>
>
Thanks, I will fix the manual.

Best Regards,
Zhiwei

> r~
>
> [1] 
> https://patchew.org/QEMU/20230126043824.54819-1-richard.henderson@linaro.org/
> [2] 
> https://patchew.org/QEMU/20221118094754.242910-1-richard.henderson@linaro.org/
--------------R9GyhGRl0ph5OT0O0r2XcIHp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/1/30 13:43, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7f8383f6-e860-5e3e-e89c-dfdac4e05dc5@linaro.org">On
      1/29/23 16:03, LIU Zhiwei wrote:
      <br>
      <blockquote type="cite">Thanks. It's a bug. We should load all
        memory addresses to  local TCG temps first.
        <br>
        <br>
        Do you think we should probe all the memory addresses for the
        store pair instructions? If so, can we avoid the use of a helper
        function?
        <br>
      </blockquote>
      <br>
      Depends on what the hardware does.  Even with a trap in the middle
      the stores are restartable, since no register state changes.
      <br>
    </blockquote>
    <p>I refer to the specification of LDP and STP on AARCH64. The
      specification allows <br>
    </p>
    <pre>"any access performed before the exception was taken is repeated".

</pre>
    In detailed,<br>
    <pre>"If, according to these rules, an instruction is executed as a sequence of accesses, exceptions, including interrupts,
can be taken during that sequence, regardless of the memory type being accessed. If any of these exceptions are
returned from using their preferred return address, the instruction that generated the sequence of accesses is
re-executed, and so any access performed before the exception was taken is repeated. See also Taking an interrupt
during a multi-access load or store on page D1-4664."</pre>
    <p>However I see the implementation of LDP and STP on QEMU are in
      different ways. LDP will only load the first register when it
      ensures no trap in the second access.</p>
    <p>So I have two questions here.</p>
    <p>1) One for the QEMU implementation about LDP. Can we implement
      the LDP as two directly loads to cpu registers instead of local
      TCG temps?</p>
    <p></p>
    <p>2) One for the comment. Why register state changes cause
      non-restartable? Do you mean if the first register changes, it may
      influence the calculation of address after the trap?<br>
    </p>
    <pre>"Even with a trap in the middle the stores are restartable, since no register state changes."

</pre>
    <blockquote type="cite"
      cite="mid:7f8383f6-e860-5e3e-e89c-dfdac4e05dc5@linaro.org"><br>
      But if you'd like no changes verifying both stores, for this case
      you can pack the pair into a larger data type: TCGv_i64 for pair
      of 32-bit, and TCGv_i128 for pair of 64-bit.
      <br>
      Patches for TCGv_i128 [1] are just finishing review; patches to
      describe atomicity of the larger operation are also on list [2].
      Anyway, the idea is that you issue one TCG memory operation, the
      entire operation is validated, and then the stores happen.
      <br>
      <br>
      <br>
      <blockquote type="cite">The main reason is that assembler can do
        this check. Is it necessary to check this in QEMU?
        <br>
      </blockquote>
      <br>
      Yes.  Conciser what happens when the insn is encoded with .long. 
      Does the hardware trap an illegal instruction?  Is the behavior
      simply unspecified?  The manual could be improved to specify, akin
      to the Arm terms: UNDEFINED, CONSTRAINED UNPREDICTABLE,
      IMPLEMENTATION DEFINED, etc.
      <br>
      <br>
      <br>
    </blockquote>
    <p>Thanks, I will fix the manual.</p>
    <p>Best Regards,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite"
      cite="mid:7f8383f6-e860-5e3e-e89c-dfdac4e05dc5@linaro.org">r~
      <br>
      <br>
      [1]
<a class="moz-txt-link-freetext" href="https://patchew.org/QEMU/20230126043824.54819-1-richard.henderson@linaro.org/">https://patchew.org/QEMU/20230126043824.54819-1-richard.henderson@linaro.org/</a><br>
      [2]
<a class="moz-txt-link-freetext" href="https://patchew.org/QEMU/20221118094754.242910-1-richard.henderson@linaro.org/">https://patchew.org/QEMU/20221118094754.242910-1-richard.henderson@linaro.org/</a><br>
    </blockquote>
  </body>
</html>

--------------R9GyhGRl0ph5OT0O0r2XcIHp--


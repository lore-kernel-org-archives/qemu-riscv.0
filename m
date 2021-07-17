Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m4bVK-0003oa-KP
	for mharc-qemu-riscv@gnu.org; Sat, 17 Jul 2021 00:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1m4bVI-0003oG-BH; Sat, 17 Jul 2021 00:00:40 -0400
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:60945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1m4bVF-0005g3-IY; Sat, 17 Jul 2021 00:00:40 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08183336|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0171672-0.00057658-0.982256;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=4; RT=4; SR=0; TI=SMTPD_---.KjcJI-C_1626494424; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KjcJI-C_1626494424)
 by smtp.aliyun-inc.com(10.147.41.158);
 Sat, 17 Jul 2021 12:00:24 +0800
Subject: Re: [PATCH 00/17] target/riscv: Use tcg_constant_*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <2a5cfe45-3fdf-9a2f-c0f3-682d30d521a3@c-sky.com>
 <0b70aaf7-b337-3b73-cdbf-c5693a826204@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <2933aae8-75f5-d912-4e0b-a38cb72b8f0e@c-sky.com>
Date: Sat, 17 Jul 2021 11:59:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0b70aaf7-b337-3b73-cdbf-c5693a826204@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------50F8AAAF4326B28DC8DF2219"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.194; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-194.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Jul 2021 04:00:40 -0000

This is a multi-part message in MIME format.
--------------50F8AAAF4326B28DC8DF2219
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/7/16 上午12:15, Richard Henderson wrote:
> On 7/15/21 4:21 AM, LIU Zhiwei wrote:
>> Also on a side note, could you give me some advice for the following 
>> question?
>>
>> I have been supporting  running 32bit application on qemu-riscv64. 
>> After this patch set,
>> it is hard to define a  method,  such as gpr_dst_s or gpr_dst_u, to 
>> extend the destination
>> register. I can only extend the destination register(ext32s or 
>> ext32u) in each instruction
>> with scattered code.
>>
>> Can we just omit the extension of the destination register?
>
> It's hard to give advice on code that I haven't seen.
>
> In general I would think that the destination register need not be 
> extended for 32-bit mode, unless the architecture says otherwise. 
> (What does the architecture say about the contents of the registers 
> when transitioning from a 32-bit mode user program to a 64-bit mode 
> kernel?)
>
As privileged specification says,

"Whenever XLEN in any mode is set to a value less than the widest supported XLEN, all operations
must ignore source operand register bits above the configured XLEN, and must sign-extend results
to fill the entire widest supported XLEN in the destination register. Similarly, pc bits above XLEN
are ignored, and when the pc is written, it is sign-extended to fill the widest supported XLEN."

If we want to strictly obey the spec, we should
1) Ignore MSB 32bits for source register, and sign-extend the 
destination register.
2) Always use 32bit operation(TCG 32bit OP).

I want to still use TCG 64bit OP and just extend the source to 64bit by 
ext32s or ext32u.

Is is OK?

Thanks,
Zhiwei
>
> r~

--------------50F8AAAF4326B28DC8DF2219
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/7/16 上午12:15, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0b70aaf7-b337-3b73-cdbf-c5693a826204@linaro.org">On
      7/15/21 4:21 AM, LIU Zhiwei wrote:
      <br>
      <blockquote type="cite">Also on a side note, could you give me
        some advice for the following question?
        <br>
        <br>
        I have been supporting  running 32bit application on
        qemu-riscv64. After this patch set,
        <br>
        it is hard to define a  method,  such as gpr_dst_s or gpr_dst_u,
        to extend the destination
        <br>
        register. I can only extend the destination register(ext32s or
        ext32u) in each instruction
        <br>
        with scattered code.
        <br>
        <br>
        Can we just omit the extension of the destination register?
        <br>
      </blockquote>
      <br>
      It's hard to give advice on code that I haven't seen.
      <br>
      <br>
      In general I would think that the destination register need not be
      extended for 32-bit mode, unless the architecture says otherwise. 
      (What does the architecture say about the contents of the
      registers when transitioning from a 32-bit mode user program to a
      64-bit mode kernel?)
      <br>
      <br>
    </blockquote>
    <p>As privileged specification says,</p>
    <pre>"Whenever XLEN in any mode is set to a value less than the widest supported XLEN, all operations
must ignore source operand register bits above the configured XLEN, and must sign-extend results
to fill the entire widest supported XLEN in the destination register. Similarly, pc bits above XLEN
are ignored, and when the pc is written, it is sign-extended to fill the widest supported XLEN."
</pre>
    If we want to strictly obey the spec, we should <br>
    1) Ignore MSB 32bits for source register, and sign-extend the
    destination register.<br>
    2) Always use 32bit operation(TCG 32bit OP).<br>
    <br>
    I want to still use TCG 64bit OP and just extend the source to 64bit
    by ext32s or ext32u.<br>
    <br>
    Is is OK?<br>
    <br>
    Thanks,<br>
    Zhiwei<br>
    <blockquote type="cite"
      cite="mid:0b70aaf7-b337-3b73-cdbf-c5693a826204@linaro.org">
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------50F8AAAF4326B28DC8DF2219--


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDwuO-0004IT-TH
	for mharc-qemu-riscv@gnu.org; Wed, 11 Aug 2021 18:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mDwuL-0004Gp-Q0; Wed, 11 Aug 2021 18:41:09 -0400
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:34315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mDwuG-0003wK-Ug; Wed, 11 Aug 2021 18:41:09 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09886604|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.162518-0.0540106-0.783471;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.Kyg0Mnv_1628721653; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Kyg0Mnv_1628721653)
 by smtp.aliyun-inc.com(10.147.41.137);
 Thu, 12 Aug 2021 06:40:53 +0800
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
 <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
 <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
 <249ce5f9-333a-7186-36bb-a2ecadb19254@linaro.org>
 <538f3928-f681-cb9e-7850-48469ea4ccd5@c-sky.com>
 <15f69497-3baf-abf1-ba9e-91ac1e883d63@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <bbc67da3-3eef-6e57-8610-6b496f30b777@c-sky.com>
Date: Thu, 12 Aug 2021 06:40:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <15f69497-3baf-abf1-ba9e-91ac1e883d63@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------BBC96D59B64C6FCB336E4FD6"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.74; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-74.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Wed, 11 Aug 2021 22:41:10 -0000

This is a multi-part message in MIME format.
--------------BBC96D59B64C6FCB336E4FD6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/8/12 上午1:56, Richard Henderson wrote:
> On 8/11/21 4:57 AM, LIU Zhiwei wrote:
>> I  still don't know why the value written sign-extended.  If that's 
>> the the rule of final specification, I will try to obey it although 
>> our Linux will not depend on the high part.
>
> The text that I'm looking at is
>
> https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMFDQC-and-Priv-v1.11/riscv-privileged-20190608.pdf 
>
>
> 3.1.6.2 Base ISA Control in mstatus Register
>
> In the fifth paragraph, the requirement for sign-extension is detailed.
>
Thanks. I have already seen this rule.

/"Whenever XLEN in any mode is set to a value less than the widest 
supported XLEN, all operations////must ignore source operand register bits above the configured XLEN, and 
must sign-extend results////to fill the entire widest supported XLEN in the destination register.//" /

I still don't know why the specification has this constraint. It just 
requires that fill hardware registers with defined sign-extension value.
But it doesn't give the real benefit of this constraint.

If the software doesn't use the high part, who cares the really value in 
high part? Do you know the benefit?  Thanks again.

Best Regards,
Zhiwei//

>
> r~

--------------BBC96D59B64C6FCB336E4FD6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/8/12 上午1:56, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:15f69497-3baf-abf1-ba9e-91ac1e883d63@linaro.org">On
      8/11/21 4:57 AM, LIU Zhiwei wrote:
      <br>
      <blockquote type="cite">I  still don't know why the value written
        sign-extended.  If that's the the rule of final specification, I
        will try to obey it although our Linux will not depend on the
        high part.
        <br>
      </blockquote>
      <br>
      The text that I'm looking at is
      <br>
      <br>
<a class="moz-txt-link-freetext" href="https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMFDQC-and-Priv-v1.11/riscv-privileged-20190608.pdf">https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMFDQC-and-Priv-v1.11/riscv-privileged-20190608.pdf</a>
      <br>
      <br>
      3.1.6.2 Base ISA Control in mstatus Register
      <br>
      <br>
      In the fifth paragraph, the requirement for sign-extension is
      detailed.
      <br>
      <br>
    </blockquote>
    <p>Thanks. I have already seen this rule.</p>
    <pre><i>"Whenever XLEN in any mode is set to a value less than the widest supported XLEN, all operations</i><i>
</i><i>must ignore source operand register bits above the configured XLEN, and must sign-extend results</i><i>
</i><i>to fill the entire widest supported XLEN in the destination register.</i><i>"
</i></pre>
    <p>I still don't know why the specification has this constraint. It
      just requires that fill hardware registers with defined 
      sign-extension value. <br>
      But it doesn't give the real benefit of this constraint. <br>
    </p>
    <p>If the software doesn't use the high part, who cares the really
      value in high part? Do you know the benefit?  Thanks again.<br>
    </p>
    <pre>Best Regards,
Zhiwei<i>
</i></pre>
    <blockquote type="cite"
      cite="mid:15f69497-3baf-abf1-ba9e-91ac1e883d63@linaro.org">
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------BBC96D59B64C6FCB336E4FD6--


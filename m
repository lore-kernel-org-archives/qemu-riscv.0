Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jaynT-0004Dg-AU
	for mharc-qemu-riscv@gnu.org; Tue, 19 May 2020 05:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jaynR-0004C1-Ov; Tue, 19 May 2020 05:44:25 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:39210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jaynP-0000dM-Aw; Tue, 19 May 2020 05:44:25 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07983936|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.0106858-0.000522711-0.988792;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16378; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.HagB8G7_1589881447; 
Received: from 30.225.208.54(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HagB8G7_1589881447)
 by smtp.aliyun-inc.com(10.147.42.135);
 Tue, 19 May 2020 17:44:10 +0800
Subject: Re: [RFC PATCH 0/8] RISCV risu porting
To: Richard Henderson <richard.henderson@linaro.org>, peter.maydell@linaro.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
 <69d804ea-5274-bee4-9368-69c888082143@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <d7475c4e-6613-5f59-b65f-d23e844b2115@c-sky.com>
Date: Tue, 19 May 2020 17:44:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <69d804ea-5274-bee4-9368-69c888082143@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------95EFDEBDF29C548A1B039BD5"
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 05:44:11
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 UNPARSEABLE_RELAY=0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 19 May 2020 09:44:26 -0000

This is a multi-part message in MIME format.
--------------95EFDEBDF29C548A1B039BD5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2020/5/12 0:30, Richard Henderson wrote:
> On 4/30/20 12:21 AM, LIU Zhiwei wrote:
>> It's some difficult when I try to support RV32, because it's very
>> similiar to RV64, so I can't make two .risu files like arm.risu and
>> aarch64.risu.
> You could a command-line parameter, like --be or --sve for this.
Yes. I should add a "--xlen" parameter to specify the general register 
length in risugen_riscv.pm.

Besides, I should modify current riscv64.risu.

For instructions in RV32 and RV64:

LB RV32_64 imm:12 rs1:5 000 rd:5 0000011

For RV64 only instructions:

LD RV64 imm:12 rs1:5 011 rd:5 0000011

So I can  generate RV32 instructions through  --pattern '*.RV32.*', and 
the  RV64 instructions through --pattern '.*RV64.*'.

Best Regards,
Zhiwei
>
> r~


--------------95EFDEBDF29C548A1B039BD5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2020/5/12 0:30, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:69d804ea-5274-bee4-9368-69c888082143@linaro.org">
      <pre class="moz-quote-pre" wrap="">On 4/30/20 12:21 AM, LIU Zhiwei wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">It's some difficult when I try to support RV32, because it's very
similiar to RV64, so I can't make two .risu files like arm.risu and
aarch64.risu.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You could a command-line parameter, like --be or --sve for this.
</pre>
    </blockquote>
    Yes. I should add a "--xlen" parameter to specify the general
    register length in risugen_riscv.pm.<br>
    <br>
    Besides, I should modify current riscv64.risu.<br>
    <br>
    For instructions in RV32 and RV64:<br>
    <pre>LB RV32_64 imm:12 rs1:5 000 rd:5 0000011
</pre>
    For RV64 only instructions:<br>
    <pre>LD RV64 imm:12 rs1:5 011 rd:5 0000011 
</pre>
    So I can  generate RV32 instructions through  --pattern '*.RV32.*',
    and the  RV64 instructions through --pattern '.*RV64.*'.<br>
    <br>
    Best Regards,<br>
    Zhiwei<br>
    <blockquote type="cite"
      cite="mid:69d804ea-5274-bee4-9368-69c888082143@linaro.org">
      <pre class="moz-quote-pre" wrap="">

r~
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------95EFDEBDF29C548A1B039BD5--


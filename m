Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ol7jP-0004wt-W0
	for mharc-qemu-riscv@gnu.org; Wed, 19 Oct 2022 07:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ol7jO-0004wQ-Cx; Wed, 19 Oct 2022 07:59:30 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:54843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ol7jI-0000o3-Ad; Wed, 19 Oct 2022 07:59:30 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VSajwNM_1666180750; 
Received: from 30.13.184.69(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VSajwNM_1666180750) by smtp.aliyun-inc.com;
 Wed, 19 Oct 2022 19:59:11 +0800
Content-Type: multipart/alternative;
 boundary="------------ZLsBu9kZuheHF6WVzEkhce90"
Message-ID: <020dc51f-793b-bf20-41e8-5b1447711864@linux.alibaba.com>
Date: Wed, 19 Oct 2022 19:59:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Question about TCG backend correctness
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
References: <4672400c-0084-3bf3-a596-7a42115301f0@linux.alibaba.com>
 <87lepeeno0.fsf@linaro.org>
 <4841b154-bd05-c677-cfb4-46a350ddd0aa@linux.alibaba.com>
 <b97a7b1a-f8cd-b0d5-bbde-1a06049281dd@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <b97a7b1a-f8cd-b0d5-bbde-1a06049281dd@linaro.org>
Received-SPF: pass client-ip=115.124.30.45;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-45.freemail.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 19 Oct 2022 11:59:30 -0000

This is a multi-part message in MIME format.
--------------ZLsBu9kZuheHF6WVzEkhce90
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/10/18 13:22, Richard Henderson wrote:
> On 10/18/22 01:27, LIU Zhiwei wrote:
>> Maybe I can run RISU on qemu-aarch64(x86) and qemu-aarch64(risc-v) to 
>> check the RISC-V backend.
>
> This is a good start for debugging a tcg backend. 

After fixing some bugs, RISU can run  some instructions now. Thanks.


IMHO,  the next 2 requests should be satisfied for TCG test.

1. Add a unit test case for any lower level and small function is easy.

    For example, the function in risc-v backend,

    static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret,
    TCGReg arg)
      {
          if (ret == arg) {
              return true;
          }
          switch (type) {
          case TCG_TYPE_I32:
          case TCG_TYPE_I64:
              tcg_out_opc_imm(s, OPC_ADDI, ret, arg, 0);
              break;
          default:
              g_assert_not_reached();
          }
          return true;
      }

    Write a unit test case for it is not easy currently.  I don't know
    how to fill the TCGContext struct and other parameters.
    And there is no test framework where I can reuse.

    The others may say that we can run a lot of benchmark to ensure we
    have a good coverage and don't
    need such a low level test case. Some reasonable. But it will lead
    to a very high test burden and it is very hard to get
    a good coverage only through high level test.


2. Add a unit test case for any high level function is easy, such as 
tcg_gen_code.

    The check-tcg test belongs to the high level testing.

Best Regards，
Zhiwei

> It's not comprehensive, because RISU executes one instruction at a 
> time then raises an exception to check the results.  This means that 
> the tcg optimizer doesn't have much to work with, which means that the 
> tcg backend is not as stressed as it could be.
>
>>> I've long wanted to have the ability to have TCG unit tests where a
>>> virtual processor could be defined for the purpose of directly
>>> exercising TCG.
>>
>> We already have many ISAs as the front end of TCG. Will the virtual 
>> processor here be some
>> different?
>
> It wouldn't.  This is my argument against creating a new virtual 
> processor.
>
> I do think we should be better about creating regression tests for 
> bugs fixed, in the form of small focused assembly test cases which get 
> run via check-tcg.
>
>
> r~
--------------ZLsBu9kZuheHF6WVzEkhce90
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/10/18 13:22, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b97a7b1a-f8cd-b0d5-bbde-1a06049281dd@linaro.org">On
      10/18/22 01:27, LIU Zhiwei wrote:
      <br>
      <blockquote type="cite">Maybe I can run RISU on qemu-aarch64(x86)
        and qemu-aarch64(risc-v) to check the RISC-V backend.
        <br>
      </blockquote>
      <br>
      This is a good start for debugging a tcg backend. </blockquote>
    <p>After fixing some bugs, RISU can run  some instructions now.
      Thanks.</p>
    <p><br>
    </p>
    <p>IMHO,  the next 2 requests should be satisfied for TCG test.<br>
    </p>
    <p>1. Add a unit test case for any lower level and small function is
      easy. <br>
    </p>
    <blockquote>
      <p>For example, the function in risc-v backend, <br>
      </p>
      <p><font face="monospace">static bool tcg_out_mov(TCGContext *s,
          TCGType type, TCGReg ret, TCGReg arg)<br>
           {<br>
               if (ret == arg) {<br>
                   return true;<br>
               }<br>
               switch (type) {<br>
               case TCG_TYPE_I32:<br>
               case TCG_TYPE_I64:<br>
                   tcg_out_opc_imm(s, OPC_ADDI, ret, arg, 0);<br>
                   break;<br>
               default:<br>
                   g_assert_not_reached();<br>
               }<br>
               return true;<br>
           }</font><br>
      </p>
      <p>Write a unit test case for it is not easy currently.  I don't
        know how to fill the TCGContext struct and other parameters.<br>
        And there is no test framework where I can reuse.</p>
      <p>The others may say that we can run a lot of benchmark to ensure
        we have a good coverage and don't<br>
        need such a low level test case. Some reasonable. But it will
        lead to a very high test burden and it is very hard to get<br>
        a good coverage only through high level test.</p>
    </blockquote>
    <p><br>
    </p>
    <p>2. Add a unit test case for any high level function is easy, such
      as tcg_gen_code. <br>
    </p>
    <blockquote>
      <p>The check-tcg test belongs to the high level testing. <br>
      </p>
    </blockquote>
    <p>Best Regards，<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite"
      cite="mid:b97a7b1a-f8cd-b0d5-bbde-1a06049281dd@linaro.org">It's
      not comprehensive, because RISU executes one instruction at a time
      then raises an exception to check the results.  This means that
      the tcg optimizer doesn't have much to work with, which means that
      the tcg backend is not as stressed as it could be.
      <br>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">I've long wanted to have the ability to
          have TCG unit tests where a
          <br>
          virtual processor could be defined for the purpose of directly
          <br>
          exercising TCG.
          <br>
        </blockquote>
        <br>
        We already have many ISAs as the front end of TCG. Will the
        virtual processor here be some
        <br>
        different?
        <br>
      </blockquote>
      <br>
      It wouldn't.  This is my argument against creating a new virtual
      processor.
      <br>
      <br>
      I do think we should be better about creating regression tests for
      bugs fixed, in the form of small focused assembly test cases which
      get run via check-tcg.
      <br>
      <br>
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------ZLsBu9kZuheHF6WVzEkhce90--


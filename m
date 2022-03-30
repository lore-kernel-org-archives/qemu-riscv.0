Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZa1W-0002iE-Lw
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 11:14:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nZa1U-0002eo-Jd; Wed, 30 Mar 2022 11:14:12 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:58024 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nZa1R-0006Vy-G4; Wed, 30 Mar 2022 11:14:12 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACHjTW3c0Rin32SAA--.40145S2;
 Wed, 30 Mar 2022 23:14:00 +0800 (CST)
Subject: Re: [PATCH qemu v5 05/14] target/riscv: rvv: Add tail agnostic for
 vector load / store instructions
To: eop Chen <eop.chen@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <164845204233.25323.14607469451359734000-5@git.sr.ht>
 <7f3c995d-182f-f1b3-4e79-94f5b81e1be9@iscas.ac.cn>
 <BC7B9267-08F4-4CF0-9BAD-52CF8DA2DCC2@gmail.com>
 <5ce85a5a-8309-9016-b88f-69af545e4114@iscas.ac.cn>
 <91927009-7EA2-461A-ACD0-F3B8955BA982@sifive.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <58ef1d38-502a-4701-7ccf-ba10e2cc788d@iscas.ac.cn>
Date: Wed, 30 Mar 2022 23:13:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <91927009-7EA2-461A-ACD0-F3B8955BA982@sifive.com>
Content-Type: multipart/alternative;
 boundary="------------5E1452E7DE465A79D6B91C21"
Content-Language: en-US
X-CM-TRANSID: qwCowACHjTW3c0Rin32SAA--.40145S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyrAr4UZry8GFy7Gw4DArb_yoW8uF43pa
 y5uw17JFs2qrWq9a1DCay7ZFWxuF43Gw4Yvry5t347J3y5G3y0yFWvyFWYyFW7tr97CF1j
 yw4jv34kuas8AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
 nxnUUI43ZEXa7VUjzBT5UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 30 Mar 2022 15:14:12 -0000

This is a multi-part message in MIME format.
--------------5E1452E7DE465A79D6B91C21
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/3/30 下午6:02, eop Chen 写道:
>
>
>> Weiwei Li <liweiwei@iscas.ac.cn <mailto:liweiwei@iscas.ac.cn>> 於 
>> 2022年3月30日 下午4:27 寫道：
>> 在 2022/3/30 下午3:42, 陳約廷 写道:
>>>
>>>> Weiwei Li <liweiwei@iscas.ac.cn <mailto:liweiwei@iscas.ac.cn>> 於 
>>>> 2022年3月28日 下午7:56 寫道：
>>>>
>>>>
>>>> 在 2022/3/7 下午3:10, ~eopxd 写道:
>>>>> From: eopXD <eop.chen@sifive.com <mailto:eop.chen@sifive.com>>
>>
>> Another question: max_elems is equal to total_elems when lmul >= 0.
>>
>> So max_elems can be reused  here instead of caculating total_elems again.
>>
>>>
>>> I don’t understand your second question though. If nf = 3, there 
>>> will be 3 registers
>>> involved with the instruction (namely reg, reg+1, reg+2). Why do we 
>>> care about
>>> (reg+3)?
>>>
>> I just consider register group here. Reg, reg+1, reg+2 and reg+3 may 
>> belong to the same register group.
>>
>> Regards,
>>
>> Weiwei Li
>>
>
> According to v-spec (under section 7.8):
>
>     Each field will be held in successively numbered vector register
>     groups. When EMUL>1
>      each field will occupy a vector register group held in multiple
>     successively numbered
>     vector registers, and the vector register group for each field
>     must follow the usual vector
>     register alignment constraints (e.g., when EMUL=2 and NFIELDS=4,
>     each field’s vector
>     register group must start at an even vector register, but does not
>     have to start at a multiple
>     of 8 vector register number).
>
>
> I think the spec has explained itself that NFIELDS represents the 
> number of register groups involved
> in this instruction. Therefore in a register group of 4 (LMUL = m2), 
> NFIELD should be no more than 2.
> The `vlmax` here would be (VLEN * 4 / EEW). In this sense, if the `vl` 
> provided for the vector instruction
> is within the range 2 * vlmax / 4 <= vl <= 3 * vlmax / 4, the elements 
> in the 4th register (namely reg+3)
> will all be counted as tail elements.
>
> I hope this answers your question.

OK, Thanks a lot. This truly answers my question, even though what I 
really want to know is the case for EMUL=1, and NFIELDS=3.

since NFIELDS represents the number of register groups, not take the 
total of EMUL * NFIELDS into one register group ,

so reg+3 should not take into tail elements for my case.

Regards,

Weiwei Li

>
> Regards,
>
> eop Chen
>
>

--------------5E1452E7DE465A79D6B91C21
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/3/30 下午6:02, eop Chen 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:91927009-7EA2-461A-ACD0-F3B8955BA982@sifive.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br class="">
      <div class="">
      </div>
      <div><br class="">
        <blockquote type="cite" class="">
          <div class="">Weiwei Li &lt;<a
              href="mailto:liweiwei@iscas.ac.cn" class=""
              moz-do-not-send="true">liweiwei@iscas.ac.cn</a>&gt; 於
            2022年3月30日 下午4:27 寫道：</div>
          <div class="">
            <div class="">
              <div class="moz-cite-prefix">在 2022/3/30 下午3:42, 陳約廷 写道:<br
                  class="">
              </div>
              <blockquote type="cite"
                cite="mid:BC7B9267-08F4-4CF0-9BAD-52CF8DA2DCC2@gmail.com"
                class="">
                <meta http-equiv="Content-Type" content="text/html;
                  charset=UTF-8" class="">
                <div class=""><br class="">
                  <blockquote type="cite" class="">
                    <div class="">Weiwei Li &lt;<a
                        href="mailto:liweiwei@iscas.ac.cn" class=""
                        moz-do-not-send="true">liweiwei@iscas.ac.cn</a>&gt;
                      於 2022年3月28日 下午7:56 寫道：</div>
                    <br class="Apple-interchange-newline">
                    <div class="">
                      <div class=""><br class="">
                        在 2022/3/7 下午3:10, ~eopxd 写道:<br class="">
                        <blockquote type="cite" class="">From: eopXD
                          &lt;<a href="mailto:eop.chen@sifive.com"
                            class="" moz-do-not-send="true">eop.chen@sifive.com</a>&gt;<br
                            class="">
                        </blockquote>
                      </div>
                    </div>
                  </blockquote>
                </div>
              </blockquote>
              <p class="">Another question: max_elems is equal to
                total_elems when lmul &gt;= 0.</p>
              <p class="">So max_elems can be reused  here instead of
                caculating total_elems again.<br class="">
              </p>
              <blockquote type="cite"
                cite="mid:BC7B9267-08F4-4CF0-9BAD-52CF8DA2DCC2@gmail.com"
                class="">
                <div class=""><br class="">
                </div>
                <div class="">I don’t understand your second question
                  though. If nf = 3, there will be 3 registers</div>
                <div class="">involved with the instruction (namely reg,
                  reg+1, reg+2). Why do we care about</div>
                <div class="">(reg+3)?</div>
                <div class=""><br class="">
                </div>
              </blockquote>
              <p class="">I just consider register group here. Reg,
                reg+1, reg+2 and reg+3 may belong to the same register
                group.</p>
              <p class="">Regards,</p>
              <p class="">Weiwei Li<br class="">
              </p>
            </div>
          </div>
        </blockquote>
      </div>
      <br class="">
      <div class="">According to v-spec (under section 7.8):</div>
      <div class=""><br class="">
      </div>
      <blockquote style="margin: 0 0 0 40px; border: none; padding:
        0px;" class="">
        <div class=""><span style="color: rgb(36, 41, 47);
            font-variant-ligatures: normal; orphans: 2; widows: 2;
            text-decoration-thickness: initial; background-color:
            rgba(255, 255, 255, 0); font-size: 14px;" class=""><font
              class="" face="Times">Each field will be held in
              successively numbered vector register groups. When
              EMUL&gt;1</font></span></div>
        <div class=""><span style="color: rgb(36, 41, 47);
            font-variant-ligatures: normal; orphans: 2; widows: 2;
            text-decoration-thickness: initial; background-color:
            rgba(255, 255, 255, 0); font-size: 14px;" class=""><font
              class="" face="Times"> each field will occupy a vector
              register group held in multiple successively numbered</font></span></div>
        <div class=""><span style="color: rgb(36, 41, 47);
            font-variant-ligatures: normal; orphans: 2; widows: 2;
            text-decoration-thickness: initial; background-color:
            rgba(255, 255, 255, 0); font-size: 14px;" class=""><font
              class="" face="Times">vector registers, and the vector
              register group for each field must follow the usual vector</font></span></div>
        <div class=""><span style="color: rgb(36, 41, 47);
            font-variant-ligatures: normal; orphans: 2; widows: 2;
            text-decoration-thickness: initial; background-color:
            rgba(255, 255, 255, 0); font-size: 14px;" class=""><font
              class="" face="Times">register alignment constraints
              (e.g., when EMUL=2 and NFIELDS=4, each field’s vector</font></span></div>
        <div class=""><span style="color: rgb(36, 41, 47);
            font-variant-ligatures: normal; orphans: 2; widows: 2;
            text-decoration-thickness: initial; background-color:
            rgba(255, 255, 255, 0); font-size: 14px;" class=""><font
              class="" face="Times">register group must start at an even
              vector register, but does not have to start at a multiple</font></span></div>
        <div class=""><span style="color: rgb(36, 41, 47);
            font-variant-ligatures: normal; orphans: 2; widows: 2;
            text-decoration-thickness: initial; background-color:
            rgba(255, 255, 255, 0); font-size: 14px;" class=""><font
              class="" face="Times">of 8 vector register number).</font></span></div>
      </blockquote>
      <div class="">
        <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
          class=""><br class="">
        </div>
        <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
          class="">I think the spec has explained itself that NFIELDS
          represents the number of register groups involved</div>
        <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
          class="">in this instruction. Therefore in a register group of
          4 (LMUL = m2), NFIELD should be no more than 2.</div>
        <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
          class="">The `vlmax` here would be (VLEN * 4 / EEW). In this
          sense, if the `vl` provided for the vector instruction</div>
        <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
          class="">is within the range 2 * vlmax / 4 &lt;= vl &lt;= 3 *
          vlmax / 4, the elements in the 4th register (namely reg+3)</div>
        <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
          class="">will all be counted as tail elements.</div>
        <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
          class=""><br class="">
        </div>
      </div>
      <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
        class="">I hope this answers your question.</div>
    </blockquote>
    <p>OK, Thanks a lot. This truly answers my question, even though
      what I really want to know is the case for EMUL=1, and NFIELDS=3.</p>
    <p>since NFIELDS represents the number of register groups, not take
      the total of EMUL * NFIELDS into one register group , <br>
    </p>
    <p>so reg+3 should not take into tail elements for my case.<br>
    </p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
      cite="mid:91927009-7EA2-461A-ACD0-F3B8955BA982@sifive.com">
      <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
        class=""><br class="">
      </div>
      <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
        class="">Regards,</div>
      <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
        class=""><br class="">
      </div>
      <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
        class="">eop Chen</div>
      <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
        class=""><br class="">
      </div>
      <div style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"
        class=""><br class="">
      </div>
    </blockquote>
  </body>
</html>

--------------5E1452E7DE465A79D6B91C21--



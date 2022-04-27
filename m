Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njW45-0006pV-Lb
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 21:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1njW3w-0006kY-Kq; Tue, 26 Apr 2022 21:01:50 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:59222 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1njW3r-00013B-FX; Tue, 26 Apr 2022 21:01:48 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACHj5PrlWhiIFFBAQ--.15725S2;
 Wed, 27 Apr 2022 09:01:33 +0800 (CST)
Subject: Re: [PATCH qemu 1/9] target/riscv: rvv: Add mask agnostic for vv
 instructions
To: eop Chen <eop.chen@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <165089631935.4839.7564289944057093570-1@git.sr.ht>
 <9deca899-2041-2452-77e4-6fb8a58bc2b8@iscas.ac.cn>
 <240B9B49-C26F-4C31-8B93-78094F27C918@sifive.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <c79a9d80-5723-8f17-9094-e8447d4d7b5a@iscas.ac.cn>
Date: Wed, 27 Apr 2022 09:01:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <240B9B49-C26F-4C31-8B93-78094F27C918@sifive.com>
Content-Type: multipart/alternative;
 boundary="------------CB7309BECA608774E22E37F9"
Content-Language: en-US
X-CM-TRANSID: zQCowACHj5PrlWhiIFFBAQ--.15725S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur48CFWDCF17ArWkur1UAwb_yoW8ury7pa
 yrCa4UtrZ8JryxW3y8uw4xAryFkan3Ga10yF1kJr9rZ398Xw1vyFZ2kw4rJ3WjyFs09Fy5
 Xr1jq34kZan8CFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
 W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
 106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
 64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
 0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoXo2UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 27 Apr 2022 01:01:52 -0000

This is a multi-part message in MIME format.
--------------CB7309BECA608774E22E37F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/4/27 上午2:20, eop Chen 写道:
>
>> Weiwei Li <liweiwei@iscas.ac.cn <mailto:liweiwei@iscas.ac.cn>> 於 
>> 2022年4月26日 下午4:47 寫道：
>> 在 2022/3/17 下午3:26, ~eopxd 写道:
>>> From: Yueh-Ting (eop) Chen<eop.chen@sifive.com>
>>>
>>> This is the first commit regarding the mask agnostic behavior.
>>> Added option 'rvv_ma_all_1s' to enable the behavior, the option
>>> is default to false.
>>>
>>> Signed-off-by: eop Chen<eop.chen@sifive.com>
>>> Reviewed-by: Frank Chang<frank.chang@sifive.com>
>>
>> Similar to our last discussion, vext_set_elems_1s_fns array can be 
>> simplified to single vext_set_elems_1s,
>>
>> since the fourth argement can be used as the start offset.
>>
>> Another question, may be not related to this patchset, in section 
>> 3.4.3 of the spec:
>>
>> /"Mask destination tail elements are always treated as tail-agnostic, 
>> regardless of the setting of vta."/
>>
>> What does "Mask destination tail elements" mean?
>>
>> Regards,
>>
>> Weiwei Li
>>
>
> I have just updated a new version for the tail agnostic patch set, it 
> also includes a bug fix discovered today.
>
> Regarding the question, mask / masked-off are for body elements and 
> respects the mask policy, and tail elements respect the tail policy.
>
> Regards,
>
> eop Chen

I find another descriptions in the spec. For the instructions that write 
mask register (such as vmadc, vmseq,vmsne,vmfeq...), they all have 
similar description

(You can search "tail-agnostic" in the spec):

/Section 11.4: "Because these instructions produce a mask value, they 
always operate with a tail-agnostic policy"//
/

/Section 11.8/13.13: "Compares //write mask registers, and so always 
operate under a tail-agnostic policy"//
/

/Section 15.1: "Mask elements past vl, the tail elements, are always 
updated with a tail-agnostic policy"//
/

//

/Section 15.4/15.5/15.6: "The tail elements in the destination mask 
register are updated under a tail-agnostic policy"/

So I think "Mask destination tail elements" may means the tail element 
for instructions that take mask register as destination register.  For 
these instructions,

maybe the setting of VTA can be ignored.

Regards,

Weiwei Li


--------------CB7309BECA608774E22E37F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/4/27 上午2:20, eop Chen 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:240B9B49-C26F-4C31-8B93-78094F27C918@sifive.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br class="">
      <div>
        <blockquote type="cite" class="">
          <div class="">Weiwei Li &lt;<a
              href="mailto:liweiwei@iscas.ac.cn" class=""
              moz-do-not-send="true">liweiwei@iscas.ac.cn</a>&gt; 於
            2022年4月26日 下午4:47 寫道：</div>
          <div class="">
            <div class="">
              <div class="moz-cite-prefix">在 2022/3/17 下午3:26, ~eopxd
                写道:<br class="">
              </div>
              <blockquote type="cite"
                cite="mid:165089631935.4839.7564289944057093570-1@git.sr.ht"
                class="">
                <pre class="moz-quote-pre" wrap="">From: Yueh-Ting (eop) Chen <a class="moz-txt-link-rfc2396E" href="mailto:eop.chen@sifive.com" moz-do-not-send="true">&lt;eop.chen@sifive.com&gt;</a>

This is the first commit regarding the mask agnostic behavior.
Added option 'rvv_ma_all_1s' to enable the behavior, the option
is default to false.

Signed-off-by: eop Chen <a class="moz-txt-link-rfc2396E" href="mailto:eop.chen@sifive.com" moz-do-not-send="true">&lt;eop.chen@sifive.com&gt;</a>
Reviewed-by: Frank Chang <a class="moz-txt-link-rfc2396E" href="mailto:frank.chang@sifive.com" moz-do-not-send="true">&lt;frank.chang@sifive.com&gt;</a>
</pre>
              </blockquote>
              <p class="">Similar to our last discussion, 
                vext_set_elems_1s_fns array can be simplified to single
                vext_set_elems_1s,<br class="">
              </p>
              <p class="">since the fourth argement can be used as the
                start offset. <br class="">
              </p>
              <p class="">Another question, may be not related to this
                patchset, in section 3.4.3 of the spec: <br class="">
              </p>
              <p class=""><i class="">"Mask destination tail elements
                  are always treated as tail-agnostic, regardless of the
                  setting of vta."</i></p>
              <p class="">What does "Mask destination tail elements"
                mean?</p>
              <p class="">Regards,</p>
              <p class="">Weiwei Li<br class="">
              </p>
            </div>
          </div>
        </blockquote>
      </div>
      <div class=""><br class="">
      </div>
      <div class="">I have just updated a new version for the tail
        agnostic patch set, it also includes a bug fix discovered today.</div>
      <div class=""><br class="">
      </div>
      <div class="">Regarding the question, mask / masked-off are for
        body elements and respects the mask policy, and tail elements
        respect the tail policy.</div>
      <div class=""><br class="">
      </div>
      <div class="">Regards,</div>
      <div class=""><br class="">
      </div>
      <div class="">eop Chen</div>
    </blockquote>
    <br>
    <p>I find another descriptions in the spec. For the instructions
      that write mask register (such as vmadc, vmseq,vmsne,vmfeq...),
      they all have similar description</p>
    <p>(You can search "tail-agnostic" in the spec):</p>
    <p><i>Section 11.4: "Because these instructions produce a mask
        value, they always operate with a tail-agnostic policy"</i><i><br>
      </i></p>
    <p><i>Section 11.8/13.13: "Compares </i><i>write mask registers,
        and so always operate under a tail-agnostic policy"</i><i><br>
      </i></p>
    <p><i>Section 15.1: "Mask elements past vl, the tail elements, are
        always updated with a tail-agnostic policy"</i><i><br>
      </i>
    </p>
    <i>
    </i>
    <p><i>Section 15.4/15.5/15.6: "The tail elements in the destination
        mask register are updated under a tail-agnostic policy"</i><br>
    </p>
    <p>So I think "Mask destination tail elements" may means the tail
      element for instructions that take mask register as destination
      register.  For these instructions, <br>
    </p>
    <p>maybe the setting of VTA can be ignored.  <br>
    </p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
  </body>
</html>

--------------CB7309BECA608774E22E37F9--



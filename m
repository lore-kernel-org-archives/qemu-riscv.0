Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3XWt-0006tM-QL
	for mharc-qemu-riscv@gnu.org; Sat, 01 Jan 2022 01:06:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3XWr-0006pw-8x; Sat, 01 Jan 2022 01:06:09 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:57116 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3XWo-0003jC-Ue; Sat, 01 Jan 2022 01:06:09 -0500
Received: from [192.168.0.103] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAC3v1dF789hRCqeBQ--.20625S2;
 Sat, 01 Jan 2022 14:05:57 +0800 (CST)
Subject: Re: [PATCH v2 3/6] target/riscv: add support for zfinx
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-4-liweiwei@iscas.ac.cn>
 <a522f7f6-b6ad-02de-dabc-0511740aef83@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <7096a296-f1c2-44e7-d084-1c473b50a711@iscas.ac.cn>
Date: Sat, 1 Jan 2022 14:05:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a522f7f6-b6ad-02de-dabc-0511740aef83@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------57FF81880D37BE7E31627BE8"
Content-Language: en-US
X-CM-TRANSID: qwCowAC3v1dF789hRCqeBQ--.20625S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYC7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
 6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
 kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8I
 cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2js
 IEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE
 14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2
 IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mx8G
 jcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij2
 8IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUB89NU
 UUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) HTML_MESSAGE=0.001, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 01 Jan 2022 06:06:09 -0000

This is a multi-part message in MIME format.
--------------57FF81880D37BE7E31627BE8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2022/1/1 上午4:06, Richard Henderson 写道:
> On 12/30/21 7:23 PM, Weiwei Li wrote:
>> +    if (reg_num != 0) {
>> +        switch (get_ol(ctx)) {
>
> Oh, you should be using get_xl here and elsewhere in this patch, not 
> get_ol.

Sorry. I don't know the difference between get_xl and  get_ol. From gpr 
register read/write function, It seems get_ol is used in register read, 
and get_xl is used in register write.

However, "ctx->ol= ctx->xl;" is executed before translate instruction.

"

>
>
> r~

--------------57FF81880D37BE7E31627BE8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">在 2022/1/1 上午4:06, Richard Henderson
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a522f7f6-b6ad-02de-dabc-0511740aef83@linaro.org">On
      12/30/21 7:23 PM, Weiwei Li wrote:
      <br>
      <blockquote type="cite">+    if (reg_num != 0) {
        <br>
        +        switch (get_ol(ctx)) {
        <br>
      </blockquote>
      <br>
      Oh, you should be using get_xl here and elsewhere in this patch,
      not get_ol.
      <br>
    </blockquote>
    <p>Sorry. I don't know the difference between get_xl and  get_ol. 
      From gpr register read/write function, It seems get_ol is used in
      register read, and get_xl is used in register write.</p>
    <p>However, <span style="color: #001080;">"ctx</span><span
        style="color: #000000;">-&gt;</span><span style="color:
        #001080;">ol</span><span style="color: #000000;"> = </span><span
        style="color: #001080;">ctx</span><span style="color: #000000;">-&gt;</span><span
        style="color: #001080;">xl</span><span style="color: #000000;">;"
        is executed before translate instruction.<br>
      </span></p>
    <p>" <br>
    </p>
    <blockquote type="cite"
      cite="mid:a522f7f6-b6ad-02de-dabc-0511740aef83@linaro.org">
      <br>
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------57FF81880D37BE7E31627BE8--



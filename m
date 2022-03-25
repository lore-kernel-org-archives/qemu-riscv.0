Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXhTu-0007Ow-Uq
	for mharc-qemu-riscv@gnu.org; Fri, 25 Mar 2022 06:47:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXhTq-0007OE-Vo; Fri, 25 Mar 2022 06:47:43 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:40374 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXhTp-0000Mc-2s; Fri, 25 Mar 2022 06:47:42 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADX3sLEnT1ifuCaBA--.19715S2;
 Fri, 25 Mar 2022 18:47:34 +0800 (CST)
Subject: Re: [PATCH qemu v4 12/14] target/riscv: rvv: Add tail agnostic for
 vector reduction instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <164814860220.28290.11643334198417094464-12@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <598097d6-5d59-4858-624e-3291dfa307aa@iscas.ac.cn>
Date: Fri, 25 Mar 2022 18:47:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164814860220.28290.11643334198417094464-12@git.sr.ht>
Content-Type: multipart/alternative;
 boundary="------------629A9F69AEE57B315E30B771"
Content-Language: en-US
X-CM-TRANSID: rQCowADX3sLEnT1ifuCaBA--.19715S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr4kAFy8Gry5ZFyrJF45trb_yoWxKrgEyr
 4DWFZ3Gw1UCF4UtryFyr13Jr4fAa4UKw4xtw47ZrWjgrn3GrZ7Jw1Iy397Zr1kA3WxAr9I
 9a15uFn8Ca1SvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
 jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II
 8E6IAqYI8I648v4I1l7480Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l
 42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGV
 WUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
 I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
 4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUopnQUUUUU
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
X-List-Received-Date: Fri, 25 Mar 2022 10:47:44 -0000

This is a multi-part message in MIME format.
--------------629A9F69AEE57B315E30B771
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/3/7 下午8:21, ~eopxd 写道:
> +    uint32_t vta = vext_vta(desc);                        \
>       uint32_t i;                                           \
>       TD s1 =  *((TD *)vs1 + HD(0));                        \
>                                                             \
> @@ -4562,6 +4565,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>       }                                                     \
>       *((TD *)vd + HD(0)) = s1;                             \
>       env->vstart = 0;                                      \
> +    /* set tail elements to 1s */                         \
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, 1, esz,     \
> +                                     vlenb);              \
>   }
>   
>   /* vd[0] = sum(vs1[0], vs2[*]) */
> @@ -4667,6 +4673,9 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
>   {
>       uint32_t vm = vext_vm(desc);
>       uint32_t vl = env->vl;
> +    uint32_t esz = sizeof(uint32_t);
> +    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;

vlenb  also can get from maxsz field of desc,  that is

uint32_tvlenb= simd_maxsz(desc)

Regards,

Weiwei Li


--------------629A9F69AEE57B315E30B771
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/3/7 下午8:21, ~eopxd 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:164814860220.28290.11643334198417094464-12@git.sr.ht">
      <pre class="moz-quote-pre" wrap="">+    uint32_t vta = vext_vta(desc);                        \
     uint32_t i;                                           \
     TD s1 =  *((TD *)vs1 + HD(0));                        \
                                                           \
@@ -4562,6 +4565,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
     }                                                     \
     *((TD *)vd + HD(0)) = s1;                             \
     env-&gt;vstart = 0;                                      \
+    /* set tail elements to 1s */                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, 1, esz,     \
+                                     vlenb);              \
 }
 
 /* vd[0] = sum(vs1[0], vs2[*]) */
@@ -4667,6 +4673,9 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
 {
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env-&gt;vl;
+    uint32_t esz = sizeof(uint32_t);
+    uint32_t vlenb = env_archcpu(env)-&gt;cfg.vlen &gt;&gt; 3;
</pre>
    </blockquote>
    <p>vlenb  also can get from maxsz field of desc,  that is <br>
    </p>
    <div style="color: #000000;background-color: #ffffff;font-family: 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback';font-weight: normal;font-size: 18px;line-height: 24px;white-space: pre;"><div><span style="color: #267f99;">  uint32_t</span><span style="color: #000000;"> </span><span style="color: #001080;">vlenb</span><span style="color: #000000;"> = </span><span style="color: #795e26;">simd_maxsz</span><span style="color: #000000;">(</span><span style="color: #001080;">desc</span><span style="color: #000000;">)</span></div></div>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
  </body>
</html>

--------------629A9F69AEE57B315E30B771--



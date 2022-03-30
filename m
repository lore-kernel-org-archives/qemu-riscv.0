Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZTgj-0004YQ-58
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 04:28:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nZTga-0004VY-0c; Wed, 30 Mar 2022 04:28:12 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:37178 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nZTgV-0004zP-Bq; Wed, 30 Mar 2022 04:28:10 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowADXL6ONFERicF17AA--.34655S2;
 Wed, 30 Mar 2022 16:27:59 +0800 (CST)
Subject: Re: [PATCH qemu v5 05/14] target/riscv: rvv: Add tail agnostic for
 vector load / store instructions
To: =?UTF-8?B?6Zmz57SE5bu3?= <yueh.ting.chen@gmail.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <164845204233.25323.14607469451359734000-5@git.sr.ht>
 <7f3c995d-182f-f1b3-4e79-94f5b81e1be9@iscas.ac.cn>
 <BC7B9267-08F4-4CF0-9BAD-52CF8DA2DCC2@gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <5ce85a5a-8309-9016-b88f-69af545e4114@iscas.ac.cn>
Date: Wed, 30 Mar 2022 16:27:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <BC7B9267-08F4-4CF0-9BAD-52CF8DA2DCC2@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------8DB15D91056AD1D602B12DED"
Content-Language: en-US
X-CM-TRANSID: qwCowADXL6ONFERicF17AA--.34655S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFyruw1xWr1kCw4UCF1xKrg_yoW7Aw13pr
 48Gr47JrWrJrZ7Wr1UGF1UZryrJr1UJw1UJr18tF1UJrW5Gr1IqF1jvF1j9r1UJrs7Ar1r
 t3WDAr17ua4DZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7M4xvF2IEb7IF0Fy264kE64k0F24l7480Y4vEI4kI2Ix0rVAqx4xJ
 Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI4
 8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
 Y4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
 0E14v26r4j6r4UJwCE64xvF2IEb7IF0Fy7YxBIdaVFxhVjvjDU0xZFpf9x0JUcqXdUUUUU
 =
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
X-List-Received-Date: Wed, 30 Mar 2022 08:28:13 -0000

This is a multi-part message in MIME format.
--------------8DB15D91056AD1D602B12DED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/3/30 下午3:42, 陳約廷 写道:
>
>> Weiwei Li <liweiwei@iscas.ac.cn <mailto:liweiwei@iscas.ac.cn>> 於 
>> 2022年3月28日 下午7:56 寫道：
>>
>>
>> 在 2022/3/7 下午3:10, ~eopxd 写道:
>>> From: eopXD <eop.chen@sifive.com <mailto:eop.chen@sifive.com>>
>>>
>>> Signed-off-by: eop Chen <eop.chen@sifive.com 
>>> <mailto:eop.chen@sifive.com>>
>>> Reviewed-by: Frank Chang <frank.chang@sifive.com 
>>> <mailto:frank.chang@sifive.com>>
>>> ---
>>>  target/riscv/insn_trans/trans_rvv.c.inc |  9 +++++++
>>>  target/riscv/vector_helper.c            | 32 +++++++++++++++++++++++++
>>>  2 files changed, 41 insertions(+)
>>>
>>>  diff --git a/target/riscv/vector_helper.c 
>>> b/target/riscv/vector_helper.c
>>> index 39c79c59c2..1c7015e917 100644
>>> --- a/target/riscv/vector_helper.c
>>> +++ b/target/riscv/vector_helper.c
>>> @@ -289,6 +289,9 @@ vext_ldst_stride(void *vd, void *v0, 
>>> target_ulong base,
>>>      uint32_t i, k;
>>>      uint32_t nf = vext_nf(desc);
>>>      uint32_t max_elems = vext_max_elems(desc, log2_esz);
>>> +    uint32_t esz = 1 << log2_esz;
>>> +    uint32_t total_elems = vext_get_total_elems(desc, esz);
>>> +    uint32_t vta = vext_vta(desc);
>>>        for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>>>          if (!vm && !vext_elem_mask(v0, i)) {
>>> @@ -303,6 +306,11 @@ vext_ldst_stride(void *vd, void *v0, 
>>> target_ulong base,
>>>          }
>>>      }
>>>      env->vstart = 0;
>>> +    /* set tail elements to 1s */
>>> +    for (k = 0; k < nf; ++k) {
>>> +        vext_set_elems_1s_fns[log2_esz](vd, vta, env->vl + k * 
>>> total_elems,
>>> +                                        env->vl * esz, total_elems 
>>> * esz);
>>> +    }
>>>  }
>>>    #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN) 
>>>                        \
>>> @@ -348,6 +356,9 @@ vext_ldst_us(void *vd, target_ulong base, 
>>> CPURISCVState *env, uint32_t desc,
>>>      uint32_t i, k;
>>>      uint32_t nf = vext_nf(desc);
>>>      uint32_t max_elems = vext_max_elems(desc, log2_esz);
>>> +    uint32_t esz = 1 << log2_esz;
>>> +    uint32_t total_elems = vext_get_total_elems(desc, esz);
>>> +    uint32_t vta = vext_vta(desc);
>>>        /* load bytes from guest memory */
>>>      for (i = env->vstart; i < evl; i++, env->vstart++) {
>>> @@ -359,6 +370,11 @@ vext_ldst_us(void *vd, target_ulong base, 
>>> CPURISCVState *env, uint32_t desc,
>>>          }
>>>      }
>>>      env->vstart = 0;
>>> +    /* set tail elements to 1s */
>>> +    for (k = 0; k < nf; ++k) {
>>> +        vext_set_elems_1s_fns[log2_esz](vd, vta, env->vl + k * 
>>> total_elems,
>>> +                                        env->vl * esz, total_elems 
>>> * esz);
>>> +    }
>>>  }
>>>
>>
>> It seems incorrect here. similar to following load/store helper.
>>
>> In above instructions,  following elements are loaded:
>>
>> 0       *  max_elems          ...     0      *max_elems + vl - 1
>>
>> 1       *  max_elems          ...     1     *max_elems + vl - 1
>>
>> .......
>>
>> (nf-1)* max_elems         ...    (nf-1)*max_elems + vl - 1
>>
>> So,  the elements[vl  .. max_elems  - 1]  are  tail elements, however 
>> elements[vl ... 1* total_elems - 1] may not:
>>
>> elements from max_elems to total_elems - 1 are active elements, If 
>> total_elems > max_elems(LMUL< 1)
>>
>> Or LMUL should be equal or greater than 1 here? I didn't find any 
>> description about this from the spec.
>>
>> I also have another question about the tail elements for these 
>> load/store instructions:
>>
>> when nf = 3, LMUL = 1, vl=vlmax,  reg, reg+1, reg+2 will be loaded, 
>> then whether elements in reg+3
>>
>> (if they belong to the same register group) are tail elements?
>>
>> Regards,
>>
>> Weiwei Li
>>
>
> The LMUL sent into vector helper function from `trans_rvv.c.inc` takes 
> EMUL
> (effective LMUL) instead of LMUL. Take trans_rvv.c.inc::ld_us_op for 
> example,
>
> ```
> /*
> * Vector load/store instructions have the EEW encoded
> * directly in the instructions. The maximum vector size is
> * calculated with EMUL rather than LMUL.
> */
> uint8_t emul = vext_get_emul(s, eew);
> data = FIELD_DP32(data, VDATA, VM, a->vm);
> data = FIELD_DP32(data, VDATA, LMUL, emul);
> data = FIELD_DP32(data, VDATA, NF, a->nf);
> return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
> ```
>
> And vext_get_emul always return something at least the length of a 
> vector register:
>
> ```
> static uint8_t vext_get_emul(DisasContext *s, uint8_t eew)
> {
> int8_t emul = eew - s->sew + s->lmul;
> return emul < 0 ? 0 : emul;
> }
> ```
>
> In this case I guess the naming is a little bit misleading, 
> `vext_max_elems` would be
> equivalent to `vext_get_total_elems` for all load / store 
> instructions, which guarantees
> That LMUL is always equal or greater to 1. In conclusion, the behavior 
> is correct here.

OK.  Thanks for your patient explaining.

Another question: max_elems is equal to total_elems when lmul >= 0.

So max_elems can be reused  here instead of caculating total_elems again.

>
> I don’t understand your second question though. If nf = 3, there will 
> be 3 registers
> involved with the instruction (namely reg, reg+1, reg+2). Why do we 
> care about
> (reg+3)?
>
I just consider register group here. Reg, reg+1, reg+2 and reg+3 may 
belong to the same register group.

Regards,

Weiwei Li

> Thanks for pointing out this question and all your efforts for 
> reviewing. I really
> appreciate it.
>
> Regards,
>
> eop Chen

--------------8DB15D91056AD1D602B12DED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5Pgog
ICAgPHA+PGJyPgogICAgPC9wPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij7l
nKggMjAyMi8zLzMwIOS4i+WNiDM6NDIsIOmZs+e0hOW7tyDlhpnpgZM6PGJyPgogICAgPC9k
aXY+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6QkM3Qjky
NjctMDhGNC00Q0YwLTlCQUQtNTJDRjhEQTJEQ0MyQGdtYWlsLmNvbSI+CiAgICAgIDxtZXRh
IGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0
PVVURi04Ij4KICAgICAgPGRpdj48YnIgY2xhc3M9IiI+CiAgICAgICAgPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSIgY2xhc3M9IiI+CiAgICAgICAgICA8ZGl2IGNsYXNzPSIiPldlaXdlaSBM
aSAmbHQ7PGEKICAgICAgICAgICAgICBocmVmPSJtYWlsdG86bGl3ZWl3ZWlAaXNjYXMuYWMu
Y24iIGNsYXNzPSIiCiAgICAgICAgICAgICAgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIj5saXdl
aXdlaUBpc2Nhcy5hYy5jbjwvYT4mZ3Q7IOaWvAogICAgICAgICAgICAyMDIy5bm0M+aciDI4
5pelIOS4i+WNiDc6NTYg5a+r6YGT77yaPC9kaXY+CiAgICAgICAgICA8YnIgY2xhc3M9IkFw
cGxlLWludGVyY2hhbmdlLW5ld2xpbmUiPgogICAgICAgICAgPGRpdiBjbGFzcz0iIj4KICAg
ICAgICAgICAgPGRpdiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAg5Zyo
IDIwMjIvMy83IOS4i+WNiDM6MTAsIH5lb3B4ZCDlhpnpgZM6PGJyIGNsYXNzPSIiPgogICAg
ICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNsYXNzPSIiPkZyb206IGVvcFhE
ICZsdDs8YQogICAgICAgICAgICAgICAgICBocmVmPSJtYWlsdG86ZW9wLmNoZW5Ac2lmaXZl
LmNvbSIgY2xhc3M9IiIKICAgICAgICAgICAgICAgICAgbW96LWRvLW5vdC1zZW5kPSJ0cnVl
Ij5lb3AuY2hlbkBzaWZpdmUuY29tPC9hPiZndDs8YnIKICAgICAgICAgICAgICAgICAgY2xh
c3M9IiI+CiAgICAgICAgICAgICAgICA8YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgICBT
aWduZWQtb2ZmLWJ5OiBlb3AgQ2hlbiAmbHQ7PGEKICAgICAgICAgICAgICAgICAgaHJlZj0i
bWFpbHRvOmVvcC5jaGVuQHNpZml2ZS5jb20iIGNsYXNzPSIiCiAgICAgICAgICAgICAgICAg
IG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+ZW9wLmNoZW5Ac2lmaXZlLmNvbTwvYT4mZ3Q7PGJy
CiAgICAgICAgICAgICAgICAgIGNsYXNzPSIiPgogICAgICAgICAgICAgICAgUmV2aWV3ZWQt
Ynk6IEZyYW5rIENoYW5nICZsdDs8YQogICAgICAgICAgICAgICAgICBocmVmPSJtYWlsdG86
ZnJhbmsuY2hhbmdAc2lmaXZlLmNvbSIgY2xhc3M9IiIKICAgICAgICAgICAgICAgICAgbW96
LWRvLW5vdC1zZW5kPSJ0cnVlIj5mcmFuay5jaGFuZ0BzaWZpdmUuY29tPC9hPiZndDs8YnIK
ICAgICAgICAgICAgICAgICAgY2xhc3M9IiI+CiAgICAgICAgICAgICAgICAtLS08YnIgY2xh
c3M9IiI+CiAgICAgICAgICAgICAgICDCoHRhcmdldC9yaXNjdi9pbnNuX3RyYW5zL3RyYW5z
X3J2di5jLmluYyB8IMKgOSArKysrKysrPGJyCiAgICAgICAgICAgICAgICAgIGNsYXNzPSIi
PgogICAgICAgICAgICAgICAgwqB0YXJnZXQvcmlzY3YvdmVjdG9yX2hlbHBlci5jIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB8IDMyCiAgICAgICAgICAgICAgICArKysrKysrKysrKysrKysr
KysrKysrKysrPGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgICAgwqAyIGZpbGVzIGNoYW5n
ZWQsIDQxIGluc2VydGlvbnMoKyk8YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgICA8YnIg
Y2xhc3M9IiI+CiAgICAgICAgICAgICAgICDCoGRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3Yv
dmVjdG9yX2hlbHBlci5jCiAgICAgICAgICAgICAgICBiL3RhcmdldC9yaXNjdi92ZWN0b3Jf
aGVscGVyLmM8YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgICBpbmRleCAzOWM3OWM1OWMy
Li4xYzcwMTVlOTE3IDEwMDY0NDxiciBjbGFzcz0iIj4KICAgICAgICAgICAgICAgIC0tLSBh
L3RhcmdldC9yaXNjdi92ZWN0b3JfaGVscGVyLmM8YnIgY2xhc3M9IiI+CiAgICAgICAgICAg
ICAgICArKysgYi90YXJnZXQvcmlzY3YvdmVjdG9yX2hlbHBlci5jPGJyIGNsYXNzPSIiPgog
ICAgICAgICAgICAgICAgQEAgLTI4OSw2ICsyODksOSBAQCB2ZXh0X2xkc3Rfc3RyaWRlKHZv
aWQgKnZkLCB2b2lkICp2MCwKICAgICAgICAgICAgICAgIHRhcmdldF91bG9uZyBiYXNlLDxi
ciBjbGFzcz0iIj4KICAgICAgICAgICAgICAgIMKgwqDCoMKgwqB1aW50MzJfdCBpLCBrOzxi
ciBjbGFzcz0iIj4KICAgICAgICAgICAgICAgIMKgwqDCoMKgwqB1aW50MzJfdCBuZiA9IHZl
eHRfbmYoZGVzYyk7PGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgICAgwqDCoMKgwqDCoHVp
bnQzMl90IG1heF9lbGVtcyA9IHZleHRfbWF4X2VsZW1zKGRlc2MsCiAgICAgICAgICAgICAg
ICBsb2cyX2Vzeik7PGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgICAgKyDCoMKgwqB1aW50
MzJfdCBlc3ogPSAxICZsdDsmbHQ7IGxvZzJfZXN6OzxiciBjbGFzcz0iIj4KICAgICAgICAg
ICAgICAgICsgwqDCoMKgdWludDMyX3QgdG90YWxfZWxlbXMgPSB2ZXh0X2dldF90b3RhbF9l
bGVtcyhkZXNjLAogICAgICAgICAgICAgICAgZXN6KTs8YnIgY2xhc3M9IiI+CiAgICAgICAg
ICAgICAgICArIMKgwqDCoHVpbnQzMl90IHZ0YSA9IHZleHRfdnRhKGRlc2MpOzxiciBjbGFz
cz0iIj4KICAgICAgICAgICAgICAgIMKgwqDCoMKgwqDCoMKgZm9yIChpID0gZW52LSZndDt2
c3RhcnQ7IGkgJmx0OyBlbnYtJmd0O3ZsOyBpKyssCiAgICAgICAgICAgICAgICBlbnYtJmd0
O3ZzdGFydCsrKSB7PGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgICAgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKCF2bSAmYW1wOyZhbXA7ICF2ZXh0X2VsZW1fbWFzayh2MCwgaSkpIHs8YnIK
ICAgICAgICAgICAgICAgICAgY2xhc3M9IiI+CiAgICAgICAgICAgICAgICBAQCAtMzAzLDYg
KzMwNiwxMSBAQCB2ZXh0X2xkc3Rfc3RyaWRlKHZvaWQgKnZkLCB2b2lkCiAgICAgICAgICAg
ICAgICAqdjAsIHRhcmdldF91bG9uZyBiYXNlLDxiciBjbGFzcz0iIj4KICAgICAgICAgICAg
ICAgIMKgwqDCoMKgwqDCoMKgwqDCoH08YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgICDC
oMKgwqDCoMKgfTxiciBjbGFzcz0iIj4KICAgICAgICAgICAgICAgIMKgwqDCoMKgwqBlbnYt
Jmd0O3ZzdGFydCA9IDA7PGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgICAgKyDCoMKgwqAv
KiBzZXQgdGFpbCBlbGVtZW50cyB0byAxcyAqLzxiciBjbGFzcz0iIj4KICAgICAgICAgICAg
ICAgICsgwqDCoMKgZm9yIChrID0gMDsgayAmbHQ7IG5mOyArK2spIHs8YnIgY2xhc3M9IiI+
CiAgICAgICAgICAgICAgICArIMKgwqDCoMKgwqDCoMKgdmV4dF9zZXRfZWxlbXNfMXNfZm5z
W2xvZzJfZXN6XSh2ZCwgdnRhLAogICAgICAgICAgICAgICAgZW52LSZndDt2bCArIGsgKiB0
b3RhbF9lbGVtcyw8YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgICArIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGVudi0mZ3Q7dmwgKgogICAgICAgICAgICAgICAgZXN6LCB0b3RhbF9l
bGVtcyAqIGVzeik7PGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgICAgKyDCoMKgwqB9PGJy
IGNsYXNzPSIiPgogICAgICAgICAgICAgICAgwqB9PGJyIGNsYXNzPSIiPgogICAgICAgICAg
ICAgICAgwqDCoMKgI2RlZmluZSBHRU5fVkVYVF9MRF9TVFJJREUoTkFNRSwgRVRZUEUsIExP
QURfRk4pCiAgICAgICAgICAgICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgXDxiciBjbGFzcz0iIj4KICAgICAgICAgICAgICAgIEBAIC0zNDgs
NiArMzU2LDkgQEAgdmV4dF9sZHN0X3VzKHZvaWQgKnZkLCB0YXJnZXRfdWxvbmcKICAgICAg
ICAgICAgICAgIGJhc2UsIENQVVJJU0NWU3RhdGUgKmVudiwgdWludDMyX3QgZGVzYyw8YnIg
Y2xhc3M9IiI+CiAgICAgICAgICAgICAgICDCoMKgwqDCoMKgdWludDMyX3QgaSwgazs8YnIg
Y2xhc3M9IiI+CiAgICAgICAgICAgICAgICDCoMKgwqDCoMKgdWludDMyX3QgbmYgPSB2ZXh0
X25mKGRlc2MpOzxiciBjbGFzcz0iIj4KICAgICAgICAgICAgICAgIMKgwqDCoMKgwqB1aW50
MzJfdCBtYXhfZWxlbXMgPSB2ZXh0X21heF9lbGVtcyhkZXNjLAogICAgICAgICAgICAgICAg
bG9nMl9lc3opOzxiciBjbGFzcz0iIj4KICAgICAgICAgICAgICAgICsgwqDCoMKgdWludDMy
X3QgZXN6ID0gMSAmbHQ7Jmx0OyBsb2cyX2Vzejs8YnIgY2xhc3M9IiI+CiAgICAgICAgICAg
ICAgICArIMKgwqDCoHVpbnQzMl90IHRvdGFsX2VsZW1zID0gdmV4dF9nZXRfdG90YWxfZWxl
bXMoZGVzYywKICAgICAgICAgICAgICAgIGVzeik7PGJyIGNsYXNzPSIiPgogICAgICAgICAg
ICAgICAgKyDCoMKgwqB1aW50MzJfdCB2dGEgPSB2ZXh0X3Z0YShkZXNjKTs8YnIgY2xhc3M9
IiI+CiAgICAgICAgICAgICAgICDCoMKgwqDCoMKgwqDCoC8qIGxvYWQgYnl0ZXMgZnJvbSBn
dWVzdCBtZW1vcnkgKi88YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgICDCoMKgwqDCoMKg
Zm9yIChpID0gZW52LSZndDt2c3RhcnQ7IGkgJmx0OyBldmw7IGkrKywKICAgICAgICAgICAg
ICAgIGVudi0mZ3Q7dnN0YXJ0KyspIHs8YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgICBA
QCAtMzU5LDYgKzM3MCwxMSBAQCB2ZXh0X2xkc3RfdXModm9pZCAqdmQsIHRhcmdldF91bG9u
ZwogICAgICAgICAgICAgICAgYmFzZSwgQ1BVUklTQ1ZTdGF0ZSAqZW52LCB1aW50MzJfdCBk
ZXNjLDxiciBjbGFzcz0iIj4KICAgICAgICAgICAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoH08
YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgICDCoMKgwqDCoMKgfTxiciBjbGFzcz0iIj4K
ICAgICAgICAgICAgICAgIMKgwqDCoMKgwqBlbnYtJmd0O3ZzdGFydCA9IDA7PGJyIGNsYXNz
PSIiPgogICAgICAgICAgICAgICAgKyDCoMKgwqAvKiBzZXQgdGFpbCBlbGVtZW50cyB0byAx
cyAqLzxiciBjbGFzcz0iIj4KICAgICAgICAgICAgICAgICsgwqDCoMKgZm9yIChrID0gMDsg
ayAmbHQ7IG5mOyArK2spIHs8YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgICArIMKgwqDC
oMKgwqDCoMKgdmV4dF9zZXRfZWxlbXNfMXNfZm5zW2xvZzJfZXN6XSh2ZCwgdnRhLAogICAg
ICAgICAgICAgICAgZW52LSZndDt2bCArIGsgKiB0b3RhbF9lbGVtcyw8YnIgY2xhc3M9IiI+
CiAgICAgICAgICAgICAgICArIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVudi0mZ3Q7dmwg
KgogICAgICAgICAgICAgICAgZXN6LCB0b3RhbF9lbGVtcyAqIGVzeik7PGJyIGNsYXNzPSIi
PgogICAgICAgICAgICAgICAgKyDCoMKgwqB9PGJyIGNsYXNzPSIiPgogICAgICAgICAgICAg
ICAgwqB9PGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgICAgwqA8YnIgY2xhc3M9IiI+CiAg
ICAgICAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICAgICAgICAgIDxiciBjbGFzcz0iIj4K
ICAgICAgICAgICAgICBJdCBzZWVtcyBpbmNvcnJlY3QgaGVyZS4gc2ltaWxhciB0byBmb2xs
b3dpbmcgbG9hZC9zdG9yZQogICAgICAgICAgICAgIGhlbHBlci48YnIgY2xhc3M9IiI+CiAg
ICAgICAgICAgICAgPGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgIEluIGFib3ZlIGluc3Ry
dWN0aW9ucyzCoCBmb2xsb3dpbmcgZWxlbWVudHMgYXJlIGxvYWRlZDo8YnIKICAgICAgICAg
ICAgICAgIGNsYXNzPSIiPgogICAgICAgICAgICAgIDxiciBjbGFzcz0iIj4KICAgICAgICAg
ICAgICAwwqDCoMKgwqDCoMKgICrCoCBtYXhfZWxlbXPCoMKgwqDCoMKgwqDCoMKgwqAgLi4u
IMKgwqDCoCAwwqDCoMKgwqDCoCAqbWF4X2VsZW1zICsKICAgICAgICAgICAgICB2bCAtIDE8
YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgPGJyIGNsYXNzPSIiPgogICAgICAgICAgICAg
IDHCoMKgwqDCoMKgwqAgKsKgIG1heF9lbGVtc8KgwqDCoMKgwqDCoMKgwqDCoCAuLi4gwqDC
oMKgIDHCoMKgwqDCoCAqbWF4X2VsZW1zICsKICAgICAgICAgICAgICB2bCAtIDE8YnIgY2xh
c3M9IiI+CiAgICAgICAgICAgICAgPGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgIC4uLi4u
Li48YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgPGJyIGNsYXNzPSIiPgogICAgICAgICAg
ICAgIChuZi0xKSogbWF4X2VsZW1zwqDCoMKgwqDCoMKgwqDCoCAuLi7CoMKgwqAgKG5mLTEp
Km1heF9lbGVtcyArIHZsIC0gMTxicgogICAgICAgICAgICAgICAgY2xhc3M9IiI+CiAgICAg
ICAgICAgICAgPGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgIFNvLMKgIHRoZSBlbGVtZW50
c1t2bMKgIC4uIG1heF9lbGVtc8KgIC0gMV3CoCBhcmXCoCB0YWlsCiAgICAgICAgICAgICAg
ZWxlbWVudHMsIGhvd2V2ZXIgZWxlbWVudHNbdmwgLi4uIDEqIHRvdGFsX2VsZW1zIC0gMV0g
bWF5CiAgICAgICAgICAgICAgbm90OjxiciBjbGFzcz0iIj4KICAgICAgICAgICAgICA8YnIg
Y2xhc3M9IiI+CiAgICAgICAgICAgICAgZWxlbWVudHMgZnJvbSBtYXhfZWxlbXMgdG8gdG90
YWxfZWxlbXMgLSAxIGFyZSBhY3RpdmUKICAgICAgICAgICAgICBlbGVtZW50cywgSWYgdG90
YWxfZWxlbXMgJmd0OyBtYXhfZWxlbXMoTE1VTCZsdDsgMSk8YnIKICAgICAgICAgICAgICAg
IGNsYXNzPSIiPgogICAgICAgICAgICAgIDxiciBjbGFzcz0iIj4KICAgICAgICAgICAgICBP
ciBMTVVMIHNob3VsZCBiZSBlcXVhbCBvciBncmVhdGVyIHRoYW4gMSBoZXJlPyBJIGRpZG4n
dAogICAgICAgICAgICAgIGZpbmQgYW55IGRlc2NyaXB0aW9uIGFib3V0IHRoaXMgZnJvbSB0
aGUgc3BlYy48YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgPGJyIGNsYXNzPSIiPgogICAg
ICAgICAgICAgIEkgYWxzbyBoYXZlIGFub3RoZXIgcXVlc3Rpb24gYWJvdXQgdGhlIHRhaWwg
ZWxlbWVudHMgZm9yCiAgICAgICAgICAgICAgdGhlc2UgbG9hZC9zdG9yZSBpbnN0cnVjdGlv
bnM6PGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgIDxiciBjbGFzcz0iIj4KICAgICAgICAg
ICAgICB3aGVuIG5mID0gMywgTE1VTCA9IDEsIHZsPXZsbWF4LMKgIHJlZywgcmVnKzEsIHJl
ZysyIHdpbGwKICAgICAgICAgICAgICBiZSBsb2FkZWQsIHRoZW4gd2hldGhlciBlbGVtZW50
cyBpbiByZWcrMzxiciBjbGFzcz0iIj4KICAgICAgICAgICAgICA8YnIgY2xhc3M9IiI+CiAg
ICAgICAgICAgICAgKGlmIHRoZXkgYmVsb25nIHRvIHRoZSBzYW1lIHJlZ2lzdGVyIGdyb3Vw
KSBhcmUgdGFpbAogICAgICAgICAgICAgIGVsZW1lbnRzPzxiciBjbGFzcz0iIj4KICAgICAg
ICAgICAgICA8YnIgY2xhc3M9IiI+CiAgICAgICAgICAgICAgUmVnYXJkcyw8YnIgY2xhc3M9
IiI+CiAgICAgICAgICAgICAgPGJyIGNsYXNzPSIiPgogICAgICAgICAgICAgIFdlaXdlaSBM
aTxiciBjbGFzcz0iIj4KICAgICAgICAgICAgICA8YnIgY2xhc3M9IiI+CiAgICAgICAgICAg
IDwvZGl2PgogICAgICAgICAgPC9kaXY+CiAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8
L2Rpdj4KICAgICAgPGJyIGNsYXNzPSIiPgogICAgICA8ZGl2IGNsYXNzPSIiPlRoZSBMTVVM
IHNlbnQgaW50byB2ZWN0b3IgaGVscGVyIGZ1bmN0aW9uIGZyb20KICAgICAgICBgdHJhbnNf
cnZ2LmMuaW5jYCB0YWtlcyBFTVVMPC9kaXY+CiAgICAgIDxkaXYgY2xhc3M9IiI+KGVmZmVj
dGl2ZSBMTVVMKSBpbnN0ZWFkIG9mIExNVUwuIFRha2UKICAgICAgICB0cmFuc19ydnYuYy5p
bmM6OmxkX3VzX29wIGZvciBleGFtcGxlLDwvZGl2PgogICAgICA8ZGl2IGNsYXNzPSIiPjxi
ciBjbGFzcz0iIj4KICAgICAgPC9kaXY+CiAgICAgIDxkaXYgY2xhc3M9IiI+YGBgPC9kaXY+
CiAgICAgIDxkaXYgY2xhc3M9IiI+CiAgICAgICAgPGRpdiBzdHlsZT0iY29sb3I6IHJnYig1
NCwgNTQsIDU0KTsgZm9udC1mYW1pbHk6IE1lbmxvLCBNb25hY28sICZxdW90O0NvdXJpZXIg
TmV3JnF1b3Q7LCBtb25vc3BhY2U7IGxpbmUtaGVpZ2h0OiAxOHB4OyB3aGl0ZS1zcGFjZTog
cHJlOyIgY2xhc3M9IiI+PGRpdiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1j
b2xvcjogcmdiYSgyNTUsIDI1NSwgMjU1LCAwKTsiIGNsYXNzPSIiPiAgICA8c3BhbiBzdHls
ZT0iY29sb3I6IHJnYigxNDYsIDIwNSwgMTIwKTsiIGNsYXNzPSIiPi8qPC9zcGFuPjwvc3Bh
bj48L2Rpdj48ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDE0NiwgMjA1
LCAxMjApOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2JhKDI1NSwgMjU1LCAyNTUsIDApOyIgY2xh
c3M9IiI+ICAgICAqIFZlY3RvciBsb2FkL3N0b3JlIGluc3RydWN0aW9ucyBoYXZlIHRoZSBF
RVcgZW5jb2RlZDwvc3Bhbj48L2Rpdj48ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjb2xv
cjogcmdiKDE0NiwgMjA1LCAxMjApOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2JhKDI1NSwgMjU1
LCAyNTUsIDApOyIgY2xhc3M9IiI+ICAgICAqIGRpcmVjdGx5IGluIHRoZSBpbnN0cnVjdGlv
bnMuIFRoZSBtYXhpbXVtIHZlY3RvciBzaXplIGlzPC9zcGFuPjwvZGl2PjxkaXYgY2xhc3M9
IiI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMTQ2LCAyMDUsIDEyMCk7IGJhY2tncm91bmQt
Y29sb3I6IHJnYmEoMjU1LCAyNTUsIDI1NSwgMCk7IiBjbGFzcz0iIj4gICAgICogY2FsY3Vs
YXRlZCB3aXRoIEVNVUwgcmF0aGVyIHRoYW4gTE1VTC48L3NwYW4+PC9kaXY+PGRpdiBjbGFz
cz0iIj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigxNDYsIDIwNSwgMTIwKTsgYmFja2dyb3Vu
ZC1jb2xvcjogcmdiYSgyNTUsIDI1NSwgMjU1LCAwKTsiIGNsYXNzPSIiPiAgICAgKi88L3Nw
YW4+PC9kaXY+PGRpdiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjog
cmdiYSgyNTUsIDI1NSwgMjU1LCAwKTsiIGNsYXNzPSIiPiAgICA8c3BhbiBzdHlsZT0iY29s
b3I6IHJnYig2MywgMTUxLCAyMjMpOyIgY2xhc3M9IiI+dWludDhfdDwvc3Bhbj4gZW11bCA9
IDxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDk5LCA5OSwgMzYpOyIgY2xhc3M9IiI+dmV4dF9n
ZXRfZW11bDwvc3Bhbj4ocywgZWV3KTs8L3NwYW4+PC9kaXY+PGRpdiBjbGFzcz0iIj48c3Bh
biBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogcmdiYSgyNTUsIDI1NSwgMjU1LCAwKTsiIGNs
YXNzPSIiPiAgICBkYXRhID0gPHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoNjMsIDE1MSwgMjIz
KTsiIGNsYXNzPSIiPkZJRUxEX0RQMzI8L3NwYW4+KGRhdGEsIFZEQVRBLCBWTSwgPHNwYW4g
c3R5bGU9ImNvbG9yOiByZ2IoOSwgODksIDEzMik7IiBjbGFzcz0iIj5hPC9zcGFuPi0mZ3Q7
PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoOSwgODksIDEzMik7IiBjbGFzcz0iIj52bTwvc3Bh
bj4pOzwvc3Bhbj48L2Rpdj48ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5k
LWNvbG9yOiByZ2JhKDI1NSwgMjU1LCAyNTUsIDApOyIgY2xhc3M9IiI+ICAgIGRhdGEgPSA8
c3BhbiBzdHlsZT0iY29sb3I6IHJnYig2MywgMTUxLCAyMjMpOyIgY2xhc3M9IiI+RklFTERf
RFAzMjwvc3Bhbj4oZGF0YSwgVkRBVEEsIExNVUwsIGVtdWwpOzwvc3Bhbj48L2Rpdj48ZGl2
IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiByZ2JhKDI1NSwgMjU1
LCAyNTUsIDApOyIgY2xhc3M9IiI+ICAgIGRhdGEgPSA8c3BhbiBzdHlsZT0iY29sb3I6IHJn
Yig2MywgMTUxLCAyMjMpOyIgY2xhc3M9IiI+RklFTERfRFAzMjwvc3Bhbj4oZGF0YSwgVkRB
VEEsIE5GLCA8c3BhbiBzdHlsZT0iY29sb3I6IHJnYig5LCA4OSwgMTMyKTsiIGNsYXNzPSIi
PmE8L3NwYW4+LSZndDs8c3BhbiBzdHlsZT0iY29sb3I6IHJnYig5LCA4OSwgMTMyKTsiIGNs
YXNzPSIiPm5mPC9zcGFuPik7PC9zcGFuPjwvZGl2PjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5
bGU9ImJhY2tncm91bmQtY29sb3I6IHJnYmEoMjU1LCAyNTUsIDI1NSwgMCk7IiBjbGFzcz0i
Ij4gICAgPHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMTU3LCA3OCwgMTUwKTsiIGNsYXNzPSIi
PnJldHVybjwvc3Bhbj4gPHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoOTksIDk5LCAzNik7IiBj
bGFzcz0iIj5sZHN0X3VzX3RyYW5zPC9zcGFuPig8c3BhbiBzdHlsZT0iY29sb3I6IHJnYig5
LCA4OSwgMTMyKTsiIGNsYXNzPSIiPmE8L3NwYW4+LSZndDs8c3BhbiBzdHlsZT0iY29sb3I6
IHJnYig5LCA4OSwgMTMyKTsiIGNsYXNzPSIiPnJkPC9zcGFuPiwgPHNwYW4gc3R5bGU9ImNv
bG9yOiByZ2IoOSwgODksIDEzMik7IiBjbGFzcz0iIj5hPC9zcGFuPi0mZ3Q7PHNwYW4gc3R5
bGU9ImNvbG9yOiByZ2IoOSwgODksIDEzMik7IiBjbGFzcz0iIj5yczE8L3NwYW4+LCBkYXRh
LCBmbiwgcywgPHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoNjMsIDE1MSwgMjIzKTsiIGNsYXNz
PSIiPmZhbHNlPC9zcGFuPik7PC9zcGFuPjwvZGl2PjwvZGl2PgogICAgICA8L2Rpdj4KICAg
ICAgPGRpdiBjbGFzcz0iIj5gYGA8L2Rpdj4KICAgICAgPGRpdiBjbGFzcz0iIj48YnIgY2xh
c3M9IiI+CiAgICAgIDwvZGl2PgogICAgICA8ZGl2IGNsYXNzPSIiPkFuZCB2ZXh0X2dldF9l
bXVsIGFsd2F5cyByZXR1cm4gc29tZXRoaW5nIGF0IGxlYXN0CiAgICAgICAgdGhlIGxlbmd0
aCBvZiBhIHZlY3RvciByZWdpc3Rlcjo8L2Rpdj4KICAgICAgPGRpdiBjbGFzcz0iIj48YnIg
Y2xhc3M9IiI+CiAgICAgIDwvZGl2PgogICAgICA8ZGl2IGNsYXNzPSIiPmBgYDwvZGl2Pgog
ICAgICA8ZGl2IGNsYXNzPSIiPgogICAgICAgIDxkaXYgc3R5bGU9ImNvbG9yOiByZ2IoNTQs
IDU0LCA1NCk7IGZvbnQtZmFtaWx5OiBNZW5sbywgTW9uYWNvLCAmcXVvdDtDb3VyaWVyIE5l
dyZxdW90OywgbW9ub3NwYWNlOyBsaW5lLWhlaWdodDogMThweDsgd2hpdGUtc3BhY2U6IHBy
ZTsiIGNsYXNzPSIiPjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29s
b3I6IHJnYmEoMjU1LCAyNTUsIDI1NSwgMCk7IiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iY29s
b3I6IHJnYig2MywgMTUxLCAyMjMpOyIgY2xhc3M9IiI+c3RhdGljPC9zcGFuPiA8c3BhbiBz
dHlsZT0iY29sb3I6IHJnYig2MywgMTUxLCAyMjMpOyIgY2xhc3M9IiI+dWludDhfdDwvc3Bh
bj4gPHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoOTksIDk5LCAzNik7IiBjbGFzcz0iIj52ZXh0
X2dldF9lbXVsPC9zcGFuPihEaXNhc0NvbnRleHQgKjxzcGFuIHN0eWxlPSJjb2xvcjogcmdi
KDksIDg5LCAxMzIpOyIgY2xhc3M9IiI+czwvc3Bhbj4sIDxzcGFuIHN0eWxlPSJjb2xvcjog
cmdiKDYzLCAxNTEsIDIyMyk7IiBjbGFzcz0iIj51aW50OF90PC9zcGFuPiA8c3BhbiBzdHls
ZT0iY29sb3I6IHJnYig5LCA4OSwgMTMyKTsiIGNsYXNzPSIiPmVldzwvc3Bhbj4pPC9zcGFu
PjwvZGl2PjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IHJn
YmEoMjU1LCAyNTUsIDI1NSwgMCk7IiBjbGFzcz0iIj57PC9zcGFuPjwvZGl2PjxkaXYgY2xh
c3M9IiI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IHJnYmEoMjU1LCAyNTUsIDI1
NSwgMCk7IiBjbGFzcz0iIj4gICAgPHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoNjMsIDE1MSwg
MjIzKTsiIGNsYXNzPSIiPmludDhfdDwvc3Bhbj4gZW11bCA9IGVldyAtIDxzcGFuIHN0eWxl
PSJjb2xvcjogcmdiKDksIDg5LCAxMzIpOyIgY2xhc3M9IiI+czwvc3Bhbj4tJmd0OzxzcGFu
IHN0eWxlPSJjb2xvcjogcmdiKDksIDg5LCAxMzIpOyIgY2xhc3M9IiI+c2V3PC9zcGFuPiAr
IDxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDksIDg5LCAxMzIpOyIgY2xhc3M9IiI+czwvc3Bh
bj4tJmd0OzxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDksIDg5LCAxMzIpOyIgY2xhc3M9IiI+
bG11bDwvc3Bhbj47PC9zcGFuPjwvZGl2PjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImJh
Y2tncm91bmQtY29sb3I6IHJnYmEoMjU1LCAyNTUsIDI1NSwgMCk7IiBjbGFzcz0iIj4gICAg
PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMTU3LCA3OCwgMTUwKTsiIGNsYXNzPSIiPnJldHVy
bjwvc3Bhbj4gZW11bCAmbHQ7IDxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDczLCAxMDQsIDU3
KTsiIGNsYXNzPSIiPjA8L3NwYW4+ID8gPHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoNzMsIDEw
NCwgNTcpOyIgY2xhc3M9IiI+MDwvc3Bhbj4gOiBlbXVsOzwvc3Bhbj48L2Rpdj48ZGl2IGNs
YXNzPSIiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiByZ2JhKDI1NSwgMjU1LCAy
NTUsIDApOyIgY2xhc3M9IiI+fTwvc3Bhbj48L2Rpdj4KPC9kaXY+CiAgICAgIDwvZGl2Pgog
ICAgICA8ZGl2IGNsYXNzPSIiPmBgYDwvZGl2PgogICAgICA8ZGl2IGNsYXNzPSIiPjxiciBj
bGFzcz0iIj4KICAgICAgPC9kaXY+CiAgICAgIDxkaXYgY2xhc3M9IiI+SW4gdGhpcyBjYXNl
IEkgZ3Vlc3MgdGhlIG5hbWluZyBpcyBhIGxpdHRsZSBiaXQKICAgICAgICBtaXNsZWFkaW5n
LCBgdmV4dF9tYXhfZWxlbXNgIHdvdWxkIGJlPC9kaXY+CiAgICAgIDxkaXYgY2xhc3M9IiI+
ZXF1aXZhbGVudCB0byBgdmV4dF9nZXRfdG90YWxfZWxlbXNgIGZvciBhbGwgbG9hZCAvCiAg
ICAgICAgc3RvcmUgaW5zdHJ1Y3Rpb25zLCB3aGljaCBndWFyYW50ZWVzPC9kaXY+CiAgICAg
IDxkaXYgY2xhc3M9IiI+VGhhdCBMTVVMIGlzIGFsd2F5cyBlcXVhbCBvciBncmVhdGVyIHRv
IDEuIEluCiAgICAgICAgY29uY2x1c2lvbiwgdGhlIGJlaGF2aW9yIGlzIGNvcnJlY3QgaGVy
ZS48L2Rpdj4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxwPk9LLsKgIFRoYW5rcyBmb3IgeW91
ciBwYXRpZW50IGV4cGxhaW5pbmcuwqAgPGJyPgogICAgPC9wPgogICAgPHA+QW5vdGhlciBx
dWVzdGlvbjogbWF4X2VsZW1zIGlzIGVxdWFsIHRvIHRvdGFsX2VsZW1zIHdoZW4gbG11bAog
ICAgICAmZ3Q7PSAwLjwvcD4KICAgIDxwPlNvIG1heF9lbGVtcyBjYW4gYmUgcmV1c2VkwqAg
aGVyZSBpbnN0ZWFkIG9mIGNhY3VsYXRpbmcKICAgICAgdG90YWxfZWxlbXMgYWdhaW4uPGJy
PgogICAgPC9wPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKICAgICAgY2l0ZT0ibWlk
OkJDN0I5MjY3LTA4RjQtNENGMC05QkFELTUyQ0Y4REEyRENDMkBnbWFpbC5jb20iPgogICAg
ICA8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4KICAgICAgPC9kaXY+CiAgICAgIDxkaXYg
Y2xhc3M9IiI+SSBkb27igJl0IHVuZGVyc3RhbmQgeW91ciBzZWNvbmQgcXVlc3Rpb24gdGhv
dWdoLiBJZgogICAgICAgIG5mID0gMywgdGhlcmUgd2lsbCBiZSAzIHJlZ2lzdGVyczwvZGl2
PgogICAgICA8ZGl2IGNsYXNzPSIiPmludm9sdmVkIHdpdGggdGhlIGluc3RydWN0aW9uIChu
YW1lbHkgcmVnLCByZWcrMSwKICAgICAgICByZWcrMikuIFdoeSBkbyB3ZSBjYXJlIGFib3V0
PC9kaXY+CiAgICAgIDxkaXYgY2xhc3M9IiI+KHJlZyszKT88L2Rpdj4KICAgICAgPGRpdiBj
bGFzcz0iIj48YnIgY2xhc3M9IiI+CiAgICAgIDwvZGl2PgogICAgPC9ibG9ja3F1b3RlPgog
ICAgPHA+SSBqdXN0IGNvbnNpZGVyIHJlZ2lzdGVyIGdyb3VwIGhlcmUuIFJlZywgcmVnKzEs
IHJlZysyIGFuZCByZWcrMwogICAgICBtYXkgYmVsb25nIHRvIHRoZSBzYW1lIHJlZ2lzdGVy
IGdyb3VwLjwvcD4KICAgIDxwPlJlZ2FyZHMsPC9wPgogICAgPHA+V2Vpd2VpIExpPGJyPgog
ICAgPC9wPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKICAgICAgY2l0ZT0ibWlkOkJD
N0I5MjY3LTA4RjQtNENGMC05QkFELTUyQ0Y4REEyRENDMkBnbWFpbC5jb20iPgogICAgICA8
ZGl2IGNsYXNzPSIiPlRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoaXMgcXVlc3Rpb24gYW5k
IGFsbCB5b3VyCiAgICAgICAgZWZmb3J0cyBmb3IgcmV2aWV3aW5nLiBJIHJlYWxseTwvZGl2
PgogICAgICA8ZGl2IGNsYXNzPSIiPmFwcHJlY2lhdGUgaXQuPC9kaXY+CiAgICAgIDxkaXYg
Y2xhc3M9IiI+PGJyIGNsYXNzPSIiPgogICAgICA8L2Rpdj4KICAgICAgPGRpdiBjbGFzcz0i
Ij5SZWdhcmRzLDwvZGl2PgogICAgICA8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4KICAg
ICAgPC9kaXY+CiAgICAgIDxkaXYgY2xhc3M9IiI+ZW9wIENoZW48L2Rpdj4KICAgIDwvYmxv
Y2txdW90ZT4KICA8L2JvZHk+CjwvaHRtbD4K
--------------8DB15D91056AD1D602B12DED--



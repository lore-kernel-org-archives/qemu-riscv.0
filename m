Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRRbn-0004QV-Dm
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 00:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pRRbi-0004Pm-IH; Mon, 13 Feb 2023 00:42:31 -0500
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pRRbf-0001o3-Kf; Mon, 13 Feb 2023 00:42:30 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VbTnGjz_1676266934; 
Received: from 30.221.96.206(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbTnGjz_1676266934) by smtp.aliyun-inc.com;
 Mon, 13 Feb 2023 13:42:15 +0800
Content-Type: multipart/alternative;
 boundary="------------R6MSkV6QcjvaozQVq4l70v1j"
Message-ID: <6c1f0cfb-1abf-394c-6d8a-5dd697794b75@linux.alibaba.com>
Date: Mon, 13 Feb 2023 13:42:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] target/riscv: Smepmp: Skip applying default rules when
 address matches
Content-Language: en-US
To: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
Cc: qemu-devel@nongnu.org
References: <20230209055206.229392-1-hchauhan@ventanamicro.com>
 <5428dd5e-2772-2332-6b39-07a82e14e71b@linux.alibaba.com>
 <27d845c3-efe6-e337-1173-7b9a8db96c1b@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <27d845c3-efe6-e337-1173-7b9a8db96c1b@ventanamicro.com>
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.348, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01,
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
X-List-Received-Date: Mon, 13 Feb 2023 05:42:32 -0000

This is a multi-part message in MIME format.
--------------R6MSkV6QcjvaozQVq4l70v1j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/2/13 13:21, Himanshu Chauhan wrote:
>
> On 13/02/23 09:52, LIU Zhiwei wrote:
>>
>> On 2023/2/9 13:52, Himanshu Chauhan wrote:
>>> When MSECCFG.MML is set, after checking the address range in PMP if the
>>> asked permissions are not same as programmed in PMP, the default
>>> permissions are applied. This should only be the case when there
>>> is no matching address is found.
>>>
>>> This patch skips applying default rules when matching address range
>>> is found. It returns the index of the match PMP entry.
>>>
>>> fixes: 824cac681c3 (target/riscv: Fix PMP propagation for tlb)
>>>
>>> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>>> ---
>>>   target/riscv/pmp.c | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>>> index d85ad07caa..0dfdb35828 100644
>>> --- a/target/riscv/pmp.c
>>> +++ b/target/riscv/pmp.c
>>> @@ -446,9 +446,12 @@ int pmp_hart_has_privs(CPURISCVState *env, 
>>> target_ulong addr,
>>>                   }
>>>               }
>>>   -            if ((privs & *allowed_privs) == privs) {
>>> -                ret = i;
>>> -            }
>>> +            /*
>>> +             * If matching address range was found, the protection 
>>> bits
>>> +             * defined with PMP must be used. We shouldn't fallback on
>>> +             * finding default privileges.
>>> +             */
>>> +            ret = i;
>>
>> Notice the return value is the matching rule index, which includes
>>
>> 1) the address range is matching.
>>
>> 2) the permission of the PMP rule and the memory access type are 
>> matching.
>>
>>
>> So we can't simply remove the second check.  I think the right fix is:
>>
>>            if ((privs & *allowed_privs) == privs) {
>>                 ret = i;
>>  -         }
>>  +         } else {
>>  +        ret = -2;
>>  +         }
>>
>> The -2 return value avoids finding the default privileges. And it 
>> implies no matching rule is found.
>>
>> Zhiwei
>
> Hi Zhiwei,
>
> In case the address range is matched and MSECCFG.MML is set, the 
> permission in *allowed_privs* are binding. 
Yes.
> So if the index matching is returned, the binding permissions are 
> applied by the caller function.
Yes. And the index will also be used. So we should check both conditions 
in this function.
>
> Which case does my patch break?

Look at the get_physical_address_pmp which calls pmp_hart_has_privs,

     pmp_index = pmp_hart_has_privs(env, addr, size, 1 << access_type,

                                    &pmp_priv, mode);

     if (pmp_index < 0) {

         *prot = 0;

         return TRANSLATE_PMP_FAIL;

     }

     *prot = pmp_priv_to_page_prot(pmp_priv);

     if ((tlb_size != NULL) && pmp_index != MAX_RISCV_PMPS) {

         target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);

         target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;

         *tlb_size = pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);

     }

returnTRANSLATE_SUCCESS;

You break the pmp_index < 0 condition.  If ((privs & *allowed_privs) != 
privs,  the get_physical_address_pmp should return fail.

Zhiwei

>
> - Himanshu
>
>>
>>>               break;
>>>           }
>>>       }
--------------R6MSkV6QcjvaozQVq4l70v1j
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2023/2/13 13:21, Himanshu Chauhan
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:27d845c3-efe6-e337-1173-7b9a8db96c1b@ventanamicro.com">=

      <br>
      On 13/02/23 09:52, LIU Zhiwei wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        On 2023/2/9 13:52, Himanshu Chauhan wrote:
        <br>
        <blockquote type=3D"cite">When MSECCFG.MML is set, after checking=

          the address range in PMP if the
          <br>
          asked permissions are not same as programmed in PMP, the
          default
          <br>
          permissions are applied. This should only be the case when
          there
          <br>
          is no matching address is found.
          <br>
          <br>
          This patch skips applying default rules when matching address
          range
          <br>
          is found. It returns the index of the match PMP entry.
          <br>
          <br>
          fixes: 824cac681c3 (target/riscv: Fix PMP propagation for tlb)
          <br>
          <br>
          Signed-off-by: Himanshu Chauhan
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hchauhan@vent=
anamicro.com">&lt;hchauhan@ventanamicro.com&gt;</a>
          <br>
          ---
          <br>
          =C2=A0 target/riscv/pmp.c | 9 ++++++---
          <br>
          =C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)
          <br>
          <br>
          diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
          <br>
          index d85ad07caa..0dfdb35828 100644
          <br>
          --- a/target/riscv/pmp.c
          <br>
          +++ b/target/riscv/pmp.c
          <br>
          @@ -446,9 +446,12 @@ int pmp_hart_has_privs(CPURISCVState
          *env, target_ulong addr,
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }
          <br>
          =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if ((privs &amp; *allowed_privs) =3D=3D privs) {
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D i;
          <br>
          -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /*
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * If matching address range was found, the
          protection bits
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * defined with PMP must be used. We shouldn't
          fallback on
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * finding default privileges.
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */
          <br>
          +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D i;
          <br>
        </blockquote>
        <br>
        Notice the return value is the matching rule index, which
        includes
        <br>
        <br>
        1) the address range is matching.
        <br>
        <br>
        2) the permission of the PMP rule and the memory access type are
        matching.
        <br>
        <br>
        <br>
        So we can't simply remove the second check.=C2=A0 I think the rig=
ht
        fix is:
        <br>
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
(privs &amp; *allowed_privs) =3D=3D privs) {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D i;
        <br>
        =C2=A0-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
        <br>
        =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
        <br>
        =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -2;
        <br>
        =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
        <br>
        <br>
        The -2 return value avoids finding the default privileges. And
        it implies no matching rule is found.
        <br>
        <br>
        Zhiwei
        <br>
      </blockquote>
      <br>
      Hi Zhiwei,
      <br>
      <br>
      In case the address range is matched and MSECCFG.MML is set, the
      permission in *allowed_privs* are binding. </blockquote>
    Yes.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:27d845c3-efe6-e337-1173-7b9a8db96c1b@ventanamicro.com">=
So
      if the index matching is returned, the binding permissions are
      applied by the caller function.
      <br>
    </blockquote>
    Yes. And the index will also be used. So we should check both
    conditions in this function.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:27d845c3-efe6-e337-1173-7b9a8db96c1b@ventanamicro.com">=

      <br>
      Which case does my patch break? <br>
    </blockquote>
    <p>Look at the <span style=3D"color: rgb(130, 80, 223); font-size: 12=
px; font-style: normal; font-variant-ligatures: normal; font-variant-caps=
: normal; font-weight: 400; letter-spacing: normal; text-align: start; te=
xt-indent: 0px; text-transform: none; white-space: pre; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); t=
ext-decoration-thickness: initial; text-decoration-style: initial; text-d=
ecoration-color: initial; display: inline !important; float: none;">get_p=
hysical_address_pmp which call</span><span style=3D"color: rgb(130, 80, 2=
23); font-family: ui-monospace, SFMono-Regular, &quot;SF Mono&quot;, Menl=
o, Consolas, &quot;Liberation Mono&quot;, monospace; font-size: 12px; fon=
t-style: normal; font-variant-ligatures: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: pre; widows: 2; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(2=
55, 255, 255); text-decoration-thickness: initial; text-decoration-style:=
 initial; text-decoration-color: initial; display: inline !important; flo=
at: none;">s </span>pmp_hart_has_privs,</p>
    <pre>=C2=A0=C2=A0=C2=A0 pmp_index =3D pmp_hart_has_privs(env, addr, s=
ize, 1 &lt;&lt; access_type,</pre>
    <pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;pmp_=
priv, mode);</pre>
    <pre>=C2=A0=C2=A0=C2=A0 if (pmp_index &lt; 0) {
</pre>
    <pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *prot =3D 0;</pre>
    <pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRANSLATE_PMP_=
FAIL;</pre>
    <pre>=C2=A0=C2=A0=C2=A0 }</pre>
    <pre>
=C2=A0=C2=A0=C2=A0 *prot =3D pmp_priv_to_page_prot(pmp_priv);</pre>
    <pre>=C2=A0=C2=A0=C2=A0 if ((tlb_size !=3D NULL) &amp;&amp; pmp_index=
 !=3D MAX_RISCV_PMPS) {</pre>
    <pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_ulong tlb_sa =3D=
 addr &amp; ~(TARGET_PAGE_SIZE - 1);</pre>
    <pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_ulong tlb_ea =3D=
 tlb_sa + TARGET_PAGE_SIZE - 1;</pre>
    <pre>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *tlb_size =3D pmp_get_tlb_size=
(env, pmp_index, tlb_sa, tlb_ea);</pre>
    <pre>=C2=A0=C2=A0=C2=A0 }
<pre><span class=3D"pl-k" style=3D"box-sizing: border-box; color: var(--c=
olor-prettylights-syntax-keyword); font-size: 12px; font-style: normal; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: pre; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;=
">        return</span><span style=3D"color: rgb(36, 41, 47); font-size: =
12px; font-style: normal; font-variant-ligatures: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: pre; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);=
 text-decoration-thickness: initial; text-decoration-style: initial; text=
-decoration-color: initial; display: inline !important; float: none;"> TR=
ANSLATE_SUCCESS;</span></pre></pre>
    <p>You break the pmp_index &lt; 0 condition.=C2=A0 If ((privs &amp;
      *allowed_privs) !=3D privs,=C2=A0 the get_physical_address_pmp shou=
ld
      return fail.<br>
    </p>
    <p>Zhiwei<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:27d845c3-efe6-e337-1173-7b9a8db96c1b@ventanamicro.com">=

      <br>
      - Himanshu
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        <blockquote type=3D"cite">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------R6MSkV6QcjvaozQVq4l70v1j--


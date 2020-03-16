Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDfwY-0005Kb-1R
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 22:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jDfwU-0005J9-Nb
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 22:57:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jDfwT-0000tF-42
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 22:57:26 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:54520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jDfwN-0008Ku-Hv; Sun, 15 Mar 2020 22:57:19 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4855673|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_regular_dialog|0.00655218-0.000136855-0.993311;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03293; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.H04hszV_1584327430; 
Received: from 172.16.31.150(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H04hszV_1584327430)
 by smtp.aliyun-inc.com(10.147.42.241);
 Mon, 16 Mar 2020 10:57:11 +0800
Subject: Re: [PATCH v5 22/60] target/riscv: vector integer merge and move
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-23-zhiwei_liu@c-sky.com>
 <daeefcff-c444-b289-abcf-74301b09cce9@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <e6a94433-d524-1b5a-81a2-24987fde7de0@c-sky.com>
Date: Mon, 16 Mar 2020 10:57:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <daeefcff-c444-b289-abcf-74301b09cce9@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------F514DB3FA26545E31201C372"
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Mon, 16 Mar 2020 02:57:28 -0000

This is a multi-part message in MIME format.
--------------F514DB3FA26545E31201C372
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2020/3/14 15:27, Richard Henderson wrote:
> On 3/12/20 7:58 AM, LIU Zhiwei wrote:
>> +/* Vector Integer Merge and Move Instructions */
>> +static bool opivv_vmerge_check(DisasContext *s, arg_rmrr *a)
>> +{
>> +    return (vext_check_isa_ill(s, RVV) &&
>> +            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
>> +            vext_check_reg(s, a->rd, false) &&
>> +            vext_check_reg(s, a->rs2, false) &&
>> +            vext_check_reg(s, a->rs1, false) &&
>> +            ((a->vm == 0) || (a->rs2 == 0)));
>> +}
>> +GEN_OPIVV_TRANS(vmerge_vvm, opivv_vmerge_check)
>> +
>> +static bool opivx_vmerge_check(DisasContext *s, arg_rmrr *a)
>> +{
>> +    return (vext_check_isa_ill(s, RVV) &&
>> +            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
>> +            vext_check_reg(s, a->rd, false) &&
>> +            vext_check_reg(s, a->rs2, false) &&
>> +            ((a->vm == 0) || (a->rs2 == 0)));
>> +}
>> +GEN_OPIVX_TRANS(vmerge_vxm, opivx_vmerge_check)
>> +
>> +GEN_OPIVI_TRANS(vmerge_vim, 0, vmerge_vxm, opivx_vmerge_check)
> I think you need to special case these.  The unmasked instructions are the
> canonical move instructions: vmv.v.*.
>
> You definitely want to use tcg_gen_gvec_mov (vv), tcg_gen_gvec_dup_i{32,64}
> (vx) and tcg_gen_gvec_dup{8,16,32,64}i (vi).
I have a question here.

Are these GVEC IRs  proper for any vl, or just when vl equals vlmax?
I see there are some align assert in these GVEC IR.

Now the code is like

static bool trans_vmv_v_v(DisasContext *s, arg_r *a)
{
     if (vext_check_isa_ill(s, RVV) &&
         vext_check_reg(s, a->rd, false) &&
         vext_check_reg(s, a->rs1, false)) {

         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
                              vreg_ofs(s, a->rs1),
                              MAXSZ(s), MAXSZ(s));
         } else {
             uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
             static gen_helper_gvec_2_ptr * const fns[4] = {
                 gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
                 gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
             };

             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
                                cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
         }
         return true;
     }
     return false;
}

Is it right?

Zhiwei
>
>> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {                   \
>> +            ETYPE s2 = *((ETYPE *)vs2 + H(i));                       \
>> +            *((ETYPE *)vd + H1(i)) = s2;                             \
>> +        } else {                                                     \
>> +            ETYPE s1 = *((ETYPE *)vs1 + H(i));                       \
>> +            *((ETYPE *)vd + H(i)) = s1;                              \
>> +        }                                                            \
> Perhaps better as
>
> ETYPE *vt = (!vm && !vext_elem_mask(v0, mlen, i) ? vs2 : vs1);
> *((ETYPE *)vd + H(i)) = *((ETYPE *)vt + H(i));
>
>> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {                   \
>> +            ETYPE s2 = *((ETYPE *)vs2 + H(i));                       \
>> +            *((ETYPE *)vd + H1(i)) = s2;                             \
>> +        } else {                                                     \
>> +            *((ETYPE *)vd + H(i)) = (ETYPE)(target_long)s1;          \
>> +        }                                                            \
> Perhaps better as
>
> ETYPE s2 = *((ETYPE *)vs2 + H(i));
> ETYPE d = (!vm && !vext_elem_mask(v0, mlen, i)
>             ? s2 : (ETYPE)(target_long)s1);
> *((ETYPE *)vd + H(i)) = d;
>
> as most host platforms have a conditional reg-reg move, but not a conditional load.
>
>
> r~


--------------F514DB3FA26545E31201C372
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2020/3/14 15:27, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:daeefcff-c444-b289-abcf-74301b09cce9@linaro.org">
      <pre class="moz-quote-pre" wrap="">On 3/12/20 7:58 AM, LIU Zhiwei wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+/* Vector Integer Merge and Move Instructions */
+static bool opivv_vmerge_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s, RVV) &amp;&amp;
+            vext_check_overlap_mask(s, a-&gt;rd, a-&gt;vm, false) &amp;&amp;
+            vext_check_reg(s, a-&gt;rd, false) &amp;&amp;
+            vext_check_reg(s, a-&gt;rs2, false) &amp;&amp;
+            vext_check_reg(s, a-&gt;rs1, false) &amp;&amp;
+            ((a-&gt;vm == 0) || (a-&gt;rs2 == 0)));
+}
+GEN_OPIVV_TRANS(vmerge_vvm, opivv_vmerge_check)
+
+static bool opivx_vmerge_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s, RVV) &amp;&amp;
+            vext_check_overlap_mask(s, a-&gt;rd, a-&gt;vm, false) &amp;&amp;
+            vext_check_reg(s, a-&gt;rd, false) &amp;&amp;
+            vext_check_reg(s, a-&gt;rs2, false) &amp;&amp;
+            ((a-&gt;vm == 0) || (a-&gt;rs2 == 0)));
+}
+GEN_OPIVX_TRANS(vmerge_vxm, opivx_vmerge_check)
+
+GEN_OPIVI_TRANS(vmerge_vim, 0, vmerge_vxm, opivx_vmerge_check)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think you need to special case these.  The unmasked instructions are the
canonical move instructions: vmv.v.*.

You definitely want to use tcg_gen_gvec_mov (vv), tcg_gen_gvec_dup_i{32,64}
(vx) and tcg_gen_gvec_dup{8,16,32,64}i (vi).</pre>
    </blockquote>
    I have a question here.<br>
    <br>
    Are these GVEC IRs  proper for any vl, or just when vl equals vlmax?
    <br>
    I see there are some align assert in these GVEC IR.<br>
    <br>
    Now the code is like<br>
    <pre>static bool trans_vmv_v_v(DisasContext *s, arg_r *a)
{
    if (vext_check_isa_ill(s, RVV) &amp;&amp;
        vext_check_reg(s, a-&gt;rd, false) &amp;&amp;
        vext_check_reg(s, a-&gt;rs1, false)) {

        if (s-&gt;vl_eq_vlmax) {
            tcg_gen_gvec_mov(s-&gt;sew, vreg_ofs(s, a-&gt;rd),
                             vreg_ofs(s, a-&gt;rs1),
                             MAXSZ(s), MAXSZ(s));
        } else {
            uint32_t data = FIELD_DP32(0, VDATA, LMUL, s-&gt;lmul);
            static gen_helper_gvec_2_ptr * const fns[4] = {
                gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
                gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
            };

            tcg_gen_gvec_2_ptr(vreg_ofs(s, a-&gt;rd), vreg_ofs(s, a-&gt;rs1),
                               cpu_env, 0, s-&gt;vlen / 8, data, fns[s-&gt;sew]);
        }
        return true;
    }
    return false;
}
</pre>
    Is it right?<br>
    <br>
    Zhiwei<br>
    <blockquote type="cite"
      cite="mid:daeefcff-c444-b289-abcf-74301b09cce9@linaro.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        if (!vm &amp;&amp; !vext_elem_mask(v0, mlen, i)) {                   \
+            ETYPE s2 = *((ETYPE *)vs2 + H(i));                       \
+            *((ETYPE *)vd + H1(i)) = s2;                             \
+        } else {                                                     \
+            ETYPE s1 = *((ETYPE *)vs1 + H(i));                       \
+            *((ETYPE *)vd + H(i)) = s1;                              \
+        }                                                            \
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Perhaps better as

ETYPE *vt = (!vm &amp;&amp; !vext_elem_mask(v0, mlen, i) ? vs2 : vs1);
*((ETYPE *)vd + H(i)) = *((ETYPE *)vt + H(i));

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        if (!vm &amp;&amp; !vext_elem_mask(v0, mlen, i)) {                   \
+            ETYPE s2 = *((ETYPE *)vs2 + H(i));                       \
+            *((ETYPE *)vd + H1(i)) = s2;                             \
+        } else {                                                     \
+            *((ETYPE *)vd + H(i)) = (ETYPE)(target_long)s1;          \
+        }                                                            \
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Perhaps better as

ETYPE s2 = *((ETYPE *)vs2 + H(i));
ETYPE d = (!vm &amp;&amp; !vext_elem_mask(v0, mlen, i)
           ? s2 : (ETYPE)(target_long)s1);
*((ETYPE *)vd + H(i)) = d;

as most host platforms have a conditional reg-reg move, but not a conditional load.


r~
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------F514DB3FA26545E31201C372--


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDLiL-0001bz-Es
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 01:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52308)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDLiI-0001bh-Pd
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 01:21:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDLiH-0001kh-LE
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 01:21:26 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36683)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDLiH-0001iH-GF
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 01:21:25 -0400
Received: by mail-pg1-x541.google.com with SMTP id z4so1806349pgu.3
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 22:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OBUlZjZUThF1vXn4ShVzOeU+yEgCM+AMAza0oNowHco=;
 b=fdKbR64rrmEtzh64KA1vSr76Z2TBBTUZs70uTOBX3dvURZ8J7tdNijtV+lhAvElMmr
 MkFrMAjigMf15aNzxfRpUxer0RS42fmBkwU838USsH7bohgMrBYGjpfRIDyF8xIV5Svh
 5Xe2zOGLyHMpbkjM/8YHYRBx6ritFO/Jx+3RKVFOM6r91Dm3nT48ry0YBxT8FUz2V3H2
 AeV94NaGcxPjjt0qHUVZls9/Uk78IGCs4vNWGjF5TwHwXkaUZLOKhaZyjlOMnMssowOy
 HMQi9Vj/tbKeT1m7E/NyTuGTfE6A+jVx35VL4roMAzcQSTNYP+Q5wcXOjbvfs65CqJy4
 FVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OBUlZjZUThF1vXn4ShVzOeU+yEgCM+AMAza0oNowHco=;
 b=MOkmqFDv2OQAPytcduLcNVwZPU5HQG/kgjwTOMwyCH+BG/RGnhdQ668+AG/MDZpfuB
 c/FqwtrHOLHBJMCvRclFiMINM8uf2kwyO2oiDg3f+3ayvtodo88lzjQlWK7ses9w54xS
 BaTTU+LDnpc5HMOIQeBb4PsWFiQyYaIJpJPQT7pe3Xll52OD+J2rjd9rygzZH/6NIkww
 rMgk1xwGIdsu2mVDZGbmvqArlPX5xQPYbb99LHxm3HeSFK62jku4lzIViEo02GmPv30p
 44uuozX/4C5Yogt9gE7qjMiNoVxe0fO6Q6Ub44xc7K3Cy5CIlT5qYngwsSsACuHG95q9
 wigw==
X-Gm-Message-State: ANhLgQ1AwzyF8D4CNn7oxeyivtQ74V6oQ12AoPipdubZFoqbQkTJNR/3
 MmmySoYI7Qlof2JwZ7leeJgZz1ivXR0=
X-Google-Smtp-Source: ADFU+vtjOg5zE0nXpZhiWARMtYcU/wI7qBV/VB1NP+62X4DBSGwW5ZfQ9Kdi1LvMia0t4YNhi7/Srw==
X-Received: by 2002:a63:fc1c:: with SMTP id j28mr21421430pgi.289.1584249684184; 
 Sat, 14 Mar 2020 22:21:24 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 v12sm7232846pgs.0.2020.03.14.22.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 22:21:23 -0700 (PDT)
Subject: Re: [PATCH v5 54/60] target/riscv: integer extract instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-55-zhiwei_liu@c-sky.com>
 <de89d8bc-f578-ac42-58f3-4f5822c8fcfb@linaro.org>
 <9687510d-ff07-b200-b597-1405b1ff828d@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7003687-4352-15ba-79d8-268df025b611@linaro.org>
Date: Sat, 14 Mar 2020 22:21:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9687510d-ff07-b200-b597-1405b1ff828d@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Sun, 15 Mar 2020 05:21:28 -0000

On 3/14/20 10:15 PM, LIU Zhiwei wrote:
> 
> 
> On 2020/3/15 10:53, Richard Henderson wrote:
>> On 3/12/20 7:58 AM, LIU Zhiwei wrote:
>>> +static bool trans_vext_x_v(DisasContext *s, arg_r *a)
>>> +{
>>> +    if (vext_check_isa_ill(s, RVV)) {
>>> +        TCGv_ptr src2;
>>> +        TCGv dest, src1;
>>> +        gen_helper_vext_x_v fns[4] = {
>>> +            gen_helper_vext_x_v_b, gen_helper_vext_x_v_h,
>>> +            gen_helper_vext_x_v_w, gen_helper_vext_x_v_d
>>> +        };
>>> +
>>> +        dest = tcg_temp_new();
>>> +        src1 = tcg_temp_new();
>>> +        src2 = tcg_temp_new_ptr();
>>> +
>>> +        gen_get_gpr(src1, a->rs1);
>>> +        tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
>>> +
>>> +        fns[s->sew](dest, src2, src1, cpu_env);
>>> +        gen_set_gpr(a->rd, dest);
>>> +
>>> +        tcg_temp_free(dest);
>>> +        tcg_temp_free(src1);
>>> +        tcg_temp_free_ptr(src2);
>>> +        return true;
>>> +    }
>>> +    return false;
>>> +}
>> This entire operation can be performed inline easily.
>>
>> static void extract_element(TCGv dest, TCGv_ptr base,
>>                              int ofs, int sew)
>> {
>>      switch (sew) {
>>      case MO_8:
>>          tcg_gen_ld8u_tl(dest, base, ofs);
>>          break;
>>      case MO_16:
>>          tcg_gen_ld16u_tl(dest, base, ofs);
>>          break;
>>      default:
>>          tcg_gen_ld32u_tl(dest, base, ofs);
>>          break;
>> #if TARGET_LONG_BITS == 64
>>      case MO_64:
>>          tcg_gen_ld_i64(dest, base, ofs);
>>          break;
>> #endif
>>      }
>> }
>>
>> static bool trans_vext_x_v(DisasContext *s, arg_r *a)
>> {
>> ...
>>      if (a->rs1 == 0) {
>>          /* Special case vmv.x.s rd, vs2. */
>>          do_extract(dest, cpu_env,
>>                     vreg_ofs(s, a->rs2), s->sew);
>>      } else {
>>          int vlen = s->vlen >> (3 + s->sew);
>>          TCGv_i32 ofs = tcg_temp_new_i32();
>>          TCGv_ptr  base = tcg_temp_new_ptr();
>>          TCGv t_vlen, t_zero;
>>
>>          /* Mask the index to the length so that we do
>>             not produce an out-of-range load. */
>>          tcg_gen_trunc_tl_i32(ofs, cpu_gpr[a->rs1]);
>>          tcg_gen_andi_i32(ofs, ofs, vlen - 1);
>>
>>          /* Convert the index to an offset.  */
>>          tcg_gen_shli_i32(ofs, ofs, s->sew);
> 
> In  big endianess host, should I convert the index first before this statement.
> 
> #ifdef HOST_WORDS_BIGENDIAN
> static void convert_idx(TCGv_i32 idx, int sew)
> {
>     switch (sew) {
>     case MO_8:
>         tcg_gen_xori_i32(idx, idx, 7);
>         break;
>     case MO_16:
>         tcg_gen_xori_i32(idx, idx, 3);
>         break;
>     case MO_32:
>         tcg_gen_xori_i32(idx, idx, 1);
>         break;
>     default:
>         break;
>     }
> }
> #endif
> 
> 
> When convert the index to an offset, use this function first
> 
> #ifdef HOST_WORDS_BIGENDIAN
>     convert_idx(ofs, s->sew)
> #endif

Yes, I forgot about endian adjust.

I would say

static void endian_adjust(TCGv_i32 ofs, int sew)
{
#ifdef HOST_WORDS_BIGENDIAN
    tcg_gen_xori_i32(ofs, ofs, 7 >> sew);
#endif
}

so that you don't need the ifdef at the use site.


r~


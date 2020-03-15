Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDJP3-0002G9-Hc
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 22:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDJOx-0002FW-UK
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 22:53:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDJOw-0001WS-Lm
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 22:53:19 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39310)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDJOw-0001TJ-G5
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 22:53:18 -0400
Received: by mail-pl1-x643.google.com with SMTP id j20so6191290pll.6
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 19:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Paoo5Y6QAMXGq0TfWOHgSODC3JwQq6tWpuVY5sT9HQ=;
 b=GTygrW5ANRw+v++vjUJ1WM8BuzucUVVMaClqDl5CrfcnZReY75nEt43AkdenrJVLv6
 rfoNY7W2wW0ID4Q067AGbfIc8sTqfB7DHtKBbgw2dVnVn6EyfxsB47JjRPziGCBD+a3H
 4Y3QWBFmCq1U0KRGD7Bawr7qOJOrm8morSjujL2/ZjaCUwMzA9714yVsMP1QDyPJRa/H
 zURTtwSB3zHktaG98YswDPrPk7HWf3aNwEnvWW1DquRVNsPp2tSq3sibYrPwQT0oTIzv
 Guvh0cq+jyRfa8Cd9NtCZIYAtLjQdaGj8FcR3UpLRBWn4Zf8in/FUxI4zfuSRHn7Xb+a
 uZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Paoo5Y6QAMXGq0TfWOHgSODC3JwQq6tWpuVY5sT9HQ=;
 b=KurYv6eVj8n+Vxl/Uleb/+pjNLfbRTyHliCu4YBu5JIzCc8lPbZZmQqSkT1j7HBm9H
 Txl0+hdroQHnlTrdoxKVMXPDdhAM/25yoqC7IFe6aYhn/ZQQkUqfWouNYGBKaQ8wKSSK
 AtRWMK64mrOq4XTnRHtha01PkjvIz0LlzBm5uLklO58LCzIwuqNa8EARvFZXGC9s90MV
 1/tENaTnAizN4ZJVkfM/Kr45/9RgqlErsB/x5pPoDC4XEdyFrDpNgmrFi6cEjeUrbESm
 AaYU+vcaLCGN4VCferhSVx+izwG2HdVrIxm34UHue+XEuA7llp8pvtP7h8xDDyepaBGG
 NYgA==
X-Gm-Message-State: ANhLgQ2DSS7d5/fLsR3WWDGSPsM/RqbaAW0cUV/qqPsJkzHJzZZSaxFo
 NynvXQFBP86FmzZsthCDAMRE9NKzMUw=
X-Google-Smtp-Source: ADFU+vtIK91Z27vUYTorN3Wz4DSOvcE9pNQ+OdfANDwMOCHXoQy1IsmDxEgG2OR9ThKSu16dNRBZ1A==
X-Received: by 2002:a17:902:463:: with SMTP id
 90mr21557172ple.213.1584240797062; 
 Sat, 14 Mar 2020 19:53:17 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 q15sm25080351pgn.68.2020.03.14.19.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 19:53:16 -0700 (PDT)
Subject: Re: [PATCH v5 54/60] target/riscv: integer extract instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-55-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de89d8bc-f578-ac42-58f3-4f5822c8fcfb@linaro.org>
Date: Sat, 14 Mar 2020 19:53:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-55-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Sun, 15 Mar 2020 02:53:21 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +static bool trans_vext_x_v(DisasContext *s, arg_r *a)
> +{
> +    if (vext_check_isa_ill(s, RVV)) {
> +        TCGv_ptr src2;
> +        TCGv dest, src1;
> +        gen_helper_vext_x_v fns[4] = {
> +            gen_helper_vext_x_v_b, gen_helper_vext_x_v_h,
> +            gen_helper_vext_x_v_w, gen_helper_vext_x_v_d
> +        };
> +
> +        dest = tcg_temp_new();
> +        src1 = tcg_temp_new();
> +        src2 = tcg_temp_new_ptr();
> +
> +        gen_get_gpr(src1, a->rs1);
> +        tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
> +
> +        fns[s->sew](dest, src2, src1, cpu_env);
> +        gen_set_gpr(a->rd, dest);
> +
> +        tcg_temp_free(dest);
> +        tcg_temp_free(src1);
> +        tcg_temp_free_ptr(src2);
> +        return true;
> +    }
> +    return false;
> +}

This entire operation can be performed inline easily.

static void extract_element(TCGv dest, TCGv_ptr base,
                            int ofs, int sew)
{
    switch (sew) {
    case MO_8:
        tcg_gen_ld8u_tl(dest, base, ofs);
        break;
    case MO_16:
        tcg_gen_ld16u_tl(dest, base, ofs);
        break;
    default:
        tcg_gen_ld32u_tl(dest, base, ofs);
        break;
#if TARGET_LONG_BITS == 64
    case MO_64:
        tcg_gen_ld_i64(dest, base, ofs);
        break;
#endif
    }
}

static bool trans_vext_x_v(DisasContext *s, arg_r *a)
{
...
    if (a->rs1 == 0) {
        /* Special case vmv.x.s rd, vs2. */
        do_extract(dest, cpu_env,
                   vreg_ofs(s, a->rs2), s->sew);
    } else {
        int vlen = s->vlen >> (3 + s->sew);
        TCGv_i32 ofs = tcg_temp_new_i32();
        TCGv_ptr  base = tcg_temp_new_ptr();
        TCGv t_vlen, t_zero;

        /* Mask the index to the length so that we do
           not produce an out-of-range load. */
        tcg_gen_trunc_tl_i32(ofs, cpu_gpr[a->rs1]);
        tcg_gen_andi_i32(ofs, ofs, vlen - 1);

        /* Convert the index to an offset.  */
        tcg_gen_shli_i32(ofs, ofs, s->sew);

        /* Convert the index to a pointer. */
        tcg_gen_extu_i32_ptr(base, ofs);
        tcg_gen_add_ptr(base, base, cpu_env);

        /* Perform the load. */
        do_extract(dest, base,
                   vreg_ofs(s, a->rs2), s->sew);
        tcg_temp_free_ptr(base);
        tcg_temp_free_i32(ofs);

        /* Flush out-of-range indexing to zero.  */
        t_vlen = tcg_const_tl(vlen);
        t_zero = tcg_const_tl(0);
        tcg_gen_movcond_tl(TCG_COND_LTU, dest, cpu_gpr[a->rs1],
                           t_vlen, dest, t_zero);
        tcg_temp_free(t_vlen);
        tcg_temp_free(t_zero);
    }


r~


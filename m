Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDtla-0004kG-Fk
	for mharc-qemu-riscv@gnu.org; Mon, 16 Mar 2020 13:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39099)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDtlY-0004eF-5R
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 13:43:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDtlV-0000Qg-L4
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 13:43:03 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:39036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDtlV-0000IW-EQ
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 13:43:01 -0400
Received: by mail-pj1-x1044.google.com with SMTP id d8so9083608pje.4
 for <qemu-riscv@nongnu.org>; Mon, 16 Mar 2020 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zOs/8OdiftpJmPSmUYbE0no0V2XkwWZ2rsSlJaTudvc=;
 b=B/o9Q9gHb9IdGkpjrF6nKILWlYTgxw9+h1aKok8qMXNQANl5bSNYFoR9SEyLmPEy+S
 sSs+r+crKpyrkH/CFIpxvuc2Oc5L3PxFG1voyfOjhYXcJZvPMop7LCoTQtrH9zd/eMWF
 R19EOoeTNHlEp0S6cXmLWx+wbnJyIWaNyZoqvpb2z1oQ3MJufWBe09rtAI2dLh7rnvgx
 yoNK0ihBt+BPtV+JmNYU1gDGHpoSo8bQDpTLGPBVtcXZcKzBdgCR0j719s6Z/sTGrnfV
 rmJsmDR26x8r8oK9xROFZNcHgUECzb5KeG6b8cm8pE4b/liVop8ebsZX6dwmtzsBNZJa
 EghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zOs/8OdiftpJmPSmUYbE0no0V2XkwWZ2rsSlJaTudvc=;
 b=uKM4/etHGnlAGZDI789nSDpk+T3d9Fk5RMSjxViowuBWYKEXP6ThG7NB7SwbLuBD5n
 Uo3Jq4Ed7rXBxPGoRJNSXX8x6x0x3lBPDTpqutOgQHrREBrYNPZjw/atx2rd9pYj6mdw
 tfBC3x3Z/zWNOKyvO/bTTURhyzy+fjPXql4fvaD85bLLQjyMFIYFTE+WJNJEuCqquY/G
 tsbQdbFJVRYxAhBNZ7jSRcCH6vUlCfGZml18MynkZWfjQMEu/yWWRZFX/I8noayIXnG8
 sz6iGN4zPNxIlYFsanYHouLM43yVU7pI6JM/rxqjPkjPNxLif1VuwARoE0C7VgKkF+uH
 +Msw==
X-Gm-Message-State: ANhLgQ3JlMSGCm1M+2VCGM3idJFkoYJI6lGVmkx0Iqc/+s6qSsYmWyPy
 DGDABYHkYqUkyTBUChI+EwdG42LJ/Xk=
X-Google-Smtp-Source: ADFU+vsoDPXOmPxhMQrd/cq9DEqHnR1g0lwaoFdNv0ACrg+cfg4uMaElreXINYoU+qCv/rsfNmmwWA==
X-Received: by 2002:a17:90a:fb49:: with SMTP id
 iq9mr637995pjb.143.1584380579244; 
 Mon, 16 Mar 2020 10:42:59 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 jz19sm394711pjb.48.2020.03.16.10.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 10:42:58 -0700 (PDT)
Subject: Re: [PATCH v5 57/60] target/riscv: vector slide instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-58-zhiwei_liu@c-sky.com>
 <28063df7-bf38-d136-2d32-39651692c4c6@linaro.org>
 <88b87d58-5387-9d0d-b1a0-5705171f2e83@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <76b6c079-15b2-08f1-f8e2-570efb6cfae5@linaro.org>
Date: Mon, 16 Mar 2020 10:42:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <88b87d58-5387-9d0d-b1a0-5705171f2e83@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
X-List-Received-Date: Mon, 16 Mar 2020 17:43:05 -0000

On 3/16/20 1:04 AM, LIU Zhiwei wrote:
>> As a preference, I think you can do away with this helper.
>> Simply use the slideup helper with argument 1, and then
>> afterwards store the integer register into element 0.  You should be able to
>> re-use code from vmv.s.x for that.
> When I try it, I find it is some difficult, because  vmv.s.x will clean
> the elements (0 < index < VLEN/SEW).

Well, two things about that:

(1) The 0.8 version of vmv.s.x does *not* zero the other elements, so we'll
want to be prepared for that.

(2) We have 8 insns that, in the end come down to a direct element access,
possibly with some other processing.

So we'll want basic helper functions that can locate an element by immediate
offset and by variable offset:

/* Compute the offset of vreg[idx] relative to cpu_env.
   The index must be in range of VLMAX. */
int vec_element_ofsi(int vreg, int idx, int sew);

/* Compute a pointer to vreg[idx].
   If need_bound is true, mask idx into VLMAX,
   Otherwise we know a-priori that idx is already in bounds. */
void vec_element_ofsx(DisasContext *s, TCGv_ptr base,
                      TCGv idx, int sew, bool need_bound);

/* Load idx >= VLMAX ? 0 : vreg[idx] */
void vec_element_loadi(DisasContext *s, TCGv_i64 val,
                       int vreg, int idx, int sew);
void vec_element_loadx(DisasContext *s, TCGv_i64 val,
                       int vreg, TCGv idx, int sew);

/* Store vreg[imm] = val.
   The index must be in range of VLMAX.  */
void vec_element_storei(DisasContext *s, int vreg, int imm,
                        TCGv_i64 val);
void vec_element_storex(DisasContext *s, int vreg,
                        TCGv idx, TCGv_i64 val);

(3) It would be handy to have TCGv cpu_vl.

Then:

vext.x.v:
    If rs1 == 0,
        Use vec_element_loadi(s, x[rd], vs2, 0, s->sew).
    else
        Use vec_element_loadx(s, x[rd], vs2, x[rs1], true).

vmv.s.x:
    over = gen_new_label();
    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
    For 0.7.1:
        Use tcg_gen_dup8i to zero all VLMAX elements of vd.
        If rs1 == 0, goto done.
    Use vec_element_storei(s, vs2, 0, x[rs1]).
 done:
    gen_set_label(over);

vfmv.f.s:
    Use vec_element_loadi(x, f[rd], vs2, 0).
    NaN-box f[rd] as necessary for SEW.

vfmv.s.f:
    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
    For 0.7.1:
        Use tcg_gen_dup8i to zero all VLMAX elements of vd.
    Let tmp = f[rs1], nan-boxed as necessary for SEW.
    Use vec_element_storei(s, vs2, 0, tmp).
    gen_set_label(over);

vslide1up.vx:
    Ho hum, I forgot about masking.  Some options:
    (1) Call a helper just as you did in your original patch.
    (2) Call a helper only for !vm, for vm as below.
    (3) Call vslideup w/1.
        tcg_gen_brcondi(TCG_COND_EQ, cpu_vl, 0, over);
        If !vm,
            // inline test for v0[0]
            vec_element_loadi(s, tmp, 0, 0, MO_8);
            tcg_gen_andi_i64(tmp, tmp, 1);
            tcg_gen_brcondi(TCG_COND_EQ, tmp, 0, over);
        Use vec_element_store(s, vd, 0, x[rs1]).
        gen_set_label(over);

vslide1down.vx:
    For !vm, this is complicated enough for a helper.
    If using option 3 for vslide1up, then the store becomes:
    tcg_gen_subi_tl(tmp, cpu_vl, 1);
    vec_element_storex(s, base, tmp, x[rs1]);

vrgather.vx:
    If !vm or !vl_eq_vlmax, use helper.
    vec_element_loadx(s, tmp, vs2, x[rs1]);
    Use tcg_gen_gvec_dup_i64 to store to tmp to vd.

vrgather.vi:
    If !vm or !vl_eq_vlmax, use helper.
    If imm >= vlmax,
        Use tcg_gen_dup8i to zero vd;
    else,
        ofs = vec_element_ofsi(s, vs2, imm, s->sew);
        tcg_gen_gvec_dup_mem(sew, vreg_ofs(vd),
                             ofs, vlmax, vlmax);


r~


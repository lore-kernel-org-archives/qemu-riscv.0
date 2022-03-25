Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXgDE-0002um-10
	for mharc-qemu-riscv@gnu.org; Fri, 25 Mar 2022 05:26:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nXgD9-0002sk-6d
 for qemu-riscv@nongnu.org; Fri, 25 Mar 2022 05:26:23 -0400
Received: from [2607:f8b0:4864:20::533] (port=38591
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nXgD6-0004Ox-H6
 for qemu-riscv@nongnu.org; Fri, 25 Mar 2022 05:26:22 -0400
Received: by mail-pg1-x533.google.com with SMTP id s72so5969516pgc.5
 for <qemu-riscv@nongnu.org>; Fri, 25 Mar 2022 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2/lCz1wZGhDcHPzzdMe3F0XhmIpkunbq3suLVB6ZJ0c=;
 b=GK7zc29fZcKtVEYvQxxCQT8BRz/0pBnCspzfSThnIamYCqzcq05FCu30OugQF9ZdTU
 XCNgU4y6vaISlH4pyNjdvWKVoBF11SjstmMJvSNIyYpFOSAzZ9rmgDeyweVw6bs9R9gh
 wsRlvlCBKfo5JtrBMqfmUmH5/2PWlEV/VO/UxJHKgOsmaf/yzCElEH3z080rPU2FtP2f
 c42OplyTYsAvrZTeTLvbz7diWLSTrtT7U+8EBrQfB66IT4NPzuCrnoXwJBoObagBHzOf
 FMpfbvsBFarImwFJIOlB+9FOtaH1dXek6hJHX4DhO6BT2LhV3goiHoqpXG+OwrYPsEWj
 pzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2/lCz1wZGhDcHPzzdMe3F0XhmIpkunbq3suLVB6ZJ0c=;
 b=HWdSQth9T+IUNbZnzYrHcocDP8dQvNZk6VJOOHYffCnWwOXc2Nh0Z4Gp82wg3ZisD1
 QIOYsOs0aP8qlunwrxieneJa2N7jcFGWTh7XERnctXT6k7Hx/GNw3XgZRQ0Zw1FrJNpj
 zYeqxQMZxFZdRGLQTxtNe/UB5POukY5ppZtT7p/qSVUBHG/ZWMWwHUbZU+X7em7Y3cyK
 YVpZj6Jr8R/FtxoCp3t3g5s1bKGwrSD8/zptVth67Ooctrvsk7+iQGsJ5KtBocjnDK9n
 wtY5aC0/A9Y3rDWXJ2Jok/WW+5ULSq2NBD+6DEBig7M6pyOeMSCgQKYOWcSN95atrC3B
 UF5w==
X-Gm-Message-State: AOAM530DLckHUR84A00ddw7ASHXAoFw9yDg6E3OUrejGkd6yk4zi4zFS
 6NnCpb4i+wFu9LWrV37RjvhiIvscWgwMDQ==
X-Google-Smtp-Source: ABdhPJzZ93cNmh4M8pGULL5d9ARav+LyXcJokfu4geWD+e/IqG3wyKRHqs7TllOq21SjsvDpalLViA==
X-Received: by 2002:a63:111b:0:b0:382:56b1:f16d with SMTP id
 g27-20020a63111b000000b0038256b1f16dmr7347938pgl.585.1648200378580; 
 Fri, 25 Mar 2022 02:26:18 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com.
 [209.85.214.172]) by smtp.gmail.com with ESMTPSA id
 t2-20020a63a602000000b0038062a0bc6fsm4687648pge.67.2022.03.25.02.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 02:26:17 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id g3so7415605plo.6;
 Fri, 25 Mar 2022 02:26:17 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8b:b0:1c7:386b:4811 with SMTP id
 ng11-20020a17090b1a8b00b001c7386b4811mr11758723pjb.4.1648200376950; Fri, 25
 Mar 2022 02:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
 <20220325085902.29500-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20220325085902.29500-2-liweiwei@iscas.ac.cn>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 25 Mar 2022 17:26:05 +0800
X-Gmail-Original-Message-ID: <CANzO1D0CsjrefK7vc==u7CGA+=pMb3uoPi_D+Q+vPY8=2ZiaUg@mail.gmail.com>
Message-ID: <CANzO1D0CsjrefK7vc==u7CGA+=pMb3uoPi_D+Q+vPY8=2ZiaUg@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: optimize helper for vmv<nr>r.v
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: multipart/alternative; boundary="000000000000fca5e505db078d9c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 25 Mar 2022 09:26:23 -0000

--000000000000fca5e505db078d9c
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Fri, Mar 25, 2022 at 5:00 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

> LEN is not used for GEN_VEXT_VMV_WHOLE macro, so vmv<nr>r.v can share
> the same helper
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/helper.h                   |  5 +----
>  target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++----------
>  target/riscv/vector_helper.c            | 29 ++++++++++---------------
>  3 files changed, 18 insertions(+), 33 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 26bbab2fab..a669d0187b 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1086,10 +1086,7 @@ DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr,
> ptr, env, i32)
>  DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
>
> -DEF_HELPER_4(vmv1r_v, void, ptr, ptr, env, i32)
> -DEF_HELPER_4(vmv2r_v, void, ptr, ptr, env, i32)
> -DEF_HELPER_4(vmv4r_v, void, ptr, ptr, env, i32)
> -DEF_HELPER_4(vmv8r_v, void, ptr, ptr, env, i32)
> +DEF_HELPER_4(vmvr_v, void, ptr, ptr, env, i32)
>
>  DEF_HELPER_5(vzext_vf2_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vzext_vf2_w, void, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc
> b/target/riscv/insn_trans/trans_rvv.c.inc
> index 2878ca3132..ec7c0e0d36 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3695,7 +3695,7 @@ static bool trans_vcompress_vm(DisasContext *s,
> arg_r *a)
>   * Whole Vector Register Move Instructions ignore vtype and vl setting.
>   * Thus, we don't need to check vill bit. (Section 16.6)
>   */
> -#define GEN_VMV_WHOLE_TRANS(NAME, LEN, SEQ)                             \
> +#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                             \
>  static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
>  {                                                                       \
>      if (require_rvv(s) &&                                               \
> @@ -3710,13 +3710,8 @@ static bool trans_##NAME(DisasContext *s,
> arg_##NAME * a)               \
>          } else {                                                        \
>              TCGLabel *over = gen_new_label();                           \
>              tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, maxsz, over);  \
> -                                                                        \
> -            static gen_helper_gvec_2_ptr * const fns[4] = {             \
> -                gen_helper_vmv1r_v, gen_helper_vmv2r_v,                 \
> -                gen_helper_vmv4r_v, gen_helper_vmv8r_v,                 \
> -            };                                                          \
>              tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2), \
> -                               cpu_env, maxsz, maxsz, 0, fns[SEQ]);     \
> +                               cpu_env, maxsz, maxsz, 0,
> gen_helper_vmvr_v); \
>              mark_vs_dirty(s);                                           \
>              gen_set_label(over);                                        \
>          }                                                               \
> @@ -3725,10 +3720,10 @@ static bool trans_##NAME(DisasContext *s,
> arg_##NAME * a)               \
>      return false;                                                       \
>  }
>
> -GEN_VMV_WHOLE_TRANS(vmv1r_v, 1, 0)
> -GEN_VMV_WHOLE_TRANS(vmv2r_v, 2, 1)
> -GEN_VMV_WHOLE_TRANS(vmv4r_v, 4, 2)
> -GEN_VMV_WHOLE_TRANS(vmv8r_v, 8, 3)
> +GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
> +GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
> +GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
> +GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
>
>  static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
>  {
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 3bd4aac9c9..1d4982ef7f 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4888,25 +4888,18 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4)
>  GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
>
>  /* Vector Whole Register Move */
> -#define GEN_VEXT_VMV_WHOLE(NAME, LEN)                      \
> -void HELPER(NAME)(void *vd, void *vs2, CPURISCVState *env, \
> -                  uint32_t desc)                           \
> -{                                                          \
> -    /* EEW = 8 */                                          \
> -    uint32_t maxsz = simd_maxsz(desc);                     \
> -    uint32_t i = env->vstart;                              \
> -                                                           \
> -    memcpy((uint8_t *)vd + H1(i),                          \
> -           (uint8_t *)vs2 + H1(i),                         \
> -           maxsz - env->vstart);                           \
> -                                                           \
> -    env->vstart = 0;                                       \
> -}
> +void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t
> desc)
> +{
> +    /* EEW = 8 */
> +    uint32_t maxsz = simd_maxsz(desc);
> +    uint32_t i = env->vstart;
> +
> +    memcpy((uint8_t *)vd + H1(i),
> +           (uint8_t *)vs2 + H1(i),
> +           maxsz - env->vstart);
>
> -GEN_VEXT_VMV_WHOLE(vmv1r_v, 1)
> -GEN_VEXT_VMV_WHOLE(vmv2r_v, 2)
> -GEN_VEXT_VMV_WHOLE(vmv4r_v, 4)
> -GEN_VEXT_VMV_WHOLE(vmv8r_v, 8)
> +    env->vstart = 0;
> +}
>
>  /* Vector Integer Extension */
>  #define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1)            \
> --
> 2.17.1
>
>
>

--000000000000fca5e505db078d9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5SZXZpZXdlZC1ieTogRnJhbmsgQ2hhbmcgJmx0OzxhIGhyZWY9
Im1haWx0bzpmcmFuay5jaGFuZ0BzaWZpdmUuY29tIj5mcmFuay5jaGFuZ0BzaWZpdmUuY29tPC9h
PiZndDs8L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNs
YXNzPSJnbWFpbF9hdHRyIj5PbiBGcmksIE1hciAyNSwgMjAyMiBhdCA1OjAwIFBNIFdlaXdlaSBM
aSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmxpd2Vpd2VpQGlzY2FzLmFjLmNuIj5saXdlaXdlaUBpc2Nh
cy5hYy5jbjwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNv
bGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+TEVOIGlzIG5vdCB1c2VkIGZv
ciBHRU5fVkVYVF9WTVZfV0hPTEUgbWFjcm8sIHNvIHZtdiZsdDtuciZndDtyLnYgY2FuIHNoYXJl
PGJyPg0KdGhlIHNhbWUgaGVscGVyIDxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6IFdlaXdlaSBM
aSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmxpd2Vpd2VpQGlzY2FzLmFjLmNuIiB0YXJnZXQ9Il9ibGFu
ayI+bGl3ZWl3ZWlAaXNjYXMuYWMuY248L2E+Jmd0Ozxicj4NClNpZ25lZC1vZmYtYnk6IEp1bnFp
YW5nIFdhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzp3YW5nanVucWlhbmdAaXNjYXMuYWMuY24iIHRh
cmdldD0iX2JsYW5rIj53YW5nanVucWlhbmdAaXNjYXMuYWMuY248L2E+Jmd0Ozxicj4NCi0tLTxi
cj4NCsKgdGFyZ2V0L3Jpc2N2L2hlbHBlci5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
wqAgNSArLS0tLTxicj4NCsKgdGFyZ2V0L3Jpc2N2L2luc25fdHJhbnMvdHJhbnNfcnZ2LmMuaW5j
IHwgMTcgKysrKystLS0tLS0tLS0tPGJyPg0KwqB0YXJnZXQvcmlzY3YvdmVjdG9yX2hlbHBlci5j
wqAgwqAgwqAgwqAgwqAgwqAgfCAyOSArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tPGJyPg0KwqAz
IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKTxicj4NCjxi
cj4NCmRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvaGVscGVyLmggYi90YXJnZXQvcmlzY3YvaGVs
cGVyLmg8YnI+DQppbmRleCAyNmJiYWIyZmFiLi5hNjY5ZDAxODdiIDEwMDY0NDxicj4NCi0tLSBh
L3RhcmdldC9yaXNjdi9oZWxwZXIuaDxicj4NCisrKyBiL3RhcmdldC9yaXNjdi9oZWxwZXIuaDxi
cj4NCkBAIC0xMDg2LDEwICsxMDg2LDcgQEAgREVGX0hFTFBFUl82KHZjb21wcmVzc192bV9oLCB2
b2lkLCBwdHIsIHB0ciwgcHRyLCBwdHIsIGVudiwgaTMyKTxicj4NCsKgREVGX0hFTFBFUl82KHZj
b21wcmVzc192bV93LCB2b2lkLCBwdHIsIHB0ciwgcHRyLCBwdHIsIGVudiwgaTMyKTxicj4NCsKg
REVGX0hFTFBFUl82KHZjb21wcmVzc192bV9kLCB2b2lkLCBwdHIsIHB0ciwgcHRyLCBwdHIsIGVu
diwgaTMyKTxicj4NCjxicj4NCi1ERUZfSEVMUEVSXzQodm12MXJfdiwgdm9pZCwgcHRyLCBwdHIs
IGVudiwgaTMyKTxicj4NCi1ERUZfSEVMUEVSXzQodm12MnJfdiwgdm9pZCwgcHRyLCBwdHIsIGVu
diwgaTMyKTxicj4NCi1ERUZfSEVMUEVSXzQodm12NHJfdiwgdm9pZCwgcHRyLCBwdHIsIGVudiwg
aTMyKTxicj4NCi1ERUZfSEVMUEVSXzQodm12OHJfdiwgdm9pZCwgcHRyLCBwdHIsIGVudiwgaTMy
KTxicj4NCitERUZfSEVMUEVSXzQodm12cl92LCB2b2lkLCBwdHIsIHB0ciwgZW52LCBpMzIpPGJy
Pg0KPGJyPg0KwqBERUZfSEVMUEVSXzUodnpleHRfdmYyX2gsIHZvaWQsIHB0ciwgcHRyLCBwdHIs
IGVudiwgaTMyKTxicj4NCsKgREVGX0hFTFBFUl81KHZ6ZXh0X3ZmMl93LCB2b2lkLCBwdHIsIHB0
ciwgcHRyLCBlbnYsIGkzMik8YnI+DQpkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2luc25fdHJh
bnMvdHJhbnNfcnZ2LmMuaW5jIGIvdGFyZ2V0L3Jpc2N2L2luc25fdHJhbnMvdHJhbnNfcnZ2LmMu
aW5jPGJyPg0KaW5kZXggMjg3OGNhMzEzMi4uZWM3YzBlMGQzNiAxMDA2NDQ8YnI+DQotLS0gYS90
YXJnZXQvcmlzY3YvaW5zbl90cmFucy90cmFuc19ydnYuYy5pbmM8YnI+DQorKysgYi90YXJnZXQv
cmlzY3YvaW5zbl90cmFucy90cmFuc19ydnYuYy5pbmM8YnI+DQpAQCAtMzY5NSw3ICszNjk1LDcg
QEAgc3RhdGljIGJvb2wgdHJhbnNfdmNvbXByZXNzX3ZtKERpc2FzQ29udGV4dCAqcywgYXJnX3Ig
KmEpPGJyPg0KwqAgKiBXaG9sZSBWZWN0b3IgUmVnaXN0ZXIgTW92ZSBJbnN0cnVjdGlvbnMgaWdu
b3JlIHZ0eXBlIGFuZCB2bCBzZXR0aW5nLjxicj4NCsKgICogVGh1cywgd2UgZG9uJiMzOTt0IG5l
ZWQgdG8gY2hlY2sgdmlsbCBiaXQuIChTZWN0aW9uIDE2LjYpPGJyPg0KwqAgKi88YnI+DQotI2Rl
ZmluZSBHRU5fVk1WX1dIT0xFX1RSQU5TKE5BTUUsIExFTiwgU0VRKcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCisjZGVmaW5lIEdFTl9WTVZfV0hPTEVf
VFJBTlMoTkFNRSwgTEVOKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgXDxicj4NCsKgc3RhdGljIGJvb2wgdHJhbnNfIyNOQU1FKERpc2FzQ29udGV4dCAqcywgYXJn
XyMjTkFNRSAqIGEpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KwqB7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KwqAgwqAgwqBpZiAo
cmVxdWlyZV9ydnYocykgJmFtcDsmYW1wO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCkBAIC0zNzEwLDEz
ICszNzEwLDggQEAgc3RhdGljIGJvb2wgdHJhbnNfIyNOQU1FKERpc2FzQ29udGV4dCAqcywgYXJn
XyMjTkFNRSAqIGEpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KwqAgwqAgwqAgwqAgwqB9
IGVsc2Uge8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoFRDR0xhYmVsICpvdmVyID0gZ2VuX25ld19sYWJlbCgpO8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgdGNnX2dlbl9i
cmNvbmRpX3RsKFRDR19DT05EX0dFVSwgY3B1X3ZzdGFydCwgbWF4c3osIG92ZXIpO8KgIFw8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCBzdGF0aWMgZ2VuX2hlbHBlcl9ndmVjXzJfcHRyICogY29u
c3QgZm5zWzRdID0ge8KgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBnZW5faGVscGVyX3ZtdjFyX3YsIGdlbl9oZWxwZXJfdm12MnJfdizCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoFw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2VuX2hlbHBl
cl92bXY0cl92LCBnZW5faGVscGVyX3ZtdjhyX3YswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBc
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIH07wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
XDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgdGNnX2dlbl9ndmVjXzJfcHRyKHZyZWdfb2ZzKHMs
IGEtJmd0O3JkKSwgdnJlZ19vZnMocywgYS0mZ3Q7cnMyKSwgXDxicj4NCi3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNwdV9lbnYsIG1heHN6LCBtYXhzeiwg
MCwgZm5zW1NFUV0pO8KgIMKgIMKgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNwdV9lbnYsIG1heHN6LCBtYXhzeiwgMCwgZ2VuX2hlbHBlcl92
bXZyX3YpOyBcPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqBtYXJrX3ZzX2RpcnR5KHMpO8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgXDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgZ2VuX3NldF9sYWJlbChvdmVyKTvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJy
Pg0KwqAgwqAgwqAgwqAgwqB9wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBc
PGJyPg0KQEAgLTM3MjUsMTAgKzM3MjAsMTAgQEAgc3RhdGljIGJvb2wgdHJhbnNfIyNOQU1FKERp
c2FzQ29udGV4dCAqcywgYXJnXyMjTkFNRSAqIGEpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJy
Pg0KwqAgwqAgwqByZXR1cm4gZmFsc2U7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0K
wqB9PGJyPg0KPGJyPg0KLUdFTl9WTVZfV0hPTEVfVFJBTlModm12MXJfdiwgMSwgMCk8YnI+DQot
R0VOX1ZNVl9XSE9MRV9UUkFOUyh2bXYycl92LCAyLCAxKTxicj4NCi1HRU5fVk1WX1dIT0xFX1RS
QU5TKHZtdjRyX3YsIDQsIDIpPGJyPg0KLUdFTl9WTVZfV0hPTEVfVFJBTlModm12OHJfdiwgOCwg
Myk8YnI+DQorR0VOX1ZNVl9XSE9MRV9UUkFOUyh2bXYxcl92LCAxKTxicj4NCitHRU5fVk1WX1dI
T0xFX1RSQU5TKHZtdjJyX3YsIDIpPGJyPg0KK0dFTl9WTVZfV0hPTEVfVFJBTlModm12NHJfdiwg
NCk8YnI+DQorR0VOX1ZNVl9XSE9MRV9UUkFOUyh2bXY4cl92LCA4KTxicj4NCjxicj4NCsKgc3Rh
dGljIGJvb2wgaW50X2V4dF9jaGVjayhEaXNhc0NvbnRleHQgKnMsIGFyZ19ybXIgKmEsIHVpbnQ4
X3QgZGl2KTxicj4NCsKgezxicj4NCmRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvdmVjdG9yX2hl
bHBlci5jIGIvdGFyZ2V0L3Jpc2N2L3ZlY3Rvcl9oZWxwZXIuYzxicj4NCmluZGV4IDNiZDRhYWM5
YzkuLjFkNDk4MmVmN2YgMTAwNjQ0PGJyPg0KLS0tIGEvdGFyZ2V0L3Jpc2N2L3ZlY3Rvcl9oZWxw
ZXIuYzxicj4NCisrKyBiL3RhcmdldC9yaXNjdi92ZWN0b3JfaGVscGVyLmM8YnI+DQpAQCAtNDg4
OCwyNSArNDg4OCwxOCBAQCBHRU5fVkVYVF9WQ09NUFJFU1NfVk0odmNvbXByZXNzX3ZtX3csIHVp
bnQzMl90LCBINCk8YnI+DQrCoEdFTl9WRVhUX1ZDT01QUkVTU19WTSh2Y29tcHJlc3Nfdm1fZCwg
dWludDY0X3QsIEg4KTxicj4NCjxicj4NCsKgLyogVmVjdG9yIFdob2xlIFJlZ2lzdGVyIE1vdmUg
Ki88YnI+DQotI2RlZmluZSBHRU5fVkVYVF9WTVZfV0hPTEUoTkFNRSwgTEVOKcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQotdm9pZCBIRUxQRVIoTkFNRSkodm9pZCAqdmQs
IHZvaWQgKnZzMiwgQ1BVUklTQ1ZTdGF0ZSAqZW52LCBcPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHVpbnQzMl90IGRlc2MpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBcPGJyPg0KLXvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KLcKg
IMKgIC8qIEVFVyA9IDggKi/CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KLcKgIMKgIHVpbnQzMl90IG1heHN6ID0gc2lt
ZF9tYXhzeihkZXNjKTvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQotwqAg
wqAgdWludDMyX3QgaSA9IGVudi0mZ3Q7dnN0YXJ0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBcPGJyPg0KLcKgIMKgIG1lbWNweSgodWludDhfdCAqKXZkICsgSDEoaSkswqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCh1aW50
OF90ICopdnMyICsgSDEoaSkswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBc
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgbWF4c3ogLSBlbnYtJmd0O3ZzdGFydCk7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgXDxicj4NCi3CoCDCoCBlbnYtJmd0O3ZzdGFydCA9IDA7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0K
LX08YnI+DQordm9pZCBIRUxQRVIodm12cl92KSh2b2lkICp2ZCwgdm9pZCAqdnMyLCBDUFVSSVND
VlN0YXRlICplbnYsIHVpbnQzMl90IGRlc2MpPGJyPg0KK3s8YnI+DQorwqAgwqAgLyogRUVXID0g
OCAqLzxicj4NCivCoCDCoCB1aW50MzJfdCBtYXhzeiA9IHNpbWRfbWF4c3ooZGVzYyk7PGJyPg0K
K8KgIMKgIHVpbnQzMl90IGkgPSBlbnYtJmd0O3ZzdGFydDs8YnI+DQorPGJyPg0KK8KgIMKgIG1l
bWNweSgodWludDhfdCAqKXZkICsgSDEoaSksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgKHVpbnQ4
X3QgKil2czIgKyBIMShpKSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqBtYXhzeiAtIGVudi0mZ3Q7
dnN0YXJ0KTs8YnI+DQo8YnI+DQotR0VOX1ZFWFRfVk1WX1dIT0xFKHZtdjFyX3YsIDEpPGJyPg0K
LUdFTl9WRVhUX1ZNVl9XSE9MRSh2bXYycl92LCAyKTxicj4NCi1HRU5fVkVYVF9WTVZfV0hPTEUo
dm12NHJfdiwgNCk8YnI+DQotR0VOX1ZFWFRfVk1WX1dIT0xFKHZtdjhyX3YsIDgpPGJyPg0KK8Kg
IMKgIGVudi0mZ3Q7dnN0YXJ0ID0gMDs8YnI+DQorfTxicj4NCjxicj4NCsKgLyogVmVjdG9yIElu
dGVnZXIgRXh0ZW5zaW9uICovPGJyPg0KwqAjZGVmaW5lIEdFTl9WRVhUX0lOVF9FWFQoTkFNRSwg
RVRZUEUsIERUWVBFLCBIRCwgSFMxKcKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQotLSA8YnI+DQoy
LjE3LjE8YnI+DQo8YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+DQo=
--000000000000fca5e505db078d9c--


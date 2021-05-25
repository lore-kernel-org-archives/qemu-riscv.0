Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llf7i-0005Pi-NT
	for mharc-qemu-riscv@gnu.org; Tue, 25 May 2021 18:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1llf7g-0005PC-B2; Tue, 25 May 2021 18:02:00 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:34310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1llf7e-0003tG-0m; Tue, 25 May 2021 18:02:00 -0400
Received: by mail-io1-xd32.google.com with SMTP id d25so21485471ioe.1;
 Tue, 25 May 2021 15:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gRM4sTfVIcy1yeVlJTstaQapa6KpQyfUjV2Je6/h4vw=;
 b=c3RhIb6jeoyvctVdJZwKGGQpA0Q1h0xMxRFis0h0LoAsVKbWTRgnbFA9Fc3g5vkDTX
 OGcksJHlsRQ0idut6iZ6SooIwqguaY5Xe7E4fUF+rYYO6DXeRVNcdJ6l+W1umhASloQ6
 kQG5XLNcYqIcqwXbApqr8iuCeTVpKeqx0eFiIFD4joj7vD7mVT16JNmnY900SA8SypS1
 6Q4w0eDqr//hmSn4Ib5qUSmAtdo6+QIW0aaRQKv6oLBmtnME0x1ouVsJThNYX+xWiWjP
 12lSTqeEMuljpb571jR2g5c84glaDmytk41fFZVoGTrJPTd1DprbWZy8gIDdKMZohhIQ
 P7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gRM4sTfVIcy1yeVlJTstaQapa6KpQyfUjV2Je6/h4vw=;
 b=cF9Yf+XZUKDWm/7XC+e9VDnSB51nPBDwFcMx5hkCS6eRV8qBwVi1JV8wmASFt4xhI8
 wwT/1iVFyE5XXNBfKbeZMWZTaS69r3UqQBLzLafocXfztv/laHesfo1y0OYNkmfpKYJc
 WbgJxv2fIxJ1awM0bY1+d3gu7C3t8vUVWGWPMG8MbefZG70Icsmz1w2jDVqZtVWV7/qc
 EXS6NBBV/6Y6NeWZ5IcmjpOQQtZObayvrqYEXIH7z61IdnBSpsvAfLlAL93UicVUuU9d
 6hBIWr53t8meTnwMsN/faokoYYnFDkNf5rtiln2I1/rkiz6bO+TUeRqNh3RbJn1jcEDg
 YbEg==
X-Gm-Message-State: AOAM533xpJGz8cuNzhf6NO25J5h1JI6TXHijnX3hG5HXPSi6mVIFXYgP
 61sOc9BXAINqRwuM8qILMaDV3L+We8yG9m6XJoc=
X-Google-Smtp-Source: ABdhPJxgZ2Ihn/Q9kuRwkDyvDsqhPQ8Yy2bZx/NsaJZZS8zz1IeUKue+TEHhKNL1mTv2ccgg94zgsjUp7grePPeN1kk=
X-Received: by 2002:a05:6602:134c:: with SMTP id
 i12mr23119775iov.175.1621980116305; 
 Tue, 25 May 2021 15:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210521054816.1784297-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210521054816.1784297-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 May 2021 08:01:29 +1000
Message-ID: <CAKmqyKOTi43q62xiC0pknjGr+wJsOnP53tOA9=mg8apoQdEQ8Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Pass the same value to oprsz and maxsz.
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 25 May 2021 22:02:00 -0000

On Fri, May 21, 2021 at 3:48 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Since commit e2e7168a214b0ed98dc357bba96816486a289762, if oprsz
> is still zero(as we don't use this field), simd_desc will trigger an
> assert.
>
> Besides, tcg_gen_gvec_*_ptr calls simd_desc in it's implementation.
> Here we pass the value to maxsz and oprsz to bypass the assert.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 89 ++++++++++++++-----------
>  1 file changed, 50 insertions(+), 39 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 47914a3b69..83d9a285ba 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -183,7 +183,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>       * The first part is vlen in bytes, encoded in maxsz of simd_desc.
>       * The second part is lmul, encoded in data of simd_desc.
>       */
> -    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>      gen_get_gpr(base, rs1);
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
> @@ -334,7 +334,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
>      mask = tcg_temp_new_ptr();
>      base = tcg_temp_new();
>      stride = tcg_temp_new();
> -    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>      gen_get_gpr(base, rs1);
>      gen_get_gpr(stride, rs2);
> @@ -462,7 +462,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      mask = tcg_temp_new_ptr();
>      index = tcg_temp_new_ptr();
>      base = tcg_temp_new();
> -    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>      gen_get_gpr(base, rs1);
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
> @@ -594,7 +594,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
>      base = tcg_temp_new();
> -    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>      gen_get_gpr(base, rs1);
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
> @@ -671,7 +671,7 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      mask = tcg_temp_new_ptr();
>      index = tcg_temp_new_ptr();
>      base = tcg_temp_new();
> -    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>      gen_get_gpr(base, rs1);
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
> @@ -831,7 +831,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
> -                           cpu_env, 0, s->vlen / 8, data, fn);
> +                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
>      }
>      gen_set_label(over);
>      return true;
> @@ -874,7 +874,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>      data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
>      data = FIELD_DP32(data, VDATA, VM, vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> -    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
> @@ -1021,7 +1021,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
>      data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
>      data = FIELD_DP32(data, VDATA, VM, vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> -    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
> @@ -1119,7 +1119,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1),
>                             vreg_ofs(s, a->rs2),
> -                           cpu_env, 0, s->vlen / 8,
> +                           cpu_env, s->vlen / 8, s->vlen / 8,
>                             data, fn);
>          gen_set_label(over);
>          return true;
> @@ -1207,7 +1207,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1),
>                             vreg_ofs(s, a->rs2),
> -                           cpu_env, 0, s->vlen / 8, data, fn);
> +                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
>          gen_set_label(over);
>          return true;
>      }
> @@ -1284,8 +1284,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
> -                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
> -                           s->vlen / 8, data, fns[s->sew]);        \
> +                           vreg_ofs(s, a->rs2), cpu_env,           \
> +                           s->vlen / 8, s->vlen / 8, data,         \
> +                           fns[s->sew]);                           \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -1473,8 +1474,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
> -                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
> -                           s->vlen / 8, data, fns[s->sew]);        \
> +                           vreg_ofs(s, a->rs2), cpu_env,           \
> +                           s->vlen / 8, s->vlen / 8, data,         \
> +                           fns[s->sew]);                           \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -1690,7 +1692,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>              };
>
>              tcg_gen_ext_tl_i64(s1_i64, s1);
> -            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>              tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
>              fns[s->sew](dest, s1_i64, cpu_env, desc);
>
> @@ -1729,7 +1731,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
>
>              s1 = tcg_const_i64(simm);
>              dest = tcg_temp_new_ptr();
> -            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>              tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
>              fns[s->sew](dest, s1, cpu_env, desc);
>
> @@ -1838,8 +1840,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
> -                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
> -                           s->vlen / 8, data, fns[s->sew - 1]);    \
> +                           vreg_ofs(s, a->rs2), cpu_env,           \
> +                           s->vlen / 8, s->vlen / 8, data,         \
> +                           fns[s->sew - 1]);                       \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -1863,7 +1866,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
>      src2 = tcg_temp_new_ptr();
> -    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
> @@ -1950,8 +1953,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
>                             vreg_ofs(s, a->rs1),                  \
> -                           vreg_ofs(s, a->rs2), cpu_env, 0,      \
> -                           s->vlen / 8, data, fns[s->sew - 1]);  \
> +                           vreg_ofs(s, a->rs2), cpu_env,         \
> +                           s->vlen / 8, s->vlen / 8, data,       \
> +                           fns[s->sew - 1]);                     \
>          gen_set_label(over);                                     \
>          return true;                                             \
>      }                                                            \
> @@ -2024,8 +2028,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
> -                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
> -                           s->vlen / 8, data, fns[s->sew - 1]);    \
> +                           vreg_ofs(s, a->rs2), cpu_env,           \
> +                           s->vlen / 8, s->vlen / 8, data,         \
> +                           fns[s->sew - 1]);                       \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2138,8 +2143,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> -                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
> -                           s->vlen / 8, data, fns[s->sew - 1]);    \
> +                           vreg_ofs(s, a->rs2), cpu_env,           \
> +                           s->vlen / 8, s->vlen / 8, data,         \
> +                           fns[s->sew - 1]);                       \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2225,7 +2231,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>              tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>
>              dest = tcg_temp_new_ptr();
> -            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>              tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
>              fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
>
> @@ -2278,8 +2284,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> -                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
> -                           s->vlen / 8, data, fns[s->sew - 1]);    \
> +                           vreg_ofs(s, a->rs2), cpu_env,           \
> +                           s->vlen / 8, s->vlen / 8, data,         \
> +                           fns[s->sew - 1]);                       \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2326,8 +2333,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> -                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
> -                           s->vlen / 8, data, fns[s->sew - 1]);    \
> +                           vreg_ofs(s, a->rs2), cpu_env,           \
> +                           s->vlen / 8, s->vlen / 8, data,         \
> +                           fns[s->sew - 1]);                       \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2388,8 +2396,8 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
> -                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
> -                           s->vlen / 8, data, fn);                 \
> +                           vreg_ofs(s, a->rs2), cpu_env,           \
> +                           s->vlen / 8, s->vlen / 8, data, fn);    \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2420,7 +2428,7 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
>          mask = tcg_temp_new_ptr();
>          src2 = tcg_temp_new_ptr();
>          dst = tcg_temp_new();
> -        desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +        desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>          tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
>          tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> @@ -2452,7 +2460,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
>          mask = tcg_temp_new_ptr();
>          src2 = tcg_temp_new_ptr();
>          dst = tcg_temp_new();
> -        desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +        desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>          tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
>          tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> @@ -2486,7 +2494,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
>                             vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
> -                           cpu_env, 0, s->vlen / 8, data, fn);     \
> +                           cpu_env, s->vlen / 8, s->vlen / 8,      \
> +                           data, fn);                              \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2516,8 +2525,8 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
>              gen_helper_viota_m_w, gen_helper_viota_m_d,
>          };
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
> -                           vreg_ofs(s, a->rs2), cpu_env, 0,
> -                           s->vlen / 8, data, fns[s->sew]);
> +                           vreg_ofs(s, a->rs2), cpu_env,
> +                           s->vlen / 8, s->vlen / 8, data, fns[s->sew]);
>          gen_set_label(over);
>          return true;
>      }
> @@ -2542,7 +2551,8 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
>              gen_helper_vid_v_w, gen_helper_vid_v_d,
>          };
>          tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
> -                           cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
> +                           cpu_env, s->vlen / 8, s->vlen / 8,
> +                           data, fns[s->sew]);
>          gen_set_label(over);
>          return true;
>      }
> @@ -2895,7 +2905,8 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
> -                           cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
> +                           cpu_env, s->vlen / 8, s->vlen / 8, data,
> +                           fns[s->sew]);
>          gen_set_label(over);
>          return true;
>      }
> --
> 2.25.1
>
>


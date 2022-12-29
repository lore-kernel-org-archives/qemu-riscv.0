Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAxDV-0004Bl-RX
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 13:01:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAxDP-0004AG-3b
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:01:15 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAxDN-00065P-3S
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:01:14 -0500
Received: by mail-ej1-x629.google.com with SMTP id kw15so46595749ejc.10
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 10:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L3l9whsmmdTnr68eVWxsOO1sL2/p8Aoo/iYFNbZr8Go=;
 b=rAc7anHUwy7+0nbHp3HZdGpn0DU2yMhkTVaXMvWLkMRoFvnLD/D4eyDyc57p+IEnHL
 fIdOGOMc7Ss8hDL6lj4uycZRmcdz6kZdXCPOC8qaDbDGkTMBWRATxIpg3/uNbu25Ld7m
 HvkerMAsuRgnkJJwfcw2wDPImq6m1Vv/lvYKHf8id0+pwbdXt+KuPUQZbJmVNI6uuV+W
 hS42TsJxgo/0XikMY3hcfeB6Lc0xRVjSSEAfi1TuENspi50l93C+7/mb5bXDS1Phesr/
 +6qVRstqXQ06tU3Y2u/VKB556ZuabvMJsZaY8wKWU9NXXOMG8Pj/u6TWXulF1cdvb+Fc
 BtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L3l9whsmmdTnr68eVWxsOO1sL2/p8Aoo/iYFNbZr8Go=;
 b=yYj+ncXsZXnlli0ki1A6JRR/nh/uoFsLiuo3XyasFq2mOYXSJ1T5/WdZ9RblkNphQm
 G2EurVXJm52mu3CakwWegOc9mmvWe9r4ece7wrd5R3Dj6lDxfSSoXOyXG7vuASnwZ55J
 epwpgjHy62UjvOP9rebR8I1uDaV6WhiBD6afBtw6wiHtJjzxYjIHWEH3O6YRmibFFfeo
 sSe/xI5PrlAzGCSFwuOfIsLsfdDKR6VQVDNA575hLcLdx5z1o4MQ6U5TD3NAONqFlpJv
 3QjmINvfvPcMWMJRUUO7CYMgB5fj065rj6padH3jN9jkzerxZP02r8sRSSaEFjvpZ+cf
 hHHA==
X-Gm-Message-State: AFqh2kpn4yhfeFBPb/jc/exFDCB+qsMwCLmEb7lJGMTF+h7NQfzR6UCW
 UzNxtMVVj50lZ8OqbY+8gQcmPA==
X-Google-Smtp-Source: AMrXdXvY0UsETBbUBfshadg/E7nTuUhNq+W+UPZZps1eKhO0+cOhUAuWrIcryNgOGiF+NaxhT5AIDg==
X-Received: by 2002:a17:907:d50e:b0:81f:fc05:2ba0 with SMTP id
 wb14-20020a170907d50e00b0081ffc052ba0mr25848961ejc.2.1672336871369; 
 Thu, 29 Dec 2022 10:01:11 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a17090668c400b007aed2057eacsm8772493ejr.221.2022.12.29.10.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 10:01:10 -0800 (PST)
Message-ID: <04f01f1b-525b-ef99-4560-3a68f3bea15f@linaro.org>
Date: Thu, 29 Dec 2022 19:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] riscv: do not set the rounding mode via `gen_set_rm`
To: Saleem Abdulrasool <abdulras@google.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, frank.chang@sifive.com,
 Saleem Abdulrasool <compnerd@compnerd.org>
References: <20221229173743.123894-1-abdulras@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221229173743.123894-1-abdulras@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 29 Dec 2022 18:01:16 -0000

On 29/12/22 18:37, Saleem Abdulrasool wrote:
> From: Saleem Abdulrasool <compnerd@compnerd.org>
> 
> Setting the rounding mode via the `gen_set_rm` call would alter the
> state of the disassembler, resetting the `TransOp` in the assembler
> context.  When we subsequently set the rounding mode to the desired
> value, we would trigger an assertion in `decode_save_opc`.  Instead
> we can set the rounding mode via the `gen_helper_set_rounding_mode`
> which will still trigger the exception in the case of an invalid RM
> without altering the CPU disassembler state.
> 
> Signed-off-by: Saleem Abdulrasool <compnerd@compnerd.org>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 69 +++++++++++++------------
>   1 file changed, 36 insertions(+), 33 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 4dea4413ae..73f6fab1c5 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2679,8 +2679,10 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>                       int rm)
>   {
>       if (checkfn(s, a)) {
> +        // the helper will raise an exception if the rounding mode is invalid
>           if (rm != RISCV_FRM_DYN) {
> -            gen_set_rm(s, RISCV_FRM_DYN);
> +            gen_helper_set_rounding_mode(cpu_env,
> +                                         tcg_constant_i32(RISCV_FRM_DYN));
>           }
>   
>           uint32_t data = 0;
> @@ -3001,38 +3003,39 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
>              require_scale_zve64f(s);
>   }
>   
> -#define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
> -static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
> -{                                                                  \
> -    if (CHECK(s, a)) {                                             \
> -        if (FRM != RISCV_FRM_DYN) {                                \
> -            gen_set_rm(s, RISCV_FRM_DYN);                          \
> -        }                                                          \
> -                                                                   \
> -        uint32_t data = 0;                                         \
> -        static gen_helper_gvec_3_ptr * const fns[2] = {            \
> -            gen_helper_##HELPER##_h,                               \
> -            gen_helper_##HELPER##_w,                               \
> -        };                                                         \
> -        TCGLabel *over = gen_new_label();                          \
> -        gen_set_rm(s, FRM);                                        \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> -        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
> -                                                                   \
> -        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
> -        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> -        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> -        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
> -        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> -                           vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->cfg_ptr->vlen / 8,                   \
> -                           s->cfg_ptr->vlen / 8, data,             \
> -                           fns[s->sew - 1]);                       \
> -        mark_vs_dirty(s);                                          \
> -        gen_set_label(over);                                       \
> -        return true;                                               \
> -    }                                                              \
> -    return false;                                                  \
> +#define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)                     \
> +static bool trans_##NAME(DisasContext *s, arg_rmr *a)                       \
> +{                                                                           \
> +    if (CHECK(s, a)) {                                                      \
> +        if (FRM != RISCV_FRM_DYN) {                                         \
> +            gen_helper_set_rounding_mode(cpu_env,                           \
> +                                         tcg_constant_i32(RISCV_FRM_DYN));  \
> +        }                                                                   \
> +                                                                            \
> +        uint32_t data = 0;                                                  \
> +        static gen_helper_gvec_3_ptr * const fns[2] = {                     \
> +            gen_helper_##HELPER##_h,                                        \
> +            gen_helper_##HELPER##_w,                                        \
> +        };                                                                  \
> +        TCGLabel *over = gen_new_label();                                   \
> +        gen_set_rm(s, FRM);                                                 \
> +        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);                   \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);          \
> +                                                                            \
> +        data = FIELD_DP32(data, VDATA, VM, a->vm);                          \
> +        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                      \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);                        \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);                        \
> +        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),              \
> +                           vreg_ofs(s, a->rs2), cpu_env,                    \
> +                           s->cfg_ptr->vlen / 8,                            \
> +                           s->cfg_ptr->vlen / 8, data,                      \
> +                           fns[s->sew - 1]);                                \
> +        mark_vs_dirty(s);                                                   \
> +        gen_set_label(over);                                                \
> +        return true;                                                        \
> +    }                                                                       \
> +    return false;                                                           \
>   }

Perfect example of why I don't like aligned '\' formatting in macros,
and prefer using a single unaligned space + '\'.

Anyhow, looking at this patch with 'git-diff --ignore-all-space' we get
a 2 lines change:

-- >8 --
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc 
b/target/riscv/insn_trans/trans_rvv.c.inc
index 4dea4413ae..73f6fab1c5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2679,8 +2679,10 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
                      int rm)
  {
      if (checkfn(s, a)) {
+        // the helper will raise an exception if the rounding mode is 
invalid
          if (rm != RISCV_FRM_DYN) {
-            gen_set_rm(s, RISCV_FRM_DYN);
+            gen_helper_set_rounding_mode(cpu_env,
+                                         tcg_constant_i32(RISCV_FRM_DYN));
          }

          uint32_t data = 0;
@@ -3006,7 +3008,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr 
*a)              \
  { 
      \
      if (CHECK(s, a)) { 
      \
          if (FRM != RISCV_FRM_DYN) { 
      \
-            gen_set_rm(s, RISCV_FRM_DYN);                          \
+            gen_helper_set_rounding_mode(cpu_env, 
     \
+ 
tcg_constant_i32(RISCV_FRM_DYN));  \
          } 
      \
 
      \
          uint32_t data = 0; 
      \
---


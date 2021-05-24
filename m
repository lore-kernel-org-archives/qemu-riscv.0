Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ll2UK-0002xq-5V
	for mharc-qemu-riscv@gnu.org; Mon, 24 May 2021 00:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1ll2UI-0002x8-Mq
 for qemu-riscv@nongnu.org; Mon, 24 May 2021 00:46:46 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1ll2UF-0006cY-Ks
 for qemu-riscv@nongnu.org; Mon, 24 May 2021 00:46:46 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b7so9843514plg.0
 for <qemu-riscv@nongnu.org>; Sun, 23 May 2021 21:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+XOQeysAfX0hQEu0i6Me/kIyP3wbkypxnZojoEGao14=;
 b=AMfZDKNOKHIeHeQKb4dTh8ioBY1JwHIoL5VzTtCft6e7a4zIJREu3By/57aQCXf1Kq
 r/qnGrwX04t+bMNYT/AfZMPSrI2qE5loT6Ydcxg5WCTFgbURYqwFA0XVjpkvZLDjoyGL
 GchNTp96FQqlFfs1KTLUUqVopLHneWoheTXUHpZKMc82rovsQf28RNu8lUiZIM2VOx80
 BlBVoQT2lo53gST9EF/6z1RIUkmLcHtAsASbZSAVhHIQ3WvhuI9OdHk3s7SUcNDH/mFs
 dH7Hmsm8E4WMj+nDR5BMY4IjJL4yhjeTXDkd+NLlPY3XxCalCCEFjFMBtx3P3S6YrCvW
 yf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+XOQeysAfX0hQEu0i6Me/kIyP3wbkypxnZojoEGao14=;
 b=VRtPXordZDPIShYG2hVm+oPzUVaJXEMFZGlvEqbsA5zBsKU/uF+/vA6RBcPCtPRHkk
 cp7DapTid/5GNqYNxBh9X5J4ZBN4K39oF4yzY4VSvwLoE6T2b8CJX1d+MoQ+3XDvlRgr
 ZpQefXP3Sbcp5SNgeSmLbun4l3O6Bj0YTBGCp9KVCmglMrhNLBT/S+ao+uV5caw9rraE
 SEoo94w5+auZ6Ngdn/H/aGFf+CpHhcjEyu6ApSiYTakv/KpHW9tlR2RQA6X8OSKkSgge
 Xwy/NF8USJZu0FIMPVm+MAtfagSUutg3s81vC4uE726HnFO6ePGgCUfIqmHy3aAgwJ/V
 AaBQ==
X-Gm-Message-State: AOAM530IibEGEr3zrtEVCpPjcrg/slbfv96B+i5Ro3AFjp1N8aqx6lmL
 nMyXqJnAxovO9NC1wf+L0KDyEg==
X-Google-Smtp-Source: ABdhPJwLVPB3jMI1+uXQimSfLh4wqxhkwd3bnUB7Qzt4EFz/fHxgAjUAbeRaUtL15PRJsDsfTuS4UQ==
X-Received: by 2002:a17:90b:8c5:: with SMTP id
 ds5mr23472789pjb.127.1621831601725; 
 Sun, 23 May 2021 21:46:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c7sm10333311pga.4.2021.05.23.21.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 21:46:41 -0700 (PDT)
Date: Sun, 23 May 2021 21:46:41 -0700 (PDT)
X-Google-Original-Date: Sun, 23 May 2021 21:46:39 PDT (-0700)
Subject: Re: [PATCH 07/38] target/riscv: SIMD 8-bit Shift Instructions
In-Reply-To: <20210212150256.885-8-zhiwei_liu@c-sky.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 alistair23@gmail.com, zhiwei_liu@c-sky.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhiwei_liu@c-sky.com
Message-ID: <mhng-473b2bdf-9ee3-4780-87bf-e8adabce949c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 24 May 2021 04:46:46 -0000

On Fri, 12 Feb 2021 07:02:25 PST (-0800), zhiwei_liu@c-sky.com wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

I know it's always kind of akward for this type of patches, but IIUC 
they're all supposed to have some sort of description.

> ---
>  target/riscv/helper.h                   |   9 +++
>  target/riscv/insn32.decode              |  17 ++++
>  target/riscv/insn_trans/trans_rvp.c.inc |  16 ++++
>  target/riscv/packed_helper.c            | 102 ++++++++++++++++++++++++
>  4 files changed, 144 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 20bf400ac2..0ecd4d53f9 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1193,3 +1193,12 @@ DEF_HELPER_3(sll16, tl, env, tl, tl)
>  DEF_HELPER_3(ksll16, tl, env, tl, tl)
>  DEF_HELPER_3(kslra16, tl, env, tl, tl)
>  DEF_HELPER_3(kslra16_u, tl, env, tl, tl)
> +
> +DEF_HELPER_3(sra8, tl, env, tl, tl)
> +DEF_HELPER_3(sra8_u, tl, env, tl, tl)
> +DEF_HELPER_3(srl8, tl, env, tl, tl)
> +DEF_HELPER_3(srl8_u, tl, env, tl, tl)
> +DEF_HELPER_3(sll8, tl, env, tl, tl)
> +DEF_HELPER_3(ksll8, tl, env, tl, tl)
> +DEF_HELPER_3(kslra8, tl, env, tl, tl)
> +DEF_HELPER_3(kslra8_u, tl, env, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 6f053bfeb7..cc782fcde5 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -24,6 +24,7 @@
>
>  %sh10    20:10
>  %sh4    20:4
> +%sh3    20:3
>  %csr    20:12
>  %rm     12:3
>  %nf     29:3                     !function=ex_plus_1
> @@ -61,6 +62,7 @@
>
>  @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
>  @sh4     ......  ...... .....  ... ..... ....... &shift  shamt=%sh4      %rs1 %rd
> +@sh3     ......  ...... .....  ... ..... ....... &shift  shamt=%sh3      %rs1 %rd
>  @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
>
>  @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
> @@ -652,3 +654,18 @@ ksll16     0110010  ..... ..... 000 ..... 1111111 @r
>  kslli16    0111010  1.... ..... 000 ..... 1111111 @sh4
>  kslra16    0101011  ..... ..... 000 ..... 1111111 @r
>  kslra16_u  0110011  ..... ..... 000 ..... 1111111 @r
> +
> +sra8       0101100  ..... ..... 000 ..... 1111111 @r
> +sra8_u     0110100  ..... ..... 000 ..... 1111111 @r
> +srai8      0111100  00... ..... 000 ..... 1111111 @sh3
> +srai8_u    0111100  01... ..... 000 ..... 1111111 @sh3
> +srl8       0101101  ..... ..... 000 ..... 1111111 @r
> +srl8_u     0110101  ..... ..... 000 ..... 1111111 @r
> +srli8      0111101  00... ..... 000 ..... 1111111 @sh3
> +srli8_u    0111101  01... ..... 000 ..... 1111111 @sh3
> +sll8       0101110  ..... ..... 000 ..... 1111111 @r
> +slli8      0111110  00... ..... 000 ..... 1111111 @sh3
> +ksll8      0110110  ..... ..... 000 ..... 1111111 @r
> +kslli8     0111110  01... ..... 000 ..... 1111111 @sh3
> +kslra8     0101111  ..... ..... 000 ..... 1111111 @r
> +kslra8_u   0110111  ..... ..... 000 ..... 1111111 @r
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 848edab7e5..12a64849eb 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -353,3 +353,19 @@ GEN_RVP_SHIFTI(slli16, sll16, tcg_gen_vec_shl16i_i64);
>  GEN_RVP_SHIFTI(srai16_u, sra16_u, NULL);
>  GEN_RVP_SHIFTI(srli16_u, srl16_u, NULL);
>  GEN_RVP_SHIFTI(kslli16, ksll16, NULL);
> +
> +/* SIMD 8-bit Shift Instructions */
> +GEN_RVP_SHIFT(sra8, tcg_gen_gvec_sars, 0);
> +GEN_RVP_SHIFT(srl8, tcg_gen_gvec_shrs, 0);
> +GEN_RVP_SHIFT(sll8, tcg_gen_gvec_shls, 0);
> +GEN_RVP_R_OOL(sra8_u);
> +GEN_RVP_R_OOL(srl8_u);
> +GEN_RVP_R_OOL(ksll8);
> +GEN_RVP_R_OOL(kslra8);
> +GEN_RVP_R_OOL(kslra8_u);
> +GEN_RVP_SHIFTI(srai8, sra8, tcg_gen_vec_sar8i_i64);
> +GEN_RVP_SHIFTI(srli8, srl8, tcg_gen_vec_shr8i_i64);
> +GEN_RVP_SHIFTI(slli8, sll8, tcg_gen_vec_shl8i_i64);
> +GEN_RVP_SHIFTI(srai8_u, sra8_u, NULL);
> +GEN_RVP_SHIFTI(srli8_u, srl8_u, NULL);
> +GEN_RVP_SHIFTI(kslli8, ksll8, NULL);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index 7e31c2fe46..ab9ebc472b 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -529,3 +529,105 @@ static inline void do_kslra16_u(CPURISCVState *env, void *vd, void *va,
>  }
>
>  RVPR(kslra16_u, 1, 2);
> +
> +/* SIMD 8-bit Shift Instructions */
> +static inline void do_sra8(CPURISCVState *env, void *vd, void *va,
> +                           void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] = a[i] >> shift;
> +}
> +
> +RVPR(sra8, 1, 1);
> +
> +static inline void do_srl8(CPURISCVState *env, void *vd, void *va,
> +                           void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] = a[i] >> shift;
> +}
> +
> +RVPR(srl8, 1, 1);
> +
> +static inline void do_sll8(CPURISCVState *env, void *vd, void *va,
> +                           void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] = a[i] << shift;
> +}
> +
> +RVPR(sll8, 1, 1);
> +
> +static inline void do_sra8_u(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] =  vssra8(env, 0, a[i], shift);
> +}
> +
> +RVPR(sra8_u, 1, 1);
> +
> +static inline void do_srl8_u(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] =  vssrl8(env, 0, a[i], shift);
> +}
> +
> +RVPR(srl8_u, 1, 1);
> +
> +static inline void do_ksll8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, result;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +
> +    result = a[i] << shift;
> +    if (shift > (clrsb32(a[i]) - 24)) {
> +        env->vxsat = 0x1;
> +        d[i] = (a[i] & INT8_MIN) ? INT8_MIN : INT8_MAX;
> +    } else {
> +        d[i] = result;
> +    }
> +}
> +
> +RVPR(ksll8, 1, 1);
> +
> +static inline void do_kslra8(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    int32_t shift = sextract32((*(uint32_t *)vb), 0, 4);
> +
> +    if (shift >= 0) {
> +        do_ksll8(env, vd, va, vb, i);
> +    } else {
> +        shift = -shift;
> +        shift = (shift == 8) ? 7 : shift;
> +        d[i] = a[i] >> shift;
> +    }
> +}
> +
> +RVPR(kslra8, 1, 1);
> +
> +static inline void do_kslra8_u(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    int32_t shift = sextract32((*(uint32_t *)vb), 0, 4);
> +
> +    if (shift >= 0) {
> +        do_ksll8(env, vd, va, vb, i);
> +    } else {
> +        shift = -shift;
> +        shift = (shift == 8) ? 7 : shift;
> +        d[i] =  vssra8(env, 0, a[i], shift);
> +    }
> +}
> +
> +RVPR(kslra8_u, 1, 1);

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>


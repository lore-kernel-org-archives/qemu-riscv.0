Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lkyxi-00008c-Je
	for mharc-qemu-riscv@gnu.org; Sun, 23 May 2021 21:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1lkyxb-00008H-QF
 for qemu-riscv@nongnu.org; Sun, 23 May 2021 21:00:49 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1lkyxV-0006OA-Dk
 for qemu-riscv@nongnu.org; Sun, 23 May 2021 21:00:47 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n8so8554962plf.7
 for <qemu-riscv@nongnu.org>; Sun, 23 May 2021 18:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=H9jqymzxHvqrh9s5eUBTbrB5UCiTChDWMtf+0BbMchU=;
 b=mrh6rYiqs9dWQAAEyBq+KW/JqQ8C7NDJnyIpbSt1iSlQfnasrs92R1xHxamlcyDegP
 VbRpIZr1NojSJzNym2pN8ffrPBgEsODL72P1UsSumfWy4jz7z/1PYakytqQP9NtMdKvK
 Yxr0QcWjQXFY4nnHtcUz9/hHRxi8SM0qaBgdSEHh4J5fENyTp9a/IGEnMXwKxNH1UiCx
 PtDXNVXsjcyu2Eet9heyV0Unk2yW/yonCVZcNCsxhpZMsI3vAY92QUFYmDTfsyATShzY
 qiHf4Xvk0NDkVCG5v5dkN+n5nWfO8gLQCKS9g94GeJlLhDei4FU0X9z5m/fAzM9OOMMz
 DLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=H9jqymzxHvqrh9s5eUBTbrB5UCiTChDWMtf+0BbMchU=;
 b=BUmE5uLjoMTfwtdsthM+tmFwnyAIZe7+1jWvlawLVhz5CMH0zqIzCt+jIvQ3+EVYlc
 MUS5MLMF7SnJL4gO/RhX8qhN7TfZVBSyUjDUaMvKKCzNmaJUPlSMP+1/WysYpqswqRrc
 JK1C+J28OStJcOVzYKpL3/8AEQwtzXggWg9yfBPNpWyHGaR5/B/nWtcwPxxDD6dQR0b0
 JS/0PgD9EQOTaQYZp3enve2Ztz4smGDS+YmdnKWQBv2gR2oV8YsZJK6f1y1hu61lr/L5
 AwIx2MtgkRPLWorlYGXuPTjQQbiuU5dgzMh3xwWbwSMAvDjiny7I5n8aHy0sh4tvxvWT
 N9Ow==
X-Gm-Message-State: AOAM532Wudg4Tm2Z6cD2fqmry0dKs+i58UTOSU0L56Dpa8z4Cf/iqJxb
 lCmE5pMWhSVB6H0HI55K7Uivgua+jkzADg==
X-Google-Smtp-Source: ABdhPJwuLkzAbtIiVaB/5b8WrckjYE++uVhhAYETlhLK3yE9c5+j/SCOholtOLFfsKbqlDX1U30ncQ==
X-Received: by 2002:a17:90a:c096:: with SMTP id
 o22mr22974948pjs.231.1621818036577; 
 Sun, 23 May 2021 18:00:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t22sm9233782pfl.50.2021.05.23.18.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 18:00:35 -0700 (PDT)
Date: Sun, 23 May 2021 18:00:35 -0700 (PDT)
X-Google-Original-Date: Sun, 23 May 2021 18:00:28 PDT (-0700)
Subject: Re: [PATCH 05/38] target/riscv: 8-bit Addition & Subtraction
 Instruction
In-Reply-To: <CAKmqyKO9UHGkfRdb8dEVHFaxCjGox3x+-g066nRc_vqc7wtVWQ@mail.gmail.com>
CC: zhiwei_liu@c-sky.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 richard.henderson@linaro.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com
Message-ID: <mhng-167a21fd-72ef-432a-896e-ac21b587c560@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 24 May 2021 01:00:49 -0000

On Mon, 15 Mar 2021 14:22:58 PDT (-0700), alistair23@gmail.com wrote:
> On Fri, Feb 12, 2021 at 10:14 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

I saw some reviews on the other ones, but since others (like this) just 
have acks and haven't had any other traffic I'm going to start here.

It looks like the latest spec is 0.9.4, but the changelog is pretty 
minimal between 0.9.5 and 0.9.2:

[0.9.2 -> 0.9.3]

* Changed Zp64 name to Zpsfoperand.
* Added Zprvsfextra for RV64 only instructions.
* Removed SWAP16 encoding. It is an alias of PKBT16.
* Fixed few typos and enhanced precision descriptions on imtermediate results.

[0.9.3 -> 0.9.4]

* Fixed few typos and enhanced precision descriptions on imtermediate results.
* Fixed/Changed data types for some intrinsic functions.
* Removed "RV32 Only" for Zpsfoperand.

So I'm just going to stick with reviewing based on the latest spec 
<https://github.com/riscv/riscv-p-spec/blob/d33a761f805d3b7c84214e5654a511267985a0a0/P-ext-proposal.pdf> 
and try to keep those differences in mind, assuming we're just tracking 
the latest draft here.

> Alistair
>
>> ---
>>  target/riscv/helper.h                   |  9 +++
>>  target/riscv/insn32.decode              | 11 ++++
>>  target/riscv/insn_trans/trans_rvp.c.inc | 79 +++++++++++++++++++++++++
>>  target/riscv/packed_helper.c            | 73 +++++++++++++++++++++++
>>  4 files changed, 172 insertions(+)
>>
>> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
>> index 6d622c732a..a69a6b4e84 100644
>> --- a/target/riscv/helper.h
>> +++ b/target/riscv/helper.h
>> @@ -1175,3 +1175,12 @@ DEF_HELPER_3(rstsa16, tl, env, tl, tl)
>>  DEF_HELPER_3(urstsa16, tl, env, tl, tl)
>>  DEF_HELPER_3(kstsa16, tl, env, tl, tl)
>>  DEF_HELPER_3(ukstsa16, tl, env, tl, tl)
>> +
>> +DEF_HELPER_3(radd8, tl, env, tl, tl)
>> +DEF_HELPER_3(uradd8, tl, env, tl, tl)
>> +DEF_HELPER_3(kadd8, tl, env, tl, tl)
>> +DEF_HELPER_3(ukadd8, tl, env, tl, tl)
>> +DEF_HELPER_3(rsub8, tl, env, tl, tl)
>> +DEF_HELPER_3(ursub8, tl, env, tl, tl)
>> +DEF_HELPER_3(ksub8, tl, env, tl, tl)
>> +DEF_HELPER_3(uksub8, tl, env, tl, tl)
>> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
>> index 8815e90476..358dd1fa10 100644
>> --- a/target/riscv/insn32.decode
>> +++ b/target/riscv/insn32.decode
>> @@ -624,3 +624,14 @@ rstsa16    1011011  ..... ..... 010 ..... 1111111 @r
>>  urstsa16   1101011  ..... ..... 010 ..... 1111111 @r
>>  kstsa16    1100011  ..... ..... 010 ..... 1111111 @r
>>  ukstsa16   1110011  ..... ..... 010 ..... 1111111 @r
>> +
>> +add8       0100100  ..... ..... 000 ..... 1111111 @r
>> +radd8      0000100  ..... ..... 000 ..... 1111111 @r
>> +uradd8     0010100  ..... ..... 000 ..... 1111111 @r
>> +kadd8      0001100  ..... ..... 000 ..... 1111111 @r
>> +ukadd8     0011100  ..... ..... 000 ..... 1111111 @r
>> +sub8       0100101  ..... ..... 000 ..... 1111111 @r
>> +rsub8      0000101  ..... ..... 000 ..... 1111111 @r
>> +ursub8     0010101  ..... ..... 000 ..... 1111111 @r
>> +ksub8      0001101  ..... ..... 000 ..... 1111111 @r
>> +uksub8     0011101  ..... ..... 000 ..... 1111111 @r
>> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
>> index 0885a4fd45..109f560ec9 100644
>> --- a/target/riscv/insn_trans/trans_rvp.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
>> @@ -159,3 +159,82 @@ GEN_RVP_R_OOL(rstsa16);
>>  GEN_RVP_R_OOL(urstsa16);
>>  GEN_RVP_R_OOL(kstsa16);
>>  GEN_RVP_R_OOL(ukstsa16);
>> +
>> +/* 8-bit Addition & Subtraction Instructions */
>> +/*
>> + *  Copied from tcg-op-gvec.c.
>> + *
>> + *  Perform a vector addition using normal addition and a mask.  The mask
>> + *  should be the sign bit of each lane.  This 6-operation form is more
>> + *  efficient than separate additions when there are 4 or more lanes in
>> + *  the 64-bit operation.
>> + */
>> +
>> +static void gen_simd_add_mask(TCGv d, TCGv a, TCGv b, TCGv m)
>> +{
>> +    TCGv t1 = tcg_temp_new();
>> +    TCGv t2 = tcg_temp_new();
>> +    TCGv t3 = tcg_temp_new();
>> +
>> +    tcg_gen_andc_tl(t1, a, m);
>> +    tcg_gen_andc_tl(t2, b, m);
>> +    tcg_gen_xor_tl(t3, a, b);
>> +    tcg_gen_add_tl(d, t1, t2);
>> +    tcg_gen_and_tl(t3, t3, m);
>> +    tcg_gen_xor_tl(d, d, t3);
>> +
>> +    tcg_temp_free(t1);
>> +    tcg_temp_free(t2);
>> +    tcg_temp_free(t3);
>> +}
>> +
>> +static void tcg_gen_simd_add8(TCGv d, TCGv a, TCGv b)
>> +{
>> +    TCGv m = tcg_const_tl((target_ulong)dup_const(MO_8, 0x80));
>> +    gen_simd_add_mask(d, a, b, m);
>> +    tcg_temp_free(m);
>> +}
>> +
>> +GEN_RVP_R_INLINE(add8, add, 0, trans_add);
>> +
>> +/*
>> + *  Copied from tcg-op-gvec.c.
>> + *
>> + *  Perform a vector subtraction using normal subtraction and a mask.
>> + *  Compare gen_addv_mask above.
>> + */
>> +static void gen_simd_sub_mask(TCGv d, TCGv a, TCGv b, TCGv m)
>> +{
>> +    TCGv t1 = tcg_temp_new();
>> +    TCGv t2 = tcg_temp_new();
>> +    TCGv t3 = tcg_temp_new();
>> +
>> +    tcg_gen_or_tl(t1, a, m);
>> +    tcg_gen_andc_tl(t2, b, m);
>> +    tcg_gen_eqv_tl(t3, a, b);
>> +    tcg_gen_sub_tl(d, t1, t2);
>> +    tcg_gen_and_tl(t3, t3, m);
>> +    tcg_gen_xor_tl(d, d, t3);
>> +
>> +    tcg_temp_free(t1);
>> +    tcg_temp_free(t2);
>> +    tcg_temp_free(t3);
>> +}
>> +
>> +static void tcg_gen_simd_sub8(TCGv d, TCGv a, TCGv b)
>> +{
>> +    TCGv m = tcg_const_tl((target_ulong)dup_const(MO_8, 0x80));
>> +    gen_simd_sub_mask(d, a, b, m);
>> +    tcg_temp_free(m);
>> +}
>> +
>> +GEN_RVP_R_INLINE(sub8, sub, 0, trans_sub);
>> +
>> +GEN_RVP_R_OOL(radd8);
>> +GEN_RVP_R_OOL(uradd8);
>> +GEN_RVP_R_OOL(kadd8);
>> +GEN_RVP_R_OOL(ukadd8);
>> +GEN_RVP_R_OOL(rsub8);
>> +GEN_RVP_R_OOL(ursub8);
>> +GEN_RVP_R_OOL(ksub8);
>> +GEN_RVP_R_OOL(uksub8);
>> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
>> index b84abaaf25..62db072204 100644
>> --- a/target/riscv/packed_helper.c
>> +++ b/target/riscv/packed_helper.c
>> @@ -352,3 +352,76 @@ static inline void do_ukstsa16(CPURISCVState *env, void *vd, void *va,
>>  }
>>
>>  RVPR(ukstsa16, 2, 2);
>> +
>> +/* 8-bit Addition & Subtraction Instructions */
>> +static inline void do_radd8(CPURISCVState *env, void *vd, void *va,
>> +                            void *vb, uint8_t i)
>> +{
>> +    int8_t *d = vd, *a = va, *b = vb;
>> +    d[i] = hadd32(a[i], b[i]);
>> +}
>> +
>> +RVPR(radd8, 1, 1);
>> +
>> +static inline void do_uradd8(CPURISCVState *env, void *vd, void *va,
>> +                                  void *vb, uint8_t i)
>> +{
>> +    uint8_t *d = vd, *a = va, *b = vb;
>> +    d[i] = haddu32(a[i], b[i]);
>> +}
>> +
>> +RVPR(uradd8, 1, 1);
>> +
>> +static inline void do_kadd8(CPURISCVState *env, void *vd, void *va,
>> +                            void *vb, uint8_t i)
>> +{
>> +    int8_t *d = vd, *a = va, *b = vb;
>> +    d[i] = sadd8(env, 0, a[i], b[i]);
>> +}
>> +
>> +RVPR(kadd8, 1, 1);
>> +
>> +static inline void do_ukadd8(CPURISCVState *env, void *vd, void *va,
>> +                             void *vb, uint8_t i)
>> +{
>> +    uint8_t *d = vd, *a = va, *b = vb;
>> +    d[i] = saddu8(env, 0, a[i], b[i]);
>> +}
>> +
>> +RVPR(ukadd8, 1, 1);
>> +
>> +static inline void do_rsub8(CPURISCVState *env, void *vd, void *va,
>> +                            void *vb, uint8_t i)
>> +{
>> +    int8_t *d = vd, *a = va, *b = vb;
>> +    d[i] = hsub32(a[i], b[i]);
>> +}
>> +
>> +RVPR(rsub8, 1, 1);
>> +
>> +static inline void do_ursub8(CPURISCVState *env, void *vd, void *va,
>> +                             void *vb, uint8_t i)
>> +{
>> +    uint8_t *d = vd, *a = va, *b = vb;
>> +    d[i] = hsubu64(a[i], b[i]);
>> +}
>> +
>> +RVPR(ursub8, 1, 1);
>> +
>> +static inline void do_ksub8(CPURISCVState *env, void *vd, void *va,
>> +                            void *vb, uint8_t i)
>> +{
>> +    int8_t *d = vd, *a = va, *b = vb;
>> +    d[i] = ssub8(env, 0, a[i], b[i]);
>> +}
>> +
>> +RVPR(ksub8, 1, 1);
>> +
>> +static inline void do_uksub8(CPURISCVState *env, void *vd, void *va,
>> +                             void *vb, uint8_t i)
>> +{
>> +    uint8_t *d = vd, *a = va, *b = vb;
>> +    d[i] = ssubu8(env, 0, a[i], b[i]);
>> +}
>> +
>> +RVPR(uksub8, 1, 1);
>> --
>> 2.17.1
>>

The naming on some of these helpers is a bit odd, but given that they're 
a mix of the V and P extensions it's probably fine to just leave them 
as-is.  

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>


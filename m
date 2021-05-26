Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llm97-0001Q6-BE
	for mharc-qemu-riscv@gnu.org; Wed, 26 May 2021 01:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1llm93-0001LY-Kd
 for qemu-riscv@nongnu.org; Wed, 26 May 2021 01:31:53 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1llm8z-0001gw-N6
 for qemu-riscv@nongnu.org; Wed, 26 May 2021 01:31:53 -0400
Received: by mail-pj1-x102b.google.com with SMTP id g24so191263pji.4
 for <qemu-riscv@nongnu.org>; Tue, 25 May 2021 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=p2FHG0bKHvBeZNoo5cTSfyVWGdsSG3ltJpFOkbSNRn8=;
 b=k+rU1flWJudrCaT7wyRfWBo8SQUVrQ/8r0QrWIa8tYmfjybAaol1lmwv0me97eudtK
 L1FBvQaI7jmf9JEOZWsRUx58b6L4lz1SDpjmI5a1VlaCRph+Jo87mNFFhDmR8Zohpnuv
 wtVCo+EbElfOk5OREheI9wsWscRHrv9gHzaQJzSaRI1/anR9/3YDeX98UEDVXzPgWyRi
 BXTKNZWnDqq2mtfGPdsrC/gCohuFmX6qwLPCLF7vpf76rxL8dLCtV6BzSOjwYX4m8ONd
 QSuH4yF5zWKBk/wks5G2954PHiVKhh06vd8qDc201hBnpic3xrnU7HVtYWZ45+FR3mRb
 GHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=p2FHG0bKHvBeZNoo5cTSfyVWGdsSG3ltJpFOkbSNRn8=;
 b=FvotDpknqqjUwF2fdVOk9WsR/P5WR7vPCuRw4JMIHxRMJsWF0iTz8gMHVcKTGHa868
 yH16OPLP5MUeDZLUj6iirUn9bPN4Mrvsx1tJ7UYeY4FU2ezM1Djc6p9NQtONJn/nHAgy
 C+c54FRRTRRCMSaR2dU7IzGR7eJ4EYP3DgWPDQXpmw78NRuATsvqwUSYABO7oHGgrS/q
 Yj+ZY8IKM+YeCNyeNzQR4tTallbKMgEEJe9xMu9mRmuk/+WhezDhHQkym1dFuBor5uPa
 sDdR/GpcVUxk1jTmg0LLJUbb6sJbzAw7xrZwfKWHO4B8V1zuC//Y1elmpQ33JZ0o8xvQ
 S9wA==
X-Gm-Message-State: AOAM533rT8uu9XoTJAIuhqMCQZ8mowqzasszUs9PteiyoNUwtu7gao+M
 H6AIlvCrH9lloWq9HhogZ47noTyeypUefQ==
X-Google-Smtp-Source: ABdhPJzzkrUUk1/mj5pL2wAQOwD37RL2PPH6CHv635EWU4jF1pBCKoKaoVSd7EDHAS6p1DtpPK1B0w==
X-Received: by 2002:a17:902:ec84:b029:fc:e490:ffa0 with SMTP id
 x4-20020a170902ec84b02900fce490ffa0mr3886442plg.63.1622007107887; 
 Tue, 25 May 2021 22:31:47 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id mv15sm13764611pjb.25.2021.05.25.22.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 22:31:47 -0700 (PDT)
Date: Tue, 25 May 2021 22:31:47 -0700 (PDT)
X-Google-Original-Date: Tue, 25 May 2021 22:31:43 PDT (-0700)
Subject: Re: [PATCH 08/38] target/riscv: SIMD 16-bit Compare Instructions
In-Reply-To: <mhng-21817afa-4f8d-4096-b64f-6f0b766c6174@palmerdabbelt-glaptop>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 alistair23@gmail.com, zhiwei_liu@c-sky.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhiwei_liu@c-sky.com
Message-ID: <mhng-3ecb3cda-6b88-4cf1-95d9-ab9c28d8c71a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Wed, 26 May 2021 05:31:55 -0000

On Tue, 25 May 2021 22:30:14 PDT (-0700), Palmer Dabbelt wrote:
> On Fri, 12 Feb 2021 07:02:26 PST (-0800), zhiwei_liu@c-sky.com wrote:
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>  target/riscv/helper.h                   |  6 ++++
>>  target/riscv/insn32.decode              |  6 ++++
>>  target/riscv/insn_trans/trans_rvp.c.inc |  7 ++++
>>  target/riscv/packed_helper.c            | 46 +++++++++++++++++++++++++
>>  4 files changed, 65 insertions(+)
>>
>> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
>> index 0ecd4d53f9..f41f9acccc 100644
>> --- a/target/riscv/helper.h
>> +++ b/target/riscv/helper.h
>> @@ -1202,3 +1202,9 @@ DEF_HELPER_3(sll8, tl, env, tl, tl)
>>  DEF_HELPER_3(ksll8, tl, env, tl, tl)
>>  DEF_HELPER_3(kslra8, tl, env, tl, tl)
>>  DEF_HELPER_3(kslra8_u, tl, env, tl, tl)
>> +
>> +DEF_HELPER_3(cmpeq16, tl, env, tl, tl)
>> +DEF_HELPER_3(scmplt16, tl, env, tl, tl)
>> +DEF_HELPER_3(scmple16, tl, env, tl, tl)
>> +DEF_HELPER_3(ucmplt16, tl, env, tl, tl)
>> +DEF_HELPER_3(ucmple16, tl, env, tl, tl)
>> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
>> index cc782fcde5..f3cd508396 100644
>> --- a/target/riscv/insn32.decode
>> +++ b/target/riscv/insn32.decode
>> @@ -669,3 +669,9 @@ ksll8      0110110  ..... ..... 000 ..... 1111111 @r
>>  kslli8     0111110  01... ..... 000 ..... 1111111 @sh3
>>  kslra8     0101111  ..... ..... 000 ..... 1111111 @r
>>  kslra8_u   0110111  ..... ..... 000 ..... 1111111 @r
>> +
>> +cmpeq16    0100110  ..... ..... 000 ..... 1111111 @r
>> +scmplt16   0000110  ..... ..... 000 ..... 1111111 @r
>> +scmple16   0001110  ..... ..... 000 ..... 1111111 @r
>> +ucmplt16   0010110  ..... ..... 000 ..... 1111111 @r
>> +ucmple16   0011110  ..... ..... 000 ..... 1111111 @r
>> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
>> index 12a64849eb..6438dfb776 100644
>> --- a/target/riscv/insn_trans/trans_rvp.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
>> @@ -369,3 +369,10 @@ GEN_RVP_SHIFTI(slli8, sll8, tcg_gen_vec_shl8i_i64);
>>  GEN_RVP_SHIFTI(srai8_u, sra8_u, NULL);
>>  GEN_RVP_SHIFTI(srli8_u, srl8_u, NULL);
>>  GEN_RVP_SHIFTI(kslli8, ksll8, NULL);
>> +
>> +/* SIMD 16-bit Compare Instructions */
>> +GEN_RVP_R_OOL(cmpeq16);
>> +GEN_RVP_R_OOL(scmplt16);
>> +GEN_RVP_R_OOL(scmple16);
>> +GEN_RVP_R_OOL(ucmplt16);
>> +GEN_RVP_R_OOL(ucmple16);
>> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
>> index ab9ebc472b..30b916b5ad 100644
>> --- a/target/riscv/packed_helper.c
>> +++ b/target/riscv/packed_helper.c
>> @@ -631,3 +631,49 @@ static inline void do_kslra8_u(CPURISCVState *env, void *vd, void *va,
>>  }
>>
>>  RVPR(kslra8_u, 1, 1);
>> +
>> +/* SIMD 16-bit Compare Instructions */
>> +static inline void do_cmpeq16(CPURISCVState *env, void *vd, void *va,
>> +                              void *vb, uint8_t i)
>> +{
>> +    uint16_t *d = vd, *a = va, *b = vb;
>> +    d[i] = (a[i] == b[i]) ? 0xffff : 0x0;
>> +}
>> +
>> +RVPR(cmpeq16, 1, 2);
>> +
>> +static inline void do_scmplt16(CPURISCVState *env, void *vd, void *va,
>> +                               void *vb, uint8_t i)
>> +{
>> +    int16_t *d = vd, *a = va, *b = vb;
>> +    d[i] = (a[i] < b[i]) ? 0xffff : 0x0;
>> +}
>> +
>> +RVPR(scmplt16, 1, 2);
>> +
>> +static inline void do_scmple16(CPURISCVState *env, void *vd, void *va,
>> +                               void *vb, uint8_t i)
>> +{
>> +    int16_t *d = vd, *a = va, *b = vb;
>> +    d[i] = (a[i] <= b[i]) ? 0xffff : 0x0;
>> +}
>> +
>> +RVPR(scmple16, 1, 2);
>> +
>> +static inline void do_ucmplt16(CPURISCVState *env, void *vd, void *va,
>> +                               void *vb, uint8_t i)
>> +{
>> +    uint16_t *d = vd, *a = va, *b = vb;
>> +    d[i] = (a[i] < b[i]) ? 0xffff : 0x0;
>> +}
>> +
>> +RVPR(ucmplt16, 1, 2);
>> +
>> +static inline void do_ucmple16(CPURISCVState *env, void *vd, void *va,
>> +                               void *vb, uint8_t i)
>> +{
>> +    uint16_t *d = vd, *a = va, *b = vb;
>> +    d[i] = (a[i] <= b[i]) ? 0xffff : 0x0;
>> +}
>> +
>> +RVPR(ucmple16, 1, 2);
>
> Thanks, this is on for-next.

Oops, got my threads crossed.


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmfqn-0004Z1-7r
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 15:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pmfqc-0004Pk-5W; Wed, 12 Apr 2023 15:09:38 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pmfqY-0007ny-CI; Wed, 12 Apr 2023 15:09:37 -0400
Received: by mail-oi1-x232.google.com with SMTP id bh10so8537510oib.1;
 Wed, 12 Apr 2023 12:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681326572; x=1683918572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uup4pjT3DWh14iVfcf7Y6+aCJk2w1Fcr1LFBt1n3QIM=;
 b=f5Xx9XNiWK4q7y8eWqVJv2JYjM0JZ+xFeO/JlP1MWbqgVw5b0Lm+AJSPFxxjFoP8uw
 HkKGRBMCBtzZtfEmwzWC7Qc5FlCH3dI5qamGu2+jZWBSJKWgpRRZED5kYAhcA6d8DeZI
 H2S0DtnKndiYzu0Q5nCuGfZkysJzvIw1irmw5JKeXcP+fqbQKg7+SwAI2XZO2kZFlbug
 NOPGbHRkBfDidU0JbOVkWSghhhCq1wqMx+xGvYeF0mj/vU7zbk00aErEkjblAefJ84tO
 Sb6LATkDN7B1PAmXfaad56PFoFr6kKX1MVbmU7EwL+5Keczkqe2ADZw03LvPBbEkq/dN
 YCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681326572; x=1683918572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uup4pjT3DWh14iVfcf7Y6+aCJk2w1Fcr1LFBt1n3QIM=;
 b=DZHRxpsLWd28vyzDpl+T4M60tD+Ph9828wxo2wkjJpOeMGf3Myh4wal2SnpZZWFUSp
 NyxyvPt7GRLaFJh1Rh52ZNvhF6Reu91mo3OCNhoFp8j1S+buF0hefSgARUIRHqoDoSOh
 pvHKe5zPfvnPjCil8/OAec3MzHONpFxt1RChYJxTa2gy7g3pc3xmGchBLSMGUyMJBGbA
 HVkCYmnvaDieO5wCKMPdUILNOsr/HUWD06OmHy6ldsKDhu4LFq9f3qhaTnrZB2E2A5sK
 R55JcWBrbV71qDWaNd+qtW0tgOTvUSaLEIhbhILsLwzkrDU2HA/NTKl5B+bKQiG/2n5X
 87oA==
X-Gm-Message-State: AAQBX9ck/Avhm33vPagfizMBVGoT3rDaiIAia2dAazlS0XkOROBSpMIx
 qEcbOAagRz2vHeC04DFDRowZ8Q/6bMI=
X-Google-Smtp-Source: AKy350by6EXrMcA0kOIMz9o7RMnhuLwcsn3u6ckQF2ye3Uo0vX9C8hyHf3qsR/U2d/2hLx8YuDZSiQ==
X-Received: by 2002:aca:1b16:0:b0:38b:f7fd:9c8f with SMTP id
 b22-20020aca1b16000000b0038bf7fd9c8fmr1382378oib.41.1681326572000; 
 Wed, 12 Apr 2023 12:09:32 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 m129-20020acabc87000000b00389898f4c4fsm7005809oif.45.2023.04.12.12.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 12:09:31 -0700 (PDT)
Message-ID: <45714328-7fae-2644-48b9-ce4c2d3240c8@gmail.com>
Date: Wed, 12 Apr 2023 16:09:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 50/54] tcg/ppc: Adjust constraints on qemu_ld/st
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-51-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230411010512.5375-51-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 12 Apr 2023 19:09:42 -0000



On 4/10/23 22:05, Richard Henderson wrote:
> The softmmu tlb uses TCG_REG_{TMP1,TMP2,R0}, not any of the normally
> available registers.  Now that we handle overlap betwen inputs and
> helper arguments, we can allow any allocatable reg.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   tcg/ppc/tcg-target-con-set.h | 11 ++++-------
>   tcg/ppc/tcg-target-con-str.h |  2 --
>   tcg/ppc/tcg-target.c.inc     | 32 ++++++++++----------------------
>   3 files changed, 14 insertions(+), 31 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target-con-set.h b/tcg/ppc/tcg-target-con-set.h
> index a1a345883d..f206b29205 100644
> --- a/tcg/ppc/tcg-target-con-set.h
> +++ b/tcg/ppc/tcg-target-con-set.h
> @@ -12,18 +12,15 @@
>   C_O0_I1(r)
>   C_O0_I2(r, r)
>   C_O0_I2(r, ri)
> -C_O0_I2(S, S)
>   C_O0_I2(v, r)
> -C_O0_I3(S, S, S)
> +C_O0_I3(r, r, r)
>   C_O0_I4(r, r, ri, ri)
> -C_O0_I4(S, S, S, S)
> -C_O1_I1(r, L)
> +C_O0_I4(r, r, r, r)
>   C_O1_I1(r, r)
>   C_O1_I1(v, r)
>   C_O1_I1(v, v)
>   C_O1_I1(v, vr)
>   C_O1_I2(r, 0, rZ)
> -C_O1_I2(r, L, L)
>   C_O1_I2(r, rI, ri)
>   C_O1_I2(r, rI, rT)
>   C_O1_I2(r, r, r)
> @@ -36,7 +33,7 @@ C_O1_I2(v, v, v)
>   C_O1_I3(v, v, v, v)
>   C_O1_I4(r, r, ri, rZ, rZ)
>   C_O1_I4(r, r, r, ri, ri)
> -C_O2_I1(L, L, L)
> -C_O2_I2(L, L, L, L)
> +C_O2_I1(r, r, r)
> +C_O2_I2(r, r, r, r)
>   C_O2_I4(r, r, rI, rZM, r, r)
>   C_O2_I4(r, r, r, r, rI, rZM)
> diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
> index 298ca20d5b..f3bf030bc3 100644
> --- a/tcg/ppc/tcg-target-con-str.h
> +++ b/tcg/ppc/tcg-target-con-str.h
> @@ -14,8 +14,6 @@ REGS('A', 1u << TCG_REG_R3)
>   REGS('B', 1u << TCG_REG_R4)
>   REGS('C', 1u << TCG_REG_R5)
>   REGS('D', 1u << TCG_REG_R6)
> -REGS('L', ALL_QLOAD_REGS)
> -REGS('S', ALL_QSTORE_REGS)
>   
>   /*
>    * Define constraint letters for constants:
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 613cd73583..e94f3131a3 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -93,18 +93,6 @@
>   #define ALL_GENERAL_REGS  0xffffffffu
>   #define ALL_VECTOR_REGS   0xffffffff00000000ull
>   
> -#ifdef CONFIG_SOFTMMU
> -#define ALL_QLOAD_REGS \
> -    (ALL_GENERAL_REGS & \
> -     ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | (1 << TCG_REG_R5)))
> -#define ALL_QSTORE_REGS \
> -    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | \
> -                          (1 << TCG_REG_R5) | (1 << TCG_REG_R6)))
> -#else
> -#define ALL_QLOAD_REGS  (ALL_GENERAL_REGS & ~(1 << TCG_REG_R3))
> -#define ALL_QSTORE_REGS ALL_QLOAD_REGS
> -#endif
> -
>   TCGPowerISA have_isa;
>   static bool have_isel;
>   bool have_altivec;
> @@ -3791,23 +3779,23 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>   
>       case INDEX_op_qemu_ld_i32:
>           return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
> -                ? C_O1_I1(r, L)
> -                : C_O1_I2(r, L, L));
> +                ? C_O1_I1(r, r)
> +                : C_O1_I2(r, r, r));
>   
>       case INDEX_op_qemu_st_i32:
>           return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
> -                ? C_O0_I2(S, S)
> -                : C_O0_I3(S, S, S));
> +                ? C_O0_I2(r, r)
> +                : C_O0_I3(r, r, r));
>   
>       case INDEX_op_qemu_ld_i64:
> -        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
> -                : TARGET_LONG_BITS == 32 ? C_O2_I1(L, L, L)
> -                : C_O2_I2(L, L, L, L));
> +        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
> +                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
> +                : C_O2_I2(r, r, r, r));
>   
>       case INDEX_op_qemu_st_i64:
> -        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(S, S)
> -                : TARGET_LONG_BITS == 32 ? C_O0_I3(S, S, S)
> -                : C_O0_I4(S, S, S, S));
> +        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r)
> +                : TARGET_LONG_BITS == 32 ? C_O0_I3(r, r, r)
> +                : C_O0_I4(r, r, r, r));
>   
>       case INDEX_op_add_vec:
>       case INDEX_op_sub_vec:


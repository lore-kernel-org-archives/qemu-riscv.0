Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BD8C282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:38:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tshpL-0006Js-TQ; Thu, 13 Mar 2025 08:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tshpK-0006JU-BH
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 08:38:18 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tshpH-0002sP-Se
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 08:38:17 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2ff087762bbso1506005a91.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 05:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1741869493; x=1742474293; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bt4zRQBOYHSax/cei+k4mZ/WSu+wxrkNEI8A1aplspU=;
 b=LA1yYD5sk2QAzivRchr2laAxcKsDDRN0MZwJg5mARzWUp75wtbd12343h4DKOiB539
 FOOwlcrxhSscIGIae6S5GCP0Vd9RWpkCROkfzcOJGGitnOccYVtqssWqZ3SPidYvGpJM
 j8DDkEWzUMSuCeNpZOAyotkex8Ub/WE+kcaX4xTPsoEZGmxnPPlxLNK643Fo3PaTkBg2
 iBCNvhwSXlcz5SXbfZ9e/lGp/dVWDgX7xgHSO3ZdKaORiBKm85Q7cQ+IA8KpXrD1177V
 2pLaCsgtj/UCP5iN4Phg9ImHag283hCu+xgj04bzitUTQ3E3KBE5XpQleqt4TV1T2RgK
 0jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741869493; x=1742474293;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bt4zRQBOYHSax/cei+k4mZ/WSu+wxrkNEI8A1aplspU=;
 b=OKjt5Xfn7PgIG0b4TOVkEhRX/bEV54OmRiN8UxgEmvJJznG9LF8MEcIDEeQOPl6P3R
 49ssEJWC6d4/gQa3aoBlZE2io2psOf2HqPzbVsHIfVnGsd4bb/DBbd312EG/SxKo1fR/
 hJjoauBumGpvs+NhSDrbNbz5na0lZjzX58OMg9of/Ju+dgSuzxG8T7m/D7jIrE/UTIRi
 vuie5cX1a/kEriu1gEI6u/KCY7yzTfHh+qxLllxiahb0/D50SxjjqhVhU5oTUI4gwnN5
 LjhMLFmkPZoil8CKjGg1JD8AYAIvT5iFfoeZqKBz2IM8p6S2vp1DcGNMk2bcoTDKAitL
 8Nog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc3l+Atq+7pnQgvRdPJcPeGU3hmgJpD5nE9vKrqiD0xy8XftadUeCaaA6/kUm5pyBTpdxZKbxA5LHt@nongnu.org
X-Gm-Message-State: AOJu0YzxewnTfCbLLG+ocIa+IVEZjC2t67ChNR20q8HxRb3cLgKcSnDa
 WwF58RUrIOpz90On9HZEdIrEImyGrkbupYvLtW3htDa8rXzpnYby5YGMEUfepQ0=
X-Gm-Gg: ASbGncvX6t5usoHeyTPMnozLa72T2XC5dmp3P0pa9Dy26j9ncJItn/RbSGBOHtX6YOF
 S/aOO2x7bJkHlU8bA27/Jvmoc5ShxzEni31dta3z+dvtIB2RabBZAu2tBVpkzWoWhqeqvuwW+VD
 WSvkDiYgYvolD/hYM6tmEVqqF9ZYmiMkcpDKLha50/f7NVdfxo7o7c+e4INB+IKgXR15KUIokJ5
 6UbNZgaJwcq8tsVfZjfdHMq3+S34nvTBTfHkmI+WL0UrWoEuBCRF7JMhWjaO40SyLy4vqnGqd/t
 Dv/2Eskp7ooUPzwHU96lrsTTyHX4dCzH9QchOPOGFwtnJ6AmXZ3xFPPnJzE=
X-Google-Smtp-Source: AGHT+IEF4eUalHT6nffszNuhAjnWCNNoONl1J2H1VHaxg6T0KJUcji1SE9KlnWY53nzFqwLBG4ACTw==
X-Received: by 2002:a17:90b:4c48:b0:2ea:a9ac:eee1 with SMTP id
 98e67ed59e1d1-300ff0d49damr15551960a91.10.1741869493007; 
 Thu, 13 Mar 2025 05:38:13 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.117.79])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30138b5d279sm1235975a91.26.2025.03.13.05.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 05:38:12 -0700 (PDT)
Message-ID: <871134bb-9627-4403-80c0-ede30216e978@ventanamicro.com>
Date: Thu, 13 Mar 2025 09:38:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] target/riscv: pmp: move Smepmp operation conversion
 into a function
To: =?UTF-8?Q?Lo=C3=AFc_Lefort?= <loic@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250225160052.39564-1-loic@rivosinc.com>
 <20250225160052.39564-3-loic@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250225160052.39564-3-loic@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 2/25/25 1:00 PM, Loïc Lefort wrote:
> Signed-off-by: Loïc Lefort <loic@rivosinc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/pmp.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index ddb7e0d23c..b7f1430ff8 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -31,6 +31,15 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
>                             uint8_t val);
>   static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
>   
> +/*
> + * Convert the PMP permissions to match the truth table in the Smepmp spec.
> + */
> +static inline uint8_t pmp_get_smepmp_operation(uint8_t cfg)
> +{
> +    return ((cfg & PMP_LOCK) >> 4) | ((cfg & PMP_READ) << 2) |
> +           (cfg & PMP_WRITE) | ((cfg & PMP_EXEC) >> 2);
> +}
> +
>   /*
>    * Accessor method to extract address matching type 'a field' from cfg reg
>    */
> @@ -357,16 +366,6 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
>           const uint8_t a_field =
>               pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
>   
> -        /*
> -         * Convert the PMP permissions to match the truth table in the
> -         * Smepmp spec.
> -         */
> -        const uint8_t smepmp_operation =
> -            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
> -            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
> -            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> -            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
> -
>           if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
>               /*
>                * If the PMP entry is not off and the address is in range,
> @@ -385,6 +384,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
>                   /*
>                    * If mseccfg.MML Bit set, do the enhanced pmp priv check
>                    */
> +                const uint8_t smepmp_operation =
> +                    pmp_get_smepmp_operation(env->pmp_state.pmp[i].cfg_reg);
> +
>                   if (mode == PRV_M) {
>                       switch (smepmp_operation) {
>                       case 0:



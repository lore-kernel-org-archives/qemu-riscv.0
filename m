Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BE5C369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 22:45:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8RXa-0004o8-2w; Fri, 25 Apr 2025 18:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8RXP-0004Z1-J1
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:28:53 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8RXN-0005HR-RH
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:28:51 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39ee5ac4321so2712289f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 15:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745620128; x=1746224928; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9K2adlDERUKAGQusZJV0eZ+4nBvLz6xU1dC/kv9W3+8=;
 b=Op5JyjHFAQgnYsDN7843aFLVMo9UQN1KxE8UQJzpcmh63HePVoMBz64YpqP88LqyQy
 WK1kF5An3XL1Icyz9cHX2anQGhMdeJp1ERZBiRcrf3WFBl2ehsGzuw6kQNFFp+ygcg7H
 gcctM7EygxikoQOhyS61jRTT8daoFO2EHi370Ya3/sOm2LkauupdH2ZdLWEMPkz/zs6Y
 lPjaA/UlKS5qERgauTb/3d8eq/h/KBKMC9y9NcxdkLIenLuyA1rQPYtlVM0jzJaO2vbU
 yxVl3HgNpy06h6ytBluka6oPzOLatlrFZUbxWJa2L15zoR8SDerduZWDoV5S9FHebzyh
 IBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745620128; x=1746224928;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9K2adlDERUKAGQusZJV0eZ+4nBvLz6xU1dC/kv9W3+8=;
 b=TYywEYjJA/dfYNqxzH2n7C1i77Bax/Nd6I9Mew6/fFedlm5OC3BUmuowbq6/TgTKWc
 nYPf7Twp2Rl3ilmM8jaJkrACXaVE7O+mK22Cr7CmYVcHV60CKPB721lahWHeU+HwDKAe
 B+F1xT8XfEA1sGmGhXLxw8F3G4xZClhzNfKQaKyXFsSvcK5Wbo1upk1XChIYI1XOlKJP
 t85Z5UkKueFJpLOFFd2FRVqqR67qJyrxoNOtgdSHAQhAyA+DBg8juHup4PC2v1BrMt6u
 a7eLbPJY4RRllB5ZULMsW+rNMmBReYRl1mdmLKU3Xb7o/Q5Yi+3rAtFARQR1GjWdVfR9
 vY4g==
X-Gm-Message-State: AOJu0Yxc+ztxqxgMOQQoxJG9gfqiyuja6k4u/kggH3LPFXK36GgChXGJ
 xp/wO4D01NGmo5S4pUqlJl/Qn+IPqXojImii4hsinzp5NU2U3M1tsIIqhdjCBaM=
X-Gm-Gg: ASbGncvZez6jKgb6LzWd3ubOTUvmaa9KENlpn/NOMTSbVA9SYhPOJHnOYeSOTMy8IYp
 4JHMTL1ciskbTnhdYSkPPRQO+ogywTXZdeYqQyY4zdrQJxHi0zGZpxbfX0u+QK1MI+QIOttJ1Lr
 +nrDcrClMMoNvlLF5gnBcbNaDEAoOAEVmFMxRC9aX+iq0vyTR4Jv/9CcYmnZdqJhLBTEKE2Imfb
 Wpofnizkvt+/MIN0OMoSa2sa2JYas5uurCBb7VYAfCsjF5CyYJdBnI0GjYgQl4J/UKY32OXibIp
 yn4FybhPwg467+rEbikd2IgHTBdI8KdX7z+XvBtpliZzzRLZgT0dr4zX2IWB6G1VoBWRpIyOhbB
 X1oRnOzXH
X-Google-Smtp-Source: AGHT+IHUJknV4Da3OUOLrrhpzlSCOsZ9tfeizxbaArg6FSLBJXujPAek2/IG/4mh31a5IEcGHULw+A==
X-Received: by 2002:a05:6000:18a2:b0:391:3d12:9afa with SMTP id
 ffacd0b85a97d-3a074e2f0a0mr3135119f8f.21.1745620127876; 
 Fri, 25 Apr 2025 15:28:47 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8d67esm3611709f8f.17.2025.04.25.15.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 15:28:46 -0700 (PDT)
Message-ID: <14432b9f-d1a9-444c-9372-90541cf1de04@linaro.org>
Date: Sat, 26 Apr 2025 00:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] target/riscv: Pass ra to riscv_csr_write_fn
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, dbarboza@ventanamicro.com
References: <20250425152311.804338-1-richard.henderson@linaro.org>
 <20250425152311.804338-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250425152311.804338-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 25/4/25 17:23, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/cpu.h |   3 +-
>   target/riscv/csr.c | 226 +++++++++++++++++++++++----------------------
>   2 files changed, 118 insertions(+), 111 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 167909c89b..4d41a66d72 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -841,7 +841,8 @@ typedef RISCVException (*riscv_csr_predicate_fn)(CPURISCVState *env,
>   typedef RISCVException (*riscv_csr_read_fn)(CPURISCVState *env, int csrno,
>                                               target_ulong *ret_value);
>   typedef RISCVException (*riscv_csr_write_fn)(CPURISCVState *env, int csrno,
> -                                             target_ulong new_value);
> +                                             target_ulong new_value,
> +                                             uintptr_t ra);
>   typedef RISCVException (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
>                                             target_ulong *ret_value,
>                                             target_ulong new_value,
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index c52c87faae..6f1f69eba6 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -830,13 +830,15 @@ static RISCVException seed(CPURISCVState *env, int csrno)
>   }
>   
>   /* zicfiss CSR_SSP read and write */
> -static int read_ssp(CPURISCVState *env, int csrno, target_ulong *val)
> +static RISCVException read_ssp(CPURISCVState *env, int csrno,
> +                               target_ulong *val)
>   {
>       *val = env->ssp;
>       return RISCV_EXCP_NONE;
>   }
>   
> -static int write_ssp(CPURISCVState *env, int csrno, target_ulong val)
> +static RISCVException write_ssp(CPURISCVState *env, int csrno,
> +                                target_ulong val, uintptr_t ra)

I like the RISCVException type correction.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



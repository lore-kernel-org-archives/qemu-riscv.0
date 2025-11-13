Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54CBCD5BC2
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 10:57:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vJV0y-0006QD-9R; Thu, 13 Nov 2025 05:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vJUyE-0003PD-MN
 for qemu-riscv@nongnu.org; Thu, 13 Nov 2025 05:54:31 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vJUyC-0002fI-SI
 for qemu-riscv@nongnu.org; Thu, 13 Nov 2025 05:54:30 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42b32900c8bso397351f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Nov 2025 02:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763031266; x=1763636066; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c60PujkVLQPQGwYj0ljUmIvgnvt/g65UJr1SOWD57x4=;
 b=DkKRlhKqjMBjh9WDt1iVZ22qa8f/EvNHfrPTUGGsahMDC/6Jka9C6dV+M6B8zwHSi/
 NqcPojCDGfTzpzWiqMEGkymcBNVWFTzWbgmZ6NErndQojMasb6glLHwb7dLP8sCQsRmA
 +AGMWC+kyO4sIQwtXArKHJnnzLYXNYOmDG7Ugtw0Mcs5z2NJbUhtPDPZ826wa6a7WzAE
 pXoEdEHQ/fabBWplXolSjm6N/e8OS57o+VG0ilMBjoy1WetRSorMbMHWJyWjxAdFK++H
 ytlc01MQgxy4mDntYJuCoqYtrcuobhbGmNBrrKIaZSxdcccy5khrWoz+uDVtl0e6Cyoy
 6/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763031266; x=1763636066;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c60PujkVLQPQGwYj0ljUmIvgnvt/g65UJr1SOWD57x4=;
 b=bSe75DWNOyabFDeC67uEheeUaB+I/178O9tbXTcO9SAlXFL5kjq5Zt3D4C3Zvv/o4O
 8jUWSOaUQsmx08aD1UhNzyKXLAfzIHUsaFyhawxQJUW/pf6HLe4PiUz1v5C0u1jZos7d
 vAFnu3sB60btrvjgIlb3MNfj7y9Xe/6fhVP2CxnLp2MRC0rdkjOQ3FidDedYQtj8iqih
 GA+Fu1FQKeoR0mLZrSPFrZm3186XD1Fw5Lbb1kxh5LIXX5y0VJzujfX36WU5/DwoH5V6
 ite254sGehjIa6FVT7/Vz19kR0msQ/gvWHnf3F5rMYoextr2ZWPsE/h4RFkdRqLiZ75E
 evng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVnZCDKVL0ehXpYUt6nOevd+euWWZDae8SDqKyV21SVTpCC9N3YFvECipc/6i8jWTkPm0IlQ1uappj@nongnu.org
X-Gm-Message-State: AOJu0Yw++UcQ+IOu6gZIhQZx9EzW6BAUscn3lchJafVJIMso1Vof6dEq
 szeXa6mZVJkkaeFpX+8Kbu77L/buRjXKz/aQwBQ0z2HJSLiXhPDXcEs2/oKJjOdufGg=
X-Gm-Gg: ASbGncsugzPzVvP3adDOg+dtaZ2/DkC1NWY5j4yYdboOPHFgDRfZrsRB3TPJ48K8zoc
 1hUiQWytq/BmQ1QrOB7Sjmrs01BIdjfMjTX4yPQkmz0epJQVCJJ/0DD2nPvuLUyttLul1G/S4oG
 eU+ZB9vhtnqJQCB6ue6mxNPC/BVLKfHNTBQDjfAHIxUNpKzojrGQEMm5h5yv27KyROt9YivcJbc
 1fVeP3mXsklcIoopoFQRWG1K8uRYVcPqLBRHZDRwb3VVyMkVgXdH4uBOGvOQWdtYx+1DymYeMeR
 qkt+92Z+lZ8CPpZ1XAmP201udyo6Krem/Wf5CwQuVv4i7OpNHebY3e7b96rszQegqeGnwzZxiyi
 plZmrV17syNqAqyD8rEIsiv06etRNw516+frYsTWahmfoTL6ksbqGs4VwhYQ2zXV7zfTy2BvDrN
 zMjPcYGecCAmZwZFPRuEWBcT7ibwKBlEnJgwD38vkWN0UGegWAUl9bLHw=
X-Google-Smtp-Source: AGHT+IFO6dVamTSftIGMw8NDdoX8EshnLT40t63u/6g2L0kwN6lwtUoXX0BUsk6XLVzRIgac1qpFDg==
X-Received: by 2002:a05:6000:61e:b0:42b:3ee9:4772 with SMTP id
 ffacd0b85a97d-42b4bdb6744mr5637032f8f.52.1763031266147; 
 Thu, 13 Nov 2025 02:54:26 -0800 (PST)
Received: from [192.168.8.105] (90.red-2-142-37.dynamicip.rima-tde.net.
 [2.142.37.90]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b513sm3229607f8f.30.2025.11.13.02.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 02:54:25 -0800 (PST)
Message-ID: <ad83714b-ee19-4c0b-a230-2fd078a7dece@linaro.org>
Date: Thu, 13 Nov 2025 11:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Add RISCV Zilsd extension
To: Roan Richmond <roan.richmond@codethink.co.uk>, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 qemu-devel@nongnu.org, alistair23@gmail.com
References: <20251110090510.84103-1-roan.richmond@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251110090510.84103-1-roan.richmond@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/10/25 10:05, Roan Richmond wrote:
> +/* Zilsd extension adds load/store double for 32bit arch */
> +static bool gen_store_zilsd(DisasContext *ctx, arg_sb *a)
> +{
> +    TCGv data_1 = tcg_temp_new();
> +    TCGv data_2 = tcg_temp_new();
> +    if (a->rs2 != 0) {
> +        data_1 = get_gpr(ctx, a->rs2, EXT_NONE);
> +        data_2 = get_gpr(ctx, a->rs2+1, EXT_NONE);
> +    }
> +    TCGv addr_1 = get_address(ctx, a->rs1, a->imm);
> +    TCGv addr_2 = get_address(ctx, a->rs1, a->imm+4);
> +
> +    if (ctx->ztso) {
> +        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> +    }
> +
> +    tcg_gen_qemu_st_tl(data_1, addr_1, ctx->mem_idx, MO_SL);
> +    tcg_gen_qemu_st_tl(data_2, addr_2, ctx->mem_idx, MO_SL);

This is wrong, because if rs2 == 0, then data_1 and data_2 are uninitialized.  If you're 
testing properly with --enable-debug-tcg, this should trigger an assertion failure.

You wanted

     if (a->rs2 == 0) {
         data_1 = tcg_constant_tl(0);
         data_2 = data_1;
     } else {
         data_1 = get_gpr(ctx, a->rs2, EXT_NONE);
         data_2 = get_gpr(ctx, a->rs2 + 1, EXT_NONE);
     }

You're also missing the endianness indicator: mo_endian().

You really should consider combining the two halves so that you can perform one 64-bit 
store.  While I see that the spec allows the store to be non-atomic, you still probably do 
not want to to allow the first half store to succeed when the second half store faults.  I 
don't see clear language about that.  Anyway, that's as simple as

     TCGv_i64 data;
     MemOp end = mo_endian(ctx);

     if (a->rs2 == 0) {
         data = tcg_constant_i64(0);
     } else {
         TCGv data_1 = get_gpr(ctx, a->rs2, EXT_NONE);
         TCGv data_2 = get_gpr(ctx, a->rs2 + 1, EXT_NONE);
         data = tcg_temp_new_i64();
         if (end == MO_LE) {
             tcg_gen_concat_tl_i64(data, data_1, data_2);
         } else {
             tcg_gen_concat_tl_i64(data, data_2, data_1);
         }
     }
     tcg_gen_qemu_st_i64(data, addr, ctx->mem_idx, MO_UQ | end);


r~


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC6CC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:19:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGIx6-00042L-Qx; Thu, 21 Dec 2023 08:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGIx5-00041p-0b
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 08:19:03 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGIx3-0004OG-Cm
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 08:19:02 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6d4bef65786so704096b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 05:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703164740; x=1703769540; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ssgfRWEPIxyOkJJoLF7QLEWKq8Y1fj4j3uJ1EDL2RQ=;
 b=Lo2KwaypqPt8Wa+syzmPCkAZKgE1i4vFWzFWgUgYHmv+wgMN8WYJrpucaTVtzJzk76
 ksZh1O88Ge8WTF0tOEzkZiD5xOPoQDc4OJfm72CN9U3l4MwWZycYODXFmWdTIYEI4v57
 eRQt+lxlXcdvLKgD/eHsnJ3p/zCjO/6YuTxM2ZUKYioXraKvwZd4R1p0t+IC6ny8TZY+
 iEw1B6M3zBc4Lv7V6l0H6phWSsJkSSJn23t5yHHxLPDhXifxpejg5CEd2Lq6gzZCRMKs
 1EpRBR7MO86QJqZ6RqmPBPTxCtnPjRNEYAAaMcat8FQzIr2RZOZT4j8rl7PDO0TdA7Zl
 uD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703164740; x=1703769540;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ssgfRWEPIxyOkJJoLF7QLEWKq8Y1fj4j3uJ1EDL2RQ=;
 b=FstBM3Sm5N/HZL9zY680KGYOKj1EX6H0dgEZ7UwtsdC3QwP0vh3GXld13caW7YHaev
 /D4zSePfyEljDTUSm28ZlmqrkgLiAxp9Wkif2s1tTXW4IIGywB/6nnH49cbuD7CDTtwW
 fb4FpLlLzcQpHwGAw9fjK5WjTlBJn21EYGGY692VpPg83CabnrKLb+REXZ3HybTQ7rCV
 Vq3dxUnOAa46tlY3t0tZ4G1HW1qRGDHfcnQN9guiF6N8tAgQaOzozlkUiWlje5jcnc5O
 klrO9HWVKIk0Ip3oR/OjCi86x1p2/eY6kKJL+K7GWt4XPlPjAjkMrJT7YY2YV3ymbPGN
 eeKA==
X-Gm-Message-State: AOJu0Yx1skJC57/Z+uTMFI2iZvgaNyvlDFv841ZqjP/PXrJ0nbWetmoc
 sczPn5Wa1xjk03c1AF35mpqo9CKIF8m962NmBl7SGg==
X-Google-Smtp-Source: AGHT+IGpcpH9bjP96PdRWK1AbZwUSkJ57wVrQZTtRLB0IjfrSy2XeX+iSYmM1dEspeRLCQpmZ+6mkw==
X-Received: by 2002:a05:6a20:1528:b0:194:ae7b:3847 with SMTP id
 n40-20020a056a20152800b00194ae7b3847mr1146109pzi.34.1703164739873; 
 Thu, 21 Dec 2023 05:18:59 -0800 (PST)
Received: from [192.168.68.110] ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 fb22-20020a056a002d9600b006ce50876c37sm1542629pfb.100.2023.12.21.05.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 05:18:59 -0800 (PST)
Message-ID: <bc309588-6f70-4843-bfcd-7f1ca0784d55@ventanamicro.com>
Date: Thu, 21 Dec 2023 10:18:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] target/riscv: FIX xATP_MODE validation
Content-Language: en-US
To: Irina Ryapolova <irina.ryapolova@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20231212110305.45443-1-irina.ryapolova@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231212110305.45443-1-irina.ryapolova@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi,

On 12/12/23 08:03, Irina Ryapolova wrote:
> [Changes since v1]
> used satp_mode.map instead of satp_mode.supported
> 
> [Original cover]
> The SATP register is an SXLEN-bit read/write WARL register. It means that CSR fields are only defined
> for a subset of bit encodings, but allow any value to be written while guaranteeing to return a legal
> value whenever read (See riscv-privileged-20211203, SATP CSR).
> 
> For example on rv64 we are trying to write to SATP CSR val = 0x1000000000000000 (SATP_MODE = 1 - Reserved for standard use)
> and after that we are trying to read SATP_CSR. We read from the SATP CSR value = 0x1000000000000000, which is not a correct
> operation (return illegal value).
> 
> Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/csr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1a53..735fb27be7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1278,8 +1278,8 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>   
>   static bool validate_vm(CPURISCVState *env, target_ulong vm)
>   {
> -    return (vm & 0xf) <=
> -           satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
> +    uint64_t mode_supported = riscv_cpu_cfg(env)->satp_mode.map;
> +    return get_field(mode_supported, (1 << vm));
>   }
>   
>   static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,


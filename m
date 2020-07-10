Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtwpG-0007IK-RK
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 13:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtwpE-0007Dw-Oo
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:28:40 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:34258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtwp8-0006lE-0U
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:28:40 -0400
Received: by mail-pj1-x1041.google.com with SMTP id cv18so4731301pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 10:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iqNLFpP6KUyrc5tyIbpCb/TXFVDQR8Mx3rkLviBHfbI=;
 b=wWOvmgZf8TiQi+xST8ykq28skl1D3gT8r+4dP99LSJrovJHbsaDLfmtwRuO2CneQsQ
 TMybQbz6KlQF7KY9CVSU29opLOGN9JdI0o7HjZeQq8aA7OuV259FMT2gBGGmCzGS/9yQ
 LyIFBVRhQgxhTEaGNw3R3OC1LaA481V0CidRZouzCW1mAc6/AcD2QC28Ag0geEyZYM5w
 W1UcjzJpikqhIy8yJuD/7VNUEObU51q7bitZe8MV4ombCEyV3hiasJhpbe8XWbLVYT33
 CyOMWIwjGQ21mfP6wP/TTE22X0JXdP2c0d/Hb53PaIdS5qmSdseBoyT1z6Fv6IcsGth4
 fP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iqNLFpP6KUyrc5tyIbpCb/TXFVDQR8Mx3rkLviBHfbI=;
 b=uPj+Ctlh8NMYqJOlbyLV6ngmNjFraHh3w5foyiZFABn6YG4k8WcM42qT+cd9Ac+d5M
 JKtUhD24GnMNQU4hKrJy24ZdmUlvYx/OYXLTfPbJi56kzGBK/n82yp3LuvhlIJtQrqDC
 n80Edk34uWg0Le5w6FtIMLrFYemMAVAvs/MuOA5u4ro1uVVmFaOazA9qm638vUa6Y+VY
 fhwtyQsJsvwKgCYXlfTD1qJNFC1psMUGzAm9A3wiub+FMetu3VyoaFXylCHtFqjrl4gB
 EeRNuOTL5TCD3gnIXXNE4pEWqb6AfTOkZwsFGfkS1YCXZ7deAVTSzKWxDRXGdxqrEz+X
 0zHg==
X-Gm-Message-State: AOAM532yMd/vQ73emEEU4Pqt8eYKqf2Novgy4xCw7qdVXYkMGhmlXAJ8
 cTRW01e8llQ0GE+cdw+e9LkjZTu5FXI=
X-Google-Smtp-Source: ABdhPJxspcPfHJ/8hn/s70vrxVpTvFLBm+ujlQABMl0Rvuv2J6nYUZa9zt1RfKWZiVuFoZ07X9k1gQ==
X-Received: by 2002:a17:902:6b87:: with SMTP id
 p7mr55323783plk.275.1594402112594; 
 Fri, 10 Jul 2020 10:28:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id c139sm6470541pfb.65.2020.07.10.10.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 10:28:31 -0700 (PDT)
Subject: Re: [RFC 08/65] target/riscv: rvv-0.9: update mstatus_vs by tb_flags
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-9-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af51b2ed-e27e-452e-6488-81d42148ad22@linaro.org>
Date: Fri, 10 Jul 2020 10:28:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-9-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Jul 2020 17:28:41 -0000

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.h       | 2 ++
>  target/riscv/translate.c | 1 +
>  2 files changed, 3 insertions(+)

This belongs with the second half of the previous patch, the translate portion.


r~

> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0cf3fe9456..c02690ed0d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -361,6 +361,7 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>  
>  #define TB_FLAGS_MMU_MASK   3
>  #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
> +#define TB_FLAGS_MSTATUS_VS MSTATUS_VS
>  
>  typedef CPURISCVState CPUArchState;
>  typedef RISCVCPU ArchCPU;
> @@ -411,6 +412,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>  
>  #ifdef CONFIG_USER_ONLY
>      flags |= TB_FLAGS_MSTATUS_FS;
> +    flags |= TB_FLAGS_MSTATUS_VS;
>  #else
>      flags |= cpu_mmu_index(env, 0);
>      if (riscv_cpu_fp_enabled(env)) {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index a806e33301..02b4204584 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -796,6 +796,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->pc_succ_insn = ctx->base.pc_first;
>      ctx->mem_idx = tb_flags & TB_FLAGS_MMU_MASK;
>      ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
> +    ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
>      ctx->priv_ver = env->priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
>      if (riscv_has_ext(env, RVH)) {
> 



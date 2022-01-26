Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCWwZ-0008Qu-Ry
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jan 2022 20:17:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCWwT-0008Mo-EU
 for qemu-riscv@nongnu.org; Tue, 25 Jan 2022 20:17:46 -0500
Received: from [2607:f8b0:4864:20::1033] (port=52959
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCWwQ-0007yQ-KP
 for qemu-riscv@nongnu.org; Tue, 25 Jan 2022 20:17:45 -0500
Received: by mail-pj1-x1033.google.com with SMTP id o64so21771088pjo.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Jan 2022 17:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ihsHOZ2FBQzlNIvnQDEEc9XCiMkpxQQQXrLkOHwsHnc=;
 b=ecU35o6iNYiOSwougDP7Sn7GP8yF+LgiyFTYlOTuvZaQz0ouM/tzDKMnX331904aov
 L6rXr06ic7IJZbF/sPp/qysRbFVYN4NMSXCrXsDtriqi0R2kPwG0kclRdFp9YQSWAjfv
 Mgbu3HJf+w8eIpjrGNkBhily8UfbckbFSDT1kyggkyHSkZMFXaFXeZlD1fMlkqCFOUIy
 32c+Ko3T+xDw4QFK9kxu/hZUPb1Hdq3wuUdEhBNI5BN8HsezP4VagFA+1VBav1aQCXYV
 PsVKTasgiI0reV4HETnfY29rhj+2ZN9OyjPQKHn5JdflKOYtIENjUsmyyxLrDAxezUP4
 VGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ihsHOZ2FBQzlNIvnQDEEc9XCiMkpxQQQXrLkOHwsHnc=;
 b=wXU3h/2kBGXmh6n6Iqzt33k1GUEQILV33Z8+4wj+NHT+AioVPApedMzApIQSuenoLv
 kuvTiWf8Ep1LCH7F30Rx+eO6jNzePlz9S7vn9VRPTYmoU0u5fvEQIdPu5d88qjWPF4F3
 u5Qz+1UoNv8Svd/N5tIooqcWZsF2e8Rc3E5e3nft5grnGAnMvJrXHtn23xtk3HYomyfW
 nBuSgPjJMLpjvspOIxShjjtfrkvsu5DDqYKUqFsyisAd8/lvgYNI/fnjOk9xir9xHKLd
 aQ9pGIojP4yKHl+nV0nYyPYgTvTLr0GtMZb9rDAgDS34wsGLItLQSXCJdOy6Z2guSecv
 LZBA==
X-Gm-Message-State: AOAM533tC+N+c1kbqoTIFSK14gtBz9fGu2T5SFDOybnUMXWFf8PnBcbK
 KzX2a0NDXs7vCDvGnYMbcOFGmw==
X-Google-Smtp-Source: ABdhPJzVgudiIK9mFi5Iy5YN37azX1D/UgfQSz266lS+MJsv+iRyxGIxor8baIaJJ6GRkg+bIHOMEg==
X-Received: by 2002:a17:90b:3803:: with SMTP id
 mq3mr6198326pjb.103.1643159860607; 
 Tue, 25 Jan 2022 17:17:40 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id u18sm218699pfi.185.2022.01.25.17.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 17:17:40 -0800 (PST)
Subject: Re: [PATCH v2] target/riscv: Enable bitmanip Zicbo[m,z,p] instructions
To: Christoph Muellner <cmuellner@linux.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20220124140023.1165850-1-cmuellner@linux.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <437cfc65-bf60-2524-387e-cca2f8aff4c6@linaro.org>
Date: Wed, 26 Jan 2022 12:17:33 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220124140023.1165850-1-cmuellner@linux.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 26 Jan 2022 01:17:47 -0000

On 1/25/22 1:00 AM, Christoph Muellner wrote:
> -ori      ............     ..... 110 ..... 0010011 @i
> +{
> +  [
> +    # *** RV32 Zicbop Sandard Extension (hints in the ori-space) ***
> +    prefetch_i  ....... 00000 ..... 110 00000 0010011 @cbo_pref
> +    prefetch_r  ....... 00001 ..... 110 00000 0010011 @cbo_pref
> +    prefetch_w  ....... 00011 ..... 110 00000 0010011 @cbo_pref
> +  ]
> +
> +  # *** RV32I ori ***
> +  ori      ............     ..... 110 ..... 0010011 @i
> +}

Hmm.  I would simply add a comment about these, without changing any code.  They are 
implemented as nops, so there's no point in the decode distinguishing these from the 
"normal" nop that ori r0, rx, y will (not) generate.

> +static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
> +{
> +    REQUIRE_ZICBOM(ctx);
> +    gen_helper_cbo_clean(cpu_env, cpu_gpr[a->rs1]);
> +    return true;
> +}
> +
> +static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)
> +{
> +    REQUIRE_ZICBOM(ctx);
> +    gen_helper_cbo_clean(cpu_env, cpu_gpr[a->rs1]);
> +    return true;
> +}

Clean and flush are the same thing?

> +/* helper_zicbo_envcfg
> + *
> + * Raise virtual exceptions and illegal instruction exceptions for
> + * Zicbo[mz] instructions based on the settings of [mhs]envcfg.
> + */
> +static void helper_zicbo_envcfg(CPURISCVState *env, target_ulong envbits)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    target_ulong ra = GETPC();

GETPC may only be called from the outermost helper function (the one directly invoked from 
tcg generated code).  This will not unwind the cpu state correctly.

> +static void helper_zicbom_access(CPURISCVState *env, target_ulong address)
> +{
> +    void* phost;
> +    int ret = TLB_INVALID_MASK;
> +    MMUAccessType access_type = MMU_DATA_LOAD;
> +    target_ulong ra = GETPC();

Likewise.

> +    address &= ~(RISCV_CPU(env)->cfg.cbolen - 1);

RISCV_CPU is to be applied to CPUState, not CPUArchState.  You've dereferenced the wrong 
pointer.  You want env_archcpu() instead.  Pull that out to a local variable for clarity 
and do not...

> +    /* Zeroize the block */
> +    memset(mem, 0, RISCV_CPU(env)->cfg.cbolen);

... call it twice.  Also, s/zeroize/zero/.


r~


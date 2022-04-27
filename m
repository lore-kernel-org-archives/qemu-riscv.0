Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njVwe-0001Yi-Gf
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 20:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVwb-0001WO-QM
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 20:54:13 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVwa-00086T-9n
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 20:54:13 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c23so301964plo.0
 for <qemu-riscv@nongnu.org>; Tue, 26 Apr 2022 17:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hyUpmLWsPX1cPAUPwwp1C6TOAM3m2nM+ls+59LzzIvk=;
 b=gLx6qBxcsseahqrdgHi+kDR8lDqbpJuwe38FIxZSyYffKgcv/KWKjIjij+YQRWVVX4
 WAhslTIB7vQ+3B9/z3Mt0P0HhdH8PYZijLU/IGwUVMvsZ4LRnzGaDiYvbyD4LjS0pOvG
 IVahjFEJzCd025v1RpADRJojP1g7Hkso6YPNlTJgMqN4DL6vaPydw8+A98ycl51zRA2e
 t3YXnCZfV7WS1JCiBh7X4kFLrW48Yo8TkTsbAKfjgqpz5rVu4micNIetsslH9Xq8sVGm
 Ycs7ricsyYq4BEcCD/41Afj+M7xB0bVKF5YBlxvwPwU6Y8XuclxNr1MVzI8ozr9xzUWK
 tGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hyUpmLWsPX1cPAUPwwp1C6TOAM3m2nM+ls+59LzzIvk=;
 b=tzliAFsnBmiCV7T+rqAb32KihTyQRdDQzULgFM7lxNzhbdqJXUeKeqq81Yr9HhnBy6
 4HNmsnkEpRpRRueVPmv0GfBdG8MmsOd16VRq5g/dnF2JwYBN2Xxq7U1JL6Tgoxz3smJd
 mNn/DgbN7uhmNncwa69YCempTTD81TGvqyDVYf3L+y7fOI+0+8YFrgnqUF7dNWrNvLI/
 EwkjMseXZNjTVC+8/2E6/+mhvvVz5HMXlGzbz7OApwn7zUst5g4SJ3cperHY7KFKTTfB
 dLp5FGiBnZwk2SvfuABN9Vttt4w6ZwaTc9fN4RIWGnG5y6Mlu+350gq3gsZLSHGxkzdx
 TadA==
X-Gm-Message-State: AOAM530ILCFrED8t4zXl5C4NPr7TFyFIU7KOFOm43PbVCcoaZ35Xp2n+
 rcMKyulj42rPGMx6NPKRzVBqKg==
X-Google-Smtp-Source: ABdhPJwXyW/wz6oVCkJTRFDjc73hSxO6OJgrAfAiaOPHwnc4iiFaXn4nqNzaO3hYkLP/Ntb+GvGncg==
X-Received: by 2002:a17:90b:4a48:b0:1da:1fb3:2f65 with SMTP id
 lb8-20020a17090b4a4800b001da1fb32f65mr3198087pjb.168.1651020850808; 
 Tue, 26 Apr 2022 17:54:10 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a17090a4e8200b001d26f134e43sm157876pjh.51.2022.04.26.17.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:54:10 -0700 (PDT)
Message-ID: <3e7f40ec-14e7-fb7f-a796-36c538d3e7f8@linaro.org>
Date: Tue, 26 Apr 2022 17:54:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 4/5] target/riscv: Add stimecmp support
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20220426230855.336292-1-atishp@rivosinc.com>
 <20220426230855.336292-5-atishp@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426230855.336292-5-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 27 Apr 2022 00:54:14 -0000

On 4/26/22 16:08, Atish Patra wrote:
> +static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        uint64_t stimecmp_hi = env->stimecmp >> 32;
> +        env->stimecmp = (stimecmp_hi << 32) | (val & 0xFFFFFFFF);
> +    } else {
> +        env->stimecmp = val;
> +        riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +    uint64_t timer_val = 0;
> +
> +    timer_val = (uint64_t)val << 32 | (env->stimecmp & 0xFFFFFFFF);
> +    env->stimecmp = timer_val;
> +    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
> +
> +    return RISCV_EXCP_NONE;
> +}

Use deposit64() instead of open-coding the inserts.


r~


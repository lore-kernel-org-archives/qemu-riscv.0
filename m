Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkVMZ-0005Sk-9v
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 15:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkVMX-0005SE-V2
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 15:33:38 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkVMW-0005zS-BF
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 15:33:37 -0400
Received: by mail-pl1-x631.google.com with SMTP id kc4so38428601plb.10
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 12:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680809614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q5fLqYRjHiLLivlpZdwF47imcOn5GRt0O0to3ptExhc=;
 b=sd41DWUT7sKfwtRh83v+9UJvuXUAxTl1mNXcPybweZo6ldJwyjonSyvwOI/8+61obz
 dYF21bPjvub2DsgmwnpIe0knS1jOsackJ/ZF4RUUQChipeWqBXIuU+uBWct6cUYNN1nb
 a83/4sVq+CUmhJ/MNPb6UsCuiwTrk5DgvONEsT1obsjztVLPCEnCKYewOHgUopqGRpWU
 CW/O1br3PU2X3hxReaR2ZEMVHpRiMp/QjARWRaFukKODHsuZvqxU+TiC5qjzSjooVryh
 4iWKw7nvuf9LKZkXu7Um362fnJEgr8EJBn7J3xo43NPovtihQy4TbRgOxl8dEeu9kfZb
 OJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680809614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q5fLqYRjHiLLivlpZdwF47imcOn5GRt0O0to3ptExhc=;
 b=BkmKVDey1vK+m0lNdznfkfeRu8ChxCnCaRk6qV9/KZ8QUuriktg4+MiYQvAywt7D5O
 J7RdTCrKtkhdEoOx9CD1cXG71pEGSk4UuQaRrsTy3ftOhzFFDyliuIvWLnsWtUc0f+PR
 mUQu9wGyWm/gMJ7rdDD5uXNe5jmKfAxSqXE6AcsE7bWsKZSGafoTDfxRAukEuoTkN+P/
 +ppi9JiofiATr5GSUOahWIUt6uzw+UiXqaXkWqas76SG/iWz4Ci8eQX3rk1VnQxzJoUM
 vIlkS4/YsCm9kUVRr8lV0MFfyX5JKq7bqHIynWazfeiXHaenVz0/e4uFIkoWKanD+gOG
 q5bw==
X-Gm-Message-State: AAQBX9cyA7/ji8XcWNF25gtLlx2TiyEVu4Jx0ytqsSnYWJd+RXp3AtZh
 EulBmlpoXb+ECOcyQuRS+sqjGA==
X-Google-Smtp-Source: AKy350bfYSkuh3qGMwzcXvrwwQq+w1k1LxIRSTCmwgBIvVWpAi6NLUycNmrk7G2Inbu9dz0DgceFvw==
X-Received: by 2002:a17:902:f54a:b0:1a0:6721:6cdb with SMTP id
 h10-20020a170902f54a00b001a067216cdbmr273319plf.40.1680809614610; 
 Thu, 06 Apr 2023 12:33:34 -0700 (PDT)
Received: from [192.168.0.4] (174-21-65-249.tukw.qwest.net. [174.21.65.249])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a65584f000000b00502fd70b0bdsm1465347pgr.52.2023.04.06.12.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 12:33:34 -0700 (PDT)
Message-ID: <8bbf3df9-1e90-7976-7273-41cab3e96881@linaro.org>
Date: Thu, 6 Apr 2023 12:33:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] target/riscv: Legalize MPP value in write_mstatus
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230406072555.21927-1-liweiwei@iscas.ac.cn>
 <20230406072555.21927-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230406072555.21927-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
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
X-List-Received-Date: Thu, 06 Apr 2023 19:33:38 -0000

On 4/6/23 00:25, Weiwei Li wrote:
> +static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,
> +                                 target_ulong val)
> +{
> +    target_ulong new_mpp = get_field(val, MSTATUS_MPP);
> +    bool mpp_invalid = (new_mpp == PRV_S && !riscv_has_ext(env, RVS)) ||
> +                       (new_mpp == PRV_U && !riscv_has_ext(env, RVU)) ||
> +                       (new_mpp == PRV_H);
> +
> +    /* Remain field unchanged if new_mpp value is invalid */
> +    return mpp_invalid ? set_field(val, MSTATUS_MPP, old_mpp) : val;
> +}

Does anyone find PRV_H confusing, since that's not what it is?
I think it would be nice to remove it entirely.

This function might be better as

     bool valid = false;

     switch (new_mpp) {
     case PRV_M:
         valid = true;
         break;
     case PRV_S:
         valid = riscv_has_ext(env, RVS);
         break;
     case PRV_U:
         valid = riscv_has_ext(env, RVU);
         break;
     }
     if (!valid) {
         val = set_field(...);
     }
     return val;


r~


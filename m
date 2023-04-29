Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psgLk-0000wC-Nq
	for mharc-qemu-riscv@gnu.org; Sat, 29 Apr 2023 04:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psgLj-0000vt-3D
 for qemu-riscv@nongnu.org; Sat, 29 Apr 2023 04:54:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psgLh-0006do-AB
 for qemu-riscv@nongnu.org; Sat, 29 Apr 2023 04:54:34 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3003b97fa12so321639f8f.2
 for <qemu-riscv@nongnu.org>; Sat, 29 Apr 2023 01:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682758471; x=1685350471;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TtfO3wi4aAzk7BZnEnJLYslxA70A4n9NUbS3lDP17T8=;
 b=iDhEGVcpKXtZUqySXiJkb5A/+CRO1g/hoULLjhkh0y8VwUWajs4hOtioXOHql/O5YI
 ithErsJtXioEPi+nuZh16fOetAoTOvxfihQh00gzl3nWdJU4zSBWpoC8pZcN0zxtsiK2
 AucNVVkBtW+Hv+DXJOnraCCYpkFyJQ27IPAWSy1kdzm08V5VBNbyNL2DWhkVt97bFyrg
 fddhJsxVBhGvOQzRx8VFPMFt1mrvjjfuefozvT5k0JRp3jOeW1pyEgbSSaM7ZbxvwBUe
 bSjCncjN/UWG2cgRHZS+PWTSdmUuzyX55xblRcPHukLeWqKiaf1+8cw1l7emJUDMW9fC
 siEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682758471; x=1685350471;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TtfO3wi4aAzk7BZnEnJLYslxA70A4n9NUbS3lDP17T8=;
 b=DZf43izlTyT8Jpf5PsqdSUvU/DF+Y0jYFJI1m0R4GGE8IgRW7VntpfdZTQBd4fYLA+
 9OWqCstRM4kkf9N7y+lu6YFiYvb7xi+5EhA7clKZ3aizDAiKXPXCF7ACIt02NZyquleF
 EnUlE5ysb2WrUxmq5i0f8X22g6amvfVDw1RTz4I7YL7WyhjiqVX4Bi4JTqXXBhbd23ln
 /9IZ/2PHs41YIxuT/XFRSxqZkm/k33WwUja2Zzd/DfdSqtheGrUXJePrgtRAPr7iNxgi
 xu4ijdmPGO5eeTFqNhSubv8hhnBr/xKBm3bYGEzAGS7w1YZ5KvQGyFUfYdGSMxxnOBr2
 fW9w==
X-Gm-Message-State: AC+VfDwNXSYjTzzOd1f5b3e30eZjPqDSa4rZw8Rt9UtdJpDGM49gNLPc
 FKgDLYYqEw1WaNCuI96dIdRQXA==
X-Google-Smtp-Source: ACHHUZ6fUQqumP9NgccI77shSylsJliieUCM5nVvtL9BGFymCyPxBSYR0S/UVFhOj/IxsZu3G9FjRA==
X-Received: by 2002:a5d:638c:0:b0:2f6:35c3:7752 with SMTP id
 p12-20020a5d638c000000b002f635c37752mr5437578wru.57.1682758471207; 
 Sat, 29 Apr 2023 01:54:31 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f28de9f73bsm23082487wrp.55.2023.04.29.01.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 01:54:30 -0700 (PDT)
Message-ID: <adad1915-aad9-1f17-0cec-7e5057c15624@linaro.org>
Date: Sat, 29 Apr 2023 09:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/4] target/riscv: Reuse tb->flags.FS
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
Cc: Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn
References: <20230428165212.2800669-1-mchitale@ventanamicro.com>
 <20230428165212.2800669-3-mchitale@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428165212.2800669-3-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 29 Apr 2023 08:54:35 -0000

On 4/28/23 17:52, Mayuresh Chitale wrote:
> When misa.F is 0 tb->flags.FS field is unused and can be used to save
> the current state of smstateen0.FCSR check which is needed by the
> floating point translation routines.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/cpu_helper.c |  9 +++++++++
>   target/riscv/translate.c  | 12 +++++++++++-
>   2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b68dcfe7b6..126ac221a0 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -119,6 +119,15 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>           vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
>       }
>   
> +    /*
> +     * If misa.F is 0 then the FS field of the tb->flags can be used to pass
> +     * the current state of the smstateen.FCSR bit which must be checked for
> +     * in the floating point translation routines.
> +     */
> +    if (!riscv_has_ext(env, RVF)) {
> +        fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE);
> +    }

You have misunderstood my suggestion:

     /* With Zfinx, floating point is enabled/disabled by Smstateen. */
     if (!riscv_has_ext(env, RVF)) {
         fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR)
               ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED);
     }

> +    bool smstateen_fcsr_ok;

Not needed.

> -    ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
> +    if (has_ext(ctx, RVF)) {
> +        ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
> +    } else {
> +        ctx->mstatus_fs = 0;
> +    }

Not needed.

In patch 3, which should be merged with this, there are no changes to REQUIRE_ZFINX_OR_F, 
no additional smstateen_fcsr_check, and REQUIRE_FPU reduces to

#define REQUIRE_FPU do {                          \
     if (ctx->mstatus_fs == EXT_STATUS_DISABLED) { \
         return false;                             \
     }                                             \
} while (0)

This makes the DisasContext version of fs be the single gate for floating point.
No extra checks required.


r~


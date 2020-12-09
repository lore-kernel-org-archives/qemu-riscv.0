Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn3ML-0003XZ-6H
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 12:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn3MG-0003VS-TE
 for qemu-riscv@nongnu.org; Wed, 09 Dec 2020 12:34:33 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn3MD-0004VW-QM
 for qemu-riscv@nongnu.org; Wed, 09 Dec 2020 12:34:32 -0500
Received: by mail-oi1-x243.google.com with SMTP id p126so2547314oif.7
 for <qemu-riscv@nongnu.org>; Wed, 09 Dec 2020 09:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hS0dF72W6aMUI7Vs2McJgbCBGF8+gUWo0lXKWrnQfJc=;
 b=RZ2KuljczcIC3fLhhRHV2MwluM0sQpbvWCJhKTEhUXn+wJag4M3+SVCK2PVGDbE8xU
 bTn8qp7OPqajbRdVtEQ4BhJYtst6fEsLBZj3CHdkCV5KqPDTpIJy9r600wGBqzw9c45z
 NA5DhAnfY/PHADhfu48IeC/SJ4jnLBTzAGQU3NEfgeMozRdGC5NHfe9IaA3AfIVVJQT/
 bc1IMl3EozsoBY01xhYbMHqNxlzis3MdqOn9hwNygl9c6pBeRMobHyg+nIFV5RWd6B+t
 LuO8l1P91F82jp5la8dMWa68nDorueI7S1Mxgx+042sZ1X4xsxq3Pj8Rw6YulPmqMSnJ
 F6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hS0dF72W6aMUI7Vs2McJgbCBGF8+gUWo0lXKWrnQfJc=;
 b=ll69iYWG0kD/PBWXj9FnUM0Gmiif2vVJbz8SF+SewlEhtD4VafbJ43PvGvddF9/VEm
 4xZoOZKCryPOqy/2A2SUV6F9+/0M9zlNaZH06sUWvEw1tWXDB2tIsNSgSiDwyYMG+kzH
 GF+rfCGvjhQYGY3xv0wXRMvBOHfFxceglDc2Tt9jGP4YsRz+XwMBz1LmrspZq82trcoU
 CbU3IJHI+jaVbjM1kGf6OfrU5JQyRhRqffMxAT8CHZcTLXFgwZbeoqik9MmGf/870Xpj
 ha23x9/39bgEgpYZ0ZrhKAjRujaPlEI573wXGAgaOe2BpaypPBjAfrhiLW+VKwhVi/AH
 BV8A==
X-Gm-Message-State: AOAM532m2+8ZvJrCVRYM/3O1Z9sv5FucObq6286Ca3i0n+1tsTQkMVGv
 66UPPKrfnzv8O2CiyYjFxjfbHA==
X-Google-Smtp-Source: ABdhPJyMtcFwVo6hfwsLlawklRUQum1n4A0ttJmOi9at73yWnef2GgteESrEi3AUs6EwrmD/f84vbw==
X-Received: by 2002:aca:dd0b:: with SMTP id u11mr2561429oig.47.1607535267973; 
 Wed, 09 Dec 2020 09:34:27 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m81sm422344oib.37.2020.12.09.09.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 09:34:27 -0800 (PST)
Subject: Re: [PATCH v2 14/15] target/riscv: csr: Remove compile time XLEN
 checks
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <7d7d148b9d4a3bcc86387d7b0d8005f114ade8be.1607467819.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0dcaf5f-a41d-d578-273a-34de2da034d3@linaro.org>
Date: Wed, 9 Dec 2020 11:34:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7d7d148b9d4a3bcc86387d7b0d8005f114ade8be.1607467819.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 09 Dec 2020 17:34:33 -0000

On 12/8/20 4:56 PM, Alistair Francis wrote:
> @@ -1053,11 +1077,11 @@ static int read_htimedelta(CPURISCVState *env, int csrno, target_ulong *val)
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
>  
> -#if defined(TARGET_RISCV32)
> -    *val = env->htimedelta & 0xffffffff;
> -#else
> -    *val = env->htimedelta;
> -#endif
> +    if (riscv_cpu_is_32bit(env)) {
> +        *val = env->htimedelta & 0xffffffff;
> +    } else {
> +        *val = env->htimedelta;
> +    }
>      return 0;
>  }

Certainly this mask was useless before the patch, because of the ifdef and
target_ulong.

Afterward, target_ulong may be larger than uint32_t... but what does the rest
of the value, and the register into which it is stored, represent?

Are you going to keep the register values sign-extended, as-if by addw et al,
in which case casting to int32_t would be better.  Are you going to simply
ignore the upper 32 bits, in which case dropping the masking entirely would be
better.


r~


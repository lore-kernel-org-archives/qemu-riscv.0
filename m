Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k19tS-0008VX-KN
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 10:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k19tR-0008T0-7M
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 10:50:49 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k19tN-0001Q1-74
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 10:50:48 -0400
Received: by mail-pj1-x1032.google.com with SMTP id kr4so2483080pjb.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HY/RzSHyQvwyWF/W//ebYNIPd1zGtRDEdOWAmCIIwkA=;
 b=VfP8HJCx1/chqGqr0rbiMbsIEQxWoZl61U5rUSUFjxWsK6x8wZfvU9fqciBqIdaNVe
 miVsjTTI7Y6azZFNG60/v5O0T8t4eFJ2E9pzcBr+5QdVGXE5Lh7IJtY77B+PjP0w8XfV
 f1z8vMtJCxMgtLq/Xzv0Swd/BhxVvWVf2r9nfZBq6wEkIxeG2nxUnoaKNwsL315iZDMB
 cjG97NM+C2Jj5H5BO48PyKdYPNDeIonoCUSzGSxcvhyQHLfBqo+E29uSmKxx1NDKu6uk
 ufkgdaDZEoa64KystAX4yTUgBb4pnSzn/tY2FafFGFbE58UgO6xaohT8XSPkAZUYfvCy
 tTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HY/RzSHyQvwyWF/W//ebYNIPd1zGtRDEdOWAmCIIwkA=;
 b=d0BkrKgcujfwVEOaDwt3GbrXlS2WSlfR+g7ZsenKiQECPKP2CZQzRhhVJslKxTa2BA
 bMJmzPmf44mbD8axfcWqVOCijCNkUjNaH1ka30Jtopt1+yPsFMlt9LpbMlLCdeWWS8/p
 kTVB+zPsbn9J2XOH4cFNybSAX7rgb8CQiDp7D1X73d167jr9bXuS3rcGm/fHlzTgFfk2
 u08adhthv4l6MgPdp5RlHWCE18HalM1ay6yxM3r0wcnsQo7uqFoNLvUPg/GT4pkMY0on
 K+syzvGcmL+JiCNPjJllYECc4/1ni/uUH81+7lTCXJHZQp67QqFB0FdW4XfRYIJVK8ue
 iHcw==
X-Gm-Message-State: AOAM531rxBwNqvhvkHAKCuYo6pbcoNDt/PnX8oWI8JtHr6yjAbfEVpP/
 vpKiQVYjSa6/KWZYb7hS30cdoQ==
X-Google-Smtp-Source: ABdhPJyZ778w6ILenejAQbdbsDkIfO45nlA2lLrWnPREXNnSOiSEJ6xjj5TP+9k433IF6Qf/J4kZwQ==
X-Received: by 2002:aa7:9357:: with SMTP id 23mr3688671pfn.278.1596120643525; 
 Thu, 30 Jul 2020 07:50:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id r1sm3102696pgi.28.2020.07.30.07.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 07:50:42 -0700 (PDT)
Subject: Re: [RFC v2 39/76] target/riscv: rvv-0.9: integer scalar move
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-40-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d61baa86-3852-6ec3-bcfc-25449eb43746@linaro.org>
Date: Thu, 30 Jul 2020 07:50:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-40-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Thu, 30 Jul 2020 14:50:49 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> +/* vmv.x.s rd, vs2 # x[rd] = vs2[0] */
> +static bool trans_vmv_x_s(DisasContext *s, arg_vmv_x_s *a)
> +{
> +    if (require_rvv(s) &&
> +        vext_check_isa_ill(s)) {
> +        TCGv_i64 t1;
> +        TCGv dest;
> +
> +        t1 = tcg_temp_new_i64();
> +        dest = tcg_temp_new();
> +        /*
> +         * load vreg and sign-extend to 64 bits,
> +         * then truncate to XLEN bits before storing to gpr.
> +         */
> +        vec_element_loadi(s, t1, a->rs2, 0, true);
> +        tcg_gen_trunc_i64_tl(dest, t1);
> +        gen_set_gpr(a->rd, dest);
> +        tcg_temp_free_i64(t1);
> +        tcg_temp_free(dest);
> +        mark_vs_dirty(s);

No need to mark the vector set dirty, since we're modifying general regs.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


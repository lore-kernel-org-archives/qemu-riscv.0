Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCvvu-0007Ri-Hr
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 21:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvvs-0007Ql-94
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:49:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvvr-0003UR-0u
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:49:43 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36638)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCvvq-0003SU-QM
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:49:42 -0400
Received: by mail-pl1-x644.google.com with SMTP id g2so2658264plo.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 18:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fny5UvBKk0IpFay3Kp6K4gQ40euxGyv5MhPSATQPqWM=;
 b=Ubm6pxtUUf6hI61k+GpdiImUkrHH2pROa13fMA0t+IiOUmRF3oL1rO//43GjjpCHNJ
 G6FMERGVFCwLJOqHQqgVA4Tb8Edj3xon6MUdVGRnc9Yh399rKfT02KCv19bAX8L8IlIb
 UENQ2e6zXTzeI7mvAXhcUFsPkoqAro8UEcKygI5y1GX0U3bFJczWrqsI97ezs5egNcPG
 xjMn0b5zJZ8NuxGyWKY3Rh+iuDcq/mHirIQG/TMjBfHj2ILdFb2nJ0IeXZkIzyFy5iX8
 FYn7mbXfgTHWwHG1Zb85+v/92v5D/S2/9UNrYREyDWJcbDvkOhhlcRS2MVaTYxYBdXLW
 apjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fny5UvBKk0IpFay3Kp6K4gQ40euxGyv5MhPSATQPqWM=;
 b=U9QA+fCA/MHWCESHpT3H7FSSAtrGI0RDEnYarHJxp8cqSJ6CY73BtGBw5Cv5lMktnp
 t+CwIpHOzTSpjbCFmIeu8THmdf6z8pGFsJhMFykrA/Pg2nzvuABE1mxOA915npMlie+b
 Bo65AyTHpakO/n55a1K3c+eHH/SnNr9IPpBeVr17JhNk/07BwvSQNr1GsRzXfQubrZ5v
 GwMSqEKVYfDQYtRz61ZdkhN2qHQAMz4WcKwjMwevebP6x6Lm3qPQRHI4rc03G03ylxsN
 qk8D6GZ2ryKhG7/y5I9Ne2OU+71neVtn5PTm1z4iULlGYwicYtcEPxyWromZWY7VjZm0
 uTdA==
X-Gm-Message-State: ANhLgQ18DcrIacNCsugkbd6noSx3mP3ddXb6vThRsQn/Ce2Rm2ZgEUtd
 T/v0nI6rezLhcoUPFPOOVvIaT68YdvE=
X-Google-Smtp-Source: ADFU+vvMM+AFLkO1qHOm/fYg6YShEyUPumOloY40dzlbk4X7Bzgdfh3c3dn52qeblm9XSZwn/Ai0+A==
X-Received: by 2002:a17:90a:630b:: with SMTP id
 e11mr12542516pjj.53.1584150581243; 
 Fri, 13 Mar 2020 18:49:41 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 fz3sm13288697pjb.41.2020.03.13.18.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 18:49:40 -0700 (PDT)
Subject: Re: [PATCH v5 06/60] target/riscv: add vector index load and store
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-7-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bfcd198e-2fe3-c21e-bbde-6d106673584a@linaro.org>
Date: Fri, 13 Mar 2020 18:49:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-7-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Sat, 14 Mar 2020 01:49:45 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +static inline void vext_ldst_index(void *vd, void *v0, target_ulong base,
> +        void *vs2, CPURISCVState *env, uint32_t desc,
> +        vext_get_index_addr get_index_addr,
> +        vext_ldst_elem_fn ldst_elem,
> +        vext_ld_clear_elem clear_elem,
> +        uint32_t esz, uint32_t msz, uintptr_t ra,
> +        MMUAccessType access_type)
> +{
> +    uint32_t i, k;
> +    uint32_t nf = vext_nf(desc);
> +    uint32_t vm = vext_vm(desc);
> +    uint32_t mlen = vext_mlen(desc);
> +    uint32_t vlmax = vext_maxsz(desc) / esz;
> +
> +    if (env->vl == 0) {
> +        return;
> +    }
> +    /* probe every access*/
> +    for (i = 0; i < env->vl; i++) {
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        probe_pages(env, get_index_addr(base, i, vs2), nf * msz, ra,
> +                access_type);

Indentation.

> +    /* load bytes from guest memory */
> +    for (i = 0; i < env->vl; i++) {
> +        k = 0;
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        while (k < nf) {
> +            abi_ptr addr = get_index_addr(base, i, vs2) + k * msz;
> +            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            k++;
> +        }

Why the odd formulation with k?

> +        for (k = 0; k < nf; k++) {
> +            clear_elem(vd, env->vl + k * vlmax, env->vl * esz, vlmax * esz);
> +        }

Using a for is certainly a bit clearer.

Which does bring to mind an optimization -- letting the compiler know that
these loops always go at least once.

We can do that either by writing all of them as do { } while.

Or by encoding NF in desc like the instruction does:

static inline uint32_t vext_nf(uint32_t desc)
{
    return FIELD_EX32(simd_data(desc), VDATA, NF) + 1;
}

which will let the compiler know that NF >= 1.

But that's minor, and we can look at these sorts of things later.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


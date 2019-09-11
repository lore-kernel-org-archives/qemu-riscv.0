Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8Bja-0003vp-Or
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 19:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8BjY-0003vO-NT
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 19:09:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8BjX-00032v-E6
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 19:09:08 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:39435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8BjX-00032J-6l
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 19:09:07 -0400
Received: by mail-qk1-x744.google.com with SMTP id 4so22585745qki.6
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 16:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6GeOuoT4NUUckbkLq+q7UKa/IYbDjNS2DJaWJZtf664=;
 b=BbuXgeq2v1Q5QM3k+idlg96OzXe9GEEtTzUzQVhHVTbtc5/caz9Z8pBvytgBiSGyIy
 IPVHIIj7PaJ/4e1ffAgBvT+twf5FxHRa5Xtiagrzwd1cktahBR1dclogRDCzMhTrQx+i
 V8DFtJVOqpXDxKlhD19Xk+iFDC8SxeDHpv1rZha1hDI0F0EecmKEvjPy9+9qJzOZqQpP
 MfmFEu/Mne+5z16UcuxjRjlY9xjdcwjxeTxOmV5BYcRbteCRpMiHO7Ew0ksqIZyw/beD
 nIVQ3AQZGBFuF1/BPtwZYnEtkIKtlkgRhQ87i4aB0Bi4OkMs052mIJBvSGpiFgl6qh3i
 OCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6GeOuoT4NUUckbkLq+q7UKa/IYbDjNS2DJaWJZtf664=;
 b=rAQPxPqSzdyFOZEe4DGxMVfwbPb2hgnhrfx3RNUUcRr4s3Zvm2WQzpR3TwbcgZveNC
 l3aw9RMT17k/+34K8iTLS0mTmCw3ZrwhviZYhL05Dw04YIok4Ka3IdkTeJVC2jt0lGsV
 YgSNdYoNDTPgeQZWMcJIREKkgANGfUk6XMjLVfXMZe+V7TzAHWw3WF59xXQTPzl5vMqK
 mt39zKA/6t1mtKb74JVQ+tN7d7gF/7VxQrsEyE5MEZY5/71tonXt8SHA9NZLc0Hj70vU
 KJBC5n5DAy8O7tJH8JXaOP1BKTlBdbtQeD/pQt8BgwNNbTyy0aorjQO/dlZL/6mFB6aG
 7upQ==
X-Gm-Message-State: APjAAAVyVqS2J1VsBUJUg7BYAs/BzygAGQZlEsyCPlwRf70fjUdUWcJF
 YlP22lsRgK+SVgP7O35HVJWePg==
X-Google-Smtp-Source: APXvYqyu8QsAoU9xT4FO2hwZUhf4rhiOZviRfaRrNo3SyPw4GVpqZu9QDaNFNJdm4RIfxqs7JCfuzQ==
X-Received: by 2002:a37:ab1e:: with SMTP id u30mr37316705qke.84.1568243346322; 
 Wed, 11 Sep 2019 16:09:06 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id t17sm14959937qtt.57.2019.09.11.16.09.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 16:09:05 -0700 (PDT)
To: liuzhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 riku.voipio@iki.fi, laurent@vivier.eu, wenmeng_zhang@c-sky.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-5-git-send-email-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1b1e6e6e-9ddc-b45d-cf5f-af93ac49c1f0@linaro.org>
Date: Wed, 11 Sep 2019 19:09:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568183141-67641-5-git-send-email-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 04/17] RISC-V: add vector
 extension configure instruction
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
X-List-Received-Date: Wed, 11 Sep 2019 23:09:10 -0000

> +void VECTOR_HELPER(vsetvl)(CPURISCVState *env, uint32_t rs1, uint32_t rs2,
> +    uint32_t rd)
> +{
> +    int sew, max_sew, vlmax, vl;
> +
> +    if (rs2 == 0) {
> +        vector_vtype_set_ill(env);
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +        return;
> +    }

I don't see that vsetvl, rs2 == r0 should raise SIGILL.
Is that requirement new, after the 0.7.1 specification?
If so, this should happen in the translator and not here.
You should *not* change cpu state (setting vill here) before raising SIGILL.

As far as I can see "vsetvl rd, rs1, r0" == "vsetvli rd, rs1, e8".

> +    env->vfp.vtype = env->gpr[rs2];

You should pass the rs2 register by value, not by index.

> +    sew = 1 << vector_get_width(env) / 8;
> +    max_sew = sizeof(target_ulong);
> +
> +    if (env->misa & RVD) {
> +        max_sew = max_sew > 8 ? max_sew : 8;
> +    } else if (env->misa & RVF) {
> +        max_sew = max_sew > 4 ? max_sew : 4;
> +    }
> +    if (sew > max_sew) {
> +        vector_vtype_set_ill(env);
> +        return;
> +    }
> +
> +    vlmax = vector_get_vlmax(env);
> +    if (rs1 == 0) {
> +        vl = vlmax;
> +    } else if (env->gpr[rs1] <= vlmax) {
> +        vl = env->gpr[rs1];
> +    } else if (env->gpr[rs1] < 2 * vlmax) {
> +        vl = ceil(env->gpr[rs1] / 2);
> +    } else {
> +        vl = vlmax;
> +    }

You should pass rs1 register by value, not by index.
The special case of rs1 == r0 can be handled by passing the value
(target_ulong)-1, which will match the final case above.

> +    env->vfp.vl = vl;
> +    env->gpr[rd] = vl;
> +    env->vfp.vstart = 0;
> +    return;
> +}

You should return vl and have it assigned to rd by the translator code, and not
assign it here.

> +void VECTOR_HELPER(vsetvli)(CPURISCVState *env, uint32_t rs1, uint32_t zimm,
> +    uint32_t rd)

You should not require a separate helper function for this.

Passing the zimm constant as the value for rs2 above is the correct mapping
between the two instructions.


r~


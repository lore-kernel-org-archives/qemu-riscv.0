Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8QXk-0002AG-SV
	for mharc-qemu-riscv@gnu.org; Thu, 12 Sep 2019 10:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8QXh-00026N-Ut
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 10:57:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8QXg-0004xH-EU
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 10:57:53 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:46256)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8QXg-0004w9-5o
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 10:57:52 -0400
Received: by mail-qk1-x741.google.com with SMTP id 201so24725738qkd.13
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2019 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xsy2kOVTD167AQ683WKVJW7gRRAg7eLJFgC+5Fhug4A=;
 b=WiEV1GI8i1a6XEstQK6iiS+7fC12W33ErCpruiK6IbEbUICsL4U/fya0xle1R7G1bu
 7/Jn0zFNd06NRh8S9mafLIn1SmwVn0dc2lhkniznniD+Ru6YJgfuca38b/1+8Ku8LJTG
 DnbNqu7HlO3mZR9z6v1xS9evYLhsi65/BGhyRNP6B2MWxnq0QQXLmR2nV09ARTCj67KQ
 cM93PFCYwBvd8lvZiXrzA0FHZWFbYAAtw6rEpTS7nKJyvQw+fL70ybrzGiK0FWi+qL7E
 5dQXzDAAOH3VGuFcIZinplkQalJ+p6x1wB/4Ot6QWC0I3/MuuMBneppg4Y4I55nCMUQm
 7NdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xsy2kOVTD167AQ683WKVJW7gRRAg7eLJFgC+5Fhug4A=;
 b=t8pO91ovOJkpM8dFTKO8ieUjJNK+JPK1P+jPswLGrk0S9fLC8VXkOiSsYiKDzg+3Rx
 GYqhEA4XfACyOaCs4xWhve3iZCKbIEbFaHNC2aiyW1E8MeS36xWWNFniWAsU0VT0QDrF
 sa4pc4qTfSBe1+z0pqzTKEw46kydsPol+NJk6lzdqftJGMMYbpQcRQJlMKfE3FqSLLxl
 fJD67XHZsFC4735hF8cB+9ivRrhk9R4mwlmpCb4wW6qp/tbgIubbhNQRiMNv2TDm8Vjf
 OpQz7IHdG6m7g+tOHPSunU1i7u3GCvARYJ/Xsb/P1AVUbwZVnMx+vkkCTI+oOabpWtmf
 QB0A==
X-Gm-Message-State: APjAAAUhQCWR4bHerx+n4WKju/FoIN/YgM1qNZyFeq3XSpnlLhFdYx47
 GrlhxrUL43qukPDdBPM9wrBzYQ==
X-Google-Smtp-Source: APXvYqyPtC5uLDt5tEspaCxPCLb/waHvYMe8mqW8tiNl5QwFXLWRGvRV4eyn+4gYLomUku9+RlEsmQ==
X-Received: by 2002:a37:4b02:: with SMTP id y2mr41251379qka.493.1568300271069; 
 Thu, 12 Sep 2019 07:57:51 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id m14sm1449496qki.27.2019.09.12.07.57.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 07:57:50 -0700 (PDT)
To: liuzhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 riku.voipio@iki.fi, laurent@vivier.eu, wenmeng_zhang@c-sky.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-8-git-send-email-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5807ed99-e8a8-b845-2eb8-e8c5ae6176a4@linaro.org>
Date: Thu, 12 Sep 2019 10:57:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568183141-67641-8-git-send-email-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 07/17] RISC-V: add vector
 extension atomic instructions
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
X-List-Received-Date: Thu, 12 Sep 2019 14:57:55 -0000

On 9/11/19 2:25 AM, liuzhiwei wrote:
> +            case 64:
> +                if (vector_elem_mask(env, vm, width, lmul, i)) {
> +                    int64_t tmp;
> +                    idx    = (target_long)env->vfp.vreg[src2].s64[j];
> +                    addr   = idx + env->gpr[rs1];
> +
> +#ifdef CONFIG_SOFTMMU
> +                    tmp = (int64_t)(int32_t)helper_atomic_xchgl_le(env, addr,
> +                        env->vfp.vreg[src3].s64[j],
> +                        make_memop_idx(memop & ~MO_SIGN, mem_idx));
> +#else
> +                    tmp = (int64_t)(int32_t)helper_atomic_xchgl_le(env, addr,
> +                        env->vfp.vreg[src3].s64[j]);
> +#endif
> +                    if (wd) {
> +                        env->vfp.vreg[src3].s64[j] = tmp;
> +                    }
> +                    env->vfp.vstart++;
> +                }
> +                break;

This will not link if !defined(CONFIG_ATOMIC64).

That's pretty rare these days, admittedly.  I think you'd need to compile for
ppc32 or mips32 (or riscv32!) host to see this.  You can force this condition
for i686 host with --extra-cflags='-march=i486', just to see if you've got it
right.

There should be two different versions of this helper: one that performs actual
atomic operations, as above, and a second that performs the same operation with
non-atomic operations.

The version of the helper that you call should be based on the translation time
setting of "tb_cflags(s->base.tb) & CF_PARALLEL":  If PARALLEL is set, call the
atomic helper otherwise the non-atomic helper.

If you arrive at a situation in which the host cannot handle any atomic
operation, then you must raise the EXCP_ATOMIC exception.  This will halt all
other cpus and run one instruction on this cpu while holding the exclusive lock.

If you cannot detect this condition any earlier than here at runtime, use
cpu_loop_exit_atomic(), but you must do so before altering any cpu state.
However, as per my comments for normal loads, you should be able to detect this
condition at translation time and call gen_helper_exit_atomic().


r~


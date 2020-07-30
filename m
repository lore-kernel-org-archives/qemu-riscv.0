Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1FR9-0002Ct-Jf
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 16:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1FR8-0002BW-3v
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 16:45:58 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1FR6-0006sG-Ig
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 16:45:57 -0400
Received: by mail-pj1-x1035.google.com with SMTP id kr4so3342576pjb.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 13:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a/Hs2zme5w/U6zePKQMyVR1cnSSjPxPR90z0tx0Azus=;
 b=Zb5+V/k04C3hX8QF9FEiPFh+Ewa1WFGBjMyB7jkNhosDWUWUbyynZdNGRcrxpA41PJ
 mnDBpoNbEybdJrKhPRILxrEetn3H/g7ax8HDRmrDansR3JvAz6EE4B4LVMeA4CNE8RQT
 eesHVDRSpukSWrr4ABdJ0dLM0aE2u2kLc16ug0M1baq1x1FQLOlGUysvyE0SRgLbmzKy
 iGKmK6syRsxXVaCycE557MVe2UDMAiS8X71FFUrN2I0bl1PfeizMhxvKy+Qvvo3FThP/
 zF0jspWyviHXlIXMjWAoSEJD39Q1nGkElK8RlFoM9+8mmX3jUrTEZWp3/NT9RQwJ2GPj
 zYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a/Hs2zme5w/U6zePKQMyVR1cnSSjPxPR90z0tx0Azus=;
 b=Woq8Tnpm29kiTZpAmCdLpb9RnohrRDGpgRFTDmCvVaudO5WhFMYdUyQ3Ru1o3zAAyK
 I+Y1d4LAL+1mMh27gthPyCoTwdWYjzsqbOk58pWYO7nk1ZA4GjO9gKHWfKIb0F3Y1pAc
 EQTPF03VfymQo2CnanID+9gq31KvqD3x2YRyGpulgjaS3bjp1pkOzbGLk4N3XSRoUEHT
 um/fJL9s4mM3r7RQ+B6G1x7rj7eHTwyAQqWzGemHTZ0SFmgZ5g0lWXgzIgCQNEvJhCFn
 IvP8g10l193sPfwTmcMTdX5DHp90c66pef8q672iNmSf7VcDg7K0fGvICWiN7CtESgom
 BQQg==
X-Gm-Message-State: AOAM533u9RE9S6IcBXRCsnzx0PpTy5e5NDS1f+lF5g/GxbgY8H0sOnUJ
 FoM/8F5byyUrNJCp/UvEzrSbjA==
X-Google-Smtp-Source: ABdhPJx7DfbgoARYUWMiJ1wAJ3V8GOqAYBAmYuRe4oqUrFWYlYLxnYteeg9rQjVYLPt5GSnm+J5VVQ==
X-Received: by 2002:a63:1f11:: with SMTP id f17mr630952pgf.217.1596141954960; 
 Thu, 30 Jul 2020 13:45:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 22sm6857151pfh.157.2020.07.30.13.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 13:45:53 -0700 (PDT)
Subject: Re: [RFC v2 44/76] target/riscv: rvv-0.9: single-width averaging add
 and subtract instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-45-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5638f6d3-860d-d543-9498-b63f1ac8e7db@linaro.org>
Date: Thu, 30 Jul 2020 13:45:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-45-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 30 Jul 2020 20:45:58 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add the following instructions:
> 
> * vaaddu.vv
> * vaaddu.vx
> * vasubu.vv
> * vasubu.vx
> 
> Remove the following instructions:
> 
> * vadd.vi
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   | 16 ++++++
>  target/riscv/insn32.decode              | 13 +++--
>  target/riscv/insn_trans/trans_rvv.inc.c |  5 +-
>  target/riscv/vector_helper.c            | 74 +++++++++++++++++++++++++
>  4 files changed, 102 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +static inline uint64_t aaddu64(CPURISCVState *env, int vxrm,
> +                               uint64_t a, uint64_t b)
> +{
> +    uint64_t res = a + b;
> +    uint8_t round = get_round(vxrm, res, 1);
> +    uint64_t over = res < a ? ((uint64_t)1 << 63) : 0;

You know you can write this as

    (uint64_t)(res < a) << 63

right?

r~


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1YmZ-0001ci-V4
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 13:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YmX-0001Yr-OO
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:25:21 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YmV-0007N2-2q
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:25:21 -0400
Received: by mail-pj1-x1031.google.com with SMTP id c6so7739766pje.1
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v0RlbWiTo8KRlB+z/cZJ0MQTmzfaIWBJNl8xqksUh9Q=;
 b=hXgkfQFBHFfHs+8bz5mIee9I0hmknd/cN6gmVabZ31wnTTewylWnckSSzAM00L7cNw
 +tU9qW6mlMVaVKw49xfLYpgLmvL4M4bntFJ7jIVH/ciy90PJpufUz++oOvZ5DxywYn1O
 sKPxF8YdXl/KP6pLZYs++ry9Sf98QPuDmrq5JoQqxAIyRbLSiPZRahAamGxsDGdqr/+W
 S0iGHkli0Pqs31w7rAeD6T6EVnz9SPiksBcJGs8gQbNoKoWdEKds3PAjaFIs/D/ZRuqd
 hzCv7HyDNDFq/Rb/965UkgcpSpPmCgFInT6E/S4sKE/jvbEseMCmTT9t0vdt0lc/22ge
 6D4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v0RlbWiTo8KRlB+z/cZJ0MQTmzfaIWBJNl8xqksUh9Q=;
 b=OgDguZiJTJqs5oE/0S0UPh7gkGGFpBxr8xyuVQcjSgz/lmcCS3EfTzfv8KGR5syOka
 DolG2mDzvZhZNnRHCJ5ifmzqi8SjMI8JKfC84fYjiWmBXWNPanP1f6cPnsdh9F94g4gk
 6MvdsnyuD/YPdP4Ho52ecyjh/Xm9l62FDybMBbFJH3cGcAgQdtbEw7x3mfo1/V796iBg
 CS/RuYcK9ADKy18ZOvc7U1MrhjGXsEkGN+ncXhGm0vkOP/mPRoib3P0AyX5yH/MBaHWK
 l5NAgwbMZoCFHvRLBlRIOfGsSenxZY+1Lqfr8wxHyurbbL7PdCLVfKwydtu4ht7SF2Gv
 mWSA==
X-Gm-Message-State: AOAM531Sq79Dv68J3v7z5l2biYMjiUK3IKhwWZhDCmNuFtMspmhAeaaW
 eth8PZhYkHjuKJAiCu/89d7VXQ==
X-Google-Smtp-Source: ABdhPJw8lfkT9qZevlvgZ/qKtw0Dhy2qERWP0crBCQAIZHK5Mqx+pGI1uXUkRe/PnBP+6T58Wirrmw==
X-Received: by 2002:a17:90a:9d84:: with SMTP id
 k4mr5100721pjp.227.1596216315510; 
 Fri, 31 Jul 2020 10:25:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id r202sm618129pfc.127.2020.07.31.10.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 10:25:14 -0700 (PDT)
Subject: Re: [RFC v2 75/76] target/riscv: gdb: support vector registers for
 rv64
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Hsiangkai Wang <kai.wang@sifive.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-76-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <684f11b4-eb62-601a-1664-afaeca4b1711@linaro.org>
Date: Fri, 31 Jul 2020 10:25:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-76-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Fri, 31 Jul 2020 17:25:22 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> +    if (env->misa & RVV) {
> +        /* TODO: support vlen other than 128, 256, 512 bits. */
> +        const char *vector_xml_name = NULL;
> +        switch (cpu->cfg.vlen) {
> +        case 128:
> +            vector_xml_name = "riscv-64bit-vector-128b.xml";
> +            break;
> +        case 256:
> +            vector_xml_name = "riscv-64bit-vector-256b.xml";
> +            break;
> +        case 512:
> +            vector_xml_name = "riscv-64bit-vector-512b.xml";
> +            break;
> +        default:
> +            vector_xml_name = NULL;
> +            break;
> +        }

I guess this is ok as-is, but consider mirroring arm_gen_dynamic_svereg_xml().


r~


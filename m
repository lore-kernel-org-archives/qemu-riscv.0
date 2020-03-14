Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD0MR-00036c-DD
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 02:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD0MP-00034i-QW
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:33:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD0MO-0004wr-MR
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:33:25 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:50760)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD0MO-0004u3-Gf
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:33:24 -0400
Received: by mail-pj1-x1043.google.com with SMTP id u10so5267366pjy.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 23:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ds2kqrrs33istRt1suE15np/U24q3ZUB/Pre1HY/bNA=;
 b=ye7Xs+yT96GXaA53U+0gOnWLJW3xyJDAXv/+Xjq4qSdoAGD5z3uiHCX/cf8wfIJDtf
 JiVOx5qdgwAZS1XXOCuBI1YyPfeuPPeF/TcOgB/By7T0B3fWYtf5Z9H4/q+KNPFuVWRC
 2/OntIpxXmVhiWQ0oBlEi7Xwc0uqz6weKqcAGiK0SWIEwcNjcqG994l0O3Y1HtnYt3mB
 vVy9knsktdbqAggM6UsQhK49Y0yEahr2Yf/Y7iIdDXeBJxwnNAs921eYfx2JzDR4bsVM
 oSC4/lK4pPvGCdqUDamk7ZryXp+J9uundWFbpV+zM8+3hdDHH87zlsngqPlDFs/9qxcC
 rR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ds2kqrrs33istRt1suE15np/U24q3ZUB/Pre1HY/bNA=;
 b=gkjBSFj7hamMpAjg68NoGI5EY57WPJxQjMmQlY/fSd0WxXObfXhEY5n9lLnZfhCmus
 nwrJul/1pv+Y1HkEtiHLhZYqHatm81s/FCkpkxKG4wjDPPcIS7dJ/ozOIvWHgZVvWhTd
 r6vQBQeP/l2AC2yqI5vPZ3u0WvPSQ+FQ3ZV1mR99/pOBohD3YFvnI8jGrdj+qC9oCdQJ
 SaVRZ8EENubNEoKVdPAhiuHABnRygtkLmfdJfPkQqtT3AuxCgg/RRNooyF00kPOMwO4y
 CNT+SNrHns9N2Ks6n6pCoWEzyodw/fqqShHKVv+Z9iuzVBi1H0S2FPDRBmvzvBVhGq5C
 1aJQ==
X-Gm-Message-State: ANhLgQ00lJ1x1DCNFrGRkuzcfsnCQeItkMdGUNv/T601ruOYItJQc7Ur
 qMS6EgqmQzrXLUA67/hvy3VMHnKnd5U=
X-Google-Smtp-Source: ADFU+vuoAVBfJIMVFkicPcuUQB7K/1wuT+s0zRTfAvPYrgGea5l20Vuoz2CeDevuHit3glNpNSc7EQ==
X-Received: by 2002:a17:90a:5d0a:: with SMTP id
 s10mr13660398pji.166.1584167603165; 
 Fri, 13 Mar 2020 23:33:23 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 129sm35422072pfw.84.2020.03.13.23.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 23:33:22 -0700 (PDT)
Subject: Re: [PATCH v5 15/60] target/riscv: vector integer comparison
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-16-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6a3f967-559b-41cf-5bda-f206c89fe837@linaro.org>
Date: Fri, 13 Mar 2020 23:33:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-16-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-List-Received-Date: Sat, 14 Mar 2020 06:33:26 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +/* Vector Integer Comparison Instructions */
> +#define DO_MSEQ(N, M) ((N == M) ? 1 : 0)
> +#define DO_MSNE(N, M) ((N != M) ? 1 : 0)
> +#define DO_MSLTU(N, M) ((N < M) ? 1 : 0)
> +#define DO_MSLT(N, M) ((N < M) ? 1 : 0)
> +#define DO_MSLEU(N, M) ((N <= M) ? 1 : 0)
> +#define DO_MSLE(N, M) ((N <= M) ? 1 : 0)
> +#define DO_MSGTU(N, M) ((N > M) ? 1 : 0)
> +#define DO_MSGT(N, M) ((N > M) ? 1 : 0)

You can drop the ? 1 : 0.  You can drop the LT/LTU (etc) distinction, since
that comes from the type.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


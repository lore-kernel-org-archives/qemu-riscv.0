Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7P9k-0005wI-0Y
	for mharc-qemu-riscv@gnu.org; Thu, 27 Feb 2020 14:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49869)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7P9e-0005vY-Tz
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 14:49:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7P9d-00005f-TU
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 14:49:06 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7P9d-00005T-OP
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 14:49:05 -0500
Received: by mail-pf1-x442.google.com with SMTP id l7so365789pff.6
 for <qemu-riscv@nongnu.org>; Thu, 27 Feb 2020 11:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5yN6sH6PQyT2zWxZQXjM0a62AyWsU4lD3wudwbpMNcQ=;
 b=eU6LFt042wGzY4/cSfnJuWAHQ/73aMWgnM3j6qj9gbXp8h5qwvtb+GzG5cHrPMmX+n
 U3YKJiLN8eV0d7MRizBN5JJx/xhOv+KwtqR6nxljZBvCh2kS4/OMMSwJgPS+E7j37ahw
 F8JkgjTj+nZjeuqefmqxvy7lQmPRUL5CIEnRJoMHjoirIdUFOi54iZUJKJ6Oe6yPb8Kk
 hpg4qY9myI9DGpl+sYk0RXlJL5gsywsves8g0oEuG54S2l7OyOgYaozW8gFNRkd4Oa9E
 /EPw0T4fQtHNeTYr39kf0eHYb4EXem94o0vSyuJ9MaSvmfUo93ibHNYPlzf15nljgk0Y
 8NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5yN6sH6PQyT2zWxZQXjM0a62AyWsU4lD3wudwbpMNcQ=;
 b=d2CoKJDe7EIggRHYbEJlZd7Ny+ZrzT/sCjxd8Pbn6weLwsnaWCT5TLFGp8jDdMdzwH
 K9lFXGZvIj+GfPdrPsWnYefBJNukHsHigpwceKHwEvMe4sYa3NO0OFokwR4LHeUtsvsV
 I1CD6Yg/yDi95ONFnaYW2Jg5G2ddtshtDb7T7EbviUYWsPVOHrDnkLehvyD8B5s11R9+
 aqs78pPKlwMSLCCsKvI6tmfIWTQVhzcXXSi4+Sv15yiihXOJaBiukRMxclniaKOPNBE9
 pxETTtGHQAFEU1fxRG6IfPTmSKDt23nl5cCI6SrHGrfG2up3LhhSNtE1xbNRyN423iD2
 65Pg==
X-Gm-Message-State: APjAAAXJZWZ2ln+CHBpBY7NSrs6wpXgll4+J9QpBy3wiDsLI9RxFufpQ
 mw++QirMJgduSrOu0HESw/rdy7/SHEI=
X-Google-Smtp-Source: APXvYqyomvcL6FS7utxlqRTE2UGXlv3vGzIut3Nt363K04DlCt7BPoo0beMALHABzUs3iTPCXExQDQ==
X-Received: by 2002:a63:e509:: with SMTP id r9mr990070pgh.274.1582832944247;
 Thu, 27 Feb 2020 11:49:04 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 k9sm7332755pjo.19.2020.02.27.11.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 11:49:03 -0800 (PST)
Subject: Re: [PATCH v4 3/5] target/riscv: add vector index load and store
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 linux-csky@vger.kernel.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200225103508.7651-1-zhiwei_liu@c-sky.com>
 <20200225103508.7651-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30ac8dcd-a6d4-b4d6-212c-6819f914bd21@linaro.org>
Date: Thu, 27 Feb 2020 11:49:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225103508.7651-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Thu, 27 Feb 2020 19:49:09 -0000

On 2/25/20 2:35 AM, LIU Zhiwei wrote:
> +vsxb_v     ... 011 . ..... ..... 000 ..... 0100111 @r_nfvm
> +vsxh_v     ... 011 . ..... ..... 101 ..... 0100111 @r_nfvm
> +vsxw_v     ... 011 . ..... ..... 110 ..... 0100111 @r_nfvm
> +vsxe_v     ... 011 . ..... ..... 111 ..... 0100111 @r_nfvm
> +vsuxb_v    ... 111 . ..... ..... 000 ..... 0100111 @r_nfvm
> +vsuxh_v    ... 111 . ..... ..... 101 ..... 0100111 @r_nfvm
> +vsuxw_v    ... 111 . ..... ..... 110 ..... 0100111 @r_nfvm
> +vsuxe_v    ... 111 . ..... ..... 111 ..... 0100111 @r_nfvm

These can be merged, with a comment, like

# Vector ordered-indexed and unordered-indexed store insns.
vsxb_v     ... -11 . ..... ..... 000 ..... 0100111 @r_nfvm

which means you don't need these:

> +static bool trans_vsuxb_v(DisasContext *s, arg_rnfvm* a)
> +{
> +    return trans_vsxb_v(s, a);
> +}
> +
> +static bool trans_vsuxh_v(DisasContext *s, arg_rnfvm* a)
> +{
> +    return trans_vsxh_v(s, a);
> +}
> +
> +static bool trans_vsuxw_v(DisasContext *s, arg_rnfvm* a)
> +{
> +    return trans_vsxw_v(s, a);
> +}
> +
> +static bool trans_vsuxe_v(DisasContext *s, arg_rnfvm* a)
> +{
> +    return trans_vsxe_v(s, a);
> +}

> +static inline void vext_ld_index(void *vd, void *v0, target_ulong base,
> +        void *vs2, CPURISCVState *env, uint32_t desc,
> +        vext_get_index_addr get_index_addr,
> +        vext_ld_elem_fn ld_elem,
> +        vext_ld_clear_elem clear_elem,
> +        uint32_t esz, uint32_t msz, uintptr_t ra)

Similar comment about merging vext_ld_index and vext_st_index.


r~


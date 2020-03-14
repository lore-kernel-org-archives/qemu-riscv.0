Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD2bn-00049p-Mk
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2bm-00049Y-0y
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2bl-0003h0-4M
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:57:25 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46928)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD2bk-0003fx-Vp
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:57:25 -0400
Received: by mail-pf1-x441.google.com with SMTP id c19so6748792pfo.13
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KgY6OfSp+ymbGQbvkMcTA1g9zMHOZqHeNAU3qRbRAY0=;
 b=xVsUQjudwT7N1W4+bmgTphW/226w8pOnr/IR+7bYGlYiFkKrbHWMi5r/Z3OPc3aSZX
 hbR3A/0t3vBImH9pD7ECeFCVmdLT3x0803dZXauYcGIsZ7XjU5ezHdOHFHqasyXJFfJA
 Fy/5CPOJ5HV2TTEyrP5bppOsmhfiVzngcoF2yf9K6sM7z1oJXz6f3366Wd2LsNaRGK0J
 sgKFqAKguQJk1dDK/ftSmNaecpTni/OeX+EhKrJ5ix1pa2sElE1hnRT9UJVun7iJOqLl
 AtspSmNPa/5OJqzbdsc0l4qP1FoctvWJxAVl8srJGh9zwXto61Rlu+S/zSdc0wM0DDPg
 HhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KgY6OfSp+ymbGQbvkMcTA1g9zMHOZqHeNAU3qRbRAY0=;
 b=cnl48xhyvIL6V27rMu1EAtYiDwd7ZtwJPGuTFQe4kZQ0fFwV9bwBxK2d3AmW3SgLuO
 GkzX+cP/9hnSuaVl8+Yatvm3Ad50HWuEcPoOI/wARojVMMo7fFJUj+tqSZlCe96tPyQT
 PrPiMhlopbkwHDgWG1xstrigBzlH058anHcxXVIr1yu1SmfMk9VD2e2e5rCsZe4/H7v6
 Ht3uwFcX/uM43asGelIx6qzTHvRTregVJLL+z7Eoz5YUDi77n/EnCXAgZYmC4Wwf3aql
 mLdnRccOGRO3a8W4zjhF57zPf2q/p+onNbzWLF6Q7sHDekxttRVsSDrEnDUWyTnjG2D2
 vQ/g==
X-Gm-Message-State: ANhLgQ1E7JuyKuXEbqg2oYRlcMGJQ5fPj9TF7/863Z5Vzg3BHzAMfHUq
 fOQg7odUJPl0ytp1Ak8UUKpeg0Ng798=
X-Google-Smtp-Source: ADFU+vt3Vbog0guhAXVM+Bx5qiHcAZCaqiaLz8l3iuhR4y0ZQ7c4cys8F5KMoJ8D3Pr6yx/F+l3/WQ==
X-Received: by 2002:a63:9d0c:: with SMTP id i12mr16910096pgd.378.1584176243763; 
 Sat, 14 Mar 2020 01:57:23 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d22sm14282433pja.14.2020.03.14.01.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:57:23 -0700 (PDT)
Subject: Re: [PATCH v5 37/60] target/riscv: vector floating-point
 sign-injection instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-38-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75425609-527e-9691-3306-4eede7ee8ea1@linaro.org>
Date: Sat, 14 Mar 2020 01:57:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-38-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-List-Received-Date: Sat, 14 Mar 2020 08:57:27 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 19 +++++++
>  target/riscv/insn32.decode              |  6 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |  8 +++
>  target/riscv/vector_helper.c            | 76 +++++++++++++++++++++++++
>  4 files changed, 109 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


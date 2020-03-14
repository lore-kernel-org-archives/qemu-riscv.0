Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD1bF-0000pk-Fl
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 03:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD1bD-0000nW-QP
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:52:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD1bC-0008CW-MZ
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:52:47 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43170)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD1bC-00084w-G5
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:52:46 -0400
Received: by mail-pg1-x544.google.com with SMTP id u12so6386579pgb.10
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WFe7DR/lnqsPXYVJ5niqxwU/ERf64ikxyq6h0nS9UaI=;
 b=EbmN94eP7MLe2BzF63ffLVhyvyFh9ajs/OzlgsPmyQ8RWPaVLfS30Dg1uwyLRYRSvk
 SM1SVEPod2I8RRLtfyfYcpGoBNy+j8fmovA81302oqPm4wrdI4MJQpofcisHlxa5rD3L
 BiwCuoZnEVYDl5RO/i18ZbET+uvhhDzV1+bPKtebHVX7ZKW7whys169BcMBxIBL9ik2w
 CXHXwhiX7KvQZGpRBiLvM8IhgJR3kxmO384O9StOf6Tx/zw2dgNktbwi1EQb9pdKx9tc
 rBUtgN0VCUCUgwcqkDSzfJrf1LqLvXsgP1xApOVBaV3UylgHNxP6HeAX91YZ8eGlTAgp
 W+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WFe7DR/lnqsPXYVJ5niqxwU/ERf64ikxyq6h0nS9UaI=;
 b=dgtsLN6q9D2qTAqyKjWqqWCd66/9aIb0NS/97ucwTlDFr38Tm+dj5zum7ekNGyoWBm
 GUVZl8VzEHaE+KhjVYMd+g4SuwcgrpURFmOfxSEE1RrZs4CAWVbgp/UeTBmJcblcINeh
 0N3Ll6LnNti9b7ulpa98F5nHpai5Nkxqrd+PpLM+uOIT2BtXg+durJfi3X3d501LOLL+
 ouFhzhxikWdObFEZFR5oAWsvZHrFcQPxpKmaEOWGWwu7fbbDLtWbsP+y7SO1B+imgqQp
 gUcg9CalUcFD1PfiB4LVmCLdb8i5GfZ5P3Cad2OVyMST5ANLAhdmCRuX5yx8OP/VwUW4
 3JIw==
X-Gm-Message-State: ANhLgQ3OVHJ/+oLYAXmbOQrTfTJbM2b+cdFxdeA34dxm6OxS1rYpz5kR
 /PbF16AYqgGiNPTN0yfcPaNV0BjAdCI=
X-Google-Smtp-Source: ADFU+vvxteoYMtgxAPSg3IpljBhCrqnK/lbilaktgbcOkVEjNK2NFiQyw2uNNN4RNkqrB9EyFqyXxA==
X-Received: by 2002:a62:7d4e:: with SMTP id y75mr7913569pfc.32.1584172365105; 
 Sat, 14 Mar 2020 00:52:45 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d206sm1751809pfd.160.2020.03.14.00.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 00:52:44 -0700 (PDT)
Subject: Re: [PATCH v5 23/60] target/riscv: vector single-width saturating add
 and subtract
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-24-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be948e99-0c65-9f0a-c641-fdf9dec257c6@linaro.org>
Date: Sat, 14 Mar 2020 00:52:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-24-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Sat, 14 Mar 2020 07:52:48 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +/* Vector Single-Width Saturating Add and Subtract */
> +GEN_OPIVV_GVEC_TRANS(vsaddu_vv, usadd)
> +GEN_OPIVV_GVEC_TRANS(vsadd_vv,  ssadd)
> +GEN_OPIVV_GVEC_TRANS(vssubu_vv, ussub)
> +GEN_OPIVV_GVEC_TRANS(vssub_vv,  sssub)
> +GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
> +GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
> +GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
> +GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
> +GEN_OPIVI_TRANS(vsaddu_vi, 1, vsaddu_vx, opivx_check)
> +GEN_OPIVI_TRANS(vsadd_vi, 0, vsadd_vx, opivx_check)

The vxsat bit can't be set by the gvec routines, at least on its own.

For ppc I compute the saturation bit by doing the vector saturating add, the
vector normal add, and comparing the two.  See uses of vscr_sat.

But for now, you can just use your own current out-of-line functions.


r~


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDHxK-0008EP-3d
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 21:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55820)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDHxH-0008EA-7D
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:20:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDHxF-0001eQ-RB
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:20:38 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:36856)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDHxF-0001dM-KH
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:20:37 -0400
Received: by mail-pj1-x1041.google.com with SMTP id nu11so3121321pjb.1
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 18:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W5HNBH4jui6quQMCWhjPPMXVLK0xL9sVCID+Te6wTes=;
 b=zpaacgA9uvt36EOxk82lQGpPO9LmH1Etuwu/r5uVOht1kcyzPyZoyR1fZZ0bFXFlYH
 WMkh4kjXzs8AFSzPmZqWTKYT33PLo5PdDwwFdy5waEzWY8Wfw5pEaEJzcdU1WYEZEtbx
 0jdjDWn4Hr0sJUDhE3PuIaWdgm5Cf38N9BbYu9+XXbOzf9DTa9Jv7TydqAs5QRVf5OOo
 CQtkzKF9M+mfzq0kB6EIu+IZkea9vEX3RaPBT33Lp1sUf8LW08Xkvi/CfxFZg/xidvJQ
 /g1bY+FPV3L3bMIHSnTwDaTXanFftw1zX0MZgqt22YPbItL++/sg4Ym2v24J8rAGpbrk
 UvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W5HNBH4jui6quQMCWhjPPMXVLK0xL9sVCID+Te6wTes=;
 b=Qp8BuO5tp83YCturqHl4YhMOsJLFaIeHWvNAY+hSyjoO61fm+V1YKyY2LFJKbLpm7a
 1mIVKG5VAff/FkjFJo3I+QE/hjFJ5UHwYLYePygYHQPVu4kFn5L9dXelhnNUSs8wudVi
 TZf3PucHCDLtp/jKBm67mSl9H0iphKBgNZ4BAB2cdBCGBVTK99XL4B+dLqnmLpzHjdbY
 YuoCff9uvHcQmE1/671vs1DQFKNz6ZoPfhVODaFRd3JbsQMycPMmZR5OcerROEg6AF5m
 spsuUfVbedU2LmBfMXR9UR+69jXI29LzZBWLVHMPsnCoi1HWPUXkT28w9C/xmuvh4TcJ
 oFsg==
X-Gm-Message-State: ANhLgQ0HcDQ9VmPa/JjC0ZRVDIKLi5cCETqUVTDXgDvnJFrqe8aSctze
 1zHCB19F9d6ByVp4M8KhKJ2zKy/PySM=
X-Google-Smtp-Source: ADFU+vvWJ6z1B6ozI9oJRKksQcBD6gZY5b5ot+mG7LOHyyh/O0SkKflJaQuZngxx6ec6REPTf8vvNQ==
X-Received: by 2002:a17:90a:8d10:: with SMTP id
 c16mr1223905pjo.7.1584235235842; 
 Sat, 14 Mar 2020 18:20:35 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 j4sm767053pfg.133.2020.03.14.18.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 18:20:35 -0700 (PDT)
Subject: Re: [PATCH v5 49/60] target/riscv: vector mask population count vmpopc
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-50-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f0ba29ea-7491-1240-fbbe-53431783195d@linaro.org>
Date: Sat, 14 Mar 2020 18:20:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-50-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-List-Received-Date: Sun, 15 Mar 2020 01:20:40 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
> +        uint32_t desc)
> +{
> +    target_ulong cnt = 0;
> +    uint32_t mlen = vext_mlen(desc);
> +    uint32_t vm = vext_vm(desc);
> +    uint32_t vl = env->vl;
> +    int i;
> +
> +    for (i = 0; i < vl; i++) {
> +        if (vm || vext_elem_mask(v0, mlen, i)) {
> +            if (vext_elem_mask(vs2, mlen, i)) {
> +                cnt++;
> +            }
> +        }
> +    }
> +    return cnt;
> +}

This is ok as-is, so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

But you can do better.

You create an array, similar to arm's pred_esz_masks[],
indexed by log2(mlen).

    mask = pred_mlen_masks[log2_mlen];
    n = vl >> (6 - log2_mlen);
    r = extract32(vl, 0, 6 - log2_mlen);
    if (r) {
        rmask = extract64(mask, 0, r << log2_mlen);
    } else {
        rmask = 0;
    }

    if (vm) {
        for (i = 0; i < n; i++) {
            uint64_t j = ((uint64_t *)vs2)[i];
            cnt += ctpop64(j & mask);
        }
        if (rmask) {
            uint64_t j = ((uint64_t *)vs2)[i];
            cnt += ctpop64(j & rmask);
        }
    } else {
        for (i = 0; i < n; i++) {
            uint64_t j = ((uint64_t *)vs2)[i];
            uint64_t k = ((uint64_t *)v0)[i];
            cnt += ctpop64(j & k & mask);
        }
        if (rmask) {
            uint64_t j = ((uint64_t *)vs2)[i];
            uint64_t k = ((uint64_t *)v0)[i];
            cnt += ctpop64(j & k & rmask);
        }
    }


r~


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jI2H7-0003He-BP
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 23:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jI2H4-0003FD-9t
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:36:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jI2H3-00060B-6J
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:36:42 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:39484)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jI2H3-0005za-1V
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:36:41 -0400
Received: by mail-pj1-x1042.google.com with SMTP id z3so4086893pjr.4
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 20:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uKI2J2kmXTKnljWu7KUTcOr+8EW8JlgRdnzNGpaw77E=;
 b=pghbGcmKrTJW16FKo5OlUOElj4OjjPCAHZvfrSGNlfVg7p07H7MQxN5IK2xgM6E0oP
 JceOX1zAOJjRFIOKzfaczjgBJfERdjq42EJPJJQBfNeKHA74WWK+562ZN2PU0q4yxROE
 +Lz+zPLkRlJesqJOyiQOOpeXRqHv24zq6IMU3DlQGNy9Ab0U27wFDxDZa5rAn9N/wxGP
 Fd8sV2zP/HaioItsmOgBZ59/2uPq9oNYaYsToUiDkk8z5dSP6+YKteKPjfAPv82U6Gc1
 HSV3PEG+f1YI1gehLaEqUXN83/mFGMvDKu6CJaEdL3XEAzNIe0MHLw8hvyOnKkDE2ELP
 xD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uKI2J2kmXTKnljWu7KUTcOr+8EW8JlgRdnzNGpaw77E=;
 b=dEWBGxbIFocqHjB5K5rVne17ajIZyEF7W8jpX+0/L/shkHsAUpd/0Y+o7IlWYhFr/1
 HLufTTrpeP0K5vpAn7g0blk3u/V2zBy4kM1ay2pD1mxhduqNMMXcXLFzV5wcF4NQESQg
 3PE1FZahiCYwsG7v+u9abU0otDlSPS+fzXLQ+iazCQck4CkDR2L0TXpoArGHkpiJEd6v
 iHhb9SmRU7aae8Vz+X6KsInEqDOWxAp641MJq5gfCi0NGMJaLOVYDMlXFOv3kIhFoquz
 6Y/HFe4sjymYqCn8i3v34blOYBFVkcauz0HnZBvjWVG2EdchdMxDP5DC+yMFwJYz75pC
 1ldQ==
X-Gm-Message-State: ANhLgQ1NOJlh9OJ7z5dwewmLTfqaF9WWK3vOByD7185eOLMsXpC8ZwHS
 av5ZJ1IjsrgA/qaGZDzuzgtdYiB7YE8=
X-Google-Smtp-Source: ADFU+vvKyUF24NKwtUCJb0e/3yn3Ei3h9C7Axudc8EL5MneM3UHJWKV9fqyxp+m7M7LclT+nRTN0+A==
X-Received: by 2002:a17:90a:cb0e:: with SMTP id
 z14mr2750126pjt.156.1585366599600; 
 Fri, 27 Mar 2020 20:36:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id b198sm2768647pga.71.2020.03.27.20.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 20:36:38 -0700 (PDT)
Subject: Re: [PATCH v6 55/61] target/riscv: integer extract instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-56-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <07501722-9afa-0a47-bba5-434631335372@linaro.org>
Date: Fri, 27 Mar 2020 20:36:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-56-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Sat, 28 Mar 2020 03:36:43 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> +/* Integer Extract Instruction */
> +static void extract_element(TCGv dest, TCGv_ptr base,
> +                            int ofs, int sew)
> +{
> +    switch (sew) {
> +    case MO_8:
> +        tcg_gen_ld8u_tl(dest, base, ofs);
> +        break;
> +    case MO_16:
> +        tcg_gen_ld16u_tl(dest, base, ofs);
> +        break;
> +    default:
> +        tcg_gen_ld32u_tl(dest, base, ofs);
> +        break;
> +#if TARGET_LONG_BITS == 64
> +    case MO_64:
> +        tcg_gen_ld_i64(dest, base, ofs);
> +        break;
> +#endif
> +    }
> +}

I just remembered that this doesn't handle HOST_WORDS_BIGENDIAN properly -- the
MO_64 case for TARGET_LONG_BITS == 32.

Because we computed the offset for MO_64, not MO_32, we need

    case MO_64:
        if (TARGET_LONG_BITS == 64) {
            tcg_gen_ld_i64(dest, base, ofs);
            break;
        }
#ifdef HOST_WORDS_BIGENDIAN
        ofs += 4;
#endif
        /* fall through */
    case MO_32:
        tcg_gen_ld32u_tl(dest, base, ofs);
        break;
    default:
        g_assert_not_reached();


r~


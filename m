Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCzxv-0005oB-J0
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 02:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37686)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzxs-0005mT-Oo
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:08:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzxr-0002pY-QV
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:08:04 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44474)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCzxr-0002ov-La
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:08:03 -0400
Received: by mail-pf1-x443.google.com with SMTP id b72so6574658pfb.11
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 23:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XBPD79Vw364ME8EB/w2lJqCQeqw00cVsro7Pyhzav04=;
 b=F/GdATK5cQxP/zsEwdVmbSxw1b8g17JZbJ0CCjXBqpHV7BHrrSuT/DnQWgfRXCri59
 T218iTCxVK88cwjQZSDkjh6NQe9xqr9Gpb04fqdZHhPqQtrF+ny/qWK/jWVlZeTcSf5T
 J2k3PJTXXGPM9mUGFoDayHu5IsXnY++zyAN4Bbuoujp5Wh2nTNyLw0/tGEdZHdbxFetR
 joIRQF/LFXZFYgb7TAvx4s2ccbmOhlBOV1HB+B3Q3Acz1lXPOUIL/zIwZPUiqQbu19TH
 qV0BQRsJ9d9lM3YS2IP28liEpz+U1q1+gpFmwv6b4WM9KB2Xp3Oaxlvv38EutrWdp3tr
 Go6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XBPD79Vw364ME8EB/w2lJqCQeqw00cVsro7Pyhzav04=;
 b=rVRhP/1u6CK1G7ovBcelFcIki25lA7A01DcT5ai31R1XblsT/86/CoAM8S2FhiSLbn
 RyEYyM9GqQ2qAEmo4wpmJBnWi38/FR4QIjrxa1H7oCXgOfwvRFG0N6AxsbGgHjxFRQEa
 zZEkdZTKuZJxaTc2aKZbDAKevUUPgrb09xsXE7/879+xSSZ57mT3467eiK+ueOm3sFjx
 /NrKRYk5MruilHd2/XhxeoL6K9o5GH324QKphnnIrsYwUIA4R7I/nF1K9T06kIO11ddI
 VoIlvl1DV2+7ybYCmNQKNB+BC4GZHYKe7WMyiBxfIwmkVhNS8o2lr+6nM4Uets6uNZbM
 k1xw==
X-Gm-Message-State: ANhLgQ1QdfetnddvBaksLBt4Swif3v4s4VtSQTMJqUat/ojUd2PA/M1m
 yTwSNoJZKLlwEeyIEoiYK5FJfdhyeuc=
X-Google-Smtp-Source: ADFU+vvp+YBIYqoMWNRHHFlCI4QYYkTV/R4XIrHvIoJx5RqoIliGzRuCnkhtp7vz1/JTxAjH8KETpA==
X-Received: by 2002:a63:1744:: with SMTP id 4mr17460556pgx.238.1584166082431; 
 Fri, 13 Mar 2020 23:08:02 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 k2sm17686304pgj.16.2020.03.13.23.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 23:08:01 -0700 (PDT)
Subject: Re: [PATCH v5 13/60] target/riscv: vector single-width bit shift
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-14-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b531b581-6920-3195-dc67-4c74cf7c0cab@linaro.org>
Date: Fri, 13 Mar 2020 23:07:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-14-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Sat, 14 Mar 2020 06:08:05 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +#define GEN_OPIVX_GVEC_SHIFT_TRANS(NAME, GVSUF)                               \
> +static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                        \
> +{                                                                             \
> +    if (!opivx_check(s, a)) {                                                 \
> +        return false;                                                         \
> +    }                                                                         \
> +                                                                              \
> +    if (a->vm && s->vl_eq_vlmax) {                                            \
> +        TCGv_i32 src1 = tcg_temp_new_i32();                                   \
> +        TCGv tmp = tcg_temp_new();                                            \
> +        gen_get_gpr(tmp, a->rs1);                                             \
> +        tcg_gen_trunc_tl_i32(src1, tmp);                                      \
> +        tcg_gen_gvec_##GVSUF(8 << s->sew, vreg_ofs(s, a->rd),                 \
> +            vreg_ofs(s, a->rs2), src1, MAXSZ(s), MAXSZ(s));                   \

Incorrect first argument.
Prefer an inline funtion helper.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


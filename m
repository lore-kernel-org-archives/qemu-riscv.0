Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml8PG-0004OW-2N
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 06:38:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8PC-0004Kh-MF
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:38:11 -0500
Received: from [2a00:1450:4864:20::329] (port=36728
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8PA-0006tw-TJ
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:38:10 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso7001432wml.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 03:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sGDrPmKPBfcZau5qX/zItxiGCbUo9zlU7dnLEn5pqg8=;
 b=b/bEWSp8P76Rt937arOSRkBsHaA2QVBv/6OonzbXCzmV4OyuFst5EL0FvJTaDw6I9I
 b7ZglGG+dobfOIufoq7H0Krfo3IZCoH+NNrXHpfnr+uOaQHwhjPt96bGkNsRui5V+WZG
 Z4rSSv69zZvVNQXIdM+G1GdHlqz9ZWK5QXEkLiZoIH00NtiFwbNVj/fUZikU+Td41r5q
 Eqnk2tqO+QSMTY2GhdqrTAXcAJJLuWxyptWr6Z/qILX9rnjmdjlBfPVzCOVmYFKo19r6
 kLl9i792Je8pmRcyIJ7ivHh0q+xVJz2vQB7+tyBCft9KGmAgav344902o3rDgo2f+F7B
 VItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sGDrPmKPBfcZau5qX/zItxiGCbUo9zlU7dnLEn5pqg8=;
 b=WP01spG7X9AbVrJoMLVD93/+bcTL0jTE4uqxnoEh9NShq2kbhj5+HRwh0bL9KMP14s
 Xrtsvq7cShb34kXcdbrrF2iuT413kKIr0hw/TRqCnWLb0k9yd/KmlmPyct60rSgat/xS
 Jfkp3xpjZNsbjts1B7seK/tX9XzhpgilHY7gd6tALuewp4S+kWbNzdUGTqO73PH0Fj+2
 IzIVYd1Ut6srXroqH6qv+OfreWxLagI9Al7f93vZz0n8UvIQwPeFyUuFeBYRGSUGFHnH
 3ngz/w7OoG5j/YPPmQt4L32Umw2pYf+9Cv3hIEYU7Lb26hEXzmuEo2yPANDPDGAR+OKl
 YfTg==
X-Gm-Message-State: AOAM533zIQLVIt/zepxZBeTq7j9L+orMJzDMEgkdLx/kbwrmFCkGYm9h
 lNSxhu9IwNo7OKDjmRzonnrPE0GTE8FJkR86ma4=
X-Google-Smtp-Source: ABdhPJxKdBysrY9YBYAZKX2wnWOSjBG3ylF/Yts9mU+PnUS/sODAI5nJJz9UnA1LsPxgrq4XjVuphg==
X-Received: by 2002:a05:600c:4f10:: with SMTP id
 l16mr7578259wmq.47.1636630686891; 
 Thu, 11 Nov 2021 03:38:06 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id f8sm9184692wmf.2.2021.11.11.03.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:38:06 -0800 (PST)
Subject: Re: [PATCH v3 15/20] target/riscv: Remove VILL field in VTYPE
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-16-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb94ecbb-3328-bc4d-859b-6cdf0076256f@linaro.org>
Date: Thu, 11 Nov 2021 12:38:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-16-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Nov 2021 11:38:11 -0000

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b48c7c346c..5f35217f7d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -106,7 +106,6 @@ FIELD(VTYPE, VLMUL, 0, 2)
>   FIELD(VTYPE, VSEW, 2, 3)
>   FIELD(VTYPE, VEDIV, 5, 2)
>   FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 8)
> -FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)

Hmm.  It's sorta-kinda documentation. Otherwise we might as well remove RESERVED as well, 
and just move the 7 constant into vsetvl.

Either way,
Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~


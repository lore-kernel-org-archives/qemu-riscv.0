Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD1KC-0005R8-99
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 03:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51289)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD1KA-0005Qs-2b
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:35:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD1K8-0002pM-UP
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:35:09 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45098)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD1K8-0002n1-PZ
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:35:08 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b22so5388742pls.12
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=97p4o19ji/8YDQzjFCiIripegoNrIhXFry1xIb5OoRU=;
 b=BIu9NmlkmIAVTmO6PLG3RN/uKB93hH6ER/f0v+6/S4OnpMGGIK609UKDmhM+B0gSdm
 yUrcpPCCaVYMKsLQKYlrDkWxLDfuGRMuFNp0uPIoYjc7OblBnybOhrHEKDxv1XbNPizL
 ndXq5W0yOPAWqAMCXsibo4ckN4EP1tAx7+NODve4aija5n4A5oKVGqI3HqtaxaKLbWEB
 DCNR7aEtYu0gfCfqHZddfFoU3kqOniGsIVw/t8IpDGaMyOuiTgWYaOMa/h7M/UEHEQiV
 AQpcPVW+m3YpBcNZ5Uw5qo9bJvw0yOCn3UppEZw4WCoIi3qr0GrRxOxoPozo0N8zKv1y
 gaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=97p4o19ji/8YDQzjFCiIripegoNrIhXFry1xIb5OoRU=;
 b=cMWuVhdZ9wfERqgWCpI43Vbni+Wff/lt3jJy5oTQiTZm478+aa1FB/gX9nVNuC76AM
 kJxy3toTGLqNRkZg1QtpIiE7bpITIQeISTcSxkt45LmF2lCVjIukYx/DHJpZ6DyqYbi3
 rSlbtbQ+XF2Cgkypdwo9lxz5u2ZcuI0NGTqhpSf9ml8mBZZRPtSEZ7RQhD2c33HSwwxt
 faHeLyrOYsa6KdJryTpUFYZOiN9K5hHd5BKX8VCgq7/1bOoGZXYiSje9qKfoo6w5Dy2f
 dCH6NABN0k3w1hfnfL0W0KaIizGU4PGx0yfmgDXdhKKFm3+/OCkWUVwL1sm/GU8Ja7mp
 4+sA==
X-Gm-Message-State: ANhLgQ2xvkWbJZNdxDimC0J8yDT5GzIYce6q/PbEKS9BNIhINKQYabQh
 oHu/NvLiya/LJ5a2krZQ89JD9km+AWk=
X-Google-Smtp-Source: ADFU+vtup1IQZSJgq1ZkI6xiJIPBTgOU4tyXaLi5fSF/IhPUTcDcnb3jIjiyFQQVdlNvfWIL2l3oJg==
X-Received: by 2002:a17:90b:1b02:: with SMTP id
 nu2mr7352538pjb.95.1584171307326; 
 Sat, 14 Mar 2020 00:35:07 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 e28sm59052212pgn.21.2020.03.14.00.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 00:35:06 -0700 (PDT)
Subject: Re: [PATCH v5 20/60] target/riscv: vector single-width integer
 multiply-add instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-21-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eaf49149-ac2a-fa6b-284d-6827c33acfd6@linaro.org>
Date: Sat, 14 Mar 2020 00:10:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-21-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62c
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
X-List-Received-Date: Sat, 14 Mar 2020 07:35:11 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +#define OPIVX3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)         \
> +static void do_##NAME(void *vd, target_ulong s1, void *vs2, int i)  \
> +{                                                                   \
> +    TX2 s2 = *((T2 *)vs2 + HS2(i));                                 \
> +    TD d = *((TD *)vd + HD(i));                                     \
> +    *((TD *)vd + HD(i)) = OP(s2, (TX1)(T1)(target_long)s1, d);      \
> +}

Change the type of s1?  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


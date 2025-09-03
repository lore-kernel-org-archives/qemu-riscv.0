Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624A9CA1009
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 13:26:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utnVZ-0006bM-PF; Wed, 03 Sep 2025 09:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utnVV-0006ag-MF
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 09:26:37 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utnVT-0000Mo-QE
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 09:26:37 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61e4254271dso6027580a12.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756905993; x=1757510793; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L+R1a6Xx2omEsx85WCdOxhZg1/kv7dg7630bglxmvYE=;
 b=cFwf52tQUa4hgEgjyCrzR0a0oocmKP6fgqwD/CKxtgmVhecxgjCL8pR3sR0LR0SOkS
 vdDBHVd2+78LrU+msX1O+aEtckx+3jZHry/iOUJjpxDvmZ/OgoFr2uWv4sQ5IfNb8NU4
 3kzgid/namsp6adXjaPzTh6zkvjDPQ7Nb1Uh3obgBHhEOOrBsmnlzt4qyzh/B+ph4ZiF
 F9kQwg4uCGOL+XK2IG5PozwxqYFer3shiLnp8UmhFisOcAzI9llOEhKLt8MwYaoES/Yt
 /TSkW3LIoON79RtVaH5Unf64daSZlw4kQFRw1W6eJlKWYfyKEOjtuc+PnBowUXzz3AuD
 NEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756905993; x=1757510793;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L+R1a6Xx2omEsx85WCdOxhZg1/kv7dg7630bglxmvYE=;
 b=WsljqCNUysZ2R+T1zQJfbKxA1HCbC9tSk6NxXB0+PimAGPgIEfNPuliYOHu2kuk46E
 SlbIgdUOxlnW85JnrPusEK7poPaIFqt0Tf+phyGH5TnZfSW0O0gQrE5leSfrHROuZz2T
 8+x5r3rwW31O7rY2N7LXnNq639NvcQPkV5XpfMXZ5iRd1CdWsQJpGUm3t+f7H+i5ZmgM
 BxxkxuqxI5nL9M9xLW0I4aT+9VJ7npb50h9feEpTRB+uzt996S6ywSU0l2rpNAI586hn
 LWsxEdobZl8nxe6hWpAuYnRu9Tdu6KY6igjZhiVtSmyfDee6GuQQAqbSKqemLR3hnxkH
 LuzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJGwol6U+TIIuwPGqV+Xn7k8ApM/l15Y1EwsZPfOL02X8e7KJG3ImpVDFLK33Q5puLvq8faw2CANEz@nongnu.org
X-Gm-Message-State: AOJu0YxZWLVx0xpmv1su4Ae0NsBkyNEFLqH7cfGAxaHCZ6YeYnmxjuVR
 Y1G7KPrdeVFqqCSx+y1QbD3h/2S5+k4ZAXTQy7pw7srjbvFbDeeeeBq7FEUKbi2NB5w=
X-Gm-Gg: ASbGncvJVxi3sUHoD2YajKWxkTq0Yh9fJb1O8H8z4xlw/sF9Pc6urwlF5+3z0pEP7Fg
 qYp75+druf8l9VLvaVNV7Zps6yMs0Yz96p/6S1oARPX7L1yNlT915l00jKOT1/892WrdBOgle/O
 WrNp2BQVmZJhBGevnGoaxKHNXeQGRtxOa7sUKhCcmjMUz6X2fHqSyUpM//Uw/PqgajDS8DYK1BK
 R1pRJ7SiT8U8YADSccwEUjT/+gauzNIlP/iUEwAVlw8UNQ1ytkecFvYw0rw1cStSMkddscedJVJ
 NyioJkFcov1Lm+MC+l3kBDRvpMz3OtCtXZpgssqzZsRPcZpBkvlStl34xp/73GKy+Sof943ecdh
 YPKaBuANbgBBg7Ht0CLhVsd2VljzQOha3ko4BgHmNl6Y4k+ND5QCOEgNiyR56iqpf/egnpeA=
X-Google-Smtp-Source: AGHT+IHgWRZmPddaB7b/fWPTtXZY9TxRv3KNbqiAhM3VKQ0XkPm0zShEQZ1sDG5aPGIJru+Cs+nNRQ==
X-Received: by 2002:a05:6402:4489:b0:61c:4436:a0eb with SMTP id
 4fb4d7f45d1cf-61d26d72fd7mr13293157a12.26.1756905993109; 
 Wed, 03 Sep 2025 06:26:33 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4e50fbsm11670072a12.38.2025.09.03.06.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 06:26:32 -0700 (PDT)
Message-ID: <b70f4859-c520-4a00-b9c5-fd988dc6872a@linaro.org>
Date: Wed, 3 Sep 2025 15:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/3] target/riscv: rvv: Add Zvqdotq support
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250903130125.1701363-1-max.chou@sifive.com>
 <20250903130125.1701363-3-max.chou@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903130125.1701363-3-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 9/3/25 15:01, Max Chou wrote:
> +#define OPMVV_VQDOTQ(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2)          \
> +static void do_##NAME(void *vd, void *vs1, void *vs2, int i)            \
> +{                                                                       \
> +    int idx;                                                            \
> +    T1 r1;                                                              \
> +    T2 r2;                                                              \
> +    TX1 *r1_buf = (TX1 *)vs1 + HD(i);                                   \
> +    TX2 *r2_buf = (TX2 *)vs2 + HD(i);                                   \
> +    TD acc = ((TD *)vd)[HD(i)];                                         \
> +                                                                        \
> +    for (idx = 0; idx < 4; ++idx) {                                     \
> +        r1 = (TD)(*((T1 *)r1_buf + HS1(idx)));                          \
> +        r2 = (TD)(*((T2 *)r2_buf + HS2(idx)));                          \
> +        acc += r1 * r2;                                                 \
Incorrect typing or casting, take your pick.

I suggest

     for (int idx = 0; idx < 4; ++idx) {
         T1 r1 = ((T1 *)r1_buf)[HS1(idx)];
         T2 r2 = ((T2 *)r1_buf)[HS2(idx)];
         acc += (TD)r1 * (TD)r2;
     }


r~


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D944EC4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 20:00:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ryzp7-00037n-SZ; Mon, 22 Apr 2024 15:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ryzoi-0002yH-9Q
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 15:59:13 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ryzoe-0003T8-88
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 15:59:08 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6ed3cafd766so3950745b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Apr 2024 12:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1713815941; x=1714420741; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=snjoLMNruaztj2HBYA7IGbOjxsDc4JO6uI9Q6+OLbns=;
 b=N6zfcdooygkrjAfZWxwOX83OhzYz0xZfMiz9GTKqi98iuQUnNaxeM5o0SfakolQVa4
 V7FId8W8GZiC2Z56v8vBQVbl+LZnUc89L147J8dgi6aQucWd3c2hqnB2qMfN7PIGQ5E8
 p3mEDvHyvr5lwxcPwDSh5MRgncNvOuRiXiyRDig67EumIdOu2vX/pr+CC1/6XOS1zNTU
 XyAX1R+Ht/d8IpXs8eSpTOOpT9dblRjti9D272iAP2QpqfeMHoWvktDbLQRdUcO9de/8
 R6/DL6BCxKWWR3HrENQjrjfqnJ9UvRlxZbArCBGneuSH5aI6g9yGbLeu8kcvyZGNQUTP
 CFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713815941; x=1714420741;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=snjoLMNruaztj2HBYA7IGbOjxsDc4JO6uI9Q6+OLbns=;
 b=JpSvGIPHPTuH0WHPBDvGlZV1u5T42J+bVKgvHDbTachCeNpetYio0tQLXjgjrLzt5q
 apQ0iWLmXiAQpwqPoGC81RFQv+0ZX/XCpXjLwEWOk3QH294ypvx9ZCrWGIUEbEsqImK8
 fdVip2XbXvvot7LZv+qrpN3ysiY6jOJGzF2hKfpR/qz8KdZubG2jBJNrx35ds/0Kf/xQ
 faHBc0DaBphFlW/VKHOyPEuO23YN7pkzRcDTxy5Gp7JaGMLRtOsFqjQuX/Gz7hw3OcUu
 05w5ckSuroosRPDGknds87BX3zeEar7YNvKhe195Nz3ceTSDFGUwQ/5SMZq2fWufZrXO
 BeMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq3CgQxG3i9fU7sGLJoTd6xXyaYpBFhGaVhHJ5VbyU5mrHebb5BdeUI/vDr2R7P25GFu10M6NU1hPY67ekumkZNTw5WHk=
X-Gm-Message-State: AOJu0Yxh4GntovSsdq7KANqL5kyTg3AR6SHKcoy6UcIPkE/MgAwIPAUb
 anfu8ILbkSK+15OQLozsnNnNRIDaJWS48VFDM3P7iw0pMMZ2RIYR2hNKiWAHKmk=
X-Google-Smtp-Source: AGHT+IGI+FqyyPScvtZaTutUceJUBNOSdu6LVi1h0lltVRiJtE75X44C2xVptHGjaVWa7f1sxeIH+g==
X-Received: by 2002:a05:6a00:9386:b0:6ed:2f53:8059 with SMTP id
 ka6-20020a056a00938600b006ed2f538059mr12523867pfb.34.1713815941056; 
 Mon, 22 Apr 2024 12:59:01 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:4196:f8dc:1a46:f594:fa63?
 ([2804:7f0:bcc0:4196:f8dc:1a46:f594:fa63])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a056a00084300b006ecc6c1c67asm8204091pfk.215.2024.04.22.12.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 12:59:00 -0700 (PDT)
Message-ID: <a3b54b5b-005f-46e4-a472-adbbf7d38635@ventanamicro.com>
Date: Mon, 22 Apr 2024 16:58:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: change RISCV_EXCP_SEMIHOST exception number
 to 63
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
References: <20240422135840.1959967-1-cleger@rivosinc.com>
 <b0fcb589-9217-4d30-8b72-5b0210ea871f@ventanamicro.com>
 <73af7008-f40a-4861-8826-2de4d5fc0564@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <73af7008-f40a-4861-8826-2de4d5fc0564@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
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



On 4/22/24 16:44, Richard Henderson wrote:
> On 4/22/24 10:45, Daniel Henrique Barboza wrote:
>> Palmer, Anup,
>>
>> On 4/22/24 10:58, Clément Léger wrote:
>>> The current semihost exception number (16) is a reserved number (range
>>> [16-17]). The upcoming double trap specification uses that number for
>>> the double trap exception. Since the privileged spec (Table 22) defines
>>> ranges for custom uses change the semihosting exception number to 63
>>> which belongs to the range [48-63] in order to avoid any future
>>> collisions with reserved exception.
>>
>>
>> I didn't find any reference to a number for the SEMIHOST exception here:
>>
>>
>> https://github.com/riscv-non-isa/riscv-semihosting
>>
>>
>> Do we have any potential candidates? I would like to avoid, if possible, setting
>> RISCV_EXCP_SEMIHOST to 63 as a band-aid just to replace it later on by the real
>> value.
> 
> RISCV_EXCP_SEMIHOST is internal to the qemu implementation and will never be delivered to the guest.
> 
> I suggest using a number high in the >64 reserved range which will (likely) never be used by any implementation, including ones that *do* define implementation-specific exceptions.  Which seems more likely than not within the "implementation defined" range.
> 
> E.g. target/i386 uses 0x100+n for qemu internal exceptions.

I'm not sure if we have a range for risc-v qemu internal exceptions only. IIRC we don't.

If that's really the case I believe we could use whatever i386/ARM uses. At least we'll have some
standardization.


Thanks,

Daniel

> 
> But in any case, the number can be redefined at will and not cause compatibility issues.
> 
> 
> r~


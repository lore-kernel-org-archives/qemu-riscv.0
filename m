Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8A7C4829E
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 20:03:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rahx5-0002iV-G3; Thu, 15 Feb 2024 15:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rahx3-0002fR-D2
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 15:03:21 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rahx1-0003SJ-W8
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 15:03:21 -0500
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-364e819fe93so4635025ab.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Feb 2024 12:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708027397; x=1708632197; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hV7m/yFuhhEeiyh28P6oKjcSbDOB+OMGn198eFDqX0Q=;
 b=wjix1vFwMabeFxsLnTeCTMtEgTY6KorBzTrbWaq5n70iJCmLPg6rUPB3cFa2RbXkw8
 DmnoWgBzwooG0uAC68QwOkqw3Pf5tr19ozUV9r7aIRzisS2qtv0pgqBAVbBsPpjEUM+c
 dYstyGHsQLq9s21+ZHcXzsiaSXak6lO6vymE8XcAFk8hQ7+V4ncFbfAz9HFSHYLwWVNO
 oi9pX2MQZHZKZaiSKNdMY21xZbvfDHL69/ypejSK2chFvtx1dx35fgDe/jmW7jOIE2f3
 9J2KZGrM1P+2V2vsciZ8zuf/znRkkZEkcXqxH6CTUPBCxHO1o/kwDFM6eh0Jkz2Hslv3
 MTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708027397; x=1708632197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hV7m/yFuhhEeiyh28P6oKjcSbDOB+OMGn198eFDqX0Q=;
 b=YXNmu3QJ4oKXpk++q98qSKiQT+tTR1q9ZjW6wysESyNqr6snGaKZWBy+IB6C63Ptpy
 UDFXu8Z7LeYdO5V2ppvulC4gmR1S4A35lHWrJeKR4hioyx8VF28MRc9Wh2FdvqugcqPg
 Ys3u/wvnpmGdbQQFNE7Qz4f9fuIX2DKZ/x6wQXDHDK1NAABTBLTe1GkJxFqL6YAKhsdZ
 y6armXKyJKLs8iNoP2+6hw1FT62Y6NvYJRgiICt8XFE1U6zpfcdjPJSvUGsVrOKv554S
 rw2eo3rlVJeX5CU4gVdOi2RJNm5HTA0/FrO+VMxLYth1nvC2emRmSmZeo6vhM0Yq9/FU
 KQcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWptPIISahQeFfk46kBQ5EvbT6tC2XN6Hfx95jcMubZPfghHLdZ67vDBPVravv66pM4ffFsAr2pLnOTKkbLdlcv4cavmmQ=
X-Gm-Message-State: AOJu0YyJ2VSAIrV04IwJ+gna2v/3sS11AheyC4LTlk7tMAYfnx/xWAyT
 wsiRUI08lnPVDR5r3BBSLmwmRb3MuoMFn5DJd1rBFNbDf9IbC7YBgjWRlatBJV8=
X-Google-Smtp-Source: AGHT+IHZurs5p0OmYiI073GJyf1yzmHbWc6xLDhpUaE+zam/D6rfRFO3otxjzl3MQ9hxHMn0fiqGIA==
X-Received: by 2002:a05:6e02:13ef:b0:363:c5c9:deb4 with SMTP id
 w15-20020a056e0213ef00b00363c5c9deb4mr2819417ilj.14.1708027397526; 
 Thu, 15 Feb 2024 12:03:17 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 w4-20020a636204000000b005cfbf96c733sm1769301pgb.30.2024.02.15.12.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 12:03:17 -0800 (PST)
Message-ID: <0d95525a-8307-4c89-9045-68130b44f095@linaro.org>
Date: Thu, 15 Feb 2024 10:03:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] accel/tcg: Avoid uncessary call overhead from
 qemu_plugin_vcpu_mem_cb
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Paolo Bonzini <pbonzini@redhat.com>
References: <20240215192823.729209-1-max.chou@sifive.com>
 <20240215192823.729209-3-max.chou@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240215192823.729209-3-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2/15/24 09:28, Max Chou wrote:
> If there are not any QEMU plugin memory callback functions, checking
> before calling the qemu_plugin_vcpu_mem_cb function can reduce the
> function call overhead.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   accel/tcg/ldst_common.c.inc | 40 +++++++++++++++++++++++++++----------
>   1 file changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/accel/tcg/ldst_common.c.inc b/accel/tcg/ldst_common.c.inc
> index c82048e377e..bf24986c562 100644
> --- a/accel/tcg/ldst_common.c.inc
> +++ b/accel/tcg/ldst_common.c.inc
> @@ -134,7 +134,9 @@ uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr, MemOpIdx oi, uintptr_t ra)
>   
>       tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_UB);
>       ret = do_ld1_mmu(env_cpu(env), addr, oi, ra, MMU_DATA_LOAD);
> -    plugin_load_cb(env, addr, oi);
> +    if (cpu_plugin_mem_cbs_enabled(env_cpu(env))) {
> +        plugin_load_cb(env, addr, oi);
> +    }
>       return ret;
>   }

Rather than repeating N times, modify plugin_load_cb and plugin_store_cb just above to 
avoid the call to cpu_plugin_mem_cbs_enabled().  I expect the compiler is inlining those 
functions already.


r~


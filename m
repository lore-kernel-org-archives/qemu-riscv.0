Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mreBx-0003fw-I6
	for mharc-qemu-riscv@gnu.org; Mon, 29 Nov 2021 05:47:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mreBw-0003cW-3Y
 for qemu-riscv@nongnu.org; Mon, 29 Nov 2021 05:47:24 -0500
Received: from [2a00:1450:4864:20::32a] (port=35502
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mreBu-0006E9-5r
 for qemu-riscv@nongnu.org; Mon, 29 Nov 2021 05:47:23 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so16467515wme.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Nov 2021 02:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o2wHHfe0vGINK7x8GzGCiuiv2CBDTcXn6oevB8Zcspw=;
 b=jqWOqOL+xzOlP34eio9WukXgsxmHbyXPdCj7g2tqgBepfWVfEkD+w0RXDNV3665hlo
 ijRWtm7Uxz1fpsdHKYRzp2cdtx5N5dQn8H/7flwUfsFw31gIsoa94ikdBd8zyz7ShRdr
 QPMUtKdqRMpF3o+93LgWktn03fx+fSpEydKUU3DojRdeoyspxuzMhF9LaO4c/vzl/HOT
 yBjtyl2lCbl5zkH26Txyh1QCRcZH9lPFQPdT57ZmQ9XIHYi+mue/QF9Bf5q6+RvujSu2
 BK00lMSKwGg6kmN4aJvZNAIZCcrV+pSR5ol8R2BiMGrkvlnmZ4INW/FPuCFV2nidLuyT
 T+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o2wHHfe0vGINK7x8GzGCiuiv2CBDTcXn6oevB8Zcspw=;
 b=e7KJfoZns9sP7PwooYOHVJn2FyxRmAi5tmZ2NXUOAPX4FAvRZt/SEaYYXCTiDydoWr
 vbyrN9/1VnR/JcJmijZtIn0ka6fP6AhsOT5jWFOol/ceg0BHD4U1xv1jQ2E6VUXK611f
 +gCj0VHpnE0U8i5Ta/QSdKWizys2RcJYlmXq4aiwjoEfYyTDVYwNJnSFDbY/HxfQQQ2h
 GH451P1GylB5SjWaKd4vH4QLo54UqfCL2xgyZlaUVGhDx/Fz1MRtuZULMMJKR5GhNVpD
 BLUJu4vjy4fDCT13RxekR4I6LChBt/zwVVvLmRWxFYP416NsZ+fy1DynBQ9fGz2h/LTn
 5czQ==
X-Gm-Message-State: AOAM530t62/rMOX95X65ibBOsJX8/Zoc8JFJzs5aN/HhAa1/4rBuepw1
 TLalBEYCprqjNcXxAMY6pEwJMg==
X-Google-Smtp-Source: ABdhPJx11muBPrqqSGxD/YWpctvnkMx75uWVjbParE+Xy3unb3B1w0nA9m6OrQP6EsQl8HS0niNLZA==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr35002939wml.148.1638182840771; 
 Mon, 29 Nov 2021 02:47:20 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id k37sm16236627wms.21.2021.11.29.02.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 02:47:20 -0800 (PST)
Subject: Re: [PATCH v6 00/18] Adding partial support for 128-bit riscv target
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd23bbf0-fef2-4665-4e70-820b1b787f46@linaro.org>
Date: Mon, 29 Nov 2021 11:47:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
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
X-List-Received-Date: Mon, 29 Nov 2021 10:47:24 -0000

On 11/28/21 2:57 PM, Frédéric Pétrot wrote:
> This series of patches provides partial 128-bit support for the riscv
> target architecture, namely RVI and RVM, with minimal csr support.
> 
> Thanks again for the reviews and suggestions.
> 
> v6:
> - support for '-cpu rv128' in qemu-system-riscv64 to handle 128-bit
>    executables (no more qemu-system-riscv128)
> - remove useless (and buggy) big-endian support in lq/sq

It seems like you haven't tested this with linux-user?
There are build problems:

In file included from /home/rth/qemu/qemu/include/semihosting/console.h:12,
                  from ../qemu/linux-user/semihost.c:14:
../qemu/target/riscv/cpu.h:485:33: error: unknown type name ‘Int128’
   485 |                                 Int128 *ret_value,
       |                                 ^~~~~~
../qemu/target/riscv/cpu.h:486:33: error: unknown type name ‘Int128’
   486 |                                 Int128 new_value, Int128 write_mask);
       |                                 ^~~~~~
../qemu/target/riscv/cpu.h:486:51: error: unknown type name ‘Int128’
   486 |                                 Int128 new_value, Int128 write_mask);
       |                                                   ^~~~~~
../qemu/target/riscv/cpu.h:489:48: error: unknown type name ‘Int128’
   489 |                                                Int128 *ret_value);
       |                                                ^~~~~~
../qemu/target/riscv/cpu.h:491:46: error: unknown type name ‘Int128’
   491 |                                              Int128 new_value);
       |                                              ^~~~~~
../qemu/target/riscv/cpu.h:499:5: error: unknown type name ‘riscv_csr_read128_fn’
   499 |     riscv_csr_read128_fn read128;
       |     ^~~~~~~~~~~~~~~~~~~~
../qemu/target/riscv/cpu.h:500:5: error: unknown type name ‘riscv_csr_write128_fn’
   500 |     riscv_csr_write128_fn write128;
       |     ^~~~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.


r~


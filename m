Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ka2lz-0000Tc-MJ
	for mharc-qemu-riscv@gnu.org; Tue, 03 Nov 2020 15:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2ly-0000T4-3g
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 15:19:18 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:35850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2lv-0004jJ-Iw
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 15:19:17 -0500
Received: by mail-pl1-x644.google.com with SMTP id r10so9119234plx.3
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2020 12:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x6pXh4aRBSyPzYfa17BxQgnlCZXgfoNB+XRA7mzNFCY=;
 b=Kiy5jTRSiWSl/7LjGcah3Chve7owPmVV82NN3ZFGREsDp4UMG70BdjEUE+LjAXtKez
 J+lcH4qJt85Rn70KQNqHIDvlNTRhfWs/H4njtL9sX7va46N+TrUYTiPWr5ziWgLBWoR6
 p9Kl3kYO/VrJTO14F1vmpO58Bagzm1LxopfqB59BcigDW2hfPhYjmTTryhwf8vcCwRLR
 FThi9x/VW2bMxsZuHbS4E6vjGgXCJihdz71EHmh2wZ8jtEx9G2KVxPH5Lcxi4HJjEKRA
 ZONxIg1gl8nTKSbnEzQ75sGBfR1dRsc2vC4fWYhnZEwhah5RS7oEDIRbX+k009u79Zxk
 g3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x6pXh4aRBSyPzYfa17BxQgnlCZXgfoNB+XRA7mzNFCY=;
 b=QDkX/1NBNgBRRwRe78AN/bB3vmBRri8iZ5fqwwiHwhNDVJKWygRLfmjshuG3GQxkTy
 ommwMKrNP4nYXpiQsuQUlFPRLMBGLEQwRy1bwmNcqStS158ZIdQ43HhvKKXuSX/fAQZ8
 1XqXkneN1oVbkeX0DwdvVErVusHCXL2O92Pxf8UmjFZ/HwZDGpk33gEYcPcxz087GJt3
 oJAwsVSXZdVOY1CZu0beWZ0Bibest/bt0A+2QPYnAYHkiTSUeFB39QtbAY2vQ9k+IlV3
 D7Ummj3uAteoLoZK1WPW319/olnTm+m6rDNdtQXAaJP7UwZFHJjSKe8DWNZC268dzZV8
 6Flw==
X-Gm-Message-State: AOAM5315/gRtgOko2FajIl5V22THrn7kaN4btZrsDpn21md5TIqjU0oN
 texxFjk8+gcohCunsbwXTxzniQ==
X-Google-Smtp-Source: ABdhPJyYKCPZnOulr5fQjkKw40Z5P0ru4MbUMimxYjNJvckGOInVwX3Ikb0Odhs0+R3Y4nArboPWbA==
X-Received: by 2002:a17:902:7e47:b029:d6:c9f2:d50 with SMTP id
 a7-20020a1709027e47b02900d6c9f20d50mr10640117pln.81.1604434754025; 
 Tue, 03 Nov 2020 12:19:14 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id h5sm11318859pfk.126.2020.11.03.12.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 12:19:11 -0800 (PST)
Subject: Re: [PATCH v3 1/7] target/riscv: Merge m/vsstatus and m/vsstatush
 into one uint64_t unit
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1604432950.git.alistair.francis@wdc.com>
 <df31a53b141fb540eeaf1ca4da1f9e7d3c2e6238.1604432950.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c67bcb2-7baf-2b43-38dd-1ae83de43e85@linaro.org>
Date: Tue, 3 Nov 2020 12:19:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <df31a53b141fb540eeaf1ca4da1f9e7d3c2e6238.1604432950.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 03 Nov 2020 20:19:18 -0000

On 11/3/20 11:50 AM, Alistair Francis wrote:
> From: Yifei Jiang <jiangyifei@huawei.com>
> 
> mstatus/mstatush and vsstatus/vsstatush are two halved for RISCV32.
> This patch expands mstatus and vsstatus to uint64_t instead of
> target_ulong so that it can be saved as one unit and reduce some
> ifdefs in the code.
> 
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-id: 20201026115530.304-2-jiangyifei@huawei.com
> ---
>  target/riscv/cpu.h        | 24 +++++++++++-------------
>  target/riscv/cpu_bits.h   | 19 ++++---------------
>  target/riscv/cpu.c        |  8 +++++---
>  target/riscv/cpu_helper.c | 35 +++++++----------------------------
>  target/riscv/csr.c        | 18 ++++++++++--------
>  target/riscv/op_helper.c  | 11 ++++-------
>  6 files changed, 41 insertions(+), 74 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMZYU-00018x-1u
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 14:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZYS-00018X-PR
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 14:11:00 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZYQ-0003Zo-8C
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 14:11:00 -0500
Received: by mail-pf1-x435.google.com with SMTP id g9so6501995pfk.13
 for <qemu-riscv@nongnu.org>; Mon, 30 Jan 2023 11:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jfHhhU3bFDCetWKtYvyRha2axzIIOzKm5h+ejV8e/SA=;
 b=lQ46ZiBmgH1cOvm7meD8SxY0ojfRrfN0XBslN4Jv9Rd88vSBqD/2AQQRPsUiOoxIBU
 8zrEG1IBFdjlPjgClm5RgDMaFmeng7c1i1dK7DAxS5/ItST5WJpZQGzcxBMC2W1rTl4V
 w5gNETLFXYdZGhuzWlWo5weOlGMHka+OZrs91woA+Ky/92d5753QMpCxyrR7M+xzrEmg
 M8kPr2WmgAyX34OLNRah1l8BSrAl0IddTxPuAsgE2vZf/J0m1aSbVflES1bNVls6ZBl0
 pTSgY/7yvJ6XvNeFQdgIEOWo5v312nPLIAim8BWAQSKiEZAgRdIrZ50C8vSXp4ZEax/+
 rF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jfHhhU3bFDCetWKtYvyRha2axzIIOzKm5h+ejV8e/SA=;
 b=Yt0fN+57dRpmmINnDrrU/OIrSnOaU1qu57bGKNQG2AjqiKF1QRLrbduTX/7xSey2m0
 bkr0pC5w1+EXqknhpqJ7j3JJl0zmFdEU8TODgq04hEPnLv5vB1azAHWtWVsFRD2Qu+cB
 jw2V5Le/PD/N/P4JkGUpSjFdN62B5n6V3SMnFtctWdWXYjTBBJg8BYRVvsyX+oE7e0hO
 c5cePwkHNjwHoumKlTr5er834V97Rw/7CtIJoIP0Ep5Lhzx9XQR2rQ+kvP+DTLo2azw7
 eJ1ZEXtjazYhKh0y9MC0YPozt8qjGRDl4CvEH7HFyW4L2H0wo7inHmsAO6ZTe39j5O+d
 w9nQ==
X-Gm-Message-State: AO0yUKXpocsmVvFTOMimwI+ZyLGK6WysqCFzCkKvn1QYhbswJTloH/a+
 d5L/UPSpT6qmvGuEY0zfSEyXnA==
X-Google-Smtp-Source: AK7set9StGeCUtzUW+NpMV7IQ/xLQUzO1DjErClR9wqToaF+L6j6HibHZaW4WmAsOIxs99H6BKJdXw==
X-Received: by 2002:a62:174d:0:b0:590:5d87:e947 with SMTP id
 74-20020a62174d000000b005905d87e947mr9232365pfx.23.1675105856602; 
 Mon, 30 Jan 2023 11:10:56 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 y5-20020aa79e05000000b00593b72f6680sm2885314pfq.86.2023.01.30.11.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 11:10:56 -0800 (PST)
Message-ID: <22ab5f33-5ab7-7260-391f-375cd98a68ae@linaro.org>
Date: Mon, 30 Jan 2023 09:10:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/riscv: set tval for triggered watchpoints
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>
References: <20230130100757.721372-1-geomatsi@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230130100757.721372-1-geomatsi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 30 Jan 2023 19:11:01 -0000

On 1/30/23 00:07, Sergey Matyukevich wrote:
> From: Sergey Matyukevich<sergey.matyukevich@syntacore.com>
> 
> According to priviledged spec, if [sm]tval is written with a nonzero
> value when a breakpoint exception occurs, then [sm]tval will contain
> the faulting virtual address. Set tval to hit address when breakpoint
> exception is triggered by hardware watchpoint.
> 
> Signed-off-by: Sergey Matyukevich<sergey.matyukevich@syntacore.com>
> ---
>   target/riscv/cpu_helper.c | 3 +++
>   target/riscv/debug.c      | 1 +
>   2 files changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


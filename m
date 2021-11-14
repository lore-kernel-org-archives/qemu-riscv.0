Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmEwx-0005RF-Lr
	for mharc-qemu-riscv@gnu.org; Sun, 14 Nov 2021 07:49:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmEwv-0005Qk-SW
 for qemu-riscv@nongnu.org; Sun, 14 Nov 2021 07:49:33 -0500
Received: from [2a00:1450:4864:20::32e] (port=36469
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmEwt-0008To-5t
 for qemu-riscv@nongnu.org; Sun, 14 Nov 2021 07:49:33 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso13528702wml.1
 for <qemu-riscv@nongnu.org>; Sun, 14 Nov 2021 04:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=64gnf7OEU6vtYppEekQ9uumBMuERG1RHir8D4b/tj1k=;
 b=WQsoiNqRBLDVDIiy5ccYlFGxa6sq76AHNi7QOKpk31zjt8/w6ASKu3S5inqvVG5yLZ
 ta0f+YNmExpy4DKP5AUhphOOH3bHWFElEYt1OaVrWnWmTvg+aBX/N5EVnsOyPYptFDTy
 YWu7knk9EWOpzoRss7XYCCw2P0RjHp+Me4t3DbH7rp+6zbFwthDVJZtV8OkoiXd3DI2j
 mhol/+kqnvxYPzIieCdWnDid+burovVZB+BwawME7/iT6/Bqv/y7/9husTqdYe84BqN/
 Ar9WHQh5VGfNAoUMSjVldfox5SFb6Yr+GyZuyTBQV/6sm6uWwTKQbuiaNnciLHlvJw/y
 rBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=64gnf7OEU6vtYppEekQ9uumBMuERG1RHir8D4b/tj1k=;
 b=xHZV+8N3PoGp4A0v3L9MLkcwk7rO5f+zcfuGxDFCBtB3SiSwWkWFWTBnkmGqPiQjkd
 GO1ll8kLTyvh/BGKeGre1hF1LWtjCpxdq2Ioz11Z4QbGjnBvY/uf1S6SbjYLmJ97ESDq
 pgsV9rn4RoNkmaX1Dp93MFWUXrdaB8nqBqYewRnyoXHgRlQhSn0IrrWWMaB5NZ42cKH+
 koPpGLdcssfU+CJQOdugBzTeGez/74fVe5WkeW0q3L+Dv8CpU64/F2M4ykEilvD73BGG
 Dlwsr1s7zmB6tDjs/403Hwwi6JP66yZCaFimUuqh495ASRmSDW04oTyFHWMz5c+r2QG1
 IijA==
X-Gm-Message-State: AOAM533l8227yemTE/VwYe5hWeM3jT9uN316e4cQZ8+HB7WPaKxPumdW
 LdJYfDjfjeqxPt6ZERJwFa50cA==
X-Google-Smtp-Source: ABdhPJxQTZspoMDsbA4TaVNgx99ZUSk9SbySADR4NOnmJ230TQq+aAEWvN3lNMRwvlZwnjNJ9FyIqg==
X-Received: by 2002:a05:600c:1c8d:: with SMTP id
 k13mr50641719wms.177.1636894169192; 
 Sun, 14 Nov 2021 04:49:29 -0800 (PST)
Received: from [192.168.8.105] (60.red-95-126-179.staticip.rima-tde.net.
 [95.126.179.60])
 by smtp.gmail.com with ESMTPSA id g5sm16690867wri.45.2021.11.14.04.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 04:49:28 -0800 (PST)
Subject: Re: [PATCH v5 01/18] exec/memop: Adding signedness to quad definitions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-2-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd4da247-4849-48f8-f9b4-aa312a370cd6@linaro.org>
Date: Sun, 14 Nov 2021 13:49:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211112145902.205131-2-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.402,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 14 Nov 2021 12:49:34 -0000

On 11/12/21 3:58 PM, Frédéric Pétrot wrote:
> Renaming defines for quad in their various forms so that their signedness is
> now explicit.
> Done using git grep as suggested by Philippe, with a bit of hand edition to
> keep assignments aligned.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


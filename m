Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhtU4-0006EK-7k
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 09:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhtU2-0006Az-Hy
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 09:05:46 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:46983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhtU0-0005dU-WB
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 09:05:46 -0400
Received: by mail-qk1-x72d.google.com with SMTP id bl12so5232147qkb.13
 for <qemu-riscv@nongnu.org>; Tue, 02 Nov 2021 06:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cy8h+qEhvfF8y2oclsgLmxcXQNfqPttopW147oQ1Uss=;
 b=R/nqxFy5bSfcC72A446EZwdoAl+4tcrVqrlCkFB6XwoelQSpc6hUdbHuAiA34KxQLn
 8LEKkU89Jm88yjg7q4Y9BPwnKdsH538Y6lURTGJ3dqNOMZ9BNwlWaobwWsGm/qBCmFmy
 lvq9ltdsR5hn4Zj3zcWQM4J29LpVYOA1Dlmc3Bk9T0uNteKEVHGtlfWrwHJZ8XIVZnLJ
 WkdiGP68yPkxZ3cLZSf4C79h8gB6jLabp83Bp53ZYrlEOFGxKLKqhouln/22vC1Mi2tS
 VDBUfF2QYBrmslPVXBPBw/WPeyU4OHC4UoiJTKUa1ejfPCvathbtLrveczbTC8UpP9gR
 RI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cy8h+qEhvfF8y2oclsgLmxcXQNfqPttopW147oQ1Uss=;
 b=3vUF+i8pnTjDxpOYDaOOoOroPkooXHWktUZ389Vu57BdeQryuSBVIuBAiOMBpuNIjD
 +1zXrUmyQEpYX6Cpm1w2qBaRKBPEYoc2pDkj9XuwB+ptapR/IxI0nZdZ+XlBvScEV574
 wzW8z6c0SiZAgsx6hiifimxzur4J8e/CM6WjjM4tfAGyDj1hiMK9eM4zrWoG+0Hpgv/B
 BkyGjNCXvPgo/ObcYsEEDVZuadVK8tr/5Kmv1NuCmAA7waVaGkHCP6kzkPErjNAfsze4
 zAWssdk5NOpzbckaBaJyqs1IZ8ThaKhPa3aiZKM5ys4qf+oPNAn7i6ox0olt7fGq3215
 m9vg==
X-Gm-Message-State: AOAM531UiYbqPX+z+82O9VhvC4Ro3HoDyI09uFnQBosr75yoCOzmoPz8
 xWBAJIQacefhrFXV0oJJLx6+7A==
X-Google-Smtp-Source: ABdhPJwSWM+w7/A1N4rR0gO/UVJtS7qBiPgK5IoGZJt4HyTPsYA1Xt4pG0canvB/bjG3x//YNse8/w==
X-Received: by 2002:a37:68cd:: with SMTP id
 d196mr23918655qkc.490.1635858343713; 
 Tue, 02 Nov 2021 06:05:43 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id s22sm13125231qko.88.2021.11.02.06.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 06:05:43 -0700 (PDT)
Subject: Re: [PATCH v4 13/17] target/riscv: support for 128-bit M extension
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-14-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6c7f698-a23f-7f62-657f-91abd22ab27e@linaro.org>
Date: Tue, 2 Nov 2021 09:05:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-14-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Tue, 02 Nov 2021 13:05:46 -0000

On 10/25/21 8:28 AM, Frédéric Pétrot wrote:
> +static void gen_mulu2_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, TCGv bh)

This should be named gen_mulhu_i128.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


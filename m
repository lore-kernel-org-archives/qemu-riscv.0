Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn1zk-0002P7-J7
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 11:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1zi-0002Lz-8d
 for qemu-riscv@nongnu.org; Wed, 09 Dec 2020 11:07:10 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1zf-0006Ty-So
 for qemu-riscv@nongnu.org; Wed, 09 Dec 2020 11:07:09 -0500
Received: by mail-oi1-x241.google.com with SMTP id v85so2231534oia.6
 for <qemu-riscv@nongnu.org>; Wed, 09 Dec 2020 08:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kb7f9G+X5qvtFcUePdn3CbJeF7xIHGBTh3nzE/WNNjg=;
 b=BnselUvm9RSyQmzEodPnQVYTsi4/WLBlWLYgSfR/dWQ1P/oP11sPXsf865cNUD7iAd
 farQinQKPC4WSeJD2s2YtneAhc2dR3a/O7Jtf5/UJqHdTIPe883JCR7e6oJ6kuPY0iR3
 Z6M7f/kHphXODv++nstSt+TDNxXJHvQW7or9jHo9+TgKEtSj+XNr1N4iEMfntFvVIrgh
 RGTnXXA6WKaeW6GiNGNaq/XuSjeLaQ3C1+bKFBC6gHTP5NoHL14BF6YAi83sGYnVfgiw
 o/tmxqiNC7Y0MwGz/4MAOUFEQT3qi/9Ai+PhloqaV0szgi3FRbD7UGv/IRcwXWryg/Sq
 1gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kb7f9G+X5qvtFcUePdn3CbJeF7xIHGBTh3nzE/WNNjg=;
 b=s6hMyGB0qVCplC/Ft/c+OXoLRi730V8791vzVJxjEWIkl24QVMb4hCSlcIas6XY3YB
 prtc2/3iuuJlnmdauftZ4FWe4Zu8/QtjBemDEpjmvK3TP0qBZjJ68qumS+uksUFWF/o6
 TEpLbK5Umd+0qNsYXQXc3LZR7WZtCNlIQxZsSoAMq6ife6hLffP6ORcoChFrmuLrKqRZ
 RFJBDrdVxSLZT3x6XGuPNVqYCZzWtWdVyt7sNJIqXH9VJ8Wq1KCwcYNf/DRTDT2mimhv
 Nha1ICW0olwWLMazygLpyt9pHpoOMCmvtXOaGdB1EuZ00ueJe5ZJvRXL59upH+90xZDC
 4Hyw==
X-Gm-Message-State: AOAM530PJIzUyFfeGEN8IAp09r7EP21Yon9gbOotqm6r4y3ocnN9T2w/
 qllhw4ibgIM2aMxico6c3rr/EQ==
X-Google-Smtp-Source: ABdhPJwo1MNWmk6u9Lfa4hlnHVFuhCuouFEMEVLJYh32p89UpwMSXUyc3VsZq/NWtbKdmOhYrmVYBQ==
X-Received: by 2002:aca:5197:: with SMTP id f145mr2266597oib.71.1607530026592; 
 Wed, 09 Dec 2020 08:07:06 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y8sm163896oix.43.2020.12.09.08.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 08:07:05 -0800 (PST)
Subject: Re: [PATCH v2 13/15] target/riscv: cpu_helper: Remove compile time
 XLEN checks
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <bfd448b85f5858e24281e14cf6ae69d512efa685.1607467819.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea1a41be-0f38-213b-3ced-fde83a66177e@linaro.org>
Date: Wed, 9 Dec 2020 10:07:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bfd448b85f5858e24281e14cf6ae69d512efa685.1607467819.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 09 Dec 2020 16:07:10 -0000

On 12/8/20 4:56 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


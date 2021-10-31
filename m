Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mh1m3-0000m5-Al
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 23:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mh1lw-0000lj-0k
 for qemu-riscv@nongnu.org; Sat, 30 Oct 2021 23:44:40 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mh1lt-0006Ci-8n
 for qemu-riscv@nongnu.org; Sat, 30 Oct 2021 23:44:39 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 127so13155918pfu.1
 for <qemu-riscv@nongnu.org>; Sat, 30 Oct 2021 20:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W8jceKuqxT0Up5paSHFyk9hoNMqq34CniF+7ic8MR5c=;
 b=JO6qS2zGKvFCZqeMljRHX3cVSOTc6FFdNi45uImpEYUMGCTeOGueonoFcUn0iBNFFg
 DsD1uqPLXnL3QmW2163uJHedu1heUaQedVQumrs29keowiEV60DDgQaFTlZ3TTEpPG1S
 atBQ/+PwlTt+LygFtCcJ2RkXWjxSFGEgFfAKuBi/6C3cERb1Cy2VPsinleVq/hO0kMoI
 0AVK9Eej7/nX63LMlwXBi8qpOAVAEplfE/r16NwhlT5abE0EWd0cNHclzi9p+5B8Jfxc
 xV3PRWzBFoDJ2LlC54xhxLzxvTM2JPrSctomDkSiv/2cvydEihdQQ/4yUS1CB6M1mEqL
 d6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W8jceKuqxT0Up5paSHFyk9hoNMqq34CniF+7ic8MR5c=;
 b=aGS7eiU9QEDjPNx3/AeFxvQ6oqVOtmo0Fj2EabBacKXWB5Lf2s3ZvxuVBZSK3XmJo4
 jXOGTN3a7XPodWsq9A4DRD0PgMEsmVQWA8UrrRR12HOtWTB+Xgpxgth/MzvWvFwIQ4Is
 fs5r6xYMXqlHJq3A5ut+4Lbgh1xv5jejmTetgFqEAS0pltyqH5hBTjzwA2o9n1PUS1hz
 +pI179YGEFAFxqSMBfL792fw6N9Kl+LiadeYbSUuEp+df6YplhhzRCBCccr7TADLlA4n
 LxaXbJ/v+YMs4lRIdmMDLO9l8RQ2y/kfOEhueRgCkeLO+gMBKi5M6spNo6tKkxQfQv4l
 0Sag==
X-Gm-Message-State: AOAM531p9zFiNeOOLlkk1x+8oNEik29OV8pgrblfZmdRFi2sekCYim5v
 GR58i9qFZy1y7JO6r9TNfmMHhA==
X-Google-Smtp-Source: ABdhPJzBAWkfE99abpCu8nvS+AlG0zFAPNJa/OHitbQMGGB+kms0ddPOHu/fzohnuyGGWqJyrPAZ3g==
X-Received: by 2002:a63:b706:: with SMTP id t6mr15524334pgf.11.1635651874952; 
 Sat, 30 Oct 2021 20:44:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id l21sm1748986pjt.24.2021.10.30.20.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 20:44:34 -0700 (PDT)
Subject: Re: [PATCH v4 09/17] target/riscv: support for 128-bit bitwise
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-10-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <211ff7f7-609e-a25b-22a4-acab7ba14823@linaro.org>
Date: Sat, 30 Oct 2021 20:44:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-10-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
X-List-Received-Date: Sun, 31 Oct 2021 03:44:41 -0000

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> The 128-bit bitwise instructions do not need any function prototype change
> as the functions can be applied independently on the lower and upper part of
> the registers.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/translate.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


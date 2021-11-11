Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlEjx-0006RQ-Ie
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 13:24:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlEjw-0006QJ-6x
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 13:24:00 -0500
Received: from [2a00:1450:4864:20::32b] (port=52991
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlEju-0006ks-U0
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 13:23:59 -0500
Received: by mail-wm1-x32b.google.com with SMTP id o29so5833918wms.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 10:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LiKQTfDFTcUdA2uHeAIzHEkUVjj8NVepU8jX+25hL14=;
 b=zWlafTBoU8U1+QFKoQylKbVMYTG41GKZYZtd1jkVWS9X7Rlmsu7XhgSh2p595hF2Px
 z6e9+3t9EpbEAZE7HAu73J3ENXQpblFT7q3Air+YWLhH42ez5XB8qnlbJfAL8EoLN5NH
 VQJ9afxlQEqXMN1CLuyuZe9xe/ABurhjAsULWfG5Eld2CeqELr8dk1iKAkmumglGKIzl
 498ms8/U8Gro3VucmJ0j6sWNpy33BcxEGAh8qZSNV36ycooMC+hIapyduGhh4rgBlVug
 EV3gY8pEsqb4ekkY5u7XKH6zOJTM5XV5VXm/rvWTKg7vzR0lXZJkNJYg9uT0ibFQrfEC
 lOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LiKQTfDFTcUdA2uHeAIzHEkUVjj8NVepU8jX+25hL14=;
 b=hRuia2e8YishrmnP6jps6a9OI9lcZzQMmLbj0Q+dXwCFPihwJA+Bp/b5s0EDt25p3d
 BH9nijOn+iWiJQki9eaf5uAXegJDVhZTzsBo/oOoYMgtjvJGcWxF68AzkVhBtWWHNYca
 iJqPyZY6eqRi9pOeDZiypNfUsK3KgArQvBN3/4tGA8vk+H7h74Eh8zzVH4OG2nlWxHkY
 E3jeIjbWHnb6+MmWnWeiifawrnj3Uqep5F02oIVJtT3F+PXZMsQaGUq58pwbfbcQfbKs
 /hwBWx8UPLyExOVu8V4FPy9R1UxHsbhX215+UxippghhA9FDw4g2t0wVIpdIiSSuZLO5
 9tUA==
X-Gm-Message-State: AOAM530hZnfMYqkmF/YQkTMPVCJC/CJR+MSFChLGlZZ/hIloE3HEjSNL
 LcTDveZkZrc92rR0UxS5I8saElYbrXa9uV442Dc=
X-Google-Smtp-Source: ABdhPJzIjOgBixQA6eA0+xsgxCHmztyhR8+odnEpGCKxC/OlxkasOFNF+M1K2mq/84mQ3uN/sT0Rkw==
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr26624649wmb.28.1636655037339; 
 Thu, 11 Nov 2021 10:23:57 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id 9sm5178350wry.0.2021.11.11.10.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 10:23:56 -0800 (PST)
Subject: Re: [PATCH v4 20/20] target/riscv: Enable uxl field write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-21-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74807b5d-debd-6140-aea7-d80b040a1d27@linaro.org>
Date: Thu, 11 Nov 2021 19:23:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111155149.58172-21-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
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
X-List-Received-Date: Thu, 11 Nov 2021 18:24:00 -0000

On 11/11/21 4:51 PM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu_bits.h | 2 ++
>   target/riscv/csr.c      | 8 +++++---
>   2 files changed, 7 insertions(+), 3 deletions(-)

Works for me.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


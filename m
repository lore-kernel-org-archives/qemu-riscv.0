Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llEwD-0002YX-LS
	for mharc-qemu-riscv@gnu.org; Mon, 24 May 2021 14:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llEwA-0002XA-Rt
 for qemu-riscv@nongnu.org; Mon, 24 May 2021 14:04:22 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llEw7-00030d-1k
 for qemu-riscv@nongnu.org; Mon, 24 May 2021 14:04:22 -0400
Received: by mail-pj1-x102f.google.com with SMTP id q6so15291786pjj.2
 for <qemu-riscv@nongnu.org>; Mon, 24 May 2021 11:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lv2oo1mMiXU9w733nRRGCq5EqoVUookgtjUDw26eOy0=;
 b=XNj1QNA3IJk70u24tO3TQH9VcYGSc8FQJLmfMPZuWJAMHGQxm3CgXYFwr3TINDP2Ri
 i0mLY7ySbRG+h2Nf3QwmeGgtPxLpBNozTETQXd6CU5ixdco0unTldmFtBhNiPjVdpR1m
 uV6DgSr/vE6xMQvjRWJ9T+hP/HsMmLwOg/Zi1ocTnh1hpLbDBQBk+8ksu9qAaE1R+uwg
 CctF/ICEc+1afq8Ad89dmsA4olIwAi91kwtYnGGpIKcmXts8N9+70ApvH1XiANQOeALx
 KkZGFrwYdn6RkRwn08NVJqLmCc84Xm+2rlJd1wIGp5TbgBtHgOsPpOEFyFyBIUFn0ncT
 53/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lv2oo1mMiXU9w733nRRGCq5EqoVUookgtjUDw26eOy0=;
 b=Z8zZ9/tZOZvfVyb50dMzngYMb0uuiU5m1PauaN587cI4LK0IhWhEngKC8zkPmLKO9x
 Sf3qQQDYKCsuMgL2QGS/Whz2wSZuTFWnQ5bB1tONBtfwdNRSqmsqzf+BK4oxI/xzJjkG
 bmNx09BQpMB+rtQnwGq299TW24Q1r4FkHd8Y9w6M+3M74qgvTjB0YeramfkyQAUNSKmO
 bougzKQuYlC9JtgDVzhV4qOKcBqY4lV11jtP/Acboc/6YKRh+ggDT2YNzVRjV00sbgPq
 6RsmMrPoiBCKKbhFwgOvOyBiVZF0bSIz18UnZh0rTGzQ2r+k5zDppfrS2w1WY0o8UWto
 JOYQ==
X-Gm-Message-State: AOAM531d/cg5A9D86B52Rs/QZE213eADeY3YuKgejg8qm5FrXKI8qLES
 aK5BDBiRL2IU3PvNCeYiUCQu+g==
X-Google-Smtp-Source: ABdhPJzfrJ4XXwHgpr3e5ScHGuWG14kpHjm/Bmqj2sHFtq1TQPa1ypk1PqksC8v96YVlsG41YhWNew==
X-Received: by 2002:a17:90b:ed5:: with SMTP id
 gz21mr26644669pjb.102.1621879455912; 
 Mon, 24 May 2021 11:04:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u21sm11340251pfm.89.2021.05.24.11.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 11:04:15 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: Pass the same value to oprsz and maxsz.
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210521054816.1784297-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec4abbfd-fccb-a9cd-9dd8-a99bef328d56@linaro.org>
Date: Mon, 24 May 2021 11:04:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521054816.1784297-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Mon, 24 May 2021 18:04:23 -0000

On 5/20/21 10:48 PM, LIU Zhiwei wrote:
> Since commit e2e7168a214b0ed98dc357bba96816486a289762, if oprsz
> is still zero(as we don't use this field), simd_desc will trigger an
> assert.
> 
> Besides, tcg_gen_gvec_*_ptr calls simd_desc in it's implementation.
> Here we pass the value to maxsz and oprsz to bypass the assert.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 89 ++++++++++++++-----------
>   1 file changed, 50 insertions(+), 39 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


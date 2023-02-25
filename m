Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqhC-00081E-3X
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:18:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqh5-0007iu-6w
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:18:16 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqh2-0002hu-Ku
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:18:14 -0500
Received: by mail-pl1-x631.google.com with SMTP id e5so1873644plg.8
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yHxA2wOQFMHShl8sCbWARBWtz+v6OrdY/sRfPJxwjYo=;
 b=CCksE971udFBvISfU4vGG5CkgX4CGqC31u1DQOETeBzLkOKBQE/GzvABB0bveCD62k
 /iDg9VRD+MabahlyZlbJDu6oE88V3iCg/CWFgngoCb4iL9PJEfwGwU54DPOmQeI4Z/S9
 wDjK8xs2UnOrQDWMLVkSsFDdhqxl3+oqLvpOj7HVEmwfEpZ6/sfrZpvIzxQ+tVLg8iug
 JEqfsXRzXXWcDsEeE0L/brlNCNfytaRg0Dc/RLlmejbDAJ7vh8Gb01EGesZ/yNta2yMS
 m0TnrdiqKsZ2Hj7tGUszF2RGUYHm0GMFNR3sTtU1f15Ga0zZH3GBcd/SZVtCBOrk0q87
 Mb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHxA2wOQFMHShl8sCbWARBWtz+v6OrdY/sRfPJxwjYo=;
 b=TIwdtWa+gNIm6xR/MJW002ALWdaEUce5srUdHnLQ5SCGsO/8XT/6ZfuMeNoFps9wno
 SW+cR8LPosBYYTM2hW5tOHsabW90kVnLsMEBz8Adc4ElOkstW/X7fJoU7HC1pD6KmUZh
 w69KL2BJw4YLXe9xIGgPTNMK8w0EDsJMZABw60J0ZAoeg66pDHgHgwQM+zCHbrc/WrwX
 Aizf0F7uUI0cVlFHYNHyvKEsgwjUp0EEm19dpUoYGiiFMcmry/xET+9BuZpAzPTwu5BK
 GYBhdqCG2+v6mSbglkBEoAni+xVFRHoNodEn4Hzi0eRMwY6s0LXYmss9cactcM73AhW6
 JnWg==
X-Gm-Message-State: AO0yUKUm6tZkEfPsu0Xvl6F6BKYZq0dc/y8muBuiaaXTYjeYwp0EKxm1
 ds3VwvdcXwd2tMBPI++Q32IOgA==
X-Google-Smtp-Source: AK7set8ed26UqRj53odM7RGzgetttifzx/G4dGEVKSFRrj/RNH5xc7g0ssTE4UBxIL5bbMm6F3wDEw==
X-Received: by 2002:a17:902:e84b:b0:196:44d4:2453 with SMTP id
 t11-20020a170902e84b00b0019644d42453mr22023371plg.7.1677316691091; 
 Sat, 25 Feb 2023 01:18:11 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u9-20020a17090282c900b001991f07f41dsm804218plz.297.2023.02.25.01.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 01:18:10 -0800 (PST)
Message-ID: <d54fb59f-549c-9eae-80e7-8f02462e9a2b@linaro.org>
Date: Fri, 24 Feb 2023 23:18:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 26/76] target/cris: Drop tcg_temp_free from
 gen_tcg_funcs.py
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-27-richard.henderson@linaro.org>
In-Reply-To: <20230225091427.1817156-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Sat, 25 Feb 2023 09:18:18 -0000

On 2/24/23 23:13, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hexagon/gen_tcg_funcs.py | 79 +--------------------------------
>   1 file changed, 1 insertion(+), 78 deletions(-)

Bah.  s/cris/hexagon/ in $SUBJECT.


r~



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn1sV-0005I5-RZ
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 10:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1sU-0005Gj-OD
 for qemu-riscv@nongnu.org; Wed, 09 Dec 2020 10:59:42 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:44552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1sP-0002zH-T7
 for qemu-riscv@nongnu.org; Wed, 09 Dec 2020 10:59:42 -0500
Received: by mail-ot1-x330.google.com with SMTP id f16so1799617otl.11
 for <qemu-riscv@nongnu.org>; Wed, 09 Dec 2020 07:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vmDL0sOdDDbM6yp72f0JMMPi/vQsRYitKq8yMNZvuXA=;
 b=VL5P9uxkRKy5GNRtDMHQfhFp3x6NuT+oBuA/39wRgg23IJafHYHGXL8rWtdxl/bjk9
 M0y5fM+yOGQnbis1MEV1vCDjCdV2Y28yjGUTPDpf0tITKsu/x4vv5fDMh6OJq1mSnzfQ
 o3ON34INXvblk82PLBHsI2Rj7gs4i9tJt1atOuAbXFpuUoBWfoE7P6rOi1ykbJbvBv9V
 Kd0U5n3aaadysSHV94Tj5TKZgLngCDTrzFycr50jbODMetf7QWz0Y3dyfMf2dT1FjKpX
 HV8JsNxlxBv+Lmk1hzulGfJwB8xpDHfWr2FumjtzCicp7l9ZnGflYNypLjFjZvxIs86c
 /MOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vmDL0sOdDDbM6yp72f0JMMPi/vQsRYitKq8yMNZvuXA=;
 b=GsfvGIqclv37EdhN5p+pkYAVuJiPR/1H/NIsvPC9rbdjnuUTbyiorM4AIqNST81+Uv
 Pg/j138TTshix1cKIA/RSSFtgEbGMDSnJPdVHniWyfr0ezCMLSqVEQMGmuJ65hUCOKim
 mjpNpvo/K4sne1p/34RJSYV+9emVSGdkcXZzeJR53WzWc8u3w4yO03MjmbOdYI0a0mMe
 mO4zrV0Eakvtv3u1RVLOLpVHhKLRz49xnm0KiLc46K8YbzXHaETaB8GxIm6tKfRraaYr
 RM/n780tg2JnOwStCmswI/YSE2PqogvhAcjEAr8YmJ7FKrzIkpq/hVleBuoVDRMW4DCk
 WK2A==
X-Gm-Message-State: AOAM533T5H68EnJTrcwfnpVFhgtMXV0bq1lD5xn8kq2ni/YmV3sU0Jie
 cOlg9i8bEBoMys25qbCP/0xOhg==
X-Google-Smtp-Source: ABdhPJwf0SfVKQJBrGiwqOxehe0e+6GmU3fp345dCQNxivbFfdwh7OaLQ2KXD921GhxZ64ox6piVxQ==
X-Received: by 2002:a9d:7443:: with SMTP id p3mr2266946otk.10.1607529576597;
 Wed, 09 Dec 2020 07:59:36 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x20sm388619oov.33.2020.12.09.07.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 07:59:36 -0800 (PST)
Subject: Re: [PATCH v2 10/15] target/riscv: Add a riscv_cpu_is_32bit() helper
 function
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <22761a83664e100f962532cfa82b25d1a0a89ba3.1607467819.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06b5d390-7929-3357-5e14-005808ab9a4c@linaro.org>
Date: Wed, 9 Dec 2020 09:59:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <22761a83664e100f962532cfa82b25d1a0a89ba3.1607467819.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
X-List-Received-Date: Wed, 09 Dec 2020 15:59:43 -0000

On 12/8/20 4:56 PM, Alistair Francis wrote:
> +bool riscv_cpu_is_32bit(CPURISCVState *env)
> +{
> +    if (env->misa & RV64) {
> +        return false;
> +    }
> +
> +    return true;

Is this ever going to more than

    return !(env->misa & RV64);

?


r~


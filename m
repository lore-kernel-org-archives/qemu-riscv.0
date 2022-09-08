Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWBzm-00044q-7J
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 03:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWBzb-00041W-WC
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 03:30:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWBzK-0008R1-Ju
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 03:30:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 i129-20020a1c3b87000000b003b332a7acbcso311855wma.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Sep 2022 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mRNz/jJ10FJ/aDska8sh57k0O4s10qIr6quHwEH65XE=;
 b=om9fwDu3eINUfWTwKyL5VhoKhX1nDa7fg1ipNUbvWYPwhG4r5ATAn15CHL1wjzN6N4
 SLw0P7j122QNxeBQNQiPvUHnsDqnicG6XSR2XzKNxrFLN8hIOYoMRGGP6l5dL8GIBOIg
 DeQecPNSeirSoh526gz4U+D8AlQBQ/GynWL5s8sIcoG65p++5LAHFlVlySFpEzL5f5WA
 VBmBfNSken0LlrTbszCqhnMT/pPdosovev1r48DVGBiWHOgrAZHlgBmB0OV6PG/ElMS9
 s6vWHaCcHxAkUPZCFfDQGDx7/diyyKFCu3sVQYAJd2JZxgX6xPhCTz7Xy8EcleyqreEu
 JIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mRNz/jJ10FJ/aDska8sh57k0O4s10qIr6quHwEH65XE=;
 b=oUNv5DUMMOW1uYUUurlKeJ49udnDkOw480svGrJKoVL/El1wNaZeXKL/cHW70P/hjZ
 k4nMd08NkgFgobJWL5IYHyb52LJLlGfZ4I8/Z409VMhlk+880x5r+B++tYs5GxDyqo7F
 D+zb/eZHTBg/bIoNdxvHYX62DHZ265rbCrUud1w4/qca5JbXoweIeni+mGZdrV2qKObD
 X4gAXbdbYDoOk7qAOyViOl6qy9LK3YttFTuYsArWAyIo1uG0L3ggeRqUWySIF10t4DYm
 ZtoTFi7bK7QpOo4oy23FbuvdIpxExycsn3orPJExMG/4U0Obw2FBgSswyicG2nrMj9TB
 u/kw==
X-Gm-Message-State: ACgBeo02IT9sZoagz6rZ3mR9qQLiuOw7k4i9IFXQimeJcX7fkf2dgAN7
 6EWOE5JIX0P0JX2lerH9gLwSuQ==
X-Google-Smtp-Source: AA6agR66w6IgsCQNQ65n2ij1MiujniY1IrKhIkY+agst6KdMRCn+My8KN21SgG1N4lC0ClfdnIx3wQ==
X-Received: by 2002:a7b:cb41:0:b0:3b3:34d6:189f with SMTP id
 v1-20020a7bcb41000000b003b334d6189fmr281295wmj.6.1662622201683; 
 Thu, 08 Sep 2022 00:30:01 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 q184-20020a1c43c1000000b003a5dde32e4bsm1615015wma.37.2022.09.08.00.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 00:30:01 -0700 (PDT)
Message-ID: <f6c98fb6-38f7-5747-0db6-aec2c77edd9a@linaro.org>
Date: Thu, 8 Sep 2022 08:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/11] RISC-V: Adding T-Head SYNC instructions
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-4-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220906122243.1243354-4-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 08 Sep 2022 07:30:32 -0000

On 9/6/22 13:22, Christoph Muellner wrote:
> +NOP_PRIVCHECK(th_sfence_vmas, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_sync, REQUIRE_PRIV_MHSU)
> +NOP_PRIVCHECK(th_sync_i, REQUIRE_PRIV_MHSU)
> +NOP_PRIVCHECK(th_sync_is, REQUIRE_PRIV_MHSU)
> +NOP_PRIVCHECK(th_sync_s, REQUIRE_PRIV_MHSU)

These should not be nops: th_sfence_vmas requires a tlb flush; th.sync{,.i} needs to end 
the current translation block; th.sync.{s,is} needs multiprocessor sync, which involves a 
call to async_safe_run_on_cpu.


r~


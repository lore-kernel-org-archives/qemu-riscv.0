Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC7XC-0007FR-61
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7XB-0007FJ-4b
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:33:09 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7X9-0000nZ-HB
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:33:08 -0400
Received: by mail-pj1-x1032.google.com with SMTP id ls14so1083060pjb.3
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bneXAIvgUKA99+pRDoxmvVUuXckT4RdsTwV/ons77qg=;
 b=fyEWRY9l77tmd4vQxkl/BkAk2amfQWFuXfp3By7LYIj+alkYbkVgC87T8HqFx5m9Ko
 1/oK2CecWmeblP5WhJdMFSwh/rN0YRZ8VnkOLXm8HnqH2jx5qVdB6w/4dOsAynSyD35g
 8qG+Y9hGaiGQO2oiyHMFjRzz2ICawmfbty6ZOzqiyNuaFCaSDAiVwXqeuLazsQHwWT+G
 TyC9pav6ofBJCZsSqOlIdar+ojcakbP9qpLaO0u5iPiVQSG/PRhgoxc81CDdnW1AKZKm
 SaMJVvSrNNbJnN8z60D8E/ucqKlig1CwJ4jNbf9/SCyt7rJ8eVp5ASXc+Qso2FxbvT1x
 5ANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bneXAIvgUKA99+pRDoxmvVUuXckT4RdsTwV/ons77qg=;
 b=TvwxvezxCsy/wIuL7joiCZ5T8jT2+fCTQA2GgP1N475cvHGkn0XrRLwekLkYCWBTf8
 r09faKLpQL+kRkuv3xk91HQeNvnRnPe0LG5oV+7/kudSfqEPbRoh57Cd5e6C0DtS7Y2S
 RpuKqv7HF0MzK/xir7W1YtOy7hXmkMbFTyIYtVRfTSvKmE3cfwBe3ix86wmBD22XffYG
 vDg2ZLU5+tirgK/1Zf8ZAhjhBTLOw1M3kZqDEUDx/J3oMgHPgel+PHv+rUTkBzqQB1t3
 pPOVYvkiwAIti9Egu/H8zzOuHgxU639Kwwjn/mxc8EOmKQRMVfmnS0zevjRyxtg5pHEU
 C73A==
X-Gm-Message-State: AOAM5328eL+r88PIa2kgfGjMFURyQ1CQIWByN8WRCxMq9LYZjL8oWeyG
 5eQjHHMoynddvJGQ/ovKshzctg==
X-Google-Smtp-Source: ABdhPJyeqiRZ3fS8WDzlzw9MSRu8hJTJ1aUHnDbCHrOS/E1Wvm6HOYz1IzpVJFu8sr1KyQx26iKqUQ==
X-Received: by 2002:a17:90a:bf8d:: with SMTP id
 d13mr4346326pjs.100.1598733185871; 
 Sat, 29 Aug 2020 13:33:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id o15sm776881pgi.74.2020.08.29.13.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:33:04 -0700 (PDT)
Subject: Re: [RFC v4 53/70] target/riscv: rvv-1.0: floating-point slide
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-54-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96b9fa44-5a1b-2ac0-04ae-fa4d2857096e@linaro.org>
Date: Sat, 29 Aug 2020 13:33:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-54-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 29 Aug 2020 20:33:09 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> +DEF_HELPER_6(vfslide1up_vf_h, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1up_vf_w, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1up_vf_d, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1down_vf_h, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1down_vf_w, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1down_vf_d, void, ptr, ptr, i64, ptr, env, i32)

You shouldn't need any new helpers.

The fp scalar argument can be passed to the existing helpers.

The manual doesn't explicitly say, but I assume the fp scalar needs to be
nan-boxed (for sew > flen), or checked (for sew < flen), just like the scalar
move instructions.


r~


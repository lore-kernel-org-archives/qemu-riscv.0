Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjiZR-0002hu-OH
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 11:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjiZQ-0002hb-Ea
 for qemu-riscv@nongnu.org; Tue, 04 Apr 2023 11:27:40 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjiZO-0002LI-Uz
 for qemu-riscv@nongnu.org; Tue, 04 Apr 2023 11:27:40 -0400
Received: by mail-pj1-x1035.google.com with SMTP id x15so30905893pjk.2
 for <qemu-riscv@nongnu.org>; Tue, 04 Apr 2023 08:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680622057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kITLdpYw8/lz8rNHn3em2Jr81uuI62oLhOwLQaQGNLU=;
 b=FhC01khlvPaoaX3DwuwfqZANL9M0XKEyUoWPSmP7YCfNJUoABRX/A4VZ0CYqyPlETS
 d/XJpXIxF3hpniFuEYh51GjcOF+MAcDxAt9DQJpQxfYeSEQJ+m+ZsllVWsUyJO4hnuHD
 gVfwqQCrQsQ/3hiXq9xA5BGz5ZOYH+Vn5EOti2zzYi8wK1i+h6wkgEOvFxLgnKJQWP+2
 KzcyG+fCUgoLXwZA7ChnFOynV/IHzJkQ/kjv0J3WmaDbudt6XpSwWbG1itA+AjCfzwb3
 E5glXQCYEbMnc4CpfhKX5X/0T1pMJfd+wHYQQ70pR95XStQcHG6Fjnr10mdZKHDCuFN2
 9i8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680622057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kITLdpYw8/lz8rNHn3em2Jr81uuI62oLhOwLQaQGNLU=;
 b=5UhloTCOWTISG6993lSclC4LyDmGaqM7iA8Vcak0iVWorsHWMEToF0ABdCHzhtpxEv
 1Cli9tj4TRVYRYkHaOfBJjlmPY3rLUSKXwT4EFLHQJaDJTNf8pI8RCXDZdBhxDJ+c2qb
 AA6hxccMQ8up/KwsxKa8OvnhN8/3VF/Ct6xYDgZ0PObDYlCZAPF0ksVvBbaKBtJqmzdQ
 c1miiN9lO2TvSAJK7/+ZPdUHnuHupKL5s0m6EaeetED+L5KspnDrznGoNFf9m9bPf1Y3
 UQ2p/eztD+qIjH19P/P2ksWzEQDNZFw8NpciYC+f18F5gyJUMKeyMQ4kLW+hryOwuCBr
 J9sw==
X-Gm-Message-State: AAQBX9fyAcKgV9n0y3bhzMTn6zrl36Um3GKIG5oGA2/xuOpeyYFa8WSX
 1eUH8T/gH4qSAjKrjomxAobHAg==
X-Google-Smtp-Source: AKy350apwrEdSvbZ3LT0tuL5oQLSTd80roNgL3YqP35M9UMefpvN0vVpwJQLJC3FTwud7tXzwQzBNw==
X-Received: by 2002:a17:903:124c:b0:1a2:4921:f9a1 with SMTP id
 u12-20020a170903124c00b001a24921f9a1mr3539267plh.44.1680622057083; 
 Tue, 04 Apr 2023 08:27:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:1d41:7730:d7dd:6f41?
 ([2602:ae:1541:f901:1d41:7730:d7dd:6f41])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a170902bb8a00b001a1d553de0fsm8426246pls.271.2023.04.04.08.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 08:27:36 -0700 (PDT)
Message-ID: <473b9eb0-59e9-d117-e50c-5138b0fbe50d@linaro.org>
Date: Tue, 4 Apr 2023 08:27:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 4/6] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-5-liweiwei@iscas.ac.cn>
 <f0923f4b-e5e5-b648-6c77-4a5a151a9b6c@linaro.org>
 <f466aa0b-1312-d8ba-c2d6-d386038df781@iscas.ac.cn>
 <24d824ed-4018-302a-9c4b-22758ea1f64e@linaro.org>
 <f96d42c8-aa14-9315-832c-d7d2dcd05646@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f96d42c8-aa14-9315-832c-d7d2dcd05646@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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
X-List-Received-Date: Tue, 04 Apr 2023 15:27:40 -0000

On 4/4/23 08:14, liweiwei wrote:
> 
> On 2023/4/4 22:57, Richard Henderson wrote:
>> On 4/4/23 07:33, liweiwei wrote:
>>> If we want to hide all of them in gen_pc_plus_diff,  then we need calculate the diff 
>>> for pc_succ_insn or introduce a new API for it, since we need get the successor pc in 
>>> many instructions.
>>>
>>> And the logic for gen_goto_tb or gen_set_pc_imm also need update.
>>
>> Yes, exactly.
>>
>>
> Sorry, I didn't find benefits from this. If we do this, we'll firstly calculate the diff = 
> pc_succ_insn - pc_next, then we add it with pc_next - pc_save to get the relative address 
> to env->pc.

It will me simpler because you'll move all of the calculations into a helper function.

The trans_* functions will be supplying a immediate directly:

   * for auipc, this is a->imm,
   * for jalr, this is 0.


r~


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVLck-0005YX-8j
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 19:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLci-0005Xr-U4
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 19:07:40 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLcg-00009C-Nw
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 19:07:40 -0500
Received: by mail-pl1-x641.google.com with SMTP id u14so11058492ple.7
 for <qemu-riscv@nongnu.org>; Thu, 23 Feb 2023 16:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RB8xddNIDfKXoV+v6oHpKvEcwRtb44ArlOX1TfWAMh0=;
 b=goenOoV2/yWeDHBQexgnNBRvI8KZuIfDUs5j5W35ID4fboeYbwKhS1G1pqd8GGUMlp
 dbqeFfur+sYMM3/smWIzrTA+I5VqiZ+pJVmLbwHm8qEYtvZ+KjMLVo/cFYtU8v5EyVf6
 XB2TB3EEiV7ussHx7ePHmt07cAUK4M5gb0d/KgLCupKNRYzC6r1Ta4ey/c6eowe+gzO7
 SCn1daO9CO7uoVOCbFBhFL3r7tO6F5qiwC8pDXZjdLUoHElemwpC6qtSe8nfFylhQBkC
 ncW+ML/jlwQ9EuSw4SEPn1W1x7QAxtVM2BhPRwtBMnvaP9JyMkhAIfhJeEKH5vqGWDAq
 sWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RB8xddNIDfKXoV+v6oHpKvEcwRtb44ArlOX1TfWAMh0=;
 b=7+Unv94NHKzB+vLENaJSuWvxhvwwAEcd4AXoO+o3FKWx9QagTDfduF4Ly85zMDoIz2
 4FSA9B8bg2MxCffdrCnnFYLtg64P44ZMS3HZoXqUZd3/UFJ8UjM+QIeIYNw6pKWcOaQf
 8cossWTfUI2cKvoizGoByLgF34yeMxK/DfUYyfb3ShshGYHmcZptkhl3qCDIzr70Lqz0
 jgBKFz9Kqim8hMy91hsoprSNKQITah3h5X6J8JX/F7XkWsY8cvrY43G6cIHy+guwHkFX
 pP/b7pC45oWXd2K/QY2ze34N/kNztbHqM5/qlLMmAmmiI1tGqxw0rnMuVcFSKIubyEV9
 jaQw==
X-Gm-Message-State: AO0yUKUsKdE99LrsegC0mVi0SNgANPprM/kxjiEX1YPAWnieappgoOE6
 5UhuwGGsofwIZnsKc+jTFhp2oA==
X-Google-Smtp-Source: AK7set/j0WJuXPwj1VUOzkgXtYG06pb5BjBw+8b+qfOM+JElabhpM42iXStGLT706RaypGl5hDg5RA==
X-Received: by 2002:a05:6a21:32a9:b0:bc:930e:4165 with SMTP id
 yt41-20020a056a2132a900b000bc930e4165mr17524148pzb.15.1677197257203; 
 Thu, 23 Feb 2023 16:07:37 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 h23-20020aa786d7000000b005cc52ea452csm5795735pfo.100.2023.02.23.16.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 16:07:36 -0800 (PST)
Message-ID: <2caff25a-f9a6-5f20-3ba7-00c7f5127c5c@linaro.org>
Date: Thu, 23 Feb 2023 14:07:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 3/4] target/riscv: implement Zicbom extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-4-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223234427.521114-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Fri, 24 Feb 2023 00:07:41 -0000

On 2/23/23 13:44, Daniel Henrique Barboza wrote:
> From: Christoph Muellner<cmuellner@linux.com>
> 
> Zicbom is the Cache-Block Management extension defined in the already
> ratified RISC-V Base Cache Management Operation (CBO) ISA extension [1].
> 
> The extension contains three instructions: cbo.clean, cbo.flush and
> cbo.inval. All of them must be implemented in the same group as LQ and
> cbo.zero due to overlapping patterns.
> 
> All these instructions can throw a Illegal Instruction/Virtual
> Instruction exception, similar to the existing cbo.zero. The same
> check_zicbo_envcfg() is used to handle these exceptions.
> 
> Aside from that, these instructions also need to handle page faults and
> guest page faults. This is done in a new check_zicbom_access() helper.
> 
> As with Zicboz, the cache block size for Zicbom is also configurable.
> Note that the spec determines that Zicbo[mp] and Zicboz can have
> different cache sizes (Section 2.7 of [1]), so we also include a
> 'cbom_blocksize' to go along with the existing 'cboz_blocksize'. They
> are set to the same size, so unless users want to play around with the
> settings both sizes will be the same.
> 
> [1]https://github.com/riscv/riscv-CMOs/blob/master/specifications/cmobase-v1.0.1.pdf
> 
> Co-developed-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> Signed-off-by: Christoph Muellner<cmuellner@linux.com>
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c                          |  3 +
>   target/riscv/cpu.h                          |  2 +
>   target/riscv/helper.h                       |  2 +
>   target/riscv/insn32.decode                  |  5 ++
>   target/riscv/insn_trans/trans_rvzicbo.c.inc | 27 +++++++++
>   target/riscv/op_helper.c                    | 67 +++++++++++++++++++++
>   6 files changed, 106 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


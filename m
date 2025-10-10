Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067D5CCA476
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 18:47:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7I8s-0005A5-Ou; Fri, 10 Oct 2025 14:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7I8m-00058d-OP
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 14:46:57 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7I8k-0001wm-J6
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 14:46:56 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-3327f8ed081so3123326a91.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 11:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760122009; x=1760726809; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BaAMVG8x7rCFG+HJXQodnPqJ9NCcsOADiDQibn4Sv20=;
 b=O8qwKSnSSSS8qkzPA5r/WF22aRFISNYv3M4Xl0sK+nj2yMtZrHg4JuOpQ943G/6m5o
 AegwpaNzrPhZDG9rApYULOG66kzifknIgAl/cu63A9YM798zWVHG5scusLay9YMovVAT
 W0E4ZyAsqv051/N+v8bixxnVq/0Yg8nfla90RzmC/gYrTj4krPjElBWK8xA5qpM2E/kq
 j/yXFUEjwoa6KBKlhsiEjOFMErGUT5A/XPRLqeW/E5Yt/sAMEI3Uamym2fUr/VfiGN2a
 Zkdij3UffuWmEV0WIZII03MNQfAHCqOmczbDdNoVVlWdXuRe4YOkfZKLZFmNHq7kdDUI
 mx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760122009; x=1760726809;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BaAMVG8x7rCFG+HJXQodnPqJ9NCcsOADiDQibn4Sv20=;
 b=kPRp2E0QZkfcPastkClv0JDeRO0Zz5sii7pJu0AVfqxo9p2RnFT2bvNvjwexwK0s4F
 KM38UuuT0LzYOySfjM+CnL1becTklhwJoIEUrsQu1t0SJSn5P3d8x23wYQ8fkpG58d73
 JG7R9zdpasjGD/+xIfQOGNf+SQjuH6+oO9gR/HzD+6qHIhOMfqpZJhr9IEl+Vv9/kIR4
 OixzAeZzOYBQUNVYRywhWU3WuQkbxTiD5SpGJM3uZ3rq0k+XkFa8Ek8ofCdPSIiim7hZ
 YdmZAHKrkRbeVCveUA+IDdkjFwsjVCSH7fD3xhfTvzpRRwk347EWYRa5IMfkwSSjr09J
 eS5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ0C9COAOrYWsMNEozWL7vyqH5u+fBfXBDK++jY2GAqtPlYCWGRnpoPSwhIue1xZQmtaauFf1K+vkb@nongnu.org
X-Gm-Message-State: AOJu0Yy5ti/ZV++nW1f4QUVrKGM59eWCEFWn79BoFZYO8NIjYSWE24wW
 pGWkVext0EL+GcqeCljPhEUuDw+LLGCnEjc9uPCnG/5eHdVrN3nDPkshjLdQoW/CDm8=
X-Gm-Gg: ASbGnctcvqIWcT1mfQ2MZv5q982Fh8OiehchxTjxt/xlp5ItYm9UkMzb6poURq3371t
 7IB0gaC1G2dPuSbLjZwqnZcLuPSOU006GG1Jpvin60qQlv5BCWLDZrpUk3wMz8Og1mC3z8GZ3I/
 J68/0ou+78B4Xtwj6Fq5YdJ7LBSUNnLWihA3LS9E8Pd7rHDSme4kYUjnRB4rTIIFVoaDf3b1Q2D
 QlyPjzU/+mJT3frKfyDXNf+PyVXt84FmHQViLgaEP+qyCE/6tkGqlKiNG+FFU92KCmt+0gvM/3F
 J3VS2BLBuei6EyTFRVGThfxzpoLdwL0ko4kd0JvtauM+Sm2UHuVjQZ2hZN89Of/1+aq7tANc3F+
 oSLYTv6XUE5suW4ZHfJ1sRjxcBPnwRy4hxLRVH2RittW+2XICyckbZMw4Ydw=
X-Google-Smtp-Source: AGHT+IFg63zRCk5UcLVDH6NW58GUWqrAVOfa8jMHsdk1A9c5u6PCOpF2ekIy0yzbSreg2ehltj+tCg==
X-Received: by 2002:a17:90b:4b45:b0:32b:65e6:ec48 with SMTP id
 98e67ed59e1d1-33b51106a08mr16902675a91.8.1760122009406; 
 Fri, 10 Oct 2025 11:46:49 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61b11ca9sm3991107a91.24.2025.10.10.11.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 11:46:49 -0700 (PDT)
Message-ID: <c79b9dd9-02f9-44ab-a806-5f81e8bac310@linaro.org>
Date: Fri, 10 Oct 2025 11:46:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] target/riscv: Conceal MO_TE within gen_amo()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anton Johansson <anjo@rev.ng>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251010155045.78220-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 10/10/25 08:50, Philippe Mathieu-Daudé wrote:
> All callers of gen_amo() set the MO_TE flag. Set it once in
> the callee.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/riscv/translate.c                    |  1 +
>   target/riscv/insn_trans/trans_rva.c.inc     | 36 ++++++++++-----------
>   target/riscv/insn_trans/trans_rvzabha.c.inc | 18 +++++------
>   3 files changed, 28 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


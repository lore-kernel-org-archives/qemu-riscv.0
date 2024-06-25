Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676A1C2BBCA
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 19:00:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMBN8-0005qR-7n; Tue, 25 Jun 2024 14:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMBD4-0003Cd-5u
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 14:48:21 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMBC5-0007JZ-6Q
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 14:47:48 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3d55f198f1eso164761b6e.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 11:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719341141; x=1719945941; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fSSKCItYz8+su55zaCeDfZqGcLGOvzO1zgA32uDbBb8=;
 b=bKKXD3oQ8GKxXnE+DqXN0ZNhEtaisfqi8LKdrYvBs51OUMb8KBmMAVzDSAiBBEOqsp
 wOdWT02nCEppxdkPeXbRfIQYv5LkJXT99IbpmV7+PCzz7b1Jk+bxM6XUS/jcH+KhgKaz
 ewm3/57Ww2kB2RxLjmc2T/R7n+yViDAKErpruBulenPNd3cypHy9e+Wr2YDXqGiC+u/p
 1KGDw2+oNpy016nxTDHgWH+GiQCrZIOROGyJF4kUzmnJ+7keOsPSoCeCKYP0DcGjDj0d
 aGHlrHpSeOKE/dRFVaxwEGLj3MQ98PiT1z+xxjijcPGNKkE2lo7PMQpHNde6iavfH3xX
 iOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719341141; x=1719945941;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fSSKCItYz8+su55zaCeDfZqGcLGOvzO1zgA32uDbBb8=;
 b=S9NZ6IKwoLRoOuXBLuyRr1Q50gzouBWgs4O8SST9Dh5+oA6K82J4a49D7QOVkCVL+6
 lol5kqIOWTre5zASoYOyIXbL/Ip9bTz/n3ItdOaJXFBS27dmpgrxBHCZCHMLfXDgeMip
 0tYUJxMfrv7LejN5G1bZZjGvEHP9hvrWTEtSpYDEpVIc0yhfhX4Do9enFNinKxBCDb2Q
 ulLIFY4mfogCITYTqCCLS45qrlZzl0PGoqY9GbrgsoQEpYKo1byreEWjx2gplu70Uamf
 cwMiNhQhvIYUjqW2I/HGPBNv+iNUiEZftXNGgFBwski7S+twUaJNqS5Q8eEUKrRhLVDE
 0vag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXogNCDlzK0kuE1b5U6JyaXUlwq4f22pOsQ/boURuq6YGdH8L2PF8EoXsDTIxssy32/98uyGDkBBt1UU8jdvkTpK4Qe4AU=
X-Gm-Message-State: AOJu0YzJOYCWkFDSNKyugn8QLy2TswBf9H0T18CbGbxlKbB+7s6e+3N/
 NNYkqsj4Ci6cnlfpnfsmC8fxQqvcWhTPVMpZiyErvHWDErpgzK6rkarJK++CXjrdBiVytLf7X0H
 G
X-Google-Smtp-Source: AGHT+IFvVr28JLQAg9NoI+p/5/VRlo4mG2mg4ER6rd3Lc8iRdJTjdFIgre4+/paZJnIEh2MiCiBcsQ==
X-Received: by 2002:a05:6a20:3944:b0:1b5:cf26:ecfd with SMTP id
 adf61e73a8af0-1bcee6f0162mr11027723637.24.1719339511426; 
 Tue, 25 Jun 2024 11:18:31 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-716bb22d45fsm7482622a12.86.2024.06.25.11.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 11:18:31 -0700 (PDT)
Message-ID: <2cb94b34-1a5f-4dc9-bec4-78c7008cd79d@linaro.org>
Date: Tue, 25 Jun 2024 11:18:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: Add support for machine specific pmu's
 events
To: Alexei Filippov <alexei.filippov@syntacore.com>, palmer@dabbelt.com
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, liwei1518@gmail.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20240625144643.34733-1-alexei.filippov@syntacore.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240625144643.34733-1-alexei.filippov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 6/25/24 07:46, Alexei Filippov wrote:
> Was added call backs for machine specific pmu events.
> Simplify monitor functions by adding new hash table, which going to map
> counter number and event index.
> Was added read/write callbacks which going to simplify support for events,
> which expected to have different behavior.
> 
> Signed-off-by: Alexei Filippov <alexei.filippov@syntacore.com>
> ---
> Changes since v2:
> 		-rebased to latest master
>   target/riscv/cpu.h |   9 +++
>   target/riscv/csr.c |  43 +++++++++-----
>   target/riscv/pmu.c | 139 ++++++++++++++++++++++-----------------------
>   target/riscv/pmu.h |  11 ++--
>   4 files changed, 115 insertions(+), 87 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6fe0d712b4..fbf82b050b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -374,6 +374,13 @@ struct CPUArchState {
>       uint64_t (*rdtime_fn)(void *);
>       void *rdtime_fn_arg;
>   
> +    /*machine specific pmu callback */
> +    void (*pmu_ctr_write)(PMUCTRState *counter, uint32_t event_idx,
> +                          target_ulong val, bool high_half);
> +    target_ulong (*pmu_ctr_read)(PMUCTRState *counter, uint32_t event_idx,
> +                                 bool high_half);
> +    bool (*pmu_vendor_support)(uint32_t event_idx);

Do these really belong in CPUArchState, rather than RISCVCPUClass?

Surely there's more to this series, since these fields are never set...


r~


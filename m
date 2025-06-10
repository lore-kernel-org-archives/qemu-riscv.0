Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DFAC5B543
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 07:41:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uOtbv-0003IE-U7; Tue, 10 Jun 2025 03:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uOtbm-0003He-Mx
 for qemu-riscv@nongnu.org; Tue, 10 Jun 2025 03:41:23 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uOtbk-0004AL-2F
 for qemu-riscv@nongnu.org; Tue, 10 Jun 2025 03:41:21 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-452f9735424so11838435e9.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Jun 2025 00:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749541278; x=1750146078; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iXkfU9L4GZiVE5276HJNDJaK8nC1ZrKYeXNCrF9jdiE=;
 b=Jc9kS5oeSJFuSmUsQZT2IzbJxomwQAl1w2Ef7d0wXhUWMbte/TbfiGUWs2sjLKLZuL
 y3/KyW5Tb6pUpN1l7dTee5yo5I/ZJJK3sX42lprgN2oseP/hUgqBRDNU/UvnAdFkK5n9
 9EwPtKZbANlhJWVu0glUIWTc4AkeaR+K+nyH7xjtccKSLUtwdJ6E1fGMpI7J3UVDX1bS
 l9Vcm3uWeG9hxkxizpXq6JJV3D2CsgpLu6Qi79n4TlcbjQxB9in1sMiAsWo3FywpCj0x
 Ne6ykI4XUMYzblARySasYK7VV4lU6Efw+KmSkUj47ehbPfnoxEzoELcYLl+jf+S9LpNI
 CZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749541278; x=1750146078;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iXkfU9L4GZiVE5276HJNDJaK8nC1ZrKYeXNCrF9jdiE=;
 b=O4PZOIreCI4TfItiTPayyxZ2NVgDIU1L972rtaUDmc9/E//f88qX3dpvL2dvzn/Rfe
 NVNf5aslEndlhELa4q2xxpYgRqbsSFAKzRHbTeaQDGJ0xhryXBjdhtKYx2tvBNZGw94I
 PpQABnFVdwZW+scTT6BCdDt0I6JE6eXk1bD3f6HuF+iMGfFzZxV1A3tHWxgYfsjg4oo4
 HvnGpR14xD2zO+j0ofotnzx2oaLRRF0bjBBXOVinsvKReuTrNOoqyrklDhdV8m6IiaOt
 OaZbtVXRM5D5HcIIoE9AFhEBv2eryvrAz5khfJG8Joyu0t5he2t5CRe7MuCwVNjidJEy
 NFgA==
X-Gm-Message-State: AOJu0Ywp67a3xAmsVI3FqBBivv32niCZ91xHGS8xQ9J9kAZTm/k3VoNL
 uXx1TP0dqZFIwdOUbQ3WZixeiKDR+KyuU2HYncwtFT+lYUvJZnD4r2hwTOa7u/9Hgt4=
X-Gm-Gg: ASbGnctKWJtUsL2A3R49cxOwoWJ8QmPFEVEC4fRG5gsb3O910wcLBUNj1dicmIkqFKB
 kXXajAI5PTlIeXnCFfPtpzDoJ0I58eFEfFI2B3qe4XgkqaljO9H4W9P+XNXWSQO3Xiq4M3rVFJJ
 rlMHF/YNmu1/Cg34bPFBpBkmcoEEifvPyTcDVNBjSxEcX9NfTBVSv47eLrXPlx05ZIU8PJsz+Vq
 YzIm8edgTDjOJG4PjC5oLYkODxLQGR03PdI/YuRVNcH45r+uoB275WkhWxmSvU9GS4JP/lV/NUU
 MIj2DKfO6JnB4FBHT8BdjHRc0Ct7yI898OnSOiSXEE9vTrEDgCBN0YGfsdOYlxPYHVY/AcOQBEX
 OyzAJCL3KGisFgZZUR6uGpKIV4G6Di3r7d/zZnujekHk5qg==
X-Google-Smtp-Source: AGHT+IGDNAv+eeNfMclexyuGsq3lFH4qy2RrkUXGAmlWWUXxQzmEUNY3TiCMVPF8EG9fKEek5IoNPA==
X-Received: by 2002:a05:6000:144b:b0:3a4:dc80:b932 with SMTP id
 ffacd0b85a97d-3a53188a757mr11648635f8f.8.1749541277999; 
 Tue, 10 Jun 2025 00:41:17 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229d9adsm11335387f8f.9.2025.06.10.00.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:41:17 -0700 (PDT)
Message-ID: <bf645bff-3ec2-4c14-8fe6-b1dd48682af2@linaro.org>
Date: Tue, 10 Jun 2025 09:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] target/riscv: Add MIPS P8700 CSRs
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>
References: <20250602131226.1137281-1-djordje.todorovic@htecgroup.com>
 <20250602131226.1137281-5-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250602131226.1137281-5-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2/6/25 15:12, Djordje Todorovic wrote:
> Define MIPS CSRs used for P8700 CPU.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   target/riscv/cpu.c       |   3 +
>   target/riscv/cpu.h       |   7 ++
>   target/riscv/meson.build |   1 +
>   target/riscv/mips_csr.c  | 219 +++++++++++++++++++++++++++++++++++++++
>   4 files changed, 230 insertions(+)
>   create mode 100644 target/riscv/mips_csr.c


> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c0e048a66d..984f93dd4a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -497,6 +497,10 @@ struct CPUArchState {
>       target_ulong rnmip;
>       uint64_t rnmi_irqvec;
>       uint64_t rnmi_excpvec;
> +
> +    uint64_t mipstvec; /* MIPS tvec register */
> +    uint64_t mipsconfig[12]; /* MIPS config register */
> +    uint64_t mipspmacfg[15]; /* MIPS pmacfg register */

Pointless comments (not helpful at all).

Alternatively:

        struct {
            uint64_t tvec;
            uint64_t config[12];
            uint64_t pmacfg[15];
        } mips;

>   };



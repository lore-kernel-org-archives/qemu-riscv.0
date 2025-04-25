Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9145C369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 22:40:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8Ram-0001p2-7o; Fri, 25 Apr 2025 18:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8Rah-0001gV-3H
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:32:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8Rae-0005jv-Q3
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:32:14 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso24764485e9.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 15:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745620331; x=1746225131; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LTF3dHMDJ8DGd7HUVYtct6ypdLDT3aX3SWYNaA01+Yo=;
 b=lzC9+AZgxYJ7fr6itGviXGdI1kx5oRchWnUNeOucRKNsKW6VdKZt0NVjQdaG2aJyT4
 DvuPwVQnd6xS/5+9QWLHtmFnofnujvk35sG4nQS2PoS9tEuKDXEWkyC8HDkg0Zs+axvq
 dq3mjRtt/gu4GNkrekG7l5e8OxHpFywzaOhTUo8tphADeep4UHnotxs+Q7ZRk5O2mmo3
 tgQV9nv3mqQwwIrLVgAKLoStoQe8Mz2mnZuknjhaE4npl3blzjF3+1kQM8OIufVhnh/1
 U8b69xpDSlDCTsqc65CR5oYWGbzhuwuKPkdZeqjc/zcWkYSgTW9U0llX/VU7KyrmBQ5T
 Agqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745620331; x=1746225131;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LTF3dHMDJ8DGd7HUVYtct6ypdLDT3aX3SWYNaA01+Yo=;
 b=mywvCxWm9k2Gw2WrjP7XfrqqoTHvbmi8gSoAjlA49rUKtMcCHrEPQ9dwBRmC9BStiW
 F0PuZChCNwGLbNtmtQLNii2ZztEVECqMHfVy1xptx0Hru566BqpNaWUVqi6ctyAyiOm7
 zpN/yhwnvTxDn4lbQrmo9Dlzbd4PYVcvC8n52fujnR5VZQJg9DC5ieh38KUsPgZCZB0Q
 D8hnDadFJ3vgMd372544TXGXHHkjJwi84QDMobLDtUB34c6kUdBYi/q/CmN+h3qCzx9a
 aam6yWsPOOlnVfmGDQDWdHZnkGtdXTZMLzG818PNRap7V0Q+y4UCx026WKmInSkbOMi1
 nzoA==
X-Gm-Message-State: AOJu0Yzq/QdfvWo6sHgSiRgUfz3yYe/GM+fwhr6ygrxjk3utfFI9+DR0
 hk9JZstZw2/mIzEv3yR9IJNRWyO1mv+p1gosfwd5AVEEaRCdRVBM+F7uxNtirMc=
X-Gm-Gg: ASbGncv1P2SV5BZv7y15TS7ukLoc6cM9QktKcez1KdrR+zfyhdeSjWSl3+FSZX0+JFe
 rLwMGYpPDX77HL5JLWJJgU74hcT3l10a5EsfJU9YowmaZqdrNVOuKcEqRa2LAERosqRBKBMiO8I
 eI05833FeyIk4GCL5LR9fP18gfJCqSUC9Q8PA6QoGY9ihMXkMS3AcgcLfr5lR25JsK+dpJN4Q59
 rHA/qOP9mFVuEFNnOQqRCkqG18V9kDnGkd+B/deG1MIvVX2GM1g/QAuxceTxffF85CsrCoJPjnc
 PyPPEm47WUeBOVF5XNg2Do5VXdRFTl6o9cd1LH2h6FkrdaDnNzzuGM0FQuLiRBXTidcaoB7544B
 zXn29seeU
X-Google-Smtp-Source: AGHT+IFygLjwcOyAWg97Q0XD660TthsoPvEpI8drBG/KWoymQtocaI+7HAtLp2CF2k15lUtPp7mzAw==
X-Received: by 2002:a05:600c:a345:b0:43d:82c:2b23 with SMTP id
 5b1f17b1804b1-440a66985e6mr32095505e9.23.1745620330692; 
 Fri, 25 Apr 2025 15:32:10 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46538sm3588650f8f.64.2025.04.25.15.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 15:32:07 -0700 (PDT)
Message-ID: <039d122f-fe09-4c18-8683-aab6d92f5535@linaro.org>
Date: Sat, 26 Apr 2025 00:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] target/riscv: Pass ra to riscv_csrrw_i128
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, dbarboza@ventanamicro.com
References: <20250425152311.804338-1-richard.henderson@linaro.org>
 <20250425152311.804338-6-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250425152311.804338-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 25/4/25 17:23, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/cpu.h       | 4 ++--
>   target/riscv/csr.c       | 8 ++++----
>   target/riscv/op_helper.c | 9 +++++----
>   3 files changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


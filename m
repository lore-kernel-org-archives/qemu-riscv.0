Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5129CC3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:58:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVuQ-00028Z-0o; Mon, 15 Jan 2024 17:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVuN-00027h-TV
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:58:19 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVuK-0004OE-OZ
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:58:19 -0500
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3607bb6596aso39957265ab.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705359494; x=1705964294; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CDJ+tJuoHs4WdcXbkWrhCI3fpVTQlRtrIkzyg2F7FkQ=;
 b=fdS4DVSqkVQuu00PKHetKPJX4nFS5rZnEensRApvxoqwjUaYzM3/vqKvXHnh50G98g
 17VHsLJMCaRXe5XZAaZo4EFtXbwcoi0cwNiKrobfiuyZ9cok9pHjiG2tzTD5sUUf+qX5
 VrZRMkYIUInJ9vynRzbefSN1BEBIuiReTjMElHfdvrklxPhVTCvoUR4w1v8lyXkpY56o
 9oT6A7s+9w/At7RKSJMAJ358VheUKz3Rjo0dOQzzo35YDvHWrimxkCLo5/A3/VNTUrsx
 NSUPPiCQ9pdVhsG6sh2pv7CN+E2RnnP8FUrcROFFBmeC5ORPBlt3qHv+iKK+uc1v7gD0
 u2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705359494; x=1705964294;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CDJ+tJuoHs4WdcXbkWrhCI3fpVTQlRtrIkzyg2F7FkQ=;
 b=iQ7OEKuFKAd8NU6GwBm4W9vZeeYofAYWfbJXZTl/vOxXqYcfBL9t9dnq96MysXyGQz
 ePK5c0DX8L7Cs/UEy59dqDdvqLwqpllSrYYW3807m90cSqlieJqQvoeLUoUUl9oqyxos
 xloFYte1fPDeOqRpDS4WR8EiUKkiTkKawhG2PBJs68AE6+O2zeOL0/Gfd23Wan0ouNZ0
 ifr5eTLUL/lOYD1CXxM1sI6y0/Bd+hJNE5tgW0rIW5c9CoK0h3SYtzznNm4NNrw7WfJ7
 //Wi98eD4xCvGnj6o8ePcdqPowqpF+8QuYxvpSSiAEuPKkvRCrbbCifwoLZOYslcW4wA
 BCMg==
X-Gm-Message-State: AOJu0YzJQ4kOV4MtGExFfp0HfgOEOeU5izh3hMJsG2JbIh9FLGCZPLQu
 jNeLuMUsexX9hpi0NCynpR1ZLNyTdYeULg==
X-Google-Smtp-Source: AGHT+IFt+IWMgY6ldjfkeeqgMnVXwVnfCrOsKUx2mSPbbzJ/WTkqW6c1yK+a1a+359xBE46Tj/vViQ==
X-Received: by 2002:a92:d9cc:0:b0:35f:ea7e:d341 with SMTP id
 n12-20020a92d9cc000000b0035fea7ed341mr5618753ilq.57.1705359494263; 
 Mon, 15 Jan 2024 14:58:14 -0800 (PST)
Received: from ?IPV6:2001:8004:2738:1dd9:85fe:4dd3:358e:ec4?
 ([2001:8004:2738:1dd9:85fe:4dd3:358e:ec4])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a170902c94b00b001d3cb4e3302sm8055360pla.214.2024.01.15.14.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 14:58:13 -0800 (PST)
Message-ID: <201059d1-5596-48a0-b48d-54d0d97467c8@linaro.org>
Date: Tue, 16 Jan 2024 09:58:09 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] target/riscv/cpu.h: use 'vlenb' in
 vext_get_vlmax()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
 <20240115222528.257342-10-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240115222528.257342-10-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 1/16/24 09:25, Daniel Henrique Barboza wrote:
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


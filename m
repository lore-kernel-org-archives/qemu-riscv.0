Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54FCC3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:40:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVcf-0003qJ-3f; Mon, 15 Jan 2024 17:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVce-0003on-5r
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:40:00 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVcc-0000Sq-Ex
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:39:59 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1d50d0c98c3so66514575ad.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705358397; x=1705963197; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wVbx1WRYSKI3YmRetrmN1yHm2cubs9ARZOPDxm9nQOA=;
 b=LavSAE1DTm6uNXHPDXmHx1/j5OktBEShh+pl5jGpech6HEzPTXvfT0jgDdv21iyRFK
 68LYuhREd1u86Ys7Odyy0dis2Q2nNqzFK1QqsNWaxyS9/6M2SzVYW0G+4FskvgOrZaVP
 MHBRIw1ys8dM+C03VQQWDS9ug0M/J3Fe6fnuvnwpe9e1GYlXQy5ymEYFGDCRMB/eZ7jU
 wMcC4ZeARG3KLkgsmeaRG6mMxDhB80wRZslejY73cjUyyvNb3ErB6F8vr7zXvqysGw+h
 mJk+73yWOVhfeXV//iZHHmZDiTOQCfdDei3rzLUSriLSk5uu/JKWcOgNk3PpRIUPE74Z
 qDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705358397; x=1705963197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wVbx1WRYSKI3YmRetrmN1yHm2cubs9ARZOPDxm9nQOA=;
 b=kGeoDJoc6gUIISx9Csd7prYup2QbXfMaSWMjKFm2n3X0kDrDwn5ESELYOpzwQ1nKoP
 0DtyBBmHP+rdFHHB4uMSm4822MFk+R+beeEzeiWK2BNjIGi5SERGAYFAqRdwc52RdGfd
 4fPknYMbQtk2+0TMFO/iwkhlfS4WwzjyDbFtQO6QpMn+CJhYxvg6y/uSrDpgAbA/29ne
 OEKKFIDE4RFyV7vIBHKBd7bFhwl+g92cqltmwpd7zGg+VJszlhc6nj9hYfdRUDz8xlYO
 xiyGJ8Vca93ZW4AUpQ44Glr77NSxB1vfJjGwdoDilzBQO1V/AMQRUaWMIEEKP6udWo2a
 OtAA==
X-Gm-Message-State: AOJu0YyJjg6JGykP3G54msaF1EOCROLAJAtUj2jCjYD46lzCEv7PKa7m
 tno+wUTSaeQuqspiyKgZke/4Ouk2w3bX+A==
X-Google-Smtp-Source: AGHT+IGjQwAyEvf2f/aUAcH7vYXesAVw0bTF88KzFQbTvJIGusg2lGrCbDG5GVVxuPItVFavnRGnYA==
X-Received: by 2002:a17:90b:38d2:b0:28d:647:202 with SMTP id
 nn18-20020a17090b38d200b0028d06470202mr8234208pjb.35.1705358397211; 
 Mon, 15 Jan 2024 14:39:57 -0800 (PST)
Received: from ?IPV6:2001:8004:2738:1dd9:85fe:4dd3:358e:ec4?
 ([2001:8004:2738:1dd9:85fe:4dd3:358e:ec4])
 by smtp.gmail.com with ESMTPSA id
 mf8-20020a170902fc8800b001d58b7cb7c3sm8111698plb.90.2024.01.15.14.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 14:39:56 -0800 (PST)
Message-ID: <ca3a656c-f9c5-4ef0-8e60-59440a7809f9@linaro.org>
Date: Tue, 16 Jan 2024 09:39:51 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] target/riscv/gdbstub.c: use 'vlenb' instead of
 shifting 'vlen'
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
 <20240115222528.257342-4-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240115222528.257342-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
>   target/riscv/gdbstub.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


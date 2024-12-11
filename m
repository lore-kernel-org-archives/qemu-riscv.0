Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93381E7717D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 16:49:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tLPgV-0005HC-NK; Wed, 11 Dec 2024 11:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPgP-000573-42
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 11:35:29 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPgM-0001yj-3M
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 11:35:27 -0500
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-4676859b911so28258461cf.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Dec 2024 08:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934925; x=1734539725; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gng6M6YMpGpg7rmPmXYoDXLqibSnH1wAgGKaZZa/k24=;
 b=TpKEMlM5I/S/xgC3aFjzRgUDDRd898mgzYTJQYkbcfA8lF7I0QpOkXfUzDdYTJZ3C3
 Q5/D+0rRd++2IND8svMwLVRWObC4F6RDb7SktZXmYfSFuPMj/nRq2Ns6Q2IAezuOoutR
 Oqp7WSABxG2+1UqUTQWxYx4/J9cRhomQ1/fpp9XXllbeiLbrPuHp2CMn27ulnxaHjgQ7
 0EnJ0cH8Y4Ad3F/b4Yk4unThnm5ui4Hw4tYExmdASUNHT+w0wqjMCDGpky0tnbM4KQdP
 mrMJQ4iIqkhVatfafOW3vy5mASMQ6WFjUNZlB7+zG1qeKqbM6D8HXn27HV6orh5BwMgr
 C+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934925; x=1734539725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gng6M6YMpGpg7rmPmXYoDXLqibSnH1wAgGKaZZa/k24=;
 b=Trjq4oMQtpfOBKhfumsKZAV5y6dCQR6ruA0pH2mLlKpHBz/lfIiEyTF+TATwJbWHxt
 mVD9bxclN5wgniZAqnwgSuX7y+ZnqUfGpfxMiadXtk6vAoVX49UrEjx+x3S+EolPtGMT
 lqyU2E+OJh3pr8qXAMzoWGui4MIwc/sVNv8g3R4r0h8wDd+Wbo6eQSEIqSOls+SHlIXR
 zL2Lz7JxE5QaCm9zvvq4DG57Db9Q9miZ0LBJFOycSfconXCuLsgZROZyuKH3PiFpdedB
 pCTvD6pakmnSZDjgacWksug987qxugHK4GyWNDSIlBFl91nSy2AepHsTgiR6mQTP5252
 DU+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0zdK+DW/H90GcZ5uyyEqVWjpY3aIzZKnU+qz1lqRaEyx1YbMuRlVrVsURlvlerj70A28BYg1scrUF@nongnu.org
X-Gm-Message-State: AOJu0YzbD6/W8TUcHqCeejJLTCiVAEXxS1jabK/JjZO1H01IPyxWi/rH
 T0RVHxsZCEhhCEGlqUZ6SK+UBJFlTS23GI+3VcWVb8YFj0MFTGZb5E/HQ3tXvrOaJoHmclGde8d
 nYnUknYX1
X-Gm-Gg: ASbGncvtuHx4D6My6dHPS0Uy06IKQ0qbO0LOtB87s7l8NsvCxEbPIMLSY53dXWaHtwu
 uN7Hcc9NxTWG+fckaCDpPzzZkQ4nkF3vO7xYUJmAfTnZl9YOSnaGbUsTKUT/Mqo9yTqraB+aAbT
 +qI//Ud8a07kqJxpz49kBLjoW13gd1uwbn1pJr+t6Txo9mlW9omraIW1c/41IFSr4RKrYZWtFEB
 6FvV0qpe1NV803XNujgGHxyaXdnolrb2xjVQu663liTHwhy08HI4wrI+YzUXlnYiI/q/Bw=
X-Google-Smtp-Source: AGHT+IFwq7GWH/yZffXkYrSXZL8B4Ypx4yTfLYUkWJC/jO9aJ1bundN//6xu7dUHqwbC5t6RGuv+yg==
X-Received: by 2002:ad4:5ecf:0:b0:6d8:af2d:2a44 with SMTP id
 6a1803df08f44-6dae2ab2e4bmr4850936d6.32.1733934925128; 
 Wed, 11 Dec 2024 08:35:25 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8f6b68037sm51385396d6.19.2024.12.11.08.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 08:35:24 -0800 (PST)
Message-ID: <60a9ea0b-d512-41d0-861b-d5e865afbdd6@linaro.org>
Date: Wed, 11 Dec 2024 10:35:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg/riscv: Fix StoreStore barrier generation
To: Roman Artemev <roman.artemev@syntacore.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Denis Tomashev <denis.tomashev@syntacore.com>
References: <e2f2131e294a49e79959d4fa9ec02cf4@syntacore.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e2f2131e294a49e79959d4fa9ec02cf4@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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

On 12/11/24 01:40, Roman Artemev wrote:
> On RISC-V to StoreStore barrier corresponds
> `fence w, w` not `fence r, r`
> 
> Signed-off-by: Denis Tomashev <denis.tomashev@syntacore.com>
> Signed-off-by: Roman Artemev <roman.artemev@syntacore.com>
> ---
>   tcg/riscv/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index f8331e4688..96f9a7e348 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1624,7 +1624,7 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
>           insn |= 0x02100000;
>       }
>       if (a0 & TCG_MO_ST_ST) {
> -        insn |= 0x02200000;
> +        insn |= 0x01100000;
>       }
>       tcg_out32(s, insn);
>   }

Fixes: efbea94c76b ("tcg/riscv: Add slowpath load and store instructions")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Wow, that typo has been around for a while.
Thanks, queued.


r~



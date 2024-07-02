Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293C6C30658
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 16:27:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sOgLE-0007QE-PC; Tue, 02 Jul 2024 12:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOgLD-0007Po-AH
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 12:26:51 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOgL4-0003dV-3u
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 12:26:51 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1f480624d0fso26357875ad.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jul 2024 09:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719937591; x=1720542391; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/IBqG+c1bd5KlsdYkeDk3KE2DqhVQpASsLjfGugP36U=;
 b=hPCS16cq0i58rfB/Rxi/o5AW71lNkzcrTXg42DcR1Cpvr0/RYM9d81xOzqVCAfeMR0
 XXEUAdTCz9Fi9SRWaIIvxY4edEUieCOQkwoGiR7qbArUHYgDUpP3843PB8yQuFeCrMhm
 FGXHdpbwnEcjERHfcfTHXTUgp4J2SFziBWXfWstghX0ziUyvSIhaOT9ZevnCnlCWSpBg
 k+1D9fanmbhMf4HG+fRudxdN0fBx5tZE0bWdH3rRnNtxcULtApTYA3fTAkFjRJtZzvAk
 drMr51ACyvHZpbrwDad9oEKA6YtiB9H/TK5QsZVkZd8jLyjbqV/d05apd1P/OXle15/F
 Jw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719937591; x=1720542391;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/IBqG+c1bd5KlsdYkeDk3KE2DqhVQpASsLjfGugP36U=;
 b=xF8E/j6de21B+WIxKv+y75DcbzrU8L/dNNVLTMuCVHFVpZ2P5AAUc8D2MufVr7zMZl
 Z8F66sUYBwqvTK7JIX5G1hEnIcBENXi/Lp1tjf90+DGKm6d38irHEe7cADNq5CHm99/+
 jW3azf2M9ZftdzNJ5rzF/Ixc+mpD2j5GPGTUMXhEmhA82SrJuOntK/rPh5M00LPd5r1r
 07/c15nlBDH76MRikLqKZE8QVr6Vhyugzajcwt+NSlQ+mo4J82JdCrGR7RlQ+9aS9AzF
 M62a3m4SH84ssB+dUqR4f7d5PMH7bpIUgHd3KNJswCnyLo0IMY2Qs33oEUjagvdsvNmU
 CZ+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSVpON6hAzhX4aVNU0rvXF23YbtvzNg1Y16TWfm65faavGc+4a25J3M8GWzfgEx8kYsxiObsStbXzx9R+9Kd0IMNv+ojk=
X-Gm-Message-State: AOJu0YwRpIvWy0nTuBlKY8Rsyh+GVSgzev0lgz1m3V5+Ruf6gGn3M0xH
 rZKpvRRrzQcgu2KWiPgfqfvWJdRLa6WHPd/kYANMGbdjHeFhj9kZULP7WO4k7kM=
X-Google-Smtp-Source: AGHT+IG5c1KcPPDFJsrNK6HyBZvL3xI41OK07gtdEX8xM1mvWsdmt777FSl+YW5i1RiODZuFHzdS6Q==
X-Received: by 2002:a17:902:f54b:b0:1f9:cf4c:e699 with SMTP id
 d9443c01a7336-1fadbcf423cmr76213175ad.55.1719937590774; 
 Tue, 02 Jul 2024 09:26:30 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac159686csm86431835ad.266.2024.07.02.09.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 09:26:30 -0700 (PDT)
Message-ID: <eaa4ffc9-19e1-4d47-b8ef-0a76ef6be593@linaro.org>
Date: Tue, 2 Jul 2024 09:26:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] util: Add cpuinfo support for riscv
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: brad@comstyle.com, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng.cn@gmail.com>
References: <20240627180350.128575-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20240627180350.128575-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Ping, particularly from the riscv folk.
I'm keen to get on Brad's *BSD patches in my next PR.

r~

On 6/27/24 11:03, Richard Henderson wrote:
> Do cpu feature detection in util, like other hosts.
> Support the OpenBSD ucontext_t.
> Support the Linux __riscv_hwprobe syscall.
> 
> r~
> 
> Richard Henderson (3):
>    util/cpuinfo-riscv: Support host/cpuinfo.h for riscv
>    util/cpuinfo-riscv: Support OpenBSD signal frame
>    util/cpuinfo-riscv: Use linux __riscv_hwprobe syscall
> 
>   meson.build                       |   6 ++
>   host/include/riscv/host/cpuinfo.h |  23 ++++++
>   tcg/riscv/tcg-target.h            |  46 ++++++------
>   util/cpuinfo-riscv.c              | 118 ++++++++++++++++++++++++++++++
>   tcg/riscv/tcg-target.c.inc        |  84 ++-------------------
>   util/meson.build                  |   2 +
>   6 files changed, 178 insertions(+), 101 deletions(-)
>   create mode 100644 host/include/riscv/host/cpuinfo.h
>   create mode 100644 util/cpuinfo-riscv.c
> 



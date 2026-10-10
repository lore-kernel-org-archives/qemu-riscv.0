Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA3DCA9EBE
	for <qemu-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 11:51:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFVbs-00060O-JJ; Sat, 10 Oct 2026 07:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFVbp-000607-BH
 for qemu-riscv@nongnu.org; Sat, 10 Oct 2026 07:51:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFVbn-00024N-NZ
 for qemu-riscv@nongnu.org; Sat, 10 Oct 2026 07:51:25 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a16bc2278aso3861915e9.1
 for <qemu-riscv@nongnu.org>; Sat, 10 Oct 2026 04:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791633081; x=1792237881; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7wAIcA5lNwzgNhb1RI98AiVDnxNrFm5x/TNXElweJy4=;
 b=pkTEyKPL2xbmTdW7/PFFbBSODc2LbrqfAza/On5lasA9N7Dt+NSvTsSOjbA4AX5c0Y
 hCmYXu+6daXQd/rulLRKk3f5hIbB+sqLZQiF8PDA5yr4JVAJVty13EgY+jp1ZCIP0p7b
 rUh9gjtC/4cFJlyt+QJvgWSor5pZKG+VwdH7iL+SiNSpyWvB/SugoVsl5BdWusSzo7Ci
 XzWdrgoou5s1rWG/gYE8wkx/33v1ODVzTz7GZZXvsxPeYP5eOJcBzKbghziZ0IJV5Dwl
 b7QyeljJPoVSavJCdukz1yqDfrUcUlbvLGGHsQ9oiaNBS11JrxlMdzceY1ADOBmi5NQO
 WsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791633081; x=1792237881;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=7wAIcA5lNwzgNhb1RI98AiVDnxNrFm5x/TNXElweJy4=;
 b=odfD0HExZi/NFCwKJ1eH/4kurgfrASvEil2R04gRHGv1wugauDs0AMBqeVDZB82HhE
 V3k6Foxn+SiDvlmXGogmiR65j96gy3/Jo91bxUaL0AN007XLnrJzykFi0KuKj7tT6F0a
 5PZXrWn1tQX6v5nWQ1P90QClcYF/nBow37GOoZ/RTo6sJTbIYOkJuSJmm1dmM6/5HdpB
 56JHeBq63Zs/BKvdwoXJE6cz0P9PX2OAI0unmWEKOaQ3GTpFs9fsxsV13qyfq/eDrR1n
 Bv1RCo1EKCxYhq/JoBI1/BxwV55vtMowio09+6Hi5Kh5/Lwlj04VpHgQwqS1czkGtFA/
 LO7Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1CdDSTqoC0NSkVwmwhZE9Vjj9GHMresW2SdXJIalLZNPJbDc3Do/tJAHvF/kRfcJZn2HahlXeXJp7@nongnu.org
X-Gm-Message-State: AFq9FYKSAXYpAGo/hShttP+flv2ZhRFQnuGeIbcgfbm/BQlpMjUyytbw
 u6uLFkobKyJkYAhucFGmGv+WoEb5VngHspcrZX2cYsyRdTVqr5ByTHwM3DSjbt1FQgo=
X-Gm-Gg: AYBFou2MD1Zo/7cq+Fe0/Up7m6h/uRYSM6kh8eMxmWeVMu0wWEBu+d2090FUZ+BJNuo
 gVXxEedOkucZpWtbilHlnXauZQm4KGZW041hfx+X1NGEz1Nj9cgabMg0ywBS/qP9Fd5GZsiLWN1
 x7EAwWjLd9059Xo/KGmWNXfiEI+f/jmw5ZyGK5LmYmwJXwcbi79zpIa4s3ctD2x/ymnSg0K7BRK
 xJnDVJjZwOkD6TLtRTPovyYD0oAs+/YN3tLAvVzIeDyuNMrWqyErPkqg0h73Po9jpy+VUy6b/gT
 GP5+tAgkWTjBK1jgiO4+UZWrnLiGYxrEj96MugIpwh+Gc5kmtD+Keb2ihpdeIbNVhtjIQvNoE74
 xqJVKDFSuQFjesAwCucFSRYWkQF6l+ocGu2X8Yh9rZcmQheaW84Zz3yFyqyKLTtrHpi62CTI4UC
 1ZkPYr0QEpAdLaqVl6mqjVyk7lZVfi33qERqf+5Y/BIIEGi7bd5m8Lt5h+b7TOyFjorfC6nlVO3
 BtSekncqF6XGHugtORpeFfjBhmC1KCb9Hojf+hVmyKERFT9DR9pBsY=
X-Received: by 2002:a05:600c:3e8f:b0:4a0:1c0e:b057 with SMTP id
 5b1f17b1804b1-4a18e44653cmr90628935e9.4.1791633081454; 
 Sat, 10 Oct 2026 04:51:21 -0700 (PDT)
Received: from ?IPV6:2a00:1e:e082:2901:5ea3:cc86:f483:9740?
 ([2a00:1e:e082:2901:5ea3:cc86:f483:9740])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be8c5e7sm173620375e9.4.2026.10.10.04.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 04:51:21 -0700 (PDT)
Message-ID: <f89fc94b-ef64-4421-b369-4845780077ca@linaro.org>
Date: Sat, 10 Oct 2026 13:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg/riscv64: Remove vector min/max ops with immediates
To: Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "open list:RISC-V TCG target" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20261008181611.3015838-1-aurelien@aurel32.net>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261008181611.3015838-1-aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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

On 10/8/26 20:16, Aurelien Jarno wrote:
> RVV 1.0 only defines vmin, vminu, vmax and vmaxu instructions for the
> vector-vector and vector-scalar case, not the for vector-immediate case.
> Remove the immediate variant from TCG code generation.
> 
> Fixes: 1631f19b04fe ("tcg/riscv: Implement vector min/max ops")
> Signed-off-by: Aurelien Jarno<aurelien@aurel32.net>
> ---
>   tcg/riscv64/tcg-target.c.inc | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks, queued to tcg-next.


r~


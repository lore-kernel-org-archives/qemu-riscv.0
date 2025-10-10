Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A1CCCD185
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 18:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7IEc-0004dD-2z; Fri, 10 Oct 2025 14:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7IEa-0004b2-Jj
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 14:52:56 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7IEX-0003P1-Ao
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 14:52:55 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2698d47e776so18154175ad.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760122367; x=1760727167; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=begoUp0oBV8mpS+yptjnrr4rI9lBPYiXV+KmzPfLRAA=;
 b=aVPo96br8E/hHbAQIkpUOPFXLM5T7cZoFlqhcTvB1/dvajWAaYodt8kMZ4VQ1+Gi/Y
 Xs4lm2P8whwiUZdQ0KGQgLv51HquvSa+R7kqnsKDjE8vaCzu0PjgPtxKVurYiEVBk7ba
 5HM8Ch/KJNuIlrwNr0t7TIfCIlE/KD9TtSo5H4dDzYZjG/ywHgRmW5b5ulK5zAs4/4XP
 xBwiMvgS4D1jfGJLJLCbjpdhMqpaSnLvZ7WSsVcEJJQM4+vlAPvCUE7cQxoj52yVGssK
 UnT3026mwEala/L7/N81SIIJHTubo0X0qpPzQHwxQJbEBIrfH4k11bsyvMBEaX6yJ6/q
 al6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760122367; x=1760727167;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=begoUp0oBV8mpS+yptjnrr4rI9lBPYiXV+KmzPfLRAA=;
 b=YCCJbpvzW/fdVPd0Cs+g6oJ8DrUc6sO+bm06LykTArJpPE9e+K+gPyd7Pqg0Dhgx4q
 OlzIiI25HcWIf2GJSYZPEyCrytPDrvD6uaGetbkHtLWPeQ1/KKTjxqGHTYm3ZH7TVCCc
 tEofRW+Rse81EIvUEjrAvqTgzMzj5jD10BtIau+B6cgvCj+MlVMj71bDCnM54VGZA7E3
 ZFXxs6jaaTOrKXv4Yqwi3aQ0pEK3J1KDmnC9qelTbKKfh7ANeEplVAPguv5Xrl40/W34
 L8paz7YH8yxxOq1Q8V/m4YRPjNamlhJb5nC83JHottKFa/OINqSbyjmjkSWOa0DO01Et
 hq7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOJakLYAQERh3a1MdbTIkTT4/43jwMKrUVHkCtPZ/8q+AU8fiOaxOPnXfQvtgn6dZCRhKVhP2+pp1F@nongnu.org
X-Gm-Message-State: AOJu0YwmHzlkssu6c90UGrvmx2vhxl21Ypu9oy912e+vXMCFizc6/xuo
 3yzjhVUMY+N4qYcjvthX3JRNSzR6fY+QF9HhH2fxrr6Y7/dLsmtXQPQDFfjA/0UQjYY=
X-Gm-Gg: ASbGncvEbvymCJE9W8p1sp1BTGiHa0A7PrcM+cv8Spuh64G6N+gR2HjXXPw+HPfpuyB
 7aU3+SKa3F3oyhw7AAkWcoupNCyj7P03GGZfkcHJzRwVBBGjigrNEGivcrt7oqlxuiEkGbe0HTP
 QpAVet0VwPnb/Th/K83Q1yARfBkCRrtCE5qNBuX5nH7O1liDLRFj/904GQCVOhaKzpoelL85P1a
 tM4s3KQg9/0HxGJOzhZt/ImnwOrmf1KGJLIIsTZATIy/wJugb8HqoarXul+C0AIbtdteEWV4sXP
 YDS+EIoAyhlLhPPyHi4gcLCbYBWLRI3+HoYimrXQY1WzY/DYivitn153KGfC46HTe97JwstuXxF
 hLi4w7Z4OTYpsaMjZ4rjWy99QyJ9c+t1jzn21dpx+G4kdy8Jqefgfrmxiw34=
X-Google-Smtp-Source: AGHT+IFfo0U7WIH0emhwkwA7of07IN4JrwB/W5cyscaQuQayoeEX/oVz/AthJgh7WHEKnKYwRZs9gQ==
X-Received: by 2002:a17:903:1aa3:b0:269:9adf:839 with SMTP id
 d9443c01a7336-290272b3357mr162622405ad.19.1760122366903; 
 Fri, 10 Oct 2025 11:52:46 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f56c04sm63704165ad.110.2025.10.10.11.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 11:52:46 -0700 (PDT)
Message-ID: <7a504cd1-4935-4801-b473-88bdf10312d6@linaro.org>
Date: Fri, 10 Oct 2025 11:52:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] target/riscv: Introduce mo_endian() helper
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
 <20251010155045.78220-13-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251010155045.78220-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
> mo_endian() returns the target endianness from DisasContext.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/riscv/translate.c                      | 18 +++++++++++++++---
>   target/riscv/insn_trans/trans_rva.c.inc       |  4 ++--
>   target/riscv/insn_trans/trans_rvd.c.inc       |  4 ++--
>   target/riscv/insn_trans/trans_rvf.c.inc       |  4 ++--
>   target/riscv/insn_trans/trans_rvi.c.inc       |  4 ++--
>   target/riscv/insn_trans/trans_rvzacas.c.inc   |  4 ++--
>   target/riscv/insn_trans/trans_rvzce.c.inc     |  4 ++--
>   target/riscv/insn_trans/trans_rvzfh.c.inc     |  4 ++--
>   target/riscv/insn_trans/trans_rvzicfiss.c.inc |  4 ++--
>   target/riscv/insn_trans/trans_xthead.c.inc    | 16 ++++++++--------
>   10 files changed, 39 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


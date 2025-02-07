Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C265C02192
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 09:27:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tgKdA-0008Ou-TQ; Fri, 07 Feb 2025 04:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tgKd8-0008OR-Vo
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 04:26:35 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tgKd6-0004tw-7L
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 04:26:34 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-21c2f1b610dso45466015ad.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2025 01:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1738920390; x=1739525190; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JO5nb8FKj9WGGe6KGRMp/my0Bb+7VKxvWE4c1MgZ/d8=;
 b=QiXrRAjuUBBCzvAE/n5TaYOj1wYMnu9mfbLo8+ceXQrrvWBPjAwC9bGf1Q2k6f0hKH
 FJS4wgDG56aBMABUokmzuXNgWelv3clwwYdOwuThINo4qQWlwVuiHb6irZbSCZQs31lC
 koV0v815kZLNnZ/pUJrVUUgWBHxKOv7lSH6CnDGS9i5S7TnAIcVZr1YFisu/7HT0M5vH
 LJL87seH8X6Re3aEppjqwUmZ6sJMelPbLpPXYk5hdrcVzY3+t7KEtDABDNuzKHb2iBRl
 NWnFPcQySmYkT3djMMuyTpgRmcu+KaATyRR5jsnC9yn/pK2Hnf4KRE0WED6h5K5ncxwH
 OCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738920390; x=1739525190;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JO5nb8FKj9WGGe6KGRMp/my0Bb+7VKxvWE4c1MgZ/d8=;
 b=Of5AFJXxYxpvkvL2RQHuizVnYskC75HTVo3lMWoNyAOJsMAf9ieioaHiNXfo3puref
 DvOIuqAtbyswHCqC1KNahVt+xuOOJTPiGrBkR4Q37kkZT+9VSZzUKTDAZunfzX2j2eUf
 z7yogpz8tIkkOBngAwUVxujSZa12PAqJJPh5jn7q20OX1Olqx0PkZi6zSXyFq5Bfnc64
 spoCnDa2AFu65y5qH6TtUi3RU8/gte5n/JPGWn/2xHDEWxhb811iG7zWnxIa9PQOkdhe
 sG+QHyI6s6CyjMgxuEPwYDp4E06y88wq7v3mU+qPi83gy9U+6FObrsIZWvRLzFpVkh3Z
 +bEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1waGASVV3Vb48hjzdizcgqkEPVO7J8Vl1XrJKIY/nTlete2o1Hav/rHxj5+CUTzBV3nZXH4cktVPA@nongnu.org
X-Gm-Message-State: AOJu0YwHBG7XIdRKoatBfecQu7lmCI68BD4VTwkSqj8FB8AsCMO4sBMY
 jzU1MWjMlcWDt2h7I+Fv+qlkrHKQBalFbQKAaGwuU8kSX/vuVU8FjJZPoBm8qg4=
X-Gm-Gg: ASbGncvbfIoESk2th5x2KVTRJLTgsXXbuc8JYhIDq68k8e/z/hfbyQzZhhiVfk5gmfc
 fmr4Evi58izJ8pxsVEJjauPGAO5mwhrdLjz7jDj5ARljTOCKzqQ/nLx+SAtb+zwJ1rIlGDlFKf3
 cTNpDKOh7UlZgBkLmsntXI4Qdll3V3mhzg9+UcZafdXJ9UZJ4LKxPi062ID6Gzj8LcwaR39p5kM
 Tmv+PxjlcWWsZrmZmX/Plis8U0iXoc2+6kh93VQlW9V1L379mIjIPyHJZ7pIgAapzAsj3miY3K1
 butyWsF1jfmwiFm/hifapCKVzCyi2igSrRuyPol+1InDiUI4A92U9Mec75IpdyQATCtn
X-Google-Smtp-Source: AGHT+IGfZGvSY/5YcgQTfJ55NZ4dPtYLsM0sVfI1RQQTSzITtrOQevCdA9Zc78ypD1G9sW7qqUgXdQ==
X-Received: by 2002:a05:6a21:b8a:b0:1e8:a374:cee6 with SMTP id
 adf61e73a8af0-1ee03a21dbfmr5547024637.6.1738920390067; 
 Fri, 07 Feb 2025 01:26:30 -0800 (PST)
Received: from [100.64.0.1] (218-166-198-8.dynamic-ip.hinet.net.
 [218.166.198.8]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ad51aee79casm2277334a12.44.2025.02.07.01.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 01:26:29 -0800 (PST)
Message-ID: <4486e09d-ffa6-466a-8938-b7c2b5fdbcbb@sifive.com>
Date: Fri, 7 Feb 2025 17:26:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] target/riscv: Source vector registers cannot
 overlap mask register
To: Anton Blanchard <antonb@tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250126072056.4004912-1-antonb@tenstorrent.com>
 <20250126072056.4004912-2-antonb@tenstorrent.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20250126072056.4004912-2-antonb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x635.google.com
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

Reviewed-by: Max Chou <max.chou@sifive.com>


On 2025/1/26 3:20 PM, Anton Blanchard wrote:
> Add the relevant ISA paragraphs explaining why source (and destination)
> registers cannot overlap the mask register.
>
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 29 ++++++++++++++++++++++---
>   1 file changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index b9883a5d32..20b1cb127b 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -100,10 +100,33 @@ static bool require_scale_rvfmin(DisasContext *s)
>       }
>   }
>   
> -/* Destination vector register group cannot overlap source mask register. */
> -static bool require_vm(int vm, int vd)
> +/*
> + * Source and destination vector register groups cannot overlap source mask
> + * register:
> + *
> + * A vector register cannot be used to provide source operands with more than
> + * one EEW for a single instruction. A mask register source is considered to
> + * have EEW=1 for this constraint. An encoding that would result in the same
> + * vector register being read with two or more different EEWs, including when
> + * the vector register appears at different positions within two or more vector
> + * register groups, is reserved.
> + * (Section 5.2)
> + *
> + * A destination vector register group can overlap a source vector
> + * register group only if one of the following holds:
> + *  1. The destination EEW equals the source EEW.
> + *  2. The destination EEW is smaller than the source EEW and the overlap
> + *     is in the lowest-numbered part of the source register group.
> + *  3. The destination EEW is greater than the source EEW, the source EMUL
> + *     is at least 1, and the overlap is in the highest-numbered part of
> + *     the destination register group.
> + * For the purpose of determining register group overlap constraints, mask
> + * elements have EEW=1.
> + * (Section 5.2)
> + */
> +static bool require_vm(int vm, int v)
>   {
> -    return (vm != 0 || vd != 0);
> +    return (vm != 0 || v != 0);
>   }
>   
>   static bool require_nf(int vd, int nf, int lmul)



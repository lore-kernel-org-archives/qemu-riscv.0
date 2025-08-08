Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C46FC87FD2
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 15:52:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ukPOG-0003mg-Nw; Fri, 08 Aug 2025 11:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukPOC-0003gs-0i
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 11:52:16 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukPO9-0003YT-W6
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 11:52:15 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b7848df30cso1771405f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 08 Aug 2025 08:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754668331; x=1755273131; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f7oT8vg7HMFo/rfWiiwua42SUDaULdyy8fUyCy39DeM=;
 b=Cy0fwPeVT7Uf0j4+xLRX8B+3AMPfUGiCuTew/dzFDo3YMSleWa2mmqubS36yf7CJ4r
 gOh/fGaxPgS5Q8/W4LWfjXL9RhDVp/QkO3uiiZGfNFPKDqlGKNUfgY7La1adSmtm08wE
 0LHwuSnR1CnxMpXDBFe8oZ7LzzhLNGwxNxJkTm4VJpRcHisz+40xt3cHXcal1aH1EQb3
 DUd2gjlIlN8G6891j6wRlOAx92r2DDvi8I5cbg/zR08JJuHfl7VoN4r/3e1eFM8eFMJn
 U/0QWxk0VzlHKcuNRpByg8Hd7hMi4HZjjLzy9nidAvUhlrrzdA2bAmU5ZX0KTmTwPXl1
 PQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754668331; x=1755273131;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f7oT8vg7HMFo/rfWiiwua42SUDaULdyy8fUyCy39DeM=;
 b=d7go+u6D/1OkmgSXp7fzmZkpwseWN25LjuCiGVZ/+rXj0pez3XGGkKQwpxcEXexQlY
 laLg5/l4QoAZ3g36yAbo4rJy86KUKGaBjs5Y0C6r57Ti/ESaWhT74E0ZRj/GA/iFJyds
 9XPA0JHRsnwVW+zKu8QLdZy1tJFUruLlkOCo/XwR92Eia1H79oHcg7ZIZkc5+LOiPH3t
 85oEiclc9TN17NTYZp56GgDrRK1eCj9uZZdS2xXYegdygwKJsYdCUpevBuXOqELmJa3T
 I2xLASX0fOJhCMQJQduotCy5V+bcyN7FTum0o0f2M5JkhcfgeDjNO4pMH+K1HJ4exjcx
 IHBQ==
X-Gm-Message-State: AOJu0YzWwpOffUkFHx4kGPOiTJHDk/TGOsZT5al0h4ldZ+6+//f56c1j
 8DUQ+F5snQJxKz2Y19l1FcNp4HQHhtHEE/np8MlhAe276vZmXowIqEBwg/AVu/uAK20=
X-Gm-Gg: ASbGncuO+zQV6WCgNIh2qVA0yyRVaGABq6nX7Ihq7xS8zFr3YWBGSl4VbGzH8GZNUba
 waLqB3MNLXno2oX0v/AjuQDiSIHrXKP0cX0b6SF89dSHi7v0Nf6PAmWcm7V4vmTaByhRtYE3X/X
 DWAG24NKL2WBPApCfOQ8ttOpCbiM5lmmbATB6tvh02bzGkq1QLC+q6Riec0YxcaTodUJgwmdPO6
 xgS9BLzd2qOB78Dw19ak+xvmOYhqRYnQnKlSfyCUCcyRHueJNp2moOArSec7r42cc65PCgBtGsf
 2q9933Yv1iZy00vt0Kv/s2dqnqJllJ6CNW0vSItsfKgYrt0lcPGZ3ru24UW2Q89oLsCieTX5ZoJ
 sX2bq7IS8cbb7eomMu7tzW0mv73fDTMgxDC/fkDo+ryIdJKw1HF8FaCj7kCHiOJ2DZg==
X-Google-Smtp-Source: AGHT+IHYn+tlP0TPdz5qomcIZqdRf8ER/rsL3zip1JDD5AGh7alaEnE1zumE4m/yiycVxz0VGHTbvQ==
X-Received: by 2002:a05:6000:4028:b0:3b7:8842:8a0c with SMTP id
 ffacd0b85a97d-3b8f97ec49emr7295254f8f.19.1754668331440; 
 Fri, 08 Aug 2025 08:52:11 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e3d37439sm88430145e9.2.2025.08.08.08.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 08:52:10 -0700 (PDT)
Message-ID: <5f0fb254-fa9c-4e29-a848-6e9b3bc8274d@linaro.org>
Date: Fri, 8 Aug 2025 17:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] hw/intc: Allow gaps in hartids for aclint and
 aplic
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>
References: <20250717093833.402237-1-djordje.todorovic@htecgroup.com>
 <20250717093833.402237-2-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250717093833.402237-2-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 17/7/25 11:38, Djordje Todorovic wrote:
> This is needed for riscv based CPUs by MIPS since those may have
> sparse hart-ID layouts. ACLINT and APLIC still assume a dense
> range, and if a hart is missing, this causes NULL derefs.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   hw/intc/riscv_aclint.c | 21 +++++++++++++++++++--
>   hw/intc/riscv_aplic.c  | 11 ++++++++---
>   2 files changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index b0139f03f5..22ac4133d5 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -292,7 +292,13 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
>       s->timecmp = g_new0(uint64_t, s->num_harts);
>       /* Claim timer interrupt bits */
>       for (i = 0; i < s->num_harts; i++) {
> -        RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(s->hartid_base + i));
> +        CPUState *cpu_by_hartid = cpu_by_arch_id(s->hartid_base + i);
> +        if (cpu_by_hartid == NULL) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "aclint-mtimer: invalid hartid: %u",
> +                          s->hartid_base + i);

DeviceRealize() handlers are part of machine modelling, not guest uses.

IOW, triggering this is a programming mistake, so we should just
abort() here.



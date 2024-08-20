Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B4DC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 05:34:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgHW0-0004Mr-Pg; Tue, 20 Aug 2024 01:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgHVz-0004MD-6U
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 01:34:43 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgHVj-0002rv-H5
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 01:34:42 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-202089e57d8so22407285ad.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Aug 2024 22:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724132066; x=1724736866; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GXYSM9Zyra/rSqnGBi2z2UQWFSueUDyVdF7SYYWDy0I=;
 b=Y5f1Ge1BeIMjOaABhdQ7clnEz6muniwLPmfnnxrpHyW8/tlmbIPONhmZxzLGzUQAl5
 LOG0iWuMeJKqf0iCXx59aZHqq19G1vdWuWnnfxS2CFIBgWIt8nLdr3L1KqNHHpxFH0Ms
 K1x7KV+7PezSGyj4EWIF3nMj4xv20kU9A/dIHZ9lD26HLdXXQePKMeix1IUMHHOAqpN9
 0rCXHR8Q4BvNt8wO/F2KzaPpjiCl2OCanbREgQQaAz1dmrNM4A2rMhxmCjKmLo5bQCQZ
 8byDN+d7AA+ffe9gyoYauMuSwXDPZ2CI0CgS4JWOzYHv32CY+eShJR45xI1IxppyqT1s
 7Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724132066; x=1724736866;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GXYSM9Zyra/rSqnGBi2z2UQWFSueUDyVdF7SYYWDy0I=;
 b=nuf2XEQV4X3caR3JHOsPbAAWNihVVIUgiF/nrdgpvCkhLf4cA1JFAgfRns0qkN9ixt
 NKUgv5pSyUkjaz8PoZNc1/jzSWpMa7NPBEHA9dBN0tCwUcmnTrM7wSMv1DFSpxbE+3R6
 VMVldio5APq0gUscy2Irv7HCYa/NR8MppQLhttLOBVE4j54cDG/ONNOaHuNaAEx++8Mq
 Jxt3zBsnarIR66p0iFlyAQV9eUHOLH0ynomL8WB0GoHA9hlIrDgMn6fmvVa8dbF3Y8Xa
 O+scJJ+iTvkcn+SILGDFS/gaYic4vJitlfxbjKGN0PWkpQddlXcqOBIP3cnzPkM2NuxG
 NdoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvDA02wZ793J3cIB84ECfOn0TB4s2T0YBve6IPB870uVTYejL+enc7dvAgnyUpoBMG0Jb3SIvGu5/dhsoJNpkRYi9gOqg=
X-Gm-Message-State: AOJu0YxmQotqWGyPztxYsGmtnBgOrX0dBz8vkt3n1f0zVvBO2NEmL7Rp
 5/W/eVo7J4JhJIOShLASPW4ou+l9tw7xUIWkQOmgA9ltDqb9kn+WYOIYpkiOKO4=
X-Google-Smtp-Source: AGHT+IFRZPA7WOiQrHgCmKlqgGl49JEekNkGiynEbmVvoOzSeY2z2Uz3Gfin8gHu4lhuKKrrVDLdVA==
X-Received: by 2002:a17:902:e54d:b0:1f4:a04e:8713 with SMTP id
 d9443c01a7336-2025f1bc0f2mr31035735ad.28.1724132065413; 
 Mon, 19 Aug 2024 22:34:25 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.3.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f02faa2dsm70649945ad.36.2024.08.19.22.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 22:34:25 -0700 (PDT)
Message-ID: <4eb1f14c-bef8-4d99-a625-17d20a9a233b@linaro.org>
Date: Tue, 20 Aug 2024 15:34:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/15] target/riscv: introduce ssp and enabling
 controls for zicfiss
To: Deepak Gupta <debug@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
References: <20240820000129.3522346-1-debug@rivosinc.com>
 <20240820000129.3522346-10-debug@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240820000129.3522346-10-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On 8/20/24 10:01, Deepak Gupta wrote:
> +    /* shadow stack register for zicfiss extension */
> +    target_ulong ssp;

This will also require migration.


r~


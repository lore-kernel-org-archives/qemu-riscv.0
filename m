Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6607BC0218B
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:00:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbN2E-0005np-IQ; Fri, 24 Jan 2025 11:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN2B-0005gF-SH
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 11:59:56 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN2A-0003nY-8y
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 11:59:55 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ef87d24c2dso3361458a91.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 08:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737737992; x=1738342792; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EyzSLdrnSlaoLoH41d7rkDSokRQub3XCHwJ1/lPMyoo=;
 b=rPYo7O+E5o+E3v27qPXz6j3mePiRSHT5oEhMzMsveR+wPja7Xzslei/Cdj/5IHrabz
 y3yM38OW5/kVGIymjO6zO8wGe1GIn47qn2lm7yox62ulr4c6i0oQHo43cp+UWpH5aVWs
 qdd/YxCKGZMRRZyyBtPaeCMbvv4VfLsEjaYcRAPgREdE6mxx7Wd+3ub0RjQ7kF5zC0mC
 sdeUcVX7E7ohS2Gz0rJslpOQSgm2YLCgTzf20UG1bvL6pvp8ubMF1ADw4VkznZ2HZsV2
 P8atb4Cs6IqewB/90XVMMQQcrcjYUU49UrDF4qWgJlnKauDYJ6XVddw6S1IW9QcBh1Ew
 wbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737737992; x=1738342792;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EyzSLdrnSlaoLoH41d7rkDSokRQub3XCHwJ1/lPMyoo=;
 b=IFaf4Rw1dTYxldsm8DMXINUvXg9pimpIfuvgPFpclapPVjPIBY1qGimHhFcSuSk4Nb
 nS0245thmm3uSr5yRLkCdhkssHksl0He0ZN+6sfUGfBN8XDQex2NZvVRQ39WWiB19Q3P
 CwPejJhwVMAt6iZVnW/c2AWBoY//CNoWqfIX7tLUqfxe2pxDurPnwliZCJfM4Ap++L4A
 IS+alf+j4rKVc49vBv3lYIDTjxQ76OBObpGFbNBWzf2KHJJBB4AFPWxDNMaNnAM+UYv/
 3HpxHqtQnIycyZhmqzk4zM9gGpcx4xXbI8slO/yD7tFr0WjUhTSsBsI4z25SK0HMpUN9
 /yNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGMS713KWPGBpl7cV/uXylwuOtuoOTtnhXvK65OEPnrZZKuleAbMDRPiY9dPgys+XdJwvfi6OdQ3gV@nongnu.org
X-Gm-Message-State: AOJu0Yzypg2XxbkzIyurvWv7Akda4ws8aBaIp3ToBwZRnQ6cQZmRITfy
 S8wwZCSe4sXw3q43ItIPl6kERAuRqEYGPvD3ZXfLehThQpAWjQp8XcY/C9ACJAE=
X-Gm-Gg: ASbGncv7RyjzgkzUeDb94ZkV+SMfvnRSHC4trApbZ5S+OJ8JWQ8SOQZE13GrLKyf8OY
 HZ9nRYS7VAgbjeSadX8nAdgxmaRViBZ5UexTKxEKKUy1hrn4Yl3pRFEppqLiDBRCnw2+/qaldEQ
 uJyhFjgJQq90cjHOQH9XRi2PdM2HZVzlBcyfHdnkYYd2vOPQ6MHIPVZafHC854mF9moVHCohE14
 LWlikb+KOw5VTjBwlWOWRAwGFyFjBEPxRdTWklHRYNK/4E7wTlRaF1LUVv0son5IOtzGEN+aQzn
 KhizsfjwS7qEWYZDXFI93kZB
X-Google-Smtp-Source: AGHT+IFOVYlVzFkm1eGbZH6NyuseSSNXBSdAKJExMQXd2ARtNWYSmvU/KGoBB4vcws2TjmiJfRVY5A==
X-Received: by 2002:a17:90b:3a05:b0:2ee:c9b6:4c42 with SMTP id
 98e67ed59e1d1-2f782cb68fbmr48395990a91.16.1737737992611; 
 Fri, 24 Jan 2025 08:59:52 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa5700bsm1990591a91.17.2025.01.24.08.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 08:59:52 -0800 (PST)
Message-ID: <9afcb089-2d40-4b0b-84fd-479e8cef831d@linaro.org>
Date: Fri, 24 Jan 2025 08:59:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/28] cpus: Un-inline cpu_has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> In order to expand cpu_has_work(), un-inline it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h | 6 +-----
>   hw/core/cpu-system.c  | 6 ++++++
>   2 files changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


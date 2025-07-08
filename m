Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B38AC8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 21:21:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFIh-00062X-TW; Tue, 08 Jul 2025 16:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZEA9-0005dw-E6
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:39:35 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZEA6-0005Oz-67
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:39:32 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6fada2dd785so69976386d6.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752003568; x=1752608368; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gJfeKqNJvliyVsof1tnXNWGe5oI1E6MCoJRkgy/dOSs=;
 b=bFYw7mg1gwNgZnKiLpXqkNGLSIi8nwjSFt7tGTcWZUUUB1gKh1o8Vwe9BIrwJh12Kf
 PiwwerU+cVjJvirVoxHb1AaGWK698JSptiuSB8CqfvvTC0zO3gK7b5BPwuyzSYLC5QQh
 QYo61v+DRW22WyQiDsfs01sfbKM70+OYWbWfRHEJYXEtSdixdWogdvf2EQYTSOQDjqb4
 cSj8k4diYng+J6gGdE3XeZBz4UeqE0PN9KtyQuYuum5TiSY4169KG2mJQsN/6JFoJeHc
 vIhaIR6XJxpD0Hd9n8a2fo+LnTXx5EIbiVe2+AztKWEY/NBh42u9zflhcoHubuA9Jp2Q
 4v3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752003568; x=1752608368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gJfeKqNJvliyVsof1tnXNWGe5oI1E6MCoJRkgy/dOSs=;
 b=BzvNBTBRvvlcENKN/uUH3tEzaTQ3IJMnNhqUEKc9RGkWxDf9HoopivHqZ7vZc6P101
 RMqXrR2ZrLpFs3biTyC/mNUhRacyFRbWt+L1cuLvOqsJ2qsXD1tA7rqGkjSFWq9QYe5b
 3q6I8/R3fcyBPlYfOAP5IsZzJRxfep43GXtlkohc6J3kk00Ofsmc3fQYRYD+iRfYAsgH
 DEsGtrhRVISxA+zmMd6aMOIW0RFHIJ5UiNRFpA3KImSC/pijJLbH90EEulAJjZMWrIMW
 7tUspDSCJlNjvcDFJu5Mr9RyH4MmZ14XB6WQ4ap35NDhA+CcA6jTHlq2ufGeOLgC/5LT
 4lXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7ZCe0nL6wXOHtlqafvdLv/lwYp4EtHgAIZgBja1cPQhPIWRmXxtb0a5sNi5NGSZHI/G9S9HTqNvxT@nongnu.org
X-Gm-Message-State: AOJu0YzGGMUO7S5Tp5KPl9ZPygwYb0c41y8uAGs7YXusZMoZRtFrCCQm
 WfWeUDtymHWoq0twKMcI3VggMHR1tEfGJKYDtJP7871w+HTjr/DTfeRNS4KJtVG82qkk9TcFePy
 AUM11
X-Gm-Gg: ASbGncudKiZ4VK11DATLhzCKsiwPh2rNg5AZOTSJggCDevdPLRWmaIDe21CsBWyfxSW
 OxC0wergi/VerDWImIIoN68wVXw/GSDfLbpPnnt3qi11bR9bnLG1T7OLaBOSgIJtxc15I7Nh02t
 FI0Km0i1dtZyfbghbVzBr2eY71qT0h5vg5ZCCoU/ckWlO5hq2ZXc+XmhtmOSjj0a7W93z/06TbV
 fiu+BEAFNeg+/spjEAxZ2qu5SRoYIU2g8H1HbZybntj3C1Gta/Z4GaNhoEL8HaTA7IG0kRF92Sk
 8e4IhSLpdLOqSxJvAWzLbIqyIePI4uCdmUv5wCFFjDUjJnFz74oAZEQzzVK61Oe6aqw6M0bOL2U
 =
X-Google-Smtp-Source: AGHT+IEpzc8plQC4rcAJGrcS24kwQb5Eh/ouKne5TQChs8nh1tzAlwlioMkMRwTv9sLvZ7Swcd1aYQ==
X-Received: by 2002:a17:903:1b47:b0:234:eb6:a35d with SMTP id
 d9443c01a7336-23c85e77329mr246108985ad.27.1751995953966; 
 Tue, 08 Jul 2025 10:32:33 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8459701bsm123651925ad.205.2025.07.08.10.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:32:33 -0700 (PDT)
Message-ID: <1b58205a-1794-40db-8e52-d2a4c4a52956@linaro.org>
Date: Tue, 8 Jul 2025 10:32:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 3/8] qemu/target-info: Add %target_arch field
 to TargetInfo
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-qv1-xf2f.google.com
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

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/target-info-impl.h | 4 +++-
>   target-info-stub.c              | 1 +
>   target-info.c                   | 9 +++++++--
>   3 files changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>



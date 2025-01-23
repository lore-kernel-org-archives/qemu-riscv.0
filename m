Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D374CC02182
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:49:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tb6uK-0002UA-Au; Thu, 23 Jan 2025 18:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6td-0008V8-Bc
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:46:05 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6tY-0004TM-Lz
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:45:58 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so16032575e9.2
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2025 15:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737675955; x=1738280755; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sIImxUuZ28chVlLL+vN1mb6UQluYe71i/J3SLXui4EM=;
 b=itmCbki7ffk3xHBpIPIN06jc0HTUKug806avCZySxk0qYjz/NCfbbNVZxGLQVf85t0
 iI07rBujE8aBcF+Gid2P5HVzPz4b3z3e8Qqi/bSbxAFnjzLGcOzc4y5l7abqmGCSLppb
 mV6NFoIgmLn+jeSw9Rs4yMF1H2Bhl/and5yGEEB5F88VWmGTFhMz5+UMEdk3dCH7vOGq
 4aoeoNemb+WUEpEenDgvgczDC60iqbT0YCuLljwij29W3V3F5AgoYIyDaageq9ZSE86+
 eNxXclJ/7Sp+jthuDkhbpm1ZvFvzJP5wH3Zky87QAr7rGS3syT7MoHTrSFPTzgudKg1A
 Oorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737675955; x=1738280755;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sIImxUuZ28chVlLL+vN1mb6UQluYe71i/J3SLXui4EM=;
 b=cMlGM2ry4nh9dOSnTO8Yu+F2Ayk6VICmepP3JFqrO8FgpDJTizKWwVUsUu8JwgKTS+
 9LmaPOtiAlXLOW+QihJ9j64blu7FGKmIg4fZrAxu7oSaF6x4D/3AerdTOwd7PqcKvVlX
 pjBIHUASUEf45on+Eh+GIqYEXpLH7GxnGOY4iw8tDo9nfTaz436HfzOo9407PZ8UoDQd
 ptjmwFTyJIEg+Ds16jISYgfvcTMNCdsBg8HyF+PvoSWkkOCFneAcbB8JV+mr8wVMtu70
 PMlMFnArDRROJui7iYYgswQO+0IaDnt0H3XLYNNgs9Fsfre2YkyF0YGvOn5AKvbYJtVR
 YlhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfK3T2Ui4cOI/4t+j8MKVlRtd0pcla81pgCooK1J60jlImGKWwGKWdlMQ5scxpVKQLr21iDzDG59Ik@nongnu.org
X-Gm-Message-State: AOJu0YyhO7ZNxsAc9jWrOckrSJQvZBhYDfnKrDSoqSxXpC0hl23UdZOG
 tbhEsvSA46Q4o/gtiRhJRauELrBUmZBxpFnkUKGdkDmNsvt2310Vvg+PLJ04fdI=
X-Gm-Gg: ASbGnct+Xe5NfC3OeK4mvLQhwfo8n1z6/ZZjQgknrk5XTTpE2sI6263QfUGKJ0Rp3nc
 uQyaRtUre/gudH7L6jO1rjRbQojHodWO6nFGST9FrgHunXhYNAft7p7VFTzvsUg8glQgu22TIb5
 8DxEbKepue+GnNkvF9YyWAtpkXyLkOg0C1f+TEi1FqjepNKAof0CEsFjVW6vc9lzI0lHNydBIMJ
 U6jOUOPscUwIqvrOVCxNsu8d3HLgsK/JpkQK8cSa+itCQZwbw36KFm7IGjqUWX0VKUuI10yQ1fr
 ETY19iTc7ESt76PICfkc+7BolxEkHjHeKeUWQn6bAbYTdHAC+vOa72BsIgc=
X-Google-Smtp-Source: AGHT+IGfBJfULhniARVxaeHND22dVQGvVM8jm6sNf2yido1MC4lasaduEx+qwJvir1julFx+bnHZjg==
X-Received: by 2002:a05:600c:35c3:b0:434:f131:1e71 with SMTP id
 5b1f17b1804b1-438913cf2e0mr264387845e9.8.1737675955349; 
 Thu, 23 Jan 2025 15:45:55 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47f355sm7140915e9.4.2025.01.23.15.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 15:45:53 -0800 (PST)
Message-ID: <3ef3ad0c-0f53-4588-aaf2-f6fd712ebd41@linaro.org>
Date: Fri, 24 Jan 2025 00:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] user: Extract common MMAP API to 'user/mmap.h'
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-3-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250123234415.59850-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 24/1/25 00:43, Philippe Mathieu-Daudé wrote:
> Keep common MMAP-related declarations in a single place.
> 
> Note, this disable ThreadSafetyAnalysis on Linux for:
> - mmap_fork_start()
> - mmap_fork_end().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I forgot to include:
Reviewed-by: Warner Losh <imp@bsdimp.com>

> ---
>   bsd-user/qemu.h        | 12 +-----------
>   include/user/mmap.h    | 32 ++++++++++++++++++++++++++++++++
>   linux-user/user-mmap.h | 19 ++-----------------
>   3 files changed, 35 insertions(+), 28 deletions(-)
>   create mode 100644 include/user/mmap.h



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CEDC02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:09:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbNAq-0000gm-Ua; Fri, 24 Jan 2025 12:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNAo-0000fy-UF
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:08:50 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNAn-0005LY-Ck
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:08:50 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-21619108a6bso40952605ad.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738528; x=1738343328; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tj/NAv0Ynf2AulVqLQQFTDULGRVSFIkbpyRGfXdGZ4M=;
 b=BHBKWbxYvP5rGxSRV540quJs2nBrqzoOrnJEGv2eRjXQOOT+TANZmsO+D0X0hpVHYo
 3Y0QdjIz81HIz+bar01ELIn9CjxOyKnAeakZcGvXQx9P3hg4jBGOuErfvVi37NNIKMOk
 LWHxPeM6bz6ujXMMtno//CpIn/l0ER+SAdkURYX5gYvTDny+zvvJ0NKAnNRm1Xx4mYqG
 OBO4SNWjtNLzES2TIj2E1yG4JbX9x0Sr8zE28+f2Ie+iVUysrbvDlON1i56DgoNrHCcS
 duvEy02W95WbKF8W8uOSrIuX9x75676y1BvKxrNFy0dX7ivhxjWQ000eecAK77RuIh+x
 jLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738528; x=1738343328;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tj/NAv0Ynf2AulVqLQQFTDULGRVSFIkbpyRGfXdGZ4M=;
 b=iOXaKYPj65IKkLRlLc3nfSNh5qDwMbz4fChee3e2mKAjNbJYXJRgCMWSB4O8ApCuuX
 iEyBbURkhk9Cfl2BfUxN+d6SXFMIlt924L5XDguqY9XEV7Ejr69X9fYfQXukHofy2LPH
 Drdw8iva884NGEh3AwrvuXCKlcVNAJvXHrhch66LQGVTcLiXfuo7f6M1c8mDfaeqrsn6
 d/RwIqjX2C1vQkWPI7bOGWwfvMnOwOHQT3unul6adhj8lqmeGtn2OMhqIo5RKxVag+oV
 XlOQywm2GiVueTjtRR84idsVBjwWTEVwzhxiQR+JcMpb9Nrl7kBbdGsoRN65XRpRoamR
 kn4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6T8dE8JmQUUqx7hx+/zvl9fIKwWE/lHcsUSNd5I+lMbOfn63P4CXKUyAi4ITf6XW0n3WL58hi3F1O@nongnu.org
X-Gm-Message-State: AOJu0Yxe1YlrFU2Q4lTz1ocTOr232Y0iDWdQuTZiuGwt5ETada97I6W9
 5+Prp4voJoG8fhqxKa8wUTfMNU7VB0KlXCH7UrdaUpVuk+xavzcpPDxUhdUvQG8=
X-Gm-Gg: ASbGnct05zWR7HS3C+O4A6nicsAeOL/4pfJnv7t7xihKLJRJpF0ZD13x2k5JV5Ut2jG
 hpCPU0gVW1L2X8zjy/imgmQvDwQQhp1C2qabkKRTl6LKVqEOJZ1+clEUNSKo0ObPhqZZSZm7+XH
 Hb2Yw/prLK5G9GZ6OrJvc47O96CbfYiBeo5lBH54fi7nQds/Xchk683HWzQyO3npSXKf7GyP/zd
 xz1l14/qWrtktlp7/tlUWoXKyI8RpfwTlXjc+f1tYBKTP1QMZQUsiZ6PReFMqzgEAvxXFUjCVEA
 HFW4XU17XBVg5AmtlzxgbQNq
X-Google-Smtp-Source: AGHT+IGXPBp8woQvoDTOIR035IDgH/Ypck/+J/RsSS4cOqAFAF+pT4EZrH4/buBSuaDw0QNnL0Z8kw==
X-Received: by 2002:a05:6a00:be0:b0:72f:59d8:43ed with SMTP id
 d2e1a72fcca58-72f59d84743mr18054700b3a.14.1737738527933; 
 Fri, 24 Jan 2025 09:08:47 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a761144sm2173711b3a.101.2025.01.24.09.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:08:47 -0800 (PST)
Message-ID: <579fb936-8d4a-4967-8130-07ff28e529a0@linaro.org>
Date: Fri, 24 Jan 2025 09:08:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/28] target/hppa: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/hppa/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


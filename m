Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A59C0218D
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 21:19:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcA22-0003UA-Hi; Sun, 26 Jan 2025 16:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcA21-0003Sv-6S
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 16:19:01 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcA1y-0008Op-JG
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 16:19:00 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2165cb60719so64579375ad.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Jan 2025 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737926337; x=1738531137; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X+G0ryUleEoZxvXmUvLzmbIUvRMHYbb2l6B2uT5mTT0=;
 b=DOoJznXee6jjCVqD8YDziyoR2w/JMH6M/OizvjC2df43E7+xhnOnIALv6G4when83t
 pO2XxT1ZqRRwNrxsFe67lk/nY11PTnsAzIBxtsUwiM4c3pmWvuIX79fX9834o2IIdrSf
 6ePVQUlp+LCGm8Gr6IEbKtMNIng192xvS7oQqUSv7JNS7K547smqUNnI8hr1Vp9zr2I8
 J/+z/E16x+XIUcB62WGv6oG3O8r3gURrm64sjjjEadyC4SINj8GYepXJVrFzmVNGDPQR
 6sL157B6QYdY0QK7nBYf8D0su3o74ynPwaeWpQJ0Ku/EG2YPGi+oTh7a9l4LX7LpuAgs
 DM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737926337; x=1738531137;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X+G0ryUleEoZxvXmUvLzmbIUvRMHYbb2l6B2uT5mTT0=;
 b=P57we4y9oMfkF9ggX/oy1ncoU7PdvfFx9VPGGelkf1GiW/AH2c9FpHMq5WdLmfa9kj
 bp9sOSTMkxpCuGGCMn3mgoYtrqMNe+DmohK1hlkCxHEIEXeyAo+WNMbVtFdnR4W1wIKn
 wwl2bxnmaLhFhV/Rrp1tAbRBAtUWAqo6AYxOO31jqpo0tv7Yc16X6M51FZ4scdkRTi4D
 ScnWaHN3ppmzVXSdJx8fDsPKGoiargevWRNcMaXKD3mmZcBAZzXnCSeFhfJzcw0eMam0
 LrrPF/7c02dBjETgVvGCZ7p1v41ry6Y5VTnZvfcUpRElgxLYXy72GKFLujyG02Y0KOSW
 fELg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHrNfHUUujHhg5Os2OS/injcyAhXuFDsHaFyEFK/q6Bi04PRhd7LM4CgrWvQAcDXk03KWujFiw5hQl@nongnu.org
X-Gm-Message-State: AOJu0Yx/llrXmOM7cAPdnLZwFbjwqTvz2cwN5YmCk993BkK2VRB2rJ2S
 rAR78QnWjF67wwUz3UnBy0A44/K7JV/MdFTDJhh96rONbxfo1Ten7f1AOONePj0=
X-Gm-Gg: ASbGncu1TeEzq5SphvgWmoJZwBIfYc4w74Cp/KyAwas9iyM8mCsXBkHtmNPSDOIw5I5
 51WRbYUO7MfaRPRFk9dxYxSr9s4QmiHky/UzBmIfV0PK+LzW82mFuFl6cLCqKs/pr6ABT8HGfpb
 ZKNYIAD1bFzIrvfA81xFTPjInT0VGZiy7L4VhyT0fPNA8X4aj8UPctbhETCRhpiPrHyjvIfwJ1d
 1RQdxQtL4KFBO/JIBkK5hcZkNVZgDIuNrcajBMbsGbltnTxmcILmtCllPyeutVp5zpGZ67bJ8aT
 f/TJ35LsFk1g0cal2Q4w47rvm0nd0kmWMBhII9M6S3siFKPNM65rmVUD2A==
X-Google-Smtp-Source: AGHT+IFqQ9SrCqtaqHBxnEeUe9wIIgiFAi160abwNWKtJLcX5dR1YlfbX/KbmypQ71AFHncXjFvVWg==
X-Received: by 2002:a17:902:db0e:b0:215:522d:72d6 with SMTP id
 d9443c01a7336-21c355bae02mr611350715ad.38.1737926336707; 
 Sun, 26 Jan 2025 13:18:56 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3d9db91sm50141815ad.48.2025.01.26.13.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 13:18:55 -0800 (PST)
Message-ID: <39ee3338-aa9b-4cdf-a06c-ab25341d3cd2@linaro.org>
Date: Sun, 26 Jan 2025 13:18:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] cpus: Have cpu_class_init_props() per user / system
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-18-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-18-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Rather than maintaining a mix of system / user code for CPU
> class properties, move system properties to cpu-system.c
> and user ones to the new cpu-user.c unit.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   cpu-target.c         | 58 --------------------------------------------
>   hw/core/cpu-system.c | 40 ++++++++++++++++++++++++++++++
>   hw/core/cpu-user.c   | 27 +++++++++++++++++++++
>   hw/core/meson.build  |  5 +++-
>   4 files changed, 71 insertions(+), 59 deletions(-)
>   create mode 100644 hw/core/cpu-user.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF47C0218B
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:07:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbN8w-0004MM-Av; Fri, 24 Jan 2025 12:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN8t-0004IH-M2
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:06:51 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN8r-0004yr-1b
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:06:51 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21c2f1b610dso52550465ad.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738407; x=1738343207; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nl9TlDvSQz7lPsffb2aK9GQdrHWl8xDaTDwcj9+AIJw=;
 b=xYIqaifs/nO03prqlMITnfv1RuuL/55eO4td1FGF0zr6kxk8aOzaWQZzoIhAJ/hjMP
 JQwK4djjWEKxkt7iY77he0I7vc1UnmPWYq7X6XvsFnglvXQlJrNhsRFdU69YpW4iNRXL
 oXyUp4gb/+8HA2Gut8+WYXhMTIpD1VYjbB4stFVYGLZbf4uMsGhWdOXftikS05saKaI/
 FXb0sacfoV7qCt1+aJcFvvT9Fqc3LymBkoIun4J1GbfVGiOO5G60RI+ZQzSHUZgNSXOy
 2LQ5/3je+vg6aVwFeVtwfz26yHHP3VaShmHZvxhkWW4rYoxeDKpHY4L+yPIdVEv8hBhx
 3naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738407; x=1738343207;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nl9TlDvSQz7lPsffb2aK9GQdrHWl8xDaTDwcj9+AIJw=;
 b=vHfUoa5aMYPGenjnhR47SUy+SOvZ2l3h0tac0zRKBDRAYh2RCEr3SPYN8JtNreF1Ra
 lgN4O9e/Fa95DDx9z9IYq573lmhnQDdam0cboUBjfOzNk1AXwmAkwjFrvHvyOf/4yidh
 Rjv4sktG26e/z/YGiVFa03GNixI87gIIH+rz6OAP5qhFpKeACWulqKaxn0mSWFuQ316F
 b1tHTP4cYUXHIV6ldJj8vmUetpvdgQOObJwWIB/iN46DjoY2xiCX/RTT+BulbnKwRDLZ
 tk0tkK7c/rojdbVJ0zBbwTdBJ0MgQJdIdfVEEYWDcHD9MJy2goreTCMus76IfuXzxC3Z
 xJrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTQLydWepBZtnofmc0AI3wnSKLUvXtDz5uwP4YqBLTJ/lUTuSgqainmeyLS2rf0sd9nXCMvrymZ/wX@nongnu.org
X-Gm-Message-State: AOJu0YwXF2j9y1RFDSmMTkNU461ZzKPZkASN4bdACIzJjegC12v/edVI
 AdrS0whK3dDtUKA82AuRsbsiT+YuDi7pZTPzIMOi7tjbcCKuHImFai2O7xW4RGFiBayR7mplYL9
 Q
X-Gm-Gg: ASbGncvs5thb8pIO+1Fj8rKTRhlC8GTpyHrsgbDAJuUYcyGeT3rVanIMLv3/b3g6Xew
 fYBqyALOysQbT8RgDWETtMFcozVmLyIonQusm/awrhjDWGG5lhO6fThBPR9zByartCxWsLisK6y
 u+T6YUYtQqcx9ndoviHAD9ZkfMpOByTR1WntOKjb/Atgh5vCZiqGhyvJGq/ET/GMrq8ocBP+EaT
 WsFzF7g8L2UnFnjsiUxOeNek9sjmmXYYqQiaajN9cqBTJeIjwtf4CHYtuaM1TXstPYJW9oDuHxB
 vr2E86ABPU3jVzEg3OLGQqVJ
X-Google-Smtp-Source: AGHT+IE7iKtTK2Qgg2lO0qRa97+WEWxczoEej2Pf5Xl7v6y5ZK+0pmkQgKM55CqclHM70/1IljAUfA==
X-Received: by 2002:a05:6a20:6a04:b0:1e4:80a9:3fb8 with SMTP id
 adf61e73a8af0-1eb214a092emr46315525637.16.1737738407227; 
 Fri, 24 Jan 2025 09:06:47 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac48e475790sm1887522a12.8.2025.01.24.09.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:06:46 -0800 (PST)
Message-ID: <50d3bcb6-d421-4192-963e-f94fcc25064f@linaro.org>
Date: Fri, 24 Jan 2025 09:06:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/28] target/avr: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-11-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/avr/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


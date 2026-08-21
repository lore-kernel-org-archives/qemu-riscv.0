Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDD3C5DF8C
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 16:45:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxSMN-0007VB-3i; Fri, 21 Aug 2026 12:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSMK-0007Tj-JS
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 12:44:48 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSMI-0000t5-M6
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 12:44:48 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-84faf0fa17eso1162441b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787330684; x=1787935484; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AbqaBiunWuN/LvRZX1FaCwbCv223Zk9IBDABCk4POsg=;
 b=qq8EIPytYa/Voz7Gua0V72FgFgKBgjJ4xgl2jjCWqN0mkkzIABNnmMHXN5d/4MrWo4
 pd7DNF6fC45+iDky4XJ4zWA85+5N9nac7H7Cs+3yY8TxdDcM244QxKxN/gI/6IoUv5rS
 sX8C+i+JUdMzC2snzktmlrrGJEXk/yYhMcz0FB+AKs7jaPLR98fkfhgcpRZ0gvbuZc31
 V/CH9eNUS78BuvrfuVZdFVpaEoepBj+FLJJrIvs/jTTonIuRUQ2cHOwhr4i0PLy6ZAzD
 hJwUcSxL2jMWMIgA/Kvt8Dky5OJ2Ww2AiZJ6Nz8LVHpwijTCsk6eC0iDzaznZLm3Q4Ww
 Lo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787330684; x=1787935484;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AbqaBiunWuN/LvRZX1FaCwbCv223Zk9IBDABCk4POsg=;
 b=IQ6pNxtTU9S1q816GZfZ9yHVYq8ciTNBf8SfcvtmRIP8b3FzArXifh8ke2vx4woxpn
 BCafC+eg00YAvLZnh9/UksXotB7UTNNyxk6rFP00qxqR+96epINPQP3vnV7RR2nN8hdv
 uNk/xva1ETHw/JOvSAam4GSc1YcJl9rYret9NHmd9l94Hi6rD++V4nO/yIvicjyfww3y
 Mvq1Ex6q2zzynXovsjg4zxpraGOmq/OIDSD4/VUyhkjL7D/rGKZ+qEeNKGWrDgAdwFTS
 Jfze8jBdZK3kKdUhl0nhIVW1vBQxouBnKbzQaOhTtfJW+sNifxpg+qiCBM3m5Dglbj/O
 lYkw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr8OUg43NhzlPwiltWmMdUCVM9pfH6XnWWMeVqAU2LFmnOsklzAl5rcLr8+37bzohzOaefOlU0ZJ4SN@nongnu.org
X-Gm-Message-State: AFuF++lBkvzSy8swi2VjQvd35d7gjes8X9Rdb7BEqLWV8r3f+X/mHzxB
 PAUghVwjYZ0jpqrO7e5lEhuDdbvTdQWkq8JvLDrmajbEovJhOdsEgletPm4ADAVxEQY=
X-Gm-Gg: AR+sD13Kgq8lwrTxQ5RuMwfnxdd6jYuOlOr2iuiGjTUpGAu8JOpsB+ur3PMvtnB/YWs
 qYt98D6S73S8Wdu61FYBSYli2YSV9LnPIRC84d+kq0WS+hSixixSET9pyXkAWwQUD2b7QhKchg+
 Ba2BDx+6dVwqa0hsOxuMyVCuNtzNJkixnemLN84oof3aaOYxTeO8hVacruv+4v8iVuANbr/X3Ed
 tKmY8O6zU68ZDdCN57eDKMQfY33nrW0d7BXCm5fUkK8PWk8pGPGOfJJeX+Gd7TNZgG4/E6DW+x/
 00rxXK4SB9xvYWBXkUafx9r/bXFJHsFI8YVL/t3NxOG0ORZBCc0CfZCER+OHhpMyEzQWPrXHoNg
 zIxrG2OL+jgEBQfmMCFL2/ptWUlLSKB7lThOgkFL2zCjGecepY84BfyuVwtu3G9NQOyGDiYePDs
 xz1bst6XJZoY9G0G6FwUVtoMClurTEIAlR2OIj84N7zfYJRQRdji4fTeUP/sXz/Vzefj5LqI3eZ
 kgj
X-Received: by 2002:a05:6a00:4195:b0:84f:b01d:3693 with SMTP id
 d2e1a72fcca58-851fa05af7dmr13403307b3a.15.1787330684425; 
 Fri, 21 Aug 2026 09:44:44 -0700 (PDT)
Received: from [172.20.6.168] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d366d65dsm3271690b3a.50.2026.08.21.09.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 09:44:44 -0700 (PDT)
Message-ID: <c9988841-9b74-4274-bf54-b7f5d411b70d@linaro.org>
Date: Fri, 21 Aug 2026 09:44:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] cpus: Add const-qualified CPU environment
 accessors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
 <20260821104950.32108-3-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260821104950.32108-3-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 8/21/26 03:49, Philippe Mathieu-Daudé wrote:
> +#define cpu_env(cpu) _Generic(*(cpu), \
> +        /* We validate that CPUArchState follows CPUState in cpu-target.c */ \

Out of date -- currently in target-info-stub.c.

r~


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7978BC27C79
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 02:49:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sK7qZ-0000KR-HD; Wed, 19 Jun 2024 22:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sK7qW-0000Hz-I9
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 22:48:20 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sK7qU-0006k2-Br
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 22:48:19 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-705c739b878so1175050b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 19:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718851696; x=1719456496; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A8pSmz1Mo9Hb1eoGtaIX7FxiMbjYzcDmeVvWVqMFm1M=;
 b=ydD08ZoOOd9a3i5M4+OheAiS+2MpGD+EwghNdfEb27nAHtcmr6PbhkvCA2NLfRCLmD
 SydAJAsFWgh35RZy454b5WvqGohUxxQeQYX0CSG83Eti/hwmdrLBmLVq42TuQk7YZ1WA
 ktxFgmBIhubZoLhGQyE+v04Ih9EOzVSpJCpPOmQisG/+mcnKbbs6MLa+WoQdIiiKVilr
 xx1mq/riN1FBjKbkrnNy7qUacYJqrOEhe3M49zbD2uhMEZs3Jf+RyCdqUDKrEMjjB4QM
 rEhoXM0d7CGBsyDTpHA4am95RqewNglDr69tnZxZWQYnsek/Cnj8xGv6J3GxywUAzq6C
 MdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718851696; x=1719456496;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A8pSmz1Mo9Hb1eoGtaIX7FxiMbjYzcDmeVvWVqMFm1M=;
 b=ZiZHo5YUTTUXidc9Fe1HFNG/OqrX8DLlz46rQQQySFDKE4RJGeJngBMbly59y3niHP
 Onf9IU1HTXL4On1XZyM3D2p6FCtH+xw+wT/WDELrLxTUhCCvSmtolY80wxtYvEnWpGSI
 LTV2RK+A2RLdL5Pn8hQaJF3t/YepOnLFvErC4irfi544QeqTPkxJ/kBxkQN1UxkpXm00
 RoXdp6B8cg7REQph5CqUdgeyA2vUPIq7JiGhiOVCVvTjvjaBWdd+hk3VybjxjPOSEuwM
 7hl//r1TtcODuTCZxbpH2jFMAGpUdTYa9h4AnEARH3G+EBuES4i3V5Z1pYVmbHF+3Kdj
 SPiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3CQFOQOcjhF3l3P0tw0KqTeRTL9eODvGL6Fy+ZCZl+j3wDlotRMba7Lw62U2FFVGfOSJ0ESMWtGkrkbH0GzEwnkVTyZM=
X-Gm-Message-State: AOJu0YwVdhtnHkveAYSuk0UyIoMkBg3sWnzD7sGk0qHNxjlQw0/kJA/T
 4ULiPTNJRgsvbJ/K+X0+LUoRLL+0WsyMXra8NqASHHsbtJ2kUVe5Y/Rk3W+46Dk=
X-Google-Smtp-Source: AGHT+IE8n840oSp3OQ46rKjT5PQ+SAqe+DC6ISXS+z+i4WqZWa/VnyUIPMgiiM/AkYAZ7RnoFOwZaQ==
X-Received: by 2002:a05:6a20:3b98:b0:1b8:af57:7bba with SMTP id
 adf61e73a8af0-1bcba179d0dmr5627353637.15.1718851695995; 
 Wed, 19 Jun 2024 19:48:15 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.132.216])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706352ea4f0sm1830146b3a.211.2024.06.19.19.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 19:48:15 -0700 (PDT)
Message-ID: <1580f5f3-968e-4aed-916b-d3d5b5ee0cc7@linaro.org>
Date: Wed, 19 Jun 2024 19:48:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 1/5] accel/tcg: Avoid unnecessary call overhead
 from qemu_plugin_vcpu_mem_cb
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240613175122.1299212-1-max.chou@sifive.com>
 <20240613175122.1299212-2-max.chou@sifive.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240613175122.1299212-2-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

On 6/13/24 10:51, Max Chou wrote:
> If there are not any QEMU plugin memory callback functions, checking
> before calling the qemu_plugin_vcpu_mem_cb function can reduce the
> function call overhead.
> 
> Signed-off-by: Max Chou<max.chou@sifive.com>
> ---
>   accel/tcg/ldst_common.c.inc | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


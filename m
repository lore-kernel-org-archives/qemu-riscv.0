Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A682FC25B75
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 05:11:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sDzyS-0007r6-Hd; Mon, 03 Jun 2024 01:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sDzyQ-0007qE-J6
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 01:11:10 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sDpHQ-0005Ry-77
 for qemu-riscv@nongnu.org; Sun, 02 Jun 2024 13:46:06 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3cabac56b38so2020787b6e.3
 for <qemu-riscv@nongnu.org>; Sun, 02 Jun 2024 10:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717350362; x=1717955162; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vf8avGYPfK1pjp+iUujkpgOjYtQ17Y7vKM7SLuav6rk=;
 b=DnqzTWhQ/4l53WXLPEASQY+GAJXDd/QcfOWCz9vzq5xSKB0OY/WrusF7JLpnLdeB8B
 BCuaaAyMJBjQVTsC3spWXC1e8Trp16wrY7rwqxyjtLhJl3pRWc53bJcuJKlWIiB2r1VT
 RldTtFDtlYsv47N2JC6BSBe5AEF4qlqMH8yOPEEJT3eSY9OzZMxWHFELZ+eUb2NHWIFP
 WYeuPEo+2xD8zmtXve0r6O3qqmKOZsUPkLEQdI/FbePKID7y2XSlOonJNtf40IYRQVSs
 Qx8KA9oXsWK9QVLsrFRf6lmyMoj5pbpJAFB2Bd8S1DGyB1hHxzsoPUN/J/td/VVUgRda
 YGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717350362; x=1717955162;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vf8avGYPfK1pjp+iUujkpgOjYtQ17Y7vKM7SLuav6rk=;
 b=IHs8mA07NZrr9kFP9bhl2ui9Ehg+ARHz5sujlHEtkYU0bIh8ckgJKp98AKvucgYwda
 vjIBrI7bVwc+5s9djMAG7Wz63T9Oc9AKl5Kn12XmBUj5QbWypqCJopbwE349+5iXCLgy
 kp1ab9xFfe9nU1P14nN0VE/sv9VkFeN4mTKh9XtrbAJIbkP3m1sO0o7hweaJskzYxV6y
 nsL2KAVpyhJMW4sORhBTN8cCETq9S6WYwMAGH8FHY/RNhpyvlB4bwRu0lVEp9NLXIzDK
 DGZdvBpXplsW0lX5RkeSLcTP6vpz3k8z5LAM/tSc5Tmty4lLPEPUnIvm0neF1z5GjZWt
 Z0Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1nY8SzFC5SwO5+uuRet7xYeINOLIbFAa+q/qzkKF8pNhX+TUCkDRBMgRIlDODxFoemDg4h3d7Af9VfzTjnX3KL296WH8=
X-Gm-Message-State: AOJu0Yx2H1c5F3r6TJAtxBj9LcVikEMjZ/DN5esFP8sWcjGTLuTkSjiE
 xFSw+3VCMtliTRasDwykLd5zcxfXnjf98zHLgxuTC9W7t0Qapx/XBqVZh8R7hcM=
X-Google-Smtp-Source: AGHT+IEkaximBPlWK0TigvaEZPMiQxcud6+feW69n1PHprIXapAyvKsNqyoXSOp6LzmUFjFX0Gd/HQ==
X-Received: by 2002:a05:6808:1591:b0:3d1:e1df:364d with SMTP id
 5614622812f47-3d1e35b9c63mr9483008b6e.44.1717350362353; 
 Sun, 02 Jun 2024 10:46:02 -0700 (PDT)
Received: from ?IPV6:2601:2c6:8480:9270:9cca:35bf:cded:133b?
 ([2601:2c6:8480:9270:9cca:35bf:cded:133b])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3d1e1a4637esm999105b6e.36.2024.06.02.10.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jun 2024 10:46:01 -0700 (PDT)
Message-ID: <1016c817-d1e0-4dbd-8fd9-921bcdc23a0a@linaro.org>
Date: Sun, 2 Jun 2024 12:45:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 5/6] target/riscv: rvv: Optimize v[l|s]e8.v with
 limitations
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240531174504.281461-1-max.chou@sifive.com>
 <20240531174504.281461-6-max.chou@sifive.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240531174504.281461-6-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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

On 5/31/24 12:44, Max Chou wrote:
> The vector unit-stride load/store instructions (e.g. vle8.v/vse8.v)
> perform continuous load/store. We can replace the corresponding helper
> functions by TCG ops to copy more data at a time with following
> assumptions:
> 
> * Perform virtual address resolution once for entire vector at beginning
> * Without mask
> * Without tail agnostic
> * Both host and target are little endian
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>

Why are you generating all of this inline?  This expansion is very large.  I would expect 
you to get better performance with a helper function.

AGAIN, please see the Arm implementation.


r~


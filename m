Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFU66-00047Z-Hr
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 00:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pFU65-000477-CV; Wed, 11 Jan 2023 00:56:25 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pFU62-00056u-6K; Wed, 11 Jan 2023 00:56:25 -0500
Received: by mail-ed1-x534.google.com with SMTP id s5so20802085edc.12;
 Tue, 10 Jan 2023 21:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OIf51JziPOKqlkPn5Fs0//4fxKXW0sO2TyMgf335euc=;
 b=cC/M6oucxUyWx5iAuEVKWCmbq620U25/yG7fknMXv95cctk/ibJ1CyuEZFEairdOJ7
 0eUQr/g8nT68QHKd3cQ0qSBusC9hnwIE4abxFo5tnQxQKT35uznqXIyHo9683IeuWXWi
 qCJjkAfm4LJOeOfG3CbhcC8k42wZEt29+u0l7lIjXyEZd1HXUnL8Feg4GXKg7OTGHKgE
 jMIIR45mnP3ogkeyOuTNdd+9F9orVFLVpN2gd0aGSJFNqNMq0roX3PyFFdTnVQoEP2im
 GSMFUlGcMUc6Cbu9vgsmWGMV6eXVwloKkiiOykrrufwWcG2bG9JT4P++U/eU51YR7XHD
 DdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OIf51JziPOKqlkPn5Fs0//4fxKXW0sO2TyMgf335euc=;
 b=lDqedODrpCvwm9AJdZAhb4C9PxFHZFx3qdkfB6CpU1eYTl8mJP+uBcWosf+mHuIKdd
 5xew1cRcEPncjiSe2ktaZpsEqZL0CEVw90Szgovzu1rI3t+bGbEV16CsHmblchKDl+A4
 tetEQqdn2Rk80JtKKCIwYloEidqKPedWzSt8Cff/o3nkW7LabzJqd8YrJsIkpcSPMfuC
 qJecL3s8Yij1njVBgTjnax9hQYMKuyRx9VSa5Vjd/TujkgKGdS2dD6aVsJZVr95BUqoC
 A63wtBTjZXf1gAMRLB1fjC8IFYah80c65MVRbryaF5HGgt3/gG1dp1MA7RPfoRGQ0jcA
 7OIw==
X-Gm-Message-State: AFqh2konvIisPNrwKsETxurvDuGtbcqFeVkMjUAP53GWuWOZS9AKyVoi
 kc4Ddm0emsjVUTLH0o9cX5TMfZumqrHyrk58uqk=
X-Google-Smtp-Source: AMrXdXu/SCGXEmykJuu4/ozUYoj4qGVOd8YJYpSiVA4uoGZLwZMMu3zjouqm7TNTUD5SfYV7qwRjBLDlJg4Sl610UTU=
X-Received: by 2002:a05:6402:6d9:b0:499:7efc:1d78 with SMTP id
 n25-20020a05640206d900b004997efc1d78mr1010430edy.81.1673416580302; Tue, 10
 Jan 2023 21:56:20 -0800 (PST)
MIME-Version: 1.0
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
 <20230110201405.247785-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230110201405.247785-3-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 11 Jan 2023 13:56:08 +0800
Message-ID: <CAEUhbmWMf33kfkBqF4HXozJ7tbMp9r+BpX66yJ526Tts-6Cw7A@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv/cpu.c: do not skip misa logic in
 riscv_cpu_realize()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 11 Jan 2023 05:56:25 -0000

On Wed, Jan 11, 2023 at 4:17 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> All RISCV CPUs are setting cpu->cfg during their cpu_init() functions,
> meaning that there's no reason to skip all the misa validation and setup
> if misa_ext was set beforehand - especially since we're setting an
> updated value in set_misa() in the end.
>
> Put this code chunk into a new riscv_cpu_validate_set_extensions()
> helper and always execute it regardless of what the board set in
> env->misa_ext.
>
> This will put more responsibility in how each board is going to init
> their attributes and extensions if they're not using the defaults.
> It'll also allow realize() to do its job looking only at the extensions
> enabled per se, not corner cases that some CPUs might have, and we won't
> have to change multiple code paths to fix or change how extensions work.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 485 +++++++++++++++++++++++----------------------
>  1 file changed, 248 insertions(+), 237 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>


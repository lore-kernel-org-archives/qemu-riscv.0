Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B11C4345F
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 19:58:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rwowr-0003BU-N0; Tue, 16 Apr 2024 15:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rwowp-0003Az-W7
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 15:58:32 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rwowo-0006cJ-Be
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 15:58:31 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5ce2aada130so3177634a12.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2024 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713297508; x=1713902308; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0fj1TtsmLXFU5zeTrIW6IYpbVwDQn1C8BlLXoejuuEg=;
 b=r1kO6ezqLIOhO6DUb38ZHR9B39yX+ZrTr+SFqxjvQ8lV13sObZ5AkbaEO97eB005Gn
 75+Uw2D8i5MkwgcVrgO/dVRQsHiNSFNnmYvHNN+Q3DqnZnYs1QcpVzKxysK5FxjGiTvd
 vw1tvHR1WIL8lS9fQC+Nw7HGODlo0OTzi0I0eoO3xyzLj+fLHjbAL9ptU8ZtKPM/WNN1
 WnY5hVSyIKPMsM3z2wrgdFubeoz56QjTxmC8W06oWkX+kTWkVpRo3iN19QeB7uEEAIzD
 naXdpLJvh/j+Q5DWyHiPJa98pYiWJGF33a1N6Qgy+5Wv6yfd5iIwfbS0T1DtLqttzE5+
 ZVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713297508; x=1713902308;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0fj1TtsmLXFU5zeTrIW6IYpbVwDQn1C8BlLXoejuuEg=;
 b=nk24C1LECpOU5+BO84+MtKiWptX+TlMiaJKlcU/moVquXwJI+tLyU76PY9J+aguP2G
 T8xW+qtjQtuSRV42b7ml2ronc9eFsUsKpw3PHsgFXKFZIb7iaoT7kB3L9DqgLS7Jmlo1
 wZAr4wpfKIzUYPe30S586eE59yYgav3e8SJOpNoq2OItzAUqWydDf6GZ7ro3+JpLJfq5
 TebkX95JEQNBlsMMph3Iq3muOurFOwkLq64teliNv3Ybzt44rQrZGuyE/S37vaD0+tr1
 4NvT62ADyPod1dKtfLx045OLw15koNvMpZ5Q1eVONg464B9JdgWHle/bo4xVKwmtAs8W
 FWcQ==
X-Gm-Message-State: AOJu0Yw5rboBSj4GSsL6r3G1/tfNWsZWHuUpofI2oOIE3TYi9g4MJSlT
 v5Hb0mK8O8MIwoiz6uD/t0V6yM3XhQZF8NZZXDi1++t+3DnX+7PcS3uxAyL7xlI=
X-Google-Smtp-Source: AGHT+IEHIrxJd2UYdYuVQft9ZX3BU2XoAfE3Z5gsO3cu2Mg5HW03emwF6eYYFcjaZ49nnKIuqBQoCA==
X-Received: by 2002:a17:90a:b96:b0:2a0:9b66:8e22 with SMTP id
 22-20020a17090a0b9600b002a09b668e22mr10449738pjr.24.1713297508361; 
 Tue, 16 Apr 2024 12:58:28 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a17090a3f1700b002a55198259fsm1868848pjc.0.2024.04.16.12.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 12:58:27 -0700 (PDT)
Message-ID: <4974d780-28ec-4781-8dcb-55b3fd082303@linaro.org>
Date: Tue, 16 Apr 2024 12:58:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.1 v2 2/2] trans_privileged.c.inc: set (m|s)tval on
 ebreak breakpoint
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20240416194132.1843699-1-dbarboza@ventanamicro.com>
 <20240416194132.1843699-3-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240416194132.1843699-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 4/16/24 12:41, Daniel Henrique Barboza wrote:
> @@ -62,6 +62,10 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
>       if (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
>           generate_exception(ctx, RISCV_EXCP_SEMIHOST);
>       } else {
> +        TCGv temp = tcg_temp_new();
> +        tcg_gen_movi_tl(temp, ebreak_addr);
> +        tcg_gen_st_tl(temp, tcg_env, offsetof(CPURISCVState, badaddr));

tcg_gen_st_tl(tcg_constant_tl(ebreak_addr), ...)


r~


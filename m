Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF4BC3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:48:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVkp-0008Po-Q1; Mon, 15 Jan 2024 17:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVkn-0008NR-36
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:48:25 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVkl-0002Ly-76
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:48:24 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d427518d52so66628655ad.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705358902; x=1705963702; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8BcNm4OkgiEyC2mPtuoUrCmMWzBMZ0qH1fxINjOp72M=;
 b=GTH6lKjZaN/UXRMmKcfQFguh92S0N2Zb5/6Q5Kc7yk6U5b+owH5QY0uu9lePkiDpER
 r1X+EGhupk/Y+k1EkIHD6BdZT/pl0lctWFZFi3JEtOwzPs4r3y8Gex//cvG06kUC8BoV
 hDXWJyL+SfrzY62+fd78CK/W719ArmvqfraduQ4C4b8e0LzVIMh2bi/vsZ56HnfB7Z8g
 fEVZfF3AYFxA/Ejm9UAnsXTIrDTHSQWcJQpOgHPr67fHcjKjCNZxqp5AphYWPouvUKg+
 cXX29qkOEIwSU51rdieIEgEHAmOT4u3xvAHPWEOUH+j1SMit92zmDNixXN+I3Hs3d1cG
 yylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705358902; x=1705963702;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8BcNm4OkgiEyC2mPtuoUrCmMWzBMZ0qH1fxINjOp72M=;
 b=tQJp2BJzjHZ7fOuPgduPxOMzJBxNpObP/G9x7K8qw4Fa003rmlUMqpWPfF7Z1i0RRu
 B7PWcN0fY2KXqboiLvtcivW/tAdE8HBF5HA8qGrSrut9aQvklbQHXHbl6t0BrnG/USgv
 FUbd7kCk82oea6jXfj7ZopgKhlILaof/JGZRbsgFsAttpikjS2nzbqIDhgZjTBXA1qD2
 3dpwnCl7ffS9fdvZvX9CNgVibsT62PAXQ4MGQC3X7/CmIDfFPOhx4moY6f3oMu0+8WuJ
 rNLgqRj7LKkLYt+kVMSai9gjAhG6zhPguGlumcCKbWJIuDUqP5df1C1PC3MyO9/E1aqn
 6Azg==
X-Gm-Message-State: AOJu0YyRDoYBu4hU/pf4qWWrXxmVFFuzLDK4O2mDpY9Cy96bqqpEkcVr
 8l9lp2x19dSZBj9npW1SqnLcfc0m9FXstQ==
X-Google-Smtp-Source: AGHT+IFwKxbmffZu4sFlEBXEXB5WgkKgDLkh/AYJImpevFIUW71HKYI95H/onxlHmGCFWsnROsZd2Q==
X-Received: by 2002:a17:902:f54a:b0:1d4:e6d0:34db with SMTP id
 h10-20020a170902f54a00b001d4e6d034dbmr8612289plf.19.1705358901770; 
 Mon, 15 Jan 2024 14:48:21 -0800 (PST)
Received: from ?IPV6:2001:8004:2738:1dd9:85fe:4dd3:358e:ec4?
 ([2001:8004:2738:1dd9:85fe:4dd3:358e:ec4])
 by smtp.gmail.com with ESMTPSA id
 j190-20020a6380c7000000b005b529d633b7sm8583022pgd.14.2024.01.15.14.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 14:48:21 -0800 (PST)
Message-ID: <6265ec79-151a-4e01-9e59-29b1d27de318@linaro.org>
Date: Tue, 16 Jan 2024 09:48:13 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] target/riscv/vector_helper.c: use 'vlenb'
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
 <20240115222528.257342-8-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240115222528.257342-8-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 1/16/24 09:25, Daniel Henrique Barboza wrote:
> Use 'cpu->cfg.vlenb' instead of 'cpu->cfg.vlen >> 3'.
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/vector_helper.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


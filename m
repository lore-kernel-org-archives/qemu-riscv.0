Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126CCC4707B
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:39:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVbu-0003L7-4X; Mon, 15 Jan 2024 17:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVbr-0003KS-0r
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:39:11 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVbp-0000Jf-JL
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:39:10 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-204235d0913so5837539fac.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705358348; x=1705963148; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WY4GznIDdlngfrLdHR9/HtneEkisTOyj1KKl47+tte8=;
 b=Lm93eDo2BV3qhtC8ZSxgLSXho3GG9MDOOuL+7De+pqGELsHHyWhzOI3zl7d11ECcPS
 g2DE2S5SeiOVf9/4iDWqgg/vYMA47+Ly8PSG18kClk+WXFbiYQ0N7szRophIxb9uyjOI
 BkbvfNmohN4m6JxvJOBf4Oh3FTks5YBJ8fCbH+TVEyU6z6ceQXUcTcTiR9PomIwztI0+
 lw9GtmMPPg2lyoxU7VVxmUSzKdJfjMYjsW4VM8/dlEzYW62zHatSPil4vCbBbHXA/XYB
 zNjdTpyvOgonDk5bLM2hbYJQ1MiqVnA9mvFxJ6WwQ/YSW/37XvoRZtbsG0HNqdCcb+k7
 HMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705358348; x=1705963148;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WY4GznIDdlngfrLdHR9/HtneEkisTOyj1KKl47+tte8=;
 b=vew3JFSIriuIjIvxAWCfVBPVIRMPIJehIIr+NG/Waf33hk84qzKsPDbdTPXfkaiVXD
 YnZXY/5P8jFfzslYN8/FjSOtqRCN8kRCFjuR0zHJezDJtIYFI4I1swacJ9Oor5+6qZxf
 YSkOALVzV6Ek02oYGZ33pDjml8bz2dy82daKbBZDO0/F0U81HsUpnTMarbVe8FlHNppl
 5b92hP1TGQ1WBlAB5cnnasGCf+q5VVVAbtAG4rETbTMsv4tgG6VcZFPD2pIlzGJ6opek
 s4tw6fN3lREasMOeE6mQvkn5WSL5PX81d8KhEkmQ6kyh1OZnfILpQV9tfScBtL8oZmEm
 NWYA==
X-Gm-Message-State: AOJu0YyyM1VqvqZ8Oe1UPS+btINC6NDQ1dKu7LBNu74gUNQasTy/TABO
 nSJNOoS3WMs2OXi83IgxC7u5f8npXHtC6a46PfQuBKlNOyu1EQ==
X-Google-Smtp-Source: AGHT+IFzEDnrwlxEW3TWVNjnbVxpG4QaMLLQPbkoMDLK8FNSNjkQ4vYV4oWS2yEGKPK2kitwteBgGg==
X-Received: by 2002:a05:6870:3920:b0:203:a080:2d55 with SMTP id
 b32-20020a056870392000b00203a0802d55mr9104537oap.107.1705358348113; 
 Mon, 15 Jan 2024 14:39:08 -0800 (PST)
Received: from ?IPV6:2001:8004:2738:1dd9:85fe:4dd3:358e:ec4?
 ([2001:8004:2738:1dd9:85fe:4dd3:358e:ec4])
 by smtp.gmail.com with ESMTPSA id
 mf8-20020a170902fc8800b001d58b7cb7c3sm8111698plb.90.2024.01.15.14.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 14:39:07 -0800 (PST)
Message-ID: <22a41209-07a0-490b-9e57-477c160f4f94@linaro.org>
Date: Tue, 16 Jan 2024 09:39:00 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] target/riscv/csr.c: use 'vlenb' instead of 'vlen'
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
 <20240115222528.257342-3-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240115222528.257342-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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
> As a bonus, we're being more idiomatic using cpu->cfg.vlenb when
> reading CSR_VLENB.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/csr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


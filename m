Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98994C3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 20:17:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPTON-00086A-4C; Mon, 15 Jan 2024 15:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPTOI-00085B-Vr
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 15:17:03 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPTOH-00081x-JE
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 15:17:02 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6d9bba6d773so7932589b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 12:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705349819; x=1705954619; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=orfheqfIjpc5QbZXYJ06+FmeezWWMsnM+s+VAsfR4xQ=;
 b=WopiEm9pTCjdEfwPphWL0bo+//u+EqFAK8SqzbuuRphMwzlMcBFJ8VhgltdyLya8sM
 4smgObRSEHZAY2u1oTFitGI5fiNHb5xkryqQXFoUFw5pGyjAN85g0jzBn6KvOlU1jZdb
 VKB6a1dayjthopBvkLo+lartox8dblZiH/csMnq4eEWY63tijCEFgabm7VWuC8Lsp0I9
 MrBN4tUhTOYDfE/NXRgQaoK4Qxq2/u1Ih9AMmnJByNUZqW5cirmOWQvUrFNBhoaGzwJP
 2VBsAdhbGXPo+89xU5bQP5taQmP/1BLzffie9WSB2tEB6VGcar6rGaONakmV/VxsrhgO
 Udgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705349819; x=1705954619;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=orfheqfIjpc5QbZXYJ06+FmeezWWMsnM+s+VAsfR4xQ=;
 b=OZplPtlJBSltWOy+GVKA7BaApdIo6uY45U/Z6Qs1gS8Q0VgrzzIRbZTXBr46oLYgL5
 EqFjOme6kRPa+fDcQsxH+hGN8LbRBmByUvjigoX9qzpLJQ/ll/Im0pI0acv8Q4UE0NKJ
 vyCH9OU8qqDr51kVZ7tLPtev6TEI7cJmyEBhAhuZYtICtj1vvk9cixKPDYgEOeoDAznU
 99TaY2z+yDwGzcQTPXWOUho7BT/aOqxzR5mhv0EF7xloXyplS1Db70BuQN5XAbPplW6w
 v1cjhmmE1U9NmPxfhvbAzWdefkt8b/0ZqV5ePjdsTMABubsa/Gs3ZxZeCbFRfoyV4CX1
 G6OA==
X-Gm-Message-State: AOJu0YxEPZAHVVJwYhS/sayuyalglaY9IRzkScKZ6eINAKnjk5nG8QcV
 NXy+U1YHNdM3TCsLBWCZpulRs8NM50VI4w==
X-Google-Smtp-Source: AGHT+IGlJKM1qGMPY1G/MdELffRUhAOAai97hEcpNcRoufSWHrIWEfBw4HXm8RtGZQw9UKwGwm82Vw==
X-Received: by 2002:a05:6a20:e606:b0:19a:e284:5b21 with SMTP id
 my6-20020a056a20e60600b0019ae2845b21mr3091791pzb.74.1705349819460; 
 Mon, 15 Jan 2024 12:16:59 -0800 (PST)
Received: from ?IPV6:2001:8004:2738:1dd9:85fe:4dd3:358e:ec4?
 ([2001:8004:2738:1dd9:85fe:4dd3:358e:ec4])
 by smtp.gmail.com with ESMTPSA id
 ky16-20020a170902f99000b001d5af7fbda0sm5090942plb.122.2024.01.15.12.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 12:16:59 -0800 (PST)
Message-ID: <497a1756-c936-4681-98be-303cbffd6918@linaro.org>
Date: Tue, 16 Jan 2024 07:16:52 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] trans_rvv.c.inc: remove vlmax arg from
 vec_element_loadx()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240112213812.173521-1-dbarboza@ventanamicro.com>
 <20240112213812.173521-12-dbarboza@ventanamicro.com>
 <32238550-8008-4771-9a1d-755be8c19384@linaro.org>
 <dbe10a18-163e-4457-92de-68e2f100217b@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <dbe10a18-163e-4457-92de-68e2f100217b@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 1/16/24 04:57, Daniel Henrique Barboza wrote:
> I am now wondering if this is worth the trouble, and we should instead do:
> 
> +    int vlmax = cpu->cfg.vlenb >> (s->sew - s->lmul);
> 
> Like we're already doing in patch 9. Patch 12 would be a similar case.

This is more like what I expected to see.


r~



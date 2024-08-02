Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80577C52D70
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 06:49:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sZm6C-0004VQ-8n; Fri, 02 Aug 2024 02:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sZm6B-0004UF-LA
 for qemu-riscv@nongnu.org; Fri, 02 Aug 2024 02:49:11 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sZm69-0000Cx-UE
 for qemu-riscv@nongnu.org; Fri, 02 Aug 2024 02:49:11 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-7a115c427f1so4949902a12.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Aug 2024 23:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722581348; x=1723186148; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1XT25LlmPDhPO2b7/0lbnD/fY7z8TW6QtI0bYE+GIck=;
 b=VvQsTpZHxBr6miBMSCEiM4USw7akp/whm2gcLSbVReX1/8193KOQV2ny9UrcFIK3cX
 6721qMYPEuztF29xFOQw1QfbTXGv4hf3/JmqTSIAmNrurJVbeYLUrxIBb/RhF08PJm/P
 UfVYRNi/DBkAv3uMn9EsyTd/NVvKe5eD6czw+lTApYNAckDOZU/hNKzQR3am3y2o2AFc
 2Alq52lfWImDgeueH2yel+IXjSxdhPbjiyraUSeXzWzbk/8tWktYqWf64Xd0x1ihwzQU
 BQN87DDfl2gGwP0iojOV/EdUTGa9yASY0Gx1c8BAuv4EYmdzxYw/2Rt5FA/UBk9u03/o
 gaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722581348; x=1723186148;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1XT25LlmPDhPO2b7/0lbnD/fY7z8TW6QtI0bYE+GIck=;
 b=CzQ7hUppNj+Xghg6bDT4hqToCBg3AxWsvrdC6PTrDaH0EjojWTeSW65TPwk8YJ0UpP
 HbTKZgcKcvlG5sjUiuek2VOBuMDxZSubGUXk212K59h0hsZEpq0JHdAFio/De5XEkNkW
 88nrp2L1JeEx0VtjYC45dPttfOzfgEDe2zNkP7LlSwNjto9eSRxIjvSE2vwEMYd2nt0e
 Gant8ozPvEDn4CbSYkYzA0y8AE7BwJbW22vK9uSrX3mJntgrXhx8vPmhuDFZov7zL8vL
 GUAPXkvN9kp/57530YhzXaLmVvxvCa27i7bPOP1ptsqSMONTkGSkH2+bagqnc5II3xRn
 sO3w==
X-Gm-Message-State: AOJu0Yxr0NT15iYziilprP/9r26j0OqltMdY8ururZzx+ISYaZ6G4Dwp
 GgHgx1vS9sKI7XMlEpk9j2+F3NQJLnRAaZmOqFWq6+k2sD5qc/RlYvKyABUz2F0=
X-Google-Smtp-Source: AGHT+IFy/ilY73Qlg0jeTTPW7kOWnWvsHUgAm5sC1gjPyRsStDpvWdFsZ9ittRnd/0aDlthqAb9FMA==
X-Received: by 2002:a17:90b:194c:b0:2c9:6f03:6fd6 with SMTP id
 98e67ed59e1d1-2cff941b383mr3217398a91.17.1722581348348; 
 Thu, 01 Aug 2024 23:49:08 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cfca29fd5dsm4651093a91.0.2024.08.01.23.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 23:49:07 -0700 (PDT)
Message-ID: <9c090b8a-24d5-4bec-84e1-be59e4faa55a@linaro.org>
Date: Fri, 2 Aug 2024 16:49:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] target/riscv: Relax fld alignment requirement
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com
References: <20240802031612.604-1-zhiwei_liu@linux.alibaba.com>
 <20240802031612.604-4-zhiwei_liu@linux.alibaba.com>
 <05d5a772-a7b9-4bfd-8ca0-f85dcf2d1505@linaro.org>
 <eb6a4c26-dd25-4be6-aca7-e0ef1b133d7a@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <eb6a4c26-dd25-4be6-aca7-e0ef1b133d7a@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 8/2/24 16:27, LIU Zhiwei wrote:
>> Does this really have byte atomicity, not atomic on two aligned 32-bit loads (which 
>> would be MO_ATOM_IFALIGN_PAIR).
> The specification doesn't rule it. I think we can choose either way. The byte atomicity 
> may expose more problems on alignment.

Ok.

r~


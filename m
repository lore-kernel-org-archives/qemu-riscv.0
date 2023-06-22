Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A12EB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 13:32:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCKPm-00086h-28; Thu, 22 Jun 2023 09:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKPg-00086I-8z
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:31:53 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKPe-0000EQ-Gg
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:31:51 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1aa291b3fc4so4179835fac.0
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687440708; x=1690032708;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tPy0MhJ45udoapcdbP9D05S2hLShXNbM4wRvFC100Zg=;
 b=DSpYxdjijWcQ/Q6SY2dvjTgc4tirSF3jdFUWrn1bFdsNrwlG2ei3yPwbLcZSfuGehR
 WSHg7S2oKgSAbVWJPPvc+HBfC8sD9oBV7Ej2E9JsFsadZOnvNAHVnXjoBetHYcEe97vS
 TlAs1bCB2oVeKxJ4+xM6YqpKsOiZ1JAHoA25Pf9S/xvkXQTI3KhqAvRvQytYFEkcT9ww
 6KV4iB4tE1d+r+jbltU86P3D2pBqGqKRTIkfqKMdsmabZ17D+mSeNTV1lOsM9ic4E5RV
 2JHIPDQMiyTWSlaFXkalKwt5bbncTS0GbGQl4FUHjOKwaisfVjaRIFAdTkmF4ffonpjE
 mACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687440708; x=1690032708;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tPy0MhJ45udoapcdbP9D05S2hLShXNbM4wRvFC100Zg=;
 b=Lvbb9Rx7BOVBTiGSM3gQnS7bkcuHTP2tcG8eICaM9ZUNYJlI4GaoSAqKOo+EWGXNtD
 15HOaZJBjbDZdKuO+P0h7zgyy51BkdK2efEqPKh+j1ebe/nKG/F3Ckf6Z82ewXm7Bu2c
 YWgJtlx0borIIdctlUHF722rMZjev/dsruSqzot93ahmmIAxSNdTeoA9CHkDeyCBxGO9
 zdMfrJklNfeXvUAkfBNM8uK1IBp/y09qQgdePpWv7wV7A4OJa7LAiDg/XlNEN5wvNq7k
 0eaaeSnSNmyG2Px2ZHmzs2vguA/dDwLmSMuXGaS432B7k5D1o/uEoduWywiXbPI8fJTh
 EVPg==
X-Gm-Message-State: AC+VfDz7PP6uNblYBQTOcEZnbwbWI4JasWkE29gNaqkY9l48H5sBTWrV
 8va2hcVEsL5I9R4h17B5188Gog==
X-Google-Smtp-Source: ACHHUZ6ySwUtJgq1L88+gLKr1MKsK8BdHjnpC3OAW2lZEHC+eGlL0IjAQ7d2QyokYhiP5qFSGMZmAQ==
X-Received: by 2002:a05:6870:44c1:b0:1a6:c761:d511 with SMTP id
 t1-20020a05687044c100b001a6c761d511mr8729412oai.43.1687440708639; 
 Thu, 22 Jun 2023 06:31:48 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 b43-20020a056870472b00b001a993936e88sm4105791oaq.47.2023.06.22.06.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 06:31:48 -0700 (PDT)
Message-ID: <7952aa6d-4657-4755-d65e-ac3800cae273@ventanamicro.com>
Date: Thu, 22 Jun 2023 10:31:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: RISCV vector cryptography support
Content-Language: en-US
To: Sivachandran S <siva63@multicorewareinc.com>, qemu-riscv@nongnu.org
References: <CAL==hzEn=YoaFgiTj9Fm8bBPP7Ea==R=gZFyEO6JN8nSYyefLg@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAL==hzEn=YoaFgiTj9Fm8bBPP7Ea==R=gZFyEO6JN8nSYyefLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

Hi,

On 6/21/23 22:24, Sivachandran S wrote:
> Hi,
> 
> We are working on the RISC-V virt platform for one of the projects. So I would like to know whether the QEMU supports RISCV vector cryptographic instructions. If so please let me know which QEMU version supports it.

QEMU doesn't have vector crypto support at this moment. It's currently a
work under review:

https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg05580.html

Depending on how the review goes, QEMU 8.1 (to be released in August) will
implement this support.


Thanks,

Daniel

> 
> Regards,
> Siva.S


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0C7EB64DC
	for <qemu-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:24:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDZ5m-0000tK-SO; Sun, 25 Jun 2023 19:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDZ5l-0000t6-87
 for qemu-riscv@nongnu.org; Sun, 25 Jun 2023 19:24:25 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDZ5j-0001yf-Di
 for qemu-riscv@nongnu.org; Sun, 25 Jun 2023 19:24:24 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1a998a2e7a6so2871458fac.1
 for <qemu-riscv@nongnu.org>; Sun, 25 Jun 2023 16:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687735461; x=1690327461;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OsZmkpR6WDcTc+O/Rxg7SSe6pz6sYv/ySDn9CkoN/Is=;
 b=g49plx3/bzzr9/vAdUX/OWPOud/jaFLRL2t4jiCamdwHnXAWNY6FivOx5JBrW6sMOM
 rb2007ByPVu9TU1DYHgzaenB5ZDfuK7Bl2Z/6JcStXZPTf1u9tQO1klbbueUGtvIkIyI
 KSRf2DIkxl3zyYCq1Q9dGQ9WQakEmdSXY6uWEbjKpJzC1HGPrKU4ylCalkhozj7ZzavH
 yXE9dpZidSoN8TWSD35BPicUgTY5358oWDEUKHrXQA8lOl+5wRBn0We/OvrnaNaY5Y5y
 yD1IiSM0qCN8YbsBVYK4JNBvsxey+ieF0DWcXcgA7YTaNN08103x1iCbjHkD9YN1Id1w
 ljew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687735461; x=1690327461;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OsZmkpR6WDcTc+O/Rxg7SSe6pz6sYv/ySDn9CkoN/Is=;
 b=DBlr9a4wPfSc5HH5+23ixZAyAjw5wQkoSnt4H4N2bWSQbnRgRnpA1dRb33dWmNLmk+
 tvpssR8sFBJ5KFNqEkfq76KEhoeFcDO4Lej2+up+u2vOZfjsxEqjbgM1xQGOnSDbUZbn
 /sapf79f9rTfusUQFsZSUtrim+g7Fhs0EJBqtOE9EWnTFSGtV7oYd7zBcuelu/DUnT0W
 UxZGuDNmNBtOaqL3MySpxn3bgklS+nUK/imurX/oesz7oaV0MofqUmyX8m5hWASQYngV
 LWG98kyvESpdOU4kr8g37ShMAvifBfRwHXlNjo/2pDdR7V6+uXEVWbQ3PwlEOoOPgK3f
 o84w==
X-Gm-Message-State: AC+VfDyJIYGZyvhjL5wI4yV2IOZmu6rwA4lzB7UGX1dDdxmnkuDLDKTH
 OdJzBzXB5wSpks4CwdKFyY62Qw==
X-Google-Smtp-Source: ACHHUZ7bXJIbgo06v1AphdhKPfHm0qwkHrblrekctbf1LIkpiTMfV0L5w1aps34sYCpSw6JTojWZPQ==
X-Received: by 2002:a05:6871:6ba3:b0:1a2:a0d0:431a with SMTP id
 zh35-20020a0568716ba300b001a2a0d0431amr19017692oab.29.1687735461552; 
 Sun, 25 Jun 2023 16:24:21 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 hl17-20020a0568701b1100b0019e8deb387bsm2837974oab.53.2023.06.25.16.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 16:24:21 -0700 (PDT)
Message-ID: <a998a5d1-f397-4925-d61f-5abacf44fb96@ventanamicro.com>
Date: Sun, 25 Jun 2023 20:24:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: How to enable Zicsr extension support on qemu-riscv32?
Content-Language: en-US
To: Tommy Murphy <tommy_murphy@hotmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
References: <LO0P265MB686600A85E9B6F3AEFAC066BF921A@LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <LO0P265MB686600A85E9B6F3AEFAC066BF921A@LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 6/25/23 17:44, Tommy Murphy wrote:
> Hi there
> 
> I've tried searching to find an answer to this question but with no success so far unfortunately.
> 
> The issue is discussed here: https://github.com/riscv-collab/riscv-gnu-toolchain/issues/1278#issuecomment-1606108826 <https://github.com/riscv-collab/riscv-gnu-toolchain/issues/1278#issuecomment-1606108826>
> 
> But the gist is that I can configure, build and use `qemu-riscv32` to run a simple bare metal "hello world" program fine.
> But if I add a CSR read instruction to it (e.g. `asm("csrr t0, misa");`) then I get Illegal Instruction.
> 
> This is the case even if I use `qemu-riscv32 -cpu rv32,Zicsr=on hello.exe`.
> 
> How can I configure/invoke `qemu-riscv32` so that I can emulate CSR instructions?

rv32 already has Zicsr support enabled by default. There might a bug
somewhere.

Please file a gitlab bug (https://gitlab.com/qemu-project/qemu/-/issues) and
we'll take a look. Don't forget to mention that you managed to reproduce the
SIGILL using upstream QEMU as you mentioned in the toolchain bug. Thanks,


Daniel

> 
> Thanks a lot
> 
> Regards
> Tommy
> 
> 


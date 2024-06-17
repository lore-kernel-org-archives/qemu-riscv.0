Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5887FC27C79
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 13:12:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJCA1-00052o-O8; Mon, 17 Jun 2024 09:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sJCA0-00052I-57
 for qemu-riscv@nongnu.org; Mon, 17 Jun 2024 09:12:36 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sJC9y-0006D3-BV
 for qemu-riscv@nongnu.org; Mon, 17 Jun 2024 09:12:35 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1f44b5b9de6so34085425ad.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Jun 2024 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718629952; x=1719234752; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HwdKiVxFxtY9V1sqqmu+3oeUqV4LqIYMRLmi22/1Z24=;
 b=d5DbvHIJt3puWGo5QslDRBUjYqlEXESJCNiYoY1CxHIBbujUe33tkcQFtm9wkOshjs
 uMMuFfi4SmQKMjGsviGEaSyGb5uPMfINfpCYBzxSI49yx4wWKpr6I5Dp6IXIgK/lC0FZ
 +4HczNKGGm3J95P/VxNLblmA91Y+Iw5L5n8Oi6p22KKt8SjbgX6mdjFPlansStM1NyRX
 Hc8FbEpJZoV1ZzTG3+6Fzyp0yG/rgS2l9HW47VG06ZoeOH+/FQNFRh09il9kX9Q/F4o0
 CMAIaN++IIwQMfFaTTxFib2WazfYAWn6Dgq/RdN17SWYabCXWadn2BVFzbFayXZ7jVQ7
 DAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718629952; x=1719234752;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HwdKiVxFxtY9V1sqqmu+3oeUqV4LqIYMRLmi22/1Z24=;
 b=iOwmbe+6agl4G7Q07DL2vSYFWImOoJATycRsHiRIFHSzjbbto0Ibs90HQkeYzXd4Sx
 RBy6IlMdZ6YB7wkQqBwLnPjwiwnqxPbdaY3zHsrviVsn3OWyEQ9CxFmkvUnqHgkIqXC1
 6kO74oDrIH+AxtbPODUsfedGKgT/+2U0A+txGw8hnVO1MgyVM4v9YzI4gjHzcEBitMxW
 nlxdTILNRNcqq/+cFcrVzmXoK4kZlYNNgU6gidZPo28GP+cXpV7pPTMbbBPLMUsmhivM
 K99IzOY4XbXCAo1+JJ0qaw2kqzN70aEQMHgEpa8nNhhvFQ/ds9l3RBb8WctkZo7tNwPK
 fLmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW46ouNwXbh8V07SJPDAgusigDTIMT8SveBVghsT4bfHSti+dwq1nYBJK1tsQQ5P6tvJrVujFHdWv9J9sFxTSL5jTQThVg=
X-Gm-Message-State: AOJu0Yw0/gd7ZvIyR46Hdfl+8C40y+1yUFJ2xVCk9My4ajkGZY21EvVG
 1MP+vplV1zQxrrU6CLkFxfMSKpfwPD/swTDZbiFtC7av+Yq2VtJf22URDCyVjio=
X-Google-Smtp-Source: AGHT+IEssVBoSBOPMgL5sKctR0s8+YnNASjwoZ8VjJHw7TlBjCHRV5ySF3uFK4f2D+11R3Ueh31D3w==
X-Received: by 2002:a17:902:c40f:b0:1f6:f298:e69 with SMTP id
 d9443c01a7336-1f8625d4e3bmr95711675ad.13.1718629952225; 
 Mon, 17 Jun 2024 06:12:32 -0700 (PDT)
Received: from [192.168.68.109] ([179.193.8.144])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e80899sm78753595ad.110.2024.06.17.06.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:12:31 -0700 (PDT)
Message-ID: <d2d6b4e5-5c67-4d60-aed4-711516e82359@ventanamicro.com>
Date: Mon, 17 Jun 2024 10:12:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can I utilize the RISC-V vector extension with QEMU?
To: bithamr <bithamr@pm.me>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
References: <36ZoNSXT5RGlpioKZQ9MNoGQIkfIrbYrGvZoO1dEDYPislzbwlGo7eHJBx8vPfhwKiJIBnSkbMw5umxr2WuUltrDIRBvnl8SW_6hKyb3YCY=@pm.me>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <36ZoNSXT5RGlpioKZQ9MNoGQIkfIrbYrGvZoO1dEDYPislzbwlGo7eHJBx8vPfhwKiJIBnSkbMw5umxr2WuUltrDIRBvnl8SW_6hKyb3YCY=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
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

Hi!
On 6/13/24 9:41 PM, bithamr wrote:
> Hello!
> 
> For the last few days I've been trying to see if it's possible to run a RISC-V QEMU instance that has v1.0 vector extension enabled:
> 
> https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc


To enable vector you need to add the option 'v=true' when declaring the
CPU. For both qemu-system-riscv64 and qemu-riscv64, this command line would
enable the Vector extension:

$ qemu-system-riscv64 -M virt -cpu rv64,v=true
$ qemu-riscv64 -cpu rv64,v=true

'-cpu rv64' is the default CPU QEMU users for RISC-V 64 bits. With this option
you'll add Vector support to the default CPU.

Depending on the QEMU version you're using you'll also have a 'max' CPU
type that will enable (almost) all extensions that QEMU implements,
including Vector.


> 
> I found the following documentation:
> 
> https://wiki.qemu.org/Documentation/Platforms/RISCV
> https://www.qemu.org/docs/master/system/target-riscv.html
> 
> In that documentation it references extensions, and how some of them might be enabled with "-x", so it seems like it might be possible? But overall between both the wiki and the documentation is was unclear if any of the virtual CPUs present in qemu today actually support the vector extensions (and if so how to enable that).

The "x-" in an extension/option name means that the extension is being added
in an experimental state, most likely to allow for early development of other
parts of the SW stack (kernel, toolchain, etc). When the spec is at least on
'frozen' we remove the 'x-' from the name.

As for the docs, yeah ... we're missing a scalable way of displaying all
available extensions a CPU has. We have a dozen extensions added in QEMU
every release and that would be nice to have. We had some efforts in that
area in the past and hopefully we'll get back to them soon.


Thanks,

Daniel



> 
> What I have so far is a copy of Fedora running in a RISC-V virtual machine for testing. I found the following virtual CPUs come packaged in with qemu-riscv64-static:
> 
> ```
> rv64
> shakti-c
> sifive-e51
> sifive-u54
> thead-c906
> veyron-v1
> x-rv128
> ```
> 
> However I have started the virtual machine up with each of these CPUs and tested them using the following program:
> 
> ```
> .section .text
> .global _start
> 
> _start:
>      vsetvli x0, x0, e8, m1
>      li a7, 93
>      li a0, 0
>      ecall
> ```
> 
> Each of them returns the following:
> 
> ```
> $ as -o check.o check.s
> check.s:5: Error: unrecognized opcode `vsetvli x0,x0,e8,m1', extension `v' or `zve64x' or `zve32x' required
> ```
> 
> I'm kinda getting stuck so I thought maybe it was time to reach out for some help, I really appreciate any you can provide: can I, and then HOW can I run a RISC-V qemu instance that has the vector extension present?
> 
> Thank you!


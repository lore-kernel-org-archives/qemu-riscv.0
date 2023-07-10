Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D37EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 17:54:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIv4e-0004sv-Gq; Mon, 10 Jul 2023 13:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qIv4Z-0004Zc-El
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 13:53:20 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qIv4X-0000kW-CP
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 13:53:19 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-565f8e359b8so3328263eaf.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Jul 2023 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689011595; x=1691603595;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2eWXn/x2kaQDASsY/OllvW6P01FuSA1hbLP2PSYUIt0=;
 b=Zya4+kmA6lIuks4v3poYKABlrA1eBIky71RDLXR9ODIXw9Som/V/yXBExrVMk6HMkb
 ibWhC0ifmpqin9KD10GYt6XvGM8o+SVSG8c9HKY85/5R+2eccRP0ogSWrRbaUoViMr2x
 Z++S8FhTYI507Rfe3TUKnquXdBNgjNNU6jjZUmValnQzG377MX6+dICqcqhL2jOYVetx
 H17yy/xzqYo61y85nPQUdvmUo0QOkarOpu140jv0Wm5Rs8ZTLyWezVTtbCARfoHxSWX6
 wEd9beZfB3c9TcF2Cd7o+l4BUrJewlhXNWs8E9C8vwu2/jkjy4LxGaQaSb7Zrc5qv1qc
 AE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689011595; x=1691603595;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2eWXn/x2kaQDASsY/OllvW6P01FuSA1hbLP2PSYUIt0=;
 b=UncGZnXoUedWnSSOFBN84I6n4pzxek4rdBqQeGMlnncSOuR2Xcq/Aku9Dw7PvyxVyq
 KdyLj4mlwEcWKzzY6AE8fcXEZAKdWWsPzyrKWcjag/+JKt4aaGNLGBJIFpjgz4A857ES
 920WB+6Ue7OoSyURThoecbr2OZiqqe89Kq2gfUAkHfYtY3JVjQLS0letbrMbH7giGNkk
 ylTDUliWZGiWc1E7DNpEZzMqz3huhSofzReIzgRH4oAXPYhh1vitZNCh9k9F5qHg9Z/p
 QlkiZm9+phcywed2i7Tw6fY0ELbxyMqDgu74NfkEwBg/HQkoboPFPixoJkrabfOGxyzW
 PtlA==
X-Gm-Message-State: ABy/qLbQ7q1vvvmtoHYqwUfSUcThhftQCbaYJIPMOo4fAAvUj0teeXwH
 Qa7XgYCJx5kTubivTrfHdB7cwaEcYgy5y15APJ8=
X-Google-Smtp-Source: APBJJlFm8cF9N0yM39L3eYT/af1w8U/kK1VB0o9GY38ya1vYwu/s2JYIKJ0kMtkOhPE7aUiCITruIA==
X-Received: by 2002:a4a:970b:0:b0:566:6aa5:75b4 with SMTP id
 u11-20020a4a970b000000b005666aa575b4mr7561043ooi.7.1689011595246; 
 Mon, 10 Jul 2023 10:53:15 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 t5-20020a4aadc5000000b005255e556399sm39685oon.43.2023.07.10.10.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 10:53:14 -0700 (PDT)
Message-ID: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
Date: Mon, 10 Jul 2023 14:53:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: qemu-riscv <qemu-riscv@nongnu.org>
Cc: Andrea Bolognani <abologna@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2f.google.com
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

Hi,

We don't have a 'max' cpu type in riscv32 and riscv64. This is a special,
fictional CPU type that has all possible extensions enabled. It can be
either an alias for a real CPU or a new CPU type. It's used by tooling
such as libvirt for capabilities probing.

Well, in our case it can't be an alias because we don't have any CPU type
that enables all extensions. Which brings me to my first question:
what's the criteria for marking a certain extension default true/false
in rv32/rv64/rv128?

E.g. this is the riscv,isa DT for rv64:

rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu

It has a lot of extensions but it's missing some common ones like svinval
and smstateen.

We can add/remove some extensions from these generic CPUs, document it
and be done with it. I want to propose a different design though:

1 - introduce the 'max' CPU. I guess we'll need some prep work in how
the extensions are being declared/stored in the code. I'll work on
it;

2 - introduce rva23U64/rva23S64. I would like to add a new 'profile' option
for generic CPUs, with '-cpu rv64,profile=rva23U64' enabling a whole set
of extensions. We would also support enabling optional profile extensions.
Yes, we don't have all the profile extensions available yet (neither does
the kernel AFAIK) but nothing is stopping us from adding the base
framework;

3 - reduce the generic CPUs up to the minimum required to boot Linux.
Yes, a rather arbitrary criteria, but Linux is the most common OS used
by RISC-V QEMU currently so we'll go with what most people are using.
This would reduce rv64 to "rv64ima".

The end result is that we would have a max extensions CPU, a barebones
generic CPU that can be fully customizable from the ground up, and
a profile option to allow users to boost the generic CPUs with a
set of extensions. We will avoid having to deal with generic CPUs having
an (apparently) arbitrary set of extensions.

I don't think we'll have too much opposition on adding (1) so I'll get
on it. I really would like to hear about (2) and (3). (3) will break
users that are using rv64 while counting with that whole set of extensions
that are being enabled by default, but this is why we're going to add
(2) first.


Please comment. Andrea, feel free to give us libvirt/tooling insights.


Thanks,

Daniel


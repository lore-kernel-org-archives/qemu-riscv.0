Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67248EE49B7
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 01:43:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qgEts-00030T-RI; Tue, 12 Sep 2023 21:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1qgEtr-0002zw-Ec; Tue, 12 Sep 2023 21:42:39 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1qgEto-0002CZ-U6; Tue, 12 Sep 2023 21:42:39 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-57325fcd970so3838051eaf.1; 
 Tue, 12 Sep 2023 18:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694569354; x=1695174154; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3OV3ljy3Dfe7rM91Y14NXk/4uXURYNKrf4mdtUQyJDs=;
 b=ZNze0g4yUejgu9MWi69K0/F+zV1dfUjLq/F8Bk4rn7BwuE62t3fW99VozOSwISrj8v
 pc3SaQ8md7VRptMGfq+MDOiBaMzFEp8hthtSkHxjsfj1UO/8q0wxyVK/DURbJG4d59aC
 7ajOTSdEMpxsr7vHPtRW5p8zyQ8pEiDqP42bREvlUzulT2Is3WfynSrhog05J8vHT95w
 f8lPr8y4wfVTq9TTkTTnXHN+w+Xy21lDWrVNxfON83BSmpyxplJKyBCMbPCylqxKp7C1
 3M0jDRkou7YU63PJDp0395P79N4sBJV6OQSwl+gbNgStlECqZK+nSUKBvBsHcAu7/36/
 aTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694569354; x=1695174154;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3OV3ljy3Dfe7rM91Y14NXk/4uXURYNKrf4mdtUQyJDs=;
 b=O+JwfRkTZs8SDablTO2r0SBN5d1Dzle53FBAVTA0OwW8KsgHc09JggmXI91aB7dR1V
 cK9jXJPUUWFmdNcZdSG3YhWvuyupZcLV1UzT1FNKrTzFp97bUT/iC0ea6X9OcY3SNNyp
 Q4uj7WASXO5WN2W3Gra7OBcTMzWCs900N8Eoj4fVQxXOIgYlweGmJViOOa/FePj5804+
 l7qR/yP0A/Qrokutlx4IENDfHQNDcRNwC4J87pKQFCjzdJnKcZSaLAGx7dpZfq5Vonqo
 AaMMgUvzb1/wsBizrcSUkiLVqT3tvNHcZIe2fvrYeBKAgRXVTJbfcJDPmn7CqHbfZOKx
 B84w==
X-Gm-Message-State: AOJu0Yx4z2hgtmLa1iLGxoZYls83rh7tFF6F17K0GQHvT7d9dsnoLYvb
 QLMkuka6CU2yMdGFcDQgnZQ=
X-Google-Smtp-Source: AGHT+IFC7WUD8HWNWSE5y4kS8jey0woQOu0bbfuIRpZSdxEWZkx0I4T4RB0vSXhbdqXFTM0lH0jd2Q==
X-Received: by 2002:a05:6870:f297:b0:1bf:61e3:df1 with SMTP id
 u23-20020a056870f29700b001bf61e30df1mr1328726oap.50.1694569353774; 
 Tue, 12 Sep 2023 18:42:33 -0700 (PDT)
Received: from [30.221.106.200] ([47.246.101.56])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a633853000000b0057408a9b3a8sm2179025pgn.42.2023.09.12.18.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 18:42:33 -0700 (PDT)
Message-ID: <15820654-5d7f-fd66-3d34-da1a55d2a53e@gmail.com>
Date: Wed, 13 Sep 2023 09:41:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: qemu-riscv32 usermode still broken?
To: "Andreas K. Huettel" <dilfridge@gentoo.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <10817413.NyiUUSuA9g@pinacolada>
Content-Language: en-US
From: LIU Zhiwei <baxiantai@gmail.com>
In-Reply-To: <10817413.NyiUUSuA9g@pinacolada>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=baxiantai@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


On 2023/9/13 6:31, Andreas K. Huettel wrote:
> Dear all,
>
> I've once more tried to build up a riscv32 linux install in a qemu-riscv32
> usermode systemd-nspawn, and am running into the same problems as some time
> ago...
>
> https://dev.gentoo.org/~dilfridge/riscv32/riscv32.tar.xz   (220M)
>
> The problems manifest themselves mostly in bash; if I replace /bin/bash
> with a static x86-64 binary (in the tarball as /bin/bash.amd64), bypassing
> qemu, I can make the chroot rebuild itself completely.
>
> https://lists.gnu.org/archive/html/bug-bash/2023-09/msg00119.html
> ^ Here I'm trying to find out more.
>
> Bash tests apparently indicate that argv[0] is overwritten, and that
> reading through a pipe or from /dev/tty fails or loses data.
>
> Apart from the bash testsuite failing, symptoms are as follows:
>
> * Something seems wrong in the signal handling (?):

If it is wrong for signal handling and for 32-bit, I guess it may be 
fixed by this patch

https://www.mail-archive.com/qemu-devel@nongnu.org/msg981238.html

And this patch has been merged into master branch yesterday.


May be you can have a try based on the master branch.

Thanks,
Zhiwei

> --- our package manager (bash/python combo, there bash) hangs reproducibly at
> one point.
> --- when I run a console program and try to background it with ctl-z, it hangs
>      (only the first time per bash instance, it seems)
>      repeated ctl-c gets me back to the shell, then the program is in the
> background
>
> riscv32 ~ # python
> Python 3.11.5 (main, Aug 31 2023, 21:56:30) [GCC 13.2.1 20230826] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> [1]+  Stopped                 python
> ^C^C^C^C^C^C^C
> riscv32 ~ # ^C
> riscv32 ~ #
> riscv32 ~ # jobs
> [1]+  Stopped                 python
> riscv32 ~ # fg
> python
>
>
> --- make, when building something, seems to always start only one job in
> parallel
>
> Any advice or debugging would be appreciated.
>
> If we get this running then I can set up regular riscv32 Gentoo stage builds
> within a week. [*]
>
> Thanks in advance,
> Andreas
>
> PS.
> huettel@pinacolada ~ $ /var/lib/machines/riscv32/usr/bin/qemu-riscv32 -version
> qemu-riscv32 version 8.1.0
> Copyright (c) 2003-2023 Fabrice Bellard and the QEMU Project developers
>
>
> [*] https://www.gentoo.org/downloads/#riscv
>


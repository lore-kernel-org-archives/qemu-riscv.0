Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2081EB64DD
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 12:11:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGIOQ-0004z1-Q7; Mon, 03 Jul 2023 08:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qGIOG-0004tj-4x
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 08:10:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qGIO6-0005qS-Hm
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 08:10:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbc244d307so50726035e9.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 05:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688386235; x=1690978235;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjWCszWfe513WyppL7zb8v0IrQpKTYicUil+LiuuY8Y=;
 b=ViRsOoFRUTNO6xLoiFX5S/O/9DgAsXB67SDztdnICiLhIJqhkYA7x6ekwJ2E7YwgRY
 d/ePNsfqGJjQ8mUyt95187wNCSnzu5wJZoe2fm/zOsGqxm4N1tEy4cKMkoexW5EnlsKS
 tniLf0UI2ktzd+A4G8xSX2I77BZ8cxkKD6QjhZW0T563yQ2UoNGb2/kPE0tvC3dWpbTF
 HGIEbGWFYRaue9fbizMiVJScC1du0ikqJEO8haxrliT27ydL2+0izHVoSa0C2efcBsGg
 6doltvUrrwiXWOMsbCBucLucBaPqwLUgRttq+3cZg0JOm0o/e05Q3ZGtsfm8fchXmHwY
 9Xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688386235; x=1690978235;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TjWCszWfe513WyppL7zb8v0IrQpKTYicUil+LiuuY8Y=;
 b=GGio8DABqVID/XxiJyKzxFPBVYWS2/HkNWKGV6MxNaxhOOYr113jOU3p6TEheFCDqu
 cdd04zm4/q9djeCfB6w6vAfYZS4h++RWv+f2EvORRWv/kVojmVvS9deEt5EF2aS7KjfX
 fyCReNRqBRLOCu+NRYKtmgFif6Bbs17JJO9TL2KIFKAJhkTctOZe5yQgbvf7gEW/gz8X
 HM1pe8JUR6NnaUupg/O7dvPF6IYHSuYjb8WMnsKZPEc2WFnGiHkyFEpy31XOuNik0f6g
 f/GMoYrQXjsi0Ce9Do5MVmyCEhL29XC7uU21giuos9JgazyNwm+m+MO/1XPedebp+1Yt
 jp9Q==
X-Gm-Message-State: ABy/qLZFJBvXhhYaGfpNQjPI6TAgohdNlmuJhuB6rKQgYFtnJz3RW8VW
 AaZC7li+8R6xAWTR8Pjgf/TudQ==
X-Google-Smtp-Source: APBJJlFgr8E5OQdvQ1x3BVq1eyBkbBeFEIhnza0ilSScB6OdIdLwjRimA2eIhomIfyOU+3dFcR9o7Q==
X-Received: by 2002:a7b:c446:0:b0:3fb:cf8e:c934 with SMTP id
 l6-20020a7bc446000000b003fbcf8ec934mr6775612wmi.27.1688386234620; 
 Mon, 03 Jul 2023 05:10:34 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adff443000000b00314367cf43asm3032754wrp.106.2023.07.03.05.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 05:10:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3D751FFBB;
 Mon,  3 Jul 2023 13:10:33 +0100 (BST)
References: <mvmmt0dtosg.fsf@suse.de> <mvma5wdtdiw.fsf@suse.de>
User-agent: mu4e 1.11.8; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andreas Schwab <schwab@suse.de>
Cc: Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RISC-V] ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp:
 assertion failed: (cpu == current_cpu)
Date: Mon, 03 Jul 2023 13:08:02 +0100
In-reply-to: <mvma5wdtdiw.fsf@suse.de>
Message-ID: <87h6qli4au.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Andreas Schwab <schwab@suse.de> writes:

> On Jul 03 2023, Andreas Schwab wrote:
>
>> This is a regression in 8.0.  It causes the testsuite of mold to fail:
>>
>> https://build.opensuse.org/package/live_build_log/openSUSE:Factory:RISCV=
/mold/standard/riscv64
>>
>> + out/test/elf/riscv64/section-start/exe2
>> **
>> ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion failed: (c=
pu =3D=3D current_cpu)
>> **
>> ERROR:../accel/tcg/cpu-exec.c:1028:cpu_exec_setjmp: assertion failed: (c=
pu =3D=3D current_cpu)
>
> This bisects down to commit 86f04735ac ("linux-user: Fix brk() to
> release pages").  See the attached test case.
>
> $ ./qemu-riscv64 ../exe1
> **
> ERROR:../qemu/accel/tcg/cpu-exec.c:1027:cpu_exec_setjmp: assertion failed=
: (cpu =3D=3D current_cpu)
> Bail out! ERROR:../qemu/accel/tcg/cpu-exec.c:1027:cpu_exec_setjmp: assert=
ion failed: (cpu =3D=3D current_cpu)
> **
> ERROR:../qemu/accel/tcg/cpu-exec.c:1027:cpu_exec_setjmp: assertion failed=
: (cpu =3D=3D current_cpu)
> Bail out! ERROR:../qemu/accel/tcg/cpu-exec.c:1027:cpu_exec_setjmp: assert=
ion failed: (cpu =3D=3D current_cpu)

I wonder if applying c5ffd16ba4c8fd fixes this?

I tried to double check with the test case but I can't run it as it's a
dynamic binary so needs an ld.so.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


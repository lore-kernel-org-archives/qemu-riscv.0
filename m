Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A6CC83F1B
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 16:03:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZtkU-0004hg-48; Thu, 10 Jul 2025 12:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZtZ2-0001Iv-9s
 for qemu-riscv@nongnu.org; Thu, 10 Jul 2025 11:52:04 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZtYy-0001cV-GH
 for qemu-riscv@nongnu.org; Thu, 10 Jul 2025 11:51:59 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b391d6780d2so877335a12.1
 for <qemu-riscv@nongnu.org>; Thu, 10 Jul 2025 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752162715; x=1752767515; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cx0adoOA8S0+udYRdUtLCKMOxl8ycJQfFtUzJnp8YfY=;
 b=HEJczCakkFrDYZiBe+wSVkxBSYtFutApuXC9kyW/+I6nAPeIebldVgN0bdXmdO+aL1
 /HsgCn5vK44jknggDUJ9cT7TGD9PVQRIKZAicaXENzrqRDztHAwXVGWKGpRtGHtJWEZj
 s5/niuHLxE0kzbSokYZ/Kq4W74pg4hpjFWz52z1Z3HIGJEIqM7fB8FgpOarm+bbaCTVv
 00pqKyeaOPgl+atGl1fJVtJY8yvAaP4YXSgX+IlNaLQd/3utdOrnBbpgLjjGb593KMpE
 +ftmtuYgkXoELZKCtLQDnzILL+T/D/KqBEa7vMrRjkaRLNHHVos0BJmGHuZNqXLxu1OE
 Botg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752162715; x=1752767515;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cx0adoOA8S0+udYRdUtLCKMOxl8ycJQfFtUzJnp8YfY=;
 b=ngC62EEevrHHRBNJH0pF2qvSsJlmFKTWRnnBu6GKds9DZ/5DXH+Sgmkm8mY199mLuD
 batmsrL1uy4GrtOl/AdeJYqX0xLSzVnGy1TS7WIZ7Pok7PRrbA5vS2sO5KpRP5osdFHP
 kBbslnivXgnTsTCyBuYH1QLPOjWvSdWgXGtGBRQEDIvhfTkYmS86zwu27syROHPVTuw6
 UXmOCjrOSyPQaNpmYD+guq4VXEG2o2vndVthBKjiPR6OGFuY/C1BLcDjmv+kEj8SdOVK
 e2BjiFGdVOZszKgkHPHjMjDTGH4FGhnYlqAdDP3CTJ770XGhRWwKHG+3V9iTledOFHCU
 1gVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgv7vZ2MnSNNds9ZQrE+DLmirg+Lw0QXMV5fj7t+/0QJz/vObcDxzIe6S2VlnxgxkgxLReUdXuSdDP@nongnu.org
X-Gm-Message-State: AOJu0YwW7KwyQqvsOVFpxRBEPKF+3ky7PegXcyCevLUzEw9KOfr63EOY
 z5uiuh5AsPkmIPtWxPiOgjgUbh1l+K4Ot8yNLVCG4pqXJu6EdnNW1oqdIuAUZrSSvxE=
X-Gm-Gg: ASbGncs25xKF8bx8TB+e8nf1cuIlnAnCHQEes2AnEen23qLdUR/tBwouHJUuRu/JPv3
 YyyGzfadSkCuW2oTcaWRB8skQAsqN9I5j3XmNSjH7P/G9HKNz0K9fQhsvHaOLfP1XI8iLB3rvbw
 FClK7JxawN2bdgOJw78ntcLGba9bMAy2E/Jo/By+vjwJbjX6TndFVLlmjw9QC/+xFRi4tuwbtFM
 iSx8RIQ6z9m3B7GpqE7Us2jnDWMtp+1EchtdrIX25pWUHBlmhkDTvAxPSrBX3bSuCVzmjGnPpFR
 eJgippJnCphlVO1B8LeL5or8fl81ZjxmrnmsvYS8aaVacK4CffRF3IHBEROjLAW/brkM1FQSCkc
 =
X-Google-Smtp-Source: AGHT+IE5lDrdF/uv9cFbJ6ck/iI2yiXEZOwOjA7BFlDqLJZS50Kv/p5UQz2NeetzJdZ8LYZqT9F9jg==
X-Received: by 2002:a17:90b:57ef:b0:31c:15d9:8aa with SMTP id
 98e67ed59e1d1-31c3c30cf27mr5886169a91.34.1752162713076; 
 Thu, 10 Jul 2025 08:51:53 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de435b76dsm23049375ad.221.2025.07.10.08.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 08:51:52 -0700 (PDT)
Message-ID: <643f1db1-4a7a-4bc0-a187-9ff1561f8a3d@linaro.org>
Date: Thu, 10 Jul 2025 08:51:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] tests/functional: Move tests into architecture
 specific folders
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250710094251.139514-1-thuth@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250710094251.139514-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/10/25 2:42 AM, Thomas Huth wrote:
> This patch tackles two issues. First, the tests/functional folder has
> become quite crowded already, some restructuring would be helpful here.
> Second, we currently encode the target architecture twice in the test
> names since a lot of the test file names contain the target, too.
> This contributes to the very long output lines when running "make
> check-functional".
>

I agree with the "crowded" aspect of functional tests, and subfolders 
are definitely welcome.

Concerning the long line, it seems that setup ("thorough" in this 
example) is repeated 3 times on it, which is a bigger issue than having 
arch name being repeated.

A simpler solution for the "long line" issue would be to change 
mtest2make.py to generate shorter test target names. This would not 
benefit for using meson test directly, but from what I understood, this 
is not recommended nor supported anyway.

> So let's move the individual test files to target specific folders now.
> Then we can drop the target from the file name (and thus from the test
> name).
> 
> Before the change, the output looked like this:
> 
>   ...
>   195/236 qemu:func-thorough+func-microblazeel-thorough+thorough / func-microblazeel-microblazeel_s3adsp1800          OK                2.00s   2 subtests passed
>   196/236 qemu:func-thorough+func-microblaze-thorough+thorough / func-microblaze-microblaze_replay                    OK                2.78s   1 subtests passed
>   197/236 qemu:func-thorough+func-microblaze-thorough+thorough / func-microblaze-microblaze_s3adsp1800                OK                2.02s   2 subtests passed
>   198/236 qemu:func-thorough+func-mips64el-thorough+thorough / func-mips64el-mips64el_fuloong2e                       OK                1.95s   1 subtests passed
>   199/236 qemu:func-thorough+func-mips64el-thorough+thorough / func-mips64el-mips64el_loongson3v                      SKIP              0.07s   0 subtests passed
>   200/236 qemu:func-thorough+func-mips64el-thorough+thorough / func-mips64el-mips64el_tuxrun                          OK                8.52s   1 subtests passed
>   ...
> 
> After this change, it gets a little bit shorter:
> 
>   ...
>   195/236 qemu:func-thorough+func-microblazeel-thorough+thorough / func-microblazeel-s3adsp1800          OK                2.12s   2 subtests passed
>   196/236 qemu:func-thorough+func-microblaze-thorough+thorough / func-microblaze-replay                  OK                2.90s   1 subtests passed
>   197/236 qemu:func-thorough+func-microblaze-thorough+thorough / func-microblaze-s3adsp1800              OK                2.07s   2 subtests passed
>   198/236 qemu:func-thorough+func-mips64el-thorough+thorough / func-mips64el-fuloong2e                   OK                2.05s   1 subtests passed
>   199/236 qemu:func-thorough+func-mips64el-thorough+thorough / func-mips64el-loongson3v                  SKIP              0.07s   0 subtests passed
>   200/236 qemu:func-thorough+func-mips64el-thorough+thorough / func-mips64el-tuxrun                      OK                8.84s   1 subtests passed
>   ...
> 
> Tests that can be used for multiple but not all targets (like the "migration"
> test) are now handled via symlinks in the target folders.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Note: Marked as RFC since I'm not that happy about the symlinks yet ...
>         if someone has a better idea, please let me know!

Same as Manos, correctly extracting common code looks better than 
finding a workaround with symlinks to satisfy import rules.

>         Also the update to the MAINTAINERS file is still missing - I'll add
>         that once we agreed on whether this patch is a good idea or not.
>

Thanks,
Pierrick


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9886DCDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 01:15:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qujWm-00019e-PT; Sun, 22 Oct 2023 21:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujWj-000193-SS; Sun, 22 Oct 2023 21:14:41 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujWi-0007f0-8h; Sun, 22 Oct 2023 21:14:41 -0400
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7b08ac3ce7fso986800241.2; 
 Sun, 22 Oct 2023 18:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698023679; x=1698628479; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyOvq3R6zaaHrVmGduFegUPGWirCQI7/9i+YGn8i02I=;
 b=eppSLzgxNGtVoVg9r6vh6dw3XykXkhzVROFhjsyRlD0HjHQv61YJCg+vEOenmRLfz0
 rVOYRJpJiu4sU35uGlghiAiv6zBXZ1s7RehVqPQlpWVRCCOWYhVJhxvddmd9dm4M36Vs
 blXjGuk7BC61H1U4DjHh9SjIzCBok94M29XByLsQ0uHax/e+6Dq2IHxLs85OyEJKBluF
 BB1HSqSc5C9Y27O+zI3JfvcTsyBHWWuyTA8vj8ZhHtfwYB9OaGeRmWtC1n71kz/EHWDo
 makXVo6dwnxh0hUxm99u33LSGPtiVA5SVpwXgl+lKHOLVBR6r6a705gfbbMuz6C5utRb
 n9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698023679; x=1698628479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nyOvq3R6zaaHrVmGduFegUPGWirCQI7/9i+YGn8i02I=;
 b=vDVN/8CRadKXrVHbn6SkTr9yuk63oqEYo7aqg1/3vKQhZKTuH/mP4RyIr/rNZBS3dt
 gPwzSA4LqrisXxjO9zpZcj1Tt5rftzVf+oHo2mWJNjdFein2zHQEtUexKOzBwTtujucO
 Owy0cDscWegiDMpcRhU+1rZQVpNwUo9mH5ol8cpmyqjxpiTSnYEE5YFlFyckISPygpWK
 2YZMNcW6uaeWwNao+u4n5Lw+lsOxkXfSKzUC1/oWUgkwikIY0AvfKJDfoiXTygdb0ubt
 X7GRo8xUatHBYnTf1qROaG6tplB3stObv1Lm0qpIejkv6LIcuvS7C/mdXE/1HmmTRHYv
 1n+A==
X-Gm-Message-State: AOJu0Yx0tcT8UaSXL/igS/9w5s8hwLqg+qduc5oH/C1M0VRSjMtl3mZP
 IwxKfZfS0y7CuMTo46q+r/utK3ZfcFJp9RoTAXg=
X-Google-Smtp-Source: AGHT+IHxt61a84uZJO76yUP+bk0uCMwMFsQAl8Xki1aZTTCl/xN1N1CQTBXCImtW620nYT964HUGgIjcbmw9k/AE2FU=
X-Received: by 2002:a67:ca0e:0:b0:457:c7ed:e9a2 with SMTP id
 z14-20020a67ca0e000000b00457c7ede9a2mr6844093vsk.10.1698023678992; Sun, 22
 Oct 2023 18:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231020074501.283063-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231020074501.283063-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 11:14:12 +1000
Message-ID: <CAKmqyKNdRzBg_Y=K1AKyo3JnVhN2n_XEF4hu6GD8pC+9-QeKqw@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: change default cpu to 'max'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Oct 20, 2023 at 5:46=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Commit f57d5f8004 deprecated the 'any' CPU type but failed to change the
> default CPU for linux-user. The result is that all linux-users
> invocations that doesn't specify a different CPU started to show a
> deprecation warning:
>
> $ ./build/qemu-riscv64  ./foo-novect.out
> qemu-riscv64: warning: The 'any' CPU is deprecated and will be removed in=
 the future.
>
> Change the default CPU for RISC-V linux-user from 'any' to 'max'.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Fixes: f57d5f8004 ("target/riscv: deprecate the 'any' CPU type")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  linux-user/riscv/target_elf.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/linux-user/riscv/target_elf.h b/linux-user/riscv/target_elf.=
h
> index 9dd65652ee..dedd5956f3 100644
> --- a/linux-user/riscv/target_elf.h
> +++ b/linux-user/riscv/target_elf.h
> @@ -9,7 +9,6 @@
>  #define RISCV_TARGET_ELF_H
>  static inline const char *cpu_get_model(uint32_t eflags)
>  {
> -    /* TYPE_RISCV_CPU_ANY */
> -    return "any";
> +    return "max";
>  }
>  #endif
> --
> 2.41.0
>
>


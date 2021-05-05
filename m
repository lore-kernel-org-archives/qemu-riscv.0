Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leQW0-0006nT-8T
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 19:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leQVv-0006ld-UU; Wed, 05 May 2021 19:01:09 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:35655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leQVr-0003C2-K0; Wed, 05 May 2021 19:01:07 -0400
Received: by mail-il1-x136.google.com with SMTP id r5so3161736ilb.2;
 Wed, 05 May 2021 16:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pYgsbYYED7AuWWBZ8UaQAOyV3xY5z1j0NbucdgGIkno=;
 b=QD49BZTjrcE8Y8onbOT92AttOiankN4q82XmSpslV+Gz+7+xwKldFfjX2QI4wZKnIo
 IQHaB7negPEcsnXfxVb7qLCKZ7CZbP1y9kFvtP3U78gN97W6H4fABiq9RH8zrm+pZVD5
 G+M+7YVcOmBZmTmWtWdAQHsEr7tw/xpO81rb+pE8cwABeB6U2fjFbFGpmzY/KGVnpPq+
 l3+o3ioF32ZNT7GWyTE/PfzPcQ+IiE4Vc4LesESPjCqvF9Q72Ep4AzBzkXUmrfC2nrpx
 h6iBQ8AQt282HaJFqD6PE0OuJhpTxAHRTL50eE+hQg7YSSIQ7tpZL9C0I+6iKeZipzL5
 ywPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pYgsbYYED7AuWWBZ8UaQAOyV3xY5z1j0NbucdgGIkno=;
 b=Qo2CrqesCRitJ1EU8CyOvoNU0+V7I6I9npC2ZqhfjhP/k9lJgJ1WiXGKYDl0U9I5TC
 V2BcppJS6epXvwpwbzmqnZniKw54MZkB6+do5Pf5sRn6qjGJUKk7nZerZn+pkcnulaza
 YTtkgRjXx7s0XlKkSoaDxbFxTv0TtawjJbigMfaSbjfS8PBew0JMrJIHrC0PQ+u3KEUP
 o4Dzq40SNTByxGqhLfxD3jTEyjfPBODQQvi/xq8wboAhsaRr4PdDkcbltGFjM6ztXFq+
 q1I42NVsOjzfJiKo4IccjckxugitluKrS1g5crWLcX3KkhIbx3JhYhrfC8EAj2nhROEc
 tpKw==
X-Gm-Message-State: AOAM5323QpA6Q71k9zgqffPAZR34+jkWAJQrYiwkHy7BCNJTbNA15ale
 /LjcGd0aKuPjjVXlGyCIR0/CRpCLKSFW43+At3E=
X-Google-Smtp-Source: ABdhPJyVSEDMeC8dfTEakPOoz4c1COWx/yWwrM84S5SE/MquzMJu1EQnxJWmoFAhOkuoCllR80kZvzhI10p/B0JAfzw=
X-Received: by 2002:a92:d383:: with SMTP id o3mr1171290ilo.131.1620255661910; 
 Wed, 05 May 2021 16:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210430070534.1487242-1-bmeng.cn@gmail.com>
In-Reply-To: <20210430070534.1487242-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 May 2021 09:00:35 +1000
Message-ID: <CAKmqyKP7Z-kh2OQQEaUO6dw=AcFYL=Vxt=M=U8TeTGT2PZWbQQ@mail.gmail.com>
Subject: Re: [PATCH] docs/system: riscv: Include shakti_c machine documentation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 May 2021 23:01:11 -0000

On Fri, Apr 30, 2021 at 5:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> shakti_c machine documentation was missed in the riscv target doc.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

In order to not break the doc build I squashed this commit into the
original one adding the documentation.

Alistair

> ---
>
>  docs/system/target-riscv.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
> index 8d5946fbbb..4b3c78382c 100644
> --- a/docs/system/target-riscv.rst
> +++ b/docs/system/target-riscv.rst
> @@ -67,6 +67,7 @@ undocumented; you can get a complete list by running
>     :maxdepth: 1
>
>     riscv/microchip-icicle-kit
> +   riscv/shakti-c
>     riscv/sifive_u
>
>  RISC-V CPU features
> --
> 2.25.1
>
>


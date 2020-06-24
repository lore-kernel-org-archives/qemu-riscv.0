Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1joB4J-0001ru-MC
	for mharc-qemu-riscv@gnu.org; Wed, 24 Jun 2020 15:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1joB4I-0001nj-2S; Wed, 24 Jun 2020 15:28:22 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:43843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1joB4G-0008VQ-H7; Wed, 24 Jun 2020 15:28:21 -0400
Received: by mail-io1-xd43.google.com with SMTP id k23so3443296iom.10;
 Wed, 24 Jun 2020 12:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tRrv+rACQSY60UF94VoDS2Yh/k0OjWOtOzFq/T7rIIU=;
 b=bc3ttPCZxPGYdo+tvV4KhIgyn7VBUu8azmOELN7fGHR9+o/mcLEPTOkvWuooa93PuU
 GjBZRVDlmSnQu0XKmV6FIyxJJNYfuOtXXtxCn6cLqf4yh8pwiYxMSW8FpII8Eaq5k50Y
 n/LfMqaq0J/MVy+IPkOwamh1rD3Jy4Egc0iK6EiXCSSo8de6YzlLvkY36f5WqzTWi6ui
 3N1E3+JgTS6fjq2jTtB3iNVP2XpCGY7DjwC5jdrbqxIhCMQf+kIX7AtlE8wnjCqyVDN+
 m6nogAklLHpWY+B5DaksVCMeNE4oTaEoCjdJUl/pAkPR1ytmX9f5zP/rcoNbQOGeb05P
 5rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRrv+rACQSY60UF94VoDS2Yh/k0OjWOtOzFq/T7rIIU=;
 b=rXhYAZXe/H88o7aTCMkfsoYhu8BacTAckG7VghEr4cnFrp95AZEuB9pD9Iz0kxm2vT
 HCZ5pFbqW5vxd99e/O5+ib3jfIjl9rC56BqRMcHIFYvGZyyEddTocd3axIuatx5GbaKt
 +tCtnBqNUtbftufatpfQ7Tx48IRanQdYR3Hoxx8qjeuUXKOpFUmj8A0CIb1FUs2j32cO
 CpNvBkbiZMjDvTc2XyBKSjKt5R7aWTOPlLHeSjvzi0M9AysfVboGSbwziHMCnZav5A+c
 /2+hBQwpm2DLRMrKrbJ6GudUfB9/OAmVNhaA9v5H81oRcUlPY8L6Lw4FCQIpaARgwrli
 CrKQ==
X-Gm-Message-State: AOAM532TxodA7Askyn9sNYiiH/cwnU6F1HVcWAeMbkfyE85+kdLPz9X6
 xfb5RLkwyCAIjO4ST8F+bjJyzNYL3M1Q3QuEN6I=
X-Google-Smtp-Source: ABdhPJyUbCN+YiIQPgdc4LsR4XFE/Ao7olpuMrnfEr1khSTub2vUckY6K/n+6PLEerg/HylUUuha1Q3MMahcZPq52mw=
X-Received: by 2002:a05:6638:dd3:: with SMTP id
 m19mr32152714jaj.106.1593026898748; 
 Wed, 24 Jun 2020 12:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <1592807604-20805-1-git-send-email-bmeng.cn@gmail.com>
 <1592807604-20805-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1592807604-20805-2-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 24 Jun 2020 12:18:44 -0700
Message-ID: <CAKmqyKMBWSDCiUwMcHQoBDetru9HSeHy1iMm-gzX5TqthFibRA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] configure: Create symbolic links for pc-bios/*.elf
 files
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 24 Jun 2020 19:28:22 -0000

On Sun, Jun 21, 2020 at 11:34 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Now we need to ship the OpenSBI fw_jump.elf image for the
> RISC-V Spike machine, it requires us to create symbolic
> links for pc-bios/*.elf files.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - new patch: configure: Create symbolic links for pc-bios/*.elf files
>
>  configure | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configure b/configure
> index ba88fd1..4a1514a 100755
> --- a/configure
> +++ b/configure
> @@ -8399,6 +8399,7 @@ LINKS="$LINKS tests/qemu-iotests/check"
>  LINKS="$LINKS python"
>  for bios_file in \
>      $source_path/pc-bios/*.bin \
> +    $source_path/pc-bios/*.elf \
>      $source_path/pc-bios/*.lid \
>      $source_path/pc-bios/*.rom \
>      $source_path/pc-bios/*.dtb \
> --
> 2.7.4
>
>


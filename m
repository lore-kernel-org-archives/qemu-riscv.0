Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwZW5-0006Hf-U0
	for mharc-qemu-riscv@gnu.org; Wed, 01 Jun 2022 21:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwZW3-0006Eh-91; Wed, 01 Jun 2022 21:20:47 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:46299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwZW1-0008Ee-NE; Wed, 01 Jun 2022 21:20:46 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-d39f741ba0so4929524fac.13; 
 Wed, 01 Jun 2022 18:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i3TMpZEbxJEl3uFyPAt0dddmnq2NkDIeQcoXFdHKxWY=;
 b=VXvfx3yhy/wJWCoFeVJStfoAy99pDpN+EB/hmfDZDVkjjD23PtHoQIfaAlxCVa06Re
 gdxLujQFvhuTi/nJUPiyr1Q/90A3KM8ufEOrABEH7Br54IMK1m36P3X5HObtU8jo4Vwd
 86Pmcfg3F6ams7EJHIzsJttJxEmvmaAvX+hmMybgxx30l7CCJVDMrY9KxoJxu1YaVtxD
 5MCvcVKWn0xmSLB/LJhk4A5RGHOp7OKhshZrPkkDfnkyQBfn7AqmNCGuj9itpruioo83
 vlGjgMA2jyWk7NrdmNTOx8kZ+R3x8yHDwyPjT4AxaL39wUlb5cno34JYDA2RDSpoPcqL
 bKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i3TMpZEbxJEl3uFyPAt0dddmnq2NkDIeQcoXFdHKxWY=;
 b=zZuSp0ENlfOFu+kr87wiOOu8MWhAojhxtHqiCW9VdC5tuo6jzO/u0WYDYyjHkcbiuh
 9wsZkMNrYG73YHnpP7JEFmTHjG/OVfeDpYD82HiLbw+RxC3mg3JFbNV3GlrtbBhBJ88F
 ZWeZwVM04gvJDF9reNXvpEZfZMcvy/SyiG9tSDUeZHA5uDIWAoDjGo0clxy+wwt9KDZn
 uYzKOuymPKjOVegweC5fo+b/7oJqI9iyVmx9SvoYBJQ+pWfeqUv4wa+hdxBZ5+yBYL97
 2NuPKqoXjkJDO86HzBe7ah0LKkeiNwTid1ocH5RbSmfM3QDcPXCvkF9RS7OJe6ZvcAhB
 V25w==
X-Gm-Message-State: AOAM533tbzos3ji9q6ThS+FDCA07ikEpTCysgDxtRv6YU1jfB8ltgkBj
 D4uQrgriq15Y55FKABPXE6T7Okik0jtFrIDrbgxvS8Sa6DoqLIUJGPA=
X-Google-Smtp-Source: ABdhPJyJ02F3Y24BTBt/+TX2qJXWWaCYxiZc87DDnnCKadtZh8Ohx5QgTI49h+AmKuXqTRs+eOrEHGTwPhio80x+AMk=
X-Received: by 2002:a05:6870:2047:b0:e9:1b34:fbe with SMTP id
 l7-20020a056870204700b000e91b340fbemr18681075oad.64.1654132844211; Wed, 01
 Jun 2022 18:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435208.git.research_trasio@irq.a4lg.com>
 <cover.1653472385.git.research_trasio@irq.a4lg.com>
 <33ae827a4f9e2c9b873b0c9d29f86d8a4572c4c4.1653472385.git.research_trasio@irq.a4lg.com>
In-Reply-To: <33ae827a4f9e2c9b873b0c9d29f86d8a4572c4c4.1653472385.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jun 2022 11:20:18 +1000
Message-ID: <CAKmqyKOPhTgDr8LPFL8+rtHjYbZhHgKpUAm5sSzREZkti4t2UQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/riscv: Deprecate capitalized property names
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 02 Jun 2022 01:20:47 -0000

On Wed, May 25, 2022 at 7:55 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> This commit adds a deprecation note of capitalized property names of
> RISC-V CPU to documentation.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>



> ---
>  docs/about/deprecated.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index a92ae0f162..cfc9adcd4b 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -300,6 +300,16 @@ Options are:
>  Device options
>  --------------
>
> +CPU options
> +'''''''''''
> +
> +Capitalized property names on RISC-V ``-cpu`` (since 7.1)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This should probably just be added under `linux-user mode CPUs` and
`System emulator CPUS` to avoid adding new sections

Alistair

> +
> +Using capitalized RISC-V CPU property names like ``-cpu rv64,Counters=on`` is
> +deprecated.  Use lowercase names instead (e.g. ``-cpu rv64,counters=on``).
> +
> +
>  Emulated device options
>  '''''''''''''''''''''''
>
> --
> 2.34.1
>

